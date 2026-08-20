# Receipts — ch. 11 ffmpeg (the fork war)

Verbatim outputs against a full clone of FFmpeg/FFmpeg.
Regenerate with `scripts/receipts-11.sh`. Long outputs truncated editorially (head).

## R1 — the restore, with its reason
```
$ git -C repos/ffmpeg log -1 --format='%aD%n%an%n%B' 111ccca602
Wed, 19 Jan 2011 18:53:53 +0100
Michael Niedermayer
Revert "Initial MAINTAINERS update"

This reverts commit f4f5cab94e0881cd30965b28f3d78d9c63d6918e.

Reason is that this has been mistakely commited as discussed.
```

## R2 — what had been committed: seven lines out of MAINTAINERS
```
$ git -C repos/ffmpeg show --format='%aD %an <%ae>%n%s' f4f5cab94e -- MAINTAINERS | head -19
Tue, 18 Jan 2011 11:05:51 -0800 Jason Garrett-Glaser <jason@x264.com>
Initial MAINTAINERS update Per http://lists.mplayerhq.hu/pipermail/ffmpeg-devel/2011-January/103440.html.

diff --git a/MAINTAINERS b/MAINTAINERS
index 884f7c32c1..f3ea177c78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5,13 +5,6 @@ Below is a list of the people maintaining different parts of the
 FFmpeg code.
 
 
-Project Leader
-==============
-
-Michael Niedermayer
-  final design decisions
-
-
 Applications
```

## R3 — the day before: the no-merge constitution
```
$ git -C repos/ffmpeg show -s --format='%aD %an %s' ffe9fd253f
Mon, 17 Jan 2011 10:02:53 +0000 Janne Grunau rewrite git-howto for the no merge policy
```

```
$ git -C repos/ffmpeg show --format= ffe9fd253f -- doc/git-howto.txt | grep -E '^\+.*[Mm]erge' | head -3
+  Caveat: Since merge commits are forbidden at least for the initial
+          --ff-only will fail and not create merge commits if your branch
+  FFmpeg's master tree. The master tree will reject pushes with merge commits.
```

## R4 — seventy-five days later, the first qatar merge; then a thousand more
```
$ git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%H %aI %an %s' --reverse | head -1
4defa68fe25eae4d7c27341e3b35811c047dcd3f 2011-04-02T01:51:44+02:00 Michael Niedermayer Merge remote branch 'qatar/master'
```

```
$ git -C repos/ffmpeg rev-list --count --min-parents=2 --grep=qatar HEAD
1151
```

```
$ git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%an' | sort | uniq -c
   1151 Michael Niedermayer
```

## R5 — the hour of the merges
```
$ git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%ad' --date=format:%H | sort | uniq -c | sort -rn | head -3
    103 02
     94 14
     90 01
```

## R6 — the last qatar merge: a conflict, a cross-reference, no goodbye
```
$ git -C repos/ffmpeg log -1 --format='%aI%n%B' 4899ccd295
2014-04-11T14:41:42+02:00
Merge remote-tracking branch 'qatar/master'

* qatar/master:
  DNxHD: convert inline asm to yasm

Conflicts:
	libavcodec/x86/Makefile
	libavcodec/x86/dnxhdenc.asm

```

## R7 — the name, changed in 1,335 files at once, and the rename reverted
```
$ git -C repos/ffmpeg show --shortstat --format='%aD %an %s' 2912e87a6c | tail -3
Fri, 18 Mar 2011 17:35:10 +0000 Mans Rullgard Replace FFmpeg with Libav in licence headers

 1335 files changed, 5388 insertions(+), 5388 deletions(-)
```

```
$ git -C repos/ffmpeg log -1 --format='%aI %an %s' c0b1bc8d17
2011-03-17T17:02:14+01:00 Michael Niedermayer Revert "partially rename FFmpeg to Libav"
```

## R8 — who won the string
```
$ git -C repos/ffmpeg grep -l 'This file is part of Libav' HEAD | wc -l
0
```

```
$ git -C repos/ffmpeg grep -l 'This file is part of FFmpeg' HEAD | wc -l
5042
```

## R9 — the biography of a heading, 2006–2022
```
$ git -C repos/ffmpeg log -S 'Project Leader' --format='%h %ai %an %s' -- MAINTAINERS
07d930014d 2022-09-20 10:42:38 +0200 Anton Khirnov MAINTAINERS: remove the project leader section
111ccca602 2011-01-19 18:53:53 +0100 Michael Niedermayer Revert "Initial MAINTAINERS update"
f4f5cab94e 2011-01-18 11:05:51 -0800 Jason Garrett-Glaser Initial MAINTAINERS update Per http://lists.mplayerhq.hu/pipermail/ffmpeg-devel/2011-January/103440.html.
7f2a97537c 2006-02-08 11:32:03 +0000 Diego Biurrun List of people maintaining different parts of FFmpeg. featuring some help from Alexander Strasser
```

## R10 — 2015: the name leaves; the office stays
```
$ git -C repos/ffmpeg show --format='%aD %an%n%s' f2c58931e6 | head -8
Fri, 31 Jul 2015 15:54:38 +0200 Michael Niedermayer
MAINTAINERS: Remove myself as leader

diff --git a/MAINTAINERS b/MAINTAINERS
index 6eff022077..ec773add5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14,7 +14,6 @@ patches and related discussions.
```

## R11 — 2022: the office is taken down
```
$ git -C repos/ffmpeg show --format='%aD %an%n%B' 07d930014d | head -11
Tue, 20 Sep 2022 10:42:38 +0200 Anton Khirnov
MAINTAINERS: remove the project leader section

The position does not exist anymore.


diff --git a/MAINTAINERS b/MAINTAINERS
index 4f94d662db..eebfa5cfb7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11,12 +11,6 @@ A (CC <address>) after the name means that the maintainer prefers to be CC-ed on
```

## R12 — the census
```
$ git -C repos/ffmpeg shortlog -sn HEAD | head -5
 30170	Michael Niedermayer
  7856	Andreas Rheinhardt
  5833	Anton Khirnov
  5817	Paul B Mahol
  5090	James Almer
```

```
$ git -C repos/ffmpeg rev-list --count --min-parents=2 --author='Michael Niedermayer' HEAD
6625
```

## R13 — 2017: a merge invents a path that exists in neither parent
```
$ git -C repos/ffmpeg show -s --format='%aI %an %s' fd5f4ac081
2017-10-01T18:21:02-03:00 James Almer Merge commit 'c95169f0ec68bdeeabc5fde8aa4076f406242524'
```

```
$ git -C repos/ffmpeg ls-tree 'fd5f4ac081^1' ffmpeg.c | head -1
100644 blob 1d248bc269d80526c02abac2cf2fcaaae74b717b	ffmpeg.c
```

```
$ git -C repos/ffmpeg ls-tree 'fd5f4ac081^2' avtools/avconv.c | head -1
100644 blob 5c36761c1d14e9085c2d3e73d0c3a678f38082b3	avtools/avconv.c
```

```
$ git -C repos/ffmpeg ls-tree fd5f4ac081 fftools/ffmpeg.c | head -1
100644 blob 1d248bc269d80526c02abac2cf2fcaaae74b717b	fftools/ffmpeg.c
```

```
$ git -C repos/ffmpeg log --reverse --follow --format='%h %aI %s' -- fftools/ffmpeg.c | head -1
41569bbc66 2017-10-06T21:49:09+02:00 ffmpeg: always use single threaded decoding for attached pictures
```

