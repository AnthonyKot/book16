# Scout: redis/redis

- **repo:** https://github.com/redis/redis
- **clone:** `~/book16/repos/redis` (already present; not re-cloned). Working tree 242M; `.git` 217M; `git count-objects -vH` → 1 pack, 215.27 MiB, 105,968 objects.
- **history span (HEAD / `unstable`):** 2009-03-22T10:30:00+01:00 → 2026-08-19T01:24:18-04:00 (author; committer 2026-08-19T13:24:18+08:00)
- **commits:** 13,257 on `HEAD`; 20,843 `--all` (release branches `2.2`–`8.8`, feature branches, and a grafted vector-sets history).
- **tip:** `065d397030712fe216e795720ae0affd3211212c` h.o.t. neglected, "Fix integer overflow on out-of-range numkeys (#15408)"
- **authors (HEAD):** `antirez` 6,153 + `Salvatore Sanfilippo` 1,060 (same person, two bylines) → Oran Agra 553, Pieter Noordhuis 510, Binbin 358.

Four roots on `--all`. The famous one is a Sunday-morning `first commit` at an exact `:00` with copyright 2006 and version `0.07`. Fifteen years later a second root, also antirez, is titled `First internal release.` Between them sit a four-line `SLAVEOF` alias, a goodbye that is a pun on `myself`, a license flip whose author never wrote a line of Redis C, and the same Lua that was committed on the way to a movie.

```
git -C ~/book16/repos/redis log --max-parents=0 --all --format='%h %aI %an %s'
33d653e24f 2025-01-27T17:24:02+01:00 antirez First internal release.
220a0f0880 2021-10-10T18:26:48+03:00 Yoav Steinberg Squashed 'deps/jemalloc/' content from commit 886e40bb3
7ee5a41aac 2020-08-06T12:41:58-07:00 michael-grunder Squashed 'deps/hiredis/' content from commit 39de5267c
ed9b544e10 2009-03-22T10:30:00+01:00 antirez first commit

git -C ~/book16/repos/redis rev-list --count HEAD
13257
```

---

## 1. Day one is 10:30:00 sharp, version 0.07, copyright 2006

- **find-type:** 3 (first commit) — also 2 (planted / dated artifact)
- **hash:** `ed9b544e10b84cd43348ddfab7068b610a5df1f7`
- **date:** Sun 2009-03-22 10:30:00 +0100 (author = committer; seconds are `:00`)
- **author:** antirez `<antirez@gmail.com>`
- **message:** `first commit`
- **command:**

```
git -C ~/book16/repos/redis log --reverse --format='%H %aI %an %s' | head -3
git -C ~/book16/repos/redis diff-tree --root --shortstat ed9b544e10b84cd43348ddfab7068b610a5df1f7
git -C ~/book16/repos/redis show ed9b544e10b84cd43348ddfab7068b610a5df1f7:COPYING | head -1
git -C ~/book16/repos/redis show ed9b544e10b84cd43348ddfab7068b610a5df1f7:redis.c | grep REDIS_VERSION
```

```
ed9b544e10b84cd43348ddfab7068b610a5df1f7 2009-03-22T10:30:00+01:00 antirez first commit
70003d28b8d7430f9e0104575e7160be2f264602 2009-03-22T14:54:14+01:00 antirez INFO fixed, MGET implemented, redis-cli implements INFO/MGET
a74f2af61cb83e104cc9cc5ebd9292f14b6802fa 2009-03-22T14:59:05+01:00 antirez redis-cli now checks the arity of vararg commnads
ed9b544e10b84cd43348ddfab7068b610a5df1f7
 110 files changed, 13641 insertions(+)
Copyright (c) 2006-2009, Salvatore Sanfilippo
#define REDIS_VERSION "0.07"
```

The tree is already a product: `redis.c` (3,037 lines) with `REDIS_SLAVE` / `REDIS_MASTER` flags and a "MASTER <-> SLAVE sync succeeded" log line, plus `adlist`/`dict`/`sds`/`ae`/`zmalloc`, HTML command docs, a Tcl test suite, and client libraries in Erlang/PHP/Python/Ruby. `TODO` is headed `BETA 8 TODO` and already lists `keys expire`. The Erlang client still carries `.hg_archival.txt` (`node: 7f98e864d76b0b2a7427049b943fb1c0dad0df2a`). `BETATESTING.txt` addresses a "betatester" and warns the server "may cotanin unfixed bugs."

