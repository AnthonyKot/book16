# Independent verification and extension: xz

## Verification table

`PASS` means the cited object metadata and the described content are reproduced by the command. `FAIL` includes a materially misleading description or a transcript that the stated command cannot produce, even when the underlying hashes are real.

| Dig | Claim | Command rerun | Result | Note |
|---|---|---|---|---|
| #7 Landlock | `328c52da8a2bbb81307644efdb58db2c422d9ba7`, authored by Jia Tan on 2024-02-26, is titled `Build: Fix Linux Landlock feature test in Autotools and CMake builds.` and inserts a lone `.` into the CMake compile-test string. | `git -C /home/diablo/book16/repos/xz show 328c52da8a2bbb81307644efdb58db2c422d9ba7 -- CMakeLists.txt` | **PASS** | Hash, author, author date, subject, path, and the literal period all match. The report is also precise that the period is only in the CMake half. |
| #7 Landlock | `f9cf4c05edd14dedfe63833f8ccbe41b55823b00`, Lasse Collin, 2024-03-30, removes that character under the subject `CMake: Fix sabotaged Landlock sandbox check.` and body `It never enabled it.` | `git -C /home/diablo/book16/repos/xz show f9cf4c05edd14dedfe63833f8ccbe41b55823b00` | **PASS** | The one-character corrective diff and all metadata match. |
| #5 build-to-host | `4323bc3e0c1e1d2037d5e670a3bf6633e8a3031e`, Jia Tan, 2024-02-15, subject `Update m4/.gitignore.`, adds only `build-to-host.m4` to `m4/.gitignore`. | `git -C /home/diablo/book16/repos/xz show --format=fuller 4323bc3e0c1e1d2037d5e670a3bf6633e8a3031e` | **PASS** | Metadata and one-line diff match. |
| #5 build-to-host | The displayed output of the exact `-S` command is `4323bc3e`, then `e164211b`, then `2c024f60`. | `git -C /home/diablo/book16/repos/xz log --all -S 'build-to-host' --format='%h %aI %cI %an %s'` | **FAIL** | The set, dates, and subjects are right, but the command actually prints `2c024f60`, `e164211b`, `4323bc3e` (default reverse-chronological traversal). The report silently reordered its purported command output. |
| #5 build-to-host | No tracked path `m4/build-to-host.m4` exists in any reachable history; the string-changing commits are the ignore entry and two later cherry-picks. | `git -C /home/diablo/book16/repos/xz log --all -- m4/build-to-host.m4`<br>`git -C /home/diablo/book16/repos/xz log --all -S 'build-to-host' --format='%h %aI %cI %an %s'` | **PASS** | The path log is empty. The `-S` search returns only the three `.gitignore` commit objects named in the report. |
| #2 identity | The first three `--author=jiat75` results begin with `6468f7e4` (authored `jiat75`, committed by Lasse), then `1e3eb618`, then `0354d6cc` under the name Jia Tan. | `git -C /home/diablo/book16/repos/xz log --reverse --all --author='jiat75' --format='%h %aI %cI %an <%ae> %cn %s' \| head -3` | **PASS** | Hashes, author/committer split, dates, emails, and subjects match. |
| #2 AUTHORS | `692de534fae6c38f92416793addcf5f60ffe2bf6`, Lasse Collin, 2022-08-12, changes the maintainer sentence to add `and Jia Tan <jiat0218@gmail.com>`. | `git -C /home/diablo/book16/repos/xz show --stat --format=fuller 692de534fae6c38f92416793addcf5f60ffe2bf6`<br>`git -C /home/diablo/book16/repos/xz show 692de534fae6c38f92416793addcf5f60ffe2bf6 -- AUTHORS` | **PASS** | The report calls this “one token,” but the actual insertion is six whitespace-delimited tokens; that is rhetoric, not a content error. |
| #2 committer | `2fd28d2b7cec3468324a6f15eff7e73c285b1d7d` is Jia Tan's first reachable commit as committer, dated 2022-12-16, subject `CMake: Update .gitignore for CMake artifacts from in source build.` | `git -C /home/diablo/book16/repos/xz log --all --reverse --committer='Jia Tan' --format='%H %aI %cI %an <%ae> \| %cn <%ce> \| %s' \| head -8` | **PASS** | Correct, although the report's own command block did not test this claim; this supplemental command does. |
| #3 shortlog | The stated command returns 514 Jia Tan commits and 291 Lasse Collin commits. | `git -C /home/diablo/book16/repos/xz shortlog -sn --all --since=2023-01-01 --until=2024-01-01 \| head -8` | **PASS** | The numerical transcript matches exactly for that command. `master` alone is 313/164, so distinct branch/cherry-pick commit objects materially change the count. |
| #3 anchor | `3bd906f1f3d162ed8493c4b494ccbafdb613a34f`, Lasse Collin, author date 2023-04-14, says `AUTHORS was updated earlier, lzma.h was simply forgotten.` and changes the header to name Lasse Collin and Jia Tan. | `git -C /home/diablo/book16/repos/xz show 3bd906f1f3d162ed8493c4b494ccbafdb613a34f -- src/liblzma/api/lzma.h` | **PASS** | Hash, author date, subject/body, and the one-line maintainer diff all match. Its commit date is later, 2023-05-03. |
| #3 calendar label | Those 514/291 numbers are “calendar 2023” author totals. | Above, plus `git -C /home/diablo/book16/repos/xz log --all --format='%aI%x09%an' \| awk -F '\t' 'substr($1,1,4)=="2023" {n[$2]++} END{for(k in n) print n[k] "\t" k}' \| sort -nr \| head -8` | **FAIL** | Git's date limiting is by committer timestamp, while `shortlog` credits authors. The actual count of objects whose **author date** is in 2023 is Jia 526 / Lasse 319. The flip is real; “calendar 2023” is not. |
| #4 Hans/ifunc | Five commits are authored by Hans Jansen: two June ifunc checks committed by Lasse and three October CRC reorganizations committed by Jia; the `-S ifunc` sequence begins as printed. | `git -C /home/diablo/book16/repos/xz log --all --author='Hans Jansen' --format='%h %aI %cn %s'`<br>`git -C /home/diablo/book16/repos/xz log --all --reverse -S 'ifunc' --format='%h %aI %an %s' \| head -4` | **PASS** | The metadata claim is exact. Note that `%cn` in the first command displays the committer, not Hans's author name. |
| #4 identity inference | Git establishes that Hans is “a ghost” while Kelvin Lee and Maksym Vatsyk are real people with real employers. | The two commands immediately above. | **FAIL** | They establish only names, email strings, authorship metadata, five commits, and the ifunc chronology. Existence, employment, or sockpuppetry needs evidence outside this repository; the report supplies none. |
| #9 last act | `af071ef7702debef4f1d324616a0137a5001c14c` is the last reachable commit both authored and committed by Jia, with author time 01:50 and commit time 03:38 on 2024-03-26, and it removes the SECURITY.md reporting checklist. | `git -C /home/diablo/book16/repos/xz log --all --author='Jia' --committer='Jia' --format='%H %aI %cI %s' \| head -3`<br>`git -C /home/diablo/book16/repos/xz show af071ef7702debef4f1d324616a0137a5001c14c` | **PASS** | Metadata and diff match. “Would have forced a reporter” is too strong—the document requested those details—but the underlying deletion is exact. |

