# Independent verification and extension: nodejs/node

## Verification table

I reran all 15 commands printed under the ranked top three, then used narrowly scoped supplemental commands where the printed command could not establish metadata or a narrative claim. Counts below treat each row as one claim: **18 PASS, 3 FAIL**.

| Dig | Claim | Command rerun | Result | Note |
|---|---|---|---|---|
| #3 `sys` | Throw commit hash/date/author/message/body | `git -C ~/book16/repos/node log -1 --format='%H%n%ai %an %s%n%b' b28e700ebdf6583364fec3171390a24153f79632` | PASS | Exact match: `b28e700ebdf6583364fec3171390a24153f79632`, 2012-01-09, Ryan Dahl, `require('sys') now throws`, `To be removed in v0.9`. |
| #3 `sys` | The throw replaces the shim | `git -C ~/book16/repos/node show b28e700ebdf6583364fec3171390a24153f79632 -- lib/sys.js \| tail -8` | PASS | The final added line is exactly `throw new Error('The "sys" module is now called "util".');`. |
| #3 `sys` | Isaac un-breaks it on 2012-06-28 with a compatibility shim | `git -C ~/book16/repos/node show f2a9ed487369ab7222522e1097708550adbe165c -- lib/sys.js \| tail -12`; supplemental `git -C ~/book16/repos/node show -s --no-mailmap --format='%H %aI %an <%ae> %s' f2a9ed487369ab7222522e1097708550adbe165c` | PASS | Patch ends in `module.exports = require('util');`; raw author is `isaacs <i@izs.me>` (canonically Isaac Z. Schlueter), message matches. |
| #3 `sys` | Wyatt's 2015 commit says “deprecate, don't remove” | `git -C ~/book16/repos/node log -1 --format='%s%n%b' dc42e1faaf358e1ee8729439e0a3ade26f3cbce1`; supplemental `git -C ~/book16/repos/node show -s --no-mailmap --format='%H %aI %an <%ae> %s' dc42e1faaf358e1ee8729439e0a3ade26f3cbce1` | PASS | Exact body and author date 2015-01-12 match. Committer is Rod Vagg on 2015-01-13, a useful distinction omitted from the first report. |
| #3 `sys` | HEAD still contains the shim and maintainer warning | `git -C ~/book16/repos/node show HEAD:lib/sys.js \| tail -8` | PASS | Exact match, including the “we do not plan to remove it” comment and `DEP0025`. |
| #3 `sys` | This is a “revert war” | `git -C ~/book16/repos/node show -s --format='%H %P%n%s%n%b' b28e700ebdf6583364fec3171390a24153f79632 f2a9ed487369ab7222522e1097708550adbe165c dc42e1faaf358e1ee8729439e0a3ade26f3cbce1` | **FAIL** | It is a strong reversal story, but not a war: one break, one later un-break, then a policy commit. None is a Git-generated revert and there is no repeated back-and-forth. Find-type 6 is overstated. |
| #3 `sys` | “v0.9 never exists as a line” | `git -C ~/book16/repos/node tag -l 'v0.9*' --sort=version:refname \| tail -12` | **FAIL** | The repo has `v0.9.1` through `v0.9.12` tags (and a `v0.9.0-release` merge). v0.9 was unstable rather than absent; “0.10 shipped instead” is misleading. |
| #7 Promises | Early history contains the stated Promise sequence | `git -C ~/book16/repos/node log --reverse --format='%H %ai %an %s' --until=2010-03-01 \| grep -i promis \| head -5` | PASS | The five lines reproduce. The terminal's harmless broken-pipe warning after `head` is not evidence against the result. |
| #7 Promises | `7cd09874c666f0ce64b1d7776de74f55ff3e53ab` adds the Promise class on 2009-06-28 | `git -C ~/book16/repos/node log -1 --format='%H%n%ai %an %s' 7cd09874c666f0ce64b1d7776de74f55ff3e53ab` | PASS | Exact hash/date/message. The command prints raw name `Ryan`; `.mailmap` canonicalizes it to Ryan Dahl. |
| #7 Promises | `0485cc41d5c260458f590d249c073794047434fb` removes 306 lines in four files | `git -C ~/book16/repos/node show --stat --format='%s' 0485cc41d5c260458f590d249c073794047434fb` | PASS | Exact match: 95 + 85 + 47 + 79 = 306 deletions, no insertions. |
| #7 Promises | The deleted class lived beside `EventEmitter` in `src/node.js` | `git -C ~/book16/repos/node show 0485cc41d5c260458f590d249c073794047434fb -- src/node.js \| head -40` | PASS | Patch header, Ryan/date/message, `exports.Promise`, inheritance from `EventEmitter`, and `process.Promise` all reproduce. “Eight months” is fair rounding (2009-06-28 to 2010-02-20). |
| #8 io.js | README declares this repository a GitHub fork of Joyent Node | `git -C ~/book16/repos/node show 51514c8e8cbd98be7f29c3f1508b625d16e91b5d -- README.md` | PASS | Exact diff and PR #24 metadata reproduce. |
| #8 io.js | Binary rename commit is `f17f473af5e28f4ec00a518f97a84b69c426309e`, 2015-01-08, Ben Noordhuis | `git -C ~/book16/repos/node log -1 --format='%H %ai %an %s' f17f473af5e28f4ec00a518f97a84b69c426309e` | PASS | Exact match. Its body also explicitly says build targets, runner, installer, and binary-name test changed. |
| #8 io.js | Rename-back message says it follows convergence | `git -C ~/book16/repos/node show --stat --format='%s%n%b' a69ab27ab458385d24676792b75ad1c25b8c30e5 \| head -18` | PASS | Subject/body reproduce, including remaining io.js instances and PR #2367. |
| #8 io.js | The shown transcript's `96 files changed…` comes from that exact `head -18` command | Same command as previous row | **FAIL** | The shortstat is below the per-file stat list and does **not** occur in the first 18 lines. The report spliced in a true line that its printed command cannot display. |
| #8 io.js | Underlying rename-back size is 96 files, +2162/−2187 | Supplemental `git -C ~/book16/repos/node show --shortstat --format='%H %s' a69ab27ab458385d24676792b75ad1c25b8c30e5` | PASS | The numbers themselves are correct; only the claimed reproducer is wrong. |
| #8 io.js | v4.0.0 notes are relative to io.js v3.3.0 and describe convergence | `git -C ~/book16/repos/node log -1 --format='%s%n%b' f9f837885343a2a3f5ba2b8c510eaac395c8c865 \| head -12` | PASS | Exact match. “Parented at” should be read as a changelog baseline, not a Git parent relationship. |
| #8 io.js | `origin/v1.x` has 1,061 commits absent from `origin/v0.12` | `git -C ~/book16/repos/node rev-list --count origin/v1.x --not origin/v0.12` | PASS | Output is exactly `1061`. |
| #8 io.js | `origin/v0.12` has 486 commits absent from HEAD | `git -C ~/book16/repos/node rev-list --count origin/v0.12 --not HEAD` | PASS | Output is exactly `486`. This verifies the count, not the unquantified word “mostly.” |
| #8 io.js | Dates/authors/messages for its four named commits match | Supplemental `git -C ~/book16/repos/node show -s --no-mailmap --format='%H %aI %an <%ae> %s' 51514c8e8cbd98be7f29c3f1508b625d16e91b5d f17f473af5e28f4ec00a518f97a84b69c426309e a69ab27ab458385d24676792b75ad1c25b8c30e5 f9f837885343a2a3f5ba2b8c510eaac395c8c865` | PASS | Mikeal Rogers (2014-12-01), Ben Noordhuis (2015-01-08), raw `cjihrig` (2015-08-13), and Rod Vagg (2015-09-07) all match; Colin Ihrig is the canonical expansion. |
| #8 io.js | No octopus merge heals the histories | `git -C ~/book16/repos/node rev-list --all --min-parents=3 --count` | PASS | Output is `0`. There are 391 ordinary two-parent merges on `--all`, but no three-or-more-parent octopus merge. |

