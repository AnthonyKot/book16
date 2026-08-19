# Second scout: MS-DOS verification and extensions

## Verification table

| Dig | Claim | Command rerun | Result | Note |
|---|---|---|---|---|
| #2 | The supplied command reproduces the two backdated release commits and their author/committer dates. | `git -C ~/book16/repos/msdos log --format='commit %H%nAuthor:     %an <%ae>%nAuthorDate: %aD%nCommit:     %cn <%ce>%nCommitDate: %cD%n%n    %s%n' -2 --skip=1` | **FAIL** | As written, it returns `8ee9712` and `3c389db`, the second and third commits from the tip. The quoted `fce0f75`/`80ab2fd` output cannot come from this command; it needs explicit hashes or a reverse-order selector. |
| #2 | The hashes, Rich Turner identity, messages, 1982/1983 author dates, 2018 committer dates, matching clock seconds, and source-header dates are real. | `git -C repos/msdos show -s --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommit: %cn <%ce>%nCommitDate: %cI%nSubject: %s%n' fce0f759... 80ab2fdd...`; `git ... show <hash>:<path> \| rg '03/03/82\|08/12/83'` | **PASS** | Targeted reruns reproduce every metadata value. `fce0f75` has the same UTC clock second across the 36-year gap; `80ab2fd` has the same displayed time and offset. The file-header dates also match. |
| #3 | A 16 Dec 2013 Tim Paterson email is blamed wholesale to Rich Turner on 3 Mar 1982. | `git -C ~/book16/repos/msdos blame -- v1.25/Tim_Paterson_16Dec2013_email.txt` | **PASS** | Lines 1–23 all blame to `fce0f759`; line 3 contains exactly `Date: Mon, 16 Dec 2013 10:34:17 -0800`, and lines 7/9 support the provenance summary. |
| #4 | `2d04cacc...` is `MZ is back!`, authored by Mark Zbikowski, committed by Microsoft Open Source, adding 1,339 files and 527,719 lines including 12 PDFs. | `git -C ~/book16/repos/msdos show --stat --format=fuller 2d04cacc... \| head -20`; `git ... show --stat 2d04cacc... \| tail -3` | **PASS** | Hash, identities, dates, subject, and totals match. A tree listing confirms exactly 12 PDFs; the abbreviated sample in the report simply omits the twelfth from view. |
| #4 | The commit followed the author event by “~1 hour” / “one hour,” and “MZ signed it.” | `git -C repos/msdos show -s --format='%at %ct' 2d04cacc...`; `git ... show -s --format='%H %G? %GS %GK' 2d04cacc...`; `git ... cat-file -p 2d04cacc...` | **FAIL** | Converting both offsets gives a gap of **7,697 seconds = 2:08:17**, not about one hour. `%G?` is `N` and the raw commit has no `gpgsig`; “signed it” is defensible only as a literary synonym for authored, not as a Git-signature claim. |
| #5 | Full names in the v2.0 header become initials in the v4.0 header, preserving `NP (Parenting)`; `-S` finds only the two import commits. | The report's two `git blame -L ... MSHEAD.ASM` commands and `git log -S 'Parenting' ...` | **PASS** | The quoted lines, hashes, dates, names, and ordering reproduce. The v4.0 blob also begins `SCCSID ... 85/04/10`, supporting the two-years-later description. |
| #6 | `HACKey. Not enough time to do it right.` occurs in both the v2.0 and v4.0 command processors and `-S` points to their two import commits. | The report's two `git blame -L ... COMMAND*.ASM` commands and `git log -S 'HACKey' ...` | **PASS** | Text, capitalization, line numbers, hashes, dates, and authors all match. |
| #7 | The “Damn! Overflowed again!” revision line and later 1983 revisions live inside the author-dated 3 Mar 1982 commit. | `git -C ~/book16/repos/msdos blame -L 20,24 -- v1.25/source/ASM.ASM` | **PASS** | The five lines reproduce exactly, including 18 Aug 1982, 5 Jan 1983, and 9 May 1983 entries blamed to `fce0f759`. |
| Overview | `HEAD` has 104 commits: 65 non-merges and 39 merges; there are no tags and only `main` is a branch. | `git -C repos/msdos rev-list --count HEAD`; same with `--no-merges` and `--merges`; `git ... for-each-ref ...`; `git ... tag -l` | **PASS** | Counts are 104/65/39. The only local branch is `main`; the only remote branch is `origin/main` (plus symbolic `origin/HEAD`), and tag output is empty. |

