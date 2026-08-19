# Scout: torvalds/linux

- **repo:** https://github.com/torvalds/linux
- **clone:** `~/book16/repos/linux` (present but empty of commits until `git fetch origin master`; not re-cloned). Working tree left empty; all commands use `origin/master`.
- **clone size:** 6.5G on disk; `git count-objects -vH` → 1 pack, 6.38 GiB, 11,700,443 objects
- **history span:** 2005-04-16 15:20:36 -0700 → 2026-08-18 12:08:13 -0700
- **commits:** 1,466,107 (`git rev-list --count origin/master`)
- **tip:** `1200d84f4c0a929a0780180d25063d93773be79c` Linus Torvalds, "Merge tag 'powerpc-7.3-1' …"

```
git -C ~/book16/repos/linux log --max-parents=0 --pretty='format:%h %ad %an %s' --date=short origin/master
a101ad945113 2016-02-23 ldewangan Share upstreaming patches
cd26f1bd6bf3 2014-08-11 Greg Kroah-Hartman greybus: Initial commit
be0e5c097fc2 2007-01-26 Chris Mason Btrfs: Initial checkin, basic working tree code
1da177e4c3f4 2005-04-16 Linus Torvalds Linux-2.6.12-rc2

git -C ~/book16/repos/linux log --reverse --format='%H %aI %an %s' origin/master | head -1
1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 2005-04-16T15:20:36-07:00 Linus Torvalds Linux-2.6.12-rc2

git -C ~/book16/repos/linux log -1 --format='%H %aI %an %s' origin/master
1200d84f4c0a929a0780180d25063d93773be79c 2026-08-18T12:08:13-07:00 Linus Torvalds Merge tag 'powerpc-7.3-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
```

The DAG does not begin once. It begins four times. The famous first commit is a 17,291-file snapshot of 2.6.12-rc2, not 1991, authored from `torvalds@ppc970.osdl.org` — the PowerPC box at OSDL on the Saturday git was born. Between that pole and a 2026 powerpc merge sit Dirty COW, a filesystem written out of the tree, a 66-parent octopus, and a two-line GitHub README that is still an ancestor of `master`.

---

## 1. Day one is a snapshot, and he says so

- **find-type:** 3 (first commit) — also 2 (imported-history boundary)
- **hash:** `1da177e4c3f41524e886b7f1b8a0c1fc7321cac2`
- **date:** Sat 16 Apr 2005 15:20:36 -0700 (author = committer)
- **author:** Linus Torvalds `<torvalds@ppc970.osdl.org>`
- **message:** `Linux-2.6.12-rc2`

```
git -C ~/book16/repos/linux log -1 --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aD%n%n%B' 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
git -C ~/book16/repos/linux diff-tree --root --shortstat 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
commit 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
Author: Linus Torvalds <torvalds@ppc970.osdl.org>
AuthorDate: Sat, 16 Apr 2005 15:20:36 -0700

    Linux-2.6.12-rc2

    Initial git repository build. I'm not bothering with the full history,
    even though we have it. We can create a separate "historical" git
    archive of that later if we want to, and in the meantime it's about
    3.2GB when imported into git - space that would just make the early
    git days unnecessarily complicated, when we don't have a lot of good
    infrastructure for it.

    Let it rip!
1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
 17291 files changed, 6718755 insertions(+)
```

**Why it is a story.** BitKeeper's license is gone. Git is nine days old and barely a tool. He has the pre-git history in hand — he says so — and he chooses not to import it because 3.2 GB would make `git log` on a Saturday afternoon a worse problem than a missing 1991–2005. The first object in the tree that now has 1.46 million commits is therefore a *cut*, not a birth. The short hash `1da177e4` is still unique. Three minutes later Christoph Lameter lands `[PATCH] mmtimer build fix` (`8d38eadb7a97`), and the kernel is a git project.

**Reader learns:** the first commit of a migrated repo is a policy decision about what history is worth carrying. `git log --reverse | head` will lie about day one unless you also read the message.

**surprise:** 3 (the hash is folklore; the 6.7-million-line stat and the "even though we have it" sentence are the part people skip)

---

## 2. The tree has four day-ones; one is a GitHub README

