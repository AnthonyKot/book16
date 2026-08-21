You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
is an engineer who runs git blame daily; first person, opinionated, no sneering; the reader should
feel a reveal a beat before it's named.

READ: chapters/19-openttd.fable.md, chapters/19-openttd.receipts.md, plus CONTEXT.md and
TEMPLATE.md. Context: NEW P.S.-candidate chapter (source 19), the "range" candidate — community/
creed material, not security. The published book runs xz / debian-openssl / t2t / dual-ec /
postgres / php / npm / vim. Two calibration facts: (a) a professional-SDE reader scores concision
and real-world consequence hardest, and stakes-free archaeology rates LOW with that reader — this
chapter's biggest exposure; (b) postgres (numbered 05) is already the restraint/load-bearing-hack
chapter — this one must be distinct (its distinctness claim: the "typo" fix was wrong ON THE
MERITS — the value only looked wrong; and the revert manufactured documentation at the point of
temptation).

Spine (verified, LOCKED to receipts): maedhros 2007-04-12 (61fe3568) introduces the town-growth
table with "The default rate is TTD's original rate" and the `if (n == 0 && !CHANCE16(1, 12))
return;` gate; Yourself <kyle.smith314@gmail.com> 2019-11-18 (7e22f243, committed by Ingo von
Borstel, the identity's only commit) changes one cell 320->420 titled "Fix: typo in town growth
rates (#7837)"; frosch 2019-11-20T01:00 (61dba850, committed by Charles Pigott) reverts with
"OpenTTD tries to replicate the original game mechanics. Making numbers look nice and correlate
is no goal, and in this case they actually did not correlate." and adds the five-line note
naming the malus in UpdateTownGrowth(); net diff pre-fix vs post-revert is the comment alone
(R8); the 2023 uint16->uint16_t migration leaves values and note untouched (eaae0bb5); at the
2026 tip the note and row still blame to frosch (R10).

FACTUAL GATE (one flag gates): every hash, date, name, quote, and code line in prose must appear
in chapters/19-openttd.receipts.md. Specific items: the draft must NOT claim 320 is "the original
binary speaking" or that frosch personally lived with the values since 2007 (both failed scout
verification — only "TTD's original rate" from the 2007 message is supported); the CHANCE16(1,12)
"one in twelve" reading is code interpretation from R3 — judge whether the prose presents it as
reading, not receipt; the "eleven times out of twelve sent home without progress" arithmetic —
supportable from the receipt's code? The draft says the malus "had migrated to a different
function in the file" by 2019 — is that supported by the receipts (frosch's comment names
UpdateTownGrowth()), or does it need softening? List the one <!-- CHECK: --> marker (game
identity) and judge scope.

Craft risks to judge hard: (1) the consequence problem — the chapter argues its low stakes ARE
the point ("the successful version of every disaster chapter"); does that landing convince a
consequence-scoring reader, or does it read as special pleading? (2) distinctness from postgres —
same-y or genuinely different register? (3) the "Yourself" name material — delightful or
sneering? The chapter promises no-fool framing; hold it to that. (4) is the hidden-clause section
(the toll-gate explanation) legible to someone who's never seen the game? (5) title "Making
numbers look nice" (chosen over the commit title to avoid colliding with the numbered chapter
"Fix typo") — does it flip? (6) word count 2,235, low end of the 2,200-3,200 band — does anything
need room, or is lean right for this reader?

Output: a numbered gate list (must-fix), then optional suggestions. Be specific — quote the
line, say the fix.
