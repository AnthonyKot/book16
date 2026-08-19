# Independent verification and extension: swiftlang/swift

## Verification table

All report commands were rerun with the mandated absolute clone path in place of `~/book16/repos/swift`. Added probes are marked as such in the command ledger.

| dig | claim | command rerun | result | note |
|---|---|---|---|---|
| #9 | `8bde04c` has Chris Lattner as author (2017-08-07), Doug Gregor as committer (2020-07-29), the stated subject/body, and a 14-file `280+/108-` diff. | V1 | **PASS** | Hash, identities, both dates, message, and stat all match. The 1,087-day calendar gap is correct. |
| #9 | The 2017 object “sat outside `main`” for three years and the 2020 commit is simply “this cherry-pick.” | V2 | **FAIL** | The 2017 object is `323dd4a`, on `origin/asyncawait`, with a different subject and a `319+/150-` patch. `8bde04c` is a new 2020 object carrying the old author date after a non-identical port (`280+/108-`), not the literal old object and not a patch-identical cherry-pick. |
| #1 | `18844bc` is the sole root and its tree is Git's empty-tree hash. | V3 | **PASS** | Hash, 2010-07-17 date, subject, and `4b825dc...` tree all match. |
| #1 | Thirteen minutes later `afc81c1` adds nine paths and `tools/swift/swift.cpp` is an empty `main()`. | V4 | **PASS** | The timestamps differ by 13m12s; the path list and three-line stub match. |
| #1 | The r4 author address is `clattner@nondot.org` with mailmap address `clattner@apple.com`. | V5 | **FAIL** | Direction is reversed. The raw object says `clattner@apple.com`; current `.mailmap` renders it as `clattner@nondot.org`. The human name is correct. |
| #2 | `6236dea` exposes exactly the live `int` and `var` keywords, while `foreach` and sized types are comments. | V6 | **PASS** | Date, author, subject, hash, and displayed token content match. |
| #2 | `454dd86` adds the shown first `.swift` test, and `e1e3356` demotes `int` on 2010-08-04. | V7 | **PASS** | The test content and all three commits' metadata match. The demotion changes 10 files (`32+/33-`). |
| #3 | The r5 lexer blob contains a Swift.org/2014–2015 Apache header that blame assigns to Chris Lattner in 2010. | V8 | **PASS** | The claimed anachronistic text and blame attribution are exact. |
| #3 | The conversion wrote that header into “every historical blob.” | V9 | **FAIL** | This is too broad. At r4 the Makefiles have the future header, but all three tiny C++ blobs (`Lexer.cpp`, `Parser.cpp`, `swift.cpp`) do not. The r5 lexer example remains valid. |
| #3 | `LICENSE.txt` first appears at `39dcf40`, Ted Kremenek, 2015-11-02, with the stated message. | V10 | **PASS** | Hash, date, author, path-add filter, and subject match. |
| #5 | The earliest `rdar` commit is `35328c4`, described in the title as “a deleted newline.” | V11 | **FAIL** | Hash/date/author/message are correct, but the diff deletes an unterminated one-space final line (`- ` plus “No newline at end of file”), not a newline. The body later describes the trailing space more accurately. |
| #5 | The cloned `HEAD` history has 24,610 `rdar`-matching messages and its latest `rdar://` hit is the stated 2026 commit. | V12 | **PASS** | Both exact commands reproduce `24610` and the 2026-08-18 Embedded message/body. |

### Exact verification command ledger

**V1**

```sh
git -C /home/diablo/book16/repos/swift log -1 --format=fuller 8bde04cc14e19d00b805cb4ce1935dd51cfad91d
git -C /home/diablo/book16/repos/swift show --stat --format='' 8bde04cc14e19d00b805cb4ce1935dd51cfad91d | tail -5
```

**V2** (added identity/patch-origin probe)