- **find-type:** 2 (planted / accidental artifact)
- **hashes:** roots `1da177e4c3f4`, `be0e5c097fc2` (btrfs, 2007), `cd26f1bd6bf3` (greybus, 2014), `a101ad945113` (README.md, 2016); merge `e5451c8f8330`
- **date:** Tue 23 Feb 2016 19:33:35 +0530 (root) / 19:37:08 +0530 (merge)
- **author:** ldewangan / Laxman Dewangan `<ldewangan@nvidia.com>`
- **message:** `Share upstreaming patches` → `Merge remote-tracking branch 'linusw-gpio/for-next' into devm_gpiochip`

```
git -C ~/book16/repos/linux log --max-parents=0 --pretty='format:%H %aI %an %s' origin/master
a101ad945113be3d7f283a181810d76897f0a0d6 2016-02-23T19:33:35+05:30 ldewangan Share upstreaming patches
cd26f1bd6bf3c73cc5afe848677b430ab342a909 2014-08-11T15:29:23+08:00 Greg Kroah-Hartman greybus: Initial commit
be0e5c097fc206b863ce9fe6b3cfd6974b0110f4 2007-01-26T15:51:26-05:00 Chris Mason Btrfs: Initial checkin, basic working tree code
1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 2005-04-16T15:20:36-07:00 Linus Torvalds Linux-2.6.12-rc2

git -C ~/book16/repos/linux show --stat a101ad945113be3d7f283a181810d76897f0a0d6
    Share upstreaming patches
    Share multiple bulk changes.
 README.md | 2 ++
 1 file changed, 2 insertions(+)

git -C ~/book16/repos/linux show a101ad945113be3d7f283a181810d76897f0a0d6:README.md
# linux-upstream
This is for sharing upstreaming activities.
```

Four minutes later `e5451c8f8330` merges that root into a GPIO topic branch (`Merge: a101ad9 3cf42ef`). `README.md` is gone from `origin/master` today; the *commit* is not. It is still a parent-zero ancestor of HEAD. Btrfs and Greybus are the same shape done on purpose: a new filesystem and a new bus started in empty repos and later octopus-merged into the kernel, so `git log --max-parents=0` will never print a single "initial commit" again.

**Why it is a story.** Someone at NVIDIA clicked GitHub's "new repository" affordance, got a two-line README, and then merged linusw-gpio with `--allow-unrelated-histories` (or the 2016 equivalent). Before the merge, the kernel has one creation myth. After it, every clone forever carries a second Genesis that says "This is for sharing upstreaming activities." Linus later called the class of merge "absolutely useless garbage." The object stayed.

**Reader learns:** `git log --max-parents=0` is the real first-commit command. Unrelated-history merges are not cleanup; they are extra origins you will explain at every archaeology session.

**surprise:** 5

---

## 3. Thirteen lines, eleven years, a race Linus already tried to kill

- **find-type:** 1 (tiny diff, huge blast) and 7 (feature that became the vulnerability)
- **hashes:** `4ceb5db9757a` (2005 "fix"), `f33ea7f404e5` (2005 undo), `19be0eaffa3a` (2016 Dirty COW)
- **date:** Thu 13 Oct 2016 13:07:36 -0700 author / Tue 18 Oct 2016 14:13:29 -0700 committer
- **author:** Linus Torvalds `<torvalds@linux-foundation.org>`
- **message:** `mm: remove gup_flags FOLL_WRITE games from __get_user_pages()`

```
git -C ~/book16/repos/linux show --stat --format=fuller 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619
AuthorDate: Thu Oct 13 13:07:36 2016 -0700
CommitDate: Tue Oct 18 14:13:29 2016 -0700
    mm: remove gup_flags FOLL_WRITE games from __get_user_pages()
    This is an ancient bug that was actually attempted to be fixed once
    (badly) by me eleven years ago in commit 4ceb5db9757a ("Fix
    get_user_pages() race for write access") but that was then undone due to
    problems on s390 by commit f33ea7f404e5 ("fix get_user_pages bug").
 include/linux/mm.h |  1 +
 mm/gup.c           | 14 ++++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)
```

The 2005 attempt (`4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6`, Linus, `torvalds@g5.osdl.org`) is itself tiny — `mm/memory.c | 21 ++++-----------------`. Two days later Nick Piggin / Hugh Dickins revert the pte_dirty check because s390 and `copy_one_pte` cannot live with it (`f33ea7f404e592e4563b12101b7a4d17da6558d7`). The race stays theoretical until the VM is fast enough that "theoretical" is a local root (CVE-2016-5195). The 2016 commit waits five days in the author/committer gap — the weekend the internet names it Dirty COW.

