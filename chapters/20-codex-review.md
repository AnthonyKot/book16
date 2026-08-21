Reading additional input from stdin...
OpenAI Codex v0.148.0
--------
workdir: /home/diablo/book16
model: gpt-5.6-sol
provider: openai
approval: never
sandbox: read-only
reasoning effort: high
reasoning summaries: none
session id: 01a0262c-680f-7203-ab4b-5ad2108c8783
--------
user
You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
is an engineer who runs git blame daily; first person, opinionated, no sneering; the reader should
feel a reveal a beat before it's named.

READ: chapters/20-redis.fable.md, chapters/20-redis.receipts.md, plus CONTEXT.md and TEMPLATE.md.
Context: NEW P.S.-candidate chapter (source 20). The published book runs xz / debian-openssl /
t2t / dual-ec / postgres / php / npm / vim; recent additions to the P.S. bench are 17-dirtycow,
18-signatures, 19-openttd. Calibration: a professional-SDE reader scores concision and real-world
consequence hardest; one protagonist, one turn; multi-story sprawl was just punished (Costume).
The book already has a maintainer-departure chapter (vim: death and succession) — this one must be
distinct (departure by choice, and a RETURN, with the license fight written into the git tree).

Spine (verified, LOCKED to receipts): 59fd1780 2020-06-22 antirez "Clarify maxclients and cluster
in conf. Remove myself too." — the diff subtracts the cluster node literally named "myself" from a
connection count; ad0a9df7 2020-06-25 is his last pre-gap commit on HEAD (a parallel-history twin
14a59d4c shares the timestamp, NOT on HEAD — the draft must not claim uniqueness beyond HEAD);
zero antirez commits 2021-2024; gap to the new root is exactly 1,677 days 05:25:41; antirez is
7,188 of 13,257 HEAD commits under two bylines of one email; 2021's top author is Oran Agra;
33d653e2 2025-01-27 "First internal release." is a parentless root (21 files, 7,058 insertions)
whose complete LICENSE reads "This code is Copyright (C) 2024-2025 Salvatore Sanfilippo. / All
Rights Reserved."; afcc2ff6 2025-03-03 changes the holder line to "Copyright (c) 2024-Present,
Redis Ltd." with "All Rights Reserved" unchanged; 78e0d871/5e7333d2 2025-04-02 subtree-join and
merge the orphan line into unstable; 96a0cfde 2025-04-09 first post-merge founder commit under
"Salvatore Sanfilippo" (subject contains his own typo "Vectror").

