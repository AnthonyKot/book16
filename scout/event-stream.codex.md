# Independent scout: event-stream verification and extensions

## Verification table

I treated the ranked tie (`#2 / #6`) as two digs, so the ranked material checked is #8, #7, #2, and #6. `PASS` means the repository reproduces the factual claim, not that every narrative inference about npm or ownership can be proved from this clone alone.

| Dig | Claim | Command rerun | Result | Note |
|---|---|---|---|---|
| #8 | `908fee5c65d4eb02809a84a1ebc3e5df1f935cd1`, 2018-09-16T11:14:19Z, 北川, `add filter and rewrite flatmap`, removes the external require/export and adds local filter/flatmap code. | `git -C ~/book16/repos/event-stream show 908fee5c65d4eb02809a84a1ebc3e5df1f935cd1 -- index.js \| head -40` | **PASS** | Hash, metadata, and removals match. Subtle presentation issue: the literal `head -40` output ends partway through `filterSync`; the report's displayed `flatmapSync` line is a later excerpt, not literal output from that pipeline. The underlying diff does contain it. |
| #8 | `2bd63d58fe24367372690c29c7249ed1c7145601`, `update package.json`, changes 3.3.6 to 4.0.0 and drops `flatmap-stream`. | `git -C ~/book16/repos/event-stream show 2bd63d58fe24367372690c29c7249ed1c7145601 -- package.json` | **PASS** | Exact hash, author/date/message, and both claimed diff lines match. |
| #8 | Tag `4.0.0` points at README commit `8bc742b`, while `4.0.1` points at HEAD. | `git -C ~/book16/repos/event-stream for-each-ref --format='%(refname:short) %(creatordate:iso-strict) %(objectname:short) %(subject)' refs/tags \| tail -5` | **PASS** | Output matches. Both 4.x tags are lightweight refs, a distinction the first report does not mention. |
| #8 | The three commits occur 119 seconds and 114 seconds apart. | Same three exact commands above, plus `git -C ~/book16/repos/event-stream show -s --format='%H %aI %an %s' 908fee5 2bd63d5 8bc742b` | **PASS** | 11:14:19 → 11:16:18 = 119 s; → 11:18:12 = 114 s. All are authored and committed by 北川. |
| #7 | Pickaxe finds introduction, rewrite, and package removal at the stated hashes; `e316336` adds two source lines and the dependency. | `git -C ~/book16/repos/event-stream log -S 'flatmap-stream' --all --format='%h %aI %an %s'`<br>`git -C ~/book16/repos/event-stream show e3163361fed01384c986b9b4c18feb1fc42b8285 -- index.js package.json` | **PASS** | The three hashes and complete source/package diff agree. Full stat is 26 insertions, 1 deletion across four files, including the test and lockfile. |
| #7 | `5999958dfc1b0a80e6caeac4cdc76b3b828bdfe2` is the 3.3.6 bump 573 seconds later. | `git -C ~/book16/repos/event-stream log -1 --format='%h %d %s' 5999958dfc1b0a80e6caeac4cdc76b3b828bdfe2` | **PASS** | `e316336` is 08:07:49 and `5999958` is 08:17:22: exactly 573 seconds. The bump is two changed version lines in `package.json` and the lockfile. |
| #7 | There is no tag named `3.3.6`. | Same `log -1` command, and `git -C ~/book16/repos/event-stream tag --list '3.3.6'` | **PASS** | Decoration is blank and the exact-name tag query is empty. Later tags `4.0.0` and `4.0.1` contain the commit; that is different from a `3.3.6` release tag. |
| #2 | The four top-of-file filter/reduce comments trace to `c8f0d36e69fd3ba0716693bcb0337a765d9f54a2`. | `git -C ~/book16/repos/event-stream blame -L 1,6 index.js` | **PASS** | Lines 1, 3, 4, and 5 are exactly Dominic's 2011-08-21 lines; blank lines have later/adjacent provenance as shown. |
| #2 | The displayed `git log -S 'es.filter'` transcript and “first (and only) `es.filter*` in the log” description are exact. | `git -C ~/book16/repos/event-stream log -S 'es.filter' --all --format='%h %aI %an %s'` | **FAIL** | The exact command prints `28e1472` first and `908fee5` second, opposite the report's transcript, and it finds two commits rather than one. Charitably, `908fee5` is the first implementation while `28e1472` is a later example; the report should say that. |
| #2 | `c8f0d36` adds five index lines, changes package metadata, and deletes the 21-line manifesto. | `git -C ~/book16/repos/event-stream show --stat c8f0d36e69fd3ba0716693bcb0337a765d9f54a2` | **PASS** | Exact result: 3 files, 6 insertions, 22 deletions; `readme.markdown` is 21 deletions and `index.js` is 5 additions. |
| #6 | There were nine/twelve commits before `add flat map`, amounting to a “helpful fortnight.” | `git -C ~/book16/repos/event-stream log --author='北川' --reverse --format='%h %aI %s' \| head -9` | **FAIL** | There are **eight** commits before the payload; the ninth printed row is `e316336 add flat map` itself. They span Sep 4–9, about five days, not a fortnight. The header's “twelve commits ... before the payload,” its “nine commits before,” and the ranked summary's “fortnight” are mutually inconsistent. |
| #6 | `a74c9b2` creates a 592-line lockfile, broadly caret-upgrades dependencies, but changes `map-stream` from `~0.1.0` to the lower exact `0.0.7`. | `git -C ~/book16/repos/event-stream show --stat a74c9b2ab433c4e36089fbb72931f6b786b550f5` (plus the same `git show` restricted to `package.json`) | **PASS** | Stat is 604 insertions/12 deletions; the surprising `map-stream` downgrade/pin is exact. |
| #6 | `0f3738c93486df2c44ce3e582e2c85d0414fa527` is a one-line `es.collect =` alias. | `git -C ~/book16/repos/event-stream show 0f3738c93486df2c44ce3e582e2c85d0414fa527` | **PASS** | Hash, 2018-09-09T07:15:41Z date, author, message, and one added line match. |
| overview | `HEAD` and `--all` both contain 322 commits; no stale topic branch is retained. | `git -C ~/book16/repos/event-stream show-ref`<br>`git -C ~/book16/repos/event-stream rev-list --all --count`<br>`git -C ~/book16/repos/event-stream rev-list HEAD --count` | **PASS** | Both counts are 322. Refs are only local/remote `master`, `origin/HEAD`, and 13 tags; `git fsck --full --no-reflogs` finds no unreachable object. |
| #5 / overview | All sixteen 2018 commits are both authored and committed by 北川. | `git -C ~/book16/repos/event-stream log --since=2018-01-01 --format='%an <%ae> \| %cn <%ce>' \| sort \| uniq -c` | **PASS** | Single output row: `16 北川 <right9ctrl@outlook.com> | 北川 <right9ctrl@outlook.com>`. This part of the identity claim is exact. |