- **Why it is a story:** Git's clock starts three years after the copyright notice, on a Sunday, at a timestamp no human clock lands on by accident. Version `0.07`, beta 8, replication already in the binary, expire still on the TODO: this is a cut from a private life, not a blank page. The next four hours are INFO, MGET, arity checks, docs — a working morning after a staged import.
- **What the reader learns:** `git log --reverse | head` on a famous project is usually a title card. Read the copyright year against the author date; if they disagree by years, the "first commit" is a migration. Round `:00` seconds plus a two-word message is a tell.
- **surprise:** 3 (everyone knows Redis started in 2009; the 2006 copyright, the exact 10:30:00, and slaves already in `redis.c` are the part the blog posts skip)

---

## 2. "Remove myself too" is a pun, and then he stops typing

- **find-type:** 4 (name that disappears)
- **hashes:** `59fd178014c7cca1b0c668b30ab0d991dd3030f3` (the pun); `ad0a9df77a2ccf3fdf309dcdd1b54cf350fcbe3c` (actual last 2020 commit)
- **dates:** 2020-06-22T11:21:21+02:00 / 2020-06-25T12:58:21+02:00
- **author:** antirez `<antirez@gmail.com>`
- **messages:** `Clarify maxclients and cluster in conf. Remove myself too.` / `Update comment to clarify change in #7398.`
- **command:**

```
git -C ~/book16/repos/redis show --format=fuller --stat 59fd178014c7cca1b0c668b30ab0d991dd3030f3
git -C ~/book16/repos/redis log --author='antirez\|Salvatore' --since=2020-06-20 --until=2021-01-01 --format='%aI %s'
git -C ~/book16/repos/redis rev-list --count --author='antirez\|Salvatore' HEAD --since=2021-01-01 --until=2025-01-01
```

```
    Clarify maxclients and cluster in conf. Remove myself too.
 redis.conf    | 5 +++++
 src/cluster.c | 5 ++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

+    /* We decrement the number of nodes by one, since there is the
+     * "myself" node too in the list. Each node uses two file descriptors,
+     * one incoming and one outgoing, thus the multiplication by 2. */
     return server.cluster_enabled ?
-           (dictSize(server.cluster->nodes)*2) : 0;
+           ((dictSize(server.cluster->nodes)-1)*2) : 0;

2020-06-22T11:21:21+02:00 Clarify maxclients and cluster in conf. Remove myself too.
2020-06-24T09:07:17+02:00 LPOS: option FIRST renamed RANK.
2020-06-25T12:58:21+02:00 Update comment to clarify change in #7398.
(count 2021-01-01 .. 2025-01-01): 0
```

There is no `goodbye`, `stepping down`, or `farewell` in any commit message. The last object he authors in 2020 is another comment, four lines in `cluster.c` about replicas helping to propagate FAIL. Fifteen days later Oran Agra (`oran@redislabs.com`) lands `change references to the github repo location (#7479)` (`9bbf768d3ceaa882c7dcc0033fc3cb4be0973248`) and rewrites `github.com/antirez/redis` → `github.com/redis/redis` in the README.

Yearly `shortlog -sn HEAD` is the org chart no announcement wrote:

```
git -C ~/book16/repos/redis shortlog -sn HEAD --since=2020-01-01 --until=2021-01-01 | head -3
git -C ~/book16/repos/redis shortlog -sn HEAD --since=2021-01-01 --until=2022-01-01 | head -3
```

```
2020:  244 antirez / 211 Salvatore Sanfilippo / 164 Oran Agra
2021:  129 Oran Agra / 72 Yossi Gottlieb / 67 Binbin
```

- **Why it is a story:** The blog post said he was leaving. Git said he subtracted one from `dictSize(server.cluster->nodes)` because the list contains a node named `myself`, and used the same sentence for his own exit. Then he renamed an LPOS option, updated one more comment, and did not author another commit for four and a half years. The handover is a README URL and a shortlog inversion, not a tag.
- **What the reader learns:** Search for the goodbye in diffs, not in `git log --grep=goodbye`. A pun in a comment, a name that vanishes from `shortlog --since`, and a URL rewrite are how real projects change hands.
- **surprise:** 4 (the leaving is folklore; the pun and the "last commit is a comment" are not)

---

