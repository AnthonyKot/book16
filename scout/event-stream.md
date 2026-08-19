# Scout: event-stream (dominictarr/event-stream)

- **Repo:** https://github.com/dominictarr/event-stream
- **Clone:** `~/book16/repos/event-stream` (already present; not re-cloned). Working tree 160K; `.git` 404K; pack 214 KiB (`git count-objects -vH`: 1022 objects, 1 pack).
- **History span (HEAD / `master`):** 2011-08-20T11:38:02+10:00 → 2018-09-20T13:17:24+00:00
- **Commits:** 322 on `HEAD`; 322 `--all` (one branch, no leftover topic refs).
- **Authors (all refs):** Dominic Tarr 248, 北川 16, Raynos 6, then a long tail of one- and two-commit README/typo patches. Calendar 2018 is 16–0: every commit that year is 北川 `<right9ctrl@outlook.com>`.

The incident everyone names (September 2018, a stranger, `flatmap-stream`, Copay) is in this git, but only as a `require()` and a version bump. `git log -S copay`, `-S bitcoin`, `-S wallet`, `-S malicious` are empty. The payload never lived here. What git holds is a 329-day silence, sixteen UTC+0 commits that look like maintenance, a two-line re-export copied from 2012, a patch-version publish with no tag, and then a major bump that washes the dependency out of HEAD while leaving `3.3.6` for every caret range on npm.

---

## 1. Day one is `inital` and `readible`, version `0.0.0`

- **Find-type:** 3 (first commit)
- **Hash:** `970993ccc594c606d439a9fa22715d311e1b9fa2`
- **Date:** 2011-08-20T11:38:02+10:00 (author = committer)
- **Author:** Dominic Tarr `<dominic.tarr@gmail.com>`
- **Message:** `inital. first implementation of a map function (takes async callback function and turns it into readible & writable stream`
- **Command:**

```
git -C ~/book16/repos/event-stream log --reverse --format='%h %aI %an %s' | head -5
git -C ~/book16/repos/event-stream show --shortstat --format=fuller 970993ccc594c606d439a9fa22715d311e1b9fa2 | tail -8
```

```
970993c 2011-08-20T11:38:02+10:00 Dominic Tarr inital. first implementation of a map function (takes async callback function and turns it into readible & writable stream
c8f0d36 2011-08-21T14:10:12+10:00 Dominic Tarr initial
14bd77e 2011-08-21T14:15:28+10:00 Dominic Tarr fix
5774e31 2011-08-21T23:54:29+10:00 Dominic Tarr add to readme
2545dea 2011-08-22T15:25:11+10:00 Dominic Tarr implement reader, and fix bug with .end()

    inital. first implementation of a map function ...
 4 files changed, 103 insertions(+)
```

The tree is `.gitignore`, 68 lines of `exports.map`, `package.json` at `"version": "0.0.0"` with empty `dependencies`, and a 21-line manifesto that spells `fitler`. The code itself sets `stream.readible = true`. There is no import from another VCS, no 1970 stamp, no empty tree: Saturday morning, one function, two typos in the subject line.

- **Why it is a story:** The library that will later be a default dependency of the JavaScript world starts as a single `map` and a paragraph about arrays laid out in time. The manifesto already promises `filter` and `reduce`. Tomorrow those promises become comments. Seven years later a stranger will "finish" them.
- **What the reader learns:** `git log --reverse | head` on a tiny npm package is often the whole origin myth, typos included. Read the first `package.json`: empty deps, `0.0.0`, the author's name as a string that will never be updated.
- **Surprise:** 2

---

## 2. Four comments about `filter` / `reduce` outlive the manifesto, then become the cover story

- **Find-type:** 5 (comment that outlived its code)
- **Hashes:** `c8f0d36e69fd3ba0716693bcb0337a765d9f54a2` (comments land); `908fee5c65d4eb02809a84a1ebc3e5df1f935cd1` (filter is finally implemented, by 北川)
- **Dates:** 2011-08-21T14:10:12+10:00 / 2018-09-16T11:14:19+00:00
- **Authors:** Dominic Tarr; 北川
- **Messages:** `initial` / `add filter and rewrite flatmap`
- **Command:**

