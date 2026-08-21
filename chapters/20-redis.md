# Remove myself too

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [Remove myself too](20-redis.html).*

On the 22nd of June, 2020, the most prolific author in the history of Redis — the in-memory
database — committed a small documentation tidy-up and one tiny code change. The commit subject is
ordinary housekeeping with a second sentence bolted on [R1]:

```console
$ git -C repos/redis show -s --format='%s' 59fd178014c7cca1b0c668b30ab0d991dd3030f3
Clarify maxclients and cluster in conf. Remove myself too.
```

*Remove myself too.* Read the code it ships and the sentence is a plain technical note — one of
those changes so small it barely earns a commit [R2]:

```console
$ git -C repos/redis show --format= --no-ext-diff 59fd178014c7cca1b0c668b30ab0d991dd3030f3 -- src/cluster.c | sed -n '8,15p'
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
the machine you are standing on — the node the code literally calls `"myself"`. When you count the
cluster's network connections, you should not count a connection to yourself. So the fix subtracts
one. Remove the "myself" node from the tally. *Remove myself too.*

It is a pun, and I cannot prove it was intended — git records the subject line and the diff, not
the state of mind behind them. But hold the two halves side by side. The man writing this is
Salvatore Sanfilippo, who signs his commits *antirez*. Within days he will stop committing to
Redis, and he will not commit again for four and a half years. Of all the sentences to leave on
the way out, the ledger caught this one: a maintainer subtracting *myself* from the count of who
is present.

## The one-name project

To feel the departure you have to feel the scale of the presence. Ask the ledger who wrote Redis's
commits, and the answer is not a committee [R5]:

```console
$ git -C repos/redis shortlog -sne HEAD | head -4
  6128	antirez <antirez@gmail.com>
  1060	Salvatore Sanfilippo <antirez@gmail.com>
   546	Oran Agra <oran@redislabs.com>
   510	Pieter Noordhuis <pcnoordhuis@gmail.com>
```

The top two lines are the same person — one email address, two spellings of the same human, the
casual handle and the legal name. Add them together and Salvatore is behind 7,188 of the
project's 13,257 commits [R5]: more than half, more than the other 1,500-odd contributors'
commits put together. And the yearly counts read like a pulse — never fewer than 302 commits a
year (the 2017 dip), as many as 865 (2014), every single year from 2009 through 2020 [R5]. This
is not a founder who wrote the first version and moved to management. This is the hand still on
the keys eleven years in.

Three days after "Remove myself too," on June 25th, that hand files one more comment
clarification — and that is his last pre-gap commit on the main line [R3]. That same week he
published a post titled "The end of the Redis adventure": he was stepping down as maintainer — *"I
never wanted to be a software maintainer,"* he wrote — handing the daily work to others.
<!-- VERIFIED: "The end of the Redis adventure," antirez.com, 2020-06-30 — Sanfilippo stepped down as Redis maintainer ("I never wanted to be a software maintainer"), handing maintenance to Yossi Gottlieb and Oran Agra at Redis Labs. https://antirez.com/news/133 and https://www.theregister.com/2020/06/30/redis_creator_antirez_quits/ -->
The ledger does not record the reasons; it records the result, and you can measure it exactly
[R4]:

```console
$ start=$(git -C repos/redis show -s --format=%aI ad0a9df77a2ccf3fdf309dcdd1b54cf350fcbe3c); end=$(git -C repos/redis show -s --format=%aI 33d653e24f03adadf469dc1627e15e76580f68b5); seconds=$(( $(date -d "$end" +%s) - $(date -d "$start" +%s) )); printf "from %s\nto   %s\ngap  %d days %02d:%02d:%02d\n" "$start" "$end" "$((seconds/86400))" "$(((seconds%86400)/3600))" "$(((seconds%3600)/60))" "$((seconds%60))"
from 2020-06-25T12:58:21+02:00
to   2025-01-27T17:24:02+01:00
gap  1677 days 05:25:41
```

One thousand six hundred and seventy-seven days. Across the calendar years 2021, 2022, 2023, and
2024, the number of commits antirez made to Redis is zero [R4].

## The four years

What happens to a project when the person behind half its commits walks away? The receipts show
the thing that is supposed to happen and so rarely does: it kept going. Look at the year the
handover completes [R6]:

```console
$ git -C repos/redis shortlog -sn HEAD --since=2021-01-01T00:00:00Z --until=2022-01-01T00:00:00Z | head -3
   129	Oran Agra
    72	Yossi Gottlieb
    67	Binbin
