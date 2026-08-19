# Independent verification and extension: tensor2tensor

## Verification of the first scout's ranked top three

| Dig | Claim checked | Exact command rerun | Result | Note |
|---|---|---|---|---|
| 3 | `a0bd0177bf766c953041b7451398ab1791adb1e5` is Ashish Vaswani's 2017-08-04 revert with the quoted zero-loss/future-peeking subject; `2ced78dbb2a9bb921ebd3e327c704efb790dc140` is William's 2017-08-01 change. | `git -C ~/book16/repos/tensor2tensor log -S 'look_right' --format='%h %ai %an %s' -- '*.py'`<br>`git -C ~/book16/repos/tensor2tensor show --stat --format=fuller a0bd0177bf766c953041b7451398ab1791adb1e5 \| head -20` | **PASS** | Full hashes, author dates, authors, subjects, committer Ryan Sepassi, Piper id, and `2 files changed, 57 insertions(+), 79 deletions(-)` match. |
| 3 | The revert removes `look_right=True` from a function then named `masked_local_attention_1d` and restores causal behavior. | Same two commands above; additionally `git -C ~/book16/repos/tensor2tensor show --unified=5 a0bd0177bf766c953041b7451398ab1791adb1e5 -- tensor2tensor/layers/common_attention.py` | **PASS** | The preimage signature is exactly `block_length=128, look_right=True, use_whole_block=False`; the revert replaces it with a causal-only implementation and separately renames the unmasked function. |
| 3 | `2ced78db` is where “look_right arrives.” | `git -C ~/book16/repos/tensor2tensor log -S 'look_right' --format='%h %ai %an %s' -- '*.py'`<br>`git -C ~/book16/repos/tensor2tensor show 37e7dedf -- tensor2tensor/models/common_attention.py`<br>`git -C ~/book16/repos/tensor2tensor show 75270907 -- tensor2tensor/models/common_attention.py` | **FAIL** | Subtle but material: the token first appears in `37e7dedf` on 2017-07-28 in `local_sliding_window(..., look_right=True)`. `2ced78db` consolidates local attention around the flag, but the specifically dangerous `masked_local_attention_1d(..., look_right=True)` signature is introduced by `75270907` later on 2017-08-01. |
| 3 | The five displayed `git log -S` lines are the output of the stated command. | `git -C ~/book16/repos/tensor2tensor log -S 'look_right' --format='%h %ai %an %s' -- '*.py'` | **FAIL** | The commits are real, but the report silently reordered them. The exact command emits newest-first: `a0bd0177`, `75270907`, `33d47f0a`, `2ced78db`, `37e7dedf`; the report prints a non-chronological sequence beginning `37e7dedf`, `2ced78db`. |
| 3 | The unsafe masked signature survived for about three days before the revert. | `git -C ~/book16/repos/tensor2tensor show -s --format='%H %ai %an %s' 75270907 a0bd0177` | **PASS** | It ran from 2017-08-01 18:03 Pacific to 2017-08-04 14:41 Pacific, just under 69 hours. |
| 4 | `e3e54900d377940c2930285104d6b05bf7cf0330` and `e4ea462e73388b6c8a2ea99a5d92aacd9c3237c5` have the claimed dates, authors, messages, and identities. | `git -C ~/book16/repos/tensor2tensor show e3e54900d377940c2930285104d6b05bf7cf0330 -- tensor2tensor/layers/common_attention.py`<br>`git -C ~/book16/repos/tensor2tensor show --format=fuller e4ea462e73388b6c8a2ea99a5d92aacd9c3237c5` | **PASS** | Metadata matches. The original was committed by Afroz Mohiuddin; the rollback was authored by T2T Team and committed by Copybara-Service, as the report implies. |
| 4 | The first commit shifts positions from zero-based to one-based, and the rollback reverses exactly that source line. | Same two `git show` commands above | **PASS** | The diffs are exact inverses: `tf.range(length)` becomes `tf.range(1, 1+length)`, then becomes `tf.range(length)` again. The rollback itself is one insertion and one deletion. |
| 4 | The rollback follows nine days later because old checkpoints still load but produce wrong results. | `git -C ~/book16/repos/tensor2tensor show -s --format='%H%nAuthorDate: %ai%nCommitDate: %ci%nAuthor: %an <%ae>%nSubject: %s%n%B' e3e54900 e4ea462e` | **PASS** | Commit dates are 2019-12-12 and 2019-12-21. The compatibility warning is verbatim in the rollback body. |
| 4 | This is literally a “one character” change. | `git -C ~/book16/repos/tensor2tensor show e3e54900 -- tensor2tensor/layers/common_attention.py` | **FAIL** | The story is a one-line semantic change, not a one-character edit: `tf.range(length)` becomes `tf.range(1, 1+length)`. “One character” should be “one line” or “one offset.” |
| 1 | The first two commits are Ryan Sepassi's `cedf0e2d...` at 11:24:53 and `3d9c62f...` at 11:27:28 on 2017-06-15: 155 seconds apart. | `git -C ~/book16/repos/tensor2tensor log --reverse --format='%H %ai %an %s' \| head -5`<br>`git -C ~/book16/repos/tensor2tensor show --stat --format=fuller cedf0e2df6c8b155856b31da58fc12b1c737e862`<br>`git -C ~/book16/repos/tensor2tensor show --shortstat --format=fuller 3d9c62f2aca9492db5c22676416974005b9dcbae \| head -12` | **PASS** | Hashes, dates, author, subjects, and elapsed time all match. |
| 1 | The first commit contains only a one-line README, `# tensor2tensor`. | `git -C ~/book16/repos/tensor2tensor show --stat --format=fuller cedf0e2df6c8b155856b31da58fc12b1c737e862` | **PASS** | The root commit is one insertion in `README.md`; its content matches exactly. |
| 1 | The parenthetical description of `cedf0e2d` as “empty title” is accurate. | Same `git show` command | **FAIL** | It is neither an empty commit nor an empty README title: it adds `# tensor2tensor`. The report's own heading and displayed diff contradict the parenthetical. |
| 1 | The initial push changes 74 files with 15,315 insertions and one deletion. | `git -C ~/book16/repos/tensor2tensor show --shortstat --format=fuller 3d9c62f2aca9492db5c22676416974005b9dcbae \| head -12` | **PASS** | Exact match. |
| 1 | At the initial push, `transformer.py` is 495 lines with the quoted docstring; the query scaling line is present; `expert_utils.py` is 1,284 lines and cites an ICLR draft; `AUTHORS` lists only Google Inc. | `git -C ~/book16/repos/tensor2tensor show 3d9c62f2:tensor2tensor/models/transformer.py \| wc -l`<br>`git -C ~/book16/repos/tensor2tensor show 3d9c62f2:tensor2tensor/models/transformer.py \| sed -n '15,22p'`<br>`git -C ~/book16/repos/tensor2tensor grep -n 'q \*= key_depth_per_head\*\*-0.5' 3d9c62f2 -- tensor2tensor/models/common_attention.py`<br>`git -C ~/book16/repos/tensor2tensor show 3d9c62f2:tensor2tensor/utils/expert_utils.py \| wc -l`<br>`git -C ~/book16/repos/tensor2tensor show 3d9c62f2:AUTHORS` | **PASS** | All five content claims match the objects in the initial push. |