## 3. Four lines rename the world; SLAVEOF stays; that afternoon he draws Schotter

- **find-type:** 1 (tiny diff, huge blast radius)
- **hashes:** `1f37f1dd53160e2defcc82c04c7fb7ffd03b4656` (REPLICAOF alias); `43385c437530cc240b4a2e85c2035c590d26367c` (LOLWUT becomes a command). Series prefix: `Slave removal:`
- **dates:** 2018-09-10T10:43:39+02:00 (committed 2018-09-14T12:36:44+02:00) / 2018-09-12T11:34:10+02:00
- **author:** antirez `<antirez@gmail.com>`
- **messages:** `Slave removal: SLAVEOF -> REPLICAOF. SLAVEOF is now an alias.` / `LOLWUT: wrap it into a proper command.`
- **command:**

```
git -C ~/book16/repos/redis log --reverse --grep='^Slave removal' --format='%aI %s' | head -8
git -C ~/book16/repos/redis show --stat 1f37f1dd53160e2defcc82c04c7fb7ffd03b4656
git -C ~/book16/repos/redis log --author=antirez --since=2018-09-10 --until=2018-09-14 --format='%aI %s'
```

```
2018-09-10T10:43:39+02:00 Slave removal: SLAVEOF -> REPLICAOF. SLAVEOF is now an alias.
2018-09-10T10:46:28+02:00 Slave removal: redis-cli --slave -> --replica.
    Slave removal: SLAVEOF -> REPLICAOF. SLAVEOF is now an alias.
 src/replication.c | 2 +-
 src/server.c      | 3 ++-
 src/server.h      | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)
-    {"slaveof",slaveofCommand,3,"ast",0,NULL,0,0,0,0,0},
+    {"slaveof",replicaofCommand,3,"ast",0,NULL,0,0,0,0,0},
+    {"replicaof",replicaofCommand,3,"ast",0,NULL,0,0,0,0,0},
```

Twenty `Slave removal:` commits over two mornings (config aliases, log strings, `redis.conf`, Sentinel, tests, README). Monday 10:43 he adds the alias; Monday 11:03 he is still stripping the word from test descriptions; Tuesday 16:04 he starts `LOLWUT:` and by Wednesday noon `LOLWUT: draw Schotter by Georg Nees` then wraps it as a command. Thursday night he adds "a few forgotten aliases for CONFIG SET." On HEAD, `SLAVEOF` is still registered in `src/commands.def` as `CMD_DOC_DEPRECATED` since 5.0.0, implemented by `replicaofCommand`.

- **Why it is a story:** The cultural fight everyone remembers is a four-line table edit that keeps the old command as an alias — that *is* the compromise; git holds no revert war and no angry counter-commit. The same person, the same week, implements a command whose only job is to print computer art. The week the language of the protocol changed, the author was also choosing Bresenham's line algorithm and a 1960s plotter piece.
- **What the reader learns:** Terminology migrations leave the old token as an alias; `git log -S REPLICAOF` finds the policy, `git grep slaveof HEAD` finds the tax you still pay. A "series of small commits with one prefix" is how a BDFL does a breaking social change without a breaking protocol change.
- **surprise:** 4 (the rename is known; LOLWUT as the other half of that week is not)

---

## 4. "sorry I have to go to the cinema to watch the Source Code movie"

- **find-type:** 7 (feature that became the vulnerability)
- **hashes:** `0f1d64ca577c8594e26b9e1663e49c8e1bc13757` (cinema); `7585836e6eb1c0199e8d9ea2c3f7a0f67b03c00b` (EVAL skeleton); `21d3294c7013a4385aebd84436394bb58e273093` (Lua vendored); `e304356f597ae959abe71ff0d4e68d9ede6375fc` (CVE-2025-49844)
- **dates:** 2011-04-30T22:29:21+02:00 (authored; committed 2011-05-25T12:32:44+02:00) / 2025-06-23 authored, 2025-10-30 committed
- **authors:** antirez; Mincho Paskalev (fix)
- **messages:** `Lua call of Redis command work in progress: sorry I have to go to the cinema to watch the Source Code movie` / `Lua script may lead to remote code execution (CVE-2025-49844)`
- **command:**

