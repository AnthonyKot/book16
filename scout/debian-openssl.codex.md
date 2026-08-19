# debian-openssl — second-scout verification and extensions

## Verification table

| Dig / claim | Command rerun | Result | Note |
|---|---|---:|---|
| Ranked #1 / dig 3: `33a9d075e9` moved the modified file from `rand/` to `crypto/rand/`; `a590e4f469` made the nested-comment form compile. Hashes, dates, author, subjects, and diff match. | `git -C /home/diablo/book16/repos/debian-openssl show --stat --format='%h %aI %s' 33a9d075e95aa0b88c163a1fc45e6ff50cf4eed3`<br>`git -C /home/diablo/book16/repos/debian-openssl ls-tree --name-only debian/openssl-0.9.8b-1 rand/md_rand.c crypto/rand/md_rand.c`<br>`git -C /home/diablo/book16/repos/debian-openssl grep -n 'uninitialised' debian/openssl-0.9.8b-1 -- rand/md_rand.c crypto/rand/md_rand.c`<br>`git -C /home/diablo/book16/repos/debian-openssl show a590e4f46997ce41db5c21dddb2638c8780c46f5` | **PASS** | The rename is recorded as `{rand => crypto/rand}/md_rand.c \| 0`; the tag has only `rand/md_rand.c`; the follow-up replaces the outer `/* ... */` around the already-commented `MD_Update` with `#if 0`. Supplementary `show -s --format=fuller` confirms Kurt Roeckx and both stated timestamps. The vulnerable source was tagged as `debian/openssl-0.9.8c-1` later that same day, so “made the CVE real” is fair as source/build history, not a claim that installed machines changed at commit time. |
| Ranked #1 / dig 3: the displayed output for the `grep -n 'uninitialised'` command is exact. | Same `git grep` command above. | **FAIL** | The command actually prints **two** matches, at `rand/md_rand.c:275` and `rand/md_rand.c:472`; the report's block shows only line 275 and then inserts `# crypto/rand/md_rand.c does not exist`. The prose correctly discusses both wrappers, so this is an output-transcription defect rather than a broken dig. |
| Ranked #2 / dig 2: `b03fc02755` added 572 lines at the wrong path; nine minutes later `8f27a7dc02` added two three-line comment wrappers plus a three-line changelog entry. Metadata and contents match. | `git -C /home/diablo/book16/repos/debian-openssl show --format=fuller --stat b03fc027554b096402708b4e762bc05eb1d59d0e 8f27a7dc022e95ab7274628715f22207235f8e36`<br>Content check: `git -C /home/diablo/book16/repos/debian-openssl show --format=fuller 8f27a7dc022e95ab7274628715f22207235f8e36 -- rand/md_rand.c debian/changelog` | **PASS** | Both author and committer are Kurt Roeckx. Times are 16:25:19 and 16:34:53 UTC. The patch wraps `MD_Update(&m,buf,j)` once in `ssleay_rand_add` and once in `ssleay_rand_bytes`; the changelog trailer really is dated 6 April 2006. |
| Ranked #3 / dig 4: `f7949d6e0a` restores only the seed-path `MD_Update`, raises urgency, and changes the restart threshold; neither named advisory string occurs in a commit message. | `git -C /home/diablo/book16/repos/debian-openssl show --format=fuller --stat f7949d6e0a140e9a87e483ae89b140f1c57755d3`<br>`git -C /home/diablo/book16/repos/debian-openssl log --all --grep='CVE-2008-0166' --oneline \| wc -l`<br>`git -C /home/diablo/book16/repos/debian-openssl log --all --grep='DSA-1571' --oneline \| wc -l`<br>Content check: `git -C /home/diablo/book16/repos/debian-openssl show f7949d6e0a140e9a87e483ae89b140f1c57755d3 -- crypto/rand/md_rand.c debian/changelog debian/libssl0.9.8.postinst` | **PASS** | Hash, 2008-05-07T18:35:39+00:00, Kurt Roeckx, and subject all match. The diff removes only the three-line comment around `ssleay_rand_add`'s call, changes `low` to `high`, and moves the postinst threshold from `0.9.8e-9` to `0.9.8g-9`. Both grep counts are zero. The stated release-tag object `1ac67b088f` and peeled commit `854b7eca26` also resolve exactly. |
| Ranked #3 / dig 5: `c03d4f6594` is Kurt's 2009 backfill of a changelog stanza signed by Florian Weimer in 2008, and the unstable fix is not an ancestor of `origin/debian/etch`. | `git -C /home/diablo/book16/repos/debian-openssl log -1 --format=fuller debian/openssl-0.9.8c-4etch3`<br>`git -C /home/diablo/book16/repos/debian-openssl show c03d4f6594cbe965318bbadf4b0d1fde7068a5ac -- debian/changelog`<br>`git -C /home/diablo/book16/repos/debian-openssl merge-base --is-ancestor f7949d6e0a140e9a87e483ae89b140f1c57755d3 origin/debian/etch; echo $?` | **PASS** | The peeled commit, author date, author, subject, inserted Florian trailer, and ancestry exit status `1` all match. `rev-parse` confirms annotated tag object `f138bdd16f` peels to `c03d4f6594`. |
| Ranked #3 / dig 5: the exact `git log -1 --format=fuller <tag>` command prints the quoted `TaggerDate`. | `git -C /home/diablo/book16/repos/debian-openssl log -1 --format=fuller debian/openssl-0.9.8c-4etch3` | **FAIL** | Here that command begins at `commit c03d4f...` and prints no tagger field. The underlying date is correct—`git cat-file -p debian/openssl-0.9.8c-4etch3` gives tagger epoch `1242485888 +0000`, i.e. 2009-05-16T14:58:08+00:00—but the report attributes it to a command that does not emit it. |

