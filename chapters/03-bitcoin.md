# A flag with 8 commits

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [A flag with 8 commits](03-bitcoin.html).*


Run `git shortlog` on the Bitcoin repository, grep for the name everyone is looking for, and the
answer is not one row. It is three.

```console
$ git shortlog -sne --all | grep -iE 'nakamoto|author='
   245	s_nakamoto <s_nakamoto@1a98c847-1fd6-4fd8-948a-caf3550aa51b>
    26	Satoshi Nakamoto <satoshin@gmx.com>
     8	--author=Satoshi Nakamoto <satoshin@gmx.com>
```

The first is the pseudonym as the version-control robot recorded it, an SVN UUID for an email. The
second is the pseudonym as a name. The third has eight commits, and it is not a person. It is a
command-line flag that a real, identifiable human typed by hand, sixteen years ago, and that `git`
has been faithfully attributing to a contributor ever since. [R1]

A man tried to do a respectful thing, made a shell-quoting mistake while doing it, and the mistake
became a permanent part of the identity of the project — checked in, hashed, and never removed.

## The handover

To read it you have to know where you are standing. `git clone https://github.com/bitcoin/bitcoin`
does not clone the repository Satoshi Nakamoto used. Bitcoin's first eight months lived in
Subversion on SourceForge; the git history everyone studies is a copy that was kept in parallel and
later became canonical. In mid-2010, the project is quietly changing hands. Satoshi is still here,
but a new name has arrived — and, in the way of these things, it arrives doing chores:

```console
$ git log --all --author='Gavin' --reverse --format='%h %aI %an %s' HEAD
8bd66202c3 2010-07-14T15:54:31+00:00 Gavin Andresen Fix CRLF
```

Gavin Andresen's first commit in this history is `Fix CRLF` — normalizing line endings so the new
git copy is usable. [R4] Not a design document, not a manifesto. Line endings. The man who will run
Bitcoin Core for the next half-decade enters as a janitor, which is how maintainers almost always
enter. Two weeks later he is applying Satoshi's patches, and that is where the flag comes from.

## The mistake

Here is what Gavin is trying to do, and it is the opposite of careless: preserve authorship. Satoshi
writes a patch on the SVN side; Gavin re-applies it to the git copy and wants the commit to still
say *Satoshi wrote this*, not *Gavin committed this*. Git has a switch for exactly that intention.
You run:

```
git commit --author="Satoshi Nakamoto <satoshin@gmx.com>"
```

and git records the author as Satoshi while recording you as the committer. It is the honest move.
What Gavin typed, though, put the literal text `--author=Satoshi Nakamoto <satoshin@gmx.com>` into
the *author field itself* — the `--author=` and all. Eight times, over five days at the end of July
2010:

```console
$ git log --all --author='--author' --format='%h %aI %an | committer=%cn | %s'
9f35575ca3 2010-07-27T14:21:02+00:00 --author=Satoshi Nakamoto | committer=Gavin Andresen | tcatm's cached SHA256 state idea, about 70% faster generating
...
e1cb7ce017 2010-07-31T14:14:41+00:00 --author=Satoshi Nakamoto | committer=Gavin Andresen | simplified makefile.unix, updated build-unix.txt instructions to include boost 1.37
```

Every one of them has Gavin as the committer and the flag-that-should-have-been-a-flag as the
author. [R2] You can watch the intention and the error in the same object:

```console
$ git show --format=fuller 9f35575ca3
Author:     --author=Satoshi Nakamoto <satoshin@gmx.com>
AuthorDate: Tue Jul 27 14:21:02 2010 +0000
Commit:     Gavin Andresen <gavinandresen@gmail.com>
```

The shell did what shells do. Somewhere a quoting boundary landed one character off — the `--author=`
was passed as *data* to be recorded rather than as an *instruction* to record something — and git,
which does not judge, wrote down what it was handed. [R5]