```sh
git -C /home/diablo/book16/repos/swift log --all --format='%H %aI %cI %an %cn %s' --grep='Implement parsing and semantic analysis of await'
git -C /home/diablo/book16/repos/swift show --stat --format='%H %aI %cI %an %cn %s' 323dd4a7d5854f88db25bf0722bd912ccfb784c1 | tail -8
git -C /home/diablo/book16/repos/swift show 323dd4a7d5854f88db25bf0722bd912ccfb784c1 --pretty=format: | git -C /home/diablo/book16/repos/swift patch-id --stable
git -C /home/diablo/book16/repos/swift show 8bde04cc14e19d00b805cb4ce1935dd51cfad91d --pretty=format: | git -C /home/diablo/book16/repos/swift patch-id --stable
```

**V3**

```sh
git -C /home/diablo/book16/repos/swift log --max-parents=0 --format='%H %aI %s'
git -C /home/diablo/book16/repos/swift rev-parse 18844bc65229786b96b89a9fc7739c0fc897905e^{tree}
```

**V4**

```sh
git -C /home/diablo/book16/repos/swift ls-tree -r --name-only afc81c1855bf711315b8e5de02db138d3d487eeb
git -C /home/diablo/book16/repos/swift show afc81c1855bf711315b8e5de02db138d3d487eeb:tools/swift/swift.cpp
```

**V5** (added raw-vs-mailmapped identity probe)

```sh
git -C /home/diablo/book16/repos/swift cat-file -p afc81c1855bf711315b8e5de02db138d3d487eeb | sed -n '1,5p'
git -C /home/diablo/book16/repos/swift log -1 --format='raw: %an <%ae>%nmapped: %aN <%aE>' afc81c1855bf711315b8e5de02db138d3d487eeb
```

**V6**

```sh
git -C /home/diablo/book16/repos/swift show 6236deaabc0a9f0841a74fb7cfa5570570ecb884:include/swift/Parse/Token.h | sed -n '30,50p'
git -C /home/diablo/book16/repos/swift show -s --format='%H %aI %an <%ae> %s' 6236deaabc0a9f0841a74fb7cfa5570570ecb884
```

**V7**

```sh
git -C /home/diablo/book16/repos/swift show 454dd86c2b8e4867d237efbd7d56be883761b6ad:test/simple.swift
git -C /home/diablo/book16/repos/swift show -s --format='%H %aI %an <%ae> %s' 454dd86c2b8e4867d237efbd7d56be883761b6ad e1e335610f5f083f036e2456f9e3e531e2e72ab7
git -C /home/diablo/book16/repos/swift show --stat --oneline e1e335610f5f083f036e2456f9e3e531e2e72ab7
```

**V8**

```sh
git -C /home/diablo/book16/repos/swift show 5e88a2175579b0b2ed3c4a15fe8c2382601ac321:lib/Lex/Lexer.cpp | head -12
git -C /home/diablo/book16/repos/swift blame -L 1,6 5e88a2175579b0b2ed3c4a15fe8c2382601ac321 -- lib/Lex/Lexer.cpp
```

**V9** (added scope probe)

```sh
git -C /home/diablo/book16/repos/swift ls-tree -r --name-only afc81c1855bf711315b8e5de02db138d3d487eeb | while read p; do printf '%s ' "$p"; git -C /home/diablo/book16/repos/swift show afc81c1855bf711315b8e5de02db138d3d487eeb:"$p" | grep -q 'Swift.org open source project' && echo HEADER || echo NO_HEADER; done
```

**V10**

```sh
git -C /home/diablo/book16/repos/swift log --diff-filter=A --format='%h %aI %an %s' -- LICENSE.txt
```

**V11**

```sh
git -C /home/diablo/book16/repos/swift log --reverse --grep='rdar' --format='%h %aI %s' | head -3
git -C /home/diablo/book16/repos/swift show 35328c4921cf687d8664ec949ab80095cd4c7d29
```

**V12**

```sh
git -C /home/diablo/book16/repos/swift log --grep='rdar' --oneline | wc -l
git -C /home/diablo/book16/repos/swift log --grep='rdar://' -1 --format='%aI %s%n%b'
```

## New digs

### 1. `NewArray` becomes `Array` inside an 81,576-line commit called “Adjust test cases.”

