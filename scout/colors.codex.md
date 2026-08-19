# Independent verification and extension: colors

## Verification table

`~` in the first report expands here to `/home/diablo`, so the reruns below address the requested clone at `/home/diablo/book16/repos/colors`.

| Dig | Claim | Command rerun | Result | Note |
|---|---|---|---|---|
| #2 | The last four commits are the four stated liberty commits, with the stated hashes, dates, author, and messages. | `git -C ~/book16/repos/colors log -4 --format='%h %ai %an %s'` | **PASS** | Output matches all four rows exactly: `074a0f8` at 23:19:03 through `6bc50e7` at 23:22:34, all Marak. |
| #2 | The payload is on `master`/`origin/master`, is absent from `origin/develop` and every tag, and has no later revert in this repository. | `git -C ~/book16/repos/colors branch -a --contains 074a0f8`<br>`git -C ~/book16/repos/colors tag --contains 074a0f8`<br>`git -C ~/book16/repos/colors log --all --grep=Revert --format='%h %ai %s'` | **PASS** | The branch command lists only the three master names; the tag command is empty; the newest revert grep hit is from 2018. |
| #2 | `074a0f8` adds 41 lines: a 31-line flag module and ten entry-point lines containing the test comment, malformed infinite loop, and `.zalgo` print. | `git -C ~/book16/repos/colors show --stat --format=fuller 074a0f8ed0c31c35d13d28632bd8a049ff136fb6`<br>`git -C ~/book16/repos/colors show --format= 074a0f8 -- lib/index.js lib/custom/american.js` | **PASS** | Metadata, `31 + 10` stat, Carl Pilcher text, three LIBERTY prints, comment, and loop all match. |
| #2 | The payload followed “838 days of silence on this branch.” | `git -C ~/book16/repos/colors show -s --format='%H %aI %an %s' 074a0f8^` plus epoch subtraction from that timestamp to `074a0f8` | **FAIL** | The parent is `7ddd6a3`, 2019-12-31T22:19:49+03:30. To 2022-01-07T23:19:03-05:00 is **738 days, 8:59:14**, not 838 days. |
| #3 | `5d2d242` is Marak’s 2022-01-07 23:21:02 `Fix bug`, changing only `i++;` to `i++`. | `git -C ~/book16/repos/colors show --format=fuller 5d2d242f656103ac38086d6b26433a09f1c38c75` | **PASS** | Hash, author/committer identity and dates, message, one insertion/deletion, and the one-character semantic change all match. |
| #3 | The fix was “119 seconds after the first version bump” and 92 seconds before the final bump. | `git -C ~/book16/repos/colors show -s --format='%H %aI %an %s' 137c6da 5d2d242 6bc50e7` | **FAIL** | `137c6da` 23:19:44 → `5d2d242` 23:21:02 is **78 seconds**, not 119. It is 119 seconds after the payload commit `074a0f8`. The stated 92 seconds to `6bc50e7` is correct. |
| #4 | All-ref author totals begin DABH 74, Marak Squires 44, Marak 37, paladox 19, Pavan 12. | `git -C ~/book16/repos/colors shortlog -sn --all` | **PASS** | The first five rows match exactly. |
| #4 | The 2018/2019 breakdown is 69/5 and 5/0 for DABH/Marak. | `git -C ~/book16/repos/colors shortlog -sn --all --since=2018-01-01 --until=2020-01-01` plus the same command split at each calendar-year boundary | **PASS** | The combined command gives DABH 74 and Marak 5; year-bounded reruns give 2018 = 69/5 and 2019 = 5/0. The five Marak-authored objects are replayed 2015 work, as the report says. |
| #4 | The shown two-line output is what its `--first-parent --author='Marak' ... | head -6` command returns. | `git -C ~/book16/repos/colors log --first-parent --author='Marak' --format='%h %ai %s' | head -6` | **FAIL** | The real first four rows are **all four** 2022 commits, followed by `90dd85b` and `8bf2ad9`. The report prints only `074a0f8` and `90dd85b`, silently removing three matching 2022 rows and the sixth row. Its underlying conclusion—`90dd85b` is the last first-parent Marak commit before liberty—still holds. |
| #4 | The four anchor commits have the stated hashes, dates, authors, and messages. | `git -C ~/book16/repos/colors show -s --format='%H%n%aI%n%an <%ae>%n%s' c9eef422 2631877f baa0e1c7 6bc50e79` | **PASS** | All metadata matches. `c9eef422` is a DABH-authored merge; `baa0e1c7` is the commit tagged by annotated tag object `9d8a3d7f`. |
| #5 | `4b6bc29` is the first all-ref addition of `zalgo`, with the stated date, author, and message; the listed later touches are real. | `git -C ~/book16/repos/colors log --all --reverse -S 'zalgo' --format='%h %ai %an %s'` | **PASS** | The first row and subsequent lineage match, including the 2022 payload as the last row. |
| #5 | The first zalgo diff begins with `// don't summon zalgo`, the getter, `// please no`, and the function. | `git -C ~/book16/repos/colors show 4b6bc295218eed1aafe866a5f6d90eea50a8cb39 -- colors.js | head -25` | **PASS** | The quoted diff and full metadata match. |
| #5 | The 2014 refactor creates both `lib/custom/zalgo.js` and `lib/maps/america.js`, and the 2022 reuse is 3,951 days later. | `git -C ~/book16/repos/colors show --format= --name-status dfb15b55382772ba4fd34fc21922a2d83e9d34d3 | rg 'zalgo|america'` plus timestamp subtraction to `074a0f8` | **PASS** | Both paths are `A`; the interval is 3,951 days plus 18:08:23. |