## New dig 1: The fork rehearsed in private, and only a stale ref kept the minutes

- **find-type:** 2 (planted/dated artifact)
- **hash:** `e7dec60a63b9171465fd4037a04aeb709198aea2`
- **date:** 2014-10-29 17:30:17 -0700
- **author:** Mikeal Rogers `<mikeal.rogers@gmail.com>` (author = committer)
- **message:** `Said public when I meant private.`

Exact reproducer:

```sh
git -C /home/diablo/book16/repos/node branch -r --contains e7dec60a63b9171465fd4037a04aeb709198aea2
printf 'unique_to_branch '
git -C /home/diablo/book16/repos/node rev-list --count origin/archived-io.js-v0.10 --not origin/main
git -C /home/diablo/book16/repos/node show -s --format='%H%n%aI %an <%ae>%n%s' e7dec60a63b9171465fd4037a04aeb709198aea2
git -C /home/diablo/book16/repos/node show --format='' e7dec60a63b9171465fd4037a04aeb709198aea2 -- doc/tc-meetings/2014-10-29.md | rg 'private|public|four weeks|node-forward'
```

```text
  origin/archived-io.js-v0.10
unique_to_branch 16
e7dec60a63b9171465fd4037a04aeb709198aea2
2014-10-29T17:30:17-07:00 Mikeal Rogers <mikeal.rogers@gmail.com>
Said public when I meant private.
  * doesn't make sense while we're private, we'll wait until it is public again
 * `node-forward/node` going public
- * when we made the repo public it was messaged as only being for "four weeks"
+ * when we made the repo private it was messaged as only being for "four weeks"
  * "four weeks" is up on November 8th
```

