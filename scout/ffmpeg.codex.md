# Independent scout: FFmpeg/FFmpeg

## Verification of the first scout's ranked top three (plus one doubted claim)

I reran the report's literal commands against the existing clone at `/home/diablo/book16/repos/ffmpeg`, then used supplementary read-only commands where the printed recipe did not expose author identity, parent count, or diff content. A PASS means the claim, not merely the hash, survives that check.

| dig | claim | command rerun | result | note |
|---|---|---|---|---|
| #5 | The first three `qatar` grep hits are `4defa68f`, `f3543969`, `2cae9809`, on 2–4 Apr 2011 with the quoted merge subjects. | `git -C /home/diablo/book16/repos/ffmpeg log --grep=qatar --format='%H %aI %s' --reverse \| head -3` | PASS | Hashes, author dates, and subjects match exactly. Supplementary `show -s --format=...` confirms Michael Niedermayer authored and committed the first one. |
| #5 | `git log --grep=qatar` produces 1,194 hits. | `git -C /home/diablo/book16/repos/ffmpeg log --grep=qatar --oneline \| wc -l` | PASS | Literal output is `1194`. |
| #5 | Those 1,194 hits are 1,194 qatar **merges**. | Above, plus `git -C /home/diablo/book16/repos/ffmpeg rev-list --count --min-parents=2 --grep=qatar HEAD` | **FAIL** | Only **1,151** have two parents. The other 43 are ordinary commits whose subject/body mentions qatar, including cosmetics, fixes, and a revert. The title and yearly totals conflate grep hits with merges. |
| #5 | The printed hour-histogram command yields `66, 90, 103, 52, 56` for hours 00–04. | `git -C /home/diablo/book16/repos/ffmpeg log --grep=qatar --format='%ad' --date=format:'%H' --author=Niedermayer \| sort \| uniq -c \| sort -k2 \| head -5` | **FAIL** | It actually yields `69, 91, 105, 56, 59`. The report's numbers are the result after adding the unprinted `--min-parents=2`; its prose silently switches from 1,194 grep hits to 1,151 merges. |
| #5 | Every actual qatar merge is by Michael Niedermayer; the last is `4899ccd2`, with the quoted DNxHD conflict message. | `git -C /home/diablo/book16/repos/ffmpeg log --grep=qatar --min-parents=2 --format='%an' \| sort \| uniq -c`; `git -C /home/diablo/book16/repos/ffmpeg log -1 --format='%B' 4899ccd29572f139b0da648212595d3affc9bf5d` | PASS | The author count is `1151 Michael Niedermayer`. The last hash, 2014-04-11 date, subject, two parents, two conflicted paths, `See:` hash, and `Merged-by:` line all match. |
| #5 | `ffe9fd25` imposed the no-merge rule and Michael authored 6,625 merges overall. | `git -C /home/diablo/book16/repos/ffmpeg show --format= ffe9fd253f21db43ccc52a4043af94b7b9044f53 -- doc/git-howto.txt`; `git -C /home/diablo/book16/repos/ffmpeg rev-list --count --min-parents=2 --author='Michael Niedermayer' HEAD` | PASS | The diff literally adds “merge commits are forbidden” and “master tree will reject pushes with merge commits”; the count is `6625`. |
| #5 | In the ranked summary, “the no-merge policy is two days old” when the qatar merging begins. | `git -C /home/diablo/book16/repos/ffmpeg show -s --format='%H %aI %s' ffe9fd253f21db43ccc52a4043af94b7b9044f53 4defa68fe25eae4d7c27341e3b35811c047dcd3f` | **FAIL** | The rule is 2011-01-17; the first qatar merge is 2011-04-02, about 75 days later. “Two days” correctly describes the rule's distance from the Jan 18–19 leadership fight, not from qatar's Apr 2 start. |
| #7 | Pickaxe finds the Project Leader section's 2006 birth, 2011 deletion/revert, and 2022 deletion under the claimed hashes, dates, authors, and messages. | `git -C /home/diablo/book16/repos/ffmpeg log -S 'Project Leader' --format='%h %ai %an %s' -- MAINTAINERS` | PASS | All four commits match. The full subject of `f4f5cab9` also contains the mailing-list URL in its first paragraph, which `%s` includes; the report merely shortened it. |
| #7 | `f4f5cab9` removes the seven-line leader block and `111ccca6` restores it the next day with “mistakely commited as discussed.” | `git -C /home/diablo/book16/repos/ffmpeg show f4f5cab94e0881cd30965b28f3d78d9c63d6918e -- MAINTAINERS`; `git -C /home/diablo/book16/repos/ffmpeg log -1 --format='%aD%n%B' 111ccca602e96f18d4fab1117b2b768ae51814f7` | PASS | Author, date, message, exact removed lines, revert target, and spelling all match. |
| #7 | `f2c58931` removes only Michael's name in 2015, leaving the office and “final design decisions.” | `git -C /home/diablo/book16/repos/ffmpeg show f2c58931e629343f7d68258cc2b2d62c5f501ba5` | PASS | The one-line deletion and metadata match exactly. Committer time is 42 seconds after author time, a harmless detail omitted by the report. |
| #7 | `07d93001` removes the empty section in 2022 with “The position does not exist anymore.” | `git -C /home/diablo/book16/repos/ffmpeg show 07d930014d839dc1c10f3a539e78cc7f8b9d7a4a` | PASS | Hash, Anton Khirnov authorship, author date, message, and six-line deletion match. Its commit date is 2022-09-23, three days after the reported author date; the report consistently labels the latter. |
| #3 | `22f7942f` has author date 2012-10-25, committer date 2001-01-01, parent `dcdfb8ed`, Luca Barbato identity, and the quoted ffv1 subject. | `git -C /home/diablo/book16/repos/ffmpeg log -1 --format='commit %H%nAuthorDate: %aD%nCommitDate: %cD%nParent: %P%n%s' 22f7942fe7d7349e3562ac68fa101d9efec522df` | PASS | Exact match. Supplementary `show --format=fuller --stat` confirms Luca as both author and committer. |
| #3 | The quoted five-line `git log --reverse` anomaly is reproducible. | `git -C /home/diablo/book16/repos/ffmpeg log --reverse --format='%ci %h %s' \| head -5` | PASS | Exact five hashes, committer timestamps, and subjects match. |
| #3 | It is the only reachable commit with a committer date beginning `2001-01-01`. | `git -C /home/diablo/book16/repos/ffmpeg log --format='%ci' \| grep -c '^2001-01-01'` | PASS | Output is `1`; repeating with `--all` is also `1`. |
| #3 | The patch is a six-line range-state fix. | `git -C /home/diablo/book16/repos/ffmpeg show --format= 22f7942fe7d7349e3562ac68fa101d9efec522df -- libavcodec/ffv1dec.c` | PASS | It is exactly 6 insertions and 1 deletion in `libavcodec/ffv1dec.c`, replacing an assertion with population of `one_state` and `zero_state`. |
| #3 | “`git log` sorts by committer date.” | The report's own `git ... log --reverse ... \| head -5`, compared with its printed timestamps | **FAIL** | This is too strong and the output disproves a global date sort: a 2012 parent is printed before its 2001-dated child, followed by a July 2001 commit. Commit dates influence default traversal, but topology constrains it; reversing the traversal is what exposes parent-before-child here. |
| #9 (doubted) | The Måns/Mans split is a consequence of running `shortlog` “without `.mailmap`.” | `git -C /home/diablo/book16/repos/ffmpeg shortlog -sn HEAD \| head -8`; `git -C /home/diablo/book16/repos/ffmpeg shortlog -sne HEAD \| rg 'Mans Rullgard\|Måns Rullgård'`; `rg -n 'Rullgard\|Rullgård\|mans@mansr' /home/diablo/book16/repos/ffmpeg/.mailmap` | **FAIL** | The repo has a `.mailmap`, normal `shortlog` applies it, and it still emits 1,706 + 1,088 identities; `.mailmap` has no matching entry. The split is real, but the report misdiagnoses it as absence of mailmap rather than absence of the necessary mapping. |

