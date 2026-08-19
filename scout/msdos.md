# Scout: MS-DOS (microsoft/MS-DOS)

- **Repo:** https://github.com/microsoft/MS-DOS
- **Clone:** `~/book16/repos/msdos` (already present; not re-cloned). Working tree 261M total; `.git` 118M. Almost all the weight is `v4.0-ozzie` (117M of scanned 1984 beta PDFs) plus `v4.0` (24M). The 1981–83 trees are tiny: `v1.25` 504K / 35 files, `v2.0` 2.6M / 156 files.
- **History span:** commit dates 2018-09-21T17:47:37-07:00 → 2024-04-25T22:32:27+00:00. Author dates claim 1982-03-03T16:51:26-08:00 → 2024-04-25T21:24:10+01:00. The 1982/1983 stamps are planted (find #2). Silence from 2018-11-05 to 2024-04-13.
- **Commits:** 104 on `HEAD` / `main` (65 non-merge, 39 merges). No tags. One branch.
- **Authors:** Rich Turner 42 (then gone), a 2018 crowd of README translators, then in 2024: Microsoft Open Source 3, Microsoft GitHub User 1, Jeff Wilcox 1, José Mendes 1, **Mark Zbikowski 1**. By author-year: 1 in 1982, 1 in 1983, 95 in 2018, 7 in 2024.

This is not a development history. It is three museum drops (v1.25, v2.0, v4.0 + the cancelled Multitasking DOS) wrapped in a month of community README translations and then filed. Git was used as a display case. The 1980s programmers never committed here; their names survive as comments inside files whose `git blame` author is a 2018 Microsoft PM or, later, MZ himself. Digs are thin. That thinness *is* the story: what a corporate dump chooses to remember.

---

## 1. Day one is a logo, a smashed license, and `githib.com`

- **Find-type:** 3 (first commit)
- **Hash:** `b1e80fe5b33212027afdb4bf1f9bd7d75033b348`
- **Date:** 2018-09-21T17:47:37-07:00 (author = committer)
- **Author:** Rich Turner `<richturn@microsoft.com>`
- **Message:** `Initial commit`
- **Command:**

```
git -C ~/book16/repos/msdos log --reverse --format='%h %aI %cI %an %s' | head -5
git -C ~/book16/repos/msdos show --stat --format=fuller b1e80fe5b33212027afdb4bf1f9bd7d75033b348
```

```
b1e80fe 2018-09-21T17:47:37-07:00 2018-09-21T17:47:37-07:00 Rich Turner Initial commit
fce0f75 1982-03-03T16:51:26-08:00 2018-09-21T17:51:26-07:00 Rich Turner MS-DOS v1.25 Release
80ab2fd 1983-08-12T17:53:34-07:00 2018-09-21T17:53:34-07:00 Rich Turner MS-DOS v2.0 Release
a527b9a 2018-09-29T02:12:15+01:00 2018-09-29T02:12:15+01:00 Nicola Heald Fix the license link
bf1defa 2018-09-29T11:39:42+02:00 2018-09-29T11:39:42+02:00 David Gatti Added working float left

 LICENSE.md             |   9 +++++++++
 README.md              |  16 ++++++++++++++++
 msdos-logo.png         | Bin 0 -> 12977 bytes
 msdos-logo_250x250.png | Bin 0 -> 5092 bytes
 4 files changed, 25 insertions(+)
```

The README in that commit points the license at `https://githib.com/microsoft/msdos/license.txt` and titles a section **Contribute!**, inviting PRs for “additional non-source content.” `LICENSE.md` has the MIT text smashed together (`freeof charge`, `associateddocumentation`). There is no DOS.

- **Why it is a story:** Four minutes before the 1980s arrive, the public face of MS-DOS on GitHub is a logo and a broken link. Day one of a historic source release is a marketing page. The source is the *next* commit, and that next commit will pretend it happened in 1982.
- **What the reader learns:** `git log --reverse | head` on a “historic source” repo often shows the press release, not the history. Read the first tree, not the first subject line.
- **Surprise:** 3

---

## 2. Author date 1982, commit date 2018 — the clock time of day is the fingerprint

- **Find-type:** 2 (planted / dated / faked artifact)
- **Hashes:** `fce0f75959b9806f4016beb7b19e19b37cc97b6c` (v1.25), `80ab2fddfdf30f09f0a0a637654cbb3cd5c7baa6` (v2.0)
- **Dates:** author 1982-03-03T16:51:26-08:00 / 1983-08-12T17:53:34-07:00; committer 2018-09-21T17:51:26-07:00 / 2018-09-21T17:53:34-07:00
- **Author:** Rich Turner `<richturn@microsoft.com>`
- **Messages:** `MS-DOS v1.25 Release` / `MS-DOS v2.0 Release`
- **Command:**

```
git -C ~/book16/repos/msdos log --format='commit %H%nAuthor:     %an <%ae>%nAuthorDate: %aD%nCommit:     %cn <%ce>%nCommitDate: %cD%n%n    %s%n' -2 --skip=1
```

```
commit fce0f75959b9806f4016beb7b19e19b37cc97b6c
Author:     Rich Turner <richturn@microsoft.com>
AuthorDate: Wed, 3 Mar 1982 16:51:26 -0800
Commit:     Rich Turner <richturn@microsoft.com>
CommitDate: Fri, 21 Sep 2018 17:51:26 -0700

    MS-DOS v1.25 Release

commit 80ab2fddfdf30f09f0a0a637654cbb3cd5c7baa6
Author:     Rich Turner <richturn@microsoft.com>
AuthorDate: Fri, 12 Aug 1983 17:53:34 -0700
Commit:     Rich Turner <richturn@microsoft.com>
CommitDate: Fri, 21 Sep 2018 17:53:34 -0700

    MS-DOS v2.0 Release
```

The calendar days were taken from the last line of each tree’s own revision history:

```
; 1.25 03/03/82 Put marker (00) at end of directory to speed searches
   (v1.25/source/MSDOS.ASM)

; 2.11 08/12/83 Dos split into several more modules for assembly on
;               an IBM PC
   (v2.0/source/MSHEAD.ASM)
```

The *clock* was not invented. 16:51:26 −0800 and 17:51:26 −0700 are the same UTC second; 17:53:34 is identical on both sides of the v2.0 stamp. Someone ran `git commit --date` (or set `GIT_AUTHOR_DATE`) to the file’s last revision day and left the 2018 afternoon on the clock.

`git log --reverse` prints AuthorDate as `Date:`, so a casual reader sees 1982, then 1983, then 2018. `git blame` on every 1980s line says `Rich Turner 1982-03-03` / `Rich Turner 1983-08-12`.

- **Why it is a story:** A 2018 program manager is about to put Seattle Computer Products and Microsoft’s 8086 DOS on GitHub. He has two folders and two dates from the headers. He stamps the commits so `git log` will *look* like a 1980s project. The files are real. The timestamps are costume.
- **What the reader learns:** Always print `%aI` and `%cI`. A 36-year author/committer gap with a matching HH:MM:SS is not a timezone accident; it is a `--date`. `git blame` will happily attribute 1981 assembly to a man who was not at Microsoft yet.
- **Surprise:** 5

---

## 3. A 16 December 2013 email, blamed to 3 March 1982

- **Find-type:** 2 (planted artifact — the tell)
- **Hash:** `fce0f75959b9806f4016beb7b19e19b37cc97b6c`
- **Date:** author 1982-03-03; file body dated Mon, 16 Dec 2013
- **Author (git):** Rich Turner. Author (letter): Tim Paterson → Len Shustek (Computer History Museum)
- **Message:** `MS-DOS v1.25 Release`
- **Command:**

```
git -C ~/book16/repos/msdos blame -- v1.25/Tim_Paterson_16Dec2013_email.txt
```

```
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800  1) From: Tim Paterson
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800  2) To: Len Shustek
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800  3) Date: Mon, 16 Dec 2013 10:34:17 -0800
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800  4) Subject: RE: Source code to MS-DOS 1.0
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800  7) I have found and attached the source code for MS-DOS 1.25 as shipped by Seattle Computer Products.
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800  9) IBM's DOS 1.1 corresponds to MS-DOS 1.24.  There is one minor difference between 1.24 and 1.25, as noted in the revision history at the top of MSDOS.ASM.
```

The same commit also contains `ASM.ASM` revision notes from **after** the stamp:

```
; 07/04/82  2.41  Fix Intel's 8087 "reverse-bit" bug; don't copy date
; 08/18/82  2.42  Increase stack from 80 to 256 (Damn! Overflowed again!)
; 01/05/83  2.43  Correct over-zealous optimization in 2.42
; 05/09/83  2.44  Add memory usage report
```

This is a mixed-age SCP folder Tim mailed the museum in 2013, not a 3 March 1982 checkout.

- **Why it is a story:** The provenance letter is in the box, dated 2013, and `git blame` still prints 1982. The dump is honest in the file and dishonest in the commit metadata. Tim is telling Len what the tree actually is (SCP 1.25, IBM 1.1 = 1.24, only `MSDOS.ASM`/`COMMAND.ASM` went to other OEMs). Git is telling the reader something else.
- **What the reader learns:** If a “historic” commit contains a file whose *contents* mention a later year, the author date is decoration. Blame the letterhead, not the `AuthorDate`.
- **Surprise:** 5

---

## 4. `MZ is back!` — the initials walk in and commit

- **Find-type:** 4 (name that appears — 41 years late)
- **Hash:** `2d04cacc5322951f187bb17e017c12920ac8ebe2`
- **Date:** AuthorDate 2024-04-25T21:24:10+01:00; CommitDate 2024-04-25T22:32:27+00:00 (~1 hour gap)
- **Author:** Mark Zbikowski `<mark@zbikowski.org>`
- **Committer:** Microsoft Open Source `<microsoftopensource@users.noreply.github.com>`
- **Message:** `MZ is back!`
- **Command:**

```
git -C ~/book16/repos/msdos show --stat --format=fuller 2d04cacc5322951f187bb17e017c12920ac8ebe2 | head -20
git -C ~/book16/repos/msdos show --stat 2d04cacc5322951f187bb17e017c12920ac8ebe2 | tail -3
```

```
commit 2d04cacc5322951f187bb17e017c12920ac8ebe2
Author:     Mark Zbikowski <mark@zbikowski.org>
AuthorDate: Thu Apr 25 21:24:10 2024 +0100
Commit:     Microsoft Open Source <microsoftopensource@users.noreply.github.com>
CommitDate: Thu Apr 25 22:32:27 2024 +0000

    MZ is back!

 README.md                                          |    7 +-
 v4.0-ozzie/Multitasking DOS BETA - Intro.pdf       |  Bin 0 -> 9589043 bytes
 ... (12 scanned OEM beta manuals, serialized disks)
 v4.0/src/BIOS/MSINIT.ASM                           | 2819 ++++++++
 ...
 1339 files changed, 527719 insertions(+), 3 deletions(-)
```

In `v2.0/source/MSHEAD.ASM` (1983 dump) the roster is spelled out. In the tree MZ just added, the same lines have become initials, with an SCCSID of 10 April 1985:

```
;	SCCSID = @(#)mshead.asm	1.1 85/04/10
;	    TP (Ret.)
;	    AR
;	    NP (Parenting)
;	    MZ
;	    CP (BIOS) (ret.)
```

`git blame -L 5,10 -- v4.0/src/INC/MSHEAD.ASM` now prints `Mark Zbikowski 2024-04-25` on the line that is just `MZ`.

The extra directory is `v4.0-ozzie`: Multitasking MS-DOS Beta 1.00, “based upon MS-DOS Version 2 sources,” individually serialized, with a title page that says **Multi-Taking MS-DOS**. The cancelled product, in the original architect’s commit.

- **Why it is a story:** The man whose initials are the first two bytes of every DOS `.EXE` (`MZ`) has been a comment in this repo since 2018. In 2024 he is the author of one commit, 1,339 files, 527,719 lines, subject line a joke only the old team would write. Microsoft Open Source is the committer — legal pushed it; MZ signed it. The day before, they had merged a 2018 typo PR and hidden the translations. Then the archive got a new wing, and the name on the door is the name in the header.
- **What the reader learns:** `git shortlog` over the whole life of a dump-repo is noise. The last author can be the only one who was *in the room*. A one-line subject next to a half-million-line diff is a signature, not a summary.
- **Surprise:** 5

---

## 5. `NP (Parenting)` — a life event that outlived the process

- **Find-type:** 5 (comment that outlived its code) + 4 (name that recedes)
- **Hashes:** `80ab2fddfdf30f09f0a0a637654cbb3cd5c7baa6` (full names, 1983 dump), `2d04cacc5322951f187bb17e017c12920ac8ebe2` (initials, 1985-sourced v4.0)
- **Dates:** author-stamped 1983-08-12; re-introduced 2024-04-25
- **Authors (git):** Rich Turner, then Mark Zbikowski
- **Command:**

```
git -C ~/book16/repos/msdos blame -L 3,9 -- v2.0/source/MSHEAD.ASM
git -C ~/book16/repos/msdos blame -L 5,10 -- v4.0/src/INC/MSHEAD.ASM
git -C ~/book16/repos/msdos log -S 'Parenting' --format='%h %aI %an %s'
```

```
80ab2fdd (Rich Turner 1983-08-12 17:53:34 -0700  5) ;           Tim Paterson (Ret.)
80ab2fdd (Rich Turner 1983-08-12 17:53:34 -0700  6) ;           Aaron Reynolds
80ab2fdd (Rich Turner 1983-08-12 17:53:34 -0700  7) ;           Nancy Panners (Parenting)
80ab2fdd (Rich Turner 1983-08-12 17:53:34 -0700  8) ;           Mark Zbikowski
80ab2fdd (Rich Turner 1983-08-12 17:53:34 -0700  9) ;           Chris Peters (BIOS) (ret.)

2d04cacc (Mark Zbikowski 2024-04-25 21:24:10 +0100  6) ;	    TP (Ret.)
2d04cacc (Mark Zbikowski 2024-04-25 21:24:10 +0100  7) ;	    AR
2d04cacc (Mark Zbikowski 2024-04-25 21:24:10 +0100  8) ;	    NP (Parenting)
2d04cacc (Mark Zbikowski 2024-04-25 21:24:10 +0100  9) ;	    MZ
2d04cacc (Mark Zbikowski 2024-04-25 21:24:10 +0100 10) ;	    CP (BIOS) (ret.)

80ab2fd 1983-08-12T17:53:34-07:00 Rich Turner MS-DOS v2.0 Release
2d04cac 2024-04-25T21:24:10+01:00 Mark Zbikowski MZ is back!
```

Above the roster: `>> EVERY change must noted below!! <<` — then a hundred dated lines, then one git commit that added the whole file.

- **Why it is a story:** Someone on the DOS team, sometime around 1982–83, updated the header the way you update a whiteboard: Tim has left (`Ret.`), Nancy is out on parenting leave, Chris still owns BIOS and is also marked retired. Two years later the names are initials but `(Parenting)` is still there — the joke, or the courtesy, was load-bearing. Forty years on, `git blame` says a 2018 PM and then MZ wrote those lines. Neither did. The file remembered a staffing change that source control was never given.
- **What the reader learns:** Headers and SCCSIDs are a VCS that predates your VCS. When you import a tree, `blame` will name the importer. The interesting names are in the comment.
- **Surprise:** 4

---

## 6. `sort of HACKey. Not enough time to do it right.`

- **Find-type:** 5 (comment that outlived its code)
- **Hashes:** `80ab2fd` (v2.0 `COMMAND.ASM`), `2d04cac` (v4.0 `COMMAND1.ASM`)
- **Date:** 1982 in the comment (`REV 1.50`); git author-stamps 1983 and 2024
- **Command:**

```
git -C ~/book16/repos/msdos blame -L 30,32 -- v2.0/source/COMMAND.ASM
git -C ~/book16/repos/msdos blame -L 81,83 -- v4.0/src/CMD/COMMAND/COMMAND1.ASM
git -C ~/book16/repos/msdos log -S 'HACKey' --format='%h %aI %an %s'
```

```
80ab2fdd (Rich Turner 1983-08-12 17:53:34 -0700 30) ; REV 1.50
80ab2fdd (Rich Turner 1983-08-12 17:53:34 -0700 31) ;               Some code for new 2.0 DOS, sort of HACKey.  Not enough time to
80ab2fdd (Rich Turner 1983-08-12 17:53:34 -0700 32) ;               do it right.

2d04cacc (Mark Zbikowski 2024-04-25 21:24:10 +0100 82) ;	       Some code for new 2.0 DOS, sort of HACKey.  Not enough time to
2d04cacc (Mark Zbikowski 2024-04-25 21:24:10 +0100 83) ;	       do it right.

80ab2fd 1983-08-12T17:53:34-07:00 Rich Turner MS-DOS v2.0 Release
2d04cac 2024-04-25T21:24:10+01:00 Mark Zbikowski MZ is back!
```

Two versions later in the same file: `Rev 2.00` / `Lots of neato stuff`. The apology stayed.

- **Why it is a story:** DOS 2.0 is the release that added hierarchical directories, handles, and installable devices — the Unix-shaped DOS. In the command processor the author wrote down that the first cut was a hack and they knew it. The line is still in MS-DOS 4.00, next to code that had years to be rewritten. “Not enough time” became a fossil of a deadline that nobody in 2024 can feel.
- **What the reader learns:** A comment that names a compromise will outlive the compromise. `log -S` on the embarrassing word is how you find the moment before the rewrite that never came.
- **Surprise:** 3

---

## 7. `Damn! Overflowed again!` — and a stack of dates that break the stamp

- **Find-type:** 5 (comment) + 2 (the tree is younger than its commit)
- **Hash:** `fce0f75959b9806f4016beb7b19e19b37cc97b6c`
- **Date:** commit claims 1982-03-03; the line is dated 08/18/82
- **Author (file):** Tim Paterson. Author (git): Rich Turner
- **Command:**

```
git -C ~/book16/repos/msdos blame -L 20,24 -- v1.25/source/ASM.ASM
```

```
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800 21) ; 07/04/82  2.41  Fix Intel's 8087 "reverse-bit" bug; don't copy date
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800 22) ; 08/18/82  2.42  Increase stack from 80 to 256 (Damn! Overflowed again!)
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800 23) ; 01/05/83  2.43  Correct over-zealous optimization in 2.42
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800 24) ; 05/09/83  2.44  Add memory usage report
```

`ASM.ASM` is Tim’s Seattle Computer Products 8086 assembler, shipped in the same folder as DOS 1.25. He kept hitting his own stack. Version 2.42 doubled it to 256 bytes, swore, and still had to walk back an optimization five months later.

- **Why it is a story:** The only swear word in the 1.25 tree is an engineer talking to himself after a crash he had already had once (`again!`). It is also proof the “v1.25 Release” commit is a drawer, not a day: the assembler inside it was still being revised in May 1983. Adjacent, `MSDOS.ASM` really does stop at 03/03/82. The folder is a career, flattened.
- **What the reader learns:** One planted date on a multi-file import will be wrong for most of the files. Read the revision banners *inside* the blobs. They are the history git was not given.
- **Surprise:** 4

---

## 8. `***MAUlloa/Microsoft/V20***` — a name that almost isn’t

- **Find-type:** 4 (name that appears only as a string)
- **Hash:** `80ab2fddfdf30f09f0a0a637654cbb3cd5c7baa6`
- **Date:** 1983-08-12 (author stamp)
- **Command:**

```
git -C ~/book16/repos/msdos grep -n 'MAUlloa' 80ab2fd -- '*.ASM'
```

```
80ab2fd:v2.0/source/EDLIN.ASM:143:make    db      "***MAUlloa/Microsoft/V20***"
```

M.A. Ulloa also signs the 1984 Multitasking console driver (`v4.0-ozzie/bin/DISK2/BIOS/IBMMTCON.ASM`, V1.00–V1.03, 04/10/84–04/17/84) with a trail of `BUGBUG` comments. He never appears in `git shortlog`. The string is an in-binary signature, the 1980s equivalent of a `Signed-off-by` that no SCM would store.

- **Why it is a story:** EDLIN, the line editor everyone joked about, carries a vanity banner the assembler baked into the binary. The person who put it there is otherwise invisible to git. When Microsoft published the tree they published his name, once, in a `db` directive.
- **What the reader learns:** `git shortlog -sn` cannot see authors who only exist inside string literals. `git grep` the tree for `db "` and `Copyright` before you decide who worked here.
- **Surprise:** 3

---

## 9. One hundred commits, and the only 1980s file anyone was allowed to touch is `iinch`

- **Find-type:** 1 (tiny diff) — not huge blast radius; huge *policy* radius
- **Hashes:** `03c345ecb9b992c781c14abdb77baefd22b847b6` (2018-10-06, James Pack), merged `fd315d38abe72c77471401e6411d26d6434350d1` (2024-04-24)
- **Date:** written 2018-10-06T19:49:05-04:00; merged 2024-04-24T17:30:05-07:00 (five years, six months)
- **Author:** James Pack `<james.packjr@outlook.com>`
- **Message:** `Fixed minor spelling error in README.txt`
- **Command:**

```
git -C ~/book16/repos/msdos log --oneline -- v1.25 v2.0 v4.0 v4.0-ozzie
git -C ~/book16/repos/msdos show 03c345ecb9b992c781c14abdb77baefd22b847b6
```

```
2d04cac MZ is back!
03c345e Fixed minor spelling error in README.txt
80ab2fd MS-DOS v2.0 Release
fce0f75 MS-DOS v1.25 Release

-diskettes or three 8 iinch CP/M 80 format diskettes.
+diskettes or three 8 inch CP/M 80 format diskettes.
 1 file changed, 1 insertion(+), 1 deletion(-)
```

The first README said “don’t send Pull Requests suggesting any modifications to the source files.” James changed `v2.0/source/README.txt` (the OEM release notes: “skeltal BIOS,” “distriibuted,” “We apologize for any inconveniences these changes may have caused your technical publications staff”). The PR sat through 5.5 years of silence. It was merged the day before `MZ is back!`, by `Microsoft Open Source`.

No `.ASM` was ever edited after the drop.

- **Why it is a story:** The internet did what the internet does: it sent PRs. Microsoft had already decided the 1980s were frozen. The one historic-path hunk they accepted, half a decade later, is a doubled letter in a 1983 OEM memo. Housekeeping before the v4.0 unveiling, not a change of heart. The 1983 apology to “technical publications staff” is still in the file; `iinch` is not.
- **What the reader learns:** “Don’t send source PRs” will be tested. `git log -- path/to/historic` tells you whether the freeze was real. A 5-year merge latency is a policy document.
- **Surprise:** 4

---

## 10. `# Contribute!` becomes `# For historical reference`

- **Find-type:** 8 (rollback of the world) + 4 (names that recede)
- **Hash:** `a5eb02a4d7382faa1d8f91802a73241c32026a2d`
- **Date:** 2024-04-25T00:33:46+00:00
- **Author:** Microsoft Open Source `<microsoftopensource@users.noreply.github.com>`
- **Message:** `Moving localized READMEs` — “Thanks to everyone… recognizing the historical reference nature of this repository, we have moved these now dated files into a sub-folder.”
- **Command:**

```
git -C ~/book16/repos/msdos log --format='%ad %an' --date=format:%Y | sort | uniq -c
git -C ~/book16/repos/msdos show --stat --format=fuller a5eb02a4d7382faa1d8f91802a73241c32026a2d | head -35
git -C ~/book16/repos/msdos log -S 'Contribute!' --format='%h %aI %an %s' -- README.md
```

```
      1 1982
      1 1983
     95 2018
      7 2024

 README-ger.md => .readmes/README-ger.md   | 0
 ... (20 localized READMEs, all rename-only)
 .readmes/thanks.md                        | 7 +++++++
 README.md                                 | 4 ++--
-# Contribute!
+# For historical reference

a5eb02a 2024-04-25T00:33:46+00:00 Microsoft Open Source Moving localized READMEs
b1e80fe 2018-09-21T17:47:37-07:00 Rich Turner Initial commit
```

Rich Turner merged ~37 translation PRs in two bursts (1–5 Oct and a 17:00-hour on 5 Nov 2018: Japanese, Hindi, Spanish accents, Turkish, Thai, Russian, Hungarian, Indonesian…), then vanished. His address flips from `richturn@microsoft.com` (the three seed commits) to `rich@bitcrazed.com` (the GitHub merges). 2024’s authors are bot/org accounts plus MZ.

- **Why it is a story:** September 2018, Microsoft opens a museum and leaves a “Contribute!” sign on the door. The world localizes the plaque into twenty languages in two weeks. Five years later the same company, preparing to put v4.0 in the case, takes the sign down and puts the translations in a folder that starts with a dot. They even thank the translators in `.readmes/thanks.md` using the same paragraph as the commit message. The 1980s source never moved. The 2018 community did.
- **What the reader learns:** A README invitation is a social contract with a half-life. `log -S` on the heading that invited you will tell you when the contract was rewritten. `shortlog` by year will tell you the project changed hands without a handover commit.
- **Surprise:** 3

---

## Ranked top-3

1. **Planted 1982/1983 author dates, with a 2013 email inside the 1982 commit** (#2 + #3). The whole archaeology of this repo is “git was asked to pretend.” Clock-time reuse is the fingerprint; Tim Paterson’s letter is the confession.
2. **`MZ is back!`** (#4). The initials in the EXE header and in `MSHEAD.ASM` become a 2024 author of 527,719 lines, including the cancelled Multitasking DOS. One hour later Microsoft Open Source commits it.
3. **`NP (Parenting)` / `HACKey` / `Damn! Overflowed again!`** (#5–#7). The only 1980s voices in the object are comments. `git blame` names Rich Turner or Mark Zbikowski. The comments name a leave of absence, a missed deadline, and a stack that overflowed twice.

**Disappointing, honestly:** there is no development history to dig — 104 commits, 95 of them 2018 README translations, two backdated tarball drops, one celebrity cameo. Git was a filing cabinet. The book’s angle here is not how DOS was built; it is what a corporate dump chooses to remember, and what it stamps on the box.
