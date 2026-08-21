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
