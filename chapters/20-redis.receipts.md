# Receipts — candidate ch. 20 redis ("Remove myself too" and the second genesis)

Verbatim outputs against the checked-out full clone in `repos/redis` (HEAD: `unstable`).
Regenerate with `scripts/receipts-20.sh`. Long outputs are bounded by the visible `head`/`sed` commands or the receipt helper.

## R1 — 2020-06-22: the subject says "Remove myself too"
```
$ git -C repos/redis show -s --format='%H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommit: %cn <%ce>%nCommitDate: %cI%nSubject: %s%nParents: %P' 59fd178014c7cca1b0c668b30ab0d991dd3030f3
59fd178014c7cca1b0c668b30ab0d991dd3030f3
Author: antirez <antirez@gmail.com>
AuthorDate: 2020-06-22T11:21:21+02:00
Commit: antirez <antirez@gmail.com>
CommitDate: 2020-06-22T11:21:21+02:00
Subject: Clarify maxclients and cluster in conf. Remove myself too.
Parents: 42fd522c630d56c577f2b62e238ce0b5dce42c3a
```

```
$ git -C repos/redis show --shortstat --format='' 59fd178014c7cca1b0c668b30ab0d991dd3030f3
 2 files changed, 9 insertions(+), 1 deletion(-)
```

## R2 — the actual patch: maxclients guidance, then subtract the cluster node named "myself"
```
$ git -C repos/redis show --format= --no-ext-diff 59fd178014c7cca1b0c668b30ab0d991dd3030f3 -- redis.conf src/cluster.c | sed -n '1,70p'
diff --git a/redis.conf b/redis.conf
index 5cea06a47..a51ef007d 100644
--- a/redis.conf
+++ b/redis.conf
@@ -805,6 +805,11 @@ acllog-max-len 128
 # Once the limit is reached Redis will close all the new connections sending
 # an error 'max number of clients reached'.
 #
+# IMPORTANT: When Redis Cluster is used, the max number of connections is also
+# shared with the cluster bus: every node in the cluster will use two
+# connections, one incoming and another outgoing. It is important to size the
+# limit accordingly in case of very large clusters.
+#
 # maxclients 10000
 
 ############################## MEMORY MANAGEMENT ################################
diff --git a/src/cluster.c b/src/cluster.c
index cacf09bf3..87ed09e7e 100644
--- a/src/cluster.c
+++ b/src/cluster.c
@@ -694,8 +694,11 @@ void clusterAcceptHandler(aeEventLoop *el, int fd, void *privdata, int mask) {
 /* Return the approximated number of sockets we are using in order to
  * take the cluster bus connections. */
 unsigned long getClusterConnectionsCount(void) {
+    /* We decrement the number of nodes by one, since there is the
+     * "myself" node too in the list. Each node uses two file descriptors,
+     * one incoming and one outgoing, thus the multiplication by 2. */
     return server.cluster_enabled ?
-           (dictSize(server.cluster->nodes)*2) : 0;
+           ((dictSize(server.cluster->nodes)-1)*2) : 0;
 }
 
 /* -----------------------------------------------------------------------------
```

## R3 — three days later: his last pre-gap commit on HEAD is another cluster comment
```
$ git -C repos/redis show -s --format='%H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommitDate: %cI%nSubject: %s%nParents: %P' ad0a9df77a2ccf3fdf309dcdd1b54cf350fcbe3c
ad0a9df77a2ccf3fdf309dcdd1b54cf350fcbe3c
Author: antirez <antirez@gmail.com>
AuthorDate: 2020-06-25T12:58:21+02:00
CommitDate: 2020-06-25T12:58:21+02:00
Subject: Update comment to clarify change in #7398.
Parents: 760021e6771b83651575102745d36456deb9371d
```

```
$ git -C repos/redis merge-base --is-ancestor ad0a9df77a2ccf3fdf309dcdd1b54cf350fcbe3c HEAD; printf "last-commit-is-on-HEAD exit=%s\n" "$?"; git -C repos/redis merge-base --is-ancestor 14a59d4ce7e266f9220e26dd2824a6f1d5c10186 HEAD; printf "parallel-twin-is-on-HEAD exit=%s\n" "$?"
last-commit-is-on-HEAD exit=0
parallel-twin-is-on-HEAD exit=1
```

