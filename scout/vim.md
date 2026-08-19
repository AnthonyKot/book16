# Scout: vim/vim

- **repo:** https://github.com/vim/vim
- **clone:** `/home/diablo/book16/repos/vim` (already present; not re-cloned)
- **clone size:** 320M on disk; working tree 98M; `.git` 222M; `git count-objects -vH` → 1 pack, 218.38 MiB, 234594 objects
- **history span:** 2004-06-13 12:29:53 +0000 → 2026-08-18 21:02:17 +0000
- **commits:** 24308 (`git rev-list --count HEAD`)
- **authors (HEAD):** Bram Moolenaar 16566 (68.2%), then Christian Brabandt 1232, zeertzjq 780, Yegappan Lakshmanan 530
- **tip:** `a20071113aa9bec2d47924e6af0269b6e1929ac5` Amariah Kamau, "patch 9.2.0976: Vim9: line continuation for command arguments is undocumented"

```
git -C ~/book16/repos/vim log --reverse --format='%H %ai %an %s' | head -3
0c628d1da896bf523373c4fc9616baee712a6e96 2004-06-13 12:29:53 +0000 Bram Moolenaar Initial revision
e1d1289d47574b9acb99fd26efc1c2dc55ce16e2 2004-06-13 13:02:36 +0000 Bram Moolenaar updated for version 7.0001
b5ddc07b05a920fd10acbc50251ecfc829153625 2004-06-13 13:18:32 +0000 Bram Moolenaar updated for version 7.0001

git -C ~/book16/repos/vim log -1 --format='%H %ai %an %s'
a20071113aa9bec2d47924e6af0269b6e1929ac5 2026-08-18 21:02:17 +0000 Amariah Kamau patch 9.2.0976: Vim9: line continuation for command arguments is undocumented
```

Vim is born on the Amiga in 1991. This git is not. Day one is Sunday 13 June 2004, version `7.0aa`, CVS language (`Initial revision`), one README, then a 750,846-line drop at 20:20 UTC. Bram Moolenaar is the only author until 2019, the only name that matters until 2021, and still 68% of every commit that will ever exist here. He dies 2023-08-03. The last thing he authors is a crypt-test rename at 00:54; the last thing he *commits* is someone else's spelling of "arguments," at 02:38 the next morning.

---

## 1. Day one is a README; the program arrives at 20:20

- **find-type:** 3 (first commit) — also 2 (import boundary)
- **hashes:** `0c628d1da896bf523373c4fc9616baee712a6e96` (README); `e1d1289d47574b9acb99fd26efc1c2dc55ce16e2` (Makefile); `b4210b3bc14e2918f153a7307530fbe6eba659e1` (`src/main.c`); `071d4279d6ab81b7187b48f3a0fc61e587b6db6c` (the dump)
- **date:** 2004-06-13 12:29:53 → 20:20:40 +0000
- **author:** Bram Moolenaar `<Bram@vim.org>`
- **message:** `Initial revision` then six times `updated for version 7.0001`

```
git -C ~/book16/repos/vim log --reverse --format='%H %ai %s' --until=2004-06-14
# then, per hash: git show --stat --format='' $H | tail -1

0c628d1da896bf523373c4fc9616baee712a6e96 2004-06-13 12:29:53 +0000 Initial revision
  1 file changed, 137 insertions(+)          # README.txt only, "version 7.0aa"
e1d1289d47574b9acb99fd26efc1c2dc55ce16e2 2004-06-13 13:02:36 +0000 updated for version 7.0001
  1 file changed, 2684 insertions(+)         # src/Makefile
b4210b3bc14e2918f153a7307530fbe6eba659e1 2004-06-13 14:51:16 +0000 updated for version 7.0001
  1 file changed, 3201 insertions(+)         # src/main.c
071d4279d6ab81b7187b48f3a0fc61e587b6db6c 2004-06-13 20:20:40 +0000 updated for version 7.0001
  1588 files changed, 750846 insertions(+)
```

The seventh commit of the day is 761 `*.vim` files, 103 `*.c`, Amiga `.info` icons, a Corel Draw logo (`runtime/vimlogo.cdr`, the empty-stat commit `ad3a468` at 14:44). There is no 1970 stamp and no fake 1991 root. uganda.txt in that dump is already dated "Last change: 2004 May 12" — the file is older than the commit, which is how an import talks.