FACTUAL GATE (one flag gates): every hash, date, name, quote, count, and console line in prose
must appear in chapters/20-redis.receipts.md. Console fences must be reproduce-true: a reader
running the printed command must get exactly the printed lines (check every sed range; the gap
fence and the 2021 shortlog fence are summarized commands — flag if command and output don't
match the receipts' exact form). The draft deliberately says the pun "cannot be proven intended"
(receipts qualification) — verify it stays that way. The draft must NOT claim git proves a legal
assignment beyond the LICENSE file text. List every <!-- CHECK: --> marker (there are four:
2020 step-down, 2024 relicense/Valkey, original BSD terms, Valkey+2025 AGPL return) and judge
whether each is (a) necessary and (b) accurately scoped for external verification.

Craft risks to judge hard: (1) one protagonist across five acts — does it hold as one story
(leave/silence/second-genesis/license-flip/return), or sag in the middle ("The four years")?
(2) distinctness from vim's departure chapter — earned? (3) the pun open — is presenting an
unprovable pun as the cold open honest and effective, or too cute? (4) the license material —
legible to a reader who knows nothing about the Redis/Valkey fight, without the CHECK-marked
external claims doing load-bearing narrative work? (5) title "Remove myself too" — flips? (6)
body word count vs the 2,200-3,200 band — where to cut or grow?

Output: a numbered gate list (must-fix), then optional suggestions. Be specific — quote the
line, say the fix.
warning: Codex could not find bubblewrap on PATH. Install bubblewrap with your OS package manager. See the sandbox prerequisites: https://developers.openai.com/codex/concepts/sandboxing#prerequisites. Codex will use the bundled bubblewrap in the meantime.
codex
I’ll audit the chapter against the receipts first, then assess the narrative spine and calibration. I’ll treat any unsupported factual detail or non-reproducible console fence as a must-fix, and I’ll list all four CHECK markers separately.
exec
/bin/bash -lc "sed -n '1,260p' chapters/20-redis.fable.md && sed -n '1,320p' chapters/20-redis.receipts.md && sed -n '1,260p' CONTEXT.md && sed -n '1,260p' TEMPLATE.md" in /home/diablo/book16
 succeeded in 252ms:
# Remove myself too

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [Remove myself too](20-redis.html).*

On the 22nd of June, 2020, the person who had written most of Redis — the in-memory database that
sits behind a large share of the internet's fast-moving data — committed a small documentation
tidy-up and one tiny code change. The commit subject is ordinary housekeeping with a second
sentence bolted on [R1]:

```console
$ git -C repos/redis show -s --format='%s' 59fd178014c7cca1b0c668b30ab0d991dd3030f3
Clarify maxclients and cluster in conf. Remove myself too.
```

*Remove myself too.* Read the code it ships and the sentence is a plain technical note — one of
those changes so small it barely earns a commit [R2]:

```console
$ git -C repos/redis show --format= --no-ext-diff 59fd178014c7cca1b0c668b30ab0d991dd3030f3 -- src/cluster.c | sed -n '5,14p'
 unsigned long getClusterConnectionsCount(void) {
+    /* We decrement the number of nodes by one, since there is the
+     * "myself" node too in the list. Each node uses two file descriptors,
+     * one incoming and one outgoing, thus the multiplication by 2. */
     return server.cluster_enabled ?
-           (dictSize(server.cluster->nodes)*2) : 0;
+           ((dictSize(server.cluster->nodes)-1)*2) : 0;
}
```

In a Redis cluster, every node keeps a list of all the nodes, and that list includes an entry for
the machine you are standing on — the node the code literally calls `"myself"`. When you count how
many network connections the cluster bus needs, you should not count a connection to yourself. So
the fix subtracts one: `dictSize(...) - 1`. Remove the "myself" node from the tally. *Remove myself
too.*

It is a pun, and I cannot prove it was intended — git records the subject line and the diff, not
the state of mind behind them. But hold the two halves side by side, because the coincidence is
about to stop being funny. The man writing this is Salvatore Sanfilippo, who signs his commits
*antirez*. Within days he will stop committing to Redis, and he will not commit again for four and
a half years. Of all the sentences to leave on the way out, the ledger caught this one: a
maintainer subtracting *myself* from the count of who is present.

## The one-name project

To feel the departure you have to feel the scale of the presence. Ask the ledger who wrote Redis,
and the answer is not a committee [R5]:

```console
$ git -C repos/redis shortlog -sne HEAD | head -4
  6128	antirez <antirez@gmail.com>
  1060	Salvatore Sanfilippo <antirez@gmail.com>
   546	Oran Agra <oran@redislabs.com>
   510	Pieter Noordhuis <pcnoordhuis@gmail.com>
```

The top two lines are the same person — one email address, two spellings of the same human, the
casual handle and the legal name. Add them together and Salvatore is 7,188 of the project's 13,257
commits [R5]: more than half of everything, more than every other contributor on earth combined.
For a decade the yearly counts read like a pulse — four, six, seven hundred commits a year, every
year, 2009 through 2020 [R5]. This is not a founder who wrote the first version and moved to
management. This is the hand that was still on the keys eleven years in.

Three days after "Remove myself too," on June 25th, that hand files one more comment tidy-up — a
clarification about how a replica helps propagate a failure state — and then the pulse stops [R3].
That commit is the last thing antirez does to the main line of Redis for a very long time. You can
measure the silence exactly [R4]:

```console
$ ... gap between 2020-06-25 and the next founder commit
gap  1677 days 05:25:41
```

One thousand six hundred and seventy-seven days. Across the calendar years 2021, 2022, 2023, and
2024, the number of commits antirez made to Redis is zero [R4]. The most prolific author in the
project's history simply stops appearing. He had announced, around that time, that he was stepping
back from the daily work of the project he had made — he no longer wanted to be a maintainer.
<!-- CHECK: In 2020 Salvatore Sanfilippo publicly stepped down as Redis maintainer, handing day-to-day stewardship to a team backed by Redis Labs; needs external source (his blog antirez.com / news coverage). --> The
ledger does not record the reasons. It records the result: the countdown he wrote into the cluster
code, *decrement the number of nodes by one*, ran on the project itself.

## The four years, in someone else's hands

What happens to a project when its one indispensable person leaves? The receipts show the thing
that is supposed to happen and so rarely does: it kept going. Look at the year the handover
completes [R6]:

```console
$ git -C repos/redis shortlog -sn HEAD --since=2021-01-01 --until=2022-01-01 | head -3
   129	Oran Agra
    72	Yossi Gottlieb
    67	Binbin
```

In 2020 antirez still topped the list. In 2021, for the first time in the project's life, the most
active author is someone else — Oran Agra — and the founder is nowhere in the year's top names.
The crowd that had always been there behind the one name kept the database alive, shipping,
patched, growing, for four years without its founder touching a line. A healthy bus-factor story,
the kind every solo-maintained project is quietly praying for.

And then, in the background, the ground under the project shifted in a way the code alone does not
show. In 2024 the company stewarding Redis changed its license, moving the project off the simple,
permissive terms it had carried for its whole life onto something more restrictive.
<!-- CHECK: In March 2024 Redis Ltd. relicensed Redis from the permissive BSD license to the dual RSALv2 / SSPLv1 source-available license; the Linux Foundation forked the last BSD commit as Valkey days later; needs external source. --> That
is the world the founder returns to. Keep it in mind, because the return is written in the one
place a license fight always leaves its fingerprints: the very first page of a repository.

## The second genesis

Most projects have exactly one first commit. Ask Redis for its parentless roots — the commits that
have no history behind them — and it has four [R7]:

```console
$ git -C repos/redis log --max-parents=0 HEAD --format='%H %aI %an %s'
33d653e24f03adadf469dc1627e15e76580f68b5 2025-01-27T17:24:02+01:00 antirez First internal release.
220a0f0880419450c9409202aac1fab4b8be0719 2021-10-10T18:26:48+03:00 Yoav Steinberg Squashed 'deps/jemalloc/' content from commit 886e40bb3
7ee5a41aac7e5abc90d050fa509fa953ca7f1da1 2020-08-06T12:41:58-07:00 michael-grunder Squashed 'deps/hiredis/' content from commit 39de5267c
ed9b544e10b84cd43348ddfab7068b610a5df1f7 2009-03-22T10:30:00+01:00 antirez first commit
```

Two of these are the imported histories of bundled dependencies — ordinary plumbing. But look at
the outer two, and at their authors. The bottom one, March 2009, is the beginning: `first commit`,
by antirez. The top one, January 2025, is by antirez too — and it is a *second* beginning, a fresh
root with no parent, five years and a whole silence after the first. Its subject is `First internal
release.` [R7] — the language of a project starting over from nothing, dropped into the middle of a
sixteen-year-old repository.

It is not a small commit dressed up. It plants twenty-one files and seven thousand lines in a
single parentless stroke [R7]. A new genesis, by the original creator, at the far end of the gap he
opened with "Remove myself too." The founder came back — but he came back as a new origin, not as a
continuation.

And here is the page you should read the way you would read the opening line of a will. The very
first LICENSE file at that new root says this, in its entirety [R8]:

```console
$ git -C repos/redis show 33d653e24f03adadf469dc1627e15e76580f68b5:LICENSE
This code is Copyright (C) 2024-2025 Salvatore Sanfilippo.
All Rights Reserved.
```

*All Rights Reserved.* For sixteen years Redis had been permissively licensed — take it, use it,
build a business on it, that was the whole social contract of the thing.
<!-- CHECK: Redis carried the permissive three-clause BSD license from 2009 until the 2024 relicense; "All Rights Reserved" is the opposite default (no permissions granted); needs external source for the original BSD terms. --> The
first page of the founder's second beginning grants *nothing*. And read the copyright holder: not a
company, not Redis Labs, not Redis Ltd — *Salvatore Sanfilippo*, the man, by name. Whatever this new
root is, it begins as his, reserved, personal.

That personal claim lasts five weeks. On March 3rd, 2025, one commit changes the line [R9]:

```console
$ git -C repos/redis show --no-ext-diff --format= afcc2ff6e8832dc0621fe4b90e4dae6152b0d0a8 -- LICENSE
-This code is Copyright (C) 2024-2025 Salvatore Sanfilippo.
+This code is Copyright (c) 2024-Present, Redis Ltd.
 All Rights Reserved.
```

The subject is `LICENSE: change copyright to Redis Ltd.` [R9]. Watch exactly what moves and what
stays. The *holder* changes — Salvatore's name is replaced by the company's. The *terms* do not:
`All Rights Reserved` sits there through both versions, untouched. The reserving of rights was never
the personal part; the personal part was whose name did the reserving, and that is the line that got
handed to the company. You are watching, in a two-line diff, a founder's private restart get folded
into a corporate asset — the man's name on the door for five weeks, then the company's.

## The merge

For a couple of months the second genesis lived off to the side, its own parentless line of
history. Then, on April 2nd, 2025, it was stitched into the main branch — subtree-joined and merged
into the `unstable` line that had run without antirez for four years [R10]. The old history and the
new root now share one tree. And a week later, the founder is committing again as a regular
contributor to the reunified project [R11]:

```console
$ git -C repos/redis show -s --format='Author: %an <%ae>%nDate: %aI%nSubject: %s' 96a0cfdea27fa28f93b8071ec1b3c6ef8b315298
Author: Salvatore Sanfilippo <antirez@gmail.com>
Date: 2025-04-09T13:39:33+02:00
Subject: Vectror Sets: build fixes for the w2v test (#13919)
```

Note the byline: `Salvatore Sanfilippo`, the full legal name, the same person who had left as
*antirez*. The hand is back on the keys — a typo in his own commit subject and all — and by the end
of 2025 he has made well over a hundred commits again [R11]. The founder returned. But the ledger is
honest about what returned and what didn't: he came back not to the history he left, but through a
new root, under a license that granted nothing, with his own name on the copyright for exactly as
long as it took to transfer it to the company.

## What it changed

I want to be careful here, because git can only take you to the edge of this story. What the
receipts prove is precise and strange: the man who wrote more than half of Redis removed *myself*
from a count, went silent for 1,677 days, and returned as a brand-new origin whose first page said
*All Rights Reserved* before it said *Redis Ltd.* What the receipts cannot prove is why any of it
happened — the license fight that emptied the permissive terms out of the project, the community
that forked the last freely-licensed version and carried the old contract forward under a new name,
the negotiations that brought the founder back.
<!-- CHECK: Redis's 2024 relicense drove the Linux Foundation's Valkey fork (launched March 2024); Redis returned to an open-source license (adding AGPLv3) in 2025 around the time of Sanfilippo's return; needs external source. --> Those
live in blog posts and press releases, not in commits. But the shape the license leaves in the git
tree is real, and it is the thing to carry away: when the terms under which code is shared become
contested, the fight does not stay in the LICENSE file. It reaches back and rewrites what a
"beginning" even is — a sixteen-year-old project acquires a second birthday, and the founder's
return is recorded not as *welcome back* but as `First internal release.`

## At home

The habit this leaves you is to distrust the singular "first commit." When you inherit a repository
— especially one that has been through an acquisition, a relicense, a corporate handoff — do not
assume its history runs in one unbroken line back to one beginning. Ask git for *all* of its roots:

```console
$ git log --max-parents=0 --format='%H %aI %an %s' --all
```

Every parentless commit is a place where a history was *started* rather than *continued* — an
import, a squash, a relicense, a fresh internal release dropped into an old project. Read the author
and date on each one, then read the LICENSE file *at that exact commit*, not the one at the tip:
`git show <root>:LICENSE`. The terms a project ships under today tell you where it landed. The terms
at each root tell you the moment someone decided to start the clock over, and — if you read the
copyright holder as carefully as the license — *whose* name held the rights at the instant of
restarting, and how long that lasted. The most important word on the first page is often not the
license. It is the name in front of it.

## Receipts

- **R1** `git -C repos/redis show -s --format='%s' 59fd178014c7...` — 2020-06-22, antirez: "Clarify maxclients and cluster in conf. Remove myself too." (2 files, 9 insertions, 1 deletion).
- **R2** `git -C repos/redis show ... 59fd178014c7... -- redis.conf src/cluster.c` — the code: `getClusterConnectionsCount()` changes `dictSize(...)*2` to `(dictSize(...)-1)*2`, decrementing the `"myself"` node from the count.
- **R3** `git -C repos/redis show -s ... ad0a9df77a2c...` — 2020-06-25: "Update comment to clarify change in #7398," his last pre-gap commit on HEAD (a parallel-history twin `14a59d4c...` shares the timestamp but is not on HEAD).
- **R4** `git -C repos/redis log --all --author=... ` + `rev-list --count` + date arithmetic — zero antirez commits across 2021–2024; gap from 2020-06-25 to the 2025-01-27 root is 1,677 days 05:25:41.
- **R5** `git -C repos/redis rev-list --count` + `shortlog -sne` + per-year counts — 7,188 of 13,257 HEAD commits are antirez (two bylines, one email); 400–800/year, 2009–2020.
- **R6** `git -C repos/redis shortlog -sn` per year — 2020 topped by antirez; 2021 topped by Oran Agra with the founder absent; 2025 antirez back at 129.
- **R7** `git -C repos/redis log --max-parents=0 HEAD` + `cat-file -p` + `show --root --shortstat` — four parentless roots; `33d653e2...` "First internal release." (antirez, 2025-01-27, no parent, 21 files / 7,058 insertions) beside the 2009 `first commit`.
- **R8** `git -C repos/redis show 33d653e2...:LICENSE` — at the second root: "This code is Copyright (C) 2024-2025 Salvatore Sanfilippo. All Rights Reserved."
- **R9** `git -C repos/redis show ... afcc2ff6e8... -- LICENSE` — 2025-03-03, "LICENSE: change copyright to Redis Ltd.": holder line becomes "Copyright (c) 2024-Present, Redis Ltd."; `All Rights Reserved` unchanged.
- **R10** `git -C repos/redis show ... 78e0d871... 5e7333d2...` + `merge-base --is-ancestor` — 2025-04-02: the new root's line is subtree-joined and merged into `unstable`; the root is an ancestor of the merge.
- **R11** `git -C repos/redis log --reverse --author=... 5e7333d2..HEAD` + per-year byline counts — 2025-04-09: first post-merge founder commit, now authored as "Salvatore Sanfilippo"; 129 antirez + 17 Salvatore commits in 2025.
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

# Blame — authoring context

Working title: **Blame**. Git archaeology: each chapter is one dig in a public repository,
reproducible by the reader. Receipts are commit hashes; `verify.sh` (to be written after the
pilot settles the receipt format) clones and re-checks them.

## Why this book exists (the quality diagnosis — do not lose this)

Born 2026-08-18 from a diagnosis of why the earlier shelf reads as boring:
1. **Exhibits without a narrator.** Fix: the narrator is an engineer who runs `blame` daily and
   is walking you through *their* obsession. First person allowed. Opinions allowed.
2. **No surprise.** Fix: every chapter is built around a reveal the reader should feel a beat
   before it is stated. Cut digs that only confirm folklore (surprise ≤2).
3. **Uniform template.** Fix: TEMPLATE.md defines *beats*, not sections. Chapters may open on a
   diff, a timestamp, a name, or a hole. No two consecutive chapters open the same way.

Second reader lesson (book14, 2026-08-18): rigor lives in the receipts file; the reading
surface stays plain and entertaining. A reader must be able to *see the moment* without holding
locators in their head.

## Non-negotiables

- **Never false.** Every hash, date, author, message and diff quoted in prose must exist in the
  receipts file, which is generated by `scripts/receipts-NN.sh` running real commands against a
  real clone. Never quote command output from memory or from a scout report — the two-model
  audit (2026-08-19) showed scouts silently tidy transcripts.
- **Moment before the outcome.** Reconstruct what the actor knew when they typed. No sneering,
  no hindsight-flattering. The reader should think "I might have done this."
- **Chapter changes how the reader reads their own repo.** Each chapter ends with what to run
  at home — woven in, not a boxed sidebar.
- **Reader cut ≤ 2,000 words by default; up to 3,000 when the story earns it** (user, 2026-08-21:
  "if story is good, it could be up to 3,000"). The default is still the target — the extra
  thousand is for material that raises the score, never a license to skip the trim pass; the SDE
  reader's #1 note was concision. The counter is prose-only:
  `grep -v '^<!--' NN-x.reader.md | wc -w` (authoring comments excluded; the italic footer and
  code panels count). Settled 2026-08-21 after two sessions counted the same file differently.
- External (non-git) facts carry `<!-- CHECK: -->` markers until an adversarial review pass
  clears them, then `<!-- VERIFIED: evidence + source URL -->` comments preserve the invisible
  audit trail (book14 pipeline: draft → grok/agy/codex reviews → canonical).
- **Never put grep-filtered diff output inside a ```diff fence.** Grep strips hunk boundaries and
  can stitch lines from different functions into a "diff" that exists nowhere in the tree (this
  bit ch.05's centerpiece on 2026-08-19 — caught by a blind reader test). Grep transcripts belong
  in ```console with the pipe visible; real hunks are shown verbatim via sed line-ranges.

## Pipeline per chapter

1. Scout report (grok) + second-opinion verification (codex) — done for 23 repos, `scout/`.
2. `scripts/receipts-NN.sh` → `chapters/NN-x.receipts.md` (verbatim, regenerable).
3. `chapters/NN-x.fable.md` draft with CHECK markers, body ≤3,200 words.
4. Adversarial reviews from a shared prompt; apply gate items; 0 CHECKs → `chapters/NN-x.md`.
5. Human reader test (score 1–10) before the chapter counts as done.

## State

- `scout/` — 23 grok reports + 23 codex verify/extend reports + SELECTION.md (Round 1 ranking;
  v2 with Round 2 + codex digs pending).
- Final public sequence, second edition (source IDs remain stable for receipts): 04 xz → ch.01;
  01 Debian OpenSSL → ch.02; 10 t2t → ch.03; 14 Dual EC → ch.04; 15 Postgres → ch.05;
  12 PHP → ch.06; 09 npm → ch.07; 07 Vim → ch.08. (2026-08-21, from the SDE reader test,
  user's constraint: exactly 4 out / 4 in, order and rework delegated to the working sessions.
  OUT: Git — readers "didn't get it"; Costume — "messy, no plot", scored 4; Node — weak plot,
  "I'd replace right away"; Log4j2 — scored 6 with a rewrite-level concision complaint, and it
  is the corpus's most-retold folklore, so its surprise budget is lowest. IN: PHP, npm, t2t,
  Dual EC — Dual EC matches the formula the reader rewarded (one person, one artifact,
  restraint, real stakes). Order logic: xz opens (user's pick); xz→Debian OpenSSL is a
  deliberate contrast (attack, then honest mistake); t2t and Postgres are breathers between
  the security chapters; PHP→npm pairs repo forgery with registry sabotage; Vim keeps the
  elegy close.)
- The other eight completed investigations remain accessible under `P.S. Drafts` on the contents
  page, but are not part of the numbered book.

## SDE reader test (2026-08-21, in progress)

Full scoreboard from a professional-engineer reader: **Postgres and Vim best** ("more or less
well written" — the writing carried them); **xz 7**; **Log4j2 6**; **Debian OpenSSL and Node
"kind of ok"** — entertaining but not high-quality writing/story (OpenSSL misses the
significance of the bug; Node has a weak plot → demoted); **Costume 4 → demoted**; **Git
worst** — readers "didn't get it". Calibration: this reader scores PROSE QUALITY first
(the two most-restrained chapters won), then real-world consequence; clever-meta and
whimsy registers (Costume, Git) rate low even when model reviewers and blind sims rate them
high. Recurring note: write more concisely, and end with the real post-factum impact (for
xz: how far the payload actually got, the sshd/libsystemd target, the Jia Tan working-hours
research; for Debian OpenSSL: the two years of guessable keys). Open follow-ups: impact
endings for xz and Debian OpenSSL (sourced, VERIFIED-marked); concision trims on flagged
chapters; soft sim defects on t2t/npm. (The 4-out/4-in swap itself landed — see the sequence
note above.)

## Fix backlog (blind reader-test pass, 2026-08-19)

**All cleared 2026-08-20.** Ch.01/04 applied 2026-08-19; ch.02 (fifth beat restored as "2021 —
this feature is not used", full-dig aphorism corrected to "default is off", Goers/Kozak named),
ch.03 (mailmap/indifference reframe both forms + R6 no-.mailmap receipt, verbatim shortlog open
in reader, annoyance line cut), ch.06 reader (Bitcoin paragraph rebuilt on twin roots + sirius-m),
ch.07 reader (mailbox-vs-serving-hatch physical beat) applied 2026-08-20.
# Chapter beats (not sections)

A chapter is 2,200–3,200 words of body. It hits these beats in whatever order the story wants;
the ONLY rule is that no two consecutive chapters open on the same kind of object.

- **COLD OPEN** — drop the reader into one concrete moment: a diff hunk, a clock, a name, an
  absence. Not "This is the story of…". Ideally the thing that will turn out to matter, shown
  before we know it matters.
- **THE ROOM** — reconstruct what the actor knew and wanted right then. Their tools, their
  ticket, their Tuesday. This is where "no sneering" lives.
- **THE TURN** — the reveal. The reader should feel it a sentence before it is named. Put the
  receipt (hash + command) at the turn, inline, small.
- **THE BLAST RADIUS** — what it cost and for how long, told concretely (who, how many, how
  long it stayed dark).
- **AT HOME** — the command the reader should run on their own repo, woven into the closing,
  never a boxed sidebar. The habit is the takeaway.

Receipts: prose may quote only what appears in `chapters/NN-x.receipts.md`. Reference receipts
by their R-number in a trailing `## Receipts` list (R1, R4, …) with the one-line locator.

Word count method (body only, excludes the Receipts list):
`awk '/^## Receipts/{exit} {print}' chapters/NN-x.md | wc -w`

codex
The receipts reveal two especially important pressure points already: the draft’s “transfer/corporate asset” language goes beyond what the LICENSE diff can prove, and the displayed gap fence is not a runnable command. I’m now checking every transcript and counting the body with the project’s stated method.
exec
/bin/bash -lc "awk '/"'^## Receipts/{exit} {print}'"' chapters/20-redis.fable.md | wc -w
rg -n '<"'!-- CHECK:|```console|''^'"\\"'$ |first time|sixteen years|transfer|corporate asset|handed to the company|granted nothing|negotiations|large share|four, six|seven thousand|well over'"' chapters/20-redis.fable.md

git -C repos/redis show --format= --no-ext-diff 59fd178014c7cca1b0c668b30ab0d991dd3030f3 -- src/cluster.c | sed -n '5,14p'

git -C repos/redis shortlog -sn HEAD --since=2021-01-01 --until=2022-01-01 | head -3

git -C repos/redis show -s --format='%s' 59fd178014c7cca1b0c668b30ab0d991dd3030f3

git -C repos/redis show -s --format='Author: %an <%ae>%nDate: %aI%nSubject: %s' 96a0cfdea27fa28f93b8071ec1b3c6ef8b315298" in /home/diablo/book16
 succeeded in 426ms:
2186
7:sits behind a large share of the internet's fast-moving data — committed a small documentation
11:```console
12:$ git -C repos/redis show -s --format='%s' 59fd178014c7cca1b0c668b30ab0d991dd3030f3
19:```console
20:$ git -C repos/redis show --format= --no-ext-diff 59fd178014c7cca1b0c668b30ab0d991dd3030f3 -- src/cluster.c | sed -n '5,14p'
49:```console
50:$ git -C repos/redis shortlog -sne HEAD | head -4
60:For a decade the yearly counts read like a pulse — four, six, seven hundred commits a year, every
69:```console
70:$ ... gap between 2020-06-25 and the next founder commit
78:<!-- CHECK: In 2020 Salvatore Sanfilippo publicly stepped down as Redis maintainer, handing day-to-day stewardship to a team backed by Redis Labs; needs external source (his blog antirez.com / news coverage). --> The
88:```console
89:$ git -C repos/redis shortlog -sn HEAD --since=2021-01-01 --until=2022-01-01 | head -3
95:In 2020 antirez still topped the list. In 2021, for the first time in the project's life, the most
104:<!-- CHECK: In March 2024 Redis Ltd. relicensed Redis from the permissive BSD license to the dual RSALv2 / SSPLv1 source-available license; the Linux Foundation forked the last BSD commit as Valkey days later; needs external source. --> That
113:```console
114:$ git -C repos/redis log --max-parents=0 HEAD --format='%H %aI %an %s'
128:It is not a small commit dressed up. It plants twenty-one files and seven thousand lines in a
136:```console
137:$ git -C repos/redis show 33d653e24f03adadf469dc1627e15e76580f68b5:LICENSE
142:*All Rights Reserved.* For sixteen years Redis had been permissively licensed — take it, use it,
144:<!-- CHECK: Redis carried the permissive three-clause BSD license from 2009 until the 2024 relicense; "All Rights Reserved" is the opposite default (no permissions granted); needs external source for the original BSD terms. --> The
151:```console
152:$ git -C repos/redis show --no-ext-diff --format= afcc2ff6e8832dc0621fe4b90e4dae6152b0d0a8 -- LICENSE
162:handed to the company. You are watching, in a two-line diff, a founder's private restart get folded
163:into a corporate asset — the man's name on the door for five weeks, then the company's.
173:```console
174:$ git -C repos/redis show -s --format='Author: %an <%ae>%nDate: %aI%nSubject: %s' 96a0cfdea27fa28f93b8071ec1b3c6ef8b315298
182:of 2025 he has made well over a hundred commits again [R11]. The founder returned. But the ledger is
184:new root, under a license that granted nothing, with his own name on the copyright for exactly as
185:long as it took to transfer it to the company.
195:the negotiations that brought the founder back.
196:<!-- CHECK: Redis's 2024 relicense drove the Linux Foundation's Valkey fork (launched March 2024); Redis returned to an open-source license (adding AGPLv3) in 2025 around the time of Sanfilippo's return; needs external source. --> Those
209:```console
210:$ git log --max-parents=0 --format='%H %aI %an %s' --all
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
   128	Oran Agra
    72	Yossi Gottlieb
    67	Binbin
Clarify maxclients and cluster in conf. Remove myself too.
Author: Salvatore Sanfilippo <antirez@gmail.com>
Date: 2025-04-09T13:39:33+02:00
Subject: Vectror Sets: build fixes for the w2v test (#13919)

exec
/bin/bash -lc "awk '/"'^## Receipts/{exit} !/''^<!--/{print}'"' chapters/20-redis.fable.md | wc -w
sed -n '1,230p' chapters/20-redis.fable.md | nl -ba | sed -n '1,230p'

git -C repos/redis show --format= --no-ext-diff 59fd178014c7cca1b0c668b30ab0d991dd3030f3 -- src/cluster.c | sed -n '8,16p'

git -C repos/redis shortlog -sn HEAD --since='2021-01-01T00:00:00Z' --until='2022-01-01T00:00:00Z' | head -3" in /home/diablo/book16
 succeeded in 320ms:
2044
     1	# Remove myself too
     2	
     3	*This is the full dig — every command, every receipt. The plain-English telling of the same story
     4	is here: [Remove myself too](20-redis.html).*
     5	
     6	On the 22nd of June, 2020, the person who had written most of Redis — the in-memory database that
     7	sits behind a large share of the internet's fast-moving data — committed a small documentation
     8	tidy-up and one tiny code change. The commit subject is ordinary housekeeping with a second
     9	sentence bolted on [R1]:
    10	
    11	```console
    12	$ git -C repos/redis show -s --format='%s' 59fd178014c7cca1b0c668b30ab0d991dd3030f3
    13	Clarify maxclients and cluster in conf. Remove myself too.
    14	```
    15	
    16	*Remove myself too.* Read the code it ships and the sentence is a plain technical note — one of
    17	those changes so small it barely earns a commit [R2]:
    18	
    19	```console
    20	$ git -C repos/redis show --format= --no-ext-diff 59fd178014c7cca1b0c668b30ab0d991dd3030f3 -- src/cluster.c | sed -n '5,14p'
    21	 unsigned long getClusterConnectionsCount(void) {
    22	+    /* We decrement the number of nodes by one, since there is the
    23	+     * "myself" node too in the list. Each node uses two file descriptors,
    24	+     * one incoming and one outgoing, thus the multiplication by 2. */
    25	     return server.cluster_enabled ?
    26	-           (dictSize(server.cluster->nodes)*2) : 0;
    27	+           ((dictSize(server.cluster->nodes)-1)*2) : 0;
    28	}
    29	```
    30	
    31	In a Redis cluster, every node keeps a list of all the nodes, and that list includes an entry for
    32	the machine you are standing on — the node the code literally calls `"myself"`. When you count how
    33	many network connections the cluster bus needs, you should not count a connection to yourself. So
    34	the fix subtracts one: `dictSize(...) - 1`. Remove the "myself" node from the tally. *Remove myself
    35	too.*
    36	
    37	It is a pun, and I cannot prove it was intended — git records the subject line and the diff, not
    38	the state of mind behind them. But hold the two halves side by side, because the coincidence is
    39	about to stop being funny. The man writing this is Salvatore Sanfilippo, who signs his commits
    40	*antirez*. Within days he will stop committing to Redis, and he will not commit again for four and
    41	a half years. Of all the sentences to leave on the way out, the ledger caught this one: a
    42	maintainer subtracting *myself* from the count of who is present.
    43	
    44	## The one-name project
    45	
    46	To feel the departure you have to feel the scale of the presence. Ask the ledger who wrote Redis,
    47	and the answer is not a committee [R5]:
    48	
    49	```console
    50	$ git -C repos/redis shortlog -sne HEAD | head -4
    51	  6128	antirez <antirez@gmail.com>
    52	  1060	Salvatore Sanfilippo <antirez@gmail.com>
    53	   546	Oran Agra <oran@redislabs.com>
    54	   510	Pieter Noordhuis <pcnoordhuis@gmail.com>
    55	```
    56	
    57	The top two lines are the same person — one email address, two spellings of the same human, the
    58	casual handle and the legal name. Add them together and Salvatore is 7,188 of the project's 13,257
    59	commits [R5]: more than half of everything, more than every other contributor on earth combined.
    60	For a decade the yearly counts read like a pulse — four, six, seven hundred commits a year, every
    61	year, 2009 through 2020 [R5]. This is not a founder who wrote the first version and moved to
    62	management. This is the hand that was still on the keys eleven years in.
    63	
    64	Three days after "Remove myself too," on June 25th, that hand files one more comment tidy-up — a
    65	clarification about how a replica helps propagate a failure state — and then the pulse stops [R3].
    66	That commit is the last thing antirez does to the main line of Redis for a very long time. You can
    67	measure the silence exactly [R4]:
    68	
    69	```console
    70	$ ... gap between 2020-06-25 and the next founder commit
    71	gap  1677 days 05:25:41
    72	```
    73	
    74	One thousand six hundred and seventy-seven days. Across the calendar years 2021, 2022, 2023, and
    75	2024, the number of commits antirez made to Redis is zero [R4]. The most prolific author in the
    76	project's history simply stops appearing. He had announced, around that time, that he was stepping
    77	back from the daily work of the project he had made — he no longer wanted to be a maintainer.
    78	<!-- CHECK: In 2020 Salvatore Sanfilippo publicly stepped down as Redis maintainer, handing day-to-day stewardship to a team backed by Redis Labs; needs external source (his blog antirez.com / news coverage). --> The
    79	ledger does not record the reasons. It records the result: the countdown he wrote into the cluster
    80	code, *decrement the number of nodes by one*, ran on the project itself.
    81	
    82	## The four years, in someone else's hands
    83	
    84	What happens to a project when its one indispensable person leaves? The receipts show the thing
    85	that is supposed to happen and so rarely does: it kept going. Look at the year the handover
    86	completes [R6]:
    87	
    88	```console
    89	$ git -C repos/redis shortlog -sn HEAD --since=2021-01-01 --until=2022-01-01 | head -3
    90	   129	Oran Agra
    91	    72	Yossi Gottlieb
    92	    67	Binbin
    93	```
    94	
    95	In 2020 antirez still topped the list. In 2021, for the first time in the project's life, the most
    96	active author is someone else — Oran Agra — and the founder is nowhere in the year's top names.
    97	The crowd that had always been there behind the one name kept the database alive, shipping,
    98	patched, growing, for four years without its founder touching a line. A healthy bus-factor story,
    99	the kind every solo-maintained project is quietly praying for.
   100	
   101	And then, in the background, the ground under the project shifted in a way the code alone does not
   102	show. In 2024 the company stewarding Redis changed its license, moving the project off the simple,
   103	permissive terms it had carried for its whole life onto something more restrictive.
   104	<!-- CHECK: In March 2024 Redis Ltd. relicensed Redis from the permissive BSD license to the dual RSALv2 / SSPLv1 source-available license; the Linux Foundation forked the last BSD commit as Valkey days later; needs external source. --> That
   105	is the world the founder returns to. Keep it in mind, because the return is written in the one
   106	place a license fight always leaves its fingerprints: the very first page of a repository.
   107	
   108	## The second genesis
   109	
   110	Most projects have exactly one first commit. Ask Redis for its parentless roots — the commits that
   111	have no history behind them — and it has four [R7]:
   112	
   113	```console
   114	$ git -C repos/redis log --max-parents=0 HEAD --format='%H %aI %an %s'
   115	33d653e24f03adadf469dc1627e15e76580f68b5 2025-01-27T17:24:02+01:00 antirez First internal release.
   116	220a0f0880419450c9409202aac1fab4b8be0719 2021-10-10T18:26:48+03:00 Yoav Steinberg Squashed 'deps/jemalloc/' content from commit 886e40bb3
   117	7ee5a41aac7e5abc90d050fa509fa953ca7f1da1 2020-08-06T12:41:58-07:00 michael-grunder Squashed 'deps/hiredis/' content from commit 39de5267c
   118	ed9b544e10b84cd43348ddfab7068b610a5df1f7 2009-03-22T10:30:00+01:00 antirez first commit
   119	```
   120	
   121	Two of these are the imported histories of bundled dependencies — ordinary plumbing. But look at
   122	the outer two, and at their authors. The bottom one, March 2009, is the beginning: `first commit`,
   123	by antirez. The top one, January 2025, is by antirez too — and it is a *second* beginning, a fresh
   124	root with no parent, five years and a whole silence after the first. Its subject is `First internal
   125	release.` [R7] — the language of a project starting over from nothing, dropped into the middle of a
   126	sixteen-year-old repository.
   127	
   128	It is not a small commit dressed up. It plants twenty-one files and seven thousand lines in a
   129	single parentless stroke [R7]. A new genesis, by the original creator, at the far end of the gap he
   130	opened with "Remove myself too." The founder came back — but he came back as a new origin, not as a
   131	continuation.
   132	
   133	And here is the page you should read the way you would read the opening line of a will. The very
   134	first LICENSE file at that new root says this, in its entirety [R8]:
   135	
   136	```console
   137	$ git -C repos/redis show 33d653e24f03adadf469dc1627e15e76580f68b5:LICENSE
   138	This code is Copyright (C) 2024-2025 Salvatore Sanfilippo.
   139	All Rights Reserved.
   140	```
   141	
   142	*All Rights Reserved.* For sixteen years Redis had been permissively licensed — take it, use it,
   143	build a business on it, that was the whole social contract of the thing.
   144	<!-- CHECK: Redis carried the permissive three-clause BSD license from 2009 until the 2024 relicense; "All Rights Reserved" is the opposite default (no permissions granted); needs external source for the original BSD terms. --> The
   145	first page of the founder's second beginning grants *nothing*. And read the copyright holder: not a
   146	company, not Redis Labs, not Redis Ltd — *Salvatore Sanfilippo*, the man, by name. Whatever this new
   147	root is, it begins as his, reserved, personal.
   148	
   149	That personal claim lasts five weeks. On March 3rd, 2025, one commit changes the line [R9]:
   150	
   151	```console
   152	$ git -C repos/redis show --no-ext-diff --format= afcc2ff6e8832dc0621fe4b90e4dae6152b0d0a8 -- LICENSE
   153	-This code is Copyright (C) 2024-2025 Salvatore Sanfilippo.
   154	+This code is Copyright (c) 2024-Present, Redis Ltd.
   155	 All Rights Reserved.
   156	```
   157	
   158	The subject is `LICENSE: change copyright to Redis Ltd.` [R9]. Watch exactly what moves and what
   159	stays. The *holder* changes — Salvatore's name is replaced by the company's. The *terms* do not:
   160	`All Rights Reserved` sits there through both versions, untouched. The reserving of rights was never
   161	the personal part; the personal part was whose name did the reserving, and that is the line that got
   162	handed to the company. You are watching, in a two-line diff, a founder's private restart get folded
   163	into a corporate asset — the man's name on the door for five weeks, then the company's.
   164	
   165	## The merge
   166	
   167	For a couple of months the second genesis lived off to the side, its own parentless line of
   168	history. Then, on April 2nd, 2025, it was stitched into the main branch — subtree-joined and merged
   169	into the `unstable` line that had run without antirez for four years [R10]. The old history and the
   170	new root now share one tree. And a week later, the founder is committing again as a regular
   171	contributor to the reunified project [R11]:
   172	
   173	```console
   174	$ git -C repos/redis show -s --format='Author: %an <%ae>%nDate: %aI%nSubject: %s' 96a0cfdea27fa28f93b8071ec1b3c6ef8b315298
   175	Author: Salvatore Sanfilippo <antirez@gmail.com>
   176	Date: 2025-04-09T13:39:33+02:00
   177	Subject: Vectror Sets: build fixes for the w2v test (#13919)
   178	```
   179	
   180	Note the byline: `Salvatore Sanfilippo`, the full legal name, the same person who had left as
   181	*antirez*. The hand is back on the keys — a typo in his own commit subject and all — and by the end
   182	of 2025 he has made well over a hundred commits again [R11]. The founder returned. But the ledger is
   183	honest about what returned and what didn't: he came back not to the history he left, but through a
   184	new root, under a license that granted nothing, with his own name on the copyright for exactly as
   185	long as it took to transfer it to the company.
   186	
   187	## What it changed
   188	
   189	I want to be careful here, because git can only take you to the edge of this story. What the
   190	receipts prove is precise and strange: the man who wrote more than half of Redis removed *myself*
   191	from a count, went silent for 1,677 days, and returned as a brand-new origin whose first page said
   192	*All Rights Reserved* before it said *Redis Ltd.* What the receipts cannot prove is why any of it
   193	happened — the license fight that emptied the permissive terms out of the project, the community
   194	that forked the last freely-licensed version and carried the old contract forward under a new name,
   195	the negotiations that brought the founder back.
   196	<!-- CHECK: Redis's 2024 relicense drove the Linux Foundation's Valkey fork (launched March 2024); Redis returned to an open-source license (adding AGPLv3) in 2025 around the time of Sanfilippo's return; needs external source. --> Those
   197	live in blog posts and press releases, not in commits. But the shape the license leaves in the git
   198	tree is real, and it is the thing to carry away: when the terms under which code is shared become
   199	contested, the fight does not stay in the LICENSE file. It reaches back and rewrites what a
   200	"beginning" even is — a sixteen-year-old project acquires a second birthday, and the founder's
   201	return is recorded not as *welcome back* but as `First internal release.`
   202	
   203	## At home
   204	
   205	The habit this leaves you is to distrust the singular "first commit." When you inherit a repository
   206	— especially one that has been through an acquisition, a relicense, a corporate handoff — do not
   207	assume its history runs in one unbroken line back to one beginning. Ask git for *all* of its roots:
   208	
   209	```console
   210	$ git log --max-parents=0 --format='%H %aI %an %s' --all
   211	```
   212	
   213	Every parentless commit is a place where a history was *started* rather than *continued* — an
   214	import, a squash, a relicense, a fresh internal release dropped into an old project. Read the author
   215	and date on each one, then read the LICENSE file *at that exact commit*, not the one at the tip:
   216	`git show <root>:LICENSE`. The terms a project ships under today tell you where it landed. The terms
   217	at each root tell you the moment someone decided to start the clock over, and — if you read the
   218	copyright holder as carefully as the license — *whose* name held the rights at the instant of
   219	restarting, and how long that lasted. The most important word on the first page is often not the
   220	license. It is the name in front of it.
   221	
   222	## Receipts
   223	
   224	- **R1** `git -C repos/redis show -s --format='%s' 59fd178014c7...` — 2020-06-22, antirez: "Clarify maxclients and cluster in conf. Remove myself too." (2 files, 9 insertions, 1 deletion).
   225	- **R2** `git -C repos/redis show ... 59fd178014c7... -- redis.conf src/cluster.c` — the code: `getClusterConnectionsCount()` changes `dictSize(...)*2` to `(dictSize(...)-1)*2`, decrementing the `"myself"` node from the count.
   226	- **R3** `git -C repos/redis show -s ... ad0a9df77a2c...` — 2020-06-25: "Update comment to clarify change in #7398," his last pre-gap commit on HEAD (a parallel-history twin `14a59d4c...` shares the timestamp but is not on HEAD).
   227	- **R4** `git -C repos/redis log --all --author=... ` + `rev-list --count` + date arithmetic — zero antirez commits across 2021–2024; gap from 2020-06-25 to the 2025-01-27 root is 1,677 days 05:25:41.
   228	- **R5** `git -C repos/redis rev-list --count` + `shortlog -sne` + per-year counts — 7,188 of 13,257 HEAD commits are antirez (two bylines, one email); 400–800/year, 2009–2020.
   229	- **R6** `git -C repos/redis shortlog -sn` per year — 2020 topped by antirez; 2021 topped by Oran Agra with the founder absent; 2025 antirez back at 129.
   230	- **R7** `git -C repos/redis log --max-parents=0 HEAD` + `cat-file -p` + `show --root --shortstat` — four parentless roots; `33d653e2...` "First internal release." (antirez, 2025-01-27, no parent, 21 files / 7,058 insertions) beside the 2009 `first commit`.
 unsigned long getClusterConnectionsCount(void) {
+    /* We decrement the number of nodes by one, since there is the
+     * "myself" node too in the list. Each node uses two file descriptors,
+     * one incoming and one outgoing, thus the multiplication by 2. */
     return server.cluster_enabled ?
-           (dictSize(server.cluster->nodes)*2) : 0;
+           ((dictSize(server.cluster->nodes)-1)*2) : 0;
 }
 
   129	Oran Agra
    72	Yossi Gottlieb
    67	Binbin

exec
/bin/bash -lc "rg --files chapters | rg -i 'vim|07-|08-' | sort
sed -n '1,260p' chapters/07-vim.fable.md 2>/dev/null || true
sed -n '1,260p' chapters/08-vim.md 2>/dev/null || true" in /home/diablo/book16
 succeeded in 206ms:
chapters/0607-craft-review.md
chapters/07-agy-review.md
chapters/07-agy-review.stdout.md
chapters/07-codex-review.md
chapters/07-grok-review.md
chapters/07-review-prompt.md
chapters/07-vim.fable.md
chapters/07-vim.full.html
chapters/07-vim.html
chapters/07-vim.md
chapters/07-vim.reader.md
chapters/07-vim.receipts.md
chapters/08-agy-review.stdout.md
chapters/08-codex-review.md
chapters/08-costume.fable.md
chapters/08-costume.full.html
chapters/08-costume.html
chapters/08-costume.md
chapters/08-costume.reader.md
chapters/08-costume.receipts.md
chapters/08-grok-review.md
chapters/08-grok-review.stdout.md
chapters/08-review-prompt.md
# The current maintainer

On the evening of Friday, 7 July 2023, at 18:57, the maintainer of Vim closed a gap in his
editor's error numbering. The numbers E418 and E503 were unused, and he had found a use:

```console
$ git show -s --format='%s%n%b' 80adaa8ae8
patch 9.0.1673: cannot produce a status 418 or 503 message
Problem:    Cannot produce a status 418 or 503 message.
Solution:   Add err_teapot().
```

`E418: I'm a teapot`, says the new function, and — if you ask it nicely — `E503: Coffee is
currently not available`. [R2] The maintainer of one of the world's most-used programs, on a
Friday night, implementing a 1998 April Fools' RFC in his text editor, because the error number
was free and the joke was right there. Four and a half hours later, at 23:19, he files the next
patch: the new `err_teapot` entry has made a help-file list unalphabetical, and that will not
stand. [R3] He works past midnight — a test timing out under valgrind at 00:25, then, at 00:54,
patch 9.0.1676, renaming some buffers in a crypt test so a warning can be read properly. [R4]

Saturday passes without a commit. Then, at 02:38 on Sunday morning, he processes one item from
the queue — someone else's patch, a stranger fixing the spelling of "arguements" in a syntax test
file. He applies it, credits the author, ticks the version counter, patch 9.0.1677. [R5]

That is the last thing Bram Moolenaar ever did to Vim. He died twenty-five days later, on
3 August 2023 — the date is in the repository, and we will come to how it got there. Nothing in
those final five commits knows it is an ending. A teapot joke, an alphabetization, a valgrind
timeout, a buffer rename, a stranger's typo: the thirty-year authorship of one of the world's
most-used programs closes on a weekend indistinguishable from a thousand before it.

~ The last commit is never a speech.

This chapter is about what a succession looks like when the ledger has only ever held one name.

## One name

Run the org-chart question on Vim in decade windows and the answer does not need a table:

```console
$ git shortlog -sn HEAD --since=2004-01-01 --until=2011-01-01
  2649	Bram Moolenaar
$ git shortlog -sn HEAD --since=2011-01-01 --until=2019-01-01
  6517	Bram Moolenaar
```

Not the top row. The *only* row. [R6] From the day this repository begins — a 2004 import of an
editor already, by its own dedication, more than a decade into its life — through the end of
2018, every single commit is authored by one man. Nine thousand one hundred and sixty-six for
nine thousand one hundred and sixty-six.

Which would look like a project with no community, except for where the community actually is.
Vim's social contract was: you mail a patch; Bram reviews it, commits it as himself, and writes
your name into the message body. The author field says Bram; the *paragraph* says everyone. You
can measure the arrangement:

```console
$ git log --author='Bram Moolenaar' --grep='(Christian Brabandt)' --format='%h' | wc -l
404
```

Four hundred and four commits authored by Bram whose Solution line credits Christian Brabandt.
[R7] Hold on to that name. The git author field, read naively, says Vim's bus factor was 1 for
fifteen years. The bodies say there was a crowd — but a crowd on the other side of a mailbox,
with one man deciding, one man typing, one man ticking the counter in `src/version.c`. Both
things were true, and the difference between them is this whole story.

## The constitution

The one-name era cracks, once, in 2019, and the crack is instructive because of how fast it
closes. On 27 November, at 15:45, the first non-Bram author in the history of the repository
lands a commit — Christian Brabandt, adding nine lines of CI configuration, merged through a
GitHub pull request. At 21:57 the same evening, the change is reverted. [R8] Six hours. The
revert is not angry; nothing in it editorializes. It is a boundary, drawn the way Bram drew
everything: quietly, in the tree itself. Christian had the *permissions* to merge a PR. Permissions
were not the constitution.

And here is the receipt that turns those six hours into policy. Ask for every `Merge pull
request` in the entire history, oldest first:

```console
$ git log --reverse --grep='Merge pull request' --format='%ai %an %s' | head -3
2019-11-27  Christian Brabandt  Merge pull request #5273 from chrisbra/cirrus_ci
2019-11-27  Bram Moolenaar      Merge pull request #5275 from vim/revert-5273-cirrus_ci
2023-08-07  Christian Brabandt  Merge pull request #12740 from k-takata/import-9.0.1678
```

Three and a half years of silence between the second line and the third. [R8] The first PR ever
merged is the 2019 experiment; the second is Bram reverting it; the third is four days after his
death. The gap *is* the constitution — never written down, enforced by exactly one revert, and it
expired with its author.

Written down — actually, it was written down, once, in the most bureaucratic corner of the tree.
In January 2020 Bram added a LICENSE file, for the least romantic reason imaginable: `Problem:
Vim license not easy to find on github.` The license had lived in the help system for decades —
`:help uganda` — but GitHub's crawler does not run help commands, so he copied it into a root
file the website could see. [R9] And in it, this sentence:

```console
$ git show c838626fea:LICENSE | sed -n '24,25p'
          The current maintainer is Bram Moolenaar <Bram@vim.org>.  If this
          changes it will be announced in appropriate places (most likely
```

The license names one human being, and promises: *if this changes it will be announced.* [R9]
Read cold, it is boilerplate. Read from 2023, it is a clause about mortality, filed under
licensing, waiting.

## The bridge

Now the object I find most affecting in this repository, and it is a timestamp pair on a
housekeeping patch. When the succession's first numbered patch lands — 9.0.1679, Christian
Brabandt, cleanup of leftover test files — look at its two dates:

```console
$ git show -s --format='author    %an %aI%ncommitter %cn %cI' 84bc00e9b5
author    Christian Brabandt 2023-07-13T11:45:54+02:00
committer Christian Brabandt 2023-08-08T20:39:55+02:00
```

Authored 13 July. Committed 8 August. [R10] On 13 July, Bram is alive, five days past his teapot
weekend; Christian is debugging a problem in test files — files whose names trace to the crypt
rename in Bram's final authored patch. The work then waits where all his work had waited for
twenty years: in the queue, for Bram. It is still waiting there on 3 August. When Christian
finally commits it himself, five days after the death, the first act of the new era is not a
manifesto. It is unfinished business from the old maintainer's last week, carried across the gap
with its original date still on it.

## The announcement

The license had promised an announcement, and on 13 August 2023, ten days after his death, it
arrives — as commit `e978b4534a`, `Farewell to Bram and dedicate upcoming Vim 9.1 to him`,
merged, in the grammar Bram had reverted in 2019, as a GitHub pull request. [R11] Three files
tell the whole handover.

The LICENSE keeps its promise:

```diff
-          The current maintainer is Bram Moolenaar <Bram@vim.org>.  If this
+          The current maintainers are listed here: https://github.com/orgs/vim/people.
```

One human becomes an org URL. The README edits the gentlest line in the project:

```diff
-Send any other comments, patches, flowers and suggestions to:
-	Bram Moolenaar <Bram@vim.org>
+Send any other comments, patches, flowers and suggestions to the vim-dev mailing list:
+	<vim-dev@vim.org>
```

For thirteen years this file had carried a standing instruction to send one man flowers. [R13]
Now the flowers go to a mailing list. [R11] And the help system — the place Vim actually keeps
its soul — gains the sentence that puts his death date into the permanent record:

```console
$ git show e978b4534a:runtime/doc/version9.txt | sed -n '47,48p'
Vim version 9.1 is dedicated to Bram Moolenaar, who passed away on August 3rd 2023
while still working full-time on Vim.
```

*While still working full-time on Vim.* [R11] We watched that full time: it looked like a teapot
error and a sorted help file at midnight.

What the successors did next is, to me, the most Vim-shaped grief imaginable: they changed
almost nothing. The patch counter did not reset. The subject grammar — `patch 9.0.NNNN:` — did
not change. The Problem/Solution form survives in every commit, Christian's first included; the
new era adds only `Signed-off-by:` lines and PR numbers. [R12] Since the death, the author
column has become what it never was in life — a crowd, six names deep in the shortlog — but
every one of them files patches in a dead man's format, into a counter he started. [R12] They
kept the machine, because the machine was the man's actual monument, and because a
one-maintainer project survives exactly to the degree that its rituals turn out to be
detachable from its maintainer.

## At home

Two habits from this dig, and they point in opposite directions of the clock. Looking backward:
`--author` and `--committer` give you two different last days, and both matter — the last
authored commit is what the person still wanted to fix; the last committed one is the queue they
would not leave sitting. When you need to know how a project really made decisions, don't read
its governance file; ask `git log --reverse --grep='Merge pull request'` and read the gaps —
constitutions live in reverts and silences, not in documents. And looking at any project you
depend on: run the shortlog in windows and see whether the author column is a person or a
process. If it is a person, look — today, while it is a dull question — at where the project
writes down what happens next. Vim kept that answer in its license, one sentence long, for three
years before anyone needed it: *if this changes, it will be announced in appropriate places.* It
changed. It was announced. The flowers found a new address, and patch 9.0.1678 was followed by
patch 9.0.1679, authored before the world it landed in.

## Receipts

- **R1** `git log --committer='Bram' --format='%ci %an | %s' | head -5` — the final five: teapot (18:57 Fri), sorted help (23:19), valgrind (00:25), crypt rename (00:54), a stranger's typo (02:38 Sun).
- **R2** `git show 80adaa8ae8` — 2023-07-07 18:57, patch 9.0.1673, `err_teapot()`: E418 / E503.
- **R3** `git show 416bd916b4` — 23:19, patch 9.0.1674, the help list re-alphabetized.
- **R4** `git show -s --format=fuller 16abd997c9` — 00:54, patch 9.0.1676: the last commit Bram authored.
- **R5** `git show 4c0089d696` — 02:38, patch 9.0.1677: author THARAK HEGDE, committer Bram; "arguements" → "arguments".
- **R6** `git shortlog -sn HEAD --since/--until` decade windows — 2,649/2,649 and 6,517/6,517 Bram; first non-Bram author 2019-11-27 (Christian Brabandt, Cirrus CI).
- **R7** `git log --author='Bram Moolenaar' --grep='(Christian Brabandt)' | wc -l` — 404 Bram-authored commits crediting Christian in the body.
- **R8** `git log --reverse --grep='Merge pull request' | head -3` — 2019-11-27 add, 2019-11-27 revert (six hours), then nothing until 2023-08-07; revert stat: 2 files, 10 deletions.
- **R9** `git show c838626fea` + `:LICENSE` lines 24–25 — 2020-01-08, "Vim license not easy to find on github"; "The current maintainer is Bram Moolenaar… If this changes it will be announced."
- **R10** `git show -s 84bc00e9b5` — patch 9.0.1679: authored 2023-07-13, committed 2023-08-08 — the bridge across the death.
- **R11** `git show e978b4534a` — 2023-08-13, "Farewell to Bram": LICENSE maintainer line, README flowers line, version9.txt dedication ("passed away on August 3rd 2023 while still working full-time on Vim").
- **R12** `git log --reverse --committer='Christian Brabandt' --since=2023-08-03 | head -2` + `shortlog -sn --since=2023-08-03` — same grammar, counter unreset; the author column becomes a crowd (1,164 / 544 / 314 …).
- **R13** `git log --reverse -S 'flowers' -- README.txt | head -1` — the flowers line enters README.txt 2010-08-07.

*Full transcripts: `chapters/07-vim.receipts.md` (regenerate with `scripts/receipts-07.sh`).*

codex
Gate verdict: **FAIL**. Three console fences are not reproduce-true, and several passages claim more than the receipts establish.

1. **Fix the three broken console transcripts.**

   - The command at line 20 uses `sed -n '5,14p'`, but that range prints the hunk header and preceding comment, then stops before the closing brace. It does not produce the displayed excerpt. Use:

     ```console
     $ git -C repos/redis show --format= --no-ext-diff 59fd178014c7cca1b0c668b30ab0d991dd3030f3 -- src/cluster.c | sed -n '8,16p'
     ```

   - `"$ ... gap between 2020-06-25 and the next founder commit"` is not a command. Replace the entire fence with the exact R4 date-arithmetic command and its three output lines (`from`, `to`, `gap`).

   - The 2021 shortlog command as printed returns **128 Oran Agra**, not 129, because its loose date boundaries admit a timezone-edge difference. Use the receipt’s UTC bounds:

     ```console
     $ git -C repos/redis shortlog -sn HEAD --since='2021-01-01T00:00:00Z' --until='2022-01-01T00:00:00Z' | head -3
        129	Oran Agra
         72	Yossi Gottlieb
         67	Binbin
     ```

   The other displayed fences reproduce correctly.

2. **Do not turn commit counts into claims about how much code he wrote.**

   The opening says Sanfilippo “had written most of Redis”; the ending says “the man who wrote more than half of Redis.” R5 proves that his email authored 7,188 of 13,257 HEAD commits, not that he wrote more than half the surviving code.

   Fix both to something like: “the person behind more than half of Redis’s HEAD commits.”

   For the same reason, replace “without its founder touching a line” with “without a founder-authored commit,” and “the last thing antirez does to the main line” with “his last pre-gap commit on HEAD.”

3. **Correct or remove unsupported factual claims.**

   - “sits behind a large share of the internet’s fast-moving data” appears nowhere in the receipts and has no CHECK marker. Remove it or mark and source it.
   - “four, six, seven hundred commits a year, every year” contradicts R5: the yearly range is **302–865**. The R5 summary’s own “400–800/year” is also wrong and must be corrected.
   - “for the first time in the project’s life” is not proved by the displayed yearly evidence. Change it to: “In 2021, the most active author was Oran Agra.”
   - “shipping, patched, growing, for four years” is not established by the receipts. Either add yearly activity/release receipts or say only that commits continued under other authors.
   - “five years … after the first” is grammatically false if “the first” means the 2009 root. Write: “five years after his departure and nearly sixteen years after the original root.”
   - “For sixteen years Redis had been permissively licensed” conflicts with the marked 2009–2024 interval. Use “from 2009 until the 2024 relicense.”

4. **Identify what the second root actually contains.**

   “A project starting over from nothing” and “the founder came back as a new origin” invite the reader to believe Sanfilippo rebuilt all of Redis in a parentless commit. R10 shows that this was the orphan history later subtree-joined as `modules/vector-sets/`.

   State that plainly before interpreting it: “This is not a second copy of Redis core; it is the independent history of the Vector Sets module, later joined into Redis.” The second-genesis argument still works, but only as a new root imported into Redis’s graph.

5. **Remove the legal assignment story that git cannot prove.**

   These lines cross the explicit boundary:

   - “the line that got handed to the company”
   - “folded into a corporate asset”
   - “as long as it took to transfer it to the company”
   - “whose name held the rights”

   The diff proves only that the LICENSE’s named copyright holder changed. It does not prove a transfer, assignment, ownership history, employment arrangement, or the legal reason for the edit.

   Replace the whole interpretation with something like: “For five weeks the LICENSE named Salvatore Sanfilippo; then one commit replaced that name with Redis Ltd. Git records the textual change, not the legal arrangement behind it.”

   Likewise, “begins as his, reserved, personal” and “personal claim” should become “begins with his name in the copyright line.”

6. **Repair the four CHECK markers.**

   - **2020 step-down:**  
     **Necessary:** Yes; git proves absence, not the public decision.  
     **Accurately scoped:** Not quite. The prose claims motive—“he no longer wanted to be a maintainer”—while the marker asks only for evidence that he stepped down. Conversely, “handing … stewardship to a team backed by Redis Labs” is broader than the prose needs. Scope it to the announcement, his stated reason, effective role, and recipient of stewardship.

   - **2024 relicense/Valkey:**  
     **Necessary:** Yes; this context makes the license diff consequential.  
     **Accurately scoped:** Mostly, but it combines two later uses. It needs evidence for the exact old and new licenses, March 2024 timing, the fork’s relationship to the last BSD version, and the causal wording “drove.” If causation cannot be sourced directly, write “was followed by,” not “drove.”

   - **Original BSD terms:**  
     **Necessary:** Yes.  
     **Accurately scoped:** No. It requests a source only for the original BSD terms while also making the legal claim that “All Rights Reserved” means “no permissions granted.” Either source both propositions authoritatively or avoid the absolute legal gloss. “The two-line file contains no express license grant” is narrower and visible in the receipt.

   - **Valkey plus 2025 AGPL return:**  
     **Necessary:** Yes, if retained as the real-world consequence.  
     **Accurately scoped:** No. It introduces the AGPL change, which the prose never explains, but does not cover the prose’s stronger claim about “negotiations that brought the founder back.” Remove that causal claim unless directly sourced. Then use the verified AGPL change as the concrete ending to the license arc.

7. **Move the reveal so the reader sees it before the narrator names it.**

   The intended turn is currently announced repeatedly:

   - “he will not commit again for four and a half years”
   - “That is the world the founder returns to”
   - the heading “The second genesis”
   - “The founder came back” before the post-merge commit

   Let the roots command make the turn. The reader should see `antirez First internal release.` at the top, recognize the name, and then hear the narrator call it a return. Use a neutral heading before the command and remove the earlier promises of return.

8. **Make the license fight legible without invisible comments.**

   At present, the CHECK-marked material is load-bearing: without it, the reader sees an orphan module, an all-rights-reserved LICENSE, and a changed holder name, but not why any of this mattered to Redis users.

   Add one concise, sourced paragraph explaining the sequence in plain language: BSD terms → 2024 source-available relicense → Valkey fork → 2025 AGPL addition. Then distinguish that public history from what the git graph itself proves. This also supplies the real-world consequence the professional-SDE calibration demands.

9. **Bring the prose-only body into range.**

   Excluding CHECK comments and the Receipts section, the body is **2,044 words**, 156 below the 2,200–3,200 band. Including the invisible comments gives 2,186, but those do not count under `CONTEXT.md`.

   Do not pad “The four years.” Compress its generic bus-factor commentary, then spend roughly 250–300 words on the Vector Sets identity, the verified license sequence, and concrete consequence. That should produce a net body just over 2,200.

Optional suggestions:

- The pun opening is honest and effective because “I cannot prove it was intended” arrives immediately. Keep it. What becomes too cute is the repetition: “the countdown he wrote … ran on the project itself” and “the gap he opened” turn coincidence into agency. Cut those two flourishes.
- The protagonist does hold across the five acts; Oran Agra remains evidence, not a competing protagonist. The middle nevertheless sags because “The four years” offers generic succession commentary. One short bridge paragraph is enough.
- Distinctness from Vim is available but not fully protected. “The one-name project,” the bus-factor discussion, and the succession question closely echo Vim’s “One name” chapter. Redis becomes distinct at the voluntary departure, orphan Vector Sets root, license mutation, and return. Get there sooner.
- The title flips cleanly from a code comment into departure, but the return does not complete the reversal. A restrained closing echo could do it: the author count resumes, while the new root shows the route by which he returned. Avoid another full repetition of the pun.
- The narrator is almost absent until “I want to be careful here.” Add one or two engineer-specific first-person judgments around discovering multiple roots and reading historical LICENSE files; that will better match the book’s established voice without adding another storyline.
tokens used
43,458
Gate verdict: **FAIL**. Three console fences are not reproduce-true, and several passages claim more than the receipts establish.

1. **Fix the three broken console transcripts.**

   - The command at line 20 uses `sed -n '5,14p'`, but that range prints the hunk header and preceding comment, then stops before the closing brace. It does not produce the displayed excerpt. Use:

     ```console
     $ git -C repos/redis show --format= --no-ext-diff 59fd178014c7cca1b0c668b30ab0d991dd3030f3 -- src/cluster.c | sed -n '8,16p'
     ```

   - `"$ ... gap between 2020-06-25 and the next founder commit"` is not a command. Replace the entire fence with the exact R4 date-arithmetic command and its three output lines (`from`, `to`, `gap`).

   - The 2021 shortlog command as printed returns **128 Oran Agra**, not 129, because its loose date boundaries admit a timezone-edge difference. Use the receipt’s UTC bounds:

     ```console
     $ git -C repos/redis shortlog -sn HEAD --since='2021-01-01T00:00:00Z' --until='2022-01-01T00:00:00Z' | head -3
        129	Oran Agra
         72	Yossi Gottlieb
         67	Binbin
     ```

   The other displayed fences reproduce correctly.

2. **Do not turn commit counts into claims about how much code he wrote.**

   The opening says Sanfilippo “had written most of Redis”; the ending says “the man who wrote more than half of Redis.” R5 proves that his email authored 7,188 of 13,257 HEAD commits, not that he wrote more than half the surviving code.

   Fix both to something like: “the person behind more than half of Redis’s HEAD commits.”

   For the same reason, replace “without its founder touching a line” with “without a founder-authored commit,” and “the last thing antirez does to the main line” with “his last pre-gap commit on HEAD.”

3. **Correct or remove unsupported factual claims.**

   - “sits behind a large share of the internet’s fast-moving data” appears nowhere in the receipts and has no CHECK marker. Remove it or mark and source it.
   - “four, six, seven hundred commits a year, every year” contradicts R5: the yearly range is **302–865**. The R5 summary’s own “400–800/year” is also wrong and must be corrected.
   - “for the first time in the project’s life” is not proved by the displayed yearly evidence. Change it to: “In 2021, the most active author was Oran Agra.”
   - “shipping, patched, growing, for four years” is not established by the receipts. Either add yearly activity/release receipts or say only that commits continued under other authors.
   - “five years … after the first” is grammatically false if “the first” means the 2009 root. Write: “five years after his departure and nearly sixteen years after the original root.”
   - “For sixteen years Redis had been permissively licensed” conflicts with the marked 2009–2024 interval. Use “from 2009 until the 2024 relicense.”

4. **Identify what the second root actually contains.**

   “A project starting over from nothing” and “the founder came back as a new origin” invite the reader to believe Sanfilippo rebuilt all of Redis in a parentless commit. R10 shows that this was the orphan history later subtree-joined as `modules/vector-sets/`.

   State that plainly before interpreting it: “This is not a second copy of Redis core; it is the independent history of the Vector Sets module, later joined into Redis.” The second-genesis argument still works, but only as a new root imported into Redis’s graph.

5. **Remove the legal assignment story that git cannot prove.**

   These lines cross the explicit boundary:

   - “the line that got handed to the company”
   - “folded into a corporate asset”
   - “as long as it took to transfer it to the company”
   - “whose name held the rights”

   The diff proves only that the LICENSE’s named copyright holder changed. It does not prove a transfer, assignment, ownership history, employment arrangement, or the legal reason for the edit.

   Replace the whole interpretation with something like: “For five weeks the LICENSE named Salvatore Sanfilippo; then one commit replaced that name with Redis Ltd. Git records the textual change, not the legal arrangement behind it.”

   Likewise, “begins as his, reserved, personal” and “personal claim” should become “begins with his name in the copyright line.”

6. **Repair the four CHECK markers.**

   - **2020 step-down:**  
     **Necessary:** Yes; git proves absence, not the public decision.  
     **Accurately scoped:** Not quite. The prose claims motive—“he no longer wanted to be a maintainer”—while the marker asks only for evidence that he stepped down. Conversely, “handing … stewardship to a team backed by Redis Labs” is broader than the prose needs. Scope it to the announcement, his stated reason, effective role, and recipient of stewardship.

   - **2024 relicense/Valkey:**  
     **Necessary:** Yes; this context makes the license diff consequential.  
     **Accurately scoped:** Mostly, but it combines two later uses. It needs evidence for the exact old and new licenses, March 2024 timing, the fork’s relationship to the last BSD version, and the causal wording “drove.” If causation cannot be sourced directly, write “was followed by,” not “drove.”

   - **Original BSD terms:**  
     **Necessary:** Yes.  
     **Accurately scoped:** No. It requests a source only for the original BSD terms while also making the legal claim that “All Rights Reserved” means “no permissions granted.” Either source both propositions authoritatively or avoid the absolute legal gloss. “The two-line file contains no express license grant” is narrower and visible in the receipt.

   - **Valkey plus 2025 AGPL return:**  
     **Necessary:** Yes, if retained as the real-world consequence.  
     **Accurately scoped:** No. It introduces the AGPL change, which the prose never explains, but does not cover the prose’s stronger claim about “negotiations that brought the founder back.” Remove that causal claim unless directly sourced. Then use the verified AGPL change as the concrete ending to the license arc.

7. **Move the reveal so the reader sees it before the narrator names it.**

   The intended turn is currently announced repeatedly:

   - “he will not commit again for four and a half years”
   - “That is the world the founder returns to”
   - the heading “The second genesis”
   - “The founder came back” before the post-merge commit

   Let the roots command make the turn. The reader should see `antirez First internal release.` at the top, recognize the name, and then hear the narrator call it a return. Use a neutral heading before the command and remove the earlier promises of return.

8. **Make the license fight legible without invisible comments.**

   At present, the CHECK-marked material is load-bearing: without it, the reader sees an orphan module, an all-rights-reserved LICENSE, and a changed holder name, but not why any of this mattered to Redis users.

   Add one concise, sourced paragraph explaining the sequence in plain language: BSD terms → 2024 source-available relicense → Valkey fork → 2025 AGPL addition. Then distinguish that public history from what the git graph itself proves. This also supplies the real-world consequence the professional-SDE calibration demands.

9. **Bring the prose-only body into range.**

   Excluding CHECK comments and the Receipts section, the body is **2,044 words**, 156 below the 2,200–3,200 band. Including the invisible comments gives 2,186, but those do not count under `CONTEXT.md`.

   Do not pad “The four years.” Compress its generic bus-factor commentary, then spend roughly 250–300 words on the Vector Sets identity, the verified license sequence, and concrete consequence. That should produce a net body just over 2,200.

Optional suggestions:

- The pun opening is honest and effective because “I cannot prove it was intended” arrives immediately. Keep it. What becomes too cute is the repetition: “the countdown he wrote … ran on the project itself” and “the gap he opened” turn coincidence into agency. Cut those two flourishes.
- The protagonist does hold across the five acts; Oran Agra remains evidence, not a competing protagonist. The middle nevertheless sags because “The four years” offers generic succession commentary. One short bridge paragraph is enough.
- Distinctness from Vim is available but not fully protected. “The one-name project,” the bus-factor discussion, and the succession question closely echo Vim’s “One name” chapter. Redis becomes distinct at the voluntary departure, orphan Vector Sets root, license mutation, and return. Get there sooner.
- The title flips cleanly from a code comment into departure, but the return does not complete the reversal. A restrained closing echo could do it: the author count resumes, while the new root shows the route by which he returned. Avoid another full repetition of the pun.
- The narrator is almost absent until “I want to be careful here.” Add one or two engineer-specific first-person judgments around discovering multiple roots and reading historical LICENSE files; that will better match the book’s established voice without adding another storyline.