```
$ git -C repos/redis show --format= --no-ext-diff ad0a9df77a2ccf3fdf309dcdd1b54cf350fcbe3c -- src/cluster.c | sed -n '1,40p'
diff --git a/src/cluster.c b/src/cluster.c
index e15e59fda..e7a32a9a2 100644
--- a/src/cluster.c
+++ b/src/cluster.c
@@ -1264,7 +1264,10 @@ void markNodeAsFailingIfNeeded(clusterNode *node) {
     node->fail_time = mstime();
 
     /* Broadcast the failing node name to everybody, forcing all the other
-     * reachable nodes to flag the node as FAIL. */
+     * reachable nodes to flag the node as FAIL.
+     * We do that even if this node is a replica and not a master: anyway
+     * the failing state is triggered collecting failure reports from masters,
+     * so here the replica is only helping propagating this status. */
     clusterSendFail(node->name);
     clusterDoBeforeSleep(CLUSTER_TODO_UPDATE_STATE|CLUSTER_TODO_SAVE_CONFIG);
 }
```

## R4 — the silence: a parallel-history twin at the boundary, then 1,677 days to the new root
```
$ git -C repos/redis log --all --author='antirez@gmail.com' --format='%aI %H %an %s' | LC_ALL=C sort | awk '$1 >= "2020-06-25T12:58:21+02:00" && $1 <= "2025-01-27T17:24:02+01:00"'
2020-06-25T12:58:21+02:00 14a59d4ce7e266f9220e26dd2824a6f1d5c10186 antirez Update comment to clarify change in #7398.
2020-06-25T12:58:21+02:00 ad0a9df77a2ccf3fdf309dcdd1b54cf350fcbe3c antirez Update comment to clarify change in #7398.
2025-01-27T17:24:02+01:00 33d653e24f03adadf469dc1627e15e76580f68b5 antirez First internal release.
```

```
$ git -C repos/redis rev-list --all --count --author='antirez@gmail.com' --since='2021-01-01T00:00:00Z' --until='2025-01-01T00:00:00Z'
0
```

```
$ start=$(git -C repos/redis show -s --format=%aI ad0a9df77a2ccf3fdf309dcdd1b54cf350fcbe3c); end=$(git -C repos/redis show -s --format=%aI 33d653e24f03adadf469dc1627e15e76580f68b5); seconds=$(( $(date -d "$end" +%s) - $(date -d "$start" +%s) )); printf "from %s\nto   %s\ngap  %d days %02d:%02d:%02d\n" "$start" "$end" "$((seconds/86400))" "$(((seconds%86400)/3600))" "$(((seconds%3600)/60))" "$((seconds%60))"
from 2020-06-25T12:58:21+02:00
to   2025-01-27T17:24:02+01:00
gap  1677 days 05:25:41
```

## R5 — the one-person era at full scale: two bylines, one email, 7,188 of 13,257 commits
```
$ git -C repos/redis rev-list --count HEAD; git -C repos/redis rev-list --count --author='antirez@gmail.com' HEAD
13257
7188
```

```
$ git -C repos/redis shortlog -sne HEAD | head -8
  6128	antirez <antirez@gmail.com>
  1060	Salvatore Sanfilippo <antirez@gmail.com>
   546	Oran Agra <oran@redislabs.com>
   510	Pieter Noordhuis <pcnoordhuis@gmail.com>
   358	Binbin <binloveplay1314@qq.com>
   214	Yossi Gottlieb <yossigo@gmail.com>
   184	zhaozhao.zz <zhaozhao.zz@alibaba-inc.com>
   151	Matt Stancliff <matt@genges.com>
```

```
$ git -C repos/redis log HEAD --author='antirez@gmail.com' --format='%aI' | cut -c1-4 | LC_ALL=C sort | uniq -c
    406 2009
    610 2010
    669 2011
    522 2012
    730 2013
    865 2014
    542 2015
    462 2016
    302 2017
    796 2018
    678 2019
    455 2020
    146 2025
      5 2026
```

