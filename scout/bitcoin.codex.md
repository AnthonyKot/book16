# bitcoin/bitcoin — independent verification and extension

## Verification table

I treated a “claim” as a separately testable assertion about identity/timing, command output, or diff semantics. The ranked digs are 2, 3, and 9 in the first report.

| dig | claim | command rerun | result | note |
|---|---|---|---|---|
| 2 | `--author='--author'` finds exactly eight commits, bounded by `9f35575c…` and `e1cb7ce0…`, dated 2010-07-27 through 2010-07-31, authored literally as `--author=Satoshi Nakamoto` and committed by Gavin Andresen. | `git -C ~/book16/repos/bitcoin log --all --author='--author' --format='%H %aI %an <%ae> committer=%cn %s'` | **PASS** | All eight hashes, dates, names, committer names, and subjects match. |
| 2 | `shortlog` preserves three separate Satoshi identities with counts 8, 26, and 245. | `git -C ~/book16/repos/bitcoin shortlog -sne --all` | **PASS** | Exact counts are `8 --author=Satoshi Nakamoto`, `26 Satoshi Nakamoto`, and `245 s_nakamoto`. There is no `.mailmap` at `HEAD` to coalesce them. |
| 2 | The SVN object `01bed182…` is “the same patch” as the correctly attributed counterpart of example commit `e1cb7ce0…`. | `git -C /home/diablo/book16/repos/bitcoin show --format= --binary e1cb7ce0177de72b00e06dc4c8fe1d414723a9e7 \| git patch-id --stable`; repeat for `01bed1828b9ee64b9b38a7d0345c775de40fdd91`; then `git -C /home/diablo/book16/repos/bitcoin diff --ignore-space-at-eol e1cb7ce0177de72b00e06dc4c8fe1d414723a9e7 01bed1828b9ee64b9b38a7d0345c775de40fdd91 -- build-unix.txt makefile.unix` | **FAIL** | The two stable patch IDs differ (`7803f438…` versus `ec2e3224…`) because their preimages and EOL representations differ. Their resulting two files are equal when EOL whitespace is ignored, so “corresponding change with the same EOL-normalized result” is accurate; “same patch” is subtly too strong. |
| 3 | The displayed four-line block is the output of the report’s exact one-day `git log` command. | `git -C ~/book16/repos/bitcoin log --all --since='2010-08-15' --until='2010-08-16' --format='%H %aI %an %s'` | **FAIL** | The command emits seven commits, not four. It also emits `4bd188c4… misc changes`, `08fee752… version 0.3.10 release`, and `6ac7f9f1… misc changes`. The four incident commits are real, but the excerpt silently removes three in-range rows without a filter or ellipsis. |
| 3 | The four incident hashes, dates, authors, subjects, and order are correct. | `git -C ~/book16/repos/bitcoin log --all --since='2010-08-15' --until='2010-08-16' --format='%H %aI %an %s'` | **PASS** | `2d12315c…` 20:28 Gavin; `d4c6b90c…` 21:35 s_nakamoto; `85de7d7c…` 22:21 s_nakamoto; `76793dc9…` 23:09 Satoshi/Gavin all match. The 67-minute and 46-minute intervals are accurate to the minute. |
| 3 | Gavin’s quick fix is six insertions in `main.h`, names height 74,652, rejects a single output over 21 million coins, and skips such outputs while summing. | `git -C /home/diablo/book16/repos/bitcoin show 2d12315c94f12d62b2f2aa39e63511a2042fe55d -- main.h` | **PASS** | The subject has the wrong height relative to the later 74,638 fixes, and the diff behavior is described precisely. |
| 3 | Satoshi’s `d4c6b90c…` is +19/−2, creates `MAX_MONEY`, checks individual and summed outputs plus individual and summed inputs, and bumps serialization `VERSION` 309→310. | `git -C /home/diablo/book16/repos/bitcoin show --stat d4c6b90ca3f9b47adb1b2724a0c3514f80635c84`; `git -C /home/diablo/book16/repos/bitcoin show d4c6b90ca3f9b47adb1b2724a0c3514f80635c84 -- main.cpp main.h serialize.h` | **PASS** | Stats and all stated checks match the diff. |
| 3 | `85de7d7c…` rejects a chain containing the named bad hash at height 74638, while `76793dc9…` is the GitHub-line twin of `d4c6b90c…`. | `git -C /home/diablo/book16/repos/bitcoin show 85de7d7c0cbb1e9aa311606644b697674c84f6f9 -- main.cpp`; `git -C /home/diablo/book16/repos/bitcoin show --format= --binary d4c6b90ca3f9b47adb1b2724a0c3514f80635c84 \| git patch-id --stable`; repeat for `76793dc969f5ee9feadb6827845c1682b11914a6` | **PASS** | The scanback condition and hash match. Both fix commits have stable patch ID `8f8a7401…`. |
| 9 | `b8f80196…` has the stated date, author, subject, and a one-file +1/−1 stat. | `git -C ~/book16/repos/bitcoin show --stat --format=fuller b8f801964f59586508ea8da6cf3decd76bc0e571` | **PASS** | Author and committer are Suhas Daftuar at 2018-09-17T15:50:55−04:00; subject and `Introduced by #9049` body match. |
| 9 | The complete repair is `CheckTransaction(*tx, state, false)` → `true`. | `git -C ~/book16/repos/bitcoin show b8f801964f59586508ea8da6cf3decd76bc0e571 -- src/validation.cpp` | **PASS** | The report reproduces the only changed token and surrounding call site correctly. |
| 9 | `eecffe50…`, merged as #9049, made the duplicate-input check optional and explicitly skipped it in `CheckBlock` as slow. | `git -C /home/diablo/book16/repos/bitcoin show eecffe50efc3944d713c701fa375dacbf17fb7cf -- src/main.cpp`; `git -C /home/diablo/book16/repos/bitcoin log --all --merges --grep='#9049'` | **PASS** | The diff adds the boolean and comment; merge `71bc39eb…` is `Merge #9049: Remove duplicatable duplicate-input check from CheckTransaction`. |
| 9 | The fix also closes the inflation flaw later labeled CVE-2018-17144. | `git -C /home/diablo/book16/repos/bitcoin show 38bfca6bb2ad68719415e9c54a981441052da072` | **PASS** | The later commit explicitly adds `Must check for duplicate inputs (see CVE-2018-17144)` at this call. The code path supports the report’s crash-plus-inflation description. |

