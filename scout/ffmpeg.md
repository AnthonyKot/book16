# Scout: FFmpeg/FFmpeg

- **repo:** https://github.com/FFmpeg/FFmpeg
- **clone:** `~/book16/repos/ffmpeg` (already present; not re-cloned)
- **clone size:** 623M on disk; `git count-objects -vH` → 1 pack, 502.41 MiB, 812,090 objects
- **history span:** 2000-12-20 00:02:47 +0000 → 2026-08-18 14:40:56 +0200 (author) / 2026-08-19 01:54:15 +0000 (committer)
- **commits:** 126213 (`git rev-list --count HEAD`)
- **tip:** `564f92cce23ae95399476617b8a1dc357f002a47` Ayoub Nabil Boubagrat / James Almer, `avcodec/ac3dec_fixed: preserve overlap across dependent substreams`
- **roots:** 2 (`git log --max-parents=0`) — cvs2svn empty init, and a 2026 checkasm subtree squash

```
git -C ~/book16/repos/ffmpeg log --reverse --format='%H %aI %an %s' | head -5
77bb6835ba752bb9335d208963a53227bbb1bc63 2000-12-20T00:02:47+00:00 (no author) New repository initialized by cvs2svn.
9aeeeb63f7e1ab7b0b7bb839a5f258667a2d2d78 2000-12-20T00:02:47+00:00 Fabrice Bellard Initial revision
dcdfb8ede3580cde6acc1c6ca889ad3b610d75dc 2012-10-25T15:10:22+02:00 Janne Grunau pcmdec: change default of channels parameter to 1
22f7942fe7d7349e3562ac68fa101d9efec522df 2012-10-25T15:42:08+02:00 Luca Barbato ffv1: set the range coder state in decode_slice_header
3089828607baa0511f0873f54372aedd62608e53 2001-07-19T20:40:31+00:00 Fabrice Bellard test

git -C ~/book16/repos/ffmpeg log -1 --format='%H %aI %cI %an %s'
564f92cce23ae95399476617b8a1dc357f002a47 2026-08-18T14:40:56+02:00 2026-08-19T01:54:15+00:00 Ayoub Nabil Boubagrat avcodec/ac3dec_fixed: preserve overlap across dependent substreams

git -C ~/book16/repos/ffmpeg log --max-parents=0 --pretty='format:%H %aI %an %s'
66eaaa644a957da53da484b3af3c2d0a8ad2bb4a 2026-06-04T11:44:26+02:00 Niklas Haas Squashed 'tests/checkasm/ext/' content from commit 0df02535c7
77bb6835ba752bb9335d208963a53227bbb1bc63 2000-12-20T00:02:47+00:00 (no author) New repository initialized by cvs2svn.
```

`git log --reverse | head` already lies. Commit #3 is October 2012. Commit #4 is dated 1 January 2001 and is why #3 is there. Between those poles sit a seven-month self-deletion, a 24-hour leadership revert, 1,194 merges from a remote named `qatar`, and a Project Leader heading that outlived the leader.

---

## 1. Day one is a cvs2svn empty, then a man who is not there

- **find-type:** 3 (first commit) — also 2 (planted name)
- **hashes:** `77bb6835ba752bb9335d208963a53227bbb1bc63` (empty), `9aeeeb63f7e1ab7b0b7bb839a5f258667a2d2d78` (tree)
- **date:** Wed 20 Dec 2000 00:02:47 +0000 (both; author = committer)
- **author:** `(no author) <(no author)@9553f0bf-9b14-0410-a0b8-cfaf0461ba5b>` / Fabrice Bellard `<fabrice@bellard.org>`
- **messages:** `New repository initialized by cvs2svn.` / `Initial revision`

```
git -C ~/book16/repos/ffmpeg log -1 --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aD%n%n%B' 77bb6835ba752bb9335d208963a53227bbb1bc63
git -C ~/book16/repos/ffmpeg diff-tree --root --shortstat 9aeeeb63f7e1ab7b0b7bb839a5f258667a2d2d78
git -C ~/book16/repos/ffmpeg show 9aeeeb63f7e1ab7b0b7bb839a5f258667a2d2d78:README | head -3
commit 77bb6835ba752bb9335d208963a53227bbb1bc63
Author: (no author) <(no author)@9553f0bf-9b14-0410-a0b8-cfaf0461ba5b>
AuthorDate: Wed, 20 Dec 2000 00:02:47 +0000

    New repository initialized by cvs2svn.

    Originally committed as revision 1 to svn://svn.ffmpeg.org/ffmpeg/trunk
9aeeeb63f7e1ab7b0b7bb839a5f258667a2d2d78
 38 files changed, 13216 insertions(+)
FFmpeg version 0.9 - (c) 2000 Gerard Lantau.
```

