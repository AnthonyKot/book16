# bitcoin/bitcoin — scout

- **repo:** https://github.com/bitcoin/bitcoin
- **clone:** `/home/diablo/book16/repos/bitcoin` (full history, not `--depth`)
- **clone size:** 383M working tree; 327M `.git`
- **history span:** 2009-08-30 → 2026-08-18 (author dates)
- **commits:** 50,203 on `HEAD`; 55,138 `--all`
- **first commit:** `4405b78d6059e536c36974088a8ed4d9f0f29898` 2009-08-30T03:46:39Z sirius-m — `First commit`
- **last commit (at scout):** `b88bffe550a3a017440aff6a189cdb5f79f9b060` 2026-08-18T18:19:36+02:00 merge-script — `Merge bitcoin/bitcoin#36010: test: Print os exit code on failure`
- **roots on HEAD:** 10 (two 2009 “First commit” twins, Wladimir’s 2011 bitcoin-qt `initial commit`, plus 7 later subtree-squash roots)

```
git -C ~/book16/repos/bitcoin rev-list --count HEAD
# 50203
git -C ~/book16/repos/bitcoin log --reverse --format='%H %aI %an %s' | head -1
# 4405b78d6059e536c36974088a8ed4d9f0f29898 2009-08-30T03:46:39+00:00 sirius-m First commit
git -C ~/book16/repos/bitcoin log -1 --format='%H %aI %an %s'
# b88bffe550a3a017440aff6a189cdb5f79f9b060 2026-08-18T18:19:36+02:00 merge-script Merge bitcoin/bitcoin#36010: ...
```

The git history does not begin in January 2009. It begins as a SourceForge SVN dump, imported twice, then lived in as a GitHub repo. Every famous early commit exists in at least two hashes.

---

## 1. Day one is Martti at 03:46, with DLLs, not Satoshi

- **find-type:** 3 (first commit)
- **hash:** `4405b78d6059e536c36974088a8ed4d9f0f29898` (clean twin); `e071a3f6c06f41068ad17134189a4ac3073ef76b` (git-svn twin, same tree)
- **date:** 2009-08-30T03:46:39Z
- **author:** sirius-m `<sirius-m@1a98c847-1fd6-4fd8-948a-caf3550aa51b>`
- **message:** `First commit`

```
git -C ~/book16/repos/bitcoin log --reverse --format=fuller | head -22
```

```
commit 4405b78d6059e536c36974088a8ed4d9f0f29898
Author:     sirius-m <sirius-m@1a98c847-1fd6-4fd8-948a-caf3550aa51b>
AuthorDate: Sun Aug 30 03:46:39 2009 +0000
    First commit

commit e071a3f6c06f41068ad17134189a4ac3073ef76b
Author:     sirius-m <sirius-m@1a98c847-1fd6-4fd8-948a-caf3550aa51b>
AuthorDate: Sun Aug 30 03:46:39 2009 +0000
    First commit
    git-svn-id: https://bitcoin.svn.sourceforge.net/svnroot/bitcoin/trunk@1 1a98c847-1fd6-4fd8-948a-caf3550aa51b
```

Same tree (`1e8dec58f70505a3dd554918ce9b07384d047415`). 45 files, +32,239 lines. `readme.txt` says `BitCoin v0.1.5 ALPHA` and `Copyright (c) 2009 Satoshi Nakamoto`. `main.cpp` already hard-codes the Times headline. Two Windows binaries ride along: `libeay32.dll` (1,306,630 bytes) and `mingwm10.dll` (11,673 bytes). Seventeen days later sirius-m deletes them: `e00d4805d71de8bb32c9af600f5bd8fce2414d5d` — `No dll's here`.

**Why it is a story:** On the morning this repo begins, Bitcoin has already been running for eight months. The person who types “First commit” is Martti Malmi, importing what he has onto SourceForge SVN at 03:46 UTC. The genesis newspaper line is already a fossil, not an event. The author email is an SVN UUID. Anyone who clones bitcoin/bitcoin looking for Satoshi’s January 3rd keystroke will not find it.

**Reader learns:** Day-one of the clone is day-one of *this VCS*, not of the project. Imported history starts wherever the importer was standing.

**surprise:** 3

---

## 2. The author named `--author=Satoshi Nakamoto`