```
git -C ~/book16/repos/redis show --format=fuller --stat 0f1d64ca577c8594e26b9e1663e49c8e1bc13757
git -C ~/book16/repos/redis log --reverse -S 'luaL_newstate' --format='%h %aI %s' | head -3
git -C ~/book16/repos/redis show --stat e304356f597ae959abe71ff0d4e68d9ede6375fc
```

```
AuthorDate: Sat Apr 30 22:29:21 2011 +0200
CommitDate: Wed May 25 12:32:44 2011 +0200
    Lua call of Redis command work in progress: sorry I have to go to the cinema
    to watch the Source Code movie
 src/networking.c | 22 +++++++++++++--------
 src/redis.h      |  1 +
 src/scripting.c  | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

21d3294c70 2011-04-30T16:15:30+02:00 makefile adapted to link against lua lib ...
7585836e6e 2011-04-30T17:46:52+02:00 Lua function creation on EVAL, basic Lua return type ...

    Lua script may lead to remote code execution (CVE-2025-49844)
 deps/lua/src/lparser.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
```

Saturday 16:15 he vendors Lua into `deps/`. 17:46 EVAL can create a function. 22:29 he is mid-bridge from Lua back into Redis commands, writes the cinema sentence, and leaves for *Source Code* (Duncan Jones, 2011 — a film about a man looping inside a system). The author/committer gap is 25 days: this whole Saturday was rewritten onto the branch on May 25. Fourteen years later a six-line `lparser.c` patch is CVE-2025-49844 (RediShell).

- **Why it is a story:** The moment before the outcome is a Saturday night in 2011 when embedding an interpreter is obviously the right next feature, and the commit message is a joke about going to a movie whose plot is "code that runs you." Nobody in that room is thinking about 2025 remote code execution. The blast radius of `deps/lua` is not visible from `+58` lines in `scripting.c`.
- **What the reader learns:** `git log --reverse -S luaL_newstate` is the birthday of your interpreter attack surface. Treat "we can run user code" commits as load-bearing even when the message is a joke, and keep the author date — the cinema timestamp is the true one.
- **surprise:** 4

---

## 5. A name that exists only to change the license, twice

- **find-type:** 8 (rollback of the world) — also 4 (name that appears)
- **hash:** `0b34396924eca4edc524469886dc5be6c77ec4ed`
- **date:** Wed 2024-03-20 22:38:24 +0000 (author = committer = GitHub)
- **author:** Pieter Cailliau `<pieter@redis.com>`
- **message:** `Change license from BSD-3 to dual RSALv2+SSPLv1 (#13157)` + body link to redis.com + `Live long and prosper 🖖`
- **command:**

```
git -C ~/book16/repos/redis show --format=fuller --shortstat 0b34396924eca4edc524469886dc5be6c77ec4ed
git -C ~/book16/repos/redis log --reverse --author='Pieter Cailliau' --format='%h %aI %s'
git -C ~/book16/repos/redis log --since=2024-03-20 --until=2024-03-21 --format='%aI %an %s'
git -C ~/book16/repos/redis show 0b34396924eca4edc524469886dc5be6c77ec4ed -- COPYING src/adlist.c | head -40
```

```
    Change license from BSD-3 to dual RSALv2+SSPLv1 (#13157)
    Live long and prosper 🖖
 166 files changed, 1333 insertions(+), 3066 deletions(-)

0b34396924 2024-03-20T22:38:24+00:00 Change license from BSD-3 to dual RSALv2+SSPLv1 (#13157)
d65102861f 2025-05-01T14:04:22+01:00 Adding AGPLv3 as a license option to Redis! (#13997)

2024-03-20T22:38:24+00:00 Pieter Cailliau Change license from BSD-3 ...
2024-03-21T04:44:28+08:00 Yanqi Lv Fix dict use-after-free problem in kvs->rehashing (#13154)
```

`COPYING` (BSD-3, `Copyright (c) 2006-2020, Salvatore Sanfilippo`) is deleted. `LICENSE.txt` (733 lines of RSALv2 + SSPL) and `REDISCONTRIBUTIONS.txt` appear. `CONTRIBUTING.md` is rewritten as the Redis Software Grant and CLA. Every `src/*.c` banner that said `Copyright (c) 2006-2010, Salvatore Sanfilippo` becomes `Copyright (c) 2006-Present, Redis Ltd.` The same day, one unrelated dict UAF fix. Cailliau's entire `git shortlog` on this repo is two commits, both license files.