**Why it is a story.** In August 2005 he can see the COW hole and he ships a four-line retry. Architecture reality undoes it before the week is out. For eleven years the kernel ships the race because the *correct* fix needed s390 software dirty bits (v3.9) and a new `FOLL_COW` flag. The moment before 19be0eaf is a maintainer staring at a 13-line patch he already wrote, badly, when the machine on his desk was still an OSDL G5.

**Reader learns:** a reverted security fix is not closed. `git log -S` on the retry predicate, plus author-date vs commit-date, is how you find the decade someone paid for a two-day revert.

**surprise:** 4 (the CVE is famous; the 2005 pair and the five-day gap are the archaeology)

---

## 4. A temporary hack from the first tree is still compiled

- **find-type:** 5 (comment that outlived its code)
- **hashes:** present in `1da177e4c3f4` (line 285 of `arch/m68k/atari/config.c`); still at HEAD line 231 (blame lands on `6ff5801acbb6`, Roman Zippel, 2007-05-01 — a move, not a rewrite)
- **date:** in-tree since 2005-04-16; text older than git
- **author of surviving blob:** imported with Linus's first commit
- **message:** n/a (lineage, not a commit)

```
git -C ~/book16/repos/linux grep -n "temporary hack: If there is Falcon" 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 -- arch/m68k/atari/config.c
1da177e4c3f41524e886b7f1b8a0c1fc7321cac2:arch/m68k/atari/config.c:285:        /* This is a temporary hack: If there is Falcon video

git -C ~/book16/repos/linux grep -n "temporary hack: If there is Falcon" origin/master -- arch/m68k/atari/config.c
origin/master:arch/m68k/atari/config.c:231:/* This is a temporary hack: If there is Falcon video

git -C ~/book16/repos/linux blame -L 231,235 origin/master -- arch/m68k/atari/config.c
6ff5801acbb64 (Roman Zippel 2007-05-01 22:32:43 +0200 231) /* This is a temporary hack: If there is Falcon video
6ff5801acbb64 (Roman Zippel 2007-05-01 22:32:43 +0200 232)  * hardware, we assume that the ST-DMA serves SCSI instead of
6ff5801acbb64 (Roman Zippel 2007-05-01 22:32:43 +0200 233)  * ACSI. In the future, there should be a better method for
6ff5801acbb64 (Roman Zippel 2007-05-01 22:32:43 +0200 234)  * this...
6ff5801acbb64 (Roman Zippel 2007-05-01 22:32:43 +0200 235)  */
```

Atari Falcon shipping ended in 1993. The comment is already in the 2.6.12-rc2 snapshot. Twenty-one years of git later the future method has not arrived. A sibling from the same first tree — `addr = addr >> 2; /* temporary hack. */` in `arch/m68k/kernel/ptrace.c` — is also still there.

**Why it is a story.** Someone writing 68k probe code needed SCSI-vs-ACSI and left a note for the next person. The next person was a generation of maintainers who never owned a Falcon. `git blame` names Zippel 2007 because the file moved; `git grep` against `1da177e4` is the command that finds the actual age.

**Reader learns:** blame names the last *touch*, not the last *thought*. Pair it with `git grep <string> <first-commit>` before you trust a date.

**surprise:** 4

---

## 5. "I promise" — eighteen years and counting

- **find-type:** 5
- **hash:** `305282ba19f81e571bd6d2dcc10ebb02e59a06ef`
- **date:** Sat 2 Feb 2008 19:50:04 -0600
- **author:** Jay Cliburn `<jacliburn@bellsouth.net>`
- **message:** `atl1: move common functions to atlx files`

```
git -C ~/book16/repos/linux blame -L 13,13 origin/master -- drivers/net/ethernet/atheros/atlx/atlx.c
305282ba19f81 drivers/net/atlx/atlx.c (Jay Cliburn 2008-02-02 19:50:04 -0600 13) /* Including this file like a header is a temporary hack, I promise. -- CHS */

git -C ~/book16/repos/linux show -s --format='%B' 305282ba19f81e571bd6d2dcc10ebb02e59a06ef | head -8
atl1: move common functions to atlx files

The future atl2 driver and the existing atl1 driver can share certain
functions and definitions.  Move these shareable functions and definitions
out of atl1-specific files and into atlx.c and atlx.h.  Some transitory
hackery will be present until atl2 is merged.
```

atl2 did merge. The `#include` of a `.c` file did not get cleaned up. Chris Snook's initials are still in the tree in 2026, on a promise made on a Saturday night in 2008.