**Why it is a story.** Five weeks before the public io.js README commit in the first report, the people building the alternative governance process are meeting in a private repository named `node-forward/node`. The correction is only one word, but it changes the event from a public experiment to a private one with a promised end date. The notes say the four weeks expire November 8 and somebody must remind Joyent. This commit never reaches `main`; it is one of 16 objects stranded on `origin/archived-io.js-v0.10`. The moment before the outcome is unusually literal: the future fork has a name, a private room, a launch clock, and no certainty that the room will be opened.

**Reader learns:** `HEAD` can preserve the official launch while a stale remote ref preserves the rehearsal. Use `branch -r --contains <hash>` and `rev-list stale --not main` before declaring that a project's public history is its whole history.

**surprise:** 5

## New dig 2: A child committed 34 days before its parent

- **find-type:** 2 (planted/dated artifact)
- **hash:** `1e7a0aa8837dd9244a4941560b2a20da1b4aa60d` (parent `ae0dd0d89ce4106d89657003208191a564651ae8`)
- **date:** author 2011-09-20 23:48:03 +0200; committer 2011-08-17 07:50:58 +0200
- **author:** Ben Noordhuis `<info@bnoordhuis.nl>` (also the committer)
- **message:** `gyp: revive sunos support, lost in 6b98a63`

Exact reproducer:

```sh
git -C /home/diablo/book16/repos/node show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%s' 1e7a0aa8837dd9244a4941560b2a20da1b4aa60d
git -C /home/diablo/book16/repos/node show -s --format='Parent: %H %cI %s' 1e7a0aa8837dd9244a4941560b2a20da1b4aa60d^
```

```text
1e7a0aa8837dd9244a4941560b2a20da1b4aa60d
Author: 2011-09-20T23:48:03+02:00 Ben Noordhuis <info@bnoordhuis.nl>
Committer: 2011-08-17T07:50:58+02:00 Ben Noordhuis <info@bnoordhuis.nl>
gyp: revive sunos support, lost in 6b98a63
Parent: ae0dd0d89ce4106d89657003208191a564651ae8 2011-09-20T14:08:55-07:00 Remove extra method declaration
```

**Why it is a story.** The parent and the cited libuv regression both exist on September 20. The fix follows them in the DAG and its author timestamp is later that night, but its committer field says August 17—34 days before its own parent. The same person occupies both identity fields, so this is not an old patch finally landed by a maintainer. The object does not disclose whether a clock, environment variable, or manual date caused it. It does prove that Git accepted an impossible calendar while preserving a perfectly valid topology.

**Reader learns:** commit dates are assertions, not ordering guarantees. When a date is the story, print `%aI`, `%cI`, and the parent's date; trust parent edges for causality.

**surprise:** 4

## New dig 3: Isaac's second release tag is the repository's first PGP-signed tag