Binbin, 2023's top author (112) and #2 in 2024 (53), authors his last commit on 2024-04-16 (`804110a487f0`, Lua VM onto jemalloc) and then zero. `git rev-list --count --author='^Binbin' HEAD --since=2024-04-17` is 0.

- **Why it is a story:** The person who rewrites the legal identity of 13,000 commits has never committed to this tree before and will commit only once more, to add a third license. The emoji is Star Trek; the diff deletes Salvatore's name from a hundred file headers. The next morning someone is already back to fixing a use-after-free. The community committer who led 2022–2023 stops six weeks later without a goodbye of his own.
- **What the reader learns:** `git shortlog --author=X` on the name in a license commit is a test: if that name has two commits and both are LICENSE, the license did not come from the people who write the C. Pair it with `shortlog` windows after the date to see who left.
- **surprise:** 4

---

## 6. They shipped GPLv3 under an AGPLv3 heading

- **find-type:** 8 (rollback of the world) / 1 (tiny-for-the-stakes)
- **hashes:** `d65102861f51af48241f607afa678c4c2a0f894c` (add AGPL); `26683565958f352e1afd86a7f247457db0d6578c` (fix)
- **dates:** 2025-05-01T14:04:22+01:00 / 2025-05-06T14:45:36+03:00
- **authors:** Pieter Cailliau; Lior Kogan `<koganlior1@gmail.com>`
- **messages:** `Adding AGPLv3 as a license option to Redis! (#13997)` / `LICENSE.txt wrongly included the text of GPLv3 instead of AGPLv3 (#14010)`
- **command:**

```
git -C ~/book16/repos/redis show --shortstat d65102861f51af48241f607afa678c4c2a0f894c
git -C ~/book16/repos/redis show 26683565958f352e1afd86a7f247457db0d6578c -- LICENSE.txt | head -25
git -C ~/book16/repos/redis show d65102861f51af48241f607afa678c4c2a0f894c:LICENSE.txt | grep -n 'GNU' | head -6
```

```
 179 files changed, 1856 insertions(+), 762 deletions(-)
    LICENSE.txt wrongly included the text of GPLv3 instead of AGPLv3 (#14010)
 LICENSE.txt | 152 ++++++++++++++++++++++++++++++++++++++----------------------

739:3. GNU AFFERO GENERAL PUBLIC LICENSE, Version 3, 19 Nov 2007
748:  The GNU General Public License is a free, copyleft license for
813:  "This License" refers to version 3 of the GNU General Public License.
```

Section 3 of `LICENSE.txt` was titled AGPLv3 and contained GPLv3, including GPL §13 ("Use with the GNU Affero General Public License") — the clause that exists only because the text is *not* AGPL. Five days later 96 insertions / 56 deletions swap in the Affero preamble and §13 Remote Network Interaction. Redis 8 GA was announced on the same blog post as the AGPL option.

- **Why it is a story:** The second license change in thirteen months, sold as a return toward OSI-shaped freedom, ships the wrong freedom. For five days the file that lawyers and scanners read contradicted its own heading. The fix is one file. The mistake is the kind you only make when the license is a paste, not a practice.
- **What the reader learns:** After any license commit, `grep -n 'This License refers' LICENSE*` and read past the title. A heading is not a hash of the body. Five days of the wrong GPL is a real window for downstream packagers.
- **surprise:** 5

---

## 7. The second genesis: "First internal release." All Rights Reserved.

- **find-type:** 2 (planted / imported-history boundary) — also 4 (name that reappears)
- **hashes:** `33d653e24f03adadf469dc1627e15e76580f68b5` (orphan root); `afcc2ff6e8832dc0621fe4b90e4dae6152b0d0a8` (assigns copyright); `78e0d87177f21b3d6823bbf78ac7a45b34a9bb25` (subtree); `5e7333d2dd2950afa0bb3df06ab926afcc42db7d` (merge to unstable); `96a0cfdea27fa28f93b8071ec1b3c6ef8b315298` (first antirez PR on mainline)
- **dates:** 2025-01-27T17:24:02+01:00 / 2025-03-03 / 2025-04-02 / 2025-04-09
- **authors:** antirez; YaacovHazan (subtree/merge)
- **messages:** `First internal release.` / `LICENSE: change copyright to Redis Ltd.` / `Add 'modules/vector-sets/' from commit 'c6db0a7c…'` / `Vectror Sets: build fixes for the w2v test (#13919)`
- **command:**