```
git -C ~/book16/repos/event-stream blame -L 1,6 index.js
git -C ~/book16/repos/event-stream log -S 'es.filter' --all --format='%h %aI %an %s'
git -C ~/book16/repos/event-stream show --stat c8f0d36e69fd3ba0716693bcb0337a765d9f54a2
```

```
c8f0d36e (Dominic Tarr 2011-08-21 14:10:12 +1000 1) //filter will reemit the data if cb(err,pass) pass is truthy
bd944da6 (Dominic Tarr 2012-08-07 16:47:35 +0200 2)
c8f0d36e (Dominic Tarr 2011-08-21 14:10:12 +1000 3) // reduce is more tricky
c8f0d36e (Dominic Tarr 2011-08-21 14:10:12 +1000 4) // maybe we want to group the reductions or emit progress updates occasionally
c8f0d36e (Dominic Tarr 2011-08-21 14:10:12 +1000 5) // the most basic reduce just emits one 'data' event after it has recieved 'end'

908fee5 2018-09-16T11:14:19+00:00 北川 add filter and rewrite flatmap
28e1472 2018-09-20T13:11:29+00:00 北川 add example for flatmap and filter

commit c8f0d36e69fd3ba0716693bcb0337a765d9f54a2
    initial
 index.js        |  5 +++++
 package.json    |  2 +-
 readme.markdown | 21 ---------------------
```

Day two deletes the entire manifesto (`fitler` and all) and replaces it with those four comments. `es.filter` / `es.reduce` are never implemented by Dominic. The first (and only) `es.filter*` in the log is 北川, 2,583 days later, in the same commit that stops `require('flatmap-stream')`.

- **Why it is a story:** Someone in 2011 writes the design down as comments because the code can wait. Someone in 2018 reads the file, sees unfinished array-functions, and ships `filterSync` and a local `flatmapSync` as if completing the original sketch. From inside the diff it is the nicest possible patch. The comments are still line 1 of `index.js` on HEAD.
- **What the reader learns:** `git blame` the comments at the top of a file that has been "done" for years. Unfinished design notes are a script a later contributor can act. If the later contributor is a stranger with publish rights, the script is camouflage.
- **Surprise:** 4

---

## 3. Version `0.8.0` ships `<<<<<<< index.js`

- **Find-type:** 2 (artifact left in the object database)
- **Hashes:** `ec831f013d30667f460980c1a35c64f5e27c2410` (`0.8.0`, conflict markers committed); `5bd67ee195266e8b0a4271a3c37f59d4d56a59c6` (the apology)
- **Dates:** 2012-03-26T11:39:35+13:00 / 2012-04-07T12:56:30+12:00
- **Author:** Dominic Tarr
- **Messages:** `0.8.0` / `sorry everyone, fucked up a 3-way-merge. fixed.`
- **Command:**

```
git -C ~/book16/repos/event-stream grep -n '<<<<<<' ec831f013d30667f460980c1a35c64f5e27c2410 -- index.js
git -C ~/book16/repos/event-stream show 5bd67ee195266e8b0a4271a3c37f59d4d56a59c6 --format=fuller --stat
```

```
ec831f013d30667f460980c1a35c64f5e27c2410:index.js:12:<<<<<<< index.js

commit 5bd67ee195266e8b0a4271a3c37f59d4d56a59c6
AuthorDate: Sat Apr 7 12:56:30 2012 +1200
    sorry everyone, fucked up a 3-way-merge. fixed.
 index.js | 25 -------------------------
```

The markers name the other side of the merge: `>>>>>>> ../snob/node_modules/event-stream/index.js`. He was resolving a 3-way diff against a *copy of this library sitting in another project's `node_modules`*. `0.8.0` is a version bump, not a tag (git tags in this repo start at `2.1.9`). The conflicted tree sits in history for twelve days.

