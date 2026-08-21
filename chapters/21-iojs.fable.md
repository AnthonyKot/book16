# Said public when I meant private

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [Said public when I meant private](21-iojs.html).*

Every repository you clone carries branches you never look at, and most of them are noise —
abandoned experiments, stale release lines. But in the official Node.js repository there is a
remote branch called `archived-io.js-v0.10`, and it holds sixteen commits that are reachable from
nowhere else in the project [R1]. Not from `main`, not from any release. Sixteen commits, stranded
on a shelf, and the last of them — October 29th, 2014, by a developer named Mikeal Rogers — has
this subject line [R3]:

```console
$ git -C repos/node show -s --no-mailmap --format='%H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' e7dec60a63b9171465fd4037a04aeb709198aea2
e7dec60a63b9171465fd4037a04aeb709198aea2
parents 2c7847b3228b40aab8ea4902109639725eb0d8c3
Author: 2014-10-29T17:30:17-07:00 Mikeal Rogers <mikeal.rogers@gmail.com>
Committer: 2014-10-29T17:30:17-07:00 Mikeal Rogers <mikeal.rogers@gmail.com>

Said public when I meant private.
```

The change itself is one word, in a set of meeting minutes [R3]:

```console
$ git -C repos/node show --format='' --no-ext-diff e7dec60a63b9171465fd4037a04aeb709198aea2 -- doc/tc-meetings/2014-10-29.md
diff --git a/doc/tc-meetings/2014-10-29.md b/doc/tc-meetings/2014-10-29.md
index 0fa77502743..ce64c62ddb0 100644
--- a/doc/tc-meetings/2014-10-29.md
+++ b/doc/tc-meetings/2014-10-29.md
@@ -13,7 +13,7 @@
 * Update on "release buckets"
  * doesn't make sense while we're private, we'll wait until it is public again
 * `node-forward/node` going public
- * when we made the repo public it was messaged as only being for "four weeks"
+ * when we made the repo private it was messaged as only being for "four weeks"
```

A typo fix. *Public* should have read *private*. It is the most mundane commit imaginable — and it
is also a confession, because the sentence being corrected is about a secret. In the autumn of
2014, the future of Node.js was being planned in a **private repository**, on a clock, by people
rehearsing a revolution. The stranded branch is the war room, accidentally preserved, and the
typo-fix is my favorite kind of receipt: nobody writing "Said public when I meant private" thinks
they are writing history. This chapter is that war, told entirely from what the ledger kept.

## The rehearsal

Node.js in 2014 was the most important young platform on the server, and it did not belong to its
contributors — the project was stewarded by a company, Joyent, and the frustration of the people
doing the daily work had been building for years. <!-- CHECK: Node.js was corporately stewarded by
Joyent in 2014; TJ Fontaine was Joyent's Node.js project lead at the time; community frustration
over release cadence and governance drove the fork; needs external source. --> You do not need the
press coverage, though, because the first commit on the stranded branch *is* the plan. October
1st, 2014: Mikeal Rogers drafts "a new contribution policy" — not for `joyent/node`, but for a
repository called `node-forward/node` [R2]. The diff methodically rewrites the contributing
guide's pointers away from `joyent/node` to `node-forward/node`, and then adds a whole section
that had never existed in Node before, titled **Governance** [R2]:

```console
$ git -C repos/node show --format='' --no-ext-diff f60abb0ced54f5ba08d324e62ad3fbb306ba37f7 -- CONTRIBUTING.md | sed -n '5,11p'
@@ -6,13 +6,13 @@ through the process.
 
 ### FORK
 
-Fork the project [on GitHub](https://github.com/joyent/node) and check out
+Fork the project [on GitHub](https://github.com/node-forward/node) and check out
 your copy.
```