**Count: 13 claims verified, 2 failed.**

## New dig 1 — Tags return, but tag objects do not

- **Find-type:** 4 (a release identity disappears / a new one appears)
- **Hashes:** annotated tag object `1559ed4297829930f94fc0db8b7188fb5c0e543c` → commit `683bb1518189e84b0f5ae8bf444954656f73554a` (`3.0.5`); lightweight refs directly to `8bc742ba91aca6c5f5b9467d8d7653c95ec98f7d` (`4.0.0`) and `9a5c52a712a721cbc76192b5d0940bcc29cbef03` (`4.0.1`).
- **Dates:** 2012-09-26T01:02:21+02:00; 2018-09-16T11:18:12+00:00; 2018-09-20T13:17:24+00:00.
- **Authors/messages:** Dominic Tarr, `3.0.5`; 北川, `update readme`; 北川, `remove testling from package.json`.
- **Exact reproducible command:**

```sh
repo=/home/diablo/book16/repos/event-stream
git -C "$repo" for-each-ref --sort=creatordate --format='%(refname:short) type=%(objecttype) ref=%(objectname) target=%(*objectname) date=%(creatordate:iso-strict) subject=%(subject)' refs/tags | tail -3
for t in 3.0.5 4.0.0 4.0.1; do printf '%s type=%s: ' "$t" "$(git -C "$repo" cat-file -t "$t")"; git -C "$repo" verify-tag "$t" 2>&1 || true; done
git -C "$repo" log --all --format='%G?' | sort | uniq -c
```

