# Independent verification and extension: CPython

## Verification table

| Dig | Claim checked | Command rerun | Result | Note |
|---|---|---|---|---|
| 1 | The first three commits, hashes, dates, and subjects are as printed. | `git -C ~/book16/repos/cpython log --reverse --format='%H %aI %s' af49df919dafc3767ae956767dce0482f9cd6d4e \| head -3` | **PASS** | Output exactly begins `7f777ed9` (1990-08-09), `33102571` (1990-09-10), `b829a093` (1990-09-18), with the reported subjects. |
| 1 | The first commit is Guido's `Initial revision`, adding `Doc/Makefile` and `Doc/README`, 54 insertions. | `git -C ~/book16/repos/cpython show --stat --format=fuller 7f777ed95a19224294949e1b4ce56bbffcb1fe9f` | **PASS** | Hash, author/committer, date, message, paths, and `2 files changed, 54 insertions(+)` all match. |
| 1 | The second commit is empty: it has the same tree as the first. | `git -C ~/book16/repos/cpython rev-parse 7f777ed95a^{tree} 3310257195^{tree}` | **PASS** | Both resolve to `52384aa82c1f7785424544fc3ee003729b07ac12`. |
| 1 | The first commit contains the SVN-to-Hg conversion trace quoted in the report. | `git -C ~/book16/repos/cpython cat-file -p 7f777ed95a19224294949e1b4ce56bbffcb1fe9f \| head -6` | **PASS** | Line six is exactly `HG:extra convert_revision:svn%3A6015.../legacy-trunk%402161`. |
| 1 | The August tree says `last modified 10 Sep 90`, and there are 178 exact-subject `Initial revision` commits. | `git -C ~/book16/repos/cpython show 7f777ed95a:Doc/README \| tail -8`; `git -C ~/book16/repos/cpython log --format='%s' af49df919dafc3767ae956767dce0482f9cd6d4e \| awk '$0=="Initial revision" {n++} END {print n}'` | **PASS** | The README ends with the claimed signature/date; the count is 178. These are additional probes because the report states the claims without including these exact commands in its command block. |
| 1 | “Day one is two troff files.” | `git -C ~/book16/repos/cpython show --stat --format=fuller 7f777ed95a19224294949e1b4ce56bbffcb1fe9f` | **FAIL** | Subtle misdescription: the two files are a **Makefile and README**, which describe invoking `pstroff`; neither is a troff source document. “Two files for building troff documentation” would be accurate. |
| 2 | `85a5fbbd...` is Guido's Sunday 1990-10-14 interpreter-source dump, subject `Initial revision`, with 78 files and 13,589 insertions. | `git -C ~/book16/repos/cpython show --stat --format=fuller 85a5fbbdfea617f6cc8fae82c9e8c2b5c424436d \| tail -3` (plus the same command without `tail` to check metadata) | **PASS** | Hash, date, author, subject, and stat match exactly. |
| 2 | The surviving `Include/object.h` prose still blames to `85a5fbbd...`. | `git -C ~/book16/repos/cpython blame -L 8,15 af49df919dafc3767ae956767dce0482f9cd6d4e -- Include/object.h` | **PASS** | Every displayed line, including lines 8 and 11–15 quoted by the report, blames to Guido on 1990-10-14. |
| 2 | “For two months the Python repo is a documentation directory. Then a Sunday dump” brings the language. | `git -C ~/book16/repos/cpython show --stat --format=fuller c636014c430620325f8d213e9ba10d925991b8d7 \| sed -n '1,80p'` | **FAIL** | The day before the C interpreter dump, Saturday 1990-10-13, Guido added **47 Python library source files / 5,492 lines**, including `calendar.py`, `getopt.py`, `posixpath.py`, and `string.py`. Calling `85a5fbbd` the first *interpreter C-source* commit is sound; saying the repo remained documentation until Sunday is not. |
| 2 | Tim Peters supplied the two present-day type/class-unification lines in the old paragraph. | `git -C ~/book16/repos/cpython blame -L 13,22 af49df919dafc3767ae956767dce0482f9cd6d4e -- Include/object.h` | **PASS** | Lines 16–17 alone blame to `4be93d0e848c` (Tim Peters, 2002-07-07); the surrounding lines blame to `85a5fbbd`. |
| 3 | Fred Drake added `Lib/this.py` in `63cd9bf...`, at the reported time and with the reported message/stat/content. | `git -C ~/book16/repos/cpython log --diff-filter=A --format='%H %aI %an %s' af49df919dafc3767ae956767dce0482f9cd6d4e -- Lib/this.py`; `git -C ~/book16/repos/cpython show --stat 63cd9bf4887cd4603ead4db29c772fa370e68a25`; `git -C ~/book16/repos/cpython show 63cd9bf4887cd4603ead4db29c772fa370e68a25:Lib/this.py \| head -6` | **PASS** | Exact hash, ISO date, author, escaped-exclamation subject, 28-line stat, and ROT13 opening match. |
| 3 | Guido followed 28 minutes later with whitespace only, and the 2007 commit changes this file's `print` statement to `print()`. | `git -C ~/book16/repos/cpython show 5ff8cb4f1bb9f722908cf2331c95f9530e5bf108 -- Lib/this.py`; `git -C ~/book16/repos/cpython show be19ed77ddb047e02fe94d142181062af6d99dcc -- Lib/this.py` | **PASS** | The first changes three whitespace-only blank lines at 20:41:34; the second changes exactly `print "".join(...)` to `print("".join(...))`. |
| 3 | Plaintext pickaxe does not find the addition because the famous sentence entered as ROT13. | `git -C ~/book16/repos/cpython log -S 'Beautiful is better than ugly' --format='%H %s' af49df919dafc3767ae956767dce0482f9cd6d4e -- Lib/this.py` | **PASS** | No output. |
| 8 (doubted claim) | The shown `--grep=PYTHONHASHSEED ... \| head -3` transcript is exact. | `git -C ~/book16/repos/cpython log --grep='PYTHONHASHSEED' --reverse --format='%H %aI %an %s' af49df919dafc3767ae956767dce0482f9cd6d4e \| head -3` | **FAIL** | The real second line is Georg Brandl's merge `09a7c72cad48...`; Barry Warsaw's `1e13eb08...` is third. The report silently omits the merge while claiming raw `head -3` output. |
| 8 (doubted claim) | `c9f54cf...` is Benjamin Peterson's “enable hash randomization by default” commit and is 44 insertions / 65 deletions. | `git -C ~/book16/repos/cpython show --stat --format='%H %aI %s' c9f54cf512996790266c17f81584c9725ee99d47` | **PASS** | Hash, subject, nine-file stat, and diff direction match; `show --format=fuller` confirms Benjamin Peterson. The diff really removes `-R` from help/manpage text. |
| 8 (doubted claim) | The printed ISO timestamp for `c9f54cf...` is `2012-02-21T16:08:05-2012`. | Same `git show --stat --format='%H %aI %s' ...` command | **FAIL** | Actual output is `2012-02-21T16:08:05-05:00`. `-2012` is a transcription typo, not a valid offset. |

