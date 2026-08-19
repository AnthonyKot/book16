# Receipts — ch. 06 the genesis lie (cross-repo)

Verbatim outputs against full clones of php-src, cpython, linux, bitcoin, redis, openttd, git.
Regenerate with `scripts/receipts-06.sh`. Long outputs truncated editorially (head).

## R1 — php: the root commit is git's empty tree, authored by a robot
```
$ git -C repos/php log --reverse --format=%H\ %aI\ %an\ \<%ae\>\ %s
f70a4db647886f65a3e24249351d2c8abc0cdfb3 1999-04-07T18:10:10+00:00 SVN Migration <svn@php.net> Standard project directories initialized by cvs2svn.
573b46022c46ab41a879c23f4ea432dd4d0c102e 1999-04-07T18:10:10+00:00 Andi Gutmans <andi@php.net> Zend Library
a6043d3e1efa4cb7564118765dadd53cedd9d194 1999-04-07T18:18:16+00:00 Rasmus Lerdorf <rasmus@php.net> *** empty log message ***
d9c487159219f90e63b31698d79f280e98ad8210 1999-04-07T20:30:03+00:00 Zeev Suraski <zeev@php.net> Cleanups:  ZendCore->libzend
```

```
$ git -C repos/php cat-file -p f70a4db647886f65a3e24249351d2c8abc0cdfb3
tree 4b825dc642cb6eb9a060e54bf8d69288fbee4904
author SVN Migration <svn@php.net> 923508610 +0000
committer SVN Migration <svn@php.net> 923508610 +0000

Standard project directories initialized by cvs2svn.
```

```
$ git -C repos/php hash-object -t tree /dev/null   # the empty tree's name
4b825dc642cb6eb9a060e54bf8d69288fbee4904
```

## R2 — php: the inventor's first recorded mark is a blank line
```
$ git -C repos/php show a6043d3e1efa4cb7564118765dadd53cedd9d194
commit a6043d3e1efa4cb7564118765dadd53cedd9d194
Author: Rasmus Lerdorf <rasmus@php.net>
Date:   Wed Apr 7 18:18:16 1999 +0000

    *** empty log message ***

diff --git a/Zend/zend.c b/Zend/zend.c
index 7fa2845df7a..e84a1af549e 100644
--- a/Zend/zend.c
+++ b/Zend/zend.c
@@ -14,6 +14,7 @@
    +----------------------------------------------------------------------+
 */
 
+
 #include "zend.h"
 #include "zend_operators.h"
 #include "zend_variables.h"
```

## R3 — cpython: the first two commits have different dates and the same tree
```
$ git -C repos/cpython log --reverse --format=%H\ %aI\ %s af49df919dafc3767ae956767dce0482f9cd6d4e
7f777ed95a19224294949e1b4ce56bbffcb1fe9f 1990-08-09T14:25:15+00:00 Initial revision
3310257195daa702bc91fb90e78ac96a30076336 1990-09-10T11:15:23+00:00 Warning about incompleteness.
b829a0935bbd3dea4898bf68b6be69b59bffcbec 1990-09-18T10:47:40+00:00 Renamed intro and modules to tut and mod; added tbl to pipeline.
```

```
$ git -C repos/cpython rev-parse 7f777ed95a^{tree} 3310257195^{tree}
52384aa82c1f7785424544fc3ee003729b07ac12
52384aa82c1f7785424544fc3ee003729b07ac12
```

## R4 — cpython: the file inside the August commit already knows it is September; 178 commits say 'Initial revision'
```
$ git -C repos/cpython show 7f777ed95a:Doc/README | tail -2

--Guido (last modified 10 Sep 90)
```

```
$ git -C repos/cpython log --format='%s' af49df91 | grep -cx 'Initial revision'
178
```

## R5 — cpython: the conversion robot's fingerprint in the raw commit object
```
$ git -C repos/cpython cat-file -p 7f777ed95a | head -6
tree 52384aa82c1f7785424544fc3ee003729b07ac12
author Guido van Rossum <guido@python.org> 650211915 +0000
committer Guido van Rossum <guido@python.org> 650211915 +0000
HG:extra convert_revision:svn%3A6015fed2-1504-0410-9fe1-9d1591cc4771/python/branches/legacy-trunk%402161

Initial revision
```

## R6 — linux: the famous first commit says out loud that it is a cut
```
$ git -C repos/linux log -1 --format=%H%n%ai\ %an%n%B 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
2005-04-16 15:20:36 -0700 Linus Torvalds
Linux-2.6.12-rc2

Initial git repository build. I'm not bothering with the full history,
even though we have it. We can create a separate "historical" git
archive of that later if we want to, and in the meantime it's about
3.2GB when imported into git - space that would just make the early
git days unnecessarily complicated, when we don't have a lot of good
infrastructure for it.

Let it rip!
```

```
$ git -C repos/linux diff-tree --root --shortstat 1da177e4c3f4 | tail -1
 17291 files changed, 6718755 insertions(+)
```