```text
3.0.5 type=tag ref=1559ed4297829930f94fc0db8b7188fb5c0e543c target=683bb1518189e84b0f5ae8bf444954656f73554a date=2012-09-26T01:02:21+02:00 subject=3.0.5
4.0.0 type=commit ref=8bc742ba91aca6c5f5b9467d8d7653c95ec98f7d target= date=2018-09-16T11:18:12+00:00 subject=update readme
4.0.1 type=commit ref=9a5c52a712a721cbc76192b5d0940bcc29cbef03 target= date=2018-09-20T13:17:24+00:00 subject=remove testling from package.json
3.0.5 type=tag: error: no signature found
4.0.0 type=commit: error: 4.0.0: cannot verify a non-tag object of type commit.
4.0.1 type=commit: error: 4.0.1: cannot verify a non-tag object of type commit.
    322 N
```

- **Why it is a story:** Before the outcome was known, the return of release tags after six years could look like tidier maintenance. But Dominic's 2.x/3.x release refs are annotated tag objects with a tagger and message, while 北川's two 4.x releases are bare pointers whose only identity is inherited from the commit. This is not a lost GPG practice—none of 322 commits is signed and even `3.0.5` has no tag signature—but it is a quiet loss of one provenance layer exactly when release activity resumes.
- **What the reader learns:** Use `for-each-ref` and inspect `%(objecttype)`, not only `git tag`. An annotated-but-unsigned tag and a lightweight tag are both unauthenticated, yet the former still preserves a distinct tagger, timestamp, and message. Audit signatures separately with `%G?`/`verify-tag`; do not infer them from annotation.
- **Surprise:** 3

## New dig 2 — The merge-marker apology is followed by the repository's largest non-merge change: tests

- **Find-type:** 2 (a dated artifact planted after a failure)
- **Hashes:** `5bd67ee195266e8b0a4271a3c37f59d4d56a59c6` (the merge-marker fix); `c511eec86bcff6f3d6fb413a5b2a495ec60ca889` (largest non-merge churn).
- **Dates:** 2012-04-07T12:56:30+12:00; 2012-04-07T14:26:24+12:00.
- **Author/messages:** Dominic Tarr, `sorry everyone, fucked up a 3-way-merge. fixed.`; Dominic Tarr, `tests into this repo`.
- **Exact reproducible command:**

```sh
repo=/home/diablo/book16/repos/event-stream
git -C "$repo" log --all --no-merges --format='%H' |
while read h; do
  n=$(git -C "$repo" show --numstat --format= "$h" | awk '$1~/^[0-9]+$/{n+=$1+$2} END{print n+0}')
  git -C "$repo" show -s --format="$n %H %aI %an %s" "$h"
done | sort -nr | head -3
git -C "$repo" log --reverse --format='%h %aI %an %s' 5bd67ee195266e8b0a4271a3c37f59d4d56a59c6^..c511eec86bcff6f3d6fb413a5b2a495ec60ca889 | head -2
```

```text
673 c511eec86bcff6f3d6fb413a5b2a495ec60ca889 2012-04-07T14:26:24+12:00 Dominic Tarr tests into this repo
616 a74c9b2ab433c4e36089fbb72931f6b786b550f5 2018-09-04T08:12:15+00:00 北川 upgrade dependencies
287 68ebbe48327b78a849f94e3623dd377a2502b7e5 2012-07-05T04:28:49+12:00 Dominic Tarr refactor tests
5bd67ee 2012-04-07T12:56:30+12:00 Dominic Tarr sorry everyone, fucked up a 3-way-merge. fixed.
67d2b34 2012-04-07T12:59:00+12:00 Dominic Tarr 0.8.1
```

- **Why it is a story:** The first report finds the embarrassing artifact; the new moment is what Dominic does next. Ninety minutes after deleting the conflict-damaged code and three minutes after releasing 0.8.1, a short sequence adds a test script, Travis, and finally 673 lines across eight test files. The repository's largest ordinary commit is not a feature: it is the scar tissue of the morning's failure.
- **What the reader learns:** Rank every non-merge commit by added-plus-deleted lines, then inspect what sits immediately before the outlier. A giant test import may be less interesting as “coverage” than as evidence of the incident that made local tests suddenly worth owning.
- **Surprise:** 4

## New dig 3 — One mailbox becomes two authors because the name turns around