- **find-type:** 4 (name that disappears / appears), with a large-commit `--stat` angle
- **hash:** `fad874708e05cff56aec5587a4b0f49cdadc6d11`
- **date:** 2014-05-12 22:01:52 +0000 (20 days, 17 hours before Swift's WWDC-day commit)
- **author:** Ted Kremenek `<kremenek@apple.com>`
- **message:** `Adjust test cases.` (`Swift SVN r17964`)
- **exact command:**

```sh
git -C /home/diablo/book16/repos/swift show --shortstat --format='%H%n%aI%n%an <%ae>%n%s' fad874708e05cff56aec5587a4b0f49cdadc6d11
git -C /home/diablo/book16/repos/swift show --format='' fad874708e05cff56aec5587a4b0f49cdadc6d11 -- stdlib/core/Arrays.swift.gyb | grep -E '^[-+]% for Self'
```

```text
fad874708e05cff56aec5587a4b0f49cdadc6d11
2014-05-12T22:01:52+00:00
Ted Kremenek <kremenek@apple.com>
Adjust test cases.
 921 files changed, 60288 insertions(+), 21288 deletions(-)
-% for Self in ['NativeArray', 'Slice', 'NewArray']:
+% for Self in ['NativeArray', 'Slice', 'Array']:
```

**Why it is a story.** Three weeks before the keynote, the generated standard-library template still emits a public-looking `NewArray`. Then one snapshot-sized SVN commit replaces it with `Array` while its subject says only “Adjust test cases.” The moment before the outcome is not a polished API reveal; it is a 921-file landing where the name millions will type occupies one changed list element.

**Reader learns:** follow a famous file through old names, then use `git log -S` or a focused `git show` inside suspiciously large commits. Commit subjects summarize intent badly when an SVN batch or integration landing carries an entire state change.

**surprise:** 5

### 2. In 2018, `.mailmap` changes who appears to have authored 2010

- **find-type:** 2 (a later artifact that changes the displayed past)
- **hash:** `d5bf653b4a91d3ea9558145bf2e10392c4602ba2`
- **date:** 2018-04-12 03:40:24 -0500
- **author:** Nate Cook `<natecook@apple.com>`
- **message:** `Add .mailmap file to merge email addresses in git shortlog`
- **exact command:**

```sh
git -C /home/diablo/book16/repos/swift show -s --format='%H%n%aI%n%an <%ae>%n%s' d5bf653b4a91d3ea9558145bf2e10392c4602ba2
git -C /home/diablo/book16/repos/swift show d5bf653b4a91d3ea9558145bf2e10392c4602ba2:.mailmap | grep '^Chris Lattner'
git -C /home/diablo/book16/repos/swift log -1 --format='raw:    %an <%ae>%nmapped: %aN <%aE>' afc81c1855bf711315b8e5de02db138d3d487eeb
```

```text
d5bf653b4a91d3ea9558145bf2e10392c4602ba2
2018-04-12T03:40:24-05:00
Nate Cook <natecook@apple.com>
Add .mailmap file to merge email addresses in git shortlog
Chris Lattner <clattner@nondot.org> <clattner@apple.com>
Chris Lattner <clattner@nondot.org> <lattner@users.noreply.github.com>
Chris Lattner <clattner@nondot.org> <sabre@iMac.local>
raw:    Chris Lattner <clattner@apple.com>
mapped: Chris Lattner <clattner@nondot.org>
```

**Why it is a story.** Nearly eight years after r4 and more than two years after open source, one 134-line census file makes an Apple address display as Lattner's personal address without changing the old commit object. The moment before the outcome is a shortlog split across corporate, GitHub, personal, and even `.local` identities; Nate Cook chooses which identities Git should present as canonical.

**Reader learns:** lowercase `%ae` is the raw author email and uppercase `%aE` is mailmap-aware. A present-day `.mailmap` can change the apparent authorship of every historical log and blame view, so inspect both the commit object and the mapping's own history.

**surprise:** 4

### 3. The first annotated tag is “OS X Test passed,” and none of 2,932 annotated tags carries a PGP signature

- **find-type:** 2 (dated release-engineering artifact)
- **hashes:** tag object `b6b74147ef8a386f532cf9357a1bde006e552c54`; tagged commit `f3d534543d5f7a38090713a85fa357666cd1e81b`
- **date:** 2015-11-15 17:46:55 -0800 (eighteen days before open source)
- **author/tagger:** Mishal Shah `<mishal_shah@apple.com>`
- **message:** `OS X Test passed`
- **exact command:**

```sh
git -C /home/diablo/book16/repos/swift for-each-ref refs/tags --sort=taggerdate --format='%(refname:short)|%(objecttype)|%(objectname)|%(taggerdate:iso-strict)|%(taggername)|%(subject)' | awk -F'|' '$2=="tag" && $4!=""' | head -1
git -C /home/diablo/book16/repos/swift cat-file -p refs/tags/osx-passed | sed -n '1,7p'
git -C /home/diablo/book16/repos/swift for-each-ref refs/tags --format='%(objecttype)' | sort | uniq -c
git -C /home/diablo/book16/repos/swift for-each-ref refs/tags --format='%(objecttype) %(objectname)' | awk '$1=="tag"{print $2}' | git -C /home/diablo/book16/repos/swift cat-file --batch | grep -c 'BEGIN PGP SIGNATURE' || true
```

```text
osx-passed|tag|b6b74147ef8a386f532cf9357a1bde006e552c54|2015-11-15T17:46:55-08:00|Mishal Shah|OS X Test passed
object f3d534543d5f7a38090713a85fa357666cd1e81b
type commit
tag osx-passed
tagger Mishal Shah <mishal_shah@apple.com> 1447638415 -0800
OS X Test passed
    116 commit
   2932 tag
0
```

**Why it is a story.** Before there is a public Swift release tag, there is an internal-looking green-light marker: the Mac build passed. The moment before open source is a release engineer pinning a known-good conversion state, not naming a language version. The project later accumulates thousands of annotated snapshots, but the stored tag objects contain no ASCII-armored PGP signatures.

**Reader learns:** tags have their own objects, dates, taggers, messages, and possible signatures; lightweight tags have none of those. Sort annotated tags by tagger date and inspect the raw object instead of assuming a release-looking ref is signed provenance.

**surprise:** 4

### 4. A stale remote branch preserves a zero-diff commit whose payload was CI itself

- **find-type:** 1 (zero-line diff, external blast radius)
- **hash:** `63fd0d0ea6dd9dad42444f79e4133758a18aa790`
- **date:** 2021-12-17 11:01:36 -0800
- **author:** Anders Bertelrud `<anders@apple.com>`
- **message:** `Empty commit for CI`
- **exact command:**

```sh
git -C /home/diablo/book16/repos/swift for-each-ref refs/remotes/origin/eng/anders/empty-commit-for-ci --format='%(refname) %(objectname)'
git -C /home/diablo/book16/repos/swift show -s --format='%H%n%T%n%P%n%aI%n%an <%ae>%n%s' 63fd0d0ea6dd9dad42444f79e4133758a18aa790
git -C /home/diablo/book16/repos/swift rev-parse 63fd0d0ea6dd9dad42444f79e4133758a18aa790^{tree}
if git -C /home/diablo/book16/repos/swift merge-base --is-ancestor 63fd0d0ea6dd9dad42444f79e4133758a18aa790 main; then echo on-main; else echo not-on-main; fi
```

```text
refs/remotes/origin/eng/anders/empty-commit-for-ci 63fd0d0ea6dd9dad42444f79e4133758a18aa790
63fd0d0ea6dd9dad42444f79e4133758a18aa790
22829324a357a546641e2743b5f27c5d52ab3c15
d3f803e926c1bfda1fd45d82c7b67a51f2e557c7
2021-12-17T11:01:36-08:00
Anders Bertelrud <anders@apple.com>
Empty commit for CI
22829324a357a546641e2743b5f27c5d52ab3c15
not-on-main
```

**Why it is a story.** The commit tree and its parent's tree are byte-for-byte identical; the new object exists only to make automation notice. It never enters `main`, but the remote-tracking ref survives years later. The moment before the outcome is an engineer needing a CI run and discovering that, in an event-driven system, a content-free commit can still be an effective command.

**Reader learns:** search `--all`, not only `HEAD`, and compare a candidate's tree to `commit^\{tree\}`. Stale branches retain operational history—CI triggers, experiments, “do not merge” probes—that the product DAG intentionally omits.

**surprise:** 3

### 5. Swift has an eight-parent merge: seven refactors were tied together by hand

- **find-type:** 1 (a modest first-parent diff with a seven-branch integration blast radius)
- **hash:** `b1ea839b1d712b2c4223a0df41a65f8c6badfc6d`
- **date:** 2021-07-08 17:48:06 -0700
- **author:** Evan Wilde `<ewilde@apple.com>`
- **message:** `Merge branches 'ewilde/rebranch/printHelp', 'ewilde/rebranch/vkrvalue', 'ewilde/rebranch/datalayout', 'ewilde/rebranch/withNullAsEmpty', 'ewilde/rebranch/format', 'ewilde/rebranch/collectUsedGlobals' and 'ewilde/rebranch/SILSerialization' into ewilde/swift-rebranch`
- **exact command:**

```sh
git -C /home/diablo/book16/repos/swift show -s --format='%H%n%aI%n%an <%ae>%n%s%n%P' b1ea839b1d712b2c4223a0df41a65f8c6badfc6d
git -C /home/diablo/book16/repos/swift rev-list --parents -1 b1ea839b1d712b2c4223a0df41a65f8c6badfc6d | awk '{print NF-1 " parents (one base plus " NF-2 " merged branches)"}'
git -C /home/diablo/book16/repos/swift show --stat --first-parent --format='' b1ea839b1d712b2c4223a0df41a65f8c6badfc6d | tail -1
git -C /home/diablo/book16/repos/swift log --ancestry-path --merges --reverse --format='%H %aI %s' b1ea839b1d712b2c4223a0df41a65f8c6badfc6d..main | head -2
```

```text
b1ea839b1d712b2c4223a0df41a65f8c6badfc6d
2021-07-08T17:48:06-07:00
Evan Wilde <ewilde@apple.com>
Merge branches 'ewilde/rebranch/printHelp', 'ewilde/rebranch/vkrvalue', 'ewilde/rebranch/datalayout', 'ewilde/rebranch/withNullAsEmpty', 'ewilde/rebranch/format', 'ewilde/rebranch/collectUsedGlobals' and 'ewilde/rebranch/SILSerialization' into ewilde/swift-rebranch
e29e1f4e661033fd1a7c9eeedffc4fc4557bdf46 685ebd4660350e8b89f86e8fa6065dc7811cdc86 4046f61ba9e47c86007339d9a4c43816c45ee77c 58e2f5301a20ed511a0ac2a4b2c8267145d5b22b 45f2229789a119c3131fcd90c06c7e48264f0db9 29509d16edf806553e4b308973014a71f4fda34c 5a1b0f82e1578b73fe77d547181bb8c3c0ae293c 9597eebcd9c8ddaa747bcfa6df1905625a1b5d6b
8 parents (one base plus 7 merged branches)
20 files changed, 53 insertions(+), 45 deletions(-)
727115ba0b8bb4742dce37b8b8c6e4ff8fc97e82 2021-07-09T13:20:07-07:00 Merge branch 'ewilde/rebranch/TargetInfoAdjust' into ewilde/swift-rebranch
c75d19845f5bbe16cccc07c06ff4256a6eadb3f7 2021-07-12T13:24:29-07:00 Merge pull request #38326 from etcwilde/ewilde/swift-rebranch
```

**Why it is a story.** The first-parent stat looks ordinary—20 files, 98 changed lines—but the DAG records one person deciding that seven separately prepared refactors now move as a unit. A day later another branch joins; four days after the octopus, the bundle reaches `main` through PR #38326. The moment before the outcome is a risky integration queue made explicit as width rather than flattened into one anonymous patch.

**Reader learns:** `git rev-list --all --min-parents=3` finds decisions hidden by ordinary two-parent merge views. Count parent hashes and follow `--ancestry-path`; an octopus merge is a map of parallel work and the point where its owner chose to couple the outcomes.

**surprise:** 4

Reliability: 8 of 12 audited claims pass; every cited top-dig hash exists and the central discoveries are reproducible.
Four failures are precision failures—mailmap direction, object-versus-port wording, “every blob,” and newline-versus-unterminated-space—so trust the receipts but edit the narration.