- **Why it is a story:** 2012 npm culture in one blob: publish from a dirty working tree, use `node_modules` of a downstream app as a merge parent, leave `<<<<<<<` in the file that every `require('event-stream')` loads, bump the version anyway. The fix commit is honest about it. Nobody in April 2012 is thinking about supply chain; they are thinking about `through`.
- **What the reader learns:** `git grep '<<<<<<' $(git rev-list --all)` on your own tags. A version-bump commit is not a review. If the merge parent path is `../something/node_modules/your-own-package`, the author was not looking at git. They were looking at whatever their app happened to have installed.
- **Surprise:** 4

---

## 4. `refactor out map`: ninety-four lines leave, two lines of re-export stay

- **Find-type:** 7 (feature that became the vulnerability)
- **Hash:** `53c59a38da9ea58dc73085268c780234149b43c8`
- **Date:** 2012-08-18T15:10:31+02:00
- **Author:** Dominic Tarr
- **Message:** `refactor out map`
- **Command:**

```
git -C ~/book16/repos/event-stream show --stat --format=fuller 53c59a38da9ea58dc73085268c780234149b43c8
git -C ~/book16/repos/event-stream show 53c59a38da9ea58dc73085268c780234149b43c8 -- package.json index.js | head -40
```

```
    refactor out map
 index.js     | 94 ++----------------------------------------------------------
 package.json |  3 +-
 2 files changed, 4 insertions(+), 93 deletions(-)

+  , map = require('map-stream')
 ...
+es.map = map
 ...
+    "map-stream": "0.0.1"
```

Same summer: `through` and `from` (`a95a1142`, 2012-07-05), `pause-stream`, `split`, `stream-combiner`, `duplexer`. event-stream becomes a façade of one-function packages. `es.map = require('map-stream')` is the entire remaining implementation of the thing the first commit was.

- **Why it is a story:** The 2011 `map` is now someone else's npm name. Adding a helper in this codebase *means* adding a dependency and two assignment lines. That is the house style. Six years later 北川's `add flat map` is indistinguishable from this commit: `require('flatmap-stream')`, `es.flatmap = flatmap`, one test file. The vulnerability is not a new kind of change. It is the house style pointed at a package the new maintainer owns.
- **What the reader learns:** When a module's job is to re-export other modules, `git log -S "require("` on `index.js` is your threat model. A two-line addition that matches every previous extraction will pass review, including the review you do not do because you handed the repo over.
- **Surprise:** 3

---

## 5. The shortlog falls off a cliff, then a new name pushes

- **Find-type:** 4 (name that disappears / appears)
- **Hashes:** `bdb3908052571cd4ca35fc27a84690ffc6bd3b63` (last Dominic *code*); `73198620bfa8630deb023bee96c1633684028158` (last Dominic anything); `a74c9b2ab433c4e36089fbb72931f6b786b550f5` (first 北川)
- **Dates:** 2016-06-19 / 2017-10-10 / 2018-09-04. Gap: 329 days.
- **Authors:** Dominic Tarr; 北川 `<right9ctrl@outlook.com>`
- **Messages:** `return from catch` / `Merge pull request #107 from Rolias/master` / `upgrade dependencies`
- **Command:**

```
git -C ~/book16/repos/event-stream log --author='Dominic Tarr' --format='%h %aI %s' | head -6
git -C ~/book16/repos/event-stream log --reverse --author='北川' --format='%h %aI %ae %s' | head -3
git -C ~/book16/repos/event-stream log --since=2018-01-01 --format='%an' | sort | uniq -c
```