**Verification count: 10 PASS / 2 FAIL.** The failures are precision defects in evidence presentation, not invented incident hashes.

## New digs

### 1. The first signed release tag points to an object outside `HEAD`

- **find-type:** 1 (tiny diff, huge blast radius) + 2 (planted/imported artifact)
- **hashes:** annotated tag object `90b4ed72f86e1d7f6196f9f9be0911a79f9cbb09` (`v0.3.20.2`); tagged commit `52248a757b25581339ca6e00cc0da05bfdb04dc8`; patch-identical `HEAD` twin `f36b494aebcfe4cc6a45003520ee7d15eeaba8df`
- **date:** commit author date 2011-03-03T16:25:05-05:00; tagger date 2011-03-04T09:48:45-05:00
- **author/tagger:** Gavin Andresen `<gavinandresen@gmail.com>`
- **message:** commit `Make send/receive limits bigger (10MB each)`; tag `critical bug-fix release (block download failures due to too-small sendbuffer)`

Exact reproduction (nine lines of output):

```sh
git -C /home/diablo/book16/repos/bitcoin log --all --not HEAD -1 --format='tag-only %H %aI %an %s' --grep='^Make send/receive limits bigger'
git -C /home/diablo/book16/repos/bitcoin log HEAD -1 --format='HEAD twin %H %aI %an %s' --grep='^Make send/receive limits bigger'
git -C /home/diablo/book16/repos/bitcoin show --stat --oneline 52248a757b25581339ca6e00cc0da05bfdb04dc8
git -C /home/diablo/book16/repos/bitcoin cat-file tag refs/tags/v0.3.20.2 | rg '^(tag |tagger |critical|-----BEGIN PGP)'
```