## New dig 1: A March branch has five parents, one of which remembers July

- **Find-type:** 2 (planted/dated artifact)
- **Hashes:** `247c3f60494e11c038595d7e5ae9e4edac181cc7` (manufactured five-parent merge); `bd5770c6b1b38784e62d4f178068b325a6181822` (its chronologically impossible-looking first parent)
- **Dates:** `247c3f6049`: 2012-03-21T21:32:58+00:00; `bd5770c6b`: 2007-04-08T17:50:58+00:00, although its subject names 2012-07-04
- **Authors:** `cvs2svn <cvs2svn>` / Dr. Stephen Henson `<steve@openssl.org>`
- **Messages:** `This commit was manufactured by cvs2svn to create branch 'OpenSSL_1_0_2-stable'.` / `file evp_cnf.c was added on branch OpenSSL_1_0_2-stable on 2012-07-04 13:14:44 +0000`
- **Exact command:**

```sh
repo=/home/diablo/book16/repos/debian-openssl
git -C "$repo" show -s --format='%H%n%aI%n%an <%ae>%n%s%nparents: %P' \
  247c3f60494e11c038595d7e5ae9e4edac181cc7
git -C "$repo" show -s --format='%H%n%aI%n%an <%ae>%n%s' \
  bd5770c6b1b38784e62d4f178068b325a6181822
git -C "$repo" diff --shortstat bd5770c6b1b38784e62d4f178068b325a6181822 \
  247c3f60494e11c038595d7e5ae9e4edac181cc7
```

```text
247c3f60494e11c038595d7e5ae9e4edac181cc7
2012-03-21T21:32:58+00:00
cvs2svn <cvs2svn>
This commit was manufactured by cvs2svn to create branch 'OpenSSL_1_0_2-stable'.
parents: bd5770c6b1b38784e62d4f178068b325a6181822 4c78bc05c44ca16daaf5a568eedd0fee700f5de8 78c5d2a9bb60fa3f5b730d5cf39127f3200b5eef dfeab0689f69c0b4bd3480ffd37a9cacc2f17d9c 15403de6ca3efca660f8e7311cc21311ccdd23ae
bd5770c6b1b38784e62d4f178068b325a6181822
2007-04-08T17:50:58+00:00
Dr. Stephen Henson <steve@openssl.org>
file evp_cnf.c was added on branch OpenSSL_1_0_2-stable on 2012-07-04 13:14:44 +0000
 2274 files changed, 641604 insertions(+)
```

