| dig | claim | command rerun | result | note |
|---|---|---|---|---|
| Dual EC | Seven-hash add/disable/remove/revert/remove timeline has the reported hashes, author dates, author, and subjects. | <code>git -C ~/book16/repos/openssl show -s --format='%H %aI %an &#124; %s' 591cbfae3cfcb26b45c523499847d3dbe53a44e4 7fdcb45745c01b90b256fe97e87eae31453e11e6 a4870de5aaef562c0947494b410a2387f3a6d04d 200f249b8c3b6439e0200d01caadc24806f1a983 3b43568d5bae85196834f9ca3339b32a77ab2c4b 7fb7844f3b40b60c2df77e093398da55d7928e9d 78c990c156ba79521e98728e9a604b4c5cc8adec</code> | **PASS** | All seven identities and subjects match. `7fdcb45745` is exactly +2,121/−11; each remove/revert is 2,265 lines in the stated direction, plus two lines in the other direction. |
| Dual EC | `3b43568d5b` says the removal was not accepted for 2.0.7 and reverts `200f249b8c`. | <code>git -C ~/book16/repos/openssl log -1 --format=fuller 3b43568d5bae85196834f9ca3339b32a77ab2c4b</code> | **PASS** | Hash, 2014-05-12 18:35:30 +0100 date, Henson identity, message, and reverted hash match. |
| Dual EC | `7fb7844f3b` says removal was “now accepted for 2.0.8 onwards.” | <code>git -C ~/book16/repos/openssl log -1 --format=fuller 7fb7844f3b40b60c2df77e093398da55d7928e9d</code> | **PASS** | The report gives the author date; the distinct commit date is 2014-07-11 19:14:15 +0100. |
| Dual EC | `a4870de5aa` adds the compile-time escape hatch and refuses a Dual EC type by default. | <code>git -C ~/book16/repos/openssl show a4870de5aaef562c0947494b410a2387f3a6d04d -- crypto/rand/rand_lib.c</code> | **PASS** | The eight added functional/preprocessor lines match the excerpt. |
| Dual EC | “FIPS made them put it back”; a lab said 2.0.7 could not certify without Dual EC. | <code>git -C ~/book16/repos/openssl log --all --decorate --format='%H %aI %an %d %s' --date-order --since='2013-12-01' --until='2014-11-01' -- fips/rand/fips_drbg_ec.c</code> | **FAIL** | The repository proves only “not accepted for 2.0.7” and “accepted for 2.0.8 onwards.” It does not identify a lab, say certification required Dual EC, or explain whether rejection was substantive, procedural, or timing-related. The narrower release-policy story is strong; the causal headline exceeds its receipt. |
| Heartbleed feature | `4817504d06` metadata and 20-file +561/−4 stat. | <code>git -C ~/book16/repos/openssl log -1 --format=fuller --stat 4817504d069b4c5082161b02a22116ad75f822b1</code> | **PASS** | Hash, both dates, Henson identity, PR/submission/review text, subject, and stat all match. |
| Heartbleed feature | The vulnerable TLS path reads the wire length with `n2s` and passes it to `memcpy` without a record-length guard. | <code>git -C ~/book16/repos/openssl show 4817504d069b4c5082161b02a22116ad75f822b1 -- ssl/t1_lib.c</code> | **PASS** | The displayed lines and their order match. No test file appears in this commit’s stat. |
| Heartbleed feature | “Reviewed by: steve” means there was no second pair of eyes. | <code>git -C ~/book16/repos/openssl log -1 --format=fuller --stat 4817504d069b4c5082161b02a22116ad75f822b1</code> | **FAIL** | Git records Henson as author/committer, but the message records Robin Seggelmann as submitter and Steve as reviewer—two roles held by two people. It proves the Git author field does not identify the patch submitter; it cannot prove how many people reviewed, nor the report’s “student” characterization. |
| Heartbleed fix | `731f431497` metadata, cherry-pick origin, and 3-file +36/−13 stat. | <code>git -C ~/book16/repos/openssl log -1 --format=fuller --stat 731f431497f463f3a2a97236fe0187b11c44aead</code> | **PASS** | Author/commit dates, credits, CVE, origin hash `96db9023b8`, and stat match. |
| Heartbleed fix | Stable-line `96db9023b8` inserts both length guards in `ssl/t1_lib.c`. | <code>git -C ~/book16/repos/openssl show 96db9023b881d7cd9f379b0c154650d6c108e9a3 -- ssl/t1_lib.c</code> | **PASS** | Exact diff matches. “Four lines of arithmetic” is loose shorthand: there are six added source lines in the excerpt—two comments and four executable guard/return lines—and the complete fix is larger. |
| Heartbleed follow-up | The first regression test “arrives ten days later,” on 2014-04-16. | <code>git -C ~/book16/repos/openssl show -s --format='%H%n%aI %cI%n%an &lt;%ae&gt; &#124; %cn &lt;%ce&gt;%n%s%n%b' 6af080acaf</code> | **FAIL** | 2014-04-16 is Mike Bland’s **author** date. Ben Laurie committed it on 2014-05-19, 43.7 days after the fix’s author date (42 days after the 1.0.1g release tag), so “arrives” conflates the two clocks. The external-author and test-content claims pass. |
| Heartbleed teardown | TLS removal, complete removal, two-minute revert, and 2019-delayed re-removal hashes/messages match. | <code>git -C ~/book16/repos/openssl show -s --format='%H %aI %cI %an &#124; %s' 22e3dcb780 6c62f9e163 b612799a80 558ea84743</code> | **PASS** | `b612799a80` is 2016-11-15 14:53:33 and `558ea84743` author time is 14:55:40; the latter’s commit date is 2019-03-29. |
| OpenTLS | Seven-commit chronology from “start the OpenTLS project” to “Switch to OpenSSL name.” | <code>git -C ~/book16/repos/openssl log --format='%h %aI %s' --reverse 651d0aff^..f1c236f8</code> | **PASS** | Hashes, dates, subjects, and order match. A separate `%an &lt;%ae&gt;` rerun confirms Ralf S. Engelschall on all seven. “Sixteen hours” is a fair rounding of 16h34m from start to rename (15h38m from “OpenTLS ready”). |
| OpenTLS | `f1c236f849` changes OpenTLS to OpenSSL in `LICENSE`. | <code>git -C ~/book16/repos/openssl show f1c236f849d9799a5de0ad1f6c64b33291f60c84 -- LICENSE</code> | **PASS** | Hash, 1998-12-23 07:38:54 +0000 date, Engelschall identity, subject, project name, URLs, contact address, and trademark text all match. |