The UUID `9553f0bf-9b14-0410-a0b8-cfaf0461ba5b` is the Subversion repository. Both objects share the same second. The 13,216-line tree — `ffmpeg.c`, `ffserver.c`, `libav/mpegvideo.c`, a Video4Linux grabber — is signed in git as Fabrice Bellard and inside every source file as **Gerard Lantau** (`glantau@users.sourceforge.net`). The README ends "they really ARE THE SAME except for the encoding huffman codes." Then seven months of silence.

**Why it is a story.** CVS is being stood up at midnight UTC. The author who will become famous for QEMU and TinyCC is publishing a "hyper fast realtime audio/video encoder" under a name that is not his, from a SourceForge address, claiming the MPEG-1 / H.263 / RealVideo cores are one encoder with different Huffman tables. Git will later remember Bellard; the blobs remember Lantau. Day one is a conversion artifact plus a mask.

**Reader learns:** the first commit of a cvs2svn/git-svn repo is two objects that share a timestamp — the empty "initialized by cvs2svn" and the snapshot. `git log --reverse` names the committer the importer invented; `git show ROOT:README` names the person they were that week.

**surprise:** 4

---

## 2. He deletes the origin, then starts again

- **find-type:** 8 (rollback of the world)
- **hashes:** `1b58d58ddaf8a8c766a0353885ff504babed0453` (wipe), `de6d9b6404bfd1c589799142da5a95428f146edd` (second "Initial revision"), `85f07f223de9fbeb2b9d66db11f89091ac717926` (merge)
- **date:** Thu 19 Jul 2001 20:46:37 +0000 / Sun 22 Jul 2001 14:18:56 +0000
- **author:** Fabrice Bellard
- **messages:** `removing old files` / `Initial revision` / `merge`

```
git -C ~/book16/repos/ffmpeg show --stat --format='commit %h%nAuthorDate: %aD%n%s' 1b58d58ddaf8a8c766a0353885ff504babed0453 | tail -8
    removing old files
 libav/mpegvideo.c     | 1098 ---------------------------------
 ...
 37 files changed, 13114 deletions(-)

git -C ~/book16/repos/ffmpeg show --shortstat --format='%aI %s' de6d9b6404bfd1c589799142da5a95428f146edd
2001-07-22T14:18:56+00:00 Initial revision
 ...
```

r3 is `test` (delete `jpegenc.c`). Six minutes later r4 erases the December tree — 13,114 deletions, every Lantau file. Sunday he lands another `Initial revision` (the real FFmpeg: `configure`, `libavformat` ancestors, `libavcodec/`) and a `merge` that puts `ffmpeg.c` / `ffserver.c` back. The 2000 README is gone. The 2001 README still says Gerard Lantau, and now also "generic audio and video file converter."

**Why it is a story.** For seven months the only object in version control is the 0.9 dump. Then in one evening he treats that dump as a prototype and throws it away. Anyone who bisects past July 2001 falls out of the product and into a discarded encoder. The phrase "Initial revision" happens twice; only the second one is an ancestor of `ffmpeg.c` as the project became.

**Reader learns:** `git log --reverse` can contain two genesis commits with the same subject. The one that counts is the one whose paths still exist. `git log --diff-filter=D --summary` on the first month after an import finds the real cut.

**surprise:** 4

---

## 3. A 2012 clock set to 1 January 2001 rewrites `git log --reverse`

- **find-type:** 2 (planted / dated / faked artifact)
- **hashes:** `22f7942fe7d7349e3562ac68fa101d9efec522df` (bad committer date), parent `dcdfb8ede3580cde6acc1c6ca889ad3b610d75dc`
- **date:** author Thu 25 Oct 2012 15:42:08 +0200; **committer Mon 1 Jan 2001 01:06:41 +0100**
- **author:** Luca Barbato `<lu_zero@gentoo.org>`
- **message:** `ffv1: set the range coder state in decode_slice_header`