**Verification total: 10 claims passed; 4 failed.** The failures are precision problems, not fabricated commits or diffs.

---

## New dig 1. The same pull request lands twice; the second landing is empty

- **Find-type:** 2 (exported / reconstructed artifact)
- **Hashes:** `d88a7f79c0744fed1b64572f2cfb64a4e255612f` (Copybara's internal merge); `7a9d6659f298e32f73f8d770e88af09e491cddfb` (the empty GitHub-shaped landing)
- **Dates:** 2019-03-01T13:54:17-08:00 and 2019-03-01T23:02:48+00:00 (the latter is 15:02:48 Pacific)
- **Author:** Lukas Geiger `<lgeiger@users.noreply.github.com>` on both; committers Copybara-Service and Afroz Mohiuddin respectively
- **Messages:** `Merge of PR #1468` / `Use xrange from six to fix Python 3 support (#1468)`
- **Exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/tensor2tensor show --shortstat \
  --format='%H %T %ai %an %s' \
  d88a7f79c0744fed1b64572f2cfb64a4e255612f \
  7a9d6659f298e32f73f8d770e88af09e491cddfb
git -C /home/diablo/book16/repos/tensor2tensor show -s \
  --format='parent tree=%T' 7a9d6659^
git -C /home/diablo/book16/repos/tensor2tensor show -s \
  --format='empty  tree=%T' 7a9d6659
```

```text
d88a7f79c0744fed1b64572f2cfb64a4e255612f 3abd68609a647df278ca5df7030df2ded218d704 2019-03-01 13:54:17 -0800 Lukas Geiger Merge of PR #1468
 4 files changed, 9 insertions(+), 8 deletions(-)
7a9d6659f298e32f73f8d770e88af09e491cddfb d7399c7b73e6aff31329afc3ea8ef9458ce9df35 2019-03-01 23:02:48 +0000 Lukas Geiger Use xrange from six to fix Python 3 support (#1468)
parent tree=d7399c7b73e6aff31329afc3ea8ef9458ce9df35
empty  tree=d7399c7b73e6aff31329afc3ea8ef9458ce9df35
```

- **Why it is a story:** PR #1468's nine insertions and eight deletions enter through Copybara at 13:54. Sixty-eight minutes later the public-style commit arrives with the contributor's full explanation—but its tree is identical to its parent. At that moment the maintainers were not writing a fake patch; they were reconciling two clocks for the same accepted contribution, and git preserved both the working change and the empty receipt.
- **What the reader learns:** Compare `%T` with the parent tree when a subject promises work but `git show --stat` is silent. In mirrored repositories, an empty commit can be a deduplication marker: search backward for the PR number before deciding that nothing happened.
- **Surprise:** 5

---

## New dig 2. The largest non-merge “code” commit is a 33,708-line vocabulary

- **Find-type:** 2 (generated artifact checked into history)
- **Hash:** `51c694647922bf09888e08881d5d43261452c766`
- **Date:** 2018-01-31T11:38:43-08:00; committed 2018-02-01 by Ryan Sepassi
- **Author:** T2T Team `<no-reply@google.com>`
- **Message:** `Fix visualization notebook.` + `PiperOrigin-RevId: 184022642`
- **Exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/tensor2tensor log --all --no-merges --numstat \
  --format='@@%H%x09%ai%x09%an%x09%s' |
awk -F '\t' '
/^@@/{if(seen) print add+del "\t" add "\t" del "\t" files "\t" meta;
  meta=substr($0,3); add=del=files=0; seen=1; next}
$1~/^[0-9]+$/ && $2~/^[0-9]+$/ {add+=$1; del+=$2; files++}
END{if(seen) print add+del "\t" add "\t" del "\t" files "\t" meta}' |
sort -nr | sed -n '1,3p'
git -C /home/diablo/book16/repos/tensor2tensor show --numstat \
  --format='%H %ai %an %s' 51c694647922bf09888e08881d5d43261452c766
```

```text
34413  34080  333  4    51c694647922bf09888e08881d5d43261452c766  2018-01-31 11:38:43 -0800  T2T Team         Fix visualization notebook.
21983  0      21983 124  6c7c601b8c4429dcc81ab3ec828daddea5ff2b67  2019-10-05 12:36:19 -0700  Afroz Mohiuddin  Move Trax out of T2T into its own repo.
15316  15315  1    74   3d9c62f2aca9492db5c22676416974005b9dcbae  2017-06-15 11:27:28 -0700  Ryan Sepassi     initial push
51c694647922bf09888e08881d5d43261452c766 2018-01-31 11:38:43 -0800 T2T Team Fix visualization notebook.
33708  0    tensor2tensor/test_data/vocab.ende.32768
61     333  tensor2tensor/visualization/TransformerVisualization.ipynb
202    0    tensor2tensor/visualization/visualization.py
109    0    tensor2tensor/visualization/visualization_test.py
```

- **Why it is a story:** Someone fixing the visualization notebook needed a deterministic English–German vocabulary and chose to put all 33,708 lines into test data. Before anyone knew this would become the repository's largest non-merge by textual churn—even larger than the initial 15,315-line publication—the subject reasonably named the user-visible outcome, not the payload that would dominate later archaeology.
- **What the reader learns:** Rank commits by aggregated `--numstat`, then split the winner by file. The largest commit in a code repository is often a fixture, generated lockfile, notebook, or corpus whose quiet inclusion explains later clone weight and blame noise.
- **Surprise:** 4

---

## New dig 3. Release 1.6.4 lives for 49 minutes and never gets a tag

- **Find-type:** 4 (a release name appears and disappears)
- **Hashes:** `49f7f586595212b29c5ca699ff60b70d25bc20ba` (`v1.6.4` version bump); `49e279eb6c871fbebc137d6f598758a275f521c3` (`v1.6.5` version bump and tag target)
- **Date:** 2018-06-15T12:54:30-07:00 and 2018-06-15T13:43:18-07:00
- **Author:** Ryan Sepassi `<rsepassi@google.com>`
- **Messages:** `v1.6.4` / `v1.6.5`
- **Exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/tensor2tensor for-each-ref \
  --format='%(objecttype)' refs/tags | sort | uniq -c
git -C /home/diablo/book16/repos/tensor2tensor log --all \
  --format='%G?' | sort | uniq -c
git -C /home/diablo/book16/repos/tensor2tensor tag -l 'v1.6.*'
git -C /home/diablo/book16/repos/tensor2tensor show -s \
  --format='%H %ai %an %s' 49f7f586595212b29c5ca699ff60b70d25bc20ba \
  49e279eb6c871fbebc137d6f598758a275f521c3
```

```text
     76 commit
   4381 N
v1.6.0
v1.6.1
v1.6.2
v1.6.3
v1.6.5
v1.6.6
49f7f586595212b29c5ca699ff60b70d25bc20ba 2018-06-15 12:54:30 -0700 Ryan Sepassi v1.6.4
49e279eb6c871fbebc137d6f598758a275f521c3 2018-06-15 13:43:18 -0700 Ryan Sepassi v1.6.5
```

- **Why it is a story:** On the project's first birthday, Sepassi bumps `setup.py` to 1.6.4, then 49 minutes later bumps it again to 1.6.5. The tag namespace skips 1.6.4 entirely. All 76 release tags are lightweight commit pointers, and `%G?` reports no GPG signature on any of the 4,381 reachable commits, so there is no signed tag message explaining the vanished release window.
- **What the reader learns:** A version string, a package upload, and a git tag are three different release clocks. List the missing tag and search the version file before calling a release nonexistent; also distinguish a lightweight pointer from an annotated or signed release record.
- **Surprise:** 3

---

## New dig 4. One email becomes two authors because there is no `.mailmap`

- **Find-type:** 4 (a contributor name disappears and reappears under a handle)
- **Hashes:** `37074997ba7767254a5ebc1439269888718667a6` (first `Piotr Milos`); `5a4e9b91c1f525ee427023b7ce3100360d5ea580` (first `piotrmilos`)
- **Dates:** 2018-02-05T15:04:22+01:00 and 2018-02-12T15:48:13+01:00
- **Author:** `Piotr Milos` / `piotrmilos`, both `<piotr.milos@codilime.com>`
- **Messages:** `Initial commit of reinforcement learning module.` / `Fix of a major bag in value loss. Added gradeint summaries`
- **Exact reproducible command:**

```sh
test -e /home/diablo/book16/repos/tensor2tensor/.mailmap || echo '.mailmap: absent'
git -C /home/diablo/book16/repos/tensor2tensor log --all \
  --author='piotr.milos@codilime.com' --format='%an' | sort | uniq -c
git -C /home/diablo/book16/repos/tensor2tensor log --all \
  --author='piotr.milos@codilime.com' --reverse \
  --format='%H %ai %an <%ae> %s' | head -2
git -C /home/diablo/book16/repos/tensor2tensor shortlog -sne --all |
  rg 'Piotr Milos|piotrmilos'
```

```text
.mailmap: absent
      6 Piotr Milos
    157 piotrmilos
37074997ba7767254a5ebc1439269888718667a6 2018-02-05 15:04:22 +0100 Piotr Milos <piotr.milos@codilime.com> Initial commit of reinforcement learning module.
5a4e9b91c1f525ee427023b7ce3100360d5ea580 2018-02-12 15:48:13 +0100 piotrmilos <piotr.milos@codilime.com> Fix of a major bag in value loss. Added gradeint summaries
   157  piotrmilos <piotr.milos@codilime.com>
     6  Piotr Milos <piotr.milos@codilime.com>
```

- **Why it is a story:** Milos introduces the reinforcement-learning module under his name. A week later the same email starts recording work under a login, and the history ultimately counts six commits for the name and 157 for the handle. Nothing sinister happened; without a mailmap, git faithfully turns a change in local identity configuration into two people in the project's public statistics.
- **What the reader learns:** `shortlog` is not a census. Group `(author name, email)` pairs, look for one email with several names, and add a reviewed `.mailmap` if contributor totals or succession claims matter.
- **Surprise:** 3

---

## New dig 5. `common_attention.py` changes address while the mask bug is live

- **Find-type:** 4 (a famous path disappears and reappears)
- **Hash:** `f6799b9515e0e214d2d4295f4e4cf94cf27cf333`
- **Date:** 2017-08-02T16:45:57-07:00
- **Author:** Ryan Sepassi `<rsepassi@google.com>`
- **Message:** `File/code moves`
- **Exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/tensor2tensor show --summary \
  --format='%H %ai %an %s' f6799b9515e0e214d2d4295f4e4cf94cf27cf333 -- \
  tensor2tensor/models/common_attention.py tensor2tensor/layers/common_attention.py
git -C /home/diablo/book16/repos/tensor2tensor log --follow \
  --format='%H %ai %an %s' -- tensor2tensor/layers/common_attention.py | tail -4
git -C /home/diablo/book16/repos/tensor2tensor log \
  --format='%H %ai %an %s' -- tensor2tensor/layers/common_attention.py | tail -4
```

```text
f6799b9515e0e214d2d4295f4e4cf94cf27cf333 2017-08-02 16:45:57 -0700 Ryan Sepassi File/code moves
 rename tensor2tensor/{models => layers}/common_attention.py (89%)
0fad2909b72ee6bf05eb184d0aff6d81fa93a192 2017-06-21 15:36:00 -0700 Noam Shazeer updated image transformer. now combines channels to have only 1024 positions for rev-cifar instead of 3072.
a8463f53b76847f5692d9acf64914d5285b7214d 2017-06-21 12:44:28 -0700 Noam Shazeer Added parameter-attention option to transformer model.
192e90f92cf56a887ea3cb7f87b33526c5101493 2017-06-20 09:35:41 -0700 Ryan Sepassi v1.0.3
3d9c62f2aca9492db5c22676416974005b9dcbae 2017-06-15 11:27:28 -0700 Ryan Sepassi initial push
35416daf4af61361113b51218c4960f25f38bfb7 2017-08-10 10:23:50 -0700 Alexander Ku adding function for local_attention_2d
af4f1e03b24cccfd56a2eb49ed50caf29f6cd361 2017-08-09 14:54:45 -0700 T2T Team Simplify calls to embedding_to_padding, we always end up converting the padding mask to a float tensor.
a0bd0177bf766c953041b7451398ab1791adb1e5 2017-08-04 14:41:57 -0700 Ashish Vaswani Reverted back to the previous masked_local_attention_1d because the current one was giving 0 losses indicating that it was peeking into the future. The way the attention bias was being added also seemed wrong. Renamed unmasked_local_attention_1d to local_attention_1d. The user can specify local_attention_1d if they want to look left and right of the query block.
f6799b9515e0e214d2d4295f4e4cf94cf27cf333 2017-08-02 16:45:57 -0700 Ryan Sepassi File/code moves
```

- **Why it is a story:** The unsafe masked-attention form is introduced on August 1 under `models/common_attention.py`. On August 2 Sepassi moves the file into `layers/` with 89% similarity. On August 4 Vaswani's revert lands at the new address. The incident literally crosses a directory boundary before its outcome is known, leaving the cause and cure on opposite sides of a rename.
- **What the reader learns:** A path-limited log of the current filename stops at the move and misses the initial push and the changes that created the bug. Use `--follow` for a single famous file, and inspect rename similarity rather than assuming the file was born where it lives now.
- **Surprise:** 4

---

Verdict: The first report is highly reliable on hashes, identities, dates, and central diffs: 10 of 14 checked claims pass.  
Its narrative sometimes outruns literal precision—especially the wrong `look_right` anchor and reordered command output—so retain the stories with the four corrections above.
