# Said public when I meant private

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [Said public when I meant private](21-iojs.html).*

Every repository you clone carries branches you never look at, and most of them are noise. But in
the official Node.js repository there is a remote branch called `archived-io.js-v0.10`, and it
holds sixteen commits reachable from nothing else — not from `main`, not from any other branch,
and not from a single one of the project's tags [R1, R11]. Sixteen commits stranded on a shelf.
The last of them, October 29th, 2014, by a developer named Mikeal Rogers, has this subject line
[R3]:

```console
$ git -C repos/node show -s --no-mailmap --format='%H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' e7dec60a63b9171465fd4037a04aeb709198aea2
e7dec60a63b9171465fd4037a04aeb709198aea2
parents 2c7847b3228b40aab8ea4902109639725eb0d8c3
Author: 2014-10-29T17:30:17-07:00 Mikeal Rogers <mikeal.rogers@gmail.com>
Committer: 2014-10-29T17:30:17-07:00 Mikeal Rogers <mikeal.rogers@gmail.com>

Said public when I meant private.
```

The change is one word, in a set of meeting minutes [R3]:

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
  * "four weeks" is up on November 8th
  * someone on the Advisory Board needs to remind Joyent of this in the
    next advisory board meeting so they aren't suprised by it even though
```

A typo fix. *Public* should have read *private*. It is the most mundane commit imaginable — and it
is also a confession, because the sentence being corrected is about a secret. In the autumn of
2014, the future of Node.js was being planned in a private repository, on a clock, by people
rehearsing a governance revolution. The stranded branch is the war room, accidentally preserved,
and the typo-fix is my favorite kind of receipt: nobody writing "Said public when I meant private"
thinks they are writing history.

One caution before we go in, and it applies to every line that follows: these minutes are the
organizers' record. Joyent — the company that stewarded Node at the time, whose repository URLs
are all over this branch [R2] — kept no diary on this shelf. What survives here is one side's
diagnosis, not the other side's answer.

## The rehearsal

On October 1st, 2014, the branch acquires its plan. Mikeal Rogers drafts "a new contribution
policy" — not for `joyent/node`, but for a repository called `node-forward/node` [R2]. The diff
rewrites the contributing guide's pointers away from Joyent's repository, and adds a section that
had never existed in Node before, titled **Governance** [R2]:

```console
$ git -C repos/node show --format='' --no-ext-diff f60abb0ced54f5ba08d324e62ad3fbb306ba37f7 -- CONTRIBUTING.md | sed -n '5,11p'
@@ -6,13 +6,13 @@ through the process.
 
 ### FORK
 