## R7 — linux: the tree has FOUR geneses; one is a two-line GitHub README
```
$ git -C repos/linux log --max-parents=0 --pretty=format:%H\ %aI\ %an\ \<%ae\>\ %s origin/master
a101ad945113be3d7f283a181810d76897f0a0d6 2016-02-23T19:33:35+05:30 ldewangan <ldewangan@nvidia.com> Share upstreaming patches
cd26f1bd6bf3c73cc5afe848677b430ab342a909 2014-08-11T15:29:23+08:00 Greg Kroah-Hartman <greg@kroah.com> greybus: Initial commit
be0e5c097fc206b863ce9fe6b3cfd6974b0110f4 2007-01-26T15:51:26-05:00 Chris Mason <chris.mason@oracle.com> Btrfs: Initial checkin, basic working tree code
1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 2005-04-16T15:20:36-07:00 Linus Torvalds <torvalds@ppc970.osdl.org> Linux-2.6.12-rc2```

```
$ git -C repos/linux show a101ad945113:README.md
# linux-upstream
This is for sharing upstreaming activities.
```

## R8 — linux: the README genesis is an ancestor of master today; the file itself is gone
```
$ git -C repos/linux merge-base --is-ancestor a101ad945113 origin/master && echo ANCESTOR: yes
ANCESTOR: yes
```

```
$ git -C repos/linux cat-file -e origin/master:README.md || echo 'README.md at tip: gone'
README.md at tip: gone
```

## R9 — bitcoin: day one exists twice — same tree, two hashes, and it is not Satoshi
```
$ git -C repos/bitcoin show -s --format='%H %aI %an <%ae> %s%n%b' 4405b78d e071a3f6
4405b78d6059e536c36974088a8ed4d9f0f29898 2009-08-30T03:46:39+00:00 sirius-m <sirius-m@1a98c847-1fd6-4fd8-948a-caf3550aa51b>
  First commit
  
e071a3f6c06f41068ad17134189a4ac3073ef76b 2009-08-30T03:46:39+00:00 sirius-m <sirius-m@1a98c847-1fd6-4fd8-948a-caf3550aa51b>
  First commit
  git-svn-id: https://bitcoin.svn.sourceforge.net/svnroot/bitcoin/trunk@1 1a98c847-1fd6-4fd8-948a-caf3550aa51b

```

```
$ git -C repos/bitcoin rev-parse 4405b78d^{tree} e071a3f6^{tree}
1e8dec58f70505a3dd554918ce9b07384d047415
1e8dec58f70505a3dd554918ce9b07384d047415
```

## R10 — bitcoin: the tree day one imports is already eight months into someone else's project
```
$ git -C repos/bitcoin show 4405b78d:readme.txt | head -3
BitCoin v0.1.5 ALPHA

Copyright (c) 2009 Satoshi Nakamoto
```

```
$ git -C repos/bitcoin show -s --format='%h %aI %an %s' e00d4805d71de8bb32c9af600f5bd8fce2414d5d
e00d4805d7 2009-09-16T13:26:04+00:00 sirius-m No dll's here
```

## R11 — redis: day one at 10:30:00 sharp, version 0.07, copyright three years older than the repo
```
$ git -C repos/redis log --reverse --format=%H\ %aI\ %an\ %s
ed9b544e10b84cd43348ddfab7068b610a5df1f7 2009-03-22T10:30:00+01:00 antirez first commit
```

```
$ git -C repos/redis show ed9b544e10:COPYING | head -1
Copyright (c) 2006-2009, Salvatore Sanfilippo
```

```
$ git -C repos/redis show ed9b544e10:redis.c | grep REDIS_VERSION
#define REDIS_VERSION "0.07"
```

## R12 — redis: sixteen years later the author adds a SECOND genesis
```
$ git -C repos/redis log --max-parents=0 --all --format=%h\ %aI\ %an\ %s
33d653e24 2025-01-27T17:24:02+01:00 antirez First internal release.
220a0f088 2021-10-10T18:26:48+03:00 Yoav Steinberg Squashed 'deps/jemalloc/' content from commit 886e40bb3
7ee5a41aa 2020-08-06T12:41:58-07:00 michael-grunder Squashed 'deps/hiredis/' content from commit 39de5267c
ed9b544e1 2009-03-22T10:30:00+01:00 antirez first commit
```

## R13 — openttd: day one is r1 of a crashed SVN, and r1 is revision 975
```
$ git -C repos/openttd log --reverse --format=%H\ %aI\ %an\ \<%ae\>\ %s
efaeb275f78e18d594d9ee8ff04eccd2dc59512c 2004-08-09T17:04:08+00:00 truelight <truelight@openttd.org> (svn r1) Import of revision 975 of old (crashed) SVN
804f038594ccd7d12b776299038f9bc5809f90e5 2004-08-10T14:14:00+00:00 darkvater <darkvater@openttd.org> (svn r2) -Fix [993829] UDP Fixes (lucaspiller) -Fix change 255/0xFF to OWNER_SPECTATOR for spectator stuff (TrueLight)
```

```
$ git -C repos/openttd diff-tree --root --shortstat efaeb275f7 | tail -1
 189 files changed, 129220 insertions(+)
```

```
$ git -C repos/openttd show efaeb275f7:readme.txt | head -3
OpenTTD README
Last updated:    $LastChangedDate: 2004-07-25 21:22:11 +0200 (Sun, 25 Jul 2004) $
Release version: 0.3.3
```

## R14 — git: the control case — a first commit that is actually a first commit
```
$ git -C repos/git log --reverse --format=%H\ %aI\ %an\ %s
e83c5163316f89bfbde7d9ab23ca2e25604af290 2005-04-07T15:13:13-07:00 Linus Torvalds Initial revision of "git", the information manager from hell
```