**Verification count: 12 PASS / 5 FAIL.** No cited top-three hash or shown diff was fabricated; the failures are two qatar aggregation errors and three causal/wording errors.

## New dig 1 — A merge invents `fftools/ffmpeg.c`; neither parent has that path

- **find-type:** 4 (a name/path appears) — also an odd merge and a `--follow` trap
- **hashes:** merge `fd5f4ac0813c27c34c387f00044905a859e29e37`; FFmpeg parent `2f7ca0b94e49c2bfce8bda3f883766101ebd7a9b`; Libav commit/second parent `c95169f0ec68bdeeabc5fde8aa4076f406242524`
- **date:** 2017-10-01T18:21:02-03:00
- **author:** James Almer `<jamrial@gmail.com>`
- **message:** `Merge commit 'c95169f0ec68bdeeabc5fde8aa4076f406242524'`

Exact command and output:

```sh
git -C /home/diablo/book16/repos/ffmpeg show -s --format='%H %aI %an <%ae> | %s' fd5f4ac0813c27c34c387f00044905a859e29e37
for spec in 'fd5f4ac^1 ffmpeg.c' 'fd5f4ac^2 avtools/avconv.c' 'fd5f4ac fftools/ffmpeg.c'; do set -- $spec; printf '%-30s ' "$1:$2"; git -C /home/diablo/book16/repos/ffmpeg ls-tree "$1" "$2"; done
git -C /home/diablo/book16/repos/ffmpeg log --reverse --follow --format='%h %aI %s' -- fftools/ffmpeg.c | head -3
fd5f4ac0813c27c34c387f00044905a859e29e37 2017-10-01T18:21:02-03:00 James Almer <jamrial@gmail.com> | Merge commit 'c95169f0ec68bdeeabc5fde8aa4076f406242524'
fd5f4ac^1:ffmpeg.c             100644 blob 1d248bc269d80526c02abac2cf2fcaaae74b717b ffmpeg.c
fd5f4ac^2:avtools/avconv.c     100644 blob 5c36761c1d14e9085c2d3e73d0c3a678f38082b3 avtools/avconv.c
fd5f4ac:fftools/ffmpeg.c       100644 blob 1d248bc269d80526c02abac2cf2fcaaae74b717b fftools/ffmpeg.c
41569bbc66 2017-10-06T21:49:09+02:00 ffmpeg: always use single threaded decoding for attached pictures
2b006ccf83 2017-10-10T10:36:58-07:00 ffmpeg.c: Fallback to duration_dts, when duration_pts can't be determined.
f4090940bd 2017-10-04T00:43:30+02:00 ffmpeg: always init output stream before reaping filters
```