- **Why it is a story:** Immediately before a CVS symbolic branch becomes a Git branch, the converter has to invent topology that CVS never stored. It creates a five-parent merge in March; one synthetic parent carries a 2007 author date and a subject narrating an event four months after the child. Nothing supernatural happened and no developer falsified a date—the conversion encoded file-level branch history as commits—but a reader who treats parent timestamps as a causal timeline will reconstruct a world that cannot have existed.
- **What the reader learns:** In a converted repository, inspect `%P` and messages containing `manufactured` before trusting chronology or measuring “largest commits.” Parentage remains mechanically real while human time may not be. A huge `--stat` on such a merge is conversion geometry, not a 641,604-line coding session.
- **Surprise:** 5

## New dig 2: The signed release and the unsigned `upstream/` import are different trees

- **Find-type:** 2 (planted/dated artifact)
- **Hashes:** native signed tag object `0db96ec48099127b33f7cc7a7e93a54cbddacbef` → commit `577d7010c6ffa98e8dc61d8826693db9d8f57bd5`; Debian import tag object `4d82f0c766bb39eac3844bfb048ad68dd85cc7b6` → commit `b42ad3a5076cb5b1ac27387f01568e0775b2a973`
- **Dates:** native tag/commit 2017-05-25T13:46:16+01:00; import tag/commit 2017-11-05T15:07:26+01:00
- **Authors/taggers:** Matt Caswell `<matt@openssl.org>` / Sebastian Andrzej Siewior `<sebastian@breakpoint.cc>`
- **Messages:** `OpenSSL 1.1.0f release tag` (`Prepare for 1.1.0f release` at the commit) / `Upstream version 1.1.0f` (`New upstream version 1.1.0f` at the commit)
- **Exact command:**

```sh
repo=/home/diablo/book16/repos/debian-openssl
git -C "$repo" for-each-ref \
  --format='%(objectname) %(refname:short) %(taggerdate:iso-strict) %(taggername) | %(contents:subject)' \
  refs/tags/OpenSSL_1_1_0f refs/tags/upstream/1.1.0f
for tag in OpenSSL_1_1_0f upstream/1.1.0f; do
  if git -C "$repo" cat-file -p "$tag" | rg -q 'BEGIN PGP SIGNATURE'; then
    echo "$tag: SIGNED"
  else
    echo "$tag: UNSIGNED"
  fi
done
for tag in OpenSSL_1_1_0f upstream/1.1.0f; do
  printf '%s tree ' "$tag"
  git -C "$repo" rev-parse "$tag^{tree}"
done
git -C "$repo" diff --shortstat 'OpenSSL_1_1_0f^{tree}' 'upstream/1.1.0f^{tree}'
```

```text
0db96ec48099127b33f7cc7a7e93a54cbddacbef OpenSSL_1_1_0f 2017-05-25T13:46:16+01:00 Matt Caswell | OpenSSL 1.1.0f release tag
4d82f0c766bb39eac3844bfb048ad68dd85cc7b6 upstream/1.1.0f 2017-11-05T15:07:26+01:00 Sebastian Andrzej Siewior | Upstream version 1.1.0f
OpenSSL_1_1_0f: SIGNED
upstream/1.1.0f: UNSIGNED
OpenSSL_1_1_0f tree 288fb64b192e1fc770d2aa95be13db1b9fa696a4
upstream/1.1.0f tree 6403b846dc420eb81e81fb81642823da4b033b5e
 4378 files changed, 1979 deletions(-)
```

- **Why it is a story:** In May, OpenSSL signs a Git tag. In November, Debian's normal tarball-import workflow creates a new commit and an annotated tag with the same version in its name. The new tag has no embedded Git signature and its tree is not the signed tag's tree. The diff is dominated by files absent from the import, consistent with release-tarball exclusions, though this command alone does not explain every difference. At the moment of import this is ordinary packaging work, but the cryptographic chain visible in Git ends at the native tag; the similarly named `upstream/1.1.0f` object does not extend it.
- **What the reader learns:** A signed tag elsewhere in the same object store does not authenticate a regenerated import. Compare peeled trees and check the exact tag object. This finding does **not** show a bad tarball—tarballs can have their own signatures—but it shows where provenance must be verified and recorded outside Git.
- **Surprise:** 4