- **find-type:** 2 (planted / faked artifact)
- **hashes:** 8 commits, all committer Gavin Andresen, late July 2010; first `9f35575ca34eb15b20d1d5374b56ac9d4c8cc2bf`, last `e1cb7ce0177de72b00e06dc4c8fe1d414723a9e7`
- **date:** 2010-07-27 → 2010-07-31
- **author:** `--author=Satoshi Nakamoto <satoshin@gmx.com>`
- **message (example):** `simplified makefile.unix, updated build-unix.txt instructions to include boost 1.37`

```
git -C ~/book16/repos/bitcoin log --all --author='--author' --format='%H %aI %an <%ae> committer=%cn %s'
```

```
e1cb7ce0177de72b00e06dc4c8fe1d414723a9e7 2010-07-31T14:14:41+00:00 --author=Satoshi Nakamoto <satoshin@gmx.com> committer=Gavin Andresen simplified makefile.unix, ...
a75560d828464c3f1138f52cf247e956fc8f937d 2010-07-30T17:36:06+00:00 --author=Satoshi Nakamoto <satoshin@gmx.com> committer=Gavin Andresen reverted makefile.unix wx-config -- version 0.3.6
ec82517c8919f9cb7194511dc322a2575745e39e 2010-07-30T17:35:17+00:00 --author=Satoshi Nakamoto <satoshin@gmx.com> committer=Gavin Andresen Fredrik Roubert: simplified makefile.unix with wx-config, misc
...
9f35575ca34eb15b20d1d5374b56ac9d4c8cc2bf 2010-07-27T14:21:02+00:00 --author=Satoshi Nakamoto <satoshin@gmx.com> committer=Gavin Andresen tcatm's cached SHA256 state idea, ...
```

`git shortlog -sne --all` lists a real person:

```
     8 --author=Satoshi Nakamoto <satoshin@gmx.com>
    26 Satoshi Nakamoto <satoshin@gmx.com>
   245 s_nakamoto <s_nakamoto@1a98c847-1fd6-4fd8-948a-caf3550aa51b>
```

The same patch exists correctly on the SVN line as `01bed1828b9ee64b9b38a7d0345c775de40fdd91` by `s_nakamoto`. Gavin is re-applying Satoshi’s SVN commits onto a GitHub copy and feeding `--author=` a string that already contained `--author=`.

**Why it is a story:** For a few days in July 2010 the man inheriting the repository is trying to preserve Satoshi’s name on Satoshi’s work. The shell wins. Eight commits go into history under a flag instead of a person. The objects were never rewritten. Sixteen years later `shortlog` still ranks `--author=Satoshi Nakamoto` as a contributor.

**Reader learns:** `git commit --author="$X"` is not a label you can peel off later. A quoting bug becomes a permanent identity.

**surprise:** 5

---

## 3. Overflow Sunday: wrong block, then 19 lines, then a rollback of the chain

- **find-type:** 1 (tiny diff, huge blast radius) + 8 (rollback of the world)
- **hashes / timeline (2010-08-15, UTC):**
  - `2d12315c94f12d62b2f2aa39e63511a2042fe55d` 20:28:01 Gavin Andresen — `Quick fix: bad block 74,652` (main.h +6)
  - `d4c6b90ca3f9b47adb1b2724a0c3514f80635c84` 21:35:24 s_nakamoto — `fix for block 74638 overflow output transaction` (SVN @132; +19 −2)
  - `85de7d7c0cbb1e9aa311606644b697674c84f6f9` 22:21:03 s_nakamoto — `scanback check to prevent adding to the 74638 overflow chain` (SVN @133)
  - `76793dc969f5ee9feadb6827845c1682b11914a6` 23:09:29 author Satoshi Nakamoto `<satoshin@gmx.com>`, committer Gavin — same fix on the GitHub line

```
git -C ~/book16/repos/bitcoin log --all --since='2010-08-15' --until='2010-08-16' --format='%H %aI %an %s'
```