**Why it is a story.** The moment before the merge, FFmpeg still has `ffmpeg.c` at the root while the incoming Libav side has moved its differently named program to `avtools/avconv.c`. Almer merges Libav's “Move cli tool sources” decision but resolves it in FFmpeg's vocabulary: the result creates `fftools/ffmpeg.c`, a path present in neither parent, while preserving FFmpeg's blob byte-for-byte. A merge did not merely choose side A or side B; it coined a third name. The scar is that `git log --follow` now begins just after the merge in October 2017 instead of following the famous file back to 2000.

**Reader learns:** rename following is a similarity heuristic over ordinary diffs, not lineage stored in a commit. For a path born in a merge resolution, inspect `ls-tree` on both parents and the merge tree; `--follow` can silently amputate seventeen years.

**surprise:** 5

## New dig 2 — The branch whose final feature is refusing to build itself

- **find-type:** 1 (tiny diff, branch-wide blast radius)
- **hash:** `ea4e8e642acc8c192a129470cb58c45beb62940b` on the still-advertised remote ref `origin/oldabi`
- **date:** 2013-07-14T15:25:43-07:00 (committed 2013-07-15T03:29:01+02:00)
- **author:** Timothy Gu `<timothygu99@gmail.com>`
- **message:** `Deprecate oldabi branch by adding a warning to configure`

Exact command and output:

```sh
git -C /home/diablo/book16/repos/ffmpeg for-each-ref refs/remotes/origin/oldabi --format='%(objectname) %(authordate:iso8601-strict) %(authorname) | %(subject)'
printf 'unique commits outside master: '; git -C /home/diablo/book16/repos/ffmpeg rev-list --count master..origin/oldabi
git -C /home/diablo/book16/repos/ffmpeg show --format= ea4e8e642acc8c192a129470cb58c45beb62940b -- configure | sed -n '/^+if ! enabled building/,+5p'
ea4e8e642acc8c192a129470cb58c45beb62940b 2013-07-14T15:25:43-07:00 Timothy Gu | Deprecate oldabi branch by adding a warning to configure
unique commits outside master: 678
+if ! enabled building; then
+    cat <<EOF
+!!!! WARNING !!!!
+
+This branch is NOT actively maintained and CAN contain serious security
+issues. This branch is only provided for historical interest.
```

The rest of the 20-line patch exits unless the user passes `--enable-building`.

**Why it is a story.** A maintainer is looking at 678 commits that master does not contain and decides the safest last change is not another repair but a dead-man switch. The branch remains under `origin/oldabi` thirteen years later, so it is simultaneously published, historically preserved, and disabled by default. The warning is not documentation beside the branch; it is the branch's final executable behavior.

**Reader learns:** `git log HEAD` cannot show every policy your remote still publishes. Compare `master..origin/<stale-branch>`, then read the branch tip: abandonment is often committed as code, and stale refs can retain security-relevant worlds absent from the main DAG walk.

**surprise:** 4