```text
tag-only 52248a757b25581339ca6e00cc0da05bfdb04dc8 2011-03-03T16:25:05-05:00 Gavin Andresen Make send/receive limits bigger (10MB each)
HEAD twin f36b494aebcfe4cc6a45003520ee7d15eeaba8df 2011-03-03T16:25:05-05:00 Gavin Andresen Make send/receive limits bigger (10MB each)
52248a757b Make send/receive limits bigger (10MB each)
 net.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
tag v0.3.20.2
tagger Gavin Andresen <gavinandresen@gmail.com> 1299250125 -0500
critical bug-fix release (block download failures due to too-small sendbuffer)
-----BEGIN PGP SIGNATURE-----
```

The two changed constants raise the receive limit from 2 MB and the send limit from 256 KB to 10 MB each. `52248a…` is not an ancestor of `HEAD`; only the release tag retains that exact object. `f36b49…` is its patch-identical mainline twin (both stable patch IDs are `7c1460fd…`). By tagger chronology, `v0.3.20.2` is also the repository’s earliest annotated tag containing an inline PGP signature; the preceding `v0.3.20` tag is unsigned.

**Why it is a story:** A release has just failed to download blocks because its defensive buffer is too small. Gavin changes two numbers, cuts a tag whose message says “critical,” and signs it. The released object later falls outside `HEAD`, while the same repair survives under another hash. Before the outcome was known, the tag—not mainline—was the object users were asked to trust.

**Reader learns:** Search `--all`, inspect tag objects, and compare patch IDs. A fix can survive on main while the signed release receipt is reachable only through a tag.

**surprise:** 5

### 2. A signed tag named `noversion` was planted four years backward

- **find-type:** 2 (planted / dated artifact)
- **hashes:** tag object `8a5c4f445d1588c0a7c30cec929ecf75648b4589`; target commit `aefbf6e30cadaf77ebee44284c74cc5449dc173f`
- **date:** tagger date 2018-03-07T15:56:30+01:00; target commit author date 2014-03-03T09:41:18+01:00
- **author/tagger:** Wladimir J. van der Laan `<laanwj@gmail.com>`
- **message:** `dummy tag for commits on master`

Exact reproduction (ten lines of output):

```sh
git -C /home/diablo/book16/repos/bitcoin rev-parse refs/tags/noversion
git -C /home/diablo/book16/repos/bitcoin describe --tags aefbf6e30cadaf77ebee44284c74cc5449dc173f^
git -C /home/diablo/book16/repos/bitcoin describe --tags aefbf6e30cadaf77ebee44284c74cc5449dc173f
git -C /home/diablo/book16/repos/bitcoin cat-file tag refs/tags/noversion | rg '^(tag |tagger |dummy|This is|relative|on master|-----BEGIN PGP)'
```

```text
8a5c4f445d1588c0a7c30cec929ecf75648b4589
v0.9.0rc2
noversion
tag noversion
tagger Wladimir J. van der Laan <laanwj@gmail.com> 1520434590 +0100
dummy tag for commits on master
This is a dummy tag so that `git describe` no longer shows everything
relative to v0.9.0rc2 just because that was the last version to be tagged
on master instead of on a branch.
-----BEGIN PGP SIGNATURE-----
```

The tag object also contains an OpenTimestamps attestation after its PGP signature. It was created in 2018 but points to a 2014 commit, `doc: Empty release notes for next release`. At the parent, `git describe` says `v0.9.0rc2`; at the target it abruptly says `noversion`.

**Why it is a story:** Release tags had moved onto maintenance branches, but `git describe` walks ancestry rather than understanding release policy. Master therefore kept describing modern work relative to a 0.9 release candidate. Four years after the chosen commit, Wladimir plants a signed non-version there to make the tool stop telling that accidental story.

**Reader learns:** A tag name is policy, not ontology. Compare a tagger date with its target’s author date, read the tag message, and never assume `git describe` reports the project’s latest release.

**surprise:** 4

### 3. SegWit and Taproot have eight commits that change nothing

