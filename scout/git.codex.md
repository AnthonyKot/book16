# Independent verification and extension: git/git

Commands below use the mandated absolute clone path. Where the first report used
`~/book16/repos/git`, that is only expanded to `/home/diablo/book16/repos/git`.

## Verification table

| dig | claim | command rerun | result | note |
|---|---|---|---|---|
| Ranked #3 / report #2 | Hash, author date, raw author, subject, and body of `8bc9a0c769ac1df7820f2dbf8f7b7d64835e3c68` | `git -C /home/diablo/book16/repos/git log -1 --format='%B' 8bc9a0c769ac1df7820f2dbf8f7b7d64835e3c68` plus `--format='%H%n%ai%n%an <%ae>%n%s'` | **PASS** | Exact match: 2005-04-07 15:16:10 -0700, Linus Torvalds `<torvalds@ppc970.osdl.org>`, `Add copyright notices.`, and the quoted “viable way of describing the world” body. Default `git show` mailmaps the address, as the report says. |
| Ranked #3 / report #2 | Eight files each receive the same five-line copyright banner | `git -C /home/diablo/book16/repos/git show --stat 8bc9a0c769ac1df7820f2dbf8f7b7d64835e3c68` and `git ... show ... -- '*.c'` | **PASS** | Exactly 8 files, 40 insertions, five additions per file; the banner text matches. |
| Ranked #3 / report #2 | It follows the initial commit by 177 seconds | `git -C /home/diablo/book16/repos/git show -s --format='%H %ct %ai' e83c5163316f89bfbde7d9ab23ca2e25604af290 8bc9a0c769ac1df7820f2dbf8f7b7d64835e3c68` | **PASS** | Epochs are 1112911993 and 1112912170: difference 177 seconds. |
| Ranked #2 / report #3 | Hash, date, raw author, message for `e764b8e8b3c50b131be825532ba26fa346d6586e` | `git -C /home/diablo/book16/repos/git show --stat e764b8e8b3c50b131be825532ba26fa346d6586e` plus `git ... log -1 --format='%H%n%ai%n%an <%ae>%n%s%n%b' ...` | **PASS** | Exact match: 2005-06-01 09:13:26 -0700, Linus Torvalds, stated subject and body ending `Cheesy.` |
| Ranked #2 / report #3 | The newly added `git` file is the quoted four-line shell dispatcher | `git -C /home/diablo/book16/repos/git show e764b8e8b3c50b131be825532ba26fa346d6586e:git` | **PASS** | Byte-for-visible-line match: shebang, `cmd="git-$1-script"`, `shift`, `exec $cmd "$@"`. |
| Ranked #2 / report #3 | Stat is 3 files, 9 insertions, 2 deletions; `git` contributes four additions | `git -C /home/diablo/book16/repos/git show --stat e764b8e8b3c50b131be825532ba26fa346d6586e` | **PASS** | Exact match, including Makefile 5 lines and `git-log-script` 2 additions. |
| Ranked #1 / report #4 | Hash, date, raw author, subject/body for `d98b46f8d9a3daf965a39f8c0089c1401e0081ee` | `git -C /home/diablo/book16/repos/git show d98b46f8d9a3daf965a39f8c0089c1401e0081ee -- sha1_file.c` plus `git ... log -1 --format='%H%n%ai%n%an <%ae>%n%s%n%b' ...` | **PASS** | Exact match: 2005-04-20 01:10:46 -0700, Linus Torvalds, `Do SHA1 hash _before_ compression.` and converter body. |
| Ranked #1 / report #4 | Diff moves SHA-1 calculation from compressed bytes to the pre-compression buffer and adds `convert-cache.c` | `git -C /home/diablo/book16/repos/git show d98b46f8d9a3daf965a39f8c0089c1401e0081ee -- sha1_file.c`; `git ... show --stat --oneline ...` | **PASS** | Quoted diff matches. Full stat is 5 files, 158 insertions, 13 deletions; `convert-cache.c` is 138 additions. |
| Ranked #1 / report #4 | Follow-up `f18ca731...` lands at 01:34:54, admits blobs were missed, and fixes blob hashing | `git -C /home/diablo/book16/repos/git log -1 --format='%s%n%b' f18ca7316631914776136455c151d70318299459`; `git ... show ... -- update-cache.c` | **PASS** | Exact message and date. The diff adds hashing of `"blob %lu"` metadata plus input before compression, then removes hashing of compressed output: 9 insertions, 5 deletions. |
| Preamble (doubted) | Clone is at `/home/diablo/repos/git` | `git -C /home/diablo/repos/git rev-parse --git-dir` | **FAIL** | That path is not a repository. The actual mandated clone, used by the report's command blocks, is `/home/diablo/book16/repos/git`. This is a prose-path typo, not a receipt failure. |
| Report #6 (doubted) | In 2006 `cat-file.c` “was moved to builtin/,” then moved “into builtin/ as a directory” in 2010 | `git -C /home/diablo/book16/repos/git log --follow --diff-filter=R --summary --format='%H %ai %an %s' -- builtin/cat-file.c` | **FAIL** | The hashes are real, but the first move is misdescribed: `f81daefe...` renamed `cat-file.c` to the **top-level file** `builtin-cat-file.c` (97%). Only `81b50f3c...` moved that file into the `builtin/` directory in 2010 (100%). |