- **find-type:** 4 (name appears in release custody)
- **hashes:** tag object `d50207084665883bcdd1a62eca19e49d640861c2` → commit `a3efcd2006614c3835c9395b91ab89c1f260806c`
- **date:** tagger date 2012-02-01 13:04:11 -0800 (target commit authored 2012-01-31 18:43:23 -0800)
- **author/tagger:** `isaacs <i@izs.me>` (mailmap: Isaac Z. Schlueter)
- **message:** `2012.02.01, Version 0.7.2 (unstable)`

Exact reproducer (the loop examines every tag in tagger-date order before printing `FIRST-PGP`):

```sh
repo=/home/diablo/book16/repos/node
for tag in v0.7.0 v0.7.1; do
  oid=$(git -C "$repo" rev-parse "refs/tags/$tag")
  meta=$(git -C "$repo" for-each-ref --format='%(taggerdate:iso8601-strict) %(taggername) <%(taggeremail:trim)> | %(subject)' "refs/tags/$tag")
  printf '%s %s unsigned | %s\n' "$tag" "$oid" "$meta"
done
while read -r tag; do
  if git -C "$repo" cat-file -p "refs/tags/$tag" | rg -q 'BEGIN PGP SIGNATURE'; then
    git -C "$repo" for-each-ref --format='FIRST-PGP %(refname:short) %(objectname) -> %(*objectname) | %(taggerdate:iso8601-strict) %(taggername) <%(taggeremail:trim)> | %(subject)' "refs/tags/$tag"
    break
  fi
done < <(git -C "$repo" for-each-ref --sort=taggerdate --format='%(refname:short)' refs/tags)
```

```text
v0.7.0 e614cd3a985a643ae7b76434ca48f2c0530a40d9 unsigned | 2012-01-16T19:46:18-08:00 Ryan Dahl <ry@tinyclouds.org> | 2012.01.16, Version 0.7.0 (unstable)
v0.7.1 284401fdcb86e8c6c9137faa5cf0e633a3846ad7 unsigned | 2012-01-23T17:26:31-08:00 isaacs <i@izs.me> | 2012.01.23, Version 0.7.1 (unstable)
FIRST-PGP v0.7.2 d50207084665883bcdd1a62eca19e49d640861c2 -> a3efcd2006614c3835c9395b91ab89c1f260806c | 2012-02-01T13:04:11-08:00 isaacs <i@izs.me> | 2012.02.01, Version 0.7.2 (unstable)
```

**Why it is a story.** Ryan tags v0.7.0. One week later Isaac tags v0.7.1, still unsigned. On his next unstable release the tag object gains the repository's first embedded PGP signature. Release custody and provenance harden in adjacent objects, without a handover announcement. This clone does not contain the public key needed to validate the signer, so the defensible claim is signature *presence*, not verified identity.

**Reader learns:** commits show code custody; annotated tags show release custody. Scan raw tag objects for signature armor and distinguish “signature present” from “signature verified.”

**surprise:** 4

## New dig 4: The same reviewed patch landed twice in twelve minutes; the second landing is empty

- **find-type:** 2 (planted artifact / empty commit)
- **hashes:** `766d063e0578c0f7758c3a965c971763f43fec85` (real patch) → `71e9d0fb1b455f447ce5c4362decf7d0e3e836f3` (empty duplicate)
- **date:** authored 2014-12-03 18:28:40 +1100; committed 2014-12-04 at 21:20:28 and 21:32:05 +1100
- **author:** Johan Bergström `<bugs@bergstroem.nu>`; committer Rod Vagg `<rod@vagg.org>`
- **message:** `configure: remove shared cares build option`

Exact reproducer:

```sh
git -C /home/diablo/book16/repos/node show --shortstat --format='%H%n%aI %an <%ae> | committed %cI by %cn%n%s' 766d063e0578c0f7758c3a965c971763f43fec85 71e9d0fb1b455f447ce5c4362decf7d0e3e836f3
git -C /home/diablo/book16/repos/node merge-base --is-ancestor 766d063e0578c0f7758c3a965c971763f43fec85 71e9d0fb1b455f447ce5c4362decf7d0e3e836f3 && echo 'first commit is ancestor of second'
git -C /home/diablo/book16/repos/node diff-tree --exit-code 71e9d0fb1b455f447ce5c4362decf7d0e3e836f3^ 71e9d0fb1b455f447ce5c4362decf7d0e3e836f3 >/dev/null && echo 'second commit: identical parent/tree'
```

