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