**Verification count: 9 PASS / 2 FAIL.** All nine checks on the ranked top three pass; both failures are outside the ranking.

## New digs

### 1. A commit that says it adds two scripts, but adds no bytes

- **find-type:** 2 (planted/dated artifact)
- **hash:** `e90a4c0ed17b66c302f48ec0a234cac6f27e5eec`; identical-tree parent `853916ff7f1a5b34bd2728fe81059e6270bac134`
- **date:** 2005-04-18 16:11:32 -0700
- **author:** Linus Torvalds `<torvalds@ppc970.osdl.org>`
- **message:** `Add "dotest" and "applypatch" scripts to actually make things useful.` Body: `Also updates "mailinfo" to write the file list.`

```text
git -C /home/diablo/book16/repos/git show -s --format='commit %H%ndate %ai%nauthor %an <%ae>%nmessage %s%ntree %T' e90a4c0ed17b66c302f48ec0a234cac6f27e5eec
git -C /home/diablo/book16/repos/git show -s --format='parent-tree %T' e90a4c0ed17b66c302f48ec0a234cac6f27e5eec^
git -C /home/diablo/book16/repos/git diff --quiet e90a4c0ed17b66c302f48ec0a234cac6f27e5eec^ e90a4c0ed17b66c302f48ec0a234cac6f27e5eec && printf 'diff EMPTY\n'
commit e90a4c0ed17b66c302f48ec0a234cac6f27e5eec
date 2005-04-18 16:11:32 -0700
author Linus Torvalds <torvalds@ppc970.osdl.org>
message Add "dotest" and "applypatch" scripts to actually make things useful.
tree 32195815983806b5bbfb708e11fea0ec139d772d
parent-tree 32195815983806b5bbfb708e11fea0ec139d772d
diff EMPTY
```

**Why it is a story.** Six days earlier, parent `853916ff...` really did add `applypatch`, `dotest`, and the `mailinfo` changes: 63 insertions and 5 deletions. On April 18, while commits were still being assembled with low-level tools, Linus recorded essentially the same outcome again with a new message but reused the exact parent tree. Before porcelain guarded the routine path, a commit could confidently announce working code while changing only history.

**Reader learns:** find non-merge commits whose tree equals their parent's tree; then compare their messages and the parent's diff. Empty commits may be release markers, CI triggers—or traces of a manual/duplicated history operation whose prose claims a patch that is already present.

**surprise:** 5

---

### 2. The `todo` branch outlived its own TODO

- **find-type:** 5 (TODO that outlived its code)
- **hashes:** root `1bd90415deccc4562e0fb4d0f8e58140aa687ac1`; TODO deletion `a1ae90fc0dec5156aa89bd47bebe324124b3613c`; current ref tip `1bafd9ee78ac3e6e7cb250bbd82233d66fed5ba6`
- **dates:** 2005-08-26 00:32:15 -0700; 2025-07-18 16:07:48 -0700; 2026-08-18 09:26:22 -0700
- **author:** Junio C Hamano (root address `<junkio@cox.net>`, later `<gitster@pobox.com>`)
- **messages:** `Keep track of to-do document.` / `Meta: remove obviously stale, unused, and useless bits` / `What's cooking (2026/08 #08)`

