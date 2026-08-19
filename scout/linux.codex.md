# Independent scout: torvalds/linux

## Verification table

| Dig | Claim | Command rerun | Result | Note |
|---|---|---|---|---|
| 2 | `origin/master` has four parent-zero commits, with the reported hashes, dates, authors, and subjects. | `git -C /home/diablo/book16/repos/linux log --max-parents=0 --pretty='format:%H %aI %an %s' origin/master` | PASS | All four rows reproduce exactly. |
| 2 | `a101ad945113` is ldewangan's 2016-02-23 `Share upstreaming patches`, adding a two-line `README.md` with the quoted text. | `git -C /home/diablo/book16/repos/linux show --stat a101ad945113be3d7f283a181810d76897f0a0d6` and `git -C /home/diablo/book16/repos/linux show a101ad945113be3d7f283a181810d76897f0a0d6:README.md` | PASS | Metadata, `1 file changed, 2 insertions(+)`, and both lines match. |
| 2 | Four minutes later, `e5451c8f8330` “merges that root into a GPIO topic branch” and has parents `a101ad9 3cf42ef`. | `git -C /home/diablo/book16/repos/linux show -s --format='commit %H%nparents %P%nAuthor: %an <%ae>%nAuthorDate: %aI%n%s' e5451c8f8330` | FAIL | Hash, time, parents, and subject match, but the direction is reversed. `a101ad9` is first parent: while on `devm_gpiochip`, Laxman merged `linusw-gpio/for-next` (`3cf42ef`) *into the README-rooted branch*. A later integration carried that result into Linux. |
| 2 | The README root is an ancestor of `origin/master`, while `README.md` is absent at the tip. | `git -C /home/diablo/book16/repos/linux merge-base --is-ancestor a101ad945113 origin/master` and `git -C /home/diablo/book16/repos/linux cat-file -e origin/master:README.md` | PASS | The ancestry check exits 0; the path lookup exits 128. |
| 2 | Someone at NVIDIA “clicked GitHub's new repository affordance.” | `git -C /home/diablo/book16/repos/linux show --format=fuller --stat a101ad945113be3d7f283a181810d76897f0a0d6` | FAIL | The commit proves the author, repository-root shape, message, and README contents. It does not record which UI or command created the repository; “clicked” is unsupported reconstruction. |
| 3 | `19be0eaffa3a` has the reported Linus metadata, five-day author/committer gap, message, and 13-insertion/two-deletion stat. | `git -C /home/diablo/book16/repos/linux show --stat --format=fuller 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619` | PASS | Author date is 2016-10-13, commit date 2016-10-18; all identity, subject, and stat fields match. |
| 3 | The Dirty COW patch introduces `FOLL_COW` and changes the forced-write test in the reported two files. | `git -C /home/diablo/book16/repos/linux show --format=fuller --no-ext-diff 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 -- include/linux/mm.h mm/gup.c` | PASS | The diff adds `FOLL_COW`, `can_follow_write_pte()`, and replaces clearing `FOLL_WRITE` with setting `FOLL_COW`. |
| 3 | `4ceb5db9757a` is Linus's 2005 attempted fix and changes `mm/memory.c` by 4 insertions and 17 deletions. | `git -C /home/diablo/book16/repos/linux show --stat --format=fuller 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6` | PASS | Hash, email, date, subject, and stat all match. |
| 3 | Two days later `f33ea7f404e5` backs out the `pte_dirty()` test because of s390 and `copy_one_pte`. | `git -C /home/diablo/book16/repos/linux show --format=fuller --no-ext-diff f33ea7f404e592e4563b12101b7a4d17da6558d7 -- mm/memory.c` | PASS | The quoted reasons and code reversal are exact. Nuance: this is not a wholesale revert; it substitutes a larger `VM_FAULT_WRITE` protocol intended to retain a fix. |
| 3 | The 2016 commit itself says the 2005 attempt was bad, undone for s390, and that software dirty bits arrived in v3.9. | `git -C /home/diablo/book16/repos/linux show -s --format='%B' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619` | PASS | All three historical statements are in Linus's message. |
| 1 | `1da177e4c3f4` has the reported date, author/email, subject, and full “not bothering with the full history” / “Let it rip!” message. | `git -C /home/diablo/book16/repos/linux log -1 --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aD%n%n%B' 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2` | PASS | Reproduces exactly. |
| 1 | Author and committer are both Linus on the same timestamp, using `torvalds@ppc970.osdl.org`. | `git -C /home/diablo/book16/repos/linux show -s --format='Author: %an <%ae>%nAuthorDate: %aI%nCommitter: %cn <%ce>%nCommitDate: %cI' 1da177e4c3f4` | PASS | Both identity and time fields are identical. The email supports, but does not independently prove, the prose's “PowerPC box” interpretation. |
| 1 | The root snapshot changes 17,291 files with 6,718,755 insertions. | `git -C /home/diablo/book16/repos/linux diff-tree --root --shortstat 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2` | PASS | Stat matches exactly. |
| 1 | `1da177e4` remains unambiguous, and `8d38eadb7a97` follows 3m17s later with the reported author and subject. | `git -C /home/diablo/book16/repos/linux rev-parse --disambiguate=1da177e4` and `git -C /home/diablo/book16/repos/linux show -s --format='%H %aI %an <%ae> %s' 8d38eadb7a97` | PASS | The abbreviation resolves to one object; the next commit is at 15:23:53 versus 15:20:36. |