The new governance text names a technical committee — Fedor Indutny, Trevor Norris, Ben
Noordhuis, Isaac Z. Schlueter, Nathan Rajlich, Bert Belder — the core of Node's actual working
contributors [R2]. It records, with careful diplomacy, that invitations were also extended to two
people "who have not accepted but are still invited to participate": one of them TJ Fontaine, the
man running the official project at Joyent [R2]. And it writes down one rule that tells you
exactly what wound this document was written around: *"No more than 30% of the TC membership can
be affiliated with the same employer."* [R2] Nobody writes that sentence in the abstract. You
write it about a specific employer.

So: a parallel repository, a constitution, a committee of the people with their hands on the
code, and an empty chair left for the official lead. That is not a fork yet. That is a rehearsal
for one.

## Four weeks

The minutes on the stranded branch — yes, they committed their meeting minutes, which is why any
of this is knowable — put a clock on it. Here is the section Mikeal's typo-fix was correcting,
read in full from the fixed file [R3]:

```console
$ git -C repos/node show e7dec60a63b9171465fd4037a04aeb709198aea2:doc/tc-meetings/2014-10-29.md | sed -n '13,24p'
* Update on "release buckets"
 * doesn't make sense while we're private, we'll wait until it is public again
* `node-forward/node` going public
 * when we made the repo private it was messaged as only being for "four weeks"
 * "four weeks" is up on November 8th
 * someone on the Advisory Board needs to remind Joyent of this in the
   next advisory board meeting so they aren't suprised by it even though
   it was communicated to them when it was first made public.
 * @mikeal will work on the messaging in the README to make it clear this is
   a "soft" fork and not a "hard" fork.
 * ramifications of going public will be discussed in next week's TC meeting as
   well
```

Read it slowly, because every line is load-bearing. The repo is private, but only "for four
weeks," and the four weeks are up on November 8th. Someone needs to *remind Joyent* — the company
that owns the project — so the company isn't surprised by its own community going public. And the
last worry is about *messaging*: make clear this is a "soft" fork, not a "hard" fork. They are
holding a loaded fork and drafting the press release that says it isn't one. There is no sneering
available here; read the room. These are people who built the platform, trying to change how it is
governed with the least possible violence, and keeping minutes of it — in the project's own file
format, committed like code, because committing things like code was the only way they knew how
to be.

## io.js

The soft fork went public with a new name. On December 1st, 2014, Mikeal rewrites the README's
first lines; the file that had opened with Node's original one-line description now opens [R4]:

```console
$ git -C repos/node show 51514c8e8cbd98be7f29c3f1508b625d16e91b5d:README.md | sed -n '1,9p'
io.js
===

This repository began as a GitHub fork of
[joyent/node](https://github.com/joyent/node) where contributions,
releases, and contributorship are under an
[open governance model](./CONTRIBUTING.md#governance).

We intend to release, with increasing regularity, releases which are
```

*This repository began as a GitHub fork of joyent/node.* An origin story in the first sentence,
and a manifesto in the second: *open governance model*, the phrase the whole war was about. Five
weeks later the split reaches the deepest place a fork can reach — the name of the executable
itself. January 8th, 2015, Ben Noordhuis, one of the TC names from the rehearsal [R5]:

```console
$ git -C repos/node show -s --no-mailmap --format='%aI %an <%ae>%n%s' f17f473af5e28f4ec00a518f97a84b69c426309e
2015-01-08T14:00:43+01:00 Ben Noordhuis <info@bnoordhuis.nl>
build: rename binary from node to iojs
```

The diff walks through the build system changing `'target_name': 'node'` to `'target_name':
'iojs'`, and the installer from `bin/node` to `bin/iojs` [R5]. When a fork renames its *binary*,
it has stopped being a pressure campaign and become a product. Through the spring of 2015, io.js
shipped that product on its own schedule, under its own version numbers — 1.x, 2.x, 3.x — while
official Node stood at 0.12. <!-- CHECK: io.js shipped independent releases v1.0.0 (Jan 2015)
through v3.3.0 (Sep 2015), on a rapid cadence, while joyent/node remained on 0.10/0.12; needs
external source for the release timeline. -->