```text
git -C /home/diablo/book16/repos/git show -s --format='root %H | %ai | %an | %s' 1bd90415deccc4562e0fb4d0f8e58140aa687ac1
git -C /home/diablo/book16/repos/git show -s --format='deletion %H | %ai | %an | %s' a1ae90fc0dec5156aa89bd47bebe324124b3613c
git -C /home/diablo/book16/repos/git show -s --format='tip %H | %ai | %an | %s' origin/todo
git -C /home/diablo/book16/repos/git merge-base master origin/todo || printf 'merge-base NONE\n'
git -C /home/diablo/book16/repos/git rev-list --count master..origin/todo | sed 's/^/commits-not-on-master /'
git -C /home/diablo/book16/repos/git show --format= --name-status a1ae90fc0dec5156aa89bd47bebe324124b3613c -- TODO
root 1bd90415deccc4562e0fb4d0f8e58140aa687ac1 | 2005-08-26 00:32:15 -0700 | Junio C Hamano | Keep track of to-do document.
deletion a1ae90fc0dec5156aa89bd47bebe324124b3613c | 2025-07-18 16:07:48 -0700 | Junio C Hamano | Meta: remove obviously stale, unused, and useless bits
tip 1bafd9ee78ac3e6e7cb250bbd82233d66fed5ba6 | 2026-08-18 09:26:22 -0700 | Junio C Hamano | What's cooking (2026/08 #08)
merge-base NONE
commits-not-on-master 2697
D	TODO
```

**Why it is a story.** Six weeks before 1.0, Junio chose not to put his integration desk on `master`; he created a root commit containing a 95-line `TODO`. That unrelated history accumulated 2,697 commits. Twenty years later he finally deleted `TODO` among 839 lines of “stale, unused, and useless bits,” while the orphan ref kept publishing `whats-cooking.txt`. The project did not merely retain an old TODO: it retained the maintainer workflow around it until the file itself became obsolete.

**Reader learns:** `git log --all` is not the same history as `git log`. Enumerate refs, run `merge-base`, and inspect roots. Orphan maintenance, release, and documentation branches can preserve the decision-making machinery that the product branch never contained.

**surprise:** 5

---

### 3. The first public release tag is signed—but has no tagger

- **find-type:** 2 (dated artifact)
- **hashes:** tag object `d6602ec5194c87b0fc87103ca4d67251c76f233a`; target commit `a3eb250f996bf5e12376ec88622c4ccaabf20ea8`
- **date:** tag date absent; target commit 2005-07-10 15:40:43 -0700
- **author:** tag author/tagger absent; target commit Junio C Hamano `<junkio@cox.net>`
- **message:** tag `Test-release for wider distribution.` and `I'll make the first public RPM's etc, thus the tag.`; target commit `[PATCH] alternate object store and fsck`

```text
git -C /home/diablo/book16/repos/git rev-parse refs/tags/v0.99
git -C /home/diablo/book16/repos/git cat-file -p refs/tags/v0.99 | sed -n '1,8p'
git -C /home/diablo/book16/repos/git show -s --format='target %H | %ai | %an | %s' v0.99^{}
d6602ec5194c87b0fc87103ca4d67251c76f233a
object a3eb250f996bf5e12376ec88622c4ccaabf20ea8
type commit
tag v0.99

Test-release for wider distribution.

I'll make the first public RPM's etc, thus the tag.
-----BEGIN PGP SIGNATURE-----
target a3eb250f996bf5e12376ec88622c4ccaabf20ea8 | 2005-07-10 15:40:43 -0700 | Junio C Hamano | [PATCH] alternate object store and fsck
```

**Why it is a story.** At the moment Git was about to become a public RPM, someone made an annotated, armored OpenPGP-signed tag—but the tag object has no `tagger` header at all. The signature is present while structured identity and time are absent; the only date and author Git can print without interpreting the signature belong to the pointed-to commit, whose subject is not a release subject.

**Reader learns:** inspect tag objects with `cat-file -p`; do not infer a tag's date or maker from its target commit. A cryptographic signature and ordinary tag metadata are independent evidence, and even an annotated tag can omit the latter.

**surprise:** 4

---

### 4. On Christmas night, Git needed `.mailmap` to repair Git

- **find-type:** 4 (names that disappear/appear)
- **hash:** `2cf0223ba48ae51af03de486e119fd7a36e1b0ee`
- **date:** 2006-12-25 23:25:44 -0500
- **author:** Nicolas Pitre `<nico@cam.org>`
- **message:** `add .mailmap for git-shortlog output with the git repository`; body: `The git repository itself was messed up in a couple cases.`