```
git -C ~/book16/repos/redis log --max-parents=0 --all --format='%h %aI %an %s'
git -C ~/book16/repos/redis show --format=fuller --stat 33d653e24f03adadf469dc1627e15e76580f68b5 | head -20
git -C ~/book16/repos/redis show 33d653e24f03adadf469dc1627e15e76580f68b5:LICENSE
git -C ~/book16/repos/redis show afcc2ff6e8832dc0621fe4b90e4dae6152b0d0a8 -- LICENSE
```

```
33d653e24 2025-01-27T17:24:02+01:00 antirez First internal release.
    First internal release.
 21 files changed, 7058 insertions(+)
This code is Copyright (C) 2024-2025 Salvatore Sanfilippo.
All Rights Reserved.

-This code is Copyright (C) 2024-2025 Salvatore Sanfilippo.
+This code is Copyright (c) 2024-Present, Redis Ltd.
 All Rights Reserved.
```

Zero parents. A private HNSW / vector-set tree, licensed "All Rights Reserved" in the founder's name, developed through February–March (often after 22:00 +0100), then copyright assigned by the founder to Redis Ltd, then `git subtree`ed into `modules/vector-sets/` by a Redis employee on April 2. April 9 he is back on `unstable` as `Salvatore Sanfilippo` with a typo in the subject (`Vectror`). 2025 `shortlog` puts `antirez` first again (129). May 26 he lands `LOLWUT for Redis 8` (TAPE MARK I). May 2026 he is still here (`0d9576435f`, Redis Array type).

- **Why it is a story:** The return is not a commit on `unstable` in January. It is a second universe with no parent, a two-line proprietary LICENSE, a founder who signs his new work over to the company that relicensed his old work, and a subtree merge that makes `git log --full-history -- src/ae.c` and `git log -- modules/vector-sets/` disagree about when this repo began. 2021–2024 he is a zero in `rev-list --count`. 2025 he is the top name again.
- **What the reader learns:** `git log --max-parents=0 --all` after a "we integrated their module" press release. Subtree imports are second day-ones. A founder returning via a side-repo LICENSE that says All Rights Reserved is a negotiation you can read in two lines.
- **surprise:** 5

---

## 8. `iff` and `265`: he reverts the helpful correction

- **find-type:** 6 (revert war — a rule enforced by reverts)
- **hashes:** `43fdf3b404413f6e3b2c39ac491238c70ecee81c` → `df13adb037cfdd590ec5a833c1b22b043fe6affb` (`iff`); `6253180abd9fd11a385c644fe1dee932ef83d86f` → `00ddc3500c2679e473c3a7769470887a38489fb0` (`265`)
- **dates:** 2013-10-25 (14 minutes apart); 2013-08-19 (two hours apart)
- **author:** antirez (applying, then undoing)
- **messages:** `Fixed typo in SCAN comment. iff -> if.` / `Revert "… iff -> if."` (`Probably here Pieter means "if and only if".`) and `Fixed type in dict.c comment: 265 -> 256.` / `Revert "…"`.
- **command:**

```
git -C ~/book16/repos/redis show df13adb037cfdd590ec5a833c1b22b043fe6affb
git -C ~/book16/repos/redis show 00ddc3500c2679e473c3a7769470887a38489fb0
git -C ~/book16/repos/redis grep -n 'hash \* 265' -- src/dict.c
```

```
    Revert "Fixed typo in SCAN comment. iff -> if."
    Probably here Pieter means "if and only if."
-            /* The pattern is a no-op if == "*" */
+            /* The pattern is a no-op iff == "*" */

    Revert "Fixed type in dict.c comment: 265 -> 256."
-        hash = (hash + (hash << 3)) + (hash << 8); // hash * 256
+        hash = (hash + (hash << 3)) + (hash << 8); // hash * 265

src/dict.c:1135:        hash = (hash + (hash << 3)) + (hash << 8); // hash * 265
```

`iff` was written by Pieter Noordhuis in the original SCAN commit (`7f490b197ffb`, 2012-07-09). Tomas Wang's 64-bit integer hash really is `* 265` (`(x + (x<<3)) + (x<<8) = x*9 + x*256 = x*265`). Both "typo fixes" were committed by antirez (the contributor workflow of 2013: he applied the patch as himself) and then reverted by antirez the same day. The `265` comment is still on HEAD. The `iff` comment later died in a 2013-10-31 refactor (`c4ca5f99b`), not in a second "fix."