```
git -C ~/book16/repos/ffmpeg log -1 --format='commit %H%nAuthorDate: %aD%nCommitDate: %cD%nParent: %P%n%s' 22f7942fe7d7349e3562ac68fa101d9efec522df
git -C ~/book16/repos/ffmpeg log --reverse --format='%ci %h %s' | head -5
commit 22f7942fe7d7349e3562ac68fa101d9efec522df
AuthorDate: Thu, 25 Oct 2012 15:42:08 +0200
CommitDate: Mon, 1 Jan 2001 01:06:41 +0100
Parent: dcdfb8ede3580cde6acc1c6ca889ad3b610d75dc
ffv1: set the range coder state in decode_slice_header
2000-12-20 00:02:47 +0000 77bb6835ba New repository initialized by cvs2svn.
2000-12-20 00:02:47 +0000 9aeeeb63f7 Initial revision
2012-10-25 15:14:40 +0200 dcdfb8ede3 pcmdec: change default of channels parameter to 1
2001-01-01 01:06:41 +0100 22f7942fe7 ffv1: set the range coder state in decode_slice_header
2001-07-19 20:40:31 +0000 3089828607 test
```

This is the only commit in the entire history whose committer date is 2001-01-01 (`git log --format='%ci' | grep -c '^2001-01-01'` → 1). `--reverse` shows parents before children. Because Luca's committer clock says January 2001, git is obliged to emit his parent first — Janne Grunau's 25 Oct 2012 `pcmdec` change, a perfectly ordinary Libav-era commit with honest dates. The third object you meet in FFmpeg's chronology is therefore from the fork year, twelve years late, for a six-line range-coder fix.

**Why it is a story.** Someone's `GIT_COMMITTER_DATE` (or the machine clock) is 1 January 2001, 01:06 CET, on a Thursday afternoon in 2012. The patch is real. The timestamp is not. Every later archaeologist who types the command in every tutorial — `git log --reverse | head` — is handed a 2012 pcmdec default as if it were the third thing Fabrice did. The lie is a parent-before-child constraint plus one bad clock, not a rewrite.

**Reader learns:** `git log` sorts by **committer** date. One `CommitDate` in the wrong year will drag its whole parent chain into the origin story. Always print `%ci` next to `%ai`. `git log --reverse --format='%ci %ai %s'` is the command that catches this.

**surprise:** 5

---

## 4. 24 hours: they delete the Project Leader

- **find-type:** 6 (revert war) — also 1 (tiny diff, huge blast)
- **hashes:** `f4f5cab94e0881cd30965b28f3d78d9c63d6918e` (delete), `69c92320d760d3925d5c83c4fbca6012deef4195` (URLs), `111ccca602e96f18d4fab1117b2b768ae51814f7` + `fe678413557a3bcc4639897f7f8c30f61cc8fc31` (reverts)
- **date:** Tue 18 Jan 2011 11:05:51 -0800 / Wed 19 Jan 2011 18:53:53 +0100
- **authors:** Jason Garrett-Glaser `<jason@x264.com>` (Dark Shikari); Mans Rullgard; Michael Niedermayer
- **messages:** `Initial MAINTAINERS update` / `Update git-howto with ffmpeg.org URLs` / `Revert "Initial MAINTAINERS update"`

```
git -C ~/book16/repos/ffmpeg show f4f5cab94e0881cd30965b28f3d78d9c63d6918e -- MAINTAINERS
    Initial MAINTAINERS update
    Per http://lists.mplayerhq.hu/pipermail/ffmpeg-devel/2011-January/103440.html.
-Project Leader
-==============
-
-Michael Niedermayer
-  final design decisions

git -C ~/book16/repos/ffmpeg log -1 --format='%aD%n%B' 111ccca602e96f18d4fab1117b2b768ae51814f7
Wed, 19 Jan 2011 18:53:53 +0100
Revert "Initial MAINTAINERS update"
This reverts commit f4f5cab94e0881cd30965b28f3d78d9c63d6918e.
Reason is that this has been mistakely commited as discussed.
```