**Verification count: 11 PASS / 3 FAIL.**

## New digs

### 1. Both compromised-release tags carry PGP signatures—but not the tarball-only payload

- **Find-type:** 2 (dated artifact) + 7 (the tagged feature set prepared the vulnerable releases)
- **Hashes:** tag objects `ea6bc696fe047eb031b1ecc4bdbaeb6d5b01a711` (`v5.6.0`) and `1b7a78738112e2ccecf9dcef68a79ffac8a0c738` (`v5.6.1`); target commits `2d7d862e3ffa8cec4fd3fdffcd84e984a17aa429` and `fd1b975b7851e081ed6e5cf63df946cd5cbdbb94`
- **Dates:** tags 2024-02-24T16:22:06+08:00 and 2024-03-09T16:16:00+08:00
- **Author/tagger:** Jia Tan `<jiat0218@gmail.com>` (also author of both target commits)
- **Messages:** tag messages `XZ Utils 5.6.0` / `XZ Utils 5.6.1`; target subjects `Bump version and soname for 5.6.0.` / `Bump version and soname for 5.6.1.`
- **Exact command:**

```sh
for t in v5.6.0 v5.6.1; do git -C /home/diablo/book16/repos/xz for-each-ref --format='%(refname:short) tag=%(objectname) commit=%(*objectname) %(taggerdate:iso-strict) %(taggername) | %(subject)' "refs/tags/$t"; git -C /home/diablo/book16/repos/xz cat-file tag "$t" | sed -n '/^-----BEGIN PGP SIGNATURE-----$/p'; done
```