- **Find-type:** 4 (a name disappears / appears)
- **Hashes:** `e1d725c6896edda0cea56f09efc87990ac40f31d`, `3cbb5a38a2c97c160e75ec063ed56768ad185651`, `1420619e20c94772312818892dd2d801aa09094d`, `747641e00acfb909b1558915b3651e6c0743c0ef`.
- **Dates:** 2015-02-03T11:39:43+08:00 through 2015-02-28T17:07:44+08:00.
- **Author/messages:** `Nan Wang <nantas@gmail.com>`, `check if es.merge arguments object is an array...`; then `Wang Nan <nantas@gmail.com>`, `Update index.js` and two `Update readme.markdown` commits.
- **Exact reproducible command:**

```sh
repo=/home/diablo/book16/repos/event-stream
test -f "$repo/.mailmap" && sed -n '1,20p' "$repo/.mailmap" || echo '.mailmap absent'
git -C "$repo" log --all --format='%H %aI %an <%ae> %s' --author='nantas@gmail.com'
```

```text
.mailmap absent
747641e00acfb909b1558915b3651e6c0743c0ef 2015-02-28T17:07:44+08:00 Wang Nan <nantas@gmail.com> Update readme.markdown
1420619e20c94772312818892dd2d801aa09094d 2015-02-03T14:27:23+08:00 Wang Nan <nantas@gmail.com> Update readme.markdown
3cbb5a38a2c97c160e75ec063ed56768ad185651 2015-02-03T11:49:27+08:00 Wang Nan <nantas@gmail.com> Update index.js
e1d725c6896edda0cea56f09efc87990ac40f31d 2015-02-03T11:39:43+08:00 Nan Wang <nantas@gmail.com> check if es.merge arguments object is an array. if so gets the first element and continue with merge.
```

- **Why it is a story:** At 11:39, `Nan Wang` contributes a real merge fix and test. Ten minutes later the exact mailbox returns as `Wang Nan`, then accumulates three more commits. Before anyone knows the shortlog outcome, a harmless name-order choice has already split one person into a one-commit author and a three-commit author; the absent `.mailmap` leaves that split permanent.
- **What the reader learns:** `shortlog -sn` counts identity strings, not people. Group by email, look for reversed or transliterated names, and add a `.mailmap` if authorship totals matter. Also inspect email changes for the same name: this repo separately splits Chris Andrejewski across two addresses.
- **Surprise:** 2

## New dig 4 — `pause.asynct.js` confesses that it used to test `gate`

- **Find-type:** 4 (a feature name disappears / appears)
- **Hashes:** `c511eec86bcff6f3d6fb413a5b2a495ec60ca889` (creates `test/gate.asynct.js`); `6c82f494025906bba755c323afd53eb2ee244c8e` (73% rename to `test/pause.asynct.js`).
- **Dates:** 2012-04-07T14:26:24+12:00; 2012-08-18T16:17:39+02:00.
- **Author/messages:** Dominic Tarr, `tests into this repo`; Dominic Tarr, `fix test for pause`.
- **Exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/event-stream log --follow --summary --format='%H %aI %an %s' -- test/pause.asynct.js | tail -8
```

```text
5593372dc046cd3d31f1f18896257b4dea60ae26 2013-01-06T17:32:34+07:00 Dominic Tarr attempt to port to tape

6c82f494025906bba755c323afd53eb2ee244c8e 2012-08-18T16:17:39+02:00 Dominic Tarr fix test for pause

 rename test/{gate.asynct.js => pause.asynct.js} (73%)
c511eec86bcff6f3d6fb413a5b2a495ec60ca889 2012-04-07T14:26:24+12:00 Dominic Tarr tests into this repo

 create mode 100644 test/gate.asynct.js
```

- **Why it is a story:** Four months after `gate` gets its in-repo test, Raynos deprecates `es.gate`; Dominic replaces it with the external `pause-stream` and, 39 minutes later, renames the surviving test. At the moment of the rename, this looks like vocabulary cleanup. With `--follow`, the supposedly new pause test reveals that the behavior survived the extraction and carried the old feature's test body with it.
- **What the reader learns:** Follow renamed tests, not only famous source files. When a feature is extracted or renamed, the test often preserves the conceptual lineage that `git log -- new-name` hides. Here `--diff-filter=R` finds only this one detected rename in the entire repository, which makes it unusually deliberate.
- **Surprise:** 3

Reliability: Strong on hashes, dates, authors, and core diffs: 13 of 15 checked claims pass.
The two failures are real editorial overreach: #2 reverses exact output and overstates uniqueness; #6 turns eight pre-payload commits over five days into nine/twelve/a fortnight.