## New dig 1 — Heartbleed’s Git release tag was unsigned; signed tag objects appear two years later

- **find-type:** 2 (planted / dated artifact)
- **hashes:** tag object `7434fe25b14aa036f6b9e12358abeaebdb7b250a` → commit `b2d951e4232d2f90168f9a3dd0b7df9ecf2d81a8` (`OpenSSL_1_0_1g`); tag object `04a54629c2bb904e9bd9a1d98381b1259147cc0d` → commit `2f554efe20d1fe05b242f41f593362965ae89912` (`OpenSSL_1_1_0-pre6`)
- **date:** 2014-04-07 17:55:44 +0100; 2016-08-04 15:00:44 +0100
- **author/tagger:** Dr. Stephen Henson; Matt Caswell
- **message:** *OpenSSL 1.0.1g release tag*; *OpenSSL 1.1.0-pre6 release tag*

```
for t in OpenSSL_1_0_1g OpenSSL_1_1_0-pre6; do git -C /home/diablo/book16/repos/openssl for-each-ref --format='%(refname:short) %(objectname) %(creatordate:iso8601) %(taggername) | %(subject)' "refs/tags/$t"; if git -C /home/diablo/book16/repos/openssl cat-file -p "$t" | rg -q '^-----BEGIN PGP SIGNATURE-----'; then echo 'signature: present'; else echo 'signature: absent'; fi; done
OpenSSL_1_0_1g 7434fe25b14aa036f6b9e12358abeaebdb7b250a 2014-04-07 17:55:44 +0100 Dr. Stephen Henson | OpenSSL 1.0.1g release tag
signature: absent
OpenSSL_1_1_0-pre6 04a54629c2bb904e9bd9a1d98381b1259147cc0d 2016-08-04 15:00:44 +0100 Matt Caswell | OpenSSL 1.1.0-pre6 release tag
signature: present
```