- **Why it is a story:** Two afternoons in 2013 the maintainer teaches the same lesson: the comment is not sloppy, the helper is. `iff` is a word; `265` is arithmetic. The rule is enforced by revert messages, not by CONTRIBUTING.md. Thirteen years later `hash * 265` is still the line.
- **What the reader learns:** Before "fixing" a comment, `git log -S` the exact string and do the algebra. A revert whose body is a definition (`if and only if`) is the style guide. `git log --grep='^Revert'` on comment-only diffs is a constitution.
- **surprise:** 3

---

## 9. Jim's event loop is still the first three lines of `ae.c`

- **find-type:** 5 (comment that outlived its code)
- **hash:** `ed9b544e10b84cd43348ddfab7068b610a5df1f7` (origin); still blamed on HEAD
- **date:** 2009-03-22; still present 2026-08-19
- **author:** antirez
- **message:** (file header, not a commit message)
- **command:**

```
git -C ~/book16/repos/redis blame -L 1,11 src/ae.c
git -C ~/book16/repos/redis log -L 1,4:src/ae.c --format='%h %aI %s' | head -5
```

```
^ed9b544e1 ae.c     (antirez         2009-03-22 10:30:00 +0100  1) /* A simple event-driven programming library. Originally I wrote this code
^ed9b544e1 ae.c     (antirez         2009-03-22 10:30:00 +0100  2)  * for the Jim's event-loop (Jim is a Tcl interpreter) but later translated
^ed9b544e1 ae.c     (antirez         2009-03-22 10:30:00 +0100  3)  * it in form of a library for easy reuse.
^ed9b544e1 ae.c     (antirez         2009-03-22 10:30:00 +0100  4)  *
0b34396924 src/ae.c (Pieter Cailliau 2024-03-20 22:38:24 +0000  5)  * Copyright (c) 2006-Present, Redis Ltd.
d65102861f src/ae.c (Pieter Cailliau 2025-05-01 14:04:22 +0100  8)  * Licensed under your choice of (a) the Redis Source Available License 2.0
```