**Why it is a story.** The commit message already knows the hack is transitory. The cleanup that would make the promise true is nobody's bug. The moment before the outcome is a driver author writing "I promise" because he is slightly ashamed and expects to be back on Monday.

**Reader learns:** search your own tree for `I promise`, `temporary hack`, `XXX`. The hits that `git blame` dates in another decade are the ones that will still be there when you leave.

**surprise:** 4

---

## 6. Copyright 1991, blamed to 2005

- **find-type:** 5
- **hash of surviving lines:** `^1da177e4c3f4` on `init/main.c` lines 2–9, 11
- **date:** 2005-04-16 as far as git knows; the comment claims 1991/1992 and names patches from 1995–96
- **author:** Linus Torvalds (via the import)

```
git -C ~/book16/repos/linux blame -L 1,12 origin/master -- init/main.c
457c899653991 (Thomas Gleixner  2019-05-19 13:08:55 +0100  1) // SPDX-License-Identifier: GPL-2.0-only
^1da177e4c3f4 (Linus Torvalds   2005-04-16 15:20:36 -0700  2) /*
^1da177e4c3f4 (Linus Torvalds   2005-04-16 15:20:36 -0700  3)  *  linux/init/main.c
^1da177e4c3f4 (Linus Torvalds   2005-04-16 15:20:36 -0700  4)  *
^1da177e4c3f4 (Linus Torvalds   2005-04-16 15:20:36 -0700  5)  *  Copyright (C) 1991, 1992  Linus Torvalds
^1da177e4c3f4 (Linus Torvalds   2005-04-16 15:20:36 -0700  6)  *
^1da177e4c3f4 (Linus Torvalds   2005-04-16 15:20:36 -0700  7)  *  GK 2/5/95  -  Changed to support mounting root fs via NFS
^1da177e4c3f4 (Linus Torvalds   2005-04-16 15:20:36 -0700  8)  *  Added initrd & change_root: Werner Almesberger & Hans Lermen, Feb '96
^1da177e4c3f4 (Linus Torvalds   2005-04-16 15:20:36 -0700  9)  *  Moan early if gcc is old, avoiding bogus kernels - Paul Gortmaker, May '96
dd4d9fecbeba8 (Fabian Frederick 2014-08-08 14:23:44 -0700 10)  *  Simplified starting of init:  Michael A. Griffith <grif@acm.org>
^1da177e4c3f4 (Linus Torvalds   2005-04-16 15:20:36 -0700 11)  */
```

The caret is git telling you these lines have no parent older than the import. The SPDX line is 2019. One changelog line was re-wrapped in 2014. The rest — including "Moan early if gcc is old" — has not been worth touching in twenty-one years of git and thirty of Linux.

**Why it is a story.** The file that starts the kernel still opens with a 1996 warning about a compiler that no longer exists, under a copyright year from when Linus was a student. The pre-git authors (GK, Almesberger, Lermen, Gortmaker) survive only as comments. That is what "I'm not bothering with the full history" costs: names become folklore inside a blob.

**Reader learns:** `git blame` on a file that predates the VCS will pin a generation of work on the importer. The caret (`^`) is the tell.

**surprise:** 2

---

## 7. Do not break userspace: ship the timestamp twice

- **find-type:** 6 (a rule enforced by a hack, not a revert)
- **hash:** `79a86a6cc3669416a21fef32d0767d39ba84b3aa`
- **date:** Sat 7 Mar 2026 19:44:09 -0600
- **author:** David Lechner `<dlechner@baylibre.com>`
- **message:** `iio: orientation: hid-sensor-rotation: add timestamp hack to not break userspace`

```
git -C ~/book16/repos/linux show -s --format='%B' 79a86a6cc3669416a21fef32d0767d39ba84b3aa | head -16
iio: orientation: hid-sensor-rotation: add timestamp hack to not break userspace

Add a hack to push two timestamps in the hid-sensor-rotation scan data
to avoid breaking userspace applications that depend on the timestamp
being at the incorrect location in the scan data due to unintentional
misalignment in older kernels.
...
There have been long periods of time (6 years each) where the timestamp
was in either location, so to not break either case, we open-code the
timestamps to be pushed to both locations in the scan data.
```

A 2013 alignment cleanup (`883f61653069`) moved a timestamp. Userspace on both sides of that move now exists. The 2026 fix is not to pick the right offset. It is to write the value in *both* slots.

**Why it is a story.** The commandment is usually quoted from an LKML rant that is not in this git history. Here it is a Saturday patch that makes the ABI a superposition. The moment before: six years of "correct" layout and six years of "wrong" layout, both with real apps, and a maintainer who cannot revert 2013.