```
76793dc969f5ee9feadb6827845c1682b11914a6 2010-08-15T23:09:29+00:00 Satoshi Nakamoto fix for block 74638 overflow output transaction
85de7d7c0cbb1e9aa311606644b697674c84f6f9 2010-08-15T22:21:03+00:00 s_nakamoto scanback check to prevent adding to the 74638 overflow chain
d4c6b90ca3f9b47adb1b2724a0c3514f80635c84 2010-08-15T21:35:24+00:00 s_nakamoto fix for block 74638 overflow output transaction
2d12315c94f12d62b2f2aa39e63511a2042fe55d 2010-08-15T20:28:01+00:00 Gavin Andresen Quick fix: bad block 74,652
```

Gavin’s whole patch is six lines in `main.h`: reject `txout.nValue > 21000000*COIN`, and `continue` past over-max outputs in `GetValueOut()`. He names the wrong height (74,652 vs 74,638). Satoshi, 67 minutes later, introduces `MAX_MONEY`, checks the *sum* as well as each output, checks inputs in `ConnectInputs`, and bumps `VERSION` 309 → 310. Forty-six minutes after that he hard-codes a scanback: any chain that still contains hash `0000000000790ab3…` at height 74638 is rejected.

**Why it is a story:** Someone has just printed 184 billion bitcoin in one transaction. Gavin is already in the repo (he arrived a month earlier). He ships the first patch he can type. It is the wrong block number and it does not close the overflow on the running sum. Satoshi’s follow-up is still only 19 lines, but it is the 21-million cap becoming consensus, and then a one-off hash check that tells every node: that chain is not the world anymore.

**Reader learns:** The first patch during an incident is a timestamp of panic, not of correctness. The durable rule (`MAX_MONEY`) and the one-off amputation (scanback of a specific hash) are different kinds of commit; both ship the same night.

**surprise:** 3

---

## 4. Satoshi’s last object is an IRC IP lookup

- **find-type:** 4 (name that disappears)
- **hash:** `629e37dde1fa93f6ce31544d1ebb5ee5c19052cb`
- **date:** 2010-12-15T22:43:51Z
- **author:** s_nakamoto `<s_nakamoto@1a98c847-1fd6-4fd8-948a-caf3550aa51b>`
- **message:** `get external ip from irc` (`git-svn-id: .../trunk@202`)

```
git -C ~/book16/repos/bitcoin log --all --author='nakamoto' --format='%H %aI %an %s' | head -3
git -C ~/book16/repos/bitcoin show --stat --format=fuller 629e37dde1fa93f6ce31544d1ebb5ee5c19052cb
```

```
629e37dde1fa93f6ce31544d1ebb5ee5c19052cb 2010-12-15T22:43:51+00:00 s_nakamoto get external ip from irc
fc73ad644f0b87b91f49b7f6f6b2348f78bdbbf4 2010-12-13T16:26:14+00:00 s_nakamoto -- version 0.3.19 release
...
    get external ip from irc
    git-svn-id: https://bitcoin.svn.sourceforge.net/svnroot/bitcoin/trunk@202 ...
 irc.cpp     | 10 +++++++---
 net.cpp     | 49 +++++++++++++++++++++++++++++++++++++------------
 5 files changed, 48 insertions(+), 16 deletions(-)
```

245 commits match `nakamoto`. The next morning, 2010-12-16T01:06:03Z, Gavin is already committing `New RPC command: listaccounts`. There is no goodbye. The last Satoshi object is NAT traversal via the same IRC network the first commit used to find peers.

**Why it is a story:** The name that founded the project exits on a networking chore. The successor does not wait for a ceremony; he commits two hours later. From the git log you cannot tell this is the last one until you notice there is no next one.

**Reader learns:** Disappearances in git are silent. `log --author=` plus a date cliff is the whole obituary.

**surprise:** 2

---

## 5. The inheritor arrives as `Fix CRLF`

- **find-type:** 4 (name that appears)
- **hash:** `8bd66202c324a6c7a79abc0f1f0558dacbc59460`
- **date:** 2010-07-14T15:54:31Z
- **author:** Gavin Andresen `<gavinandresen@gmail.com>`
- **message:** `Fix CRLF`

```
git -C ~/book16/repos/bitcoin log --all --author='Gavin' --reverse --format='%H %aI %an %s' | head -3
git -C ~/book16/repos/bitcoin show --stat --format=fuller 8bd66202c324a6c7a79abc0f1f0558dacbc59460 | head -16
```