**Verification count: 7 PASS / 2 FAIL.**

---

## New dig 1. Two people made the same accent fix; the second merge changed nothing

- **Find-type:** 1 (a one-character fix whose eventual merge has a zero-byte tree effect)
- **Hashes:** `9bd8b52e82221f76cb534ab8f22be32e482a2ceb` (first fix), `fe85645e69d75a28ba5f9c26696c2493073c52e2` (independent duplicate), `eaf2f2d812e78b4da8442ba8c2c0f45107305f61` (empty merge)
- **Dates:** 2018-10-23T16:54:37+02:00; 2018-10-29T16:57:04+01:00; 2018-11-05T17:09:41-08:00
- **Authors:** Robert Lara `<robert.lara@ext.aqualogybs.net>`; Alejandro Manzanares Lemus `<32962522+Alexmnzlms@users.noreply.github.com>`; Rich Turner `<rich@bitcrazed.com>`
- **Messages:** `Spelling fix`; `Accent fixed`; `Merge pull request #355 from Alexmnzlms/master` (body: `Accent fixed`)
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/msdos show -s --format='%h %aI %an | %s | tree %T' 9bd8b52e82221f76cb534ab8f22be32e482a2ceb fe85645e69d75a28ba5f9c26696c2493073c52e2 eaf2f2d812e78b4da8442ba8c2c0f45107305f61
test "$(git -C /home/diablo/book16/repos/msdos rev-parse eaf2f2d^{tree})" = "$(git -C /home/diablo/book16/repos/msdos rev-parse eaf2f2d^1^{tree})" && echo 'merge tree == first-parent tree; diff is empty'
git -C /home/diablo/book16/repos/msdos diff --stat eaf2f2d^1 eaf2f2d
```

```text
9bd8b52 2018-10-23T16:54:37+02:00 Robert Lara | Spelling fix | tree 06c81016da9d0310894fe8992c484fe5eaa22aea
fe85645 2018-10-29T16:57:04+01:00 Alejandro Manzanares Lemus | Accent fixed | tree 06c81016da9d0310894fe8992c484fe5eaa22aea
eaf2f2d 2018-11-05T17:09:41-08:00 Rich Turner | Merge pull request #355 from Alexmnzlms/master | tree 9793b4de9d687d81a9a7eb1d8cb5647ee0f0d35f
merge tree == first-parent tree; diff is empty
```

The first two commits have not merely equivalent patches: they have the same parent (`b297ae5`) and the same complete tree. Both independently changed Spanish `mas` to `más`. Robert's version was merged first; a week later Rich was clearing the queue and accepted Alejandro's too. Git preserved the social decision as a merge commit, but its tree is byte-for-byte its first parent's tree. A plain `git show --stat eaf2f2d` is especially treacherous: it lists ten files and 111 changed lines relative to the stale second parent even though the merge introduced nothing to main.

- **Why it is a story:** Just before clicking merge, the maintainer has a valid one-character contribution whose outcome is already present. He accepts it anyway. The contributor gets a merge record; the source gets zero new bytes.
- **What the reader learns:** For suspicious merges, compare `commit^{tree}` with `commit^1^{tree}` and diff the first parent. Merge stats can describe how stale a branch was, not what the merge added.
- **Surprise:** 4/5

---

## New dig 2. One Portuguese README was born twice in 140 seconds

- **Find-type:** 4 (a filename appears on two sibling histories, then one history absorbs the other)
- **Hashes:** `9230133a4c4ab779e841febf5f47c374e63bd2e2`, `8d4cd5d8b3f6f8c27ee64b171aa8ac611fede1d0`, `65b86402b0bd654406400fae31dbf00dd4fe2904`
- **Date:** all on 2018-10-04T22:16:42–22:21:47+01:00
- **Author:** LiTO773 `<LiTO773@users.noreply.github.com>`
- **Messages:** the two sibling commits are both `README in Portuguese is now README.pt-PT`; the merge is `Merge branch 'master' of github.com:LiTO773/MS-DOS`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/msdos show -s --format='%h %aI / %cI %an | %s%n  parents %p%n  tree %T' 9230133a4c4ab779e841febf5f47c374e63bd2e2 8d4cd5d8b3f6f8c27ee64b171aa8ac611fede1d0 65b86402b0bd654406400fae31dbf00dd4fe2904
```

