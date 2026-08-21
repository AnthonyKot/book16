# Remove myself too

On the 22nd of June, 2020, the most prolific author in the history of Redis — the in-memory
database — committed a small tidy-up whose subject line reads, in full: *"Clarify maxclients and
cluster in conf. Remove myself too."*

Read the code and the second sentence is a dry technical note. In a Redis cluster, every machine
keeps a list of all the machines, and that list includes an entry for the one you are standing on
— the node the code literally calls `"myself"`. When counting the cluster's network connections,
you shouldn't count a connection to yourself. So the fix subtracts one from the tally. Remove the
"myself" node. *Remove myself too.*

It is a pun, and I cannot prove it was intended — git records subject lines and diffs, not states
of mind. But hold the two halves side by side. The man writing it is Salvatore Sanfilippo, who
signs his commits *antirez*. Within days he will stop committing to Redis, and he will not commit
again for four and a half years. Of all the sentences to leave on the way out, the ledger caught
this one: a maintainer subtracting *myself* from the count of who is present.

## The one-name project

To feel the departure you have to feel the scale of the presence. Ask the ledger who wrote
Redis's commits and the answer is barely a list: one email address — appearing under both
"antirez" and "Salvatore Sanfilippo" — accounts for 7,188 of the project's 13,257 commits. More
than half. More than the other 1,500-odd contributors put together. The yearly counts read like
a pulse: from about three hundred commits in the quietest year to nearly nine hundred in the
busiest, every single year from 2009 through 2020. This is not a founder who wrote version one
and moved to management. This is the hand still on the keys eleven years in.

Three days after "Remove myself too," he filed one more small comment fix — his last commit on
the main line for a very long time. That same week he published a farewell post titled "The end
of the Redis adventure": he was stepping down as maintainer — *"I never wanted to be a software
maintainer,"* he wrote — and handing the daily work to others.
<!-- VERIFIED: "The end of the Redis adventure," antirez.com, 2020-06-30 — Sanfilippo stepped down as Redis maintainer ("I never wanted to be a software maintainer"), handing maintenance to Yossi Gottlieb and Oran Agra at Redis Labs. https://antirez.com/news/133 and https://www.theregister.com/2020/06/30/redis_creator_antirez_quits/ -->
The ledger doesn't record reasons. It records results, and the result is measurable to the
second: one thousand six hundred and seventy-seven days of silence. Across 2021, 2022, 2023, and
2024, the number of commits antirez made to Redis is zero.

## The four years

What happens when the person behind half a project's commits walks away? The thing that is
supposed to happen and so rarely does: it kept going. In 2021, for the first year on record, the
most active author is someone else — Oran Agra, one of the two people the farewell post had
named — and the founder is nowhere in the year's list. The crowd that had always worked in the
one name's shadow kept the database shipping for four years without a single founder commit.

Then, in the fourth year of the silence, the ground moved — and the tree itself records it. In
March 2024, a one-commit change titled "Change license from BSD-3 to dual RSALv2+SSPLv1" moved
Redis off the permissive license it had carried since its first day. Fifteen years of one social
contract — the 2009 root's license file literally opens with Salvatore's name and the words
"redistribution and use … are permitted" — ended in a single commit. Within days, contributors
and companies forked the last permissively-licensed version and carried the old contract forward
under a new name, at the Linux Foundation.
<!-- VERIFIED: Linux Foundation announced Valkey on 2024-03-28, a BSD-3 fork of Redis 7.2.4 created in response to the March 2024 RSALv2/SSPLv1 relicense, backed by AWS, Google Cloud, Oracle, Ericsson and others. https://www.linuxfoundation.org/press/linux-foundation-launches-open-source-valkey-community -->
That is the world in which what happens next happens.

## Four roots

Most projects have exactly one first commit. Ask this repository for its parentless beginnings —
commits with no history behind them — and it has four. Two are boring: imported histories of
bundled dependencies. But look at the outer two. The oldest, March 2009: `first commit`, by
antirez. And the newest, January 27th, 2025: also by antirez — a *second* parentless beginning,
nearly sixteen years after the first and 1,677 days into his silence, titled `First internal
release.` Twenty-one files, seven thousand lines, planted in one stroke, with no parent.

Precision matters here: this is not a second copy of Redis. It is the independent history of a
new module — vector sets — which was stitched into the main tree a few weeks later. But the
precision makes it stranger, not smaller. The founder's return to his own project enters the
record not as a commit on the history he left, but as a fresh origin: authored in private,
numbered from one, joined in afterwards. Redis now has two beginnings, by the same man, sixteen
years apart.

And the first page of the second beginning deserves to be read the way you'd read the opening
line of a will. The complete license file at that new root:

> This code is Copyright (C) 2024-2025 Salvatore Sanfilippo.
> All Rights Reserved.

Two lines. The man whose project's first page once said *use this freely* returns, mid-license-
war, with a first page that grants nothing at all — and the name on it is not a company's. It is
his own.

That lasts five weeks. In March 2025, one commit — "LICENSE: change copyright to Redis Ltd." —
edits the file. Watch exactly what moves and what stays. The *name on the holder line* changes:
Salvatore's out, the company's in. The *terms* do not: "All Rights Reserved" sits untouched
through both versions. Git records the textual change, not the legal arrangement behind it. But
the sequence it preserves says enough: for five weeks the founder's return bore his own name,
and then it bore the company's.

## The return

In April 2025 the new root was merged into the main line — the branch that had run without him
for four years — and a week later the founder was committing again as an ordinary contributor,
under his full legal name now, typo in his own subject line and all. By year's end he was back
over a hundred commits. He returned. But the ledger is exact about the route: not a continuation
of the history he left — a new origin, carrying a first page that granted nothing, his for five
weeks, the company's after.

## What it proves, and what it doesn't

Git takes you to the edge of this story and no further. It proves the strange shape: a man
subtracts *myself* from a count and goes silent for 1,677 days; the license his project was born
under is replaced in one commit; he comes back as a brand-new beginning whose first page says
*All Rights Reserved* — over his name, then over the company's. It proves nothing about the why
— the fights, the fork, whatever led to the return. Those live in blog posts and press releases.
What's worth carrying away is the shape itself: when the terms a project is shared under become
contested, the fight does not stay in the LICENSE file. It reaches into the topology of the
history — a sixteen-year-old repository grows a second birthday, and a founder's homecoming gets
filed under `First internal release.`

## At home

Distrust the singular "first commit." When you inherit a repository — especially one that has
been through an acquisition, a relicense, a corporate handoff — ask git for *all* of its roots
(`git log --max-parents=0 --all`). Every parentless commit is a place where history was
*started* rather than continued: an import, a squash, a fresh line dropped into an old project.
Read the author and date on each one. Then read the license file *as it existed at that exact
commit*, not at the tip — the tip tells you where the project landed; each root tells you the
moment someone decided to start a clock over. And read the holder line as carefully as the
terms. The most important word on a first page is often not the license at all. It is the name
in front of it.

---

*The "Remove myself too" commit and its minus-one diff, the 1,677-day silence, the four
parentless roots, the two-line All-Rights-Reserved license, and the five-week holder change are
all real and public, reproducible with a git command each. The full technical dig is here:
[Remove myself too — the full dig](20-redis.full.html).*