## R6 — the handover and return in yearly shortlogs
```
$ for y in 2020 2021 2025; do next=$((y+1)); printf 'YEAR %s\n' "$y"; git -C repos/redis shortlog -sn HEAD --since="$y-01-01T00:00:00Z" --until="$next-01-01T00:00:00Z" | head -3; done
YEAR 2020
   244	antirez
   211	Salvatore Sanfilippo
   164	Oran Agra
YEAR 2021
   129	Oran Agra
    72	Yossi Gottlieb
    67	Binbin
YEAR 2025
   129	antirez
    65	debing.sun
    31	Yuan Wang
```

## R7 — second genesis: one of four roots on HEAD, with no parent
```
$ git -C repos/redis log --max-parents=0 HEAD --format='%H %aI %an %s'
33d653e24f03adadf469dc1627e15e76580f68b5 2025-01-27T17:24:02+01:00 antirez First internal release.
220a0f0880419450c9409202aac1fab4b8be0719 2021-10-10T18:26:48+03:00 Yoav Steinberg Squashed 'deps/jemalloc/' content from commit 886e40bb3
7ee5a41aac7e5abc90d050fa509fa953ca7f1da1 2020-08-06T12:41:58-07:00 michael-grunder Squashed 'deps/hiredis/' content from commit 39de5267c
ed9b544e10b84cd43348ddfab7068b610a5df1f7 2009-03-22T10:30:00+01:00 antirez first commit
```

```
$ git -C repos/redis rev-list --parents -n 1 33d653e24f03adadf469dc1627e15e76580f68b5
33d653e24f03adadf469dc1627e15e76580f68b5
```

```
$ git -C repos/redis cat-file -p 33d653e24f03adadf469dc1627e15e76580f68b5 | sed -n '1,/^$/p'
tree de9092af82a562ace54f5d7e205f8efe1cc6c382
author antirez <antirez@gmail.com> 1737995042 +0100
committer antirez <antirez@gmail.com> 1737995098 +0100

```

```
$ git -C repos/redis show --root --shortstat --format='' 33d653e24f03adadf469dc1627e15e76580f68b5
 21 files changed, 7058 insertions(+)
```

## R8 — the complete license at that root
```
$ git -C repos/redis show 33d653e24f03adadf469dc1627e15e76580f68b5:LICENSE
This code is Copyright (C) 2024-2025 Salvatore Sanfilippo.
All Rights Reserved.
```

## R9 — five weeks later, the copyright line changes from Salvatore to Redis Ltd
```
$ git -C repos/redis show -s --format='%H%nAuthor: %an <%ae>%nAuthorDate: %aI%nSubject: %s%nParents: %P' afcc2ff6e8832dc0621fe4b90e4dae6152b0d0a8
afcc2ff6e8832dc0621fe4b90e4dae6152b0d0a8
Author: antirez <antirez@gmail.com>
AuthorDate: 2025-03-03T09:51:26+01:00
Subject: LICENSE: change copyright to Redis Ltd.
Parents: 4b0bd5b0bd183b537037aa4b9f926f5e8ba3cc76
```

```
$ git -C repos/redis show --no-ext-diff --format= afcc2ff6e8832dc0621fe4b90e4dae6152b0d0a8 -- LICENSE | sed -n '1,20p'
diff --git a/LICENSE b/LICENSE
index df7a7a7cd..79fb7e399 100644
--- a/LICENSE
+++ b/LICENSE
@@ -1,2 +1,2 @@
-This code is Copyright (C) 2024-2025 Salvatore Sanfilippo.
+This code is Copyright (c) 2024-Present, Redis Ltd.
 All Rights Reserved.
```