**Why it is a story.** The moment before the outcome: he is moving a thirteen-year-old editor onto a VCS that did not exist when he started. He does not reconstruct 1991–2004. He drops the tree he has, in the order the old tool emits it, and the subject line is the version number. Git's clock starts in the middle of a life. Everything a reader thinks of as "Vim history" before this Sunday is elsewhere — ftp, patches, a different machine.

**What the reader learns:** `git log --reverse | head` on a famous project usually shows a migration, not a genesis. Ask what the import chose to remember (here: a working v7 tree, including dead platforms) and what it chose to forget (the first six major versions).

**surprise:** 4

---

## 2. Stevie still lives in `version.c`; 1991 does not live in git

- **find-type:** 5 (comment that outlived its code) — also 2
- **hash:** `071d4279d6ab81b7187b48f3a0fc61e587b6db6c` (still blamed on HEAD)
- **date:** 2004-06-13 20:20:40 +0000
- **author:** Bram Moolenaar
- **message:** `updated for version 7.0001`

```
git -C ~/book16/repos/vim blame -L 12,16 HEAD -- src/version.c
071d4279d6 (Bram Moolenaar      2004-06-13 20:20:40 +0000 12) /*
071d4279d6 (Bram Moolenaar      2004-06-13 20:20:40 +0000 13)  * Vim originated from Stevie version 3.6 (Fish disk 217) by GRWalter (Fred)
071d4279d6 (Bram Moolenaar      2004-06-13 20:20:40 +0000 14)  * It has been changed beyond recognition since then.
071d4279d6 (Bram Moolenaar      2004-06-13 20:20:40 +0000 15)  *
d79ea47079 (Yegappan Lakshmanan 2025-01-20 21:09:13 +0100 16)  * Differences between version 8.2 and 9.1 can be found with ":help version9".
```

The same dump writes the same six-line header — `VIM - Vi IMproved by Bram Moolenaar` / `Do ":help uganda"` — into the C sources. On HEAD, `git grep -l 'Do ":help uganda"' -- src/` still hits **243 files**. The next line of the header (`See README.txt for an overview`) is still Bram, 2004.

**Why it is a story.** The moment before the outcome: he is about to lose the pre-git years as commits, so he leaves the origin sentence in the file that prints `:version`. Fish disk 217 is a floppy from the late-eighties Amiga scene. Git will never contain a Stevie commit. The comment is the whole archaeology of 1991, and it is still there after the 9.1 rewrite of the line below it.

**What the reader learns:** when a project imports late, the *comments* are the previous VCS. `git blame` on the copyright block of an old C file is often the only receipt for a decade the log does not have.

**surprise:** 4

---

## 3. Fifteen years, one name

- **find-type:** 4 (name that never appears)
- **hashes:** not a single commit — three windows. Anchor first non-Bram author: `e307073680d498b113c7df8250abd5676de1ed13`
- **date:** 2004–2018 inclusive; first other author 2019-11-27
- **author:** Bram Moolenaar 9166 / 9166 (through 2018); first other: Christian Brabandt
- **message (anchor):** `Cirrus CI: add a simple CI using BSD`

```
git -C ~/book16/repos/vim shortlog -sn HEAD --since=2004-01-01 --until=2011-01-01 | head
  2649	Bram Moolenaar

git -C ~/book16/repos/vim shortlog -sn HEAD --since=2011-01-01 --until=2019-01-01 | head
  6517	Bram Moolenaar

git -C ~/book16/repos/vim log --reverse --format='%H %ai %an %s' | grep -v 'Bram Moolenaar' | head -3
e307073680d498b113c7df8250abd5676de1ed13 2019-11-27 15:45:57 +0100 Christian Brabandt Cirrus CI: add a simple CI using BSD
```

Through 2010, 2015, 2020 the year-counts are 46/46, 493/493, 2236/2236 Bram. Other people exist — their names are inside the commit *bodies* (`Solution: ... (Christian Brabandt)`) while the author field stays his. The "patch X.Y.NNNN" subject is a filing system, not a conversation. Authors other than Bram become normal only in 2021 (Yegappan, Dominique Pelle), and even 2022 is still 1636 Bram / 760 everyone else.

**Why it is a story.** The moment before the outcome: this is not a project that forgot to add collaborators. It is a project whose social contract is "mail Bram a patch, he commits it as himself, the version file ticks." The git author field is a bus-factor document and it reads `1` for fifteen years. When the field finally changes, it is CI YAML, not a feature.

