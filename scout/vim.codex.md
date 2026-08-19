# Second scout: vim/vim

## Verification of the first report's ranked top three

I treated ranked item 3 ("Day one is 2004, Stevie is a comment") as both digs 1 and 2. `PASS` means the stated metadata and relevant content match the object in this clone; `FAIL` is attached to the individual wording, not to the whole dig.

| dig | claim | command rerun | result | note |
|---|---|---|---|---|
| 7, last 32 hours | The last five commits with Bram as committer have the reported order, dates, authors, and subjects. | `git -C ~/book16/repos/vim log --committer='Bram' --format='%ci %an \| %s' \| head -5` | PASS | Exact output matches, including THARAK HEGDE as author of the final commit and Bram as its committer. The adjacent object checks supply the hashes. |
| 7 | `16abd997c99b1a40fb0ba54889ce0cf44d7585b4` is Bram's last authored commit; `4c0089d696b8d1d5dc40568f25ea5738fa5bbffb` is his last committed commit. | `git -C ~/book16/repos/vim show -s --format='%H%n%ai%n%an <%ae>%n%cn <%ce>%n%s' 16abd997c99b1a40fb0ba54889ce0cf44d7585b4 4c0089d696b8d1d5dc40568f25ea5738fa5bbffb` | PASS | The first is Bram/Bram at 2023-07-08 00:54:06 +0100; the second is THARAK HEGDE/Bram at 2023-07-09 02:38:28 +0100. |
| 7 | Patch 9.0.1673 adds `E418: I'm a teapot`, `E503: Coffee is currently not available`, implementation, help, and tests. | `git -C ~/book16/repos/vim show --format='' 80adaa8ae8398403ca4e9797219ea9a501fc76a5 \| rg -n -C2 'err_teapot\|E418\|E503'` | PASS | The strings, dispatch entry, function, documentation, and assertions are all in the diff. |
| 7 | "`err_teapot()` is 67 lines." | `git -C ~/book16/repos/vim show --stat --format='%s%n%b' 80adaa8ae8398403ca4e9797219ea9a501fc76a5` | **FAIL** | `67` is the insertion total for the entire five-file commit, not the length of `err_teapot()`; it includes docs, error constants, tests, and the version tick. The story is sound, but this sentence mislabels a stat as a function size. |
| 7 | Patch 9.0.1674 immediately sorts the new help; 9.0.1676 renames crypt-test files; 9.0.1677 fixes `arguements` to `arguments`. | `git -C ~/book16/repos/vim show --format='' 416bd916b4cc4502eb734218f406e4edd8dd199c 16abd997c99b1a40fb0ba54889ce0cf44d7585b4 4c0089d696b8d1d5dc40568f25ea5738fa5bbffb` | PASS | The diffs do exactly those three things. The typo fix also updates two expected screen dumps and ticks `src/version.c`. |
| 4, first outside author reverted | The first three `Merge pull request` subjects are the 2019 add, the same-day revert, and the 2023 post-Bram import. | `git -C ~/book16/repos/vim log --reverse --grep='Merge pull request' --format='%H %ai %an %s' \| head -3` | PASS | Hashes, dates, authors, PR numbers, and the 3.7-year gap match exactly. |
| 4 | Revert merge `7a212c625362d86327878d57269d63f6a2ca5d2b` removes nine YAML lines and one README badge. | `git -C ~/book16/repos/vim show --stat --format='%s' 7a212c625362d86327878d57269d63f6a2ca5d2b` | PASS | Exact reported stat: 2 files, 10 deletions. |
| 4 | Christian's add `e307073680d498b113c7df8250abd5676de1ed13` and Bram's revert `d52986e7be366b6f8c9e18078648f1c5219c4335` are exact opposites. | `git -C ~/book16/repos/vim show --format='%H%n%ai%n%an <%ae>%n%cn <%ce>%n%s' e307073680d498b113c7df8250abd5676de1ed13 d52986e7be366b6f8c9e18078648f1c5219c4335; git -C ~/book16/repos/vim show --format='' e307073680d498b113c7df8250abd5676de1ed13 d52986e7be366b6f8c9e18078648f1c5219c4335` | PASS | The first adds `.cirrus.yml` and the badge; the second deletes byte-for-byte the same content. Subtlety: the revert's committer is GitHub, not Bram, although Bram is its author. |
| 1, day one | The seven 2004-06-13 commits, their order, hashes, dates, and subjects match. | `git -C ~/book16/repos/vim log --reverse --format='%H %ai %s' --until=2004-06-14` | PASS | README is first at 12:29; the 1,588-file dump is seventh at 20:20. |
| 1 | The four quoted stats are 137, 2,684, 3,201, and 750,846 insertions. | `for H in 0c628d1da896bf523373c4fc9616baee712a6e96 e1d1289d47574b9acb99fd26efc1c2dc55ce16e2 b4210b3bc14e2918f153a7307530fbe6eba659e1 071d4279d6ab81b7187b48f3a0fc61e587b6db6c; do git -C ~/book16/repos/vim show --stat --format='' "$H" \| tail -1; done` | PASS | Output matches the report, including 1,588 files in the final import commit. |
| 1 | "The seventh commit of the day is ... 103 `*.c`" files. | `git -C ~/book16/repos/vim diff-tree --root --no-commit-id --name-only -r 071d4279d6 \| awk -F/ '{print $NF}' \| awk -F. 'NF>1{print "."$NF}' \| sort \| uniq -c \| sort -nr \| head` | **FAIL** | The commit itself adds **102** `.c` paths. There are 103 `.c` files after it only because `src/main.c` arrived in the sixth commit. This is an off-by-one description of the diff. |
| 1 | `ad3a468653a0f2cc23bdf5ec370f8a198d855308` is the 14:44 CorelDRAW logo commit with zero textual insertions/deletions. | `git -C ~/book16/repos/vim show --stat --numstat --format='%H%n%ai%n%an%n%s' ad3a468653a0f2cc23bdf5ec370f8a198d855308` | PASS | It adds one 15,494-byte binary `runtime/vimlogo.cdr`: `0 insertions, 0 deletions` is true, but "empty-stat" must not be read as an empty commit. |
| 2, Stevie comment | Lines 13–14 of current `src/version.c` still blame to the import and say Vim came from Stevie 3.6 / Fish disk 217. | `git -C ~/book16/repos/vim blame -L 12,16 HEAD -- src/version.c` | PASS | Hash, author, timestamp, line text, and the later 2025 line below all match. |
| 1–2 | The reachable history begins in 2004 rather than with a reconstructed 1991 commit, and imported `uganda.txt` already says `Last change: 2004 May 12`. | `git -C ~/book16/repos/vim log --all --reverse --format='%H %ai %an %s' \| head -1; git -C ~/book16/repos/vim show 071d4279d6:runtime/doc/uganda.txt \| rg -n 'Last change' \| head -1` | PASS | Oldest reachable commit is `0c628d1...`, 2004-06-13; the file's internal date predates its Git commit by a month. |