```text
766d063e0578c0f7758c3a965c971763f43fec85
2014-12-03T18:28:40+11:00 Johan Bergström <bugs@bergstroem.nu> | committed 2014-12-04T21:20:28+11:00 by Rod Vagg
configure: remove shared cares build option
 3 files changed, 2 insertions(+), 42 deletions(-)
71e9d0fb1b455f447ce5c4362decf7d0e3e836f3
2014-12-03T18:28:40+11:00 Johan Bergström <bugs@bergstroem.nu> | committed 2014-12-04T21:32:05+11:00 by Rod Vagg
configure: remove shared cares build option
first commit is ancestor of second
second commit: identical parent/tree
```

**Why it is a story.** PR #38's 44-line change lands, two governance commits follow, and twelve minutes later the same author identity, message, PR URL, reviews, and patch attribution are recorded again. The first hash is already an ancestor, so the second hash has nothing left to change: its tree is byte-for-byte its parent's. Git keeps it anyway. In the first days of the io.js governance experiment, intent was important enough—or the landing path uncertain enough—that the record was duplicated even after the code was present. The repository gives no reason, so the empty object, not a guessed motive, is the story.

**Reader learns:** `git show --stat` silently makes an empty commit look like metadata only. Compare its tree with its parent and search the subject across `--all`; an “empty” commit can be a duplicated landing receipt rather than a no-op joke.

**surprise:** 4

## New dig 5: `--follow` calls it a new file; the Makefile shows the birth of `node`

- **find-type:** 4 (name appears)
- **hash:** `19478ed4b14263c489e872156ca55ff16a07ebe0`
- **date:** 2009-03-03 01:56:15 +0100
- **author:** Ryan `<ry@tinyclouds.org>` (mailmap: Ryan Dahl)
- **message:** `Major refactoring: program name now "node"`

Exact reproducer:

```sh
git -C /home/diablo/book16/repos/node log --follow --reverse --no-mailmap --format='%H %aI %an <%ae> | %s' --name-status -- node.cc | head -3
git -C /home/diablo/book16/repos/node diff 19478ed4b14263c489e872156ca55ff16a07ebe0^ 19478ed4b14263c489e872156ca55ff16a07ebe0 -- Makefile | rg '^[+-](server|node):|^[+-][[:space:]]+g\+\+ -o (server|node)'
```

```text
19478ed4b14263c489e872156ca55ff16a07ebe0 2009-03-03T01:56:15+01:00 Ryan <ry@tinyclouds.org> | Major refactoring: program name now "node"
A	node.cc
-server: server.o tcp.o oi_socket.o oi_async.o ebb_request_parser.o oi_buf.o
-	g++ -o server $^ $(LDFLAGS) $(V8LIB)
+node: node.o node_tcp.o node_http.o oi_socket.o oi_async.o oi_buf.o ebb_request_parser.o
+	g++ -o node $^ $(LDFLAGS) $(V8LIB)
```

**Why it is a story.** Two weeks after the initial code in the first report, the executable is still called `server`. At 01:56 Ryan splits that server into TCP and HTTP modules, celebrates multiple web servers in the body, and changes the build target to `node`. Because the refactor is too large for similarity detection, `--follow` says `node.cc` was added rather than renamed from `server.cc`; the conceptual rename survives in the commit message and Makefile instead. This is the moment the generic server becomes the name that can later be forked to iojs and back.

**Reader learns:** `--follow` is a similarity heuristic, not lineage truth. At a heavy rewrite boundary, inspect paired deletes/adds, build targets, and the message before concluding that a famous file has no ancestor.

**surprise:** 4

Verdict: The first report's core archaeology is highly reliable: every named top-three hash and every substantive diff/count claim checks out.
Reliability caveat: it overcalls one reversal as a war, incorrectly erases the v0.9 release line, and prints one true shortstat under a command that cannot output it.
