I'll read the draft, receipts, and book context first, then check every hash, quote, and console fence against the factual gate.The review skill is for code diffs; this is a literary gate, so I’ll work the draft, receipts, and published chapters myself.I'll cross-check hashes, console fences, and CHECK markers against the receipts, then read the vim chapter for distinctness.Word count is under the band. Next I’ll run the printed console commands against the clone and check hashes, sed ranges, and the summarized fences.I'll run the printed fences against the Redis clone and pull the remaining facts that might not be in the receipts.The 2021 shortlog already disagrees with the printed command. I’ll check the license-diff fence, the 2024 relicense in-tree, and a few remaining count claims.I have the mismatches. Checking one overclaim and the yearly-count gloss against R5, then I’ll write the gate list.# Gate review: “Remove myself too”

Chapter 20, Redis, P.S. candidate. **2,186** words of body by the TEMPLATE counter (`awk` to `## Receipts`); **2,044** if `<!-- CHECK -->` lines are stripped. Against a 2,200–3,200 band. Factual gate plus craft. One flag gates: **FAIL.** Eight must-fixes, then the CHECK inventory and the six craft risks.

The bones are the right bones: one living founder, a subject line that is also a cluster-accounting patch, a measured silence, a parentless return whose first page is two lines long. The pun is qualified. The parallel-history twin is not claimed as unique beyond HEAD. Distinctness from vim is already in the material — departure by choice, and a return, with a holder line that moves. What gates is four console fences a reader cannot reproduce, three counts/phrases the receipts do not support, and assignment language git does not prove.

The draft **does** say the pun cannot be proven intended. It **does not** claim `ad0a9df7` is unique beyond HEAD. Keep both. Do not add a mind-reading sentence on the way through.

---

## Must-fix

**1. The cluster `sed` range does not produce the output underneath it.**

```
$ git -C repos/redis show --format= --no-ext-diff 59fd178014c7cca1b0c668b30ab0d991dd3030f3 -- src/cluster.c | sed -n '5,14p'
 unsigned long getClusterConnectionsCount(void) {
…
}
```

A reader who runs that command gets ten lines starting at the `@@` hunk header and ending on the `+           ((dictSize…)-1)*2)` line. They never get a closing brace. The displayed body is show-output **8–15**, and the brace is a context line (` }`, leading space). Same failure mode as OpenTTD’s copied-from-the-wrong-ruler `sed` ranges.

Fix the command to `sed -n '8,15p'`. Leave the displayed lines, but print the last one as ` }` — the space is the diff.

**2. The LICENSE-holder fence omits the output of its own command.**

```
$ git -C repos/redis show --no-ext-diff --format= afcc2ff6e8832dc0621fe4b90e4dae6152b0d0a8 -- LICENSE
-This code is Copyright (C) 2024-2025 Salvatore Sanfilippo.
+This code is Copyright (c) 2024-Present, Redis Ltd.
 All Rights Reserved.
```

No `sed`. The real output is eight lines: `diff --git`, `index`, `---`, `+++`, `@@ -1,2 +1,2 @@`, then those three. Receipts already bound this with `sed -n '1,20p'`.

Fix: append ` | sed -n '6,8p'` and keep the three displayed lines, or print the full eight. Do not leave a command whose first line is `diff --git a/LICENSE` sitting under a fence that starts on the minus-line.

**3. The 2021 shortlog fence is the summarized command the prompt flagged, and it is wrong.**

```
$ git -C repos/redis shortlog -sn HEAD --since=2021-01-01 --until=2022-01-01 | head -3
   129	Oran Agra
```

Run as printed (no `T00:00:00Z`), this clone returns **128** Oran Agra. The receipts command — `--since=2021-01-01T00:00:00Z --until=2022-01-01T00:00:00Z` — returns **129**. Date-only `--since` is local-time; a reader in another zone will not match either number.

Fix: paste the receipts form of the command (the `T00:00:00Z` bounds) and keep 129. Do not “fix” the output to 128.

**4. The gap fence is not a command.**

```
$ ... gap between 2020-06-25 and the next founder commit
gap  1677 days 05:25:41
```

Reproduce-true means a reader who types the dollar line gets the printed lines. `$ ...` is not that. The number is right (R4: `gap  1677 days 05:25:41`, two spaces). The fence is not.

Fix: print R4’s `printf` command, or a one-liner a reader can actually run, and all three output lines:

```
from 2020-06-25T12:58:21+02:00
to   2025-01-27T17:24:02+01:00
gap  1677 days 05:25:41
```