## R10 — April 2: the orphan history is subtree-joined, then merged into unstable
```
$ git -C repos/redis show -s --format='%H %aI %an %s%nParents: %P%n%n%b' 78e0d87177f21b3d6823bbf78ac7a45b34a9bb25 41b1b5df183aa4bd2043413394debdfa6d40d762 5e7333d2dd2950afa0bb3df06ab926afcc42db7d
78e0d87177f21b3d6823bbf78ac7a45b34a9bb25 2025-04-02T16:34:28+03:00 YaacovHazan Add 'modules/vector-sets/' from commit 'c6db0a7c20ff5638f3a0c9ce9c106303daeb2f67'
Parents: 8ea8f4220c393d496aa948b5ebe288f384392899 c6db0a7c20ff5638f3a0c9ce9c106303daeb2f67

git-subtree-dir: modules/vector-sets
git-subtree-mainline: 8ea8f4220c393d496aa948b5ebe288f384392899
git-subtree-split: c6db0a7c20ff5638f3a0c9ce9c106303daeb2f67

41b1b5df183aa4bd2043413394debdfa6d40d762 2025-04-02T16:59:16+03:00 YaacovHazan Add vector-sets module
Parents: 78e0d87177f21b3d6823bbf78ac7a45b34a9bb25

The vector-sets module is a part of Redis Core and is available by default,
just like any other data type in Redis.

As a result, when building Redis from the source, the vector-sets module
is also compiled as part of the Redis binary and loaded at server start-up.

This new data type added as a preview currently doesn't support
all the capabilities in Redis like:
32-bit OS
C99
Short-read that might end with memory leak
AOF rewirte
defrag

5e7333d2dd2950afa0bb3df06ab926afcc42db7d 2025-04-02T21:54:15+03:00 YaacovHazan Add vector-sets module (#13915)
Parents: 8ea8f4220c393d496aa948b5ebe288f384392899 41b1b5df183aa4bd2043413394debdfa6d40d762

The vector-sets module is a part of Redis Core and is available by
default,
just like any other data type in Redis.

As a result, when building Redis from the source, the vector-sets module
is also compiled as part of the Redis binary and loaded at server
start-up (internal module).

This new data type added as a preview feature and currently doesn't
support all the capabilities in Redis like:
* 32-bit build
* C99 (requires C11 stdatomic)
* Short-read from RDB isn't handled and might lead to a memory leak
```

```
$ git -C repos/redis merge-base --is-ancestor 33d653e24f03adadf469dc1627e15e76580f68b5 5e7333d2dd2950afa0bb3df06ab926afcc42db7d; printf "root-is-ancestor-of-merge exit=%s\n" "$?"
root-is-ancestor-of-merge exit=0
```

## R11 — April 9: the first founder-authored commit after the merge, now under his full name
```
$ git -C repos/redis log --reverse --author='antirez@gmail.com' --format='%H %aI %an %s' 5e7333d2dd2950afa0bb3df06ab926afcc42db7d..HEAD | head -1
96a0cfdea27fa28f93b8071ec1b3c6ef8b315298 2025-04-09T13:39:33+02:00 Salvatore Sanfilippo Vectror Sets: build fixes for the w2v test (#13919)
```

```
$ git -C repos/redis show -s --format='%H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommit: %cn <%ce>%nCommitDate: %cI%nSubject: %s%nParents: %P%n%n%b' 96a0cfdea27fa28f93b8071ec1b3c6ef8b315298
96a0cfdea27fa28f93b8071ec1b3c6ef8b315298
Author: Salvatore Sanfilippo <antirez@gmail.com>
AuthorDate: 2025-04-09T13:39:33+02:00
Commit: GitHub <noreply@github.com>
CommitDate: 2025-04-09T14:39:33+03:00
Subject: Vectror Sets: build fixes for the w2v test (#13919)
Parents: eafc365040014d587df45d57467de3f86363111e

Hi, this fixes building Vector Sets as modules. Right now the module
builds but there are issues with w2v. This PR should fix the problem.
Thanks.
```

```
$ git -C repos/redis log HEAD --author='antirez@gmail.com' --since='2025-01-01T00:00:00Z' --until='2026-01-01T00:00:00Z' --format='%an' | LC_ALL=C sort | uniq -c
     17 Salvatore Sanfilippo
    129 antirez
```