A creator-date scan of every annotated tag finds `OpenSSL_1_1_0-pre6` as the earliest object containing an ASCII-armored PGP signature (then `OpenSSL_1_1_0` and `OpenSSL_1_1_0a`).

**Why it is a story.** The tag for 1.0.1g—the emergency release carrying the Heartbleed fix—is annotated but contains no embedded PGP signature. Two years later, immediately before 1.1.0, an armored signature becomes part of the Git tag object. The moment before the outcome is a user looking at a reassuring release annotation that Git itself cannot authenticate. This finding is deliberately narrow: it says nothing about signatures distributed separately with release tarballs.

**What the reader learns.** “Annotated” and “signed” are independent properties. `git cat-file -p TAG` lets readers audit what trust evidence is actually stored in their clone; `git verify-tag` is the next step when a signature is present.

**surprise:** 4

## New dig 2 — A 2019 author clock reaches `master` in late 2025

- **find-type:** 2 (planted / dated artifact)
- **hash:** `ec114826755f200e7ecfe0e4e0dd68bd883917bf`
- **date:** author 2019-01-31 17:54:17 +0100; committer 2025-11-25 09:09:33 +0100 (215,104,516 seconds, about 6.82 years, apart)
- **author / committer:** David von Oheimb `<David.von.Oheimb@siemens.com>` / Tomas Mraz `<tomas@openssl.org>`
- **message:** *Remove extra leading '00:' when printing key material with highest byte >= 0x80*; merged from PR #8136

```
git -C /home/diablo/book16/repos/openssl log --all --format='%H%x09%at%x09%ct%x09%aI%x09%cI%x09%an%x09%cn%x09%s' | awk -F '\t' '$2>1262304000 {d=$3-$2; if(d<0)d=-d; print d "\t" $1 "\t" $4 "\t" $5 "\t" $6 " | " $7 " | " $8}' | sort -nr | sed -n '1,5p'
215104516	ec114826755f200e7ecfe0e4e0dd68bd883917bf	2019-01-31T17:54:17+01:00	2025-11-25T09:09:33+01:00	David von Oheimb | Tomas Mraz | Remove extra leading '00:' when printing key material with highest byte >= 0x80
172839654	09d12ef1d740f0330ac2a04f281fb2838df0db7b	2021-01-17T02:04:08+01:00	2026-07-10T08:05:02-04:00	Mounir IDRASSI | Neil Horman | Allow MinGW-w64 builds to use BCryptGenRandom
148353400	ca857d7332d042142ced23b37fdd1d52dbf152b9	2018-09-26T08:30:54+02:00	2023-06-09T09:47:34+02:00	Dr. Matthias St. Pierre | Tomas Mraz | apps/opt: refactor input format parsing
148353033	34df960a75aeb85b97e5ac70465275c2057ee1a3	2018-09-26T08:37:01+02:00	2023-06-09T09:47:34+02:00	Dr. Matthias St. Pierre | Tomas Mraz | apps/asn1parse: improve RFC7462 compliance
142282849	c7f2651a648c9c0babd625cffdb684895db4b193	2021-08-19T20:58:55+02:00	2026-02-21T14:59:44+01:00	Dr. David von Oheimb | Dr. David von Oheimb | X509V3_set_ctx(): Improve error handling using this function, mostly in apps/
```

**Why it is a story.** Among post-2010 commits reachable from all refs, this has the largest absolute gap between the two Git clocks. Its message still credits 2019’s PR #8136, while its final diff speaks the later provider architecture and was committed by a different maintainer in 2025. The moment before the outcome is not “six years of unchanged code waiting”; Git cannot prove that. It is a maintainer integrating work whose attribution clock belongs to another era of the tree.