Ellipsis-commands belong in narration, not in ` ```console `.

**5. The yearly pulse is false against its own receipt.**

> For a decade the yearly counts read like a pulse — four, six, seven hundred commits a year, every year, 2009 through 2020 [R5].

R5’s table: **2017 is 302**; **2014 is 865**. Not four-to-seven hundred, and not every year. The chapter’s own Receipts blurb repeats the error as `400–800/year, 2009–2020`.

Fix, still one sentence: name the range the table actually has — a few hundred to the high eight-hundreds, through 2020, with 2017 the dip — or drop the yearly gloss and keep the 7,188 / 13,257 total, which is the number that matters. Correct the R5 blurb in the same pass.

**6. “For the first time in the project’s life” is not in the receipts.**

> In 2021, for the first time in the project's life, the most active author is someone else — Oran Agra

R6 supports: 2020 topped by antirez; 2021 topped by Oran Agra; founder absent from that year’s top three. It does not support the all-history claim. (True in the clone for 2014–2020. Still not a receipt. Same cousin as OpenTTD’s “frosch’s decade.”)

Cut “for the first time in the project's life.” Keep “In 2021 the most active author is someone else — Oran Agra.” Do not add 2009–2019 shortlogs to prove a boast.

**7. “Five years … after the first” attaches the silence to 2009.**

> The top one, January 2025, is by antirez too — and it is a *second* beginning, a fresh root with no parent, five years and a whole silence after the first.

“The first,” in that paragraph, is `first commit` / March 2009. Five years after 2009 is 2014. The silence is 1,677 days after **2020-06-25**.

Fix: split the two clocks. The new root is sixteen years after `first commit` and 1,677 days after the last pre-gap commit on HEAD. Do not let “five years” modify “the first.”

**8. Git is made to prove a legal assignment the LICENSE file does not make.**

Three sentences, same overreach:

> the line that got handed to the company

> a founder's private restart get folded into a corporate asset

> with his own name on the copyright for exactly as long as it took to transfer it to the company

What R9 shows: the holder line changes from `Salvatore Sanfilippo` to `Redis Ltd.`; `All Rights Reserved` is untouched. That is a text change in a file. “Handed,” “folded into a corporate asset,” and “transfer” are a conveyance. The prompt’s rule is the right one, and the draft already knows how to obey it two paragraphs later (“git can only take you to the edge”).

Fix, same beat: the *name on the holder line* moved; the terms did not. “Watch exactly what moves and what stays” is the chapter’s own sentence — stop past it. Suggested swap for the closer: “with his own name on the holder line for five weeks, then the company’s.”

---

## CHECK markers

Four, as billed. None can be cleared in this pass. Two are mis-scoped: they mark as external facts this clone already holds.

**CHECK 1 — 2020 step-down** (after “he no longer wanted to be a maintainer”).

> In 2020 Salvatore Sanfilippo publicly stepped down as Redis maintainer, handing day-to-day stewardship to a team backed by Redis Labs; needs external source (his blog antirez.com / news coverage).

**(a) Necessary.** This is the distinctness claim from vim: departure by choice, not death. The ledger gives the zero; it does not give “wanted.” One sentence of announcement is the right amount. **(b) Accurately scoped** to the blog/news. Keep. Do not let “Redis Labs” or “handing stewardship” grow. “The ledger does not record the reasons” is the correct next sentence — protect it.

**CHECK 2 — 2024 relicense / Valkey** (after “onto something more restrictive”).

> In March 2024 Redis Ltd. relicensed Redis from the permissive BSD license to the dual RSALv2 / SSPLv1 source-available license; the Linux Foundation forked the last BSD commit as Valkey days later; needs external source.

**(a) The visible sentence is necessary** as the world he returns to, or the ARR root has no contrast except folklore. **(b) Not accurately scoped.** The relicense is not external. In this clone:

`0b3439692` 2024-03-20 Pieter Cailliau `Change license from BSD-3 to dual RSALv2+SSPLv1 (#13157)`

The draft says the ground “shifted in a way the code alone does not show.” That clause is false, and it is why “The four years” sags: the middle act punted the one 2024 object the tree actually grew. Valkey is the external half (different repository). Split the CHECK: receipt the Cailliau commit, or cut “In 2024…” from the page; leave Valkey as a CHECK on a fork you are willing to name, or drop the fork. Do not ask a reviewer to “find a news link” for a subject line sitting on `HEAD`.

**CHECK 3 — original BSD / ARR as opposite default** (after “the whole social contract of the thing”).

> Redis carried the permissive three-clause BSD license from 2009 until the 2024 relicense; "All Rights Reserved" is the opposite default (no permissions granted); needs external source for the original BSD terms.

**(a) Necessary** as contrast for the two-line LICENSE. Without some permissive past, ARR is just a short file. **(b) Not accurately scoped.** `git show ed9b544e10:COPYING` is three-clause BSD, copyright 2006-2009 Salvatore Sanfilippo, in this clone (the scout already printed the first line). “Needs external source for the original BSD terms” is the wrong ask. Receipt the 2009 `COPYING` (and, if CHECK 2 becomes a receipt, the 2024 subject). The legal gloss “ARR grants nothing” is a reading of a two-line file already on the page — it does not need a CHECK of its own.

Also: by January 2025 Redis had already been RSALv2/SSPL for ten months. “For sixteen years Redis had been permissively licensed” cannot stand next to a kept 2024 sentence unless “had been” is clearly historical and already ended. 2009-03-22 → 2024-03-20 is fifteen years, not sixteen.

**CHECK 4 — Valkey + 2025 AGPL return** (after “the negotiations that brought the founder back”).

> Redis's 2024 relicense drove the Linux Foundation's Valkey fork (launched March 2024); Redis returned to an open-source license (adding AGPLv3) in 2025 around the time of Sanfilippo's return; needs external source.

**(a) Not necessary.** The reader-facing sentence lists things receipts cannot prove — fight, fork, negotiations. That list can stay as a refusal to overclaim. It does not need Valkey-by-name or AGPL. **(b) Over-scoped, and half in-tree.** Visible prose never says Valkey or AGPL. AGPL is in this clone anyway: `d65102861` 2025-05-01 `Adding AGPLv3 as a license option to Redis!` — three weeks after `96a0cfde`, and a sixth act this chapter should not grow. Cut AGPL from the CHECK entirely. Either CHECK only the unnamed fork, or cut “the community that forked…” and let the closing rest on the second root, which is the exhibit.

Load-bearing test: a reader who has never heard of Valkey can still follow leave → zero → orphan root → holder line → return, provided CHECK 2/3 become receipts or the 2024 sentence is cut. They cannot follow it if “permissive social contract” stays CHECK-only fog. Right now CHECK 2 and 3 are doing narrative work the tree is willing to do.

---

## Craft risks (not gates)

**One protagonist, five acts.** It holds as one story: he subtracts *myself*, the shortlog inverts, he comes back as a parentless origin, the holder line moves, he commits under the legal name. The sag is specifically “The four years.” Oran Agra for one shortlog is the right proof the project did not die — that is the anti-vim beat, and it is already the right length. What sags is the next paragraph, the license shift with no object. Do not thicken Oran. Do not add Valkey as an act (Costume, one chapter ago). If you grow, grow by putting `0b3439692` on the page as the ground that moved, still with Salvatore as the person the change is waiting for.

**Distinctness from vim.** Earned. Vim is death, a mailbox constitution, a LICENSE that names “the current maintainer,” a queue that waits. This is a living founder who stops, a project that keeps shipping, a LICENSE that names a *holder*, a return through a new root. Keep “The one-name project” as scale, not elegy — you already have the shortlog; do not write vim’s “only row” census a second time. The return and the holder-line are the chapters’ non-overlap. Protect them.

**The pun open.** Honest, and it works. The object is in the tree; the narrator did not invent a cute. “I cannot prove it was intended — git records the subject line and the diff, not the state of mind” is the sentence that keeps it out of Costume. Leave it. Do not add “and I like to think he knew.” The line that over-eggs is later: “the countdown he wrote into the cluster code … ran on the project itself.” Optional cut; the coincidence has already landed.

**License material, no-Valkey reader.** The two-line LICENSE is the best exhibit in the draft — “read it the way you would read the opening line of a will” is earned. The 2024/BSD contrast is the part that currently fails the test, because it is CHECK-fog instead of `COPYING` / `0b3439692`. Once those are receipts, Valkey is optional color in a sentence that already says “not in commits.” Do not make the fork load-bearing.

One related honesty problem, not a hash-falsehood: `33d653e2` is a 21-file module. Its README at that commit begins “This module implements vector sets for Redis.” The draft’s “language of a project starting over from nothing” and the close’s “sixteen-year-old project acquires a second birthday” outrun the shortstat. The topology lesson (ask for every root) survives if the reader can see it is a module whose LICENSE is the fight. A one-line subtree subject from R10 (`Add 'modules/vector-sets/'…`) would size it without adding an act.

**Title.** It flips. Housekeeping; then departure; then he does not stay removed, and the name that reserved the rights is not the name that remains. It does not collide with vim. Keep it.

**Word count.** Under the floor: 2,186 / 2,044, band 2,200–3,200. Do not pad. Grow only where a receipt is missing from the page: the 2024 license commit (if you keep that sentence), the 2009 `COPYING` (if you keep “permissively licensed”), and maybe R10’s subtree subject so “second genesis” is sized. That is ~80–150 honest words and puts you on the floor. Do not grow “The four years” with more Oran. Do not grow an AGPL coda — that is a second ending, and the SDE reader already told you what they do to second endings.

Cuts if you need room after the receipts go in: “the coincidence is about to stop being funny”; the countdown-ran-on-the-project metaphor; “on earth combined” (the fraction 7,188 / 13,257 already says it).

---

The at-home habit (`git log --max-parents=0 --all`, then `git show <root>:LICENSE`) is the right takeaway and is already woven. The first-person restraint at “I want to be careful here” is the book’s voice. Fix the eight gates; split the two in-tree CHECKs into receipts; leave the pun unproven.