- **find-type:** 2 (planted / dated artifact)
- **hashes:** SegWit `ecacfd98e657c5819a1bcb1da93b25d3ad4e5045`, `9757b57c25c67de611b8f5d0a19f409c2e8753a6`, `978e2004ad659ad216d820dbd79e212e276405f4`, `070dbc48a9338375fd7ce0a86ee05b476cf487a4`; Taproot `f8c099e2207c90d758e7a659d6a55fa7ccb7ceaa`, `450d2b23710ad296eede81339195376021ab5500`, `206fb180ec6ee5f916afc6f574000d716daf79b7`, `865d2c37e2e44678498b7f425b65e01b1e231cde`
- **date:** SegWit author dates 2016-03-31 through 2016-06-04 (committed 2016-06-22); Taproot author date 2020-09-14 (committed 2020-10-06 through 2020-10-12)
- **author:** Pieter Wuille (`pieter.wuille@gmail.com` on SegWit; `pieter@wuille.net` on Taproot)
- **messages:** four `--- [SEGWIT] begin: … ---` headings and four `--- [TAPROOT] … ---` headings

Exact reproduction (eight lines of output):

```sh
git -C /home/diablo/book16/repos/bitcoin log --all --no-merges --format='@@%H%x09%aI%x09%an%x09%s' --shortstat |
awk '/^@@/{if(seen && !stat) print rec; rec=substr($0,3); seen=1; stat=0; next} /file[s]? changed|insertion|deletion/{stat=1} END{if(seen && !stat) print rec}'
```

```text
206fb180ec6ee5f916afc6f574000d716daf79b7  2020-09-14T09:53:53-07:00  Pieter Wuille  --- [TAPROOT] Tests ---
865d2c37e2e44678498b7f425b65e01b1e231cde  2020-09-14T09:55:40-07:00  Pieter Wuille  --- [TAPROOT] Regtest activation and policy ---
450d2b23710ad296eede81339195376021ab5500  2020-09-14T09:53:42-07:00  Pieter Wuille  --- [TAPROOT] BIP340/341/342 consensus rules ---
f8c099e2207c90d758e7a659d6a55fa7ccb7ceaa  2020-09-14T09:51:36-07:00  Pieter Wuille  --- [TAPROOT] Refactors ---
070dbc48a9338375fd7ce0a86ee05b476cf487a4  2016-06-04T22:38:36+02:00  Pieter Wuille  --- [SEGWIT] begin: deployment ---
978e2004ad659ad216d820dbd79e212e276405f4  2016-03-31T14:43:46+02:00  Pieter Wuille  --- [SEGWIT] begin: tests ---
9757b57c25c67de611b8f5d0a19f409c2e8753a6  2016-03-31T14:43:39+02:00  Pieter Wuille  --- [SEGWIT] begin: wallet ---
ecacfd98e657c5819a1bcb1da93b25d3ad4e5045  2016-03-31T14:43:23+02:00  Pieter Wuille  --- [SEGWIT] begin: P2P/node/consensus ---
```

These are all of the non-merge empty commits reachable from `--all`: each tree is identical to its sole parent, so `--shortstat` emits no stat line. Four years apart, the same author uses empty objects to divide two consensus-upgrade patch stacks into reviewable chapters.

**Why it is a story:** Immediately before reviewers face consensus rules, wallet changes, tests, and deployment logic, Pieter inserts headings into the history itself. Nothing runs and no file changes, but the sequence acquires a map. Taproot repeats the device used for SegWit, turning an apparent no-op into process memory.

**Reader learns:** Empty commits are not necessarily mistakes. Audit them with tree comparisons; they can preserve review boundaries that disappear from a squashed diff or hosting UI.

**surprise:** 4

### 4. Bitcoin’s README was moved “out of the way,” then restored

- **find-type:** 4 (name disappears / appears)
- **hashes:** `a24b23622e504f5134dd8011af5bbe68cb9443f1`; `0465c41c847ddee7eeb5caefb164149400ff8395`
- **date:** 2011-07-15T15:42:02+02:00; 2011-09-18T11:55:41+02:00
- **author:** Wladimir J. van der Laan `<laanwj@gmail.com>`
- **messages:** `move README.md out of the way for now`; `move current qt specific readme to doc/, restore original README.md`