## New dig 3: `origin/master` is a third root containing one sentence

- **Find-type:** 3 (first commit) + 2 (planted artifact)
- **Hash:** `ba9160620e3e9729d3c3a71f4a2cecaeae158f4b`
- **Date:** 2017-11-05T21:08:20+01:00
- **Author:** Sebastian Andrzej Siewior `<sebastian@breakpoint.cc>`
- **Message:** `A note that the master branch is empty`
- **Exact command:**

```sh
repo=/home/diablo/book16/repos/debian-openssl
git -C "$repo" show -s --format='%H%nparents=%P%n%aI%n%an <%ae>%n%s' origin/master
printf 'commits='; git -C "$repo" rev-list --count origin/master
git -C "$repo" merge-base origin/master origin/debian/unstable >/dev/null
echo "merge-base exit=$?"
printf 'README: '; git -C "$repo" show origin/master:README.txt
```

```text
ba9160620e3e9729d3c3a71f4a2cecaeae158f4b
parents=
2017-11-05T21:08:20+01:00
Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
A note that the master branch is empty
commits=1
merge-base exit=1
README: Nothing here, pick a branch of choice.
```

- **Why it is a story:** On the day the gbp layout arrived, Sebastian made `master` an orphan rather than letting it imply that upstream source or Debian packaging belonged there. Before anyone picked a branch, the only instruction was a one-line refusal to choose for them. It has no merge-base with today's `debian/unstable`, adding a third disconnected root to the two histories the first report identified.
- **What the reader learns:** Do not treat `master`, `main`, or even the checked-out branch as semantic truth in packaging repositories. Inspect `origin/HEAD`, enumerate roots under `--all`, and read tiny orphan branches; sometimes the empty branch is deliberate information architecture.
- **Surprise:** 3

## New dig 4: Heartbeats enter on New Year's Eve; Git credits the reviewer as author

- **Find-type:** 7 (feature that became the vulnerability) + 4 (name that appears outside the author field)
- **Hashes:** `bd6941cfaa31ee8a3f8661cb98227a5cbcc0f9f3` (feature on the 1.0.1 line); `731f431497f463f3a2a97236fe0187b11c44aead` (bounds-check fix)
- **Dates:** feature author/commit 2011-12-31T23:00:36+00:00; fix author 2014-04-06T00:51:06+01:00, committed 2014-04-07T19:44:38+01:00
- **Git author:** Dr. Stephen Henson `<steve@openssl.org>` for both. The feature message says `Submitted by: Robin Seggelmann <seggelmann@fh-muenster.de>` and `Reviewed by: steve`.
- **Messages:** `PR: 2658 ... Support for TLS/DTLS heartbeats.` / `Add heartbeat extension bounds check.`
- **Exact command:**

```sh
repo=/home/diablo/book16/repos/debian-openssl
git -C "$repo" show -s --format='%H author=%aI commit=%cI %an <%ae> | %s' \
  bd6941cfaa31ee8a3f8661cb98227a5cbcc0f9f3 731f431497f463f3a2a97236fe0187b11c44aead
git -C "$repo" show -s --format='%b' bd6941cfaa31ee8a3f8661cb98227a5cbcc0f9f3 | sed -n '1,3p'
git -C "$repo" show --format= bd6941cfaa31ee8a3f8661cb98227a5cbcc0f9f3 -- ssl/t1_lib.c | \
  rg '^\+\s*(n2s\(p, payload\)|memcpy\(bp, pl, payload\))' | sed -E 's/^\+[[:space:]]+/+ /'
git -C "$repo" show --format= 731f431497f463f3a2a97236fe0187b11c44aead -- ssl/t1_lib.c | \
  rg '^\+\s*if \(1 \+ 2 \+ (16|payload \+ 16) >' | sed -E 's/^\+[[:space:]]+/+ /'
```