Same afternoon Dark Shikari also deprecates `CREDITS` ("It's useless now that we've switched to git," `a5da3b040c`). Mans has already pointed `git-howto.txt` at `git://git.ffmpeg.org` instead of VideoLAN. Janne has rewritten the howto for a **no-merge policy** (`ffe9fd253f`, 17 Jan: "The master tree will reject pushes with merge commits"). Twenty-four hours later Niedermayer puts the seven lines back and reverts the URLs. The commit messages say "mistakely commited as discussed." They do not say *coup*.

**Why it is a story.** The moment before the outcome: a group of active maintainers still have push, the mailing-list thread is the constitution, and the Project Leader heading is just a file. Deleting seven lines is how you try to take a project. Restoring them, with a spelling error in "mistakely," is how the person those lines named keeps it. Libav is announced about eight weeks later. The revert is the last moment FFmpeg is still one tree.

**Reader learns:** `MAINTAINERS` and clone URLs are load-bearing. `git log -S 'Project Leader' -- MAINTAINERS` plus the next day's `Revert` is the whole politics. The understated message is the tell — when the reason is "as discussed," the discussion was the event.

**surprise:** 4

---

## 5. "Master will reject merge commits" — then he merges qatar 1,194 times

- **find-type:** 6 (revert war / a rule enforced by its opposite) — also 8
- **hashes:** `ffe9fd253f21db43ccc52a4043af94b7b9044f53` (the rule); first qatar `4defa68fe25eae4d7c27341e3b35811c047dcd3f`; last qatar `4899ccd29572f139b0da648212595d3affc9bf5d`
- **date:** 17 Jan 2011 / 2 Apr 2011 01:51 +0200 / 11 Apr 2014 14:41 +0200
- **author:** Janne Grunau (rule); Michael Niedermayer (every qatar merge)
- **messages:** `rewrite git-howto for the no merge policy` / `Merge remote branch 'qatar/master'` / `Merge remote-tracking branch 'qatar/master'`

```
git -C ~/book16/repos/ffmpeg log --grep=qatar --format='%H %aI %s' --reverse | head -3
4defa68fe25eae4d7c27341e3b35811c047dcd3f 2011-04-02T01:51:44+02:00 Merge remote branch 'qatar/master'
f35439699f5546774b840ae9fba7df82729ef0ff 2011-04-03T02:28:01+02:00 Merge remote branch 'qatar/master'
2cae9809e2d59c7336fc2cccb97b82c7f764868a 2011-04-04T02:15:12+02:00 Merge remote branch 'qatar/master'

git -C ~/book16/repos/ffmpeg log --grep=qatar --oneline | wc -l
1194

git -C ~/book16/repos/ffmpeg log --grep=qatar --format='%ad' --date=format:'%H' --author=Niedermayer | sort | uniq -c | sort -k2 | head -5
     66 00
     90 01
    103 02
     52 03
     56 04
```

Warm-up was 17 merges of `newdev/master` (9 Mar – 1 Apr 2011). Then the remote is renamed `qatar` and the clock becomes liturgical: 01:51, 02:28, 02:15, 02:24, 02:59… Hour 02 is the mode (103 merges). By year: 277 (2011), 397 (2012), 371 (2013), 149 (2014). Niedermayer authors 6,625 merges in this repo. The last qatar commit is a DNxHD yasm conversion with conflicts in two Makefiles. There is no farewell.

```
git -C ~/book16/repos/ffmpeg log -1 --format='%B' 4899ccd29572f139b0da648212595d3affc9bf5d
Merge remote-tracking branch 'qatar/master'
* qatar/master:
  DNxHD: convert inline asm to yasm
Conflicts:
	libavcodec/x86/Makefile
	libavcodec/x86/dnxhdenc.asm
See: 9d34dce05ba704180916433e13add3f01b54313b
Merged-by: Michael Niedermayer <michaelni@gmx.at>
```

**Why it is a story.** The forkers wrote, two days before the coup, that merge commits were forbidden. Niedermayer's answer for the next 1,104 days is to merge their tree into his, near-daily, often at two in the morning, under a remote name that is not even `libav`. He will not fork-and-ignore and he will not join them. He will absorb. The ending is not a treaty. It is a conflicted assembler port and then the remote simply never appears again. Libav's work keeps arriving until there is no more work.