```text
v5.6.0 tag=ea6bc696fe047eb031b1ecc4bdbaeb6d5b01a711 commit=2d7d862e3ffa8cec4fd3fdffcd84e984a17aa429 2024-02-24T16:22:06+08:00 Jia Tan | XZ Utils 5.6.0
-----BEGIN PGP SIGNATURE-----
v5.6.1 tag=1b7a78738112e2ccecf9dcef68a79ffac8a0c738 commit=fd1b975b7851e081ed6e5cf63df946cd5cbdbb94 2024-03-09T16:16:00+08:00 Jia Tan | XZ Utils 5.6.1
-----BEGIN PGP SIGNATURE-----
```

- **Why it is a story:** Before anyone knew the corresponding release tarballs were poisoned, the maintainer did the reassuring Git ritual twice: version bump, annotated tag, terse release message, PGP signature. Yet the payload-bearing `build-to-host.m4` was added while making the tarball and is not in either tagged Git tree. Signature **presence** is proven here; cryptographic validity requires the public key and trust policy and is a separate question. Even a valid tag signature would authenticate the tag and target commit, not an independently altered tarball.
- **What the reader learns:** A verified Git tag answers integrity and key-possession questions about the Git object, not whether a separately built release archive matches it or is benign. In your own repo, reproducibly derive artifacts from the signed tree or sign and verify the artifacts separately, recording exactly what each signature covers.
- **Surprise:** 5

### 2. `--all` preserves a 717-line alternate future where `xz -r` disables the sandbox

- **Find-type:** 2 (dated artifact on a stale ref)
- **Hashes:** branch tip `07779fa4e2421b217b9876f480c6ac5134c24427`; sandbox commit `6b4b815b9488dc444f0bcfdab41b626f57dbd613`
- **Dates:** tip authored 2023-11-09T23:47:03+08:00, committed 2024-01-29T21:50:14+08:00; sandbox commit authored 2023-11-01T14:58:24+08:00
- **Author:** Jia Tan `<jiat0218@gmail.com>`
- **Messages:** `Tests: Add new test for xz -r, --recursive option.` / `xz: Disable sandbox when recursive mode is used.`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/xz rev-list --count master..origin/xz_recursive2
git -C /home/diablo/book16/repos/xz diff --shortstat master...origin/xz_recursive2
git -C /home/diablo/book16/repos/xz log --format='%H %aI %cI %an | %s' master..origin/xz_recursive2 | sed -n '1,4p'
```

```text
14
 17 files changed, 717 insertions(+), 55 deletions(-)