**Verification count: 10 PASS / 3 FAIL.**

---

## New dig 1: “solving circular references” happens twice; the second commit is empty

- **Find-type:** 2 (duplicated/dated artifact)
- **Hashes:** `f35d715e046cf07c41f7d31eb57d6c16ed4d0f4d` → `cfef595ebb38c2e8cef8edc864f63feb057ea9fd`
- **Date:** author date on both 2018-07-19T23:05:46-03:00; commit dates 2018-07-22T13:43:20-07:00 and 13:45:45-07:00
- **Author:** pii `<adrielcodeco@hotmail.com>`; committer DABH `<DABH@users.noreply.github.com>`
- **Message:** `solving circular references` on both
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/colors log --reverse --format='%H %T %P%n%aI / %cI%n%an / %cn%n%s' f35d715e046cf07c41f7d31eb57d6c16ed4d0f4d^..cfef595ebb38c2e8cef8edc864f63feb057ea9fd
```

```text
f35d715e046cf07c41f7d31eb57d6c16ed4d0f4d 64361305f40d1d1b700888d3996b273d4eb2861d 7aa37ffe71fe2f5eb59257dd2e30c2d6e2f4c4ab
2018-07-19T23:05:46-03:00 / 2018-07-22T13:43:20-07:00
pii / DABH
solving circular references
cfef595ebb38c2e8cef8edc864f63feb057ea9fd 64361305f40d1d1b700888d3996b273d4eb2861d f35d715e046cf07c41f7d31eb57d6c16ed4d0f4d
2018-07-19T23:05:46-03:00 / 2018-07-22T13:45:45-07:00
pii / DABH
solving circular references
```

The first object changes five files by 14 insertions and 20 deletions. Its child has the **same tree ID**, so the second identically named commit changes nothing. Two and a half minutes apart on the maintainer’s Sunday, one contributor patch became two objects; both survived into PR merge `21abbcb`.

- **Why it is a story:** Before the merge outcome was known, DABH replayed pii’s patch, then recorded the same author date and message again without changing the tree. The empty duplicate is the trace of integration work, not contributor indecision.
- **What the reader learns:** Compare `%T` (tree) as well as `%H` (commit). A meaningful-looking child with its parent’s tree is empty; author/committer splits and clustered commit dates often explain why.
- **Surprise:** 4

---

## New dig 2: `develop` ends with 68 lines that never reach `master`

- **Find-type:** 4 (a contributor and feature appear only on a stale ref)
- **Hash:** `a656b8022e535ba5769f6a724bd78e57d17d4f07`
- **Date:** 2019-10-09T21:12:13+03:00; committed 2019-10-09T11:12:13-07:00
- **Author:** Max Sirenev `<34866475+tggdesu@users.noreply.github.com>`; committer David Hyde `<DABH@users.noreply.github.com>`
- **Message:** `Bright colors for typescript definitions (#262)`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/colors log --left-right --cherry-pick --format='%m %H %aI %an / %cn %s' master...origin/develop
```

```text
< 6bc50e79eeaa1d87369bb3e7e608ebed18c5cf26 2022-01-07T23:22:34-05:00 Marak / Marak Bump to `v1.4.44-liberty-2`
< 5d2d242f656103ac38086d6b26433a09f1c38c75 2022-01-07T23:21:02-05:00 Marak / Marak Fix bug
< 137c6dae3339e97f4bbc838c221803c363b0a9fd 2022-01-07T23:19:44-05:00 Marak / Marak Bump to `v1.4.44-liberty`
< 074a0f8ed0c31c35d13d28632bd8a049ff136fb6 2022-01-07T23:19:03-05:00 Marak / Marak Adds new American flag module
< 7ddd6a3d657efb081abb9beddfec26a01a8790a8 2019-12-31T22:19:49+03:30 Omid Nikrah / David Hyde Update docs: missing semicolon in sample code (#273)
> a656b8022e535ba5769f6a724bd78e57d17d4f07 2019-10-09T21:12:13+03:00 Max Sirenev / David Hyde Bright colors for typescript definitions (#262)
```

`a656b80` adds 68 lines and deletes four across `index.d.ts` and `safe.d.ts`. It is the sole patch unique to `origin/develop`; `master` instead takes a documentation fix and, two years later, the four liberty commits. The raw left/right count is `5 1`.

- **Why it is a story:** The moment before the branch split looked routine: a contributor added typings, DABH committed them, and `develop` waited for its next merge. That merge never came. The feature and contributor disappear from the shipping line while the abandoned branch preserves both.
- **What the reader learns:** `git log --all` finds objects, but `git log --left-right --cherry-pick branch...other` tells whether the work actually crossed the release boundary. A stale remote-tracking ref can hold the last unreleased decision of a maintainer era.
- **Surprise:** 3

---

## New dig 3: release tags become annotated under DABH, but never signed

- **Find-type:** 2 (release artifacts whose assurance is easy to overread)
- **Hashes:** tag object `9d8a3d7f706dd40314db191491dae5d13132e885`, pointing to commit `baa0e1c7dc50d868354206b9ea71273e3f05f593`
- **Date:** tag date 2019-09-22T16:45:51-07:00
- **Author/tagger:** DABH `<DABH@users.noreply.github.com>`
- **Message:** `v1.4.0`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/colors for-each-ref refs/tags/v1.4.0 --format='%(objectname) -> %(*objectname)%0a%(creatordate:iso-strict) %(taggername)%0a%(subject)'
git -C /home/diablo/book16/repos/colors log --all --format='%G?' | sort | uniq -c
for t in $(git -C /home/diablo/book16/repos/colors tag); do if test "$(git -C /home/diablo/book16/repos/colors cat-file -t "$t")" = tag; then if git -C /home/diablo/book16/repos/colors cat-file -p "$t" | rg -q 'BEGIN (PGP|SSH) SIGNATURE'; then echo signed; else echo unsigned; fi; fi; done | sort | uniq -c
git -C /home/diablo/book16/repos/colors verify-tag --raw v1.4.0 2>&1 || true
```

```text
9d8a3d7f706dd40314db191491dae5d13132e885 -> baa0e1c7dc50d868354206b9ea71273e3f05f593
2019-09-22T16:45:51-07:00 DABH
v1.4.0
    262 N
     12 unsigned
error: no signature found
```

The first 12 tags (`v0.5.1` through `v1.1.2`) are lightweight commit refs. DABH’s 12 tags (`v1.2.0-rc0` through `v1.4.0`) are real tag objects with tagger dates and messages, but none contains a PGP or SSH signature; every commit also reports `%G? = N`.

- **Why it is a story:** Before the later supply-chain incident, release ceremony visibly improved: DABH replaced lightweight labels with annotated release objects. The missing final step matters precisely because the objects look more official than their predecessors but establish identity only as text stored in Git.
- **What the reader learns:** “Annotated” and “signed” are independent properties. Use `cat-file -t`, `%G?`, and `verify-tag`; a tag message and tagger field are archaeology, not cryptographic provenance.
- **Surprise:** 3

---

## New dig 4: the repository’s largest diff is a lint pass, 61% lockfile

- **Find-type:** 4 (a maintainer’s name appears across old code through mechanical churn)
- **Hash:** `5aebc674d8958e70099eaa0340278b4481616af6`
- **Date:** 2018-04-30T14:59:34-07:00 (author = committer)
- **Author:** DABH `<DABH@users.noreply.github.com>`
- **Message:** `Add ESLint and lint all files; add lint check to CI`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/colors log --all --format='%H%x09%aI%x09%an%x09%s' --numstat | awk -F '\t' 'NF==4 {if(h!="") print add+del,add,del,h,d,a,s; h=$1;d=$2;a=$3;s=$4;add=del=0;next} NF==3 && $1 ~ /^[0-9]+$/ {add+=$1;del+=$2} END{print add+del,add,del,h,d,a,s}' | sort -nr | sed -n '1,3p'
git -C /home/diablo/book16/repos/colors show --format= --numstat 5aebc674d8958e70099eaa0340278b4481616af6 | awk '$3=="package-lock.json" {print}'
git -C /home/diablo/book16/repos/colors blame --line-porcelain lib/custom/zalgo.js | awk '$1 ~ /^5aebc674/ {n++} END {print n " current zalgo lines blamed to 5aebc674"}'
```

```text
1901 1567 334 5aebc674d8958e70099eaa0340278b4481616af6 2018-04-30T14:59:34-07:00 DABH Add ESLint and lint all files; add lint check to CI
1531 962 569 dfb15b55382772ba4fd34fc21922a2d83e9d34d3 2014-09-30T22:41:24+02:00 Marak [refactor] [major] Code cleanup. Node has changed a bit since 2010. [api] Added ability to safely require colors without messing with String.prototype [api] Removed browser functionality [dist] Add travis file
700 228 472 b63ef88e521b42920a9e908848de340b31e68c9d 2018-12-09T17:34:27-08:00 DABH Update roadmap, update packages, and lint
1165	0	package-lock.json
30 current zalgo lines blamed to 5aebc674
```

The winner is 1,901 changed lines across 23 files; 1,165 insertions—61% of the churn—are the new lockfile. Yet formatting rewrites also make this maintenance commit the present-day blame source for 30 lines of `lib/custom/zalgo.js`, whose behavior predates DABH.

- **Why it is a story:** On the day before anyone knew what lines would later become notorious, a maintainer made CI stricter and normalized the tree. The quality pass became the largest diff and partially painted his name over a feature written years earlier by Marak.
- **What the reader learns:** Rank commits by `--numstat`, then separate generated files and run blame. “Largest commit” may measure dependency serialization; “author of this line” may measure the last formatter, not the designer of the behavior.
- **Surprise:** 3

---

## New dig 5: one capitalization change hides eight years of README history

- **Find-type:** 4 (old names disappear unless rename history is followed)
- **Hash:** `f7c5083e3e9f91894567ad87d40e21c296a9a70e`
- **Date:** author date 2018-03-09T22:27:27-08:00; commit date 22:27:41-08:00
- **Author:** DABH `<DABH@users.noreply.github.com>` (author = committer)
- **Message:** `Update readme`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/colors show --summary --format='%H %aI %an / %cn %s' f7c5083e3e9f91894567ad87d40e21c296a9a70e
git -C /home/diablo/book16/repos/colors log --follow --format='%h %aI %an %s' -- README.md | tail -3
git -C /home/diablo/book16/repos/colors blame -L 1,3 README.md
```

```text
f7c5083e3e9f91894567ad87d40e21c296a9a70e 2018-03-09T22:27:27-08:00 DABH / DABH Update readme
 rename ReadMe.md => README.md (88%)
e1daf4f 2010-06-11T02:59:57-04:00 Marak Squires added docs
8b3d411 2010-06-11T02:59:01-04:00 Marak Squires added docs
270314c 2010-06-11T02:56:25-04:00 Marak Squires first commit
8d714a06 ReadMe.md (Meriem Khelifi 2017-03-08 23:34:49 +0100 1) # colors.js
8d714a06 ReadMe.md (Meriem Khelifi 2017-03-08 23:34:49 +0100 2) [![Build Status](https://travis-ci.org/Marak/colors.js.svg?branch=master)](https://travis-ci.org/Marak/colors.js)
8d714a06 ReadMe.md (Meriem Khelifi 2017-03-08 23:34:49 +0100 3) [![version](https://img.shields.io/npm/v/colors.svg)](https://www.npmjs.org/package/colors)
```

The 88%-similar rename changes `ReadMe.md` to conventional `README.md` and removes three lines. A path-limited log without `--follow` makes the document appear to begin in 2018; following the rename reaches the 2010 first commit, and blame still prints the old mixed-case path for surviving lines.

- **Why it is a story:** Before DABH’s housekeeping commit, the project’s most famous document carried its day-one odd capitalization. Fourteen seconds later, the name was conventional and ordinary path history had a false floor.
- **What the reader learns:** Use `--follow` for one famous file and inspect rename similarity. Case-only or near-case-only renames are especially easy to mistake for a newly created document on case-insensitive systems.
- **Surprise:** 2

---

The first report is strong on hashes, diffs, topology, and the central sabotage narrative, but unreliable on fine-grained elapsed time and on faithfully quoting one command’s output.
Reliability verdict: **high-quality evidence with three correctable precision failures; trust the digs after rerunning, not every number or excerpt.**