```
7319862 2017-10-10T08:50:06+13:00 Merge pull request #107 from Rolias/master
b3be03d 2017-03-22T13:50:08+13:00 Merge pull request #103 from detailyang/patch-1
0d9d457 2016-07-17T19:23:27+12:00 3.3.4
c686726 2016-06-19T11:38:31+12:00 3.3.3
bdb3908 2016-06-19T11:38:20+12:00 return from catch

a74c9b2 2018-09-04T08:12:15+00:00 right9ctrl@outlook.com upgrade dependencies
0cc6c7f 2018-09-04T08:53:07+00:00 right9ctrl@outlook.com add map and split examples
ee8f8e4 2018-09-04T09:19:17+00:00 right9ctrl@outlook.com remove trailing in split example

     16 北川
```

Yearly authors: 2011 Dominic 35; 2012 Dominic 146; 2016 Dominic 3; 2017 Dominic 2 (both GitHub merges of other people's README). 2018: 16 北川, zero Dominic. There is no merge commit, no `Co-authored-by`, no `AUTHORS` edit, no transfer note. The parent of `a74c9b2` is Dominic's last merge. All sixteen new commits are authored *and* committed by 北川, every timestamp `+0000`.

- **Why it is a story:** The handover the internet describes is a GitHub/npm permission change. Git records it as a discontinuity: the next committer is a Unicode name and an Outlook address, pushing directly, in a timezone Dominic never used here (Dominic is `+10`/`+12`/`+13`, with travel `+02`). On the morning of 4 September 2018 nobody looking at `git log -1` would see a conversation. They would see a new person who already has the keys.
- **What the reader learns:** `git shortlog -sn --since=two-years-ago` and `git log --format='%an %ae %aD' -20`. A name that appears without a merge is not a contributor. It is an owner. Watch the committer, not the PR list; this repo's last year has no PRs from the new name because the new name did not need them.
- **Surprise:** 3

---

## 6. Twelve commits of being helpful, including a patch release, before the payload

- **Find-type:** 4 (the name building trust) / 1 (tiny diffs)
- **Hashes:** `a74c9b2ab433c4e36089fbb72931f6b786b550f5` → `0f3738c93486df2c44ce3e582e2c85d0414fa527` (the nine commits *before* `add flat map`); anchors: `918d4a3398166d6f4264f7fc4ec2cc43f731ab0e` (`3.3.5`), `0f3738c` (one-line alias)
- **Date:** 2018-09-04 → 2018-09-09T07:15:41+00:00
- **Author:** 北川
- **Messages:** `upgrade dependencies` / `add map and split examples` / `remove trailing in split example` / `better pretty.js example` / `update readme` / `3.3.5` / `add note for gulp 4 in readme` / `add collect alias for write array`
- **Command:**

```
git -C ~/book16/repos/event-stream log --author='北川' --reverse --format='%h %aI %s' | head -9
git -C ~/book16/repos/event-stream show --stat a74c9b2ab433c4e36089fbb72931f6b786b550f5
git -C ~/book16/repos/event-stream show 0f3738c93486df2c44ce3e582e2c85d0414fa527
```

```
a74c9b2 2018-09-04T08:12:15+00:00 upgrade dependencies
0cc6c7f 2018-09-04T08:53:07+00:00 add map and split examples
ee8f8e4 2018-09-04T09:19:17+00:00 remove trailing in split example
c08d14b 2018-09-05T04:13:50+00:00 better pretty.js example
05b0224 2018-09-05T05:06:29+00:00 update readme
918d4a3 2018-09-05T05:27:34+00:00 3.3.5
50c0edb 2018-09-06T08:09:04+00:00 add note for gulp 4 in readme
0f3738c 2018-09-09T07:15:41+00:00 add collect alias for write array

    upgrade dependencies
 package-lock.json | 592 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 package.json      |  24 +--
 2 files changed, 604 insertions(+), 12 deletions(-)

    add collect alias for write array
+es.collect =
 es.writeArray = function (done) {
```

`upgrade dependencies` is the first `package-lock.json` in the repo (create mode) and it *pins `map-stream` down* (`~0.1.0` → `0.0.7`) while caret-upgrading the rest. `3.3.5` is a one-line version bump after README and example work only — the new owner's first publish, four days before `flatmap-stream`. Fifty-two minutes before the payload, a one-line alias.

- **Why it is a story:** This is the week that would have been a model takeover if the next commit had not existed. Examples, a Gulp 4 footnote, a lockfile, a patch release. `3.3.5` tests that npm publish works. `es.collect =` is the smallest possible "I read the code" commit. The moment before the outcome is Sunday 09:00 UTC on 9 September: the log looks like a bored, competent maintainer.
- **What the reader learns:** Do not start reading a new maintainer at the commit the newspaper names. `git log --reverse --author='the-new-name'` and read *everything* first. The trust-building is the operation. A first lockfile plus a dependency pin that is not an upgrade is worth `git show` even when the message says `upgrade`.
- **Surprise:** 4

---

## 7. Two lines of `require`, then `3.3.6` nine minutes later, untagged

- **Find-type:** 1 (tiny diff, huge blast radius)
- **Hashes:** `e3163361fed01384c986b9b4c18feb1fc42b8285` (`add flat map`); `5999958dfc1b0a80e6caeac4cdc76b3b828bdfe2` (`3.3.6`)
- **Dates:** 2018-09-09T08:07:49+00:00 / 2018-09-09T08:17:22+00:00 (573 seconds)
- **Author:** 北川
- **Messages:** `add flat map` / `3.3.6`
- **Command:**

```
git -C ~/book16/repos/event-stream log -S 'flatmap-stream' --all --format='%h %aI %an %s'
git -C ~/book16/repos/event-stream show e3163361fed01384c986b9b4c18feb1fc42b8285 -- index.js package.json
git -C ~/book16/repos/event-stream log -1 --format='%h %d %s' 5999958dfc1b0a80e6caeac4cdc76b3b828bdfe2
```

```
2bd63d5 2018-09-16T11:16:18+00:00 北川 update package.json
908fee5 2018-09-16T11:14:19+00:00 北川 add filter and rewrite flatmap
e316336 2018-09-09T08:07:49+00:00 北川 add flat map

+  , flatmap = require('flatmap-stream')
+es.flatmap = flatmap
+    "flatmap-stream": "^0.1.0",

5999958  3.3.6
```

The lockfile records `flatmap-stream@0.1.0` with integrity `sha512-Nlic4ZRYxikqnK5rj3YoxDVKGGtUjcNDUtvQ7XsdGLZmMwdUYnXf10o1zcXtzEZTBgc6GxeRpQxV/Wu3WPIIHA==`. `3.3.6` is two files, two lines (`"3.3.5"` → `"3.3.6"` in `package.json` and the lockfile). `git tag` has nothing called `3.3.6`. After 2012 the only tags in this repo are `4.0.0` and `4.0.1`, both later, both clean of the dependency. Dominic's own `3.3.4` (2016-07-17) is also untagged; the last Dominic tag is `3.0.5` in 2012. Caret ranges on npm, not git tags, are how `3.3.6` moved.

- **Why it is a story:** Sunday morning. The same two-line pattern as `refactor out map`. A test that proves `flatmap` adds one to nested arrays. Nine minutes later the patch version that `^3.3.4` will select. No tag, no changelog, no PR. The blast radius is not the 26 insertions. It is every `package.json` in the world that said `"event-stream": "^3.3.4"` and every install that ran after 08:17.
- **What the reader learns:** `git tag --contains <the-version-bump>` and `npm view pkg versions` are different histories. A patch bump of a library whose last *tagged* release was six years ago is how a caret range becomes an exploit channel. Diff `package.json` at the version npm actually resolved, not at `master`.
- **Surprise:** 3

---

## 8. Four minutes to `4.0.0`: git is cleaned, the caret range is not

- **Find-type:** 8 (rollback of the world)
- **Hashes:** `908fee5c65d4eb02809a84a1ebc3e5df1f935cd1` (rewrite; drop the `require`); `2bd63d58fe24367372690c29c7249ed1c7145601` (drop the dep, `3.3.6` → `4.0.0`); `8bc742ba91aca6c5f5b9467d8d7653c95ec98f7d` (readme; **tag `4.0.0`**)
- **Date:** 2018-09-16T11:14:19+00:00, 11:16:18, 11:18:12 (119 s then 114 s)
- **Author:** 北川
- **Messages:** `add filter and rewrite flatmap` / `update package.json` / `update readme`
- **Command:**

```
git -C ~/book16/repos/event-stream show 908fee5c65d4eb02809a84a1ebc3e5df1f935cd1 -- index.js | head -40
git -C ~/book16/repos/event-stream show 2bd63d58fe24367372690c29c7249ed1c7145601 -- package.json
git -C ~/book16/repos/event-stream for-each-ref --format='%(refname:short) %(creatordate:iso-strict) %(objectname:short) %(subject)' refs/tags | tail -5
```

```
-  , flatmap = require('flatmap-stream')
-es.flatmap = flatmap
+es.filterSync = function (test) { ... }
+es.flatmapSync = function (mapper) { ... }

-  "version": "3.3.6",
+  "version": "4.0.0",
-    "flatmap-stream": "^0.1.0",

3.0.5 2012-09-26T01:02:21+02:00 1559ed4 3.0.5
4.0.0 2018-09-16T11:18:12+00:00 8bc742b update readme
4.0.1 2018-09-20T13:17:24+00:00 9a5c52a remove testling from package.json
```

This is not a revert. `git log --diff-filter=R` will not find it. The helper is rewritten in-tree (and renamed `flatmapSync`), the dependency is deleted, the version jumps a major so that `^3.3.4` will **not** follow. The `4.0.0` tag is hung on a README commit, not on the version bump. HEAD `package.json` has no `flatmap-stream`. Anyone cloning today and reading `master` sees a clean façade.

- **Why it is a story:** 11:14, the require is gone. 11:16, so is the dependency, and the number on the box is `4.0.0`. 11:18, the readme documents `flatmapSync` as if that were the point. The moment before the outcome is a reasonable reading: "we inlined a helper and semver-major'd the API." The outcome, two months later, is that npm still serves `3.3.6` to every unpinned 3.x installer, and git's default branch has already forgotten. The rollback is of the *repository's face*, not of the published artifact.
- **What the reader learns:** A major bump that *removes* a one-week-old dependency is a signal, not a cleanup. Compare `git show HEAD:package.json` with `npm view event-stream@3.3.6 dependencies`. If those two documents disagree, the lie is the one your users install. Also: tagging a README commit `4.0.0` while not tagging `3.3.6` at all is how git and the registry tell different stories on purpose.
- **Surprise:** 5

---

## 9. HEAD is still 北川; `package.json` still says Dominic Tarr

- **Find-type:** 4 (name that appears and never yields) / 8 (the rollback that never came)
- **Hashes:** `9a5c52a712a721cbc76192b5d0940bcc29cbef03` (HEAD, tag `4.0.1`); `970993ccc594c606d439a9fa22715d311e1b9fa2` (the `author` field's only origin)
- **Date:** 2018-09-20T13:17:24+00:00
- **Author:** 北川
- **Message:** `remove testling from package.json`
- **Command:**

```
git -C ~/book16/repos/event-stream log -1 --format=fuller
git -C ~/book16/repos/event-stream log -S '"author"' -- package.json --format='%h %aI %an %s'
git -C ~/book16/repos/event-stream show HEAD:package.json | tail -20
```

```
commit 9a5c52a712a721cbc76192b5d0940bcc29cbef03
Author:     北川 <right9ctrl@outlook.com>
AuthorDate: Thu Sep 20 13:17:24 2018 +0000
    remove testling from package.json

970993c 2011-08-20T11:38:02+10:00 Dominic Tarr inital. first implementation of a map function ...

  "keywords": [
    "stream", "map", "flatmap", "filter", "split", "join", "merge", "replace"
  ],
  "license": "MIT",
  "author": "Dominic Tarr <dominic.tarr@gmail.com> (http://bit.ly/dominictarr)"
```

The last commit removes the `testling` browser matrix and bumps `4.0.0` → `4.0.1`. Keywords, added the same morning (`60d0aa3`), still list `flatmap` after the dependency is gone. The `author` string has not changed in 322 commits. Discovery of the attack is November 2018, off-repo. There is no Dominic revert, no `3.3.7` commit, no `SECURITY.md`, no `AUTHORS` correction. Git's clock stops on a testling cleanup.

- **Why it is a story:** The xz rollback writes the other maintainer out of `AUTHORS` and lists hashes. This repo does not get a rollback. The last face it shows is the attacker bumping a patch version and deleting CI chrome, with Dominic's name still in the npm metadata that `npm view` prints. The "fix" the world consumed was an npm unpublish / a later 3.3.7 that is **not in this git**. Clone the repo in 2026 and `git log -1` is 北川.
- **What the reader learns:** `git log -1 --format='%an %ae'` versus the `"author"` field in `package.json` versus `npm owner ls`. Three identities, possibly three different people. If git HEAD is the attacker and the registry later grew a version git does not have, your clone is not the incident's last word — and that fact is itself a finding.
- **Surprise:** 4

---

## 10. `es.concat = //actually this should be called concat`

- **Find-type:** 5 (comment that outlived its code)
- **Hash:** `13f29efb0057ebcd76890392b4cf9cdb0442e850`
- **Date:** 2012-05-26T15:40:16+12:00
- **Author:** Dominic Tarr
- **Message:** `through may take custom write function`
- **Command:**

```
git -C ~/book16/repos/event-stream log -S 'actually this should be called concat' --format='%h %aI %an %s'
git -C ~/book16/repos/event-stream blame -L 31,32 index.js
```

```
13f29ef 2012-05-26T15:40:16+12:00 Dominic Tarr through may take custom write function

13f29efb (Dominic Tarr 2012-05-26 15:40:16 +1200 31) es.concat = //actually this should be called concat
00d0d285 (Dominic Tarr 2012-05-18 02:56:57 +1200 32) es.merge = function (/*streams...*/) {
```

An alias and a confession on one line, still HEAD, still true: the function is `merge`, the name people wanted was `concat`, and the comment is the code review that never became a rename. (Nearby: Raynos's 2012-08-09 `deprecate es.pipeable` is also still a `throw` on HEAD, message spelled `depreciation` in the 2012-08-07 warning that preceded it.)

- **Why it is a story:** Not every surviving comment is a fuse. Some are the project's personality, frozen: a man who ships the alias and the argument with himself in the same token. It is the tone a later reader (including 北川) inherits. The file that delivered a bitcoin-wallet attack still argues with itself about `concat`.
- **What the reader learns:** `git blame -L` a joke. If it has a date six years before the last commit, the file is a palimpsest: house style, unfinished design, and — in this repo — the two-line weapon all share a page.
- **Surprise:** 2

---

## Ranked top-3

1. **#8 — the 4.0.0 disappearing act.** Three commits in four minutes rewrite the helper, delete `flatmap-stream`, and hang tag `4.0.0` on a README. Git's face is clean; `^3.3.4` is not. The rollback of the world that is not a revert.
2. **#7 — two lines, then `3.3.6`, no tag.** The house style of 2012 (`require` + re-export) plus a nine-minute patch bump. The blast radius is the caret range, and git will not show it unless you look at the untagged commit npm served.
3. **#2 / #6 — the comments and the helpful fortnight.** Day-two `filter`/`reduce` notes, still line 1; then twelve commits of examples, a Gulp footnote, `3.3.5`, a one-line alias. The cover story was already in the file. The new maintainer filled it in.

## Disappointing

The weapon is not here: `git log -S copay` is empty, there is no revert and no 3.3.7, and 248 of 322 commits are Dominic bumping versions and fixing README typos — the famous attack is `+  , flatmap = require('flatmap-stream')` plus a number change, and then git ends, eight weeks before anyone notices.