```
8bd66202c324a6c7a79abc0f1f0558dacbc59460 2010-07-14T15:54:31+00:00 Gavin Andresen Fix CRLF
9d2174b6f5f3fac2463c7ebc2dbb9004b3740d23 2010-07-19T01:02:04+00:00 Gavin Andresen version 0.3.1 rc1
...
    Fix CRLF
 base58.h                           |   402 +-
 bignum.h                           |  1050 +--
 ...
```

This commit sits on the *cleaned* lineage (`4405b78` is an ancestor; the git-svn twin `e071a3f` is not). Gavin’s GitHub copy is already a parallel history. Five weeks later he is the first person to commit a patch for the overflow. By 2011 `shortlog` has him second to Wladimir; by 2016 his only commit that year is a unit test someone else commits (`e2a30bc9`, author 2016-02-03, committer Patrick Strateman 2016-04-19).

**Why it is a story:** The person who will run Bitcoin Core for the next half-decade enters by converting line endings so the new git repo is usable on Unix. Not a design doc. Not a manifesto. CRLF. The later Gavin — overflow night, SVN merges, lead — is the same author string.

**Reader learns:** The first commit from a future maintainer is often janitorial. Watch names, not subject lines, for a handover starting.

**surprise:** 4

---

## 6. Two complete early histories, 99 shared trees

- **find-type:** 2 (planted / dated / imported artifact)
- **hashes:** first merge of the two lines `2742fdfda266162e507b94f2a748b4bebc246b19`
- **date:** 2010-09-02T13:42:31-04:00
- **author:** Gavin Andresen
- **message:** `Merge remote branch 'remotes/svn/trunk' into svn`

```
git -C ~/book16/repos/bitcoin log --until=2011-01-01 --format='%T' | sort | uniq -c | awk '$1>1{n++} END{print n}'
# 99
git -C ~/book16/repos/bitcoin log --merges --reverse --format='%H %aI %an %P %s' | head -1
```

```
2742fdfda266162e507b94f2a748b4bebc246b19 2010-09-02T13:42:31-04:00 Gavin Andresen 343328c6b8 0a61b0df12 Merge remote branch 'remotes/svn/trunk' into svn
```

Parents: `343328c6` Satoshi Nakamoto `added -testsafemode switch` (GitHub-style name) and `0a61b0df` s_nakamoto `propset svn:eol-style native` (SVN). 202 commits carry a `git-svn-id` footer (last one 2010-12-17, already Gavin). After that the SourceForge UUID email is gone.

**Why it is a story:** For a year the project is being written in SVN while Gavin keeps a GitHub mirror by cherry-picking and merging `svn/trunk`. Every early decision therefore has two object IDs, two author spellings (`s_nakamoto` vs `Satoshi Nakamoto` vs `--author=Satoshi Nakamoto`), and two clocks. Folklore that cites “the” overflow hash has to pick a lineage.

**Reader learns:** A git-svn import plus a live GitHub copy is not a conversion. It is a second project that later swallows the first. Cite hashes, and say which line you mean.

**surprise:** 4

---

## 7. At 04:03 Satoshi deletes the marketplace

- **find-type:** 8 (rollback of a world that never shipped) / 3 (day-one feature gone)
- **hash:** `cc4b78d59f566ff43881f57797a16ce45eb1b80e`
- **date:** 2010-02-15T04:03:07Z
- **author:** s_nakamoto
- **message:** `strip out unfinished product, review and market stuff, enable _() instead of wxT() ...`

```
git -C ~/book16/repos/bitcoin show --stat --format=fuller cc4b78d59f566ff43881f57797a16ce45eb1b80e | head -28
```

```
AuthorDate: Mon Feb 15 04:03:07 2010 +0000
    strip out unfinished product, review and market stuff,
    enable _() instead of wxT() in uiproject.fbp so it uses wxGetTranslation ...
 market.cpp          |  264 ---
 market.h            |  182 --
 ui.cpp              |  930 +--------
 uiproject.fbp       | 5805 +--------------------------------------------------
 18 files changed, 127 insertions(+), 8464 deletions(-)
```

`market.cpp` / `market.h` arrived in the 03:46 “First commit” (264 + 182 lines of an in-client product/review market). Five and a half months later, still before Gavin exists in this repo, Satoshi cuts them out at 4 a.m. with the rest of the unfinished wx “product” UI.