## New digs

Ref inventory first: this clone has exactly one ref, `refs/remotes/origin/master`; `git tag` and `git notes list` return nothing. There are therefore no stale branches, tag refs, or notes to mine locally. The first dig is the useful exception: a signed annotated tag survives *inside* a merge commit even though the tag ref itself was not fetched.

### 1. The tag is gone; its signed body is sealed inside the merge

- **find-type:** 2 (planted/durable artifact)
- **hash:** `1200d84f4c0a929a0780180d25063d93773be79c`
- **date:** 2026-08-18 12:08:13 -0700 (tagger timestamp: 2026-08-17 10:07:18 +0530)
- **author:** Linus Torvalds `<torvalds@linux-foundation.org>`; embedded tagger Madhavan Srinivasan `<maddy@linux.ibm.com>`
- **message:** `Merge tag 'powerpc-7.3-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux`

```
git -C /home/diablo/book16/repos/linux cat-file commit 1200d84f4c0a929a0780180d25063d93773be79c | awk '/^(author|committer|mergetag| type | tag | tagger | -----BEGIN PGP)/ {print}'
git -C /home/diablo/book16/repos/linux for-each-ref --format='%(refname) %(objecttype) %(objectname)'
author Linus Torvalds <torvalds@linux-foundation.org> 1787080093 -0700
committer Linus Torvalds <torvalds@linux-foundation.org> 1787080093 -0700
mergetag object 1304643a1c20badbb91b86a5084dd76cb7620c05
 type commit
 tag powerpc-7.3-1
 tagger Madhavan Srinivasan <maddy@linux.ibm.com> 1786941438 +0530
 -----BEGIN PGP SIGNATURE-----
refs/remotes/origin/master commit 1200d84f4c0a929a0780180d25063d93773be79c
```

**Why it is a story.** The moment before the merge, Madhavan has 62 PowerPC commits and signs the annotated `powerpc-7.3-1` tag before asking Linus to pull it. Linus's merge embeds the tag object and its ASCII-armored signature as a `mergetag` header. This clone later loses—or never fetches—the tag ref, yet the signed handoff remains welded into the merge commit. This proves signature *presence*, not validity: verification also needs the signer's public key.

**Reader learns:** do not stop at `git tag`. For a vanished release or subsystem tag, inspect the merge object with `git cat-file commit`; `mergetag` can retain the tag name, tagger, message, and signature after the ref is gone.