-Fork the project [on GitHub](https://github.com/joyent/node) and check out
+Fork the project [on GitHub](https://github.com/node-forward/node) and check out
 your copy.
```

The new text names a technical committee drawn from Node's active contributors, records that
invitations were also extended to two people "who have not accepted but are still invited to
participate" — one of them TJ Fontaine — and writes down one rule that tells you what wound the
document was built around: *"No more than 30% of the TC membership can be affiliated with the same
employer."* [R2]

Nobody writes that sentence in the abstract. It names employer concentration as the problem this
group chose to write down — which is their diagnosis, not a proven account of what Joyent was
doing.

## Four weeks

They committed their meeting minutes, which is why any of this is knowable. Here is the section
Mikeal's typo-fix was correcting, read whole from the corrected file [R3]:

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

Every line is load-bearing. The repository is private, but only "for four weeks," and the four
weeks are up on November 8th. Someone needs to *remind Joyent* — before the deadline, so the
company is not surprised. And the last worry is about wording: make clear this is a "soft" fork,
not a "hard" one. These are people deciding whether a pressure campaign has become a split, trying
to warn the other side before it goes public, and keeping minutes of it — committed like code,
because committing things like code was the only way they knew how to be.

## io.js

The soft fork went public with a new name. On December 1st, 2014, the README's first lines are
rewritten; the file that had opened with Node's one-line description, `Evented I/O for V8
javascript.`, now opens [R4]:

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

An origin story in the first sentence, and the manifesto in the second: *open governance model*,
the phrase the whole war was about. By January 8th the split reaches the deepest place a fork can
reach — the name of the executable [R5]:

```console
$ git -C repos/node show -s --no-mailmap --format='%aI %an <%ae>%n%s' f17f473af5e28f4ec00a518f97a84b69c426309e
2015-01-08T14:00:43+01:00 Ben Noordhuis <info@bnoordhuis.nl>
build: rename binary from node to iojs
```

The diff walks the build system from `'target_name': 'node'` to `'target_name': 'iojs'`, and the
installer from `bin/node` to `bin/iojs` [R5]. When a fork renames its binary, it has stopped being
a pressure campaign and become a product. And it shipped like one — the repository's own tags
record the pace [R12]:

```console
$ for t in v1.0.0 v2.0.0 v3.0.0 v3.3.0; do git -C repos/node for-each-ref --format='%(refname:short) %(taggerdate:iso8601-strict) %(taggername) | %(subject)' "refs/tags/$t"; done
v1.0.0 2015-01-20T12:39:09+11:00 Rod Vagg | 2015-01-14 io.js v1.0.0 Release
v2.0.0 2015-05-04T14:35:21-07:00 Rod Vagg | 2015-05-04 io.js v2.0.0 Release
v3.0.0 2015-08-04T14:23:10-07:00 Rod Vagg | 2015-08-04 io.js v3.0.0 Release
v3.3.0 2015-09-02T22:29:58+10:00 Rod Vagg | 2015-09-02 io.js v3.3.0 Release
```

Three major versions in eight months. Hold those numbers; they are about to matter more than
anything else in this chapter.

## The homecoming

Then the war ends the way the minutes always hoped it would. August 13th, 2015 [R6]:

```console
$ git -C repos/node show -s --no-mailmap --format='%aI %an <%ae>%n%s%n%n%b' a69ab27ab458385d24676792b75ad1c25b8c30e5 | sed -n '1,5p'
2015-08-13T12:14:34-04:00 cjihrig <cjihrig@gmail.com>
node: rename from io.js to node

This commit replaces instances of io.js with Node.js, based on the
recent convergence. There are some remaining instances of io.js,
```

*Based on the recent convergence* — five words for the settlement of the whole conflict. In June
2015 the two communities announced they would merge their codebases under a neutral body, the
Node.js Foundation, hosted by the Linux Foundation; stewardship of the Joyent repositories moved
there, and the combined release shipped that September.
<!-- VERIFIED: On 2015-06-16 the Node.js and io.js communities announced they would merge codebases under the Node.js Foundation, hosted by the Linux Foundation; ownership of the joyent/* repositories transferred to the Foundation; v4.0.0 (Sept 2015) combined both codebases. https://nodejs.org/en/blog/announcements/foundation-v4-announce and https://sdtimes.com/io-js/node-js-and-io-js-to-merge-under-node-js-foundation/ -->
The diff is January's rename played backwards — `'target_name': 'iojs'` becomes `'node'` again,
`bin/iojs` becomes `bin/node` — 96 files, 2,162 insertions, 2,187 deletions [R6].

Renaming the executable settled the product's name. The first reunified release is where you find
out what the *history* settled.

## The seam

That release was called Node.js **v4.0.0** — not 0.13, not 1.0. Its changelog opens [R10]:

```console
$ git -C repos/node show 'v4.0.0^{}:CHANGELOG.md' | sed -n '1,7p'
# Node.js ChangeLog

## 2015-09-08, Version 4.0.0 (Stable), @rvagg

### Notable changes

This list of changes is relative to the last io.js v3.x branch release, v3.3.0. Please see the list of notable changes in the v3.x, v2.x and v1.x releases for a more complete list of changes from 0.12.x. Note, that some changes in the v3.x series as well as major breaking changes in this release constitute changes required for full convergence of the Node.js and io.js projects.
```

The changelog declares its comparison baseline: this list is *relative to io.js v3.3.0*. The
published numbering keeps the fork's counting — v1, v2, v3, then Node v4. The rebels' release
record became the official one.

Now ask git the same question [R9]:

```console
$ git -C repos/node merge-base --is-ancestor 'v3.3.0^{}' 'v4.0.0^{}'; echo $?
1
$ git -C repos/node rev-list --left-right --count 'v3.3.0^{}...v4.0.0^{}'
151	209
```

io.js v3.3.0 is not an ancestor of Node v4.0.0. The two tagged commits sit on lines that had
already diverged — 151 commits on one side, 209 on the other, from a common base [R9]. The
connection was made with a document instead: Rod Vagg cherry-picked the io.js v3.3.0 changelog
entry onto the v4 line as its own commit — "cherry-picked from v3.x @ 1a6e52db30," says the
message — and *that* commit is an ancestor of v4.0.0, though the v3.3.0 tag is not [R7].

These are two layers answering different questions, and both answers are honest. The continuity
asserted *between these two releases* is editorial, not ancestral. That does not mean the projects
never merged during convergence; it means the v3.3.0 release commit is not in v4.0.0's parent
chain. This particular continuity was declared, not merged.

## What it cost

The bill for that seam is small, specific, and still sitting there. Node's public version numbers
start at 4 because someone else spent 1, 2, and 3 — the fork's counting is permanent. And the
v4.0.0 changelog enumerates its changes relative to a release it does not descend from, which is
a live hazard for exactly the two things engineers do with release history. Ask git for every
commit between the v3.3.0 tag and v4.0.0 and you get a 151-and-209-shaped answer, not a release
delta. Bisect across that boundary and you are walking a graph the changelog does not describe.
I have been burned by smaller seams than this one: the moment you trust a "relative to" line as
an ancestry claim, your tooling and your document disagree, and the document is the one that
sounds authoritative.

What the fork actually won is not in the diff at all — it is the governance model whose name is
in that December README, carried into a foundation the following summer. What the fork left in
the repository is a version number, a changelog baseline, and sixteen commits on a shelf.

## At home

Two habits, both cheap. First: your repository's remote branches are an archive of the arguments
the project survived. Run `git branch -r`, find the stranded ones, and ask what they hold that the
main line does not — `git rev-list --count <branch> --not origin/main` counts commits absent from
main (to prove a commit is reachable from *nothing* else, exclude every other ref and check `git
tag --contains` too). Then read them.

Second: when a project claims lineage — "version 4 continues version 3" — check whether the claim
is ancestral or editorial. `git merge-base --is-ancestor v3 v4; echo $?` answers in one character:
`0` means the graph agrees, `1` means the continuity lives in a document. Both kinds are
legitimate, and neither is a lie. But they are different claims, and the day you are bisecting
across the seam or trusting a changelog to enumerate every change, the difference becomes yours to
discover. The documents tell you the story the project agreed on. The graph tells you how the
commits relate. Read both, and mind the seam.

## Receipts

- **R1** `git -C repos/node branch -r --list '*archived-io.js*'` + `rev-list --count origin/archived-io.js-v0.10 --not origin/main` — the stale branch holds 16 commits absent from `main`.
- **R2** `git -C repos/node show ... f60abb0ced54... -- CONTRIBUTING.md` — 2014-10-01, Mikeal Rogers (committed by isaacs, `PR-URL: .../node-forward/node/pull/1`): the governance draft — TC roster, the 30%-same-employer rule, invitations extended and not accepted (incl. TJ Fontaine).
- **R3** `git -C repos/node show ... e7dec60a63b9...` — 2014-10-29, "Said public when I meant private.": one word, public→private, in `doc/tc-meetings/2014-10-29.md`; the minutes: private "for four weeks," up November 8th, remind Joyent, "'soft' fork and not a 'hard' fork."
- **R4** `git -C repos/node show ... 51514c8e8cbd... -- README.md` — 2014-12-01, Mikeal Rogers (committed by Fedor Indutny): README replaces `Evented I/O for V8 javascript.` with "io.js … began as a GitHub fork of joyent/node … open governance model."
- **R5** `git -C repos/node show ... f17f473af5e2...` — 2015-01-08, Ben Noordhuis, "build: rename binary from node to iojs": `target_name` and installed binary become `iojs`.
- **R6** `git -C repos/node show --shortstat ... a69ab27ab458...` — 2015-08-13, cjihrig, "node: rename from io.js to node … based on the recent convergence": 96 files, 2,162 insertions, 2,187 deletions; the installer's `iojs -> node` compatibility symlink block is unchanged context, already present from January.
- **R7** `git -C repos/node show -s ... 8a9a3bf798a3...` + `merge-base --is-ancestor` — Rod Vagg, "doc: update changelog for io.js v3.3.0," "cherry-picked from v3.x @ 1a6e52db30"; this changelog-import commit is an ancestor of v4.0.0 (the v3.3.0 *tag* is not).
- **R8** `for-each-ref` + `show -s` on `v3.3.0` and `v4.0.0` — both annotated tags by Rod Vagg, targets `1a6e52db...` and `f9f83788...`, with different parents.
- **R9** `merge-base --is-ancestor 'v3.3.0^{}' 'v4.0.0^{}'; echo $?` → `1` + `rev-list --left-right --count` → `151 209` — v3.3.0 is not an ancestor of v4.0.0; the lines diverge from base `a020d9a5...`.
- **R10** `git -C repos/node show 'v4.0.0^{}:CHANGELOG.md'` — "# Node.js ChangeLog … This list of changes is relative to the last io.js v3.x branch release, v3.3.0 … full convergence of the Node.js and io.js projects."
- **R11** `rev-list --count origin/archived-io.js-v0.10 --not $(every other ref)` → `16`; `git tag --contains e7dec60a...` → `0` — the sixteen commits are reachable from no other ref, branch or tag.
- **R12** `for-each-ref` on `v1.0.0`, `v2.0.0`, `v3.0.0`, `v3.3.0` — the io.js release line: v1.0.0 (2015-01-14), v2.0.0 (2015-05-04), v3.0.0 (2015-08-04), v3.3.0 (2015-09-02), all tagged by Rod Vagg.