```text
9230133 2018-10-04T22:16:42+01:00 / 2018-10-04T22:16:42+01:00 LiTO773 | README in Portuguese is now README.pt-PT
  parents 1faff0a
  tree 9a8e714494c24dd8fedc44066aba8c86838db242
8d4cd5d 2018-10-04T22:16:42+01:00 / 2018-10-04T22:19:02+01:00 LiTO773 | README in Portuguese is now README.pt-PT
  parents 1faff0a
  tree 0e742496292b0cb0b1404512479c89d0d3dd0edb
65b8640 2018-10-04T22:21:47+01:00 / 2018-10-04T22:21:47+01:00 LiTO773 | Merge branch 'master' of github.com:LiTO773/MS-DOS
  parents 8d4cd5d 9230133
  tree 0e742496292b0cb0b1404512479c89d0d3dd0edb
```

Both sibling commits have the same parent, author timestamp, author, and subject. The first adds `README.pt-PT.md`; the second adds it and also edits `README.md`, with a committer time 140 seconds later. That is the object-level shape of a rewritten/amended commit whose earlier version was already reachable remotely. Another 165 seconds later, pulling `master` reunites both siblings. The merge tree equals the later sibling, so the merge changes no files but makes the abandoned version permanent history.

- **Why it is a story:** For five minutes the contributor is correcting a translation commit without yet knowing the first object has escaped. The routine pull records both versions forever; Git remembers the draft that amend was meant to replace.
- **What the reader learns:** Amend replaces a branch tip, not a published object. Same author time/message plus a later committer time and a two-parent reunion is a recognizable amend-then-pull fossil.
- **Surprise:** 4/5

---

## New dig 3. The museum received a live-product security policy, then deleted 35 lines

- **Find-type:** 8 (rollback of the world: a corporate template briefly treats historical DOS as a supported product)
- **Hashes:** `87678a33811547c79f501eb8318c62f6c6c42226` (template added), `e9c48083eb3c75df0450e81089d89187c56e6ebd` (policy pared back)
- **Dates:** 2024-04-13T23:33:14+00:00; 2024-04-24T17:35:05-07:00
- **Authors:** Microsoft GitHub User `<msftgits@microsoft.com>`; Microsoft Open Source `<microsoftopensource@users.noreply.github.com>`
- **Messages:** `Updating template files`; `Update SECURITY.md`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/msdos show -s --format='%h %aI %an | %s' 87678a33811547c79f501eb8318c62f6c6c42226 e9c48083eb3c75df0450e81089d89187c56e6ebd
git -C /home/diablo/book16/repos/msdos show --format= --stat e9c48083eb3c75df0450e81089d89187c56e6ebd
git -C /home/diablo/book16/repos/msdos show --format= e9c48083eb3c75df0450e81089d89187c56e6ebd -- SECURITY.md | rg '^[-+]\*\*Since|^[-+]Microsoft takes|^[-+]You can learn'
```

```text
87678a3 2024-04-13T23:33:14+00:00 Microsoft GitHub User | Updating template files
e9c4808 2024-04-24T17:35:05-07:00 Microsoft Open Source | Update SECURITY.md
 SECURITY.md | 36 +-----------------------------------
 1 file changed, 1 insertion(+), 35 deletions(-)