`git blame src/adlist.c | grep -c '\^ed9b544e1'` → 206 lines; `ae.c` 121; `dict.c` 168. The sentence about Jim (antirez's Tcl interpreter, 2005) has never been edited. The copyright line next to it has been rewritten twice, by a man who does not otherwise appear in `ae.c`. `anet.c` still begins `Basic TCP socket stuff made a bit less boring`.

- **Why it is a story:** The process of record for Redis I/O still introduces itself as a translation from a Tcl toy. The legal banner around that sentence now names a company that did not exist in 2009 and a tri-license that did not exist in 2023. Blame shows which layer is durable: the joke, not the license.
- **What the reader learns:** `git blame -L 1,12` on the oldest `.c` files. If the prose is 17 years old and the copyright is last spring, you are looking at a museum label that got a new frame. Grep the scary or tender comment on HEAD *and* on the root; if both hit, it is an unclosed ticket or a founding myth.
- **surprise:** 3

---

## 10. The fork walks back in through a copyright line

- **find-type:** 4 (name that appears) / 8 (a world-undo, inverted)
- **hash:** `e1789e43687108a41cfa8e77d09138e2a296fb89`
- **date:** 2025-05-12T10:15:17+03:00
- **author:** Moti Cohen `<moticless@gmail.com>`
- **message:** `keyspace - Unify key and value & use dict no_value=1 (#13806)`
- **command:**

```
git -C ~/book16/repos/redis log --reverse -S 'Valkey' --format='%h %aI %an %s' | head -5
git -C ~/book16/repos/redis show --format='%B' e1789e43687108a41cfa8e77d09138e2a296fb89 | head -20
git -C ~/book16/repos/redis blame -L 5,8 src/sds.c
```

```
7d3545cb16 2024-07-15T23:19:19+08:00 debing.sun Reduce redundant call of prepareClientToWrite ...
e1789e4368 2025-05-12T10:15:17+03:00 Moti Cohen keyspace - Unify key and value & use dict no_value=1 (#13806)

    This PR adopts Valkey’s packing layout and logic for key, value, and TTL.
    https://github.com/valkey-io/valkey/commit/3eb8314be6af0777e69f852b65f933dd9186d30b

e1789e4368 src/sds.c (Moti Cohen 2025-05-12 ...)  * Copyright (c) 2024-present, Valkey contributors.
```

After the March 2024 relicensing, Valkey forked. Starting July 2024 Redis begins landing patches whose blame and messages name Valkey. The May 2025 keyspace unification *cites a Valkey commit hash* as the layout it is adopting, and writes `Copyright (c) 2024-present, Valkey contributors` into `sds.c` (and later `zmalloc.c`). The relicensed tree now carries the fork's name in its oldest files.

- **Why it is a story:** The outcome of the license change was supposed to be a Redis that Redis Ltd owns. Eleven months later the memory layout of the keyspace is "Valkey's packing," with Valkey's copyright in the SDS banner, next to `2006-Present, Redis Ltd.` The fork did not stay outside. It walked in through a performance PR.
- **What the reader learns:** `git log -S 'NameOfTheFork'` on the original after a license split. If the fork's copyright appears in your headers, the split did not hold as a one-way door. Read the PR body for the other project's commit hash — that is the real provenance.
- **surprise:** 4

---

## 11. Protected mode is seventy-five lines after the internet found Redis

- **find-type:** 1 (tiny-for-the-stakes) / 7 (the missing default became the vuln)
- **hash:** `edd4d555df57dc84265fdfb4ef59a4678832f6da`
- **date:** 2016-01-07T13:00:08+01:00
- **author:** antirez
- **message:** `New security feature: Redis protected mode.`
- **command:**

```
git -C ~/book16/repos/redis show --format=fuller --stat edd4d555df57dc84265fdfb4ef59a4678832f6da
```

```
    An exposed Redis instance on the internet can be cause of serious
    issues. Since Redis, by default, binds to all the interfaces, it is easy
    to forget an instance without any protection layer, for error.
    Protected mode try to address this feature in a soft way...
 redis.conf       | 19 +++++++++++++++++++
 src/config.c     |  8 ++++++++
 src/networking.c | 48 +++++++++++++++++++++++++++++++++++++++++++++---
 src/server.c     |  1 +
 src/server.h     |  2 ++
 5 files changed, 75 insertions(+), 3 deletions(-)
```

Seven years of `bind 0.0.0.0` and no default password. The fix is a default that refuses non-loopback clients unless `bind` or `requirepass` is set, and prints an error that tells you how to turn it off. The typos in the commit message (`enabeld`, `minumum`, `intefaces`, `lookback`) are still the voice of one person writing security policy as prose.

- **Why it is a story:** The moment before the outcome is every default Redis from 2009–2015 listening on the world. Protected mode is not a crypto design; it is a 75-line apology for a default. It arrives after the ransoms, not before.
- **What the reader learns:** `git log --reverse -S 'protected-mode'` dates when your project admitted its default was an incident. If that date is years after the first listen-on-all-interfaces commit, the default *was* the vulnerability.
- **surprise:** 2 (known incident response; included because the stat is smaller than the myth)

---

## Ranked top-3

1. **#2 + #7 — "Remove myself too," then a second genesis.** The goodbye is a pun on the cluster `myself` node (2020-06-22); the last 2020 commit is a comment; `rev-list` is 0 for 2021–2024; he returns as an orphan root whose LICENSE says All Rights Reserved and then assigns the copyright to Redis Ltd. *Reader habit: `git log --max-parents=0 --all` and `shortlog` by year; look for puns in the last diffs of a departing name.*
2. **#6 + #5 — they pasted the wrong GPL, and the only author of both license flips had never written Redis.** Cailliau's entire history is two license commits; five days of Redis 8's `LICENSE.txt` is GPLv3 under an AGPLv3 title. *Reader habit: after a license commit, hash the body not the heading; `shortlog --author` the name on the CLA.*
3. **#3 — four lines of REPLICAOF, and that afternoon Schotter.** The terminology war is an alias; SLAVEOF is still on HEAD; LOLWUT is the other half of the same week. *Reader habit: a prefix-series (`Slave removal:`) plus `git grep` the old token on HEAD is how a social change actually landed.*

**Disappointing:** the 2018 "pushback" on master/slave is not in this git — no revert war, no counter-commit, only the alias that kept `SLAVEOF` forever. The June 2020 stepping-back has no manifesto object; if you came here for a farewell letter, git will hand you a `maxclients` comment and a pun.