**Reader learns:** a "no merge" policy in `git-howto` is a wish. `git log --grep=qatar` (or whatever the other side's remote was actually called) is the real integration policy. Count the merges, histogram the hours, read the last one — if it does not say goodbye, the goodbye was exhaustion.

**surprise:** 5

---

## 6. One word, 1,335 files, then the revert of the name

- **find-type:** 6 (revert war)
- **hashes:** `070c5d0f3530c16c92b81f3f0de2943410367c00` (docs/configure), `c0b1bc8d1797355c4f65ae4c488705b98cf9c8e9` (revert), `2912e87a6c9264d556734e2bf94a99c64cf9b102` (headers)
- **date:** 14–19 Mar 2011
- **authors:** Janne Grunau (author email still `janne-ffmpeg@`, committer `janne-libav@`); Michael Niedermayer; Mans Rullgard
- **messages:** `partially rename FFmpeg to Libav` / `Revert "partially rename FFmpeg to Libav"` / `Replace FFmpeg with Libav in licence headers`

```
git -C ~/book16/repos/ffmpeg show --shortstat --format=fuller 2912e87a6c9264d556734e2bf94a99c64cf9b102 | head -16
Author:     Mans Rullgard <mans@mansr.com>
AuthorDate: Fri Mar 18 17:35:10 2011 +0000
CommitDate: Sat Mar 19 13:33:20 2011 +0000
    Replace FFmpeg with Libav in licence headers
 1335 files changed, 5388 insertions(+), 5388 deletions(-)

git -C ~/book16/repos/ffmpeg log -1 --format='%aI %s' c0b1bc8d1797355c4f65ae4c488705b98cf9c8e9
2011-03-17T17:02:14+01:00 Revert "partially rename FFmpeg to Libav"

git -C ~/book16/repos/ffmpeg grep -l 'This file is part of Libav' HEAD | wc -l
0
git -C ~/book16/repos/ffmpeg grep -l 'This file is part of FFmpeg' HEAD | wc -l
5042
```

Janne's rename of `configure` / `README` / `LICENSE` is committed with a Libav address onto a patch authored from an FFmpeg address. Niedermayer reverts it the next afternoon, then that evening merges `newdev/master` — which contains Mans's 1,335-file, one-word licence-header rewrite. For years Diego Biurrun (Libav) will land follow-up "Replace more FFmpeg by Libav" commits via qatar, and Niedermayer will change individual headers back "with the authors permission." HEAD has zero `part of Libav` files.

**Why it is a story.** The fight is not a decoder. It is the string in the boilerplate. One side believes the project has been renamed; the other believes the rename is a patch that can be reverted. Both are committing to trees that still share history, so every merge re-imports the name and every revert re-exports it. The product name is a 5,388-line sed that will not stay sedded.

**Reader learns:** `git show --shortstat` on a "rename the project" commit tells you whether it was a decision or a find-and-replace. Then `git grep -l 'part of OldName' HEAD | wc -l` tells you who won. Identity wars leave a residue in licence headers long after the fork FAQ is forgotten.

**surprise:** 3

---

## 7. The heading survives the man, then the forker deletes the heading

- **find-type:** 4 (name that disappears / appears)
- **hashes:** `7f2a97537c4dfa95f0a2caac01638bf5365f34df` (born) → `f4f5cab9`/`111ccca6` (2011 war) → `f2c58931e629343f7d68258cc2b2d62c5f501ba5` (abdication) → `07d930014d839dc1c10f3a539e78cc7f8b9d7a4a` (ghost)
- **dates:** 8 Feb 2006 / 31 Jul 2015 / 20 Sep 2022
- **authors:** Diego Biurrun; Michael Niedermayer; Anton Khirnov
- **messages:** `List of people maintaining different parts of FFmpeg.` / `MAINTAINERS: Remove myself as leader` / `MAINTAINERS: remove the project leader section`

```
git -C ~/book16/repos/ffmpeg log -S 'Project Leader' --format='%h %ai %an %s' -- MAINTAINERS
07d930014d 2022-09-20 10:42:38 +0200 Anton Khirnov MAINTAINERS: remove the project leader section
111ccca602 2011-01-19 18:53:53 +0100 Michael Niedermayer Revert "Initial MAINTAINERS update"
f4f5cab94e 2011-01-18 11:05:51 -0800 Jason Garrett-Glaser Initial MAINTAINERS update
7f2a97537c 2006-02-08 11:32:03 +0000 Diego Biurrun List of people maintaining different parts of FFmpeg.

git -C ~/book16/repos/ffmpeg show f2c58931e629343f7d68258cc2b2d62c5f501ba5
    MAINTAINERS: Remove myself as leader
-Michael Niedermayer
   final design decisions

git -C ~/book16/repos/ffmpeg show 07d930014d839dc1c10f3a539e78cc7f8b9d7a4a
    MAINTAINERS: remove the project leader section
    The position does not exist anymore.
-Project Leader
-==============
-  final design decisions
```

Diego (who will be a Libav regular) creates the office in 2006. Dark Shikari deletes it in 2011; Niedermayer restores it. On 31 Jul 2015 Niedermayer removes **only his name**, leaving a heading and the orphan phrase "final design decisions." That empty office sits for seven years. On 20 Sep 2022 Anton Khirnov — Libav co-founder, still the #3 author in this tree (5,833 commits) — deletes the ghost. "The position does not exist anymore."

**Why it is a story.** The coup failed in 2011 and succeeded, slowly, in 2015–2022. Niedermayer does not lose a vote. He takes his name off the door and keeps committing (316 times in 2025). The heading with no name is more honest than the heading with a name, and more embarrassing. The man who once forked rather than live under that heading is the one who finally takes the sign down.

**Reader learns:** `git log -S 'Title' -- MAINTAINERS` is a biography of a role, not a file. Watch for the commit that deletes a *name* but leaves the *section* — that is the resignation. The later commit that deletes the empty section is who was willing to say the role is over.

**surprise:** 5

---

## 8. Bellard unmasks, then thins to a cherry-pick

- **find-type:** 4 (name that disappears)
- **hashes:** `17048ca88fc100c6a19cfd5248ea5b87469fb2c3` (unmask); last burst `cf7fc795ae95953f00cdd0dfbb5cb91bc7a64828` (2005-06-03); last patch `eb1c687b1b3ab7963ba6c527d275221ed55553ed` (2007-11-03); coda `da81cc38e8a90071484508fbdd8fb888dc9a4b7b` (2015-01-12)
- **author:** Fabrice Bellard (613 commits total)
- **messages:** `license/copyright change` / `support for adding new components…` / `Use the ffmpeg mdct function, patch by Fabrice Bellard.` / `avcodec/hevc: reduce memory for SAO`

```
git -C ~/book16/repos/ffmpeg show 17048ca88fc100c6a19cfd5248ea5b87469fb2c3 -- README | tail -12
-* See the file COPYING. ffmpeg and the associated library are licensed
-  under the GNU General Public License. I may change the license of
-  libavcodec and libav to LGPL if many people ask it (and if they
-  submit good patches!).
+* See the file COPYING. ffmpeg and the associated library EXCEPT
+  liba52 are licensed under the Lesser GNU General Public
+  License.
-Gerard Lantau (glantau@yahoo.fr).
+Fabrice Bellard.

git -C ~/book16/repos/ffmpeg log --author=Bellard --format='%ai %s' --since=2005-01-01
2015-01-12 23:09:23 +0100 avcodec/hevc: reduce memory for SAO
2007-11-03 14:34:25 +0000 Use the ffmpeg mdct function, patch by Fabrice Bellard. ...
2005-06-03 14:31:45 +0000 support for adding new components ...
```

25 May 2002, r585: Lantau becomes Bellard in the same commit that flips the tree toward LGPL. He is still the author of record through 2003 (MPEG-TS, seeking, `av_read_frame`). June 2005 is a subtitle/TS day. November 2007 is one NellyMoser MDCT fix, already phrased as "patch by." January 2015 is an HEVC SAO memory reduction **cherry-picked** by Niedermayer (`Signed-off-by: Michael Niedermayer`, "Commit message taken from patch by Christophe Gisquet"). Bellard does not come home. A patch with his name on it is applied ten years later.

**Why it is a story.** The founder does not storm out. He finishes the muxer, changes the licence, prints his real name, and walks into other projects. The last object that is *his day* is June 2005. Everything after is a patch routed through a mailing list he no longer owns. The 2015 hash looks like a return on `git log --author=Bellard` and is a curator's cherry-pick.

**Reader learns:** `--author=Founder` over the last twenty years will happily count a cherry-pick. Read `%an` against `%cn` and the `Signed-off-by`. Disappearance is a sequence of quieter subjects, then other people's verbs ("patch by," "cherry picked from").

**surprise:** 3

---

## 9. 24% of all history, 67% of 2004, 2am of 2014

- **find-type:** 4 (name that appears, then recedes)
- **hash:** first `d5a1a995186c848dac82c2eaf8316d91402d35c4` (2001-10-11); share via `shortlog`
- **author:** Michael Niedermayer — 30,170 commits (`git shortlog -sn HEAD | head -1`)
- **message (first):** `bugfixes: last 3 lines not brightness/contrast corrected` … `C++ -> C conversation`

```
git -C ~/book16/repos/ffmpeg shortlog -sn HEAD | head -8
 30170  Michael Niedermayer
  7856  Andreas Rheinhardt
  5833  Anton Khirnov
  5817  Paul B Mahol
  5090  James Almer
  4681  Diego Biurrun
  3756  Stefano Sabatini
  2753  Clément Bœsch

git -C ~/book16/repos/ffmpeg log --format='%ad %an' --date=format:%Y \
  | awk '{y=$1; a=substr($0,6); c[y]++; if (a ~ /Niedermayer/) n[y]++}
         END {for (y=2001;y<=2026;y++) if(c[y])
           printf "%d total=%d mn=%d pct=%.1f%%\n", y,c[y],n[y]+0,100*n[y]/c[y]}'
2001 total=347 mn=119 pct=34.3%
2004 total=1169 mn=783 pct=67.0%
2009 total=4812 mn=437 pct=9.1%
2013 total=11059 mn=4927 pct=44.6%
2014 total=9179 mn=4680 pct=51.0%
2020 total=4438 mn=520 pct=11.7%
2022 total=4181 mn=284 pct=6.8%
```

His first object is not even FFmpeg: `Originally committed as revision 2169 to svn://svn.mplayerhq.hu/mplayer/trunk/postproc`. He arrives via MPlayer's deblocker, converts it from C++ to C, and by 2004 is two-thirds of the commit stream. 2009 is the trough (9%) — other people have shown up. 2011–2015 the share explodes again because qatar merges are *his* commits. 2020 Andreas Rheinhardt takes the yearly crown (1,202 vs 490). 2022, the year Anton removes the leader heading, Niedermayer is 6.8%. He is still third in 2025.

Shortlog also splits a man: `Måns Rullgård` 1,706 + `Mans Rullgard` 1,088. The forker is two identities. Anton Khirnov, who left, is third all-time because qatar wrote his name back into this DAG and then he came back in person.

**Why it is a story.** A postprocessing filter from MPlayer becomes the career. The 2011–2014 spike is not a burst of inspiration; it is a man merging someone else's remote at 02:00 so the project he refused to abandon will not diverge. When the merges stop, the percentage falls off a cliff and the tree does not die. That is the proof the absorption worked.

**Reader learns:** yearly `shortlog` (or the awk above) is the only honest "who runs this." A 50% year during a fork is often merges, not features. Dual spellings of one maintainer (`Mans` / `Måns`) mean `shortlog -sn` without `.mailmap` will lie about the opposition too.

**surprise:** 3

---

## 10. `XXX: POST protocol is not completly implemented` — 2001, still compiled

- **find-type:** 5 (comment that outlived its code)
- **hashes:** present in `de6d9b6404` (2001-07-22, `libav/http.c:33`); HEAD `libavformat/http.c:52` (blame lands on spelling fixes, not a rewrite)
- **date:** 2001-07-22; wording refreshed 2007/2014; still there 2026
- **author of the sentence:** Fabrice Bellard (second Initial revision)

```
git -C ~/book16/repos/ffmpeg grep -n 'POST protocol is not' de6d9b6404bfd1c589799142da5a95428f146edd -- libav/http.c
de6d9b6404bfd1c589799142da5a95428f146edd:libav/http.c:33:/* XXX: POST protocol is not completly implemented because ffmpeg use

git -C ~/book16/repos/ffmpeg blame -L 52,53 HEAD -- libavformat/http.c
e42dba481f6 (Diego Biurrun  2007-04-07 14:09:20 +0000 52) /* XXX: POST protocol is not completely implemented because ffmpeg uses
ce2e858f5b3 (Diego Biurrun  2014-07-22 11:42:03 -0700 53)  * only a subset of it. */
```

The 2001 tree is full of these (`XXX: hack for DVD`, `XXX: find it`, `XXX: hardcoded`). Most died with the files. This one survived the `libav/` → `libavformat/` move, Diego's 2007 "completly"→"completely" / "use"→"uses", and a 2014 wrap. HTTP POST in 2026 is still introduced by Bellard's apology.

**Why it is a story.** The second genesis is an encoder that also speaks HTTP because ffserver needs to. The author knows POST is fake and writes it down. Twenty-five years of protocol work happen around the comment. Nobody deletes the XXX, because it is still true enough and because deleting it would claim a completeness the code does not want to swear to.

**Reader learns:** `git grep XXX` on the first real tree, then the same pattern on HEAD. Hits on both sides are not sloppiness; they are the unfinished surface the project agreed to ship. Blame will name the last typo-fixer, not the author — go to the root blob.

**surprise:** 3

---

## 11. 2026: a second Genesis, 20,239 lines of someone else's tests

- **find-type:** 2 (planted / imported-history boundary)
- **hash:** `66eaaa644a957da53da484b3af3c2d0a8ad2bb4a` (root); merged by `21ac0b276ed87e6adb6e3ede0e2c51221e1b4245`
- **date:** Thu 4 Jun 2026 11:44:26 +0200
- **author:** Niklas Haas
- **message:** `Squashed 'tests/checkasm/ext/' content from commit 0df02535c7`

```
git -C ~/book16/repos/ffmpeg log --max-parents=0 --pretty='format:%H %aI %an %s'
66eaaa644a957da53da484b3af3c2d0a8ad2bb4a 2026-06-04T11:44:26+02:00 Niklas Haas Squashed 'tests/checkasm/ext/' content from commit 0df02535c7
77bb6835ba752bb9335d208963a53227bbb1bc63 2000-12-20T00:02:47+00:00 (no author) New repository initialized by cvs2svn.

git -C ~/book16/repos/ffmpeg show --shortstat --format='%s' 66eaaa644a957da53da484b3af3c2d0a8ad2bb4a
Squashed 'tests/checkasm/ext/' content from commit 0df02535c7
 104 files changed, 20239 insertions(+)
```

`git-subtree-dir: tests/checkasm/ext`. A squash of an external checkasm tree becomes parent-zero and is merged with `--allow-unrelated-histories` (the subtree equivalent). From this day, `git log --max-parents=0` can never again say FFmpeg began once.

**Why it is a story.** Twenty-six years after cvs2svn minted a fake midnight, a perfectly modern workflow mints another origin — not a coup, not a fork, a test-helper vendor-in. The DAG now has two days-one. The new one is larger than Bellard's first tree (20,239 vs 13,216 lines).

**Reader learns:** subtree squashes are extra roots. If you care about "when did this project start," always `git log --max-parents=0`, and expect the answer to keep growing.

**surprise:** 2

---

## Ranked top-3

1. **#5 — qatar, 1,194 times, then a DNxHD conflict.** The no-merge policy is two days old; the remote is not even called libav; the hours peak at 02:00; the last message does not say goodbye. This is what "we will absorb the fork" looks like as git objects.
2. **#7 — Project Leader, 2006–2022.** Added by a man who would fork, deleted in a 7-line coup, restored with "mistakely," emptied by the incumbent, removed by the forker. One heading is the whole civil war.
3. **#3 — commit date 2001-01-01 on a 2012 ffv1 fix.** `git log --reverse | head` is a liar because of one parent-before-child constraint. Every reader who has typed that command has been burned and did not know.

## Disappointing

The Jan 2011 takeover is two understated reverts ("as discussed"); the mailing list has the votes and the insults, and git will not give you them. There is no commit that says qatar is over — the fork ends as an absence — and Bellard's 2015 "return" is a cherry-pick, not a door opening.