**What the reader learns:** `git shortlog -sn` in decade windows is the org chart. A healthy-looking mailing list can leave zero names in the log. If every commit is "updated for version N," the contributors are in the paragraph, not the header.

**surprise:** 2 (the folklore is right; the 2019 date of the first crack is less well known)

---

## 4. The first other author is reverted before dinner

- **find-type:** 6 (revert war — a rule enforced by a revert)
- **hashes:** `e307073680d498b113c7df8250abd5676de1ed13` (add); `8fbd6723af3248a1fa46fa1e610804841603abe5` (merge); `d52986e7be366b6f8c9e18078648f1c5219c4335` / `7a212c625362d86327878d57269d63f6a2ca5d2b` (revert)
- **date:** 2019-11-27 15:45 → 21:57 +0100
- **authors:** Christian Brabandt; Bram Moolenaar `<bram@moolenaar.net>` (GitHub web UI email — 3 commits total)
- **messages:** `Cirrus CI: add a simple CI using BSD` / `Revert "Cirrus CI: add a simple CI using BSD"`

```
git -C ~/book16/repos/vim log --reverse --grep='Merge pull request' --format='%H %ai %an %s' | head -3
8fbd6723af3248a1fa46fa1e610804841603abe5 2019-11-27 16:08:29 +0100 Christian Brabandt Merge pull request #5273 from chrisbra/cirrus_ci
7a212c625362d86327878d57269d63f6a2ca5d2b 2019-11-27 21:57:06 +0100 Bram Moolenaar Merge pull request #5275 from vim/revert-5273-cirrus_ci
9fcde94176b9c1a3b85d054cc388c49cb17dfb18 2023-08-07 17:00:41 +0200 Christian Brabandt Merge pull request #12740 from k-takata/import-9.0.1678

git -C ~/book16/repos/vim show --stat --format='%s' 7a212c625362d86327878d57269d63f6a2ca5d2b
Revert "Cirrus CI: add a simple CI using BSD"
 .cirrus.yml | 9 ---------
 README.md   | 1 -
 2 files changed, 10 deletions(-)
```

Six hours. Nine lines of YAML. The next `Merge pull request` in the entire history is 7 August 2023 — four days after Bram dies. Between those two merges sit three and a half years in which GitHub is a mirror, not a process.

**Why it is a story.** The moment before the outcome: Christian has commit bit enough to land a PR. Bram still decides what the tree is. The revert is not angry; it is a boundary. The first crack in the one-name log is closed the same afternoon. When the merge-PR grammar comes back, it is because the person who closed it is gone.

**What the reader learns:** the first revert of the first outside commit is the constitution. Search `Merge pull request` and the next one; the gap is the real policy.

**surprise:** 5

---

## 5. A LICENSE file, because GitHub cannot see `:help uganda`

- **find-type:** 1 (tiny diff, huge blast radius)
- **hash:** `c838626fea42ed5924ee6084d87d1b37b2d7b0ff`
- **date:** 2020-01-08 21:43:02 +0100
- **author:** Bram Moolenaar
- **message:** `patch 8.2.0105: Vim license not easy to find on github`

```
git -C ~/book16/repos/vim log -1 --format='%B' --stat c838626fea42ed5924ee6084d87d1b37b2d7b0ff
patch 8.2.0105: Vim license not easy to find on github

Problem:    Vim license not easy to find on github.
Solution:   Add a separate LICENCE file. (closes #5458)

 Filelist      |  1 +
 LICENSE       | 78 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 src/version.c |  2 ++
 3 files changed, 81 insertions(+)
```

The text is copied from `runtime/doc/uganda.txt`, which has carried the Vim license since the 2004 dump (and in the product, since the 1990s). GitHub's license crawler does not run `:help uganda`. Cousin commit `694cac7a352ea66827cd94ed1ccbc2fc5655e9cc` (2015-07-10) is the same pressure from the other side: "The README file doesn't look nice on github."

**Why it is a story.** The moment before the outcome: the license has always been in the help system, which is the place Vim users look. The place *GitHub users* look is a root file named `LICENSE`. He adds one, and in it he is still "the current maintainer." Three years later that sentence will be the first thing the successor has to edit (dig 8). The host renamed the project in the project's own tree.

**What the reader learns:** forge conventions overwrite project conventions. `git log --diff-filter=A -- LICENSE README.md` on an old codebase is often "we dressed for the website," not "we licensed the code."

**surprise:** 4

---

## 6. `defaults.vim`: "Defaults are very conservative"