**surprise:** 4

### 2. One space waits eleven years, seven months to reach Linux

- **find-type:** 1 (tiny diff, long blast radius) and 2 (dated/cross-repository artifact)
- **hash:** `694174f94ebeeb5ec5cc0e9de9b40c82057e1d95`
- **date:** author 2013-11-14 00:53:32 +0100; committer 2025-06-24 20:30:27 +0900
- **author:** Yann E. MORIN `<yann.morin.1998@free.fr>`; committer Masahiro Yamada `<masahiroy@kernel.org>`
- **message:** `kconfig: lxdialog: fix 'space' to (de)select options`

```
git -C /home/diablo/book16/repos/linux show --format='%H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommitter: %cn <%ce>%nCommitDate: %cI%n%s' --stat 694174f94ebeeb5ec5cc0e9de9b40c82057e1d95 | sed -n '1,10p'
694174f94ebeeb5ec5cc0e9de9b40c82057e1d95
Author: Yann E. MORIN <yann.morin.1998@free.fr>
AuthorDate: 2013-11-14T00:53:32+01:00
Committer: Masahiro Yamada <masahiroy@kernel.org>
CommitDate: 2025-06-24T20:30:27+09:00
kconfig: lxdialog: fix 'space' to (de)select options
 scripts/kconfig/lxdialog/menubox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
```

```
git -C /home/diablo/book16/repos/linux show --format= --unified=1 694174f94ebeeb5ec5cc0e9de9b40c82057e1d95 -- scripts/kconfig/lxdialog/menubox.c | tail -7
--- a/scripts/kconfig/lxdialog/menubox.c
+++ b/scripts/kconfig/lxdialog/menubox.c
@@ -266,3 +266,3 @@ do_resize:
-               if (strchr("ynmh", key))
+               if (strchr("ynmh ", key))
                i = max_choice;
```

**Why it is a story.** The moment before this lands, pressing Space in `menuconfig` can jump among punctuation-only comments instead of toggling the highlighted option. Masahiro does not freshly author the obvious one-character fix: his trailer says he “took [it] from Buildroot” and preserves Yann's 2013 authorship. A tiny UI bug spends nearly twelve years fixed in a downstream sibling before crossing back into Linux.

**Reader learns:** author date is not arrival date. Large author/committer gaps plus provenance trailers such as “took from” reveal patches transplanted between repositories; inspect both `%aI` and `%cI` before constructing a timeline.

**surprise:** 5

### 3. `.mailmap` lets an author rename her old history without rewriting it

- **find-type:** 4 (name disappears / appears)
- **hashes:** `043c1f6d84f6cd5d23ddd508ce5209cf0a3a3f41` (mapping change); `19c4aba2d4e23997061fb11aed8a3e41334bfa14` (an older commit as displayed raw and mapped)
- **date:** 2026-07-11 02:43:19 +0300 (mapping authored; committed 2026-07-21 12:08:46 -0700)
- **author:** Alice Mikityanska `<alice.kernel@fastmail.im>`
- **message:** `mailmap: update entry for Alice Mikityanska`

```
git -C /home/diablo/book16/repos/linux show --format='%H%n%aI%n%an <%ae>%n%s' --unified=0 043c1f6d84f6cd5d23ddd508ce5209cf0a3a3f41 -- .mailmap | sed -n '1,4p;/^+Alice Mikityanska/p'
043c1f6d84f6cd5d23ddd508ce5209cf0a3a3f41
2026-07-11T02:43:19+03:00
Alice Mikityanska <alice.kernel@fastmail.im>
mailmap: update entry for Alice Mikityanska
+Alice Mikityanska <alice.kernel@fastmail.im> <maxtram95@gmail.com>
+Alice Mikityanska <alice.kernel@fastmail.im> <maximmi@mellanox.com>
+Alice Mikityanska <alice.kernel@fastmail.im> <maximmi@nvidia.com>
+Alice Mikityanska <alice.kernel@fastmail.im> <maxim@isovalent.com>
+Alice Mikityanska <alice.kernel@fastmail.im> <alice@isovalent.com>
```