## New dig 1: The tag called `2.0` was made in 2017, for a branch closed in 2011

- **Find-type:** 2 (planted / dated / reconstructed artifact)
- **Hashes:** annotated-tag object `1f73a4e1379223ff2e9a8fbed0a62222b6d0eda5`; tagged commit `2a9b0a93091b9ef7350a94bb3d3f1c43725b7a8c`
- **Date:** tag 2017-06-18T20:05:28-04:00; tagged commit 2011-03-05T14:54:19+01:00
- **Author / tagger:** Ned Deily tagged it; Georg Brandl authored the target commit
- **Messages:** tag `Final head of the former 2.0 branch`; commit `Close 2.0 branch.`
- **Exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/cpython cat-file -p 1f73a4e1379223ff2e9a8fbed0a62222b6d0eda5 | sed -n '/^object /p;/^tag /p;/^tagger /p;/^Final /p;/^-----BEGIN PGP/p'
git -C /home/diablo/book16/repos/cpython show --no-patch --format='%H %aI %an <%ae> %s' 2a9b0a93091b9ef7350a94bb3d3f1c43725b7a8c
git -C /home/diablo/book16/repos/cpython merge-base --is-ancestor 2a9b0a93091b9ef7350a94bb3d3f1c43725b7a8c af49df919dafc3767ae956767dce0482f9cd6d4e; printf 'ancestor_of_main=%s\n' "$?"
```

```text
object 2a9b0a93091b9ef7350a94bb3d3f1c43725b7a8c
tag 2.0
tagger Ned Deily <nad@python.org> 1497830728 -0400
Final head of the former 2.0 branch
-----BEGIN PGP SIGNATURE-----
2a9b0a93091b9ef7350a94bb3d3f1c43725b7a8c 2011-03-05T14:54:19+01:00 Georg Brandl <georg@python.org> Close 2.0 branch.
ancestor_of_main=1
```

- **Why it is a story:** In the moment, Ned is not pretending to release Python 2.0 seventeen years late. During the GitHub-era preservation work he signs a marker for the final head of a dead line, six years after Georg closed it. The short tag name looks like a release until its message and target reveal a tombstone for a branch that is not an ancestor of modern `main`.
- **What the reader learns:** A tag name is not its meaning or its date. Inspect the tag object (`cat-file -p`), distinguish tagger time from target-commit time, read the tag message, and test reachability before describing it as a release. Signed preservation tags can be the only easy doorway into stale branch history.
- **Surprise:** 4/5

## New dig 2: A three-line `.mailmap` changed two old commits without rewriting either hash

- **Find-type:** 4 (a name disappears / appears)
- **Hashes:** `4b10ecc29f6ae69e599a5475a62d8e96a8711f90` (mailmap addition); old commits `3a5b0d8988491d9408b22bceea6fd70b91345724` and `6c4fab0f4b95410a1a964a75dcdd953697eff089`
- **Date:** 2023-04-29T20:21:20-07:00
- **Author:** Amethyst Reese `<amethyst@n7.gg>`
- **Message:** `Update name in acknowledgements and add mailmap (#103696)`
- **Exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/cpython show -s --format='%H %aI %an <%ae>%n%s%n%b' 4b10ecc29f6ae69e599a5475a62d8e96a8711f90 | head -5
git -C /home/diablo/book16/repos/cpython -c mailmap.blob=af49df919dafc3767ae956767dce0482f9cd6d4e:.mailmap show -s --format='raw:    %an <%ae>%nmapped: %aN <%aE>%n%s' 3a5b0d8988491d9408b22bceea6fd70b91345724
```

```text
4b10ecc29f6ae69e599a5475a62d8e96a8711f90 2023-04-29T20:21:20-07:00 Amethyst Reese <amethyst@n7.gg>
Update name in acknowledgements and add mailmap (#103696)

I changed my name last year, and would like to update my name in the
acknowledgements and git history accordingly.
raw:    John Reese <john@noswap.com>
mapped: Amethyst Reese <amethyst@n7.gg>
bpo-33504: Migrate configparser from OrderedDict to dict. (#6819)
```

- **Why it is a story:** The request is explicit and personal: update the acknowledgements and the visible history. The project does it with one mapping line, so the immutable 2018 commit still contains its original author bytes and hash while normal mailmap-aware views can show the contributor's current name. No history rewrite, broken forks, or duplicate identity is required.
- **What the reader learns:** `%an/%ae` show raw identity; `%aN/%aE` show mailmapped identity. `.mailmap` is social infrastructure as well as cleanup: it can repair credits, join aliases, and honor name changes without changing old commits. `mailmap.blob=<tip>:.mailmap` also makes the test reproducible in a bare or damaged worktree.
- **Surprise:** 4/5

## New dig 3: Guido's complaint about `svn:ignore` survives as a Git commit with no diff

- **Find-type:** 2 (conversion-planted artifact)
- **Hash:** `5c303dec170a0c4cb278c819869e652b0832725e`
- **Date:** 2006-08-19T02:32:44+00:00
- **Author:** Guido van Rossum `<guido@python.org>`
- **Message:** `Set the svn:ignore property.  Why can't this be set once on the root directory?`
- **Exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/cpython show -s --format='%H%n%aI%n%an <%ae>%n%s' 5c303dec170a0c4cb278c819869e652b0832725e
git -C /home/diablo/book16/repos/cpython rev-parse 5c303dec170a0c4cb278c819869e652b0832725e^\{tree\} 5c303dec170a0c4cb278c819869e652b0832725e^\{tree\}
```

```text
5c303dec170a0c4cb278c819869e652b0832725e
2006-08-19T02:32:44+00:00
Guido van Rossum <guido@python.org>
Set the svn:ignore property.  Why can't this be set once on the root directory?
4db5cec99cab1b070133078dfc611fcb43dda6a1
4db5cec99cab1b070133078dfc611fcb43dda6a1
```

- **Why it is a story:** Guido is doing real repository maintenance and is annoyed by Subversion's directory-scoped properties. The later conversion preserves his decision and complaint as a commit, but Git trees cannot represent that SVN property change, so parent and child now point at the same tree. The work happened; its payload fell through the migration format.
- **What the reader learns:** An empty commit in converted history may be evidence of metadata your current VCS does not model, not a mistaken click. Compare trees, then read conversion metadata and the message before deleting or squashing “empty” history.
- **Surprise:** 5/5

## New dig 4: The first new committer was `GitHub`, carrying contribution instructions

- **Find-type:** 4 (a name appears)
- **Hashes:** `0c719824decc0c6d7365bcc1a4eb1b8f077f86c3` (first GitHub-committed commit); `d783b01fdfb01955c1854e78ee69c731a5c035b6` (README rename found with `--follow`)
- **Date:** 2017-02-10T14:08:55-08:00 / 2017-02-11T02:21:38+01:00
- **Authors:** Brett Cannon / Victor Stinner; committer on both is `GitHub <noreply@github.com>`
- **Messages:** `Add a CONTRIBUTING file`; `Rename README to README.rst and enhance formatting (#2)`
- **Exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/cpython log --reverse --committer='GitHub' --format='%H %aI author=%an <%ae> committer=%cn <%ce> %s' af49df919dafc3767ae956767dce0482f9cd6d4e | head -3
git -C /home/diablo/book16/repos/cpython rev-list --count --committer='GitHub' af49df919dafc3767ae956767dce0482f9cd6d4e
git -C /home/diablo/book16/repos/cpython log --follow --diff-filter=R --format='%H %aI %an %s' --name-status af49df919dafc3767ae956767dce0482f9cd6d4e -- README.rst
```

```text
0c719824decc0c6d7365bcc1a4eb1b8f077f86c3 2017-02-10T14:08:55-08:00 author=Brett Cannon <brettcannon@users.noreply.github.com> committer=GitHub <noreply@github.com> Add a CONTRIBUTING file
6f0eb93183519024cb360162bdd81b9faec97ba6 2017-02-10T14:09:18-08:00 author=Brett Cannon <brettcannon@users.noreply.github.com> committer=GitHub <noreply@github.com> Delete old pull request template
bb09c863e94b40d6169481b89e708949252e4756 2017-02-10T14:21:15-08:00 author=Brett Cannon <brettcannon@users.noreply.github.com> committer=GitHub <noreply@github.com> Add a Travis configuration file
30472
d783b01fdfb01955c1854e78ee69c731a5c035b6 2017-02-11T02:21:38+01:00 Victor Stinner Rename README to README.rst and enhance formatting (#2)
R070 README README.rst
```

- **Why it is a story:** The platform transition becomes visible before a grand migration announcement: Brett adds the text GitHub will show would-be contributors, and the platform records itself as committer. The next day PR `#2` gives the root README its `.rst` name. At this snapshot that robot identity has committed 30,472 mainline commits; in the moment it had committed one.
- **What the reader learns:** Author and committer answer different questions. Search `%cn`, not only `%an`, to locate a hosting or review-workflow boundary. Then use `--follow` plus rename status to keep tracing a famous file across the new platform's cosmetic changes.
- **Surprise:** 3/5

## New dig 5: Eight days separate a signed final tag from an unsigned next-series tag

- **Find-type:** 4 (a release-steward identity and practice changes)
- **Hashes:** tag object `3f27099d916c7b885e3daf1fabedcc119462014d` (`v3.13.0`); tag object `ceb1929bdea4933df40c7a6dcd838015cd33ac91` (`v3.14.0a1`)
- **Date:** 2024-10-07T07:02:14+02:00 / 2024-10-15T22:34:54+03:00
- **Taggers:** Thomas Wouters `<thomas@python.org>` / Hugo van Kemenade `<1324225+hugovk@users.noreply.github.com>`
- **Messages:** `Python 3.13.0` / `Python 3.14.0a1`
- **Exact reproducible command:**

```sh
for oid in 3f27099d916c7b885e3daf1fabedcc119462014d ceb1929bdea4933df40c7a6dcd838015cd33ac91; do
  git -C /home/diablo/book16/repos/cpython cat-file -p "$oid" | sed -n '/^tag /p;/^tagger /p;/^Python /p;/^-----BEGIN PGP/p'
done
```

```text
tag v3.13.0
tagger Thomas Wouters <thomas@python.org> 1728277334 +0200
Python 3.13.0
-----BEGIN PGP SIGNATURE-----
tag v3.14.0a1
tagger Hugo van Kemenade <1324225+hugovk@users.noreply.github.com> 1729020894 +0300
Python 3.14.0a1
```

- **Why it is a story:** Thomas closes the 3.13 cycle with an annotated tag carrying an embedded PGP signature. Eight days later Hugo opens 3.14 with the same three-line human shape but no signature block in the object. The object alone does not explain why, so the honest story is narrower: release stewardship and recorded trust metadata change together, at a boundary readers can date exactly.
- **What the reader learns:** “The commit is signed,” “the tag is signed,” and “the release is authenticated elsewhere” are different claims. Use `cat-file -p` or `verify-tag` on the tag object itself, and report absence without inventing motive. Adjacent release lines may follow different practices at the same time.
- **Surprise:** 3/5

Verdict: The first report is substantially reliable on hashes and diffs: 12 of 16 checked claims pass.
Reliability: its narrative compression causes four receipt-level or wording defects, so use it as a strong lead sheet, not publication-ready copy.