**Reader learns:** "we do not break userspace" is not a slogan you grep. It is a commit that adds a second copy of a field. Look for `hack to not break` after any alignment or ioctl cleanup.

**surprise:** 4

---

## 8. Linus reverts eventpoll after blaming DRM and netlink

- **find-type:** 6
- **hash:** `5f02b80c21e1511c32a37f642497751041069076`
- **date:** Fri 11 Jul 2025 17:10:32 -0700
- **author:** Linus Torvalds
- **message:** `Revert "eventpoll: Fix priority inversion problem"`
- **reverts:** `8c44dac8add7503c345c0f6c7962e4863b88ba42`

```
git -C ~/book16/repos/linux show -s --format='%B' 5f02b80c21e1511c32a37f642497751041069076 | head -18
Revert "eventpoll: Fix priority inversion problem"

This reverts commit 8c44dac8add7503c345c0f6c7962e4863b88ba42.

I haven't figured out what the actual bug in this commit is, but I did
spend a lot of time chasing it down and eventually succeeded in
bisecting it down to this.

For some reason, this eventpoll commit ends up causing delays and stuck
user space processes, but it only happens on one of my machines, and
only during early boot or during the flurry of initial activity when
logging in.
...
that was only after I had failed at bisecting it several
times, and had flailed around blaming both the drm people and the
netlink people
```

A priority-inversion *fix* hangs gnome-shell on one desktop during login. He does not understand the bug. He reverts anyway. The same year he also reverts a dentry-deletion speedup (`4a4be1ad3a6e`, 2024-05-29) because filebench dropped 7.4% — "this patch may get reverted if somebody finds a performance regression on some other load."

**Why it is a story.** The integration branch is also a laptop. The moment before the revert is a 30-second GNOME timeout and three failed bisections. The rule is not "prove the patch wrong." The rule is "my session died, the hash is `8c44dac8`, good night."

**Reader learns:** the BDFL revert is a product of one machine. `git log --author=Linus --grep=^Revert` is a changelog of which loads actually matter.

**surprise:** 3

---

## 9. ReiserFS: the last commit

- **find-type:** 8 (rollback of the world)
- **hashes:** `fb6f20ecb121` (the delete, Jan Kara) merged by `c01f664e4ca2` (Linus, 2024-11-21)
- **date:** Thu 17 Oct 2024 12:28:23 +0200 author / Mon 21 Oct 2024 16:29:38 +0200 committer
- **author:** Jan Kara `<jack@suse.cz>`
- **message:** `reiserfs: The last commit`

```
git -C ~/book16/repos/linux log --diff-filter=D --format='%H %as %an | %s' origin/master -- fs/reiserfs/super.c | head -1
fb6f20ecb121cef4d7946f834a6ee867c4e21b4a 2024-10-17 Jan Kara | reiserfs: The last commit

git -C ~/book16/repos/linux show --stat --format='%B' fb6f20ecb121cef4d7946f834a6ee867c4e21b4a | tail -5
    Deprecation period of reiserfs ends with the end of this year so it is
    time to remove it from the kernel.
 ...
 63 files changed, 12 insertions(+), 32804 deletions(-)
```

Names: Hans Reiser's filesystem, deprecation announced 2022, delete timed to the end of 2024, Linus's merge subject is just `Merge tag 'reiserfs_delete'`. The uapi headers stay marked `Dead since 6.13`. Thirty-two thousand lines become a hole.

**Why it is a story.** For a decade the code is unmaintained and still shipped because deleting a filesystem is a promise to every disk that still has one. The last commit is not a technical argument. It is a calendar. The moment before: a deprecation clock hitting zero, and a maintainer naming the patch the way you name a gravestone.

**Reader learns:** `--diff-filter=D` on a path, plus the word "last", is how large systems record a funeral. The merge commit will be polite; the subject of the leaf will not.

**surprise:** 3

---

## 10. Alan Cox: lxorguk → Intel → an off-by-one at 02:44

- **find-type:** 4 (name that disappears)
- **hashes:** early `c621b140603d` (2005-12-08, `alan@lxorguk.ukuu.org.uk`); last pre-silence `5561b6a1b3ab` (2013-12-12 02:44:24 +0000, `alan@linux.intel.com`)
- **date:** last original commit Thu 12 Dec 2013 02:44 UTC (committed 17 Dec)
- **author:** Alan Cox
- **message:** `i40e: Fix off by one in i40e_dbg_command_write`