## The homecoming

And then the war ends the way the minutes always hoped it would — softly. August 13th, 2015, a
commit by cjihrig [R6]:

```console
$ git -C repos/node show -s --no-mailmap --format='%aI %an <%ae>%n%s%n%n%b' a69ab27ab458385d24676792b75ad1c25b8c30e5 | sed -n '1,5p'
2015-08-13T12:14:34-04:00 cjihrig <cjihrig@gmail.com>
node: rename from io.js to node

This commit replaces instances of io.js with Node.js, based on the
recent convergence. There are some remaining instances of io.js,
```

"Based on the recent convergence" — four quiet words for the settlement of the whole conflict:
Joyent ceded the project to a neutral foundation with open governance, and the fork agreed to come
home. <!-- CHECK: the io.js/Node.js convergence of mid-2015 produced the Node.js Foundation, with
Joyent transferring stewardship and io.js merging back; needs external source. --> The diff is the
January rename played backwards — `'target_name': 'iojs'` becomes `'node'` again, `bin/iojs`
becomes `bin/node` — 96 files, 2,162 insertions, 2,187 deletions [R6]. The build system even
gains, in the same file, an `iojs -> node` compatibility symlink [R6]: the fork's name reduced, in
the end, to an alias for the thing it forked.

## The seam

So who won? Look at the first release of the reunified project, because the answer is written in
two places that disagree. The release was called Node.js **v4.0.0** — not 0.13, not 1.0. Its
changelog opens like this [R10]:

```console
$ git -C repos/node show 'v4.0.0^{}:CHANGELOG.md' | sed -n '1,7p'
# Node.js ChangeLog

## 2015-09-08, Version 4.0.0 (Stable), @rvagg

### Notable changes

This list of changes is relative to the last io.js v3.x branch release, v3.3.0. Please see the list of notable changes in the v3.x, v2.x and v1.x releases for a more complete list of changes from 0.12.x. Note, that some changes in the v3.x series as well as major breaking changes in this release constitute changes required for full convergence of the Node.js and io.js projects.
```

*Relative to the last io.js v3.x branch release.* The written record declares its parent: Node 4
is io.js 3.3, continued. Even the version number concedes it — 4 comes after 3 because io.js had
spent 1, 2, and 3. The rebels' release line became the official one, and the reunified project
counts from the fork's numbers to this day.

But now ask *git* the same question, and hold on [R9]:

```console
$ git -C repos/node merge-base --is-ancestor 'v3.3.0^{}' 'v4.0.0^{}'; echo $?
1
$ git -C repos/node rev-list --left-right --count 'v3.3.0^{}...v4.0.0^{}'
151	209
```

io.js v3.3.0 is *not* an ancestor of Node v4.0.0. The two tagged commits sit on lines that had
already diverged — 151 commits on one side, 209 on the other, from a common base [R9]. The v4
line did not grow out of the v3.3.0 release commit; it grew beside it, and the connection was
stitched with documents: Rod Vagg cherry-picked the io.js v3.3.0 changelog entry onto the v4
line as its own commit — "cherry-picked from v3.x @ 1a6e52db30," says the message [R7] — so that
the new project's release record would *read* as continuous even where the graph is not.

That seam is the true shape of the reunification, and it is the reveal I want you to carry out of
this chapter. The continuity of a project is a story told in its documents — its changelogs,
its version numbers, its READMEs — and the story can be true in every fact while the commit graph
underneath it says: here, two histories ran side by side, and were declared one. Declared, not
merged. The declaration held, which is why nobody has needed to look underneath it for a decade.

## What it cost, and what it left