```
git -C /home/diablo/book16/repos/linux -c mailmap.blob=origin/master:.mailmap show -s --format='raw: %an <%ae>%nmailmapped: %aN <%aE>%n%H %aI %s' 19c4aba2d4e23997061fb11aed8a3e41334bfa14
raw: Maxim Mikityanskiy <maximmi@mellanox.com>
mailmapped: Alice Mikityanska <alice.kernel@fastmail.im>
19c4aba2d4e23997061fb11aed8a3e41334bfa14 2020-07-22T16:32:44+03:00 net/mlx5e: Fix ICOSQ recovery flow for XSK
```

**Why it is a story.** The moment before the patch, years of work are split across corporate addresses and an old name. Alice adds five aliases and removes two old canonical entries; after the change, mailmap-aware Git presents the 2020 commit under her current name and address while the immutable commit object still contains its original bytes. The decision is explicit in her message: “Map all my corporate and old emails and update my name.”

**Reader learns:** contributor identity has two layers: raw `%an/%ae` and mailmapped `%aN/%aE`. A `.mailmap` repairs shortlogs and lets people update historical display without a history rewrite. In a bare or empty working tree, point Git at the committed map with `-c mailmap.blob=<ref>:.mailmap`.

**surprise:** 4

### 4. The top-level README moved away, then a different README took its name

- **find-type:** 4 (a file identity disappears / appears), also 2 (replacement artifact)
- **hashes:** `9d85025b0418163fae079c9ba8f8445212de8568` (99% rename); `6bef44b9b969a8bcf49f28a3079400ab1dac5769` (new top-level pointer)
- **date:** authored 2016-09-21 09:51:11 -0300 and 2016-10-18 10:46:38 -0200; both committed 2016-10-24 08:12:35 -0200
- **author:** Mauro Carvalho Chehab `<mchehab@s-opensource.com>`
- **messages:** `docs-rst: create an user's manual book`; `README: add a new README file, pointing to the Documentation/`

```
git -C /home/diablo/book16/repos/linux show --format='%H %aI%n%an <%ae>%n%s' --summary --find-renames 9d85025b0418163fae079c9ba8f8445212de8568 -- README Documentation/admin-guide/README.rst | sed '/^$/d'
git -C /home/diablo/book16/repos/linux show --format='%H %aI%n%an <%ae>%n%s' --summary 6bef44b9b969a8bcf49f28a3079400ab1dac5769 -- README | sed '/^$/d'
9d85025b0418163fae079c9ba8f8445212de8568 2016-09-21T09:51:11-03:00
Mauro Carvalho Chehab <mchehab@s-opensource.com>
docs-rst: create an user's manual book
 rename README => Documentation/admin-guide/README.rst (99%)
6bef44b9b969a8bcf49f28a3079400ab1dac5769 2016-10-18T10:46:38-02:00
Mauro Carvalho Chehab <mchehab@s-opensource.com>
README: add a new README file, pointing to the Documentation/
 create mode 100644 README
```

**Why it is a story.** The moment before the documentation conversion, the root `README` is both release notes and build manual. Mauro moves 99% of that content into the new administrator's guide, fixes references in two intervening commits, then creates a different 18-line `README` at the vacated pathname to point readers inward. The familiar filename survives, but the original file does not stay there.

**Reader learns:** a pathname is not a file identity. Use `--follow` to pursue content, then `show --summary --find-renames` around the boundary: a rename followed by a create means today's same-named file is a replacement, not the old file continuing in place.

**surprise:** 3

The first report is highly reliable on receipts: all top-three hashes, dates, identities, subjects, and diff facts reproduced.
Its reliability drops at narrative joins: 12 claims passed and 2 failed, both from inference beyond what the commit objects establish (including one reversed merge direction).