## New dig 3 — The fix is already present, but the cherry-pick receipt is committed empty

- **find-type:** 2 (planted artifact: a change message attached to no tree change)
- **hashes:** empty commit `7df9a56f0d2bdbf45e7868f7b4e1f06a6fc01be1`; source `f189657ec67cfae78dc7fdf44754aa1633e24be0`; earlier copy already in its parent `2803bcd5d568ab57eee9b020c40ebb7aaf895e7f`
- **date:** author 2026-03-11T21:48:33+08:00; committer 2026-03-15T03:15:37+00:00
- **author:** Zhao Zhili `<zhilizhao@tencent.com>`; committer Zhao Zhili `<quink@noreply.code.ffmpeg.org>`
- **message:** `avformat/rtmpproto: fix listen_timeout conversion for special negative values`

Exact command and output:

```sh
git -C /home/diablo/book16/repos/ffmpeg show -s --format='%H author=%aI commit=%cI%nAuthor: %an <%ae>%nCommitter: %cn <%ce>%n%s' 7df9a56f0d2bdbf45e7868f7b4e1f06a6fc01be1
printf 'parent tree  '; git -C /home/diablo/book16/repos/ffmpeg show -s --format='%T' 7df9a56f0d2bdbf45e7868f7b4e1f06a6fc01be1^
printf 'commit tree  '; git -C /home/diablo/book16/repos/ffmpeg show -s --format='%T' 7df9a56f0d2bdbf45e7868f7b4e1f06a6fc01be1
git -C /home/diablo/book16/repos/ffmpeg show -s --format='%B' 7df9a56f0d2bdbf45e7868f7b4e1f06a6fc01be1 | rg 'cherry picked from'
git -C /home/diablo/book16/repos/ffmpeg log -1 --format='already in parent: %H %s' 7df9a56f0d2bdbf45e7868f7b4e1f06a6fc01be1^ -- libavformat/rtmpproto.c
7df9a56f0d2bdbf45e7868f7b4e1f06a6fc01be1 author=2026-03-11T21:48:33+08:00 commit=2026-03-15T03:15:37+00:00
Author: Zhao Zhili <zhilizhao@tencent.com>
Committer: Zhao Zhili <quink@noreply.code.ffmpeg.org>
avformat/rtmpproto: fix listen_timeout conversion for special negative values
parent tree  9b69b789e7e03903fadeb92bb08c71f5a648b849
commit tree  9b69b789e7e03903fadeb92bb08c71f5a648b849
(cherry picked from commit f189657ec67cfae78dc7fdf44754aa1633e24be0)
already in parent: 2803bcd5d568ab57eee9b020c40ebb7aaf895e7f avformat/rtmpproto: fix listen_timeout conversion for special negative values
```

**Why it is a story.** Before this release-branch commit, the fix was already there under `2803bcd5`: the same source cherry-pick had landed earlier. The second operation nevertheless preserves a full bug-fix message and cherry-pick provenance while its tree ID stays identical to its parent's. Someone chose to retain the administrative receipt instead of dropping the redundant pick. The trace looks like code history until the two tree hashes reveal it is coordination history.

**Reader learns:** a persuasive subject and `cherry picked from` trailer do not prove a patch changed bytes. On maintenance branches, compare `%T` for commit and parent; empty commits can be valuable deployment/provenance markers, accidental duplicate picks, or both.

**surprise:** 4

## New dig 4 — “Stop git lying”: a contributor deletes his own mailmap alias

- **find-type:** 4 (an identity mapping disappears)
- **hash:** `f53c590f3d18799bfb85a383d0738b28fe2fd08e`
- **date:** 2022-10-28T16:04:42+02:00
- **author:** James Darnley `<jdarnley@obe.tv>`
- **message:** `mailmap: stop git lying about who I commit things as`

Exact command and output:

```sh
git -C /home/diablo/book16/repos/ffmpeg show --format='%H %aI%n%an <%ae>%n%s' --unified=0 f53c590f3d18799bfb85a383d0738b28fe2fd08e -- .mailmap | sed -n '1,10p'
f53c590f3d18799bfb85a383d0738b28fe2fd08e 2022-10-28T16:04:42+02:00
James Darnley <jdarnley@obe.tv>
mailmap: stop git lying about who I commit things as

diff --git a/.mailmap b/.mailmap
index ba072f38c8..af60290f77 100644
--- a/.mailmap
+++ b/.mailmap
@@ -1 +0,0 @@
-<james.darnley@gmail.com> <jdarnley@obe.tv>
```