**Why it is a story:** The original client was not only money. It had a bazaar sketched in the same files as the block chain. Satoshi decides, before the first non-Martti collaborator lands, that this is not the product. The deletion is larger than most features the project will add that year. After this commit, Bitcoin is a currency client.

**Reader learns:** “What was this repo originally?” is often answered by a deletion, not an addition. `git log --diff-filter=D` on day-one filenames is the tour.

**surprise:** 4

---

## 8. The alert system: a kill switch born ten days after the overflow

- **find-type:** 7 (feature that became the vulnerability — here, a vulnerability that became a feature, later removed as one)
- **hash:** `401926283a200994ecd7df8eae8ced8e0b067c46`
- **date:** 2010-08-25T00:05:37Z
- **author:** s_nakamoto
- **message:** `alert system -- version 0.3.11` (SVN @142)

```
git -C ~/book16/repos/bitcoin show --stat --format=fuller 401926283a200994ecd7df8eae8ced8e0b067c46 | head -22
```

```
AuthorDate: Wed Aug 25 00:05:37 2010 +0000
    alert system
    -- version 0.3.11
    git-svn-id: https://bitcoin.svn.sourceforge.net/svnroot/bitcoin/trunk@142 ...
 8 files changed, 409 insertions(+), 86 deletions(-)
```