```
git -C ~/book16/repos/linux log --author='Alan Cox' --since=2005-04-16 --until=2006-01-01 --max-count=3 --format='%h %as %ae | %s' origin/master
c621b140603d 2005-12-08 alan@lxorguk.ukuu.org.uk | [PATCH] libata: ata_piix 450NX errata
d96212ed87d0 2005-12-08 alan@lxorguk.ukuu.org.uk | [PATCH] libata: add ata_piix notes
e99f8b5efe78 2005-11-08 alan@lxorguk.ukuu.org.uk | [PATCH] libata: propogate host private data from probe function

git -C ~/book16/repos/linux show -s --format='Author: %an <%ae>%nAuthorDate: %aD%n%s' 5561b6a1b3abaa27f6e52e4f7559c8733ca45e69
Author: Alan Cox <alan@linux.intel.com>
AuthorDate: Thu, 12 Dec 2013 02:44:24 +0000
i40e: Fix off by one in i40e_dbg_command_write
```

2005 shortlog top 15 is Linus, Jeff Garzik, Russell King, Ralf Baechle, Al Viro, David S. Miller, Paul Mackerras, Adrian Bunk, Andi Kleen… 2025–26 top 15 is Linus, Jakub Kicinski, Krzysztof Kozlowski, Arnd Bergmann, Christian Brauner. Christoph Hellwig is the rare name in both windows. Alan's last commit is a 512-vs-511 terminator on an Intel 40 GbE debugfs write, authored at 2:44am. After 2014 the string "Alan Cox" mostly belongs to a 2017 atomisp dump, not to the man.

**Why it is a story.** A lieutenant does not announce a departure in git. The addresses change (home → Red Hat → Intel), the subjects shrink from ATA philosophy to an off-by-one, and then the name stops meaning what it meant. The moment before: a 2:44am one-liner, no farewell.

**Reader learns:** `git shortlog -sn --until` / `--since` plus `--author` over a leaving email domain is how you watch a maintainer vanish. The last commit is almost never the speech.

**surprise:** 3

---

## 11. Itanium: 65k lines for hardware nobody will boot

- **find-type:** 8
- **hash:** `cf8e8658100d4eae80ce9b21f7a81cb024dd5057`
- **date:** Thu 20 Oct 2022 15:54:33 +0200 (landed for 6.7)
- **author:** Ard Biesheuvel `<ardb@kernel.org>`
- **message:** `arch: Remove Itanium (IA-64) architecture`

```
git -C ~/book16/repos/linux show --shortstat --format='%aD%n%s%n' cf8e8658100d4eae80ce9b21f7a81cb024dd5057 | head -8
Thu, 20 Oct 2022 15:54:33 +0200
arch: Remove Itanium (IA-64) architecture

The Itanium architecture is obsolete, and an informal survey [0] reveals
that any residual use of Itanium hardware in production is mostly HP-UX
or OpenVMS based.
 357 files changed, 45 insertions(+), 64955 deletions(-)
```

EFI was invented for this CPU. The last companies stopped. Debian still had a port. The argument for keeping it is a Grid Community Toolkit interoperability story on machines almost no contributor can touch. He rips the band-aid. A 2025 follow-up still finds dead IA-64 ifdeffery in lib/xz (`57f3d8969114`).

**Why it is a story.** Deleting an architecture is not a compile fix. It is deciding that "someone, somewhere" is no longer a reason. The moment before: an orphan MAINTAINERS entry and a survey that came back empty.

**Reader learns:** `git show --shortstat` on `Remove <arch>` is a world-rollback. Grep a year later for the name; the leftovers are the real last commit.

**surprise:** 2

---

## Ranked top-3

1. **Four day-ones, one of them a two-line GitHub README** (dig 2) — `git log --max-parents=0` is the sentence the repo cannot unsay.
2. **Thirteen lines for an eleven-year COW race Linus already patched** (dig 3) — the tiny diff, the 2005 undo, the five-day Dirty COW gap.
3. **"Let it rip" / 17,291 files / we have the history and we are not importing it** (dig 1) — every later archaeology starts from a deliberate cut.

**Disappointing:** the famous "WE DO NOT BREAK USERSPACE" rant is an email, not a commit; `git log --grep` for it is 2026 driver noise. The 66-parent ASoC octopus (`2cde51fbd0f3`, 2014-01-02) is a party trick without a human beat. Alan Cox's last patch is an i40e off-by-one, not a farewell.