**Why it is a story.** `.mailmap` is normally described as cleanup: several old spellings become one true person. Here the person being “cleaned up” objects. The line made Git display commits made with the OBE address as the Gmail identity; Darnley deletes it and calls that presentation a lie. No old commit changes, but every mailmap-aware `log`, `shortlog`, and blame can change the identity it reports after this one-line deletion.

**Reader learns:** mailmap is an editorial layer, not recovered truth. Blame/log's `%an <%ae>` shows the object; `%aN <%aE>` may show a later maintainer's canonicalization. Archaeology should print both when identity is the evidence.

**surprise:** 4

## New dig 5 — Release 5.1 is unsigned; 5.1.1 begins the signed-tag era

- **find-type:** 2 (a provenance artifact appears at a sharp boundary)
- **hashes:** unsigned annotated tag object `4f3c925bd5e8f253c1dbf57eb9552b92ce0b12d5` (`n5.1`, target `e0723b7e...`); first signed tag object `8536e629f0c35c0e8a2b67e65d3bc60a088fe413` (`n5.1.1`, target `1bad30db...`)
- **dates:** 2022-07-22T20:07:33+02:00 / 2022-08-31T20:35:54+02:00
- **tagger:** Michael Niedermayer `<michael@niedermayer.cc>`
- **messages:** `FFmpeg 5.1 release` / `FFmpeg 5.1.1 release`

Exact command and output (this tests raw signature presence, not trust validity):

```sh
git -C /home/diablo/book16/repos/ffmpeg for-each-ref refs/tags/n5.1 refs/tags/n5.1.1 --format='%(refname:short) %(objectname) %(*objectname) %(taggerdate:iso8601-strict) %(taggername) | %(contents:subject)'
for t in n5.1 n5.1.1; do if git -C /home/diablo/book16/repos/ffmpeg cat-file -p "$t" | rg -q '^-----BEGIN PGP SIGNATURE-----'; then echo "$t: PGP signature present"; else echo "$t: no signature"; fi; done
printf 'earliest signed: '; git -C /home/diablo/book16/repos/ffmpeg for-each-ref refs/tags --format='%(refname:short) %(objectname) %(taggerdate:iso8601-strict)' | while read tag obj date; do git -C /home/diablo/book16/repos/ffmpeg cat-file -p "$obj" 2>/dev/null | rg -q '^-----BEGIN (PGP|SSH) SIGNATURE-----' && echo "$date $tag"; done | sort | head -1
printf 'signed / annotated: '; signed=$(git -C /home/diablo/book16/repos/ffmpeg for-each-ref refs/tags --format='%(objectname)' | while read obj; do git -C /home/diablo/book16/repos/ffmpeg cat-file -p "$obj" 2>/dev/null | rg -q '^-----BEGIN (PGP|SSH) SIGNATURE-----' && echo signed; done | wc -l); annotated=$(git -C /home/diablo/book16/repos/ffmpeg for-each-ref refs/tags --format='%(objecttype)' | rg -c '^tag$'); echo "$signed / $annotated"
n5.1 4f3c925bd5e8f253c1dbf57eb9552b92ce0b12d5 e0723b7e4e22492275d476fcd30d759e1198bc5b 2022-07-22T20:07:33+02:00 Michael Niedermayer | FFmpeg 5.1 release
n5.1.1 8536e629f0c35c0e8a2b67e65d3bc60a088fe413 1bad30dbe34f2d100b43e8f773d3fe0b5eb23523 2022-08-31T20:35:54+02:00 Michael Niedermayer | FFmpeg 5.1.1 release
n5.1: no signature
n5.1.1: PGP signature present
earliest signed: 2022-08-31T20:35:54+02:00 n5.1.1
signed / annotated: 63 / 431
```

**Why it is a story.** Forty days after publishing the major 5.1 tag as a message-bearing but unsigned object, the same release manager adds an armored PGP signature to 5.1.1. From the repository alone we cannot say why; we can say exactly when release provenance became cryptographic and that it began on a point release, not a clean major-version boundary. At this clone, only 63 of 431 annotated tag objects carry a PGP or SSH signature block.

**Reader learns:** “annotated tag” and “signed tag” are different claims. Count raw signature blocks, record tag-object and target-commit hashes separately, and use `verify-tag` plus a trusted keyring before upgrading presence into authenticity.

**surprise:** 3

## Verdict

The first report is strong on object identity and diff-level reconstruction: all ranked hashes and quoted patches checked out, but only 12 of 17 discrete claims passed as written.  
Its reliability drops at aggregation and causal shorthand: 1,194 qatar mentions became 1,194 merges, a merge-only histogram was paired with a broader command, and topology/mailmap details were overcompressed.