Shipped at five minutes past midnight, ten days after block 74638. Signed network messages that could freeze RPC and warn every node. Removed in 2016 (`29b2be6ad7898fcb871f6febbd45d0c7940398cd` Merge #7692, BtcDrak) after the key became a single point of failure the project no longer wanted.

**Why it is a story:** The overflow taught Satoshi that a bad block can happen faster than a release. The response is not only `MAX_MONEY`; it is a master key. For six years that key is part of consensus-adjacent reality. Then the same project decides the key *is* the incident, and deletes it.

**Reader learns:** Emergency features outlive the emergency. Schedule their retirement in the same breath you add them; the git log will not do it for you.

**surprise:** 3

---

## 9. `false` → `true`: a “crash bug” that printed coins

- **find-type:** 1 (tiny diff) + 7 (feature that became the vulnerability)
- **hashes:**
  - `eecffe50efc3944d713c701fa375dacbf17fb7cf` 2016-11-01 Matt Corallo — `Remove redundant duplicate-input check from CheckTransaction` (merged as #9049)
  - `b8f801964f59586508ea8da6cf3decd76bc0e571` 2018-09-17 Suhas Daftuar — `Fix crash bug with duplicate inputs within a transaction` (`src/validation.cpp` +1 −1)
- **CVE:** CVE-2018-17144 (the comment citing it is added later: `38bfca6bb2` 2018-11-10)

```
git -C ~/book16/repos/bitcoin show --stat --format=fuller b8f801964f59586508ea8da6cf3decd76bc0e571
git -C ~/book16/repos/bitcoin show b8f801964f59586508ea8da6cf3decd76bc0e571 -- src/validation.cpp
```

```
    Fix crash bug with duplicate inputs within a transaction
    Introduced by #9049
 src/validation.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
-        if (!CheckTransaction(*tx, state, false))
+        if (!CheckTransaction(*tx, state, true))
```

The 2016 change made the duplicate-input check skippable and then skipped it in `CheckBlock` because “this check is slow.” The 2018 fix flips the boolean. The subject line says crash. An unpatched 0.14/0.15 node would also accept an inflation transaction.

**Why it is a story:** Someone deletes a check they can prove is duplicated, and they are right — until a later caller stops being a caller. Two years of released binaries carry `false`. The repair is one token. The commit message still cannot say “inflation” on the day it ships.

**Reader learns:** “Redundant” is a claim about today’s call graph. A default argument of `true` with one `false` at the consensus gate is a loaded gun. The smallest diffs in validation are the ones to read twice.

**surprise:** 4

---

## 10. Names appearing and disappearing

- **find-type:** 4
- **hashes:** see windows below (no single commit)

```
git -C ~/book16/repos/bitcoin shortlog -sn --after='2009-01-01' --before='2010-01-01' HEAD | head
git -C ~/book16/repos/bitcoin shortlog -sn --after='2010-01-01' --before='2011-01-01' HEAD | head
git -C ~/book16/repos/bitcoin shortlog -sn --after='2011-01-01' --before='2012-01-01' HEAD | head
git -C ~/book16/repos/bitcoin shortlog -sn --after='2014-01-01' --before='2015-01-01' HEAD | head
git -C ~/book16/repos/bitcoin shortlog -sn --after='2024-01-01' --before='2025-01-01' HEAD | head
```

```
2009    56 s_nakamoto     24 sirius-m
2010   189 s_nakamoto     58 Gavin Andresen   26 Satoshi Nakamoto   8 --author=Satoshi Nakamoto
2011   390 Wladimir J. van der Laan   293 Gavin Andresen   131 Jeff Garzik
2014  1181 Wladimir                     255 Pieter Wuille    111 Gavin
2024   459 merge-script   454 Ava Chow   396 fanquake
```

sirius-m’s last commit is 2010-02-04 (`082e725b` IPC / `-blockamount`). s_nakamoto’s last is 2010-12-15. Gavin’s 2016 remainder is one test. Wladimir’s bitcoin-qt tree enters as its own root `aaa1c3c4001d4931299d674ef4146d8201dae634` (`initial commit`, 2011-05-07) and is glued on with `69d605f410c83235aa7b757445e7d0166fcfe2d9` (`integration of core bitcoin`, 2011-05-14). By 2024 the top “author” is `merge-script`.

**Why it is a story:** Lead is visible in `shortlog` only as a shape: a name dominates, then doesn’t. The GUI that users think of as “Bitcoin” begins as a second repository with its own `initial commit`, then is merged in. The current top author is a robot.

**Reader learns:** `shortlog -sn` over calendar windows is the org chart git will actually give you. A second root is a product merger, not a first commit.

**surprise:** 2

---

## 11. A comment that still talks about the next overflow

- **find-type:** 5 (comment that outlived / memorializes the code’s scar)
- **hash:** `0bb43854c7cb77d25d0ee33ed4263659a031dac7`
- **date:** 2015-05-27T21:02:04-04:00
- **author:** Peter Todd
- **message:** `Improve comment explaining purpose of MAX_MONEY constant`

```
git -C ~/book16/repos/bitcoin blame -L 17,26 HEAD -- src/consensus/amount.h
```

```
0bb43854c7c src/amount.h (Peter Todd 2015-05-27 ...)  No amount larger than this (in satoshi) is valid.
...
0bb43854c7c ... rather a sanity check. As this sanity check is used by consensus-critical
0bb43854c7c ... validation code, the exact value of the MAX_MONEY constant is consensus
0bb43854c7c ... critical; in unusual circumstances like a(nother) overflow bug that allowed
0bb43854c7c ... for the creation of coins out of thin air modification could lead to a fork.
fab74a0e922 ... (MarcoFalke 2026-08-04) inline constexpr CAmount MAX_MONEY{21'000'000 * COIN};
```

The constant itself is Satoshi’s 2010-08-15 line, moved. The comment, still on HEAD in 2026, is Todd in 2015 saying out loud: if you “fix” 21 million, you fork, because we already lived through coins from thin air.

**Why it is a story:** Five years after overflow Sunday, someone writes the museum placard on the constant. Eleven years after that, the placard is still the first thing `blame` shows. The code was refactored (`constexpr`, digit separators); the warning was not.

**Reader learns:** The comment next to a magic number is sometimes the only surviving incident report. Do not “clean it up” because the prose is long.

**surprise:** 2

---

## Ranked top 3

1. **`--author=Satoshi Nakamoto` is a real `git log --author` hit** (dig 2). Eight objects, never rewritten. The handover from Satoshi to Gavin left a quoting error as a contributor.
2. **Overflow Sunday, three commits in two hours** (dig 3). Gavin’s six-line wrong-block panic, Satoshi’s 19-line `MAX_MONEY`, then a hash-level amputation of chain 74638.
3. **`CheckTransaction(..., false)` → `true`** (dig 9). 2016 “redundant” check; 2018 one-token “crash bug” that was also inflation.

**Disappointing:** `git log --grep revert/oops/hack` in this repo is fifteen years of CI, depends, and warning-flag flip-flops — no revert *war* worth a chapter — and the genesis Times headline is already in commit 1, so there is no “when was it planted” mystery left to dig.