```text
bd6941cfaa31ee8a3f8661cb98227a5cbcc0f9f3 author=2011-12-31T23:00:36+00:00 commit=2011-12-31T23:00:36+00:00 Dr. Stephen Henson <steve@openssl.org> | PR: 2658 Submitted by: Robin Seggelmann <seggelmann@fh-muenster.de> Reviewed by: steve
731f431497f463f3a2a97236fe0187b11c44aead author=2014-04-06T00:51:06+01:00 commit=2014-04-07T19:44:38+01:00 Dr. Stephen Henson <steve@openssl.org> | Add heartbeat extension bounds check.
Support for TLS/DTLS heartbeats.
+ n2s(p, payload);
+ memcpy(bp, pl, payload);
+ if (1 + 2 + 16 > s->s3->rrec.length)
+ if (1 + 2 + payload + 16 > s->s3->rrec.length)
```

- **Why it is a story:** One hour before 2012 UTC, a useful protocol feature lands with an ordinary PR number and a review credit. The code reads a peer-supplied length and then copies that many bytes without comparing the length to the record. Twenty-seven months later the fix inserts precisely those comparisons; its author timestamp is Sunday, while the commit waits until Monday evening. Before “Heartbleed” had a name, the moment was a reviewed standards feature, and Git's author column recorded the reviewer/committer rather than the submitter named in the message.
- **What the reader learns:** `shortlog` is not a complete authorship ledger; read `Submitted by`, `Reviewed by`, and modern trailers. In protocol parsers, pair every decoded network length (`n2s`) with the later copy (`memcpy`) and ask where the containing-record bound is enforced.
- **Surprise:** 2 (the vulnerability is famous; the New Year's Eve timestamp and metadata attribution are the useful archaeology)

## New dig 5: “Branch for 1.1.0 branch” changes no object at all

- **Find-type:** 2 (planted artifact)
- **Hash:** `4fd9771b8f67117ddace6d32085904cbf4bf7542`
- **Date:** 2016-05-28T13:14:59+00:00
- **Author:** Kurt Roeckx `<kurt@roeckx.be>`
- **Message:** `Branch for 1.1.0 branch`
- **Exact command:**

```sh
repo=/home/diablo/book16/repos/debian-openssl
git -C "$repo" show -s --format='%H%nparent=%P%n%aI%n%an <%ae>%n%s' \
  4fd9771b8f67117ddace6d32085904cbf4bf7542
printf 'tree='; git -C "$repo" rev-parse '4fd9771^{tree}'
printf 'parent tree='; git -C "$repo" rev-parse '4fd9771^1^{tree}'
git -C "$repo" diff --exit-code 4fd9771^ 4fd9771 >/dev/null
echo "diff exit=$?"
```

```text
4fd9771b8f67117ddace6d32085904cbf4bf7542
parent=e4f94afa255d52afb1de30ab1162c04cee8115f1
2016-05-28T13:14:59+00:00
Kurt Roeckx <kurt@roeckx.be>
Branch for 1.1.0 branch
tree=17f3cffdb6a820e7b7e880bb102e5e4b87e287de
parent tree=17f3cffdb6a820e7b7e880bb102e5e4b87e287de
diff exit=0
```

- **Why it is a story:** Before the 1.1.0 packaging work starts, Kurt plants a commit whose tree is byte-for-byte its parent's tree. A Git branch is only a movable ref, so the commit cannot itself create or preserve the branch; what survives ten years later in current `debian/unstable` is the signpost after the original branch context has blurred.
- **What the reader learns:** Empty commits may be historical boundary markers, not mistakes. Find them by comparing tree IDs rather than trusting `--stat`, then ask which ref or deployment event the message was meant to memorialize—because the ref can disappear while the empty commit remains everywhere downstream.
- **Surprise:** 3

## Verdict on the first report

High reliability: all substantive hashes, identities, dates, entropy diffs, tag targets, and ancestry claims in the ranked top three checked out.
Its two defects are reproducibility-level but real: one omitted grep line and one `TaggerDate` attributed to a command that cannot print it; neither changes the central archaeology.