- **find-type:** 1 (tiny load-site, huge blast radius)
- **hash:** `8c08b5b569e2a9e9f63dea514591ecfa2d3bb392`
- **date:** 2016-07-28 22:24:15 +0200
- **author:** Bram Moolenaar
- **message:** `patch 7.4.2111` / `Problem: Defaults are very conservative.`

```
git -C ~/book16/repos/vim show --stat --format='%s%n%b' 8c08b5b569e2a9e9f63dea514591ecfa2d3bb392 | head -20
patch 7.4.2111
Problem:    Defaults are very conservative.
Solution:   Move settings from vimrc_example.vim to defaults.vim.  Load
            defaults.vim if no .vimrc was found.
 runtime/defaults.vim      | 109 ++++++++++++++++++++++++++++++++++++++++++++++
 src/main.c                |  11 +++--
 14 files changed, 243 insertions(+), 122 deletions(-)
```

The new file starts `set nocompatible`, then `backspace=indent,eol,start`, `incsearch`, `wildmenu`. The load site in `src/main.c` is one new `do_source(VIM_DEFAULTS_FILE)` on the failure path of every user vimrc. Anyone who already had a `.vimrc` is untouched. Anyone who did not — the next decade of first-time users, Docker images, `vi` on a fresh Linux — gets a different editor.

**Why it is a story.** The moment before the outcome: Vim's compatibility with Vi is a point of honor and a source of tickets (`:set nocompatible` is the first line of every blog post). He will not flip the compiled default. He will load a script *if you have no opinion*. That is the most Vim possible way to ship a breaking improvement. The blast radius is every empty home directory after July 2016.

**What the reader learns:** the huge UX change is often not the option's compiled default; it is the file that runs when the user has not spoken. `git log --diff-filter=A -- '**/defaults.*'` is how you find when a tool stopped punishing beginners.

**surprise:** 3

---

## 7. The last 32 hours: a teapot, then a typo at 02:38

- **find-type:** 5 (a joke that became the last authored work) — also 4
- **hashes:** `80adaa8ae8398403ca4e9797219ea9a501fc76a5` (teapot); `416bd916b4cc4502eb734218f406e4edd8dd199c` (sort the help); `16abd997c99b1a40fb0ba54889ce0cf44d7585b4` (last authored); `4c0089d696b8d1d5dc40568f25ea5738fa5bbffb` (last committed)
- **dates:** 2023-07-07 18:57 → 2023-07-09 02:38 +0100
- **authors:** Bram Moolenaar; last commit author THARAK HEGDE, committer Bram
- **messages:** `cannot produce a status 418 or 503 message` / `warning for buffer in use when exiting early` / `typo in syntax test input file`

```
git -C ~/book16/repos/vim log --committer='Bram' --format='%ci %an | %s' | head -5
2023-07-09 02:38:28 +0100 THARAK HEGDE | patch 9.0.1677: typo in syntax test input file
2023-07-08 00:54:06 +0100 Bram Moolenaar | patch 9.0.1676: warning for buffer in use when exiting early
2023-07-08 00:25:56 +0100 Bram Moolenaar | patch 9.0.1675: test may run into timeout when using valgrind
2023-07-07 23:19:18 +0100 Bram Moolenaar | patch 9.0.1674: help for builtin functions is not sorted properly
2023-07-07 18:57:40 +0100 Bram Moolenaar | patch 9.0.1673: cannot produce a status 418 or 503 message
```

`err_teapot()` is 67 lines: `E418: I'm a teapot`, or `E503: Coffee is currently not available` if the argument is true. The next commit exists only to put that help entry in alphabetical order. The last commit he authors (00:54) renames buffers in `test_crypt.vim` so a warning can be read. The last commit he *applies*, 26 hours later, is `arguements` → `arguments` in a shell-syntax test, credited to a GitHub noreply address, `closes #12635`. Then nothing with his name on it. He dies 2023-08-03. One more commit exists in the gap (`9.0.1678`, 2023-08-07, ObserverOfTime / K.Takata) after the death is known.

**Why it is a story.** The moment before the outcome: it is Friday evening in the Netherlands. He implements RFC 2324 as a Vim function, because E418 was "Illegal value" and he can spare the number. He sorts the help. He stays up past midnight on a valgrind timeout and a buffer-name warning. Saturday night he lands a stranger's typo. Nobody in that log knows they are looking at the end of a thirty-year authorship. The last human act is the same as the previous ten thousand: Problem / Solution / tick `src/version.c`.