07779fa4e2421b217b9876f480c6ac5134c24427 2023-11-09T23:47:03+08:00 2024-01-29T21:50:14+08:00 Jia Tan | Tests: Add new test for xz -r, --recursive option.
7ca735f2f058bf2269450a88696c12f03567f29d 2023-11-07T13:46:43+08:00 2024-01-29T21:50:08+08:00 Jia Tan | xz: Update the man page for the -r, --recursive option.
e43178da0eb202f93a7573f2721354943668b78e 2023-11-01T15:20:25+08:00 2024-01-29T21:40:53+08:00 Jia Tan | xz: Add -r,--recursive to --help and --long-help.
6b4b815b9488dc444f0bcfdab41b626f57dbd613 2023-11-01T14:58:24+08:00 2024-01-29T21:40:53+08:00 Jia Tan | xz: Disable sandbox when recursive mode is used.
```

- **Why it is a story:** The feature never reaches `master`, so ordinary log archaeology erases it. On the stale remote branch it is almost a product: 14 commits, help, man page, directory walking, and tests. Recursive traversal cannot use the existing sandbox, and Jia writes that tradeoff explicitly months before the backdoor is discovered. This is not evidence of sabotage—the work stayed unmerged—but it is a preserved moment when convenience and confinement were being negotiated.
- **What the reader learns:** Audit `git log --all --not master`, not only merged history. Abandoned branches retain security decisions, rejected approaches, and fully built alternate futures that code search on the default branch cannot see.
- **Surprise:** 4

### 3. The only GitHub-style merge in a history of hand-made branch merges

- **Find-type:** 4 (a new committer identity appears in merge history)
- **Hash:** merge `6fd39664de47801e670a16617863196bfbde4755` (parents `78e0561dfebaa9d5e34558de537efcda890e0629` and `fc0c788469159f634f09ff23c8cef6925c91da57`)
- **Date:** 2023-01-07T00:10:50+08:00
- **Author / committer:** Jia Tan `<jiat0218@gmail.com>` / GitHub `<noreply@github.com>`
- **Message:** `Merge pull request #7 from tukaani-project/tuktest_index_hash` (`Tuktest index hash` in the body)
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/xz log --all --merges --format='%H %aI %an | %cn | %s'
git -C /home/diablo/book16/repos/xz show --shortstat --format='' 6fd39664de47801e670a16617863196bfbde4755
```

```text
6fd39664de47801e670a16617863196bfbde4755 2023-01-07T00:10:50+08:00 Jia Tan | GitHub | Merge pull request #7 from tukaani-project/tuktest_index_hash
6dd061adfd2775428b079eb03d6fd47d7c0f1ffe 2011-02-06T20:13:01+02:00 Lasse Collin | Lasse Collin | Merge commit '5fbce0b8d96dc96775aa0215e3581addc830e23d'
9d542ceebcbe40b174169c132ccfcdc720ca7089 2011-01-19T11:45:35+02:00 Lasse Collin | Lasse Collin | Merge branch 'v5.0'
4f2c69a4e3e0aee2e37b0b1671d34086e20c8ac6 2010-12-12T23:13:22+02:00 Lasse Collin | Lasse Collin | Merge branch 'v5.0'
adb89e68d43a4cadb0c215b45ef7a75737c9c3ec 2010-12-07T18:53:04+02:00 Lasse Collin | Lasse Collin | Merge branch 'v5.0'
7c24e0d1b8a2e86e9263b0d56d39621e01aed7af 2010-11-15T14:33:01+02:00 Lasse Collin | Lasse Collin | Merge branch 'v5.0'
8e355f7fdbeee6fe394eb02a28f267ce99a882a2 2010-10-26T15:53:06+03:00 Lasse Collin | Lasse Collin | Merge branch 'v5.0'
 13 files changed, 414 insertions(+), 8 deletions(-)
```

- **Why it is a story:** For twelve years, every recorded merge is Lasse merging by hand. Then Jia authors the only GitHub-style pull-request merge, with `GitHub` as committer. (GitHub is committer on eight other, non-merge commits in 2023, so the novelty is the merge form, not a one-commit identity.) The merged side began as Jia's index-hash test work and contains a run of Lasse fixups immediately before the merge: a small, visible experiment in a different collaboration workflow.
- **What the reader learns:** Author and committer are different roles. `git log --merges --format='%an | %cn'` can date a project's move between email patches, direct pushes, hosted pull requests, bots, and merge queues even when no policy document says the workflow changed.
- **Surprise:** 3

### 4. The largest non-import commit says the program is easy to crash

- **Find-type:** 8 (a whole-tree replacement of the old API world)
- **Hash:** `3b34851de1eaf358cf9268922fa0eeed8278d680`
- **Date:** 2008-08-28T22:53:15+03:00
- **Author:** Lasse Collin `<lasse.collin@tukaani.org>`
- **Message:** `Sort of garbage collection commit. :-| Many things are still broken. API has changed a lot ... so it's easy to get "internal error" or trigger assertions.`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/xz log --all --format='COMMIT %H%x09%aI%x09%an%x09%s' --numstat | awk 'BEGIN{FS="\t"} /^COMMIT /{if(h!="") print total "\t" h; h=substr($0,8); total=0; next} NF==3 && $1 ~ /^[0-9]+$/ {total+=$1+$2} END{if(h!="") print total "\t" h}' | sort -nr | head -2
git -C /home/diablo/book16/repos/xz show --shortstat --format='%H%n%aI%n%an <%ae>%n%s' 3b34851de1eaf358cf9268922fa0eeed8278d680
```

```text
42513  5d018dc03549c1ee4958364712fb0c94e1bf2741  2007-12-09T00:42:33+02:00  Lasse Collin  Imported to git.
16527  3b34851de1eaf358cf9268922fa0eeed8278d680  2008-08-28T22:53:15+03:00  Lasse Collin  Sort of garbage collection commit. :-| Many things are still broken. API has changed a lot and it will still change a little more here and there. The command line tool doesn't have all the required changes to reflect the API changes, so it's easy to get "internal error" or trigger assertions.
3b34851de1eaf358cf9268922fa0eeed8278d680
2008-08-28T22:53:15+03:00
Lasse Collin <lasse.collin@tukaani.org>
Sort of garbage collection commit. :-| Many things are still broken. API has changed a lot and it will still change a little more here and there. The command line tool doesn't have all the required changes to reflect the API changes, so it's easy to get "internal error" or trigger assertions.
 277 files changed, 9050 insertions(+), 7477 deletions(-)