```text
git -C /home/diablo/book16/repos/git show -s --format='%H%n%ai%n%an <%ae>%n%s' 2cf0223ba48ae51af03de486e119fd7a36e1b0ee
git -C /home/diablo/book16/repos/git show --stat --format= 2cf0223ba48ae51af03de486e119fd7a36e1b0ee -- .mailmap
git -C /home/diablo/book16/repos/git show 2cf0223ba48ae51af03de486e119fd7a36e1b0ee:.mailmap | tail -2
2cf0223ba48ae51af03de486e119fd7a36e1b0ee
2006-12-25 23:25:44 -0500
Nicolas Pitre <nico@cam.org>
add .mailmap for git-shortlog output with the git repository
 .mailmap | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
anonymous <linux@horizon.com>
anonymous <linux@horizon.net>
```

**Why it is a story.** `git-shortlog` could count contributors, but Git's own immutable author records split people across misspellings, encodings, and addresses. Nicolas added the correction layer on Christmas night, including two identities explicitly normalized to `anonymous`; the tool's home repository became its test case before anyone knew `.mailmap` would become the standard lens through which the project's authorship is counted.

**Reader learns:** raw `%an <%ae>` and mailmapped `%aN <%aE>` answer different questions. Find the first `.mailmap` commit and inspect what the project chose to merge; contribution statistics are a maintained interpretation of immutable commits, not the commits themselves.

**surprise:** 3

---

### 5. Nine topic branches, one octopus, and `../git` in permanent ink

- **find-type:** 2 (dated artifact: a local checkout path and integration topology preserved in a merge)
- **hash:** `16d7601e176cd53f3c2f02367698d06b85e08879`
- **date:** 2019-09-19 23:22:03 +0530 (committed 2019-09-24 19:47:43 +0530)
- **author:** Pratyush Yadav `<me@yadavpratyush.com>`
- **message:** `Merge branches 'js/msgfmt-on-windows', 'tz/fsf-address-update', 'jn/reproducible-build', 'ls/no-double-utf8-author-name', 'js/misc-git-gui-stuff', 'bb/ssh-key-files', 'bp/bind-kp-enter', 'cb/ttk-style' and 'py/call-do-quit-before-exit' of ../git into py/git-git-extra-stuff`

```text
git -C /home/diablo/book16/repos/git show -s --format='%H%n%ai%n%an <%ae>%n%s' 16d7601e176cd53f3c2f02367698d06b85e08879
git -C /home/diablo/book16/repos/git rev-list --parents -1 16d7601e176cd53f3c2f02367698d06b85e08879 | awk '{print "parent-count", NF-1}'
git -C /home/diablo/book16/repos/git diff --shortstat 16d7601e176cd53f3c2f02367698d06b85e08879^1 16d7601e176cd53f3c2f02367698d06b85e08879
16d7601e176cd53f3c2f02367698d06b85e08879
2019-09-19 23:22:03 +0530
Pratyush Yadav <me@yadavpratyush.com>
Merge branches 'js/msgfmt-on-windows', 'tz/fsf-address-update', 'jn/reproducible-build', 'ls/no-double-utf8-author-name', 'js/misc-git-gui-stuff', 'bb/ssh-key-files', 'bp/bind-kp-enter', 'cb/ttk-style' and 'py/call-do-quit-before-exit' of ../git into py/git-git-extra-stuff
parent-count 10
 6 files changed, 72 insertions(+), 15 deletions(-)
```

**Why it is a story.** The git-gui maintainer had nine queued topics and a sibling checkout called `../git`. Rather than linearize them, he recorded the integration desk itself: first parent plus nine topic parents in one ten-parent commit. The diff is modest; the topology and local path are the artifact. Before the outcome was a release, it was nine named piles being gathered from the directory next door.

**Reader learns:** count parents instead of assuming every merge has two. Octopus subjects often preserve branch queues, filesystem layout, and subsystem handoff practices that disappear from the resulting files.

**surprise:** 4

Verdict: 9 of 11 checked claims pass; the ranked top three are fully reproducible and accurately described.
Reliability: High on commit receipts, with two precision lapses outside the ranking: one clone-path typo and one premature description of a `builtin/` directory.