**What the reader learns:** `--author` and `--committer` are different last days. The last authored commit is what he still wanted to fix; the last committed commit is the queue he refused to leave sitting. Search both. Odd hours on a one-maintainer repo are not a red flag — they *are* the project.

**surprise:** 5

---

## 8. Farewell: the maintainer line, the flowers, 9.1

- **find-type:** 4 (name that is written out)
- **hash:** `e978b4534a5e10471108259118c0ef791106fd92` (farewell); `b4ddc6c11e95cef4b372e239871fae1c8d4f72b6` (9.1.0000, 2024-01-02)
- **date:** 2023-08-13 10:33:05 +0200
- **author:** Christian Brabandt `<cb@256bit.org>` (committed by GitHub)
- **message:** `Farewell to Bram and dedicate upcoming Vim 9.1 to him (#12749)`

```
git -C ~/book16/repos/vim show e978b4534a5e10471108259118c0ef791106fd92 -- LICENSE README.txt runtime/doc/version9.txt | head -80
```

LICENSE, one token of the social contract:

```
-          The current maintainer is Bram Moolenaar <Bram@vim.org>.  If this
-          changes it will be announced in appropriate places (most likely
+          The current maintainers are listed here: https://github.com/orgs/vim/people.
+          If this changes it will be announced in appropriate places (most likely
```

README.txt, the line that had been his since the first commit of this git:

```
-Send any other comments, patches, flowers and suggestions to:
-Bram Moolenaar    E-mail: Bram@vim.org
+Send any other comments, patches, flowers and suggestions to the vim-dev mailing list:
+<vim-dev@vim.org>
```

`version9.txt` gains the dedication the 9.1 release will ship:

```
Vim version 9.1 is dedicated to Bram Moolenaar, who passed away on August 3rd 2023
while still working full-time on Vim. ... Bram was also passionate about his |ICCF|
foundation to help children in Uganda.  If you enjoy using Vim, please consider donating!
```

Christian's first patch-number commits as the new committer are 9.0.1679 / 1680 (Aug 8–9), sodium tests and leftover files, already in the old Problem/Solution form plus `Signed-off-by:`. The flowers go to a list.

**Why it is a story.** The moment before the outcome: the license itself named one human and promised that if this changed it would be announced. This commit *is* the announcement. It is also a GitHub pull request, the grammar Bram reverted in 2019. They keep his patch-number machine and his Problem/Solution paragraphs, and they add `Signed-off-by` and an org URL. A one-man history does not become a committee overnight; it becomes a list, a mailing list, and a dedication.

**What the reader learns:** the successor's first week is almost never a feature. It is LICENSE, README, security contacts (`6ec7808c4a` SECURITY.md, Aug 9), and the question "where do the flowers go." Read those diffs for the handover; the version bump comes later (9.1.0000, 2024-01-02: `Problem: Need a new release` / `Solution: Release Vim 9.1`).

**surprise:** 3

---

## 9. `Vim is Charityware` — blamed to the import, rewritten when ICCF ends

- **find-type:** 5 (line that outlived its institution) — also 4
- **hashes:** `071d4279d6ab81b7187b48f3a0fc61e587b6db6c` (line arrives); `0405665638052ca1180bdb2855237cd1868526a3` (ICCF dissolves)
- **dates:** 2004-06-13 / 2025-11-01
- **authors:** Bram Moolenaar; Christian Brabandt
- **messages:** `updated for version 7.0001` / `patch 9.1.1893: ICCF charity will dissolve`

```
git -C ~/book16/repos/vim blame -L 10,14 HEAD -- runtime/doc/uganda.txt
071d4279d6 (Bram Moolenaar     2004-06-13 20:20:40 +0000 10) Vim is Charityware.  You can use and copy it as much as you like, but you are
071d4279d6 (Bram Moolenaar     2004-06-13 20:20:40 +0000 11) encouraged to make a donation for needy children in Uganda.  Please see |kcc|
0405665638 (Christian Brabandt 2025-11-01 16:15:39 +0000 12) below or visit the Kuwasha web site, available at the following URL:

git -C ~/book16/repos/vim log -1 --format='%B' 0405665638052ca1180bdb2855237cd1868526a3
patch 9.1.1893: ICCF charity will dissolve

Problem:  ICCF charity will dissolve
Solution: Update references to Kuwasha

Since the ICCF will be dissolved and handing over to the Kuwasha charity
to continue supporting the Kibaale Children Center in Uganda, update the
uganda.txt help file.
```