```

In 2020, antirez had still topped the year. In 2021 the most active author is Oran Agra — one of
the two people the farewell post had named — and the founder is nowhere in the year's list. The
crowd that had always worked in the one name's shadow kept committing, year after year, without a
single founder-authored commit among them [R4, R6].

And then, in the fourth year of the silence, the ground under the project moved — and this time
the tree itself records it [R13]:

```console
$ git -C repos/redis show -s --format='%H%nAuthor: %aI %an <%ae>%nSubject: %s' 0b34396924eca4edc524469886dc5be6c77ec4ed
0b34396924eca4edc524469886dc5be6c77ec4ed
Author: 2024-03-20T22:38:24+00:00 Pieter Cailliau <pieter@redis.com>
Subject: Change license from BSD-3 to dual RSALv2+SSPLv1 (#13157)
```

March 20th, 2024: the company stewarding Redis moved the project off the permissive BSD terms it
had carried since the very first commit — the 2009 root's `COPYING` opens with Salvatore's
copyright and the classic "Redistribution and use … are permitted" grant [R12] — onto a dual
source-available license. Fifteen years of one social contract, changed in one commit. Within
days, a group of contributors and companies forked the last permissively-licensed version and
carried the old contract forward under a new name, at the Linux Foundation.
<!-- VERIFIED: Linux Foundation announced Valkey on 2024-03-28, a BSD-3 fork of Redis 7.2.4 created in response to the March 2024 RSALv2/SSPLv1 relicense, backed by AWS, Google Cloud, Oracle, Ericsson and others. https://www.linuxfoundation.org/press/linux-foundation-launches-open-source-valkey-community -->
That is the world in which what happens next happens.

## Four roots

Most projects have exactly one first commit. Ask this repository for its parentless roots — the
commits with no history behind them — and it has four [R7]:

```console
$ git -C repos/redis log --max-parents=0 HEAD --format='%H %aI %an %s'
33d653e24f03adadf469dc1627e15e76580f68b5 2025-01-27T17:24:02+01:00 antirez First internal release.
220a0f0880419450c9409202aac1fab4b8be0719 2021-10-10T18:26:48+03:00 Yoav Steinberg Squashed 'deps/jemalloc/' content from commit 886e40bb3
7ee5a41aac7e5abc90d050fa509fa953ca7f1da1 2020-08-06T12:41:58-07:00 michael-grunder Squashed 'deps/hiredis/' content from commit 39de5267c
ed9b544e10b84cd43348ddfab7068b610a5df1f7 2009-03-22T10:30:00+01:00 antirez first commit
```

The middle two are imported histories of bundled dependencies — ordinary plumbing. But look at the
outer two, and at their authors. The bottom one, March 2009, is the beginning: `first commit`, by
antirez. The top one, January 27th, 2025, is by antirez too — a *second* parentless beginning,
nearly sixteen years after the first and 1,677 days into the silence. Its subject is `First
internal release.` — the language of something starting from scratch — and it plants twenty-one
files and 7,058 lines in a single stroke [R7].

Let me say precisely what it is, because the shortstat invites a grander reading. This is not a
second copy of Redis. It is the independent history of a new *module* — the code that a few
weeks later is subtree-joined into the tree as `modules/vector-sets/` [R10]. But that precision
makes the object stranger, not smaller: the founder's return to his own project enters the graph
not as a commit on the history he left, but as a fresh origin — authored in private, numbered
from one, and stitched in afterwards. The ledger's four-root answer is permanent now. Redis has
two beginnings by the same man, sixteen years apart.

And the first page of the second beginning is the part you should read the way you would read
the opening line of a will. The complete LICENSE file at that root [R8]:

```console
$ git -C repos/redis show 33d653e24f03adadf469dc1627e15e76580f68b5:LICENSE
This code is Copyright (C) 2024-2025 Salvatore Sanfilippo.
All Rights Reserved.
```

Two lines. Set them against the 2009 root's `COPYING`, with its permitted-redistribution grant
[R12]: the man whose project's first page once said *use this freely* returns, mid-license-war,
with a first page that grants nothing at all — and the name on it is not a company's. It is his
own.

That lasts five weeks. On March 3rd, 2025, one commit changes the line [R9]:

```console
$ git -C repos/redis show --no-ext-diff --format= afcc2ff6e8832dc0621fe4b90e4dae6152b0d0a8 -- LICENSE | sed -n '6,8p'
-This code is Copyright (C) 2024-2025 Salvatore Sanfilippo.
+This code is Copyright (c) 2024-Present, Redis Ltd.
 All Rights Reserved.
```

The subject is `LICENSE: change copyright to Redis Ltd.` [R9]. Watch exactly what moves and what
stays. The *name on the holder line* changes — Salvatore's is replaced by the company's. The
*terms* do not: `All Rights Reserved` sits there through both versions, untouched. Git records
the textual change, not the legal arrangement behind it — a two-line file is not a contract
archive. But the sequence it preserves is eloquent enough: for five weeks the founder's return
bore his own name; then it bore the company's.

## The return

For two months the second root lived off to the side, its own parentless line. On April 2nd,
2025, it was subtree-joined and merged into `unstable` — the branch that had run without the
founder for four years — and the old history and the new root became one tree [R10]. A week
later [R11]:

```console
$ git -C repos/redis show -s --format='Author: %an <%ae>%nDate: %aI%nSubject: %s' 96a0cfdea27fa28f93b8071ec1b3c6ef8b315298
Author: Salvatore Sanfilippo <antirez@gmail.com>
Date: 2025-04-09T13:39:33+02:00
Subject: Vectror Sets: build fixes for the w2v test (#13919)
```

The hand is back on the keys — under the full legal name now, with a typo in his own commit
subject, and by year's end at well over a hundred commits again [R11]. The founder returned. But
the ledger is exact about the route: not a continuation of the history he left — a new origin,
carrying a first page that granted nothing, whose holder line was his for five weeks and the
company's after.

## What it proves, and what it doesn't

I want to be careful here, because git takes you to the edge of this story and no further. What
the receipts prove is strange enough on its own: the man behind more than half of a database's
commits subtracted *myself* from a count, went silent for 1,677 days while the license his
project was born under was replaced in one commit, and came back as a brand-new root whose first
page said *All Rights Reserved* — first over his name, then over the company's. What the
receipts cannot prove is any of the *why*: the fights, the fork, whatever conversations preceded
the return. Those live in blog posts and press releases. But the shape the era leaves in the
tree is real, and it is the thing to carry away: when the terms a project is shared under become
contested, the fight does not stay in the LICENSE file. It reaches back into the topology of the
history itself — a sixteen-year-old repository acquires a second birthday, and the founder's
return is filed under `First internal release.`

## At home

The habit this leaves you is to distrust the singular "first commit." When you inherit a
repository — especially one that has been through an acquisition, a relicense, a corporate
handoff — ask git for *all* of its roots:

```console
$ git log --max-parents=0 --format='%H %aI %an %s' --all
```

Every parentless commit is a place where a history was *started* rather than continued — an
import, a squash, a fresh line dropped into an old project. Read the author and date on each.
Then read the LICENSE *at that exact commit*, not at the tip: `git show <root>:LICENSE`. The
terms at the tip tell you where the project landed; the terms at each root tell you the moment
someone decided to start a clock over — and if you read the holder line as carefully as the
terms, whose name was on the door when they did. The most important word on a first page is
often not the license at all. It is the name in front of it.

## Receipts

- **R1** `git -C repos/redis show -s --format='%s' 59fd178014c7...` — 2020-06-22, antirez: "Clarify maxclients and cluster in conf. Remove myself too." (2 files, 9 insertions, 1 deletion).
- **R2** `git -C repos/redis show ... 59fd178014c7... -- src/cluster.c | sed -n '8,15p'` — `getClusterConnectionsCount()`: `dictSize(...)*2` becomes `(dictSize(...)-1)*2`, decrementing the `"myself"` node.
- **R3** `git -C repos/redis show -s ... ad0a9df77a2c...` — 2020-06-25: his last pre-gap commit on HEAD (a parallel-history twin `14a59d4c...` shares the timestamp but is not on HEAD).
- **R4** `git -C repos/redis log --all --author=...` + `rev-list --count` + the printf date arithmetic — zero antirez commits across 2021–2024; the gap from 2020-06-25 to the 2025-01-27 root is 1,677 days 05:25:41.
- **R5** `rev-list --count` + `shortlog -sne` + per-year counts — 7,188 of 13,257 HEAD commits under one email, two bylines; yearly counts 302 (2017) to 865 (2014), every year 2009–2020.
- **R6** `shortlog -sn HEAD --since=2021-01-01T00:00:00Z --until=2022-01-01T00:00:00Z` — 2021 topped by Oran Agra (129), the founder absent.
- **R7** `git -C repos/redis log --max-parents=0 HEAD` + `rev-list --parents` + `show --root --shortstat` — four parentless roots; `33d653e2...` "First internal release." (antirez, 2025-01-27, 21 files / 7,058 insertions) beside the 2009 `first commit`.
- **R8** `git -C repos/redis show 33d653e2...:LICENSE` — the complete file: "This code is Copyright (C) 2024-2025 Salvatore Sanfilippo. / All Rights Reserved."
- **R9** `git -C repos/redis show ... afcc2ff6e8... -- LICENSE | sed -n '6,8p'` — 2025-03-03, "LICENSE: change copyright to Redis Ltd.": the holder line changes; `All Rights Reserved` unchanged.
- **R10** `git -C repos/redis show ... 78e0d871... 5e7333d2...` + `merge-base --is-ancestor` — 2025-04-02: "Add 'modules/vector-sets/' from commit 'c6db0a7c...'"; the orphan line subtree-joined and merged into `unstable`; the root is an ancestor of the merge.
- **R11** `git -C repos/redis log --reverse --author=... 5e7333d2..HEAD` + per-year byline counts — 2025-04-09: first post-merge founder commit, authored "Salvatore Sanfilippo"; 129 antirez + 17 Salvatore commits in 2025.
- **R12** `git -C repos/redis show ed9b544e10...:COPYING | head -5` — the 2009 root's license: "Copyright (c) 2006-2009, Salvatore Sanfilippo … Redistribution and use … are permitted" (BSD terms).
- **R13** `git -C repos/redis show -s ... 0b34396924ec...` — 2024-03-20, Pieter Cailliau: "Change license from BSD-3 to dual RSALv2+SSPLv1 (#13157)."