The io.js war is the rare fork story with no body count: no code lost, no community split that
lasted longer than nine months, and the thing the rebels actually wanted — open governance, a
neutral foundation, releases on the contributors' cadence — became the permanent constitution of
one of the most-used platforms on earth. The evidence of the whole episode now lives in exactly
the artifacts this book is about. A version number that starts at 4 because someone else spent 1
through 3. A changelog whose continuity is editorial, not ancestral. A compatibility symlink
named after a project that no longer exists. And sixteen stranded commits on an archived branch,
where the revolution kept its minutes — including the one where a tired organizer, correcting a
single word, accidentally wrote the whole story's title: *said public when I meant private.*

## At home

Two habits, both cheap. First: your repository's remote branches are an archive of every argument
the project survived. Run `git branch -r`, find the ones that look stranded, and ask what they
hold that the main line doesn't: `git rev-list --count <branch> --not origin/main`, then read
those commits. A branch nobody merged and nobody deleted is usually a branch somebody couldn't
bring themselves to do either to — which makes it exactly where the interesting history lives.
Second: when a project claims lineage — "version 4 continues version 3" — check whether the claim
is ancestral or editorial: `git merge-base --is-ancestor v3 v4`. Both kinds of continuity are
legitimate. But they are different claims, and the day you are bisecting across the seam, or
trusting a changelog to enumerate every change, the difference is suddenly yours to discover. The
documents tell you the story the project agreed on. The graph tells you what happened. Read both,
and mind the seam.

## Receipts

- **R1** `git -C repos/node branch -r --list '*archived-io.js*'` + `rev-list --count origin/archived-io.js-v0.10 --not origin/main` — the stale branch holds 16 commits reachable from no other ref.
- **R2** `git -C repos/node show ... f60abb0ced54... -- CONTRIBUTING.md` — 2014-10-01, Mikeal Rogers (committed by isaacs, `PR-URL: .../node-forward/node/pull/1`): the governance draft — TC roster, the 30%-same-employer rule, the unaccepted invitations incl. TJ Fontaine.
- **R3** `git -C repos/node show ... e7dec60a63b9...` — 2014-10-29, "Said public when I meant private.": one word, public→private, in `doc/tc-meetings/2014-10-29.md`; the minutes: private "for four weeks," up November 8th, remind Joyent, "'soft' fork and not a 'hard' fork."
- **R4** `git -C repos/node show ... 51514c8e8cbd... -- README.md` — 2014-12-01, Mikeal Rogers (committed by Fedor Indutny): README becomes "io.js … This repository began as a GitHub fork of joyent/node … open governance model."
- **R5** `git -C repos/node show ... f17f473af5e2...` — 2015-01-08, Ben Noordhuis, "build: rename binary from node to iojs": `target_name` and installed binary change to `iojs`.
- **R6** `git -C repos/node show --shortstat ... a69ab27ab458...` — 2015-08-13, cjihrig, "node: rename from io.js to node … based on the recent convergence": 96 files, 2,162 insertions, 2,187 deletions; installer restores `bin/node` and adds the `iojs -> node` symlink.
- **R7** `git -C repos/node show -s ... 8a9a3bf798a3...` — Rod Vagg, "doc: update changelog for io.js v3.3.0," "cherry-picked from v3.x @ 1a6e52db30"; an ancestor of v4.0.0.
- **R8** `for-each-ref` + `show -s` on `v3.3.0` and `v4.0.0` — both annotated tags by Rod Vagg, targets `1a6e52db...` and `f9f83788...`.
- **R9** `merge-base --is-ancestor 'v3.3.0^{}' 'v4.0.0^{}'` (no) + `rev-list --left-right --count` — v3.3.0 is not an ancestor of v4.0.0; the lines diverge 151 vs 209 commits from base `a020d9a5...`.
- **R10** `git -C repos/node show 'v4.0.0^{}:CHANGELOG.md'` — "# Node.js ChangeLog … This list of changes is relative to the last io.js v3.x branch release, v3.3.0 … full convergence of the Node.js and io.js projects."