The same two sentences are in the day-one `README.txt` (`^0c628d1da`, still blamed on HEAD around the charity paragraph). The 2025 commit replaces iccf-holland.org with kuwasha.net and writes that ICCF Holland "transfered all activities to its sister charity Kuwasha in Canada and dissolved at the end of 2025." The sponsor-voting machinery is already gone (`ff1680722d`, 2024-08-14).

**Why it is a story.** The moment before the outcome: Charityware was not a slogan. It was a Dutch foundation, a year he spent in Kibaale, a sentence in every copy of Vim. The foundation cannot outlive him by much. The sentence can. Christian does the same job Bram did with defaults.vim — change the load-bearing pointer, leave the moral intact. Two years after the dedication, the help file has to say the charity's name changed.

**What the reader learns:** `git blame` a mission sentence. If it is still the import, and a later commit only swaps the URL, you are looking at an institution dying under a slogan that worked. License-adjacent files (`uganda.txt`, `SPONSORS`, `AUTHORS`) are where projects record grief.

**surprise:** 4

---

## 10. After: the shortlog becomes a crowd, the subject line does not

- **find-type:** 4 (names that appear)
- **hashes:** window after 2023-08-03; style anchor `84bc00e9b52b1174888f2f696f8b628a83c49988` (Christian's first numbered patch as the new committer)
- **date:** 2023-08-08 onward
- **authors:** Christian Brabandt 1164, zeertzjq 544, Hirohito Higashi 314 (since the death, through tip)
- **message (anchor):** `patch 9.0.1679: Cleanup Tests from leftover files`

```
git -C ~/book16/repos/vim shortlog -sn HEAD --since=2023-08-03 | head -6
  1164	Christian Brabandt
   544	zeertzjq
   314	Hirohito Higashi
   291	Yegappan Lakshmanan
   259	Doug Kearns
   187	Yasuhiro Matsumoto

git -C ~/book16/repos/vim log --reverse --committer='Christian Brabandt' --since=2023-08-03 --format='%ci %an | %s' | head -4
2023-08-08 20:39:55 +0200 Christian Brabandt | patch 9.0.1679: Cleanup Tests from leftover files
2023-08-09 18:16:16 +0200 Christian Brabandt | patch 9.0.1680: sodium test fails in Github CI
2023-08-09 19:58:58 +0200 Philip H | patch 9.0.1681: Build Failure with Perl 5.38
2023-08-09 20:07:26 +0200 Balki | defaults.vim: Update comment to simplify reverting augroup
```

Message style after 13 August still says `patch 9.0.NNNN: …` / `Problem:` / `Solution:` — Bram's form — and now also `Signed-off-by:`, `closes: #NNNN`, GitHub as committer on the PR path. Runtime file PRs land with `#12741` in the subject, something that barely existed while he was alive. The patch counter never resets.

**Why it is a story.** The moment before the outcome: they can keep the machine or they can keep the man. They keep the machine. The version.c ritual (`/* Add new patch number below this line */`, blamed to the 2004 dump) is how a crowd agrees it is still Vim. What changes is who is allowed to increment it, and that the increment now often has two names.

**What the reader learns:** a one-maintainer project's survival is visible in *who is allowed to use the old subject-line grammar*. If the numbers keep going and the authors multiply, the handover worked. If the grammar breaks, you are looking at a fork that has not admitted it.

**surprise:** 3

---

## Ranked top-3

1. **The last 32 hours** (dig 7) — `err_teapot()` on Friday evening, help sorted, a 00:54 crypt-test rename, then at 02:38 he commits a stranger's `arguements` fix and never authors again. Surprise 5; `--author` and `--committer` disagree on the last day.
2. **The first other name is reverted before dinner** (dig 4) — Christian's Cirrus CI, six hours to live; the next `Merge pull request` is four days after Bram dies. Surprise 5; the constitution is a revert.
3. **Day one is 2004, Stevie is a comment** (digs 1–2) — README, then 750,846 lines, no 1991 root; Fish disk 217 still blamed in `version.c`. Surprise 4; git starts thirteen years late on purpose.

**Disappointing:** there is no planted 1991 date and no dramatic delete-the-world revert; the pre-git decades are simply absent (not faked), and the famous "Bram did everything" story is exactly what `shortlog` says — the surprise is in the last weekend and the first revert, not in a hidden second author.