**What the reader learns.** `%aI` answers when the author says the work originated; `%cI` answers when this commit entered its recorded lineage. Sorting the delta exposes revived, rebased, cherry-picked, or delayed work—and warns against narrating author time as landing time.

**surprise:** 4

## New dig 3 — Four empty commits are the chapter dividers of a QUIC migration

- **find-type:** 2 (planted artifact)
- **hashes:** `304e56e87033fc2108478bc8c131e12f6e1759f2`, `a96f48995ed1cbedf65ac700211b65b09e40e0be`, `cbf4b68333dc48fc50905b867bbd1f8cda09de4c`, `99655cb91d669273da23c40912b77004ea086b97`
- **date:** 2023-11-09 10:27:13–10:27:14 +0000 (author dates; committed 2023-12-21)
- **author:** Hugo Landau `<hlandau@openssl.org>`
- **messages:** *MARKER: End of Phase 1: Unused QUIC_PORT* through *MARKER: End of Phase 4: Finalization & SRT Handling*

```
for h in 304e56e87033fc2108478bc8c131e12f6e1759f2 a96f48995ed1cbedf65ac700211b65b09e40e0be cbf4b68333dc48fc50905b867bbd1f8cda09de4c 99655cb91d669273da23c40912b77004ea086b97; do git -C /home/diablo/book16/repos/openssl diff-tree --quiet "$h^" "$h" && state=EMPTY || state=CHANGED; git -C /home/diablo/book16/repos/openssl show -s --format="%H %aI %an | $state | %s" "$h"; done
304e56e87033fc2108478bc8c131e12f6e1759f2 2023-11-09T10:27:13+00:00 Hugo Landau | EMPTY | MARKER: End of Phase 1: Unused QUIC_PORT
a96f48995ed1cbedf65ac700211b65b09e40e0be 2023-11-09T10:27:13+00:00 Hugo Landau | EMPTY | MARKER: End of Phase 2: Transfer of Responsibilities Done, Legacy Compat Retained
cbf4b68333dc48fc50905b867bbd1f8cda09de4c 2023-11-09T10:27:14+00:00 Hugo Landau | EMPTY | MARKER: End of Phase 3: Legacy Cleanup
99655cb91d669273da23c40912b77004ea086b97 2023-11-09T10:27:14+00:00 Hugo Landau | EMPTY | MARKER: End of Phase 4: Finalization & SRT Handling
```

**Why it is a story.** A long QUIC routing refactor deliberately plants four commits whose trees equal their parents. They carry no code, yet they preserve the author’s four-phase mental model on `master`. The moment before each outcome is a reviewer crossing from responsibility transfer into legacy cleanup and needing a boundary more durable than a pull-request comment.

**What the reader learns.** Empty commits may be scaffolding rather than accidents. Compare each tree to its first parent before deleting or squashing it; metadata can be the payload, especially in a staged migration.

**surprise:** 3

## New dig 4 — `--follow` watches the double license vanish, then the filename change

- **find-type:** 4 (a name disappears / appears)
- **hashes:** `151333164ece49fdba3fe5c4bbdc3333cd9ae66d` (license change); `036cbb6bbf30955abdcffaf6e52cd926d8d8ee75` (`LICENSE` → `LICENSE.txt`)
- **date:** 2018-12-06 12:52:18 +0100; 2020-06-10 14:15:28 +0200
- **authors:** Richard Levitte; Dr. David von Oheimb
- **messages:** *Change license to the Apache License v2.0*; *Rename NOTES*, README*, VERSION, HACKING, LICENSE to .md or .txt*