Exact reproduction (six lines of output):

```sh
git -C /home/diablo/book16/repos/bitcoin log --follow --name-status --format='%H %aI %an %s' -- README.md | rg -A2 '^(0465c41c847ddee7eeb5caefb164149400ff8395|a24b23622e504f5134dd8011af5bbe68cb9443f1)'
```

```text
0465c41c847ddee7eeb5caefb164149400ff8395 2011-09-18T11:55:41+02:00 Wladimir J. van der Laan move current qt specific readme to doc/, restore original README.md

R099  README-original.md  README.md
a24b23622e504f5134dd8011af5bbe68cb9443f1 2011-07-15T15:42:02+02:00 Wladimir J. van der Laan move README.md out of the way for now

R100  README.md  README-original.md
```

The first rename changes zero lines. Two months later, the old README returns with 99% similarity while the Qt-specific `README.rst` moves to `doc/readme-qt.rst` at 98% similarity. This follows the 2011 integration of Wladimir’s bitcoin-qt tree, but the rename trail—not the merge subject—shows the negotiation over which document owns the repository’s front door.

**Why it is a story:** The GUI and core histories have met, and both bring an account of what the project is. Wladimir temporarily gets the old one out of the way; after two months he decides the project README belongs at root and the Qt instructions belong under `doc/`. The product boundary is settled with two renames.

**Reader learns:** Run `--follow` across famous files. A temporary filename can record an organizational decision even when the content barely changes.

**surprise:** 3

### 5. One commit has a 2,484-day gap between its two Git clocks

- **find-type:** 2 (dated artifact)
- **hashes:** `095286f790acda4a32f04c77aa86106007e2a0d8`; companion with the same two timestamps `06882f84017f6b569b46a644f39b6d3c120ec6cf`; merge `65f6e7078b17e6e73d74dfeb00159878099fee1e`
- **date:** author date 2017-12-05T15:57:12-05:00; committer date 2024-09-23T15:03:04-05:00; merged to master 2024-09-25
- **author/committer:** Russell Yanofsky `<russ@yanofsky.org>` for both fields
- **message:** `multiprocess: Add serialization code for CTransaction`

Exact reproduction (six lines of output):

```sh
git -C /home/diablo/book16/repos/bitcoin show -s --format='%H%nAuthorDate: %aI%nCommitDate: %cI%nAuthor: %an <%ae>%nCommitter: %cn <%ce>%nSubject: %s' 095286f790acda4a32f04c77aa86106007e2a0d8
```

```text
095286f790acda4a32f04c77aa86106007e2a0d8
AuthorDate: 2017-12-05T15:57:12-05:00
CommitDate: 2024-09-23T15:03:04-05:00
Author: Russell Yanofsky <russ@yanofsky.org>
Committer: Russell Yanofsky <russ@yanofsky.org>
Subject: multiprocess: Add serialization code for CTransaction
```

The diff is 50 insertions and 3 deletions adding IPC serialization for transaction types. The author and committer names are identical; only the clocks split by 214,614,352 seconds. A companion serialization commit has exactly the same split, and merge `65f6e707…` lands the series two days after the committer date. Git does not prove that the patch sat unchanged for 2,484 days, only that the old author timestamp was carried forward.

**Why it is a story:** A multiprocess patch reaches the repository wearing a date from nearly seven years earlier. At the moment it lands, `%aI` makes it look ancient and `%cI` makes it current. Both are true records of different acts: originating the patch and writing this object into its accepted sequence.

**Reader learns:** Never use author date alone as “when this landed.” Compare `%aI` and `%cI`, especially on long-lived or repeatedly rebased patch series.

**surprise:** 4

Reliability verdict: Strong on object identities and substantive diffs: 10 of 12 audited claims passed.  
Two precision defects remain: dig 3 silently elides three commits from its claimed command output, and dig 2 calls EOL-equivalent outcomes the “same patch” despite unequal patch IDs.