-Microsoft takes the security of our software products and services seriously, which includes all source code repositories managed through our GitHub organizations, which include [Microsoft](https://github.com/Microsoft), [Azure](https://github.com/Azure), [DotNet](https://github.com/dotnet), [AspNet](https://github.com/aspnet) and [Xamarin](https://github.com/xamarin).
+You can learn more about the security reporting process with the Microsoft Security Response Center (MSRC) at [https://msrc.microsoft.com/create-report](https://aka.ms/security.md/msrc/create-report).
```

The generic 43-line policy arrived with a bot-like `Updating template files` commit after five silent years. It offered a 24-hour response, encrypted mail, bug-bounty guidance, and a vulnerability-report checklist, even while one inserted sentence admitted that MS-DOS is historical reference software and the file is “a template only.” Eleven days later Microsoft Open Source removed 35 lines, leaving the disclaimer, the warning not to file public issues, and one MSRC link. The next day the v4.0 archive arrived.

- **Why it is a story:** Automation has just applied the rules of a live product to a software museum. Before the new archive opens, a human-scale account trims the promise back to what the repository can honestly support.
- **What the reader learns:** Policy files have archaeology too. Diff the automated setup commit against the next hand edit; the deletions reveal which organizational promises did not fit the repository.
- **Surprise:** 3/5

---

## New dig 4. The French README lived under the wrong case for 17 seconds

- **Find-type:** 4 (a name disappears and reappears through a case-only rename, then a directory rename)
- **Hashes:** `50439ccb63ce4a30946a0b81b7b4b9d94cd69ee5`, `09ef30c27304b235e12c9b98b53c707fa8164d35`, `a5eb02a4d7382faa1d8f91802a73241c32026a2d`
- **Dates:** 2018-10-04T11:46:52+02:00; 2018-10-04T11:47:09+02:00; 2024-04-25T00:33:46+00:00
- **Authors:** Pierre-Yves Aillet `<pyaillet@users.noreply.github.com>`; later Microsoft Open Source `<microsoftopensource@users.noreply.github.com>`
- **Messages:** `Create README.fr-fr.md`; `Rename README.fr-fr.md to README.fr-FR.md`; `Moving localized READMEs`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/msdos show -s --format='%h %aI %an | %s' 50439ccb63ce4a30946a0b81b7b4b9d94cd69ee5
git -C /home/diablo/book16/repos/msdos log --follow --find-renames --diff-filter=R --format='%h %aI %an | %s' --name-status -- .readmes/README.fr-FR.md
```

```text
50439cc 2018-10-04T11:46:52+02:00 Pierre-Yves Aillet | Create README.fr-fr.md
a5eb02a 2024-04-25T00:33:46+00:00 Microsoft Open Source | Moving localized READMEs
R100 README.fr-FR.md .readmes/README.fr-FR.md
09ef30c 2018-10-04T11:47:09+02:00 Pierre-Yves Aillet | Rename README.fr-fr.md to README.fr-FR.md
R100 README.fr-fr.md README.fr-FR.md
```

Pierre created the translation as `README.fr-fr.md`, then 17 seconds later corrected the language-region spelling to `fr-FR` without changing a byte. Six years later Microsoft moved that same blob under `.readmes/`. Ordinary path-limited log stops at the most recent name; `--follow --find-renames` walks through both identities, including the case-only step that some filesystems make awkward.

- **Why it is a story:** The translation has barely been committed when its author notices that capitalization is metadata with meaning. The content stays fixed while its identity changes twice—once by its author, once by the archive's curator.
- **What the reader learns:** A zero-line rename can be the whole event. Use `--follow` and request rename status when a famous file seems younger than its contents, especially across case changes and archival moves.
- **Surprise:** 2/5

---

The first report is substantively reliable: every cited hash and every quoted blob/diff passage in the ranked digs is genuine.  
Its reproducibility needs two corrections: #2's exact command selects the wrong commits, and #4 understates the 2:08:17 author/committer gap while using “signed” despite no Git signature.