```
git -C /home/diablo/book16/repos/openssl log --follow --format='%H %aI %an | %s' --name-status -- LICENSE.txt | sed '/^$/d' | head -8
036cbb6bbf30955abdcffaf6e52cd926d8d8ee75 2020-06-10T14:15:28+02:00 Dr. David von Oheimb | Rename NOTES*, README*, VERSION, HACKING, LICENSE to .md or .txt
R100	LICENSE	LICENSE.txt
151333164ece49fdba3fe5c4bbdc3333cd9ae66d 2018-12-06T12:52:18+01:00 Richard Levitte | Change license to the Apache License v2.0
M	LICENSE
7c24f9d21cddd2bb30167153b05168fee7e3cf0b 2018-01-20T10:02:23+01:00 Richard Levitte | Update the license end year
M	LICENSE
6faa3456326afa56ea8c25a0b49239392074e192 2017-02-27T12:36:37-05:00 Rich Salz | Update year, wording tweak
M	LICENSE
```

`151333164e` changes four files (+184/−128). Its body draws an unusually explicit legal branch boundary: Apache 2.0 applies to `master` and OpenSSL 3.0.0 onward; pre-3.0 versions retain the old double license.

**Why it is a story.** For twenty years the tracked license says both the OpenSSL and original SSLeay conditions apply. One 2018 commit replaces that legal identity for a future major release while leaving every maintained pre-3.0 line in the previous world. The moment before the outcome is `master` still carrying the 125-line double-license text and maintainers deciding that a branch can also be a legal boundary.

**What the reader learns.** Legal history forks just like code. Start from today’s renamed file with `--follow`, then check which branches contain the policy commit; a current license file does not retroactively describe old releases.

**surprise:** 4

## New dig 5 — A stale stable branch begins with a five-parent “merge” nobody performed

- **find-type:** 2 (planted / converted artifact)
- **hash:** `247c3f60494e11c038595d7e5ae9e4edac181cc7`
- **date:** 2012-03-21 21:32:58 +0000
- **author:** `cvs2svn <cvs2svn>`
- **message:** *This commit was manufactured by cvs2svn to create branch 'OpenSSL_1_0_2-stable'.*

```
git -C /home/diablo/book16/repos/openssl rev-list --all --parents | awk 'NF>=5 {print NF-1, $1}' | sort -nr | sed -n '1,2p'; git -C /home/diablo/book16/repos/openssl show --no-patch --format='%H%n%aI %an <%ae>%nParents: %P%n%s' 247c3f60494e11c038595d7e5ae9e4edac181cc7; git -C /home/diablo/book16/repos/openssl branch -a --contains 247c3f60494e11c038595d7e5ae9e4edac181cc7
5 cd9bed6d1dbd13e30e557b2a9a2d67773b1513f9
5 247c3f60494e11c038595d7e5ae9e4edac181cc7
247c3f60494e11c038595d7e5ae9e4edac181cc7
2012-03-21T21:32:58+00:00 cvs2svn <cvs2svn>
Parents: bd5770c6b1b38784e62d4f178068b325a6181822 4c78bc05c44ca16daaf5a568eedd0fee700f5de8 78c5d2a9bb60fa3f5b730d5cf39127f3200b5eef dfeab0689f69c0b4bd3480ffd37a9cacc2f17d9c 15403de6ca3efca660f8e7311cc21311ccdd23ae
This commit was manufactured by cvs2svn to create branch 'OpenSSL_1_0_2-stable'.
  remotes/origin/OpenSSL_1_0_2-stable
```

**Why it is a story.** `master` hides this topology; `--all` finds it only on the now-stale 1.0.2 remote branch. Git presents a five-parent octopus, but the author and message confess that no five-way integration meeting occurred: a converter needed to encode CVS branch state. The moment before the outcome is a non-Git branch being forced to choose Git ancestors.

**What the reader learns.** Parent count is not proof of human coordination. On converted repositories, inspect odd merges’ identities, messages, and containing refs before treating them as engineering events; stale refs often preserve the conversion seams that `HEAD` omits.

**surprise:** 3

Reliability verdict: hashes, dates, subjects, and displayed diffs are unusually accurate; all 11 receipt-level checks passed.  
Its reliability drops at interpretation: 3 claims overstate evidence or conflate author and commit dates (Dual EC cause, Heartbleed review independence, and test arrival).