And the correct version is right here in the same history. The same patch, applied properly on the
SVN side the same day, authored cleanly by `s_nakamoto`:

```console
$ git show --format='%h %aI %an <%ae> %s' --stat 01bed1828b
01bed1828b 2010-07-30T23:22:55+00:00 s_nakamoto <...> simplified makefile.unix, updated build-unix.txt instructions to include boost 1.37
```

Same change, same day, done right. [R3] So the two branches of this project's early life disagree,
permanently, about who touched the makefile: on one line it is Satoshi, on the other it is a
misquoted flag. Both are checked in. Neither was ever rewritten.

## Why it is still there

You might expect someone to have fixed it. Sixteen years, thousands of contributors — surely you
clean up eight commits that attribute work to a shell flag. The deep fix is off the table: every
commit's hash is computed from its contents, and the author field is part of the contents. Rewrite
the author, and the hash changes; change the hash, and every descendant commit's hash changes; and
in a project where the entire security model rests on a chain of hashes that thousands of people
have independently copied, you do not rewrite the chain to fix a cosmetic typo.

But there is a shallow fix, and git ships it: a `.mailmap` file — one line in the repository that
tells `shortlog` and `blame` "when you see this string, display that name instead." No object
touched, no hash changed, five minutes of work. Bitcoin has no such file:

```console
$ git cat-file -e HEAD:.mailmap || echo 'no .mailmap at HEAD'
no .mailmap at HEAD
```

[R6] In sixteen years, nobody has even papered over the display. The flag is preserved at the deep
layer by immutability — and at the shallow layer, where it could be dressed in five minutes, by
indifference. Nobody minds enough. That is truer than "unfixable," and it is stranger.

~ The mistake is load-bearing now.

It is cheaper to leave `--author=Satoshi Nakamoto` standing as a contributor forever than to touch
the ledger it lives in — and apparently not worth one line to hide.

So it stands. The most famous absent author in software has, among his commits, eight that were
signed by a command-line argument, preserved by the same immutability that makes the project worth
studying.

## At home

The habit here is small and it will save you a real argument someday: `git commit --author=` does
not attach a label you can peel off later. It writes bytes into the object, the object's identity
is the hash of those bytes, and the hash is forever. A name in a git history is not metadata sitting
beside the work — it *is* the work, cryptographically. Which means authorship, in git, is
simultaneously the easiest thing in the world to fake (type any string you like into `--author`)
and the hardest thing in the world to fix (you cannot change it without changing everything
downstream). Both facts live in these eight commits.

So when you go to preserve someone's name on their work — the honest, generous thing Gavin was
doing — check what the shell actually handed to git before you commit. And when you find a strange
author in an old history, do not assume it is who it says it is, or even *what* it says it is.
Sometimes it is a person. Sometimes it is a flag.

## Receipts

- **R1** `git shortlog -sne --all | grep -iE 'nakamoto|author='` — three rows: `s_nakamoto` (245), `Satoshi Nakamoto` (26), and `--author=Satoshi Nakamoto` (8).
- **R2** `git log --all --author='--author' --format='%h %aI %an | committer=%cn | %s'` — the 8 commits, 2010-07-27 to 07-31, author = the literal flag, committer = Gavin Andresen.
- **R3** `git show --stat 01bed1828b` — the same makefile patch, authored cleanly by `s_nakamoto` on the SVN line.
- **R4** `git log --all --author='Gavin' --reverse` — Gavin's first commit, `8bd66202c3` "Fix CRLF", 2010-07-14.
- **R5** `git show --format=fuller 9f35575ca3` — one flagged commit in full: author the flag, committer Gavin, tree never rewritten.
- **R6** `git cat-file -e HEAD:.mailmap` — fails: no .mailmap exists at HEAD; the display was never even papered over.

*Full transcripts: `chapters/03-bitcoin.receipts.md` (regenerate with `scripts/receipts-03.sh`).*