```

- **Why it is a story:** Nine months after the Git import, one person replaces 16,527 textual lines across 277 files and knowingly leaves the CLI out of step with the new API. The emoticon and warning reconstruct the moment honestly: this is not a polished migration after success, but a maintainer choosing a broken intermediate state because the architecture had to move first.
- **What the reader learns:** Rank commits by churn and then read the message, excluding generated translations and the root import. The largest hand-written change often exposes how a project actually tolerates migration risk—feature flags, broken-main windows, assertions, or staged compatibility layers.
- **Surprise:** 4

### 5. Follow the logo: Jia adds it, Lasse moves it, then deletes the whole identity

- **Find-type:** 8 (rollback of the visual world)
- **Hashes:** add `31293ae7074802cc7286089a89c7b552d930c97f`; rename `93de7e751d17731315a899264f2a7239d7d2d316`; removal `12876b33c79e36d7e51e8ba6ab7162bd2129cb5b` (cherry-picked from `bfd0c7c478e93a1911b845459549ff94587b6ea2`)
- **Dates:** 2024-01-09 / 2024-01-24 / 2024-04-08
- **Authors:** Jia Tan; then Lasse Collin; then Lasse Collin
- **Messages:** `Doxygen: Added the XZ logo and copyright information.` / `Move doc/logo/xz-logo.png to "doc" and Doxygen footer to "doxygen".` / `Remove the XZ logo.`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/xz log --all --follow --format='%H %aI %an | %s' -- doc/xz-logo.png
git -C /home/diablo/book16/repos/xz show --shortstat --format='%H %aI %an | %s' 12876b33c79e36d7e51e8ba6ab7162bd2129cb5b
```

```text
12876b33c79e36d7e51e8ba6ab7162bd2129cb5b 2024-04-08T19:22:26+03:00 Lasse Collin | Remove the XZ logo.
bfd0c7c478e93a1911b845459549ff94587b6ea2 2024-04-08T19:22:26+03:00 Lasse Collin | Remove the XZ logo.
93de7e751d17731315a899264f2a7239d7d2d316 2024-01-24T20:00:57+02:00 Lasse Collin | Move doc/logo/xz-logo.png to "doc" and Doxygen footer to "doxygen".
31293ae7074802cc7286089a89c7b552d930c97f 2024-01-09T16:40:56+08:00 Jia Tan | Doxygen: Added the XZ logo and copyright information.
12876b33c79e36d7e51e8ba6ab7162bd2129cb5b 2024-04-08T19:22:26+03:00 Lasse Collin | Remove the XZ logo.
 7 files changed, 3 insertions(+), 452 deletions(-)
```

- **Why it is a story:** In January, Jia supplies a 6,771-byte logo and custom documentation footer; Lasse tidies their locations in the next commit. On April 8, during the first recovery work after discovery, Lasse deletes the image, footer, distribution entries, and the logo's 427-line license. The rollback is social as well as technical: a three-month-old visual identity is removed from the recovered project.
- **What the reader learns:** Binary assets disappear from ordinary `-p` output, and renames break naive path logs. Use `--follow` plus `--stat` on logos, certificates, generated fixtures, and policy files; “branding” commits can mark changes in ownership and can be rolled back with the code.
- **Surprise:** 4

Angles checked without promoting them to digs: there is no `.mailmap`, no git note, and no octopus merge reachable from `--all`; absence alone did not carry enough story.

## Verdict on the first report

Strong primary-source instincts and an excellent ranked #1, with 11 checked claims reproduced exactly.
Reliability is good but not publication-ready: 3 claims fail through a reordered transcript, a committer-date/author-date conflation, and an unsupported identity inference.