## New digs

### 1. The successor's first new numbered patch had already been authored while Bram was alive

- **find-type:** 2 (dated artifact) — also 4 (author/committer boundary)
- **hashes:** `84bc00e9b52b1174888f2f696f8b628a83c49988` (9.0.1679); `16abd997c99b1a40fb0ba54889ce0cf44d7585b4` (Bram's last authored patch, 9.0.1676)
- **date:** author date 2023-07-13 11:45:54 +0200; commit date 2023-08-08 20:39:55 +0200
- **author:** Christian Brabandt `<cb@256bit.org>`; committer also Christian Brabandt
- **message:** `patch 9.0.1679: Cleanup Tests from leftover files`

```
git -C ~/book16/repos/vim show -s --format='%H%nAuthorDate: %ai%nCommitDate: %ci%nAuthor: %an%nCommitter: %cn%n%s' 84bc00e9b52b1174888f2f696f8b628a83c49988
git -C ~/book16/repos/vim show -s --format='Previous: %H %ai %an %s' 16abd997c99b1a40fb0ba54889ce0cf44d7585b4
git -C ~/book16/repos/vim show -s --format='%b' 84bc00e9 | rg 'Which is puzzling|Xtest_stable_xxd file should'

84bc00e9b52b1174888f2f696f8b628a83c49988
AuthorDate: 2023-07-13 11:45:54 +0200
CommitDate: 2023-08-08 20:39:55 +0200
Author: Christian Brabandt
Committer: Christian Brabandt
patch 9.0.1679: Cleanup Tests from leftover files
Previous: 16abd997c99b1a40fb0ba54889ce0cf44d7585b4 2023-07-08 00:54:06 +0100 Bram Moolenaar patch 9.0.1676: warning for buffer in use when exiting early
Which is puzzling, because the Xtest_stable_xxd file should have been
```

**Why it is a story.** The moment before the outcome is 13 July: Christian is diagnosing a crash involving `Xtest_stable_xxd`, a name introduced by Bram's final authored patch five days earlier. That work remains off the main line. On 8 August, after Bram's death and after 9.0.1678 is imported, Christian commits the waiting work as 9.0.1679. The apparent first patch of the succession is also unfinished business from the old maintainer's last week. Neither a single `AuthorDate` nor a single `CommitDate` tells that bridge.

**What the reader learns:** display `%ai` and `%ci` together around a handover. A commit landing after a crisis may have been written before it; its body can connect the queue to the predecessor's last diff.

**surprise:** 5

### 2. Signed tag objects begin one month after the handover

- **find-type:** 4 (a name and signing practice appear)
- **hashes:** tag object `6b2a4c6519fa716b1c0c7fa90fc4077a74737a72` (`v9.0.1882`), pointing to commit `da200c2f78ef3c91557a2b484d284eb0c1c62776`
- **date:** 2023-09-06 21:16:58 +0200 (tag; commit four minutes earlier)
- **author/tagger:** Christian Brabandt `<cb@256bit.org>`
- **message:** tag `v9.0.1882`; commit `patch 9.0.1882: Trailing white space in tests`

```
git -C ~/book16/repos/vim for-each-ref --sort=creatordate --format='%(refname:short)%09%(objecttype)%09%(objectname)%09%(creatordate:iso8601)%09%(taggername)%09%(subject)' refs/tags | awk -F '\t' '$2=="tag"' | head -1
git -C ~/book16/repos/vim rev-parse v9.0.1882 'v9.0.1882^{}'
git -C ~/book16/repos/vim for-each-ref --format='%(objecttype)' refs/tags | sort | uniq -c
git -C ~/book16/repos/vim for-each-ref --format='%(refname)%09%(objecttype)' refs/tags | awk -F '\t' '$2=="tag"{print $1}' | while read t; do git -C ~/book16/repos/vim cat-file tag "$t"; done | rg -c '^-----BEGIN PGP SIGNATURE-----$'

v9.0.1882 tag 6b2a4c6519fa716b1c0c7fa90fc4077a74737a72 2023-09-06 21:16:58 +0200 Christian Brabandt v9.0.1882
6b2a4c6519fa716b1c0c7fa90fc4077a74737a72
da200c2f78ef3c91557a2b484d284eb0c1c62776
  16423 commit
   3435 tag
3435
```

Every earlier version tag in this clone is lightweight; `v9.0.1882` is the first annotated tag object. All 3,435 annotated tag objects contain a PGP signature block, while the other 16,423 tags point straight at commits and cannot carry a tagger, message, or tag signature. There is at least one later lightweight exception (`v9.0.1886`), so this was a practice being adopted, not an instantaneous perfect migration. The receipt above establishes signature **presence**, not key validity.

**Why it is a story.** The moment before the outcome: the patch-number machine is already running under a new maintainer, but releases still inherit Bram's anonymous lightweight-tag convention. On 6 September Christian makes the release ref itself an attributed, signed object. Succession changes not only who increments the number but what evidence the number carries.

**What the reader learns:** `git tag` hides the crucial type distinction. Count `%(objecttype)`, find the first `tag` object, and inspect it with `cat-file`; a project's supply-chain practice may change without any source diff.

**surprise:** 5

### 3. A merge absorbs thirteen commits and deliberately changes no mainline files

- **find-type:** 8 (rollback of the world) — also an odd merge
- **hash:** `66e1f8860acd7021684c7251dd65cc135a5998f5`
- **date:** 2010-08-20 11:11:57 +0200
- **author:** Bram Moolenaar `<Bram@vim.org>`
- **message:** `Fold Vim 7.2 default branch back to trunk to avoid two heads. (Tony Mechelynck)`

```
git -C ~/book16/repos/vim show -s --format='%H %ai %an | %s%nparents: %P' 66e1f8860acd7021684c7251dd65cc135a5998f5
git -C ~/book16/repos/vim rev-parse '66e1f886^{tree}' '66e1f886^1^{tree}' '66e1f886^2^{tree}'
git -C ~/book16/repos/vim rev-list --count 66e1f886^1..66e1f886^2
git -C ~/book16/repos/vim diff-tree -m --shortstat --oneline 66e1f886 | tail -2

66e1f8860acd7021684c7251dd65cc135a5998f5 2010-08-20 11:11:57 +0200 Bram Moolenaar | Fold Vim 7.2 default branch back to trunk to avoid two heads. (Tony Mechelynck)
parents: 832f80e3101a916976c4b601bc87885a7f2e9d44 1c727d82089b71c1efb40133a4e356acd7cb055e
8cd07a93a0683cb16b8e01bdc4144d3ec95fc29c
8cd07a93a0683cb16b8e01bdc4144d3ec95fc29c
68d2fc3c6e597f2196e4545ed22736f32f5747b7
13
66e1f8860acd7021684c7251dd65cc135a5998f5 (from 1c727d82089b71c1efb40133a4e356acd7cb055e) Fold Vim 7.2 default branch back to trunk to avoid two heads. (Tony Mechelynck)
 514 files changed, 40885 insertions(+), 113861 deletions(-)
```

The merge tree equals its first parent's tree byte-for-byte. Relative to the mainline, the merge changes nothing; topologically, it declares thirteen 7.2 commits integrated. Viewed from the second parent, it appears to replace a 7.2 world with the trunk across 514 files. The strange `default branch` / `trunk` / `two heads` wording is a preserved trace of the history before today's one-branch GitHub surface.

**Why it is a story.** The moment before the outcome: two heads exist and ordinary content merging would risk resurrecting an old release line. Bram chooses the trunk tree unchanged while connecting the ancestry. The enormous second-parent diff is the price of saying “this history is acknowledged, but this world does not win.”

**What the reader learns:** for a merge, compare the tree hash with **each** parent. A zero-diff merge can be an intentional governance act; `git show` against only the first parent can make it look like nothing happened.

**surprise:** 4

### 4. One email is two contributors because `.mailmap` never arrived

- **find-type:** 4 (a name disappears, reappears, and splits the count)
- **hashes:** `c512599b22aac7305b171566c2f595e0ae85b885` (first `K.Takata` author); `ad29f6af0a2edcd1c9e78d8defe86b2155937f7c` (first `Ken Takata` author); `c0fc51184c0374b74478611ce8f74ab7464ded0d` (later return to `K.Takata`)
- **date:** 2021-05-26 → 2026-06-28
- **author:** `K.Takata` / `Ken Takata`, both `<kentkt@csc.jp>`
- **messages:** `patch 8.2.2889: typo and verbose comment in Makefiles`; `patch 9.0.1901: win32: not correctly freeing environment`; `CI: MS-Windows: Run gvim/vim tests in parallel`

```
test -z "$(git -C ~/book16/repos/vim ls-tree -r HEAD | rg '(^|/)\.mailmap$')" && echo 'HEAD: no .mailmap'
test -z "$(git -C ~/book16/repos/vim log --all --format=%H -- .mailmap)" && echo 'history: no .mailmap'
git -C ~/book16/repos/vim shortlog -sne --all | rg 'K\.Takata|Ken Takata'
git -C ~/book16/repos/vim show -s --format='%h%x09%ai%x09%an%x09%ae%x09%s' c512599b22aac7305b171566c2f595e0ae85b885 ad29f6af0a2edcd1c9e78d8defe86b2155937f7c c0fc51184c0374b74478611ce8f74ab7464ded0d

HEAD: no .mailmap
history: no .mailmap
   133 K.Takata <kentkt@csc.jp>
    65 Ken Takata <kentkt@csc.jp>
c512599b2 2021-05-26 21:49:18 +0200 K.Takata kentkt@csc.jp patch 8.2.2889: typo and verbose comment in Makefiles
ad29f6af0 2023-09-16 13:56:02 +0200 Ken Takata kentkt@csc.jp patch 9.0.1901: win32: not correctly freeing environment
c0fc51184 2026-06-28 17:28:17 +0000 K.Takata kentkt@csc.jp CI: MS-Windows: Run gvim/vim tests in parallel
```

This is not only an old-to-new rename: the abbreviated name returns. Hirohito Higashi is similarly split from `h-east` under one email. With no reachable `.mailmap` commit, Git correctly reports spellings, not people.

**Why it is a story.** The moment before the outcome: the project has finally become a crowd, and `shortlog` is now the org chart the first report reads. But one prolific Windows maintainer occupies two rows, 133 plus 65, because nobody has committed the small identity ledger that would join them. The crowd is real; its exact ranking is not.

**What the reader learns:** before making bus-factor or contributor-rank claims, run `shortlog -sne`, look for repeated emails, and inspect `.mailmap` across `--all`. Names are authored data, not stable person IDs.

**surprise:** 3

## Verdict on the first report

Highly reliable: 12 of 14 checked claims pass, and every ranked receipt, hash, chronology, and central diff is genuine.
The two failures are subtle editorial stat errors (67 whole-commit insertions called a function size; 102 imported C files called 103), not invented archaeology.
