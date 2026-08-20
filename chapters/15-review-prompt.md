You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
is an engineer who runs git blame daily; first person, opinionated, no sneering; the reader should
feel a reveal a beat before it's named.

READ: chapters/15-postgres.fable.md, plus CONTEXT.md and TEMPLATE.md. Context: fourteen shipped
chapters — accident, accretion, identity, sabotage (xz), origin-joy, thesis, elegy (vim), corporate
costume, npm-two-ledgers, research-code (t2t), fork-war (ffmpeg), security (php backdoor),
deletion-folklore (node), compliance-vs-security (openssl). This is the RESTRAINT / REFUSAL chapter:
postgres. Spine — a `0.3333333` selectivity guess, a "THIS IS A HACK TO GET V4 OUT THE DOOR / -- JMH
7/9/92" placeholder in the imported 1996 root, that Tom Lane DECLINES to fix in 2015 ("survived for
twenty-three years... not to do") and RESTORES in 2025 with a warning ("hoariness... not... hurry to
use another value"). The XXX 'fix me' inverted into 'do not fix me'. Companion — the ALTER TYPE enum
DROP VALUE parser production Tom lands in 2023 that ONLY warns (the feature he refuses to ship,
documented at the syntax). Register: the careful maintainer whose deepest work is knowing what NOT
to change; the refusal is the engineering. Ends on Tom's scale (first commit 1998 loader flags,
16,863 commits, most of anyone).

Notes on the facts (verified, LOCKED): the 1992 date is IN the imported root (clausesel.c), NOT
supplied later by Tom — the draft is careful about this; VERIFY it stays accurate. Zero external
CHECK markers (all in-repo) — confirm nothing needs one.

Craft risks to judge hard: (1) is this a fresh register next to node (deletion) and openssl
(compliance), or does 'a maintainer and an old line of code' feel same-y? what makes RESTRAINT
distinct? (2) is the planner/selectivity background legible to a non-DB reader without boring an
expert? (3) two ~-beat candidates? currently one ('a number wrong for long enough becomes a
contract') — earned/placed? second needed? (4) title 'THIS IS A HACK TO GET V4 OUT THE DOOR' (all
caps, the root comment) — does it flip? does the all-caps work on a contents page? word count 1,688
vs the 2,200-3,200 band — where do rooms go (the 2015 moment before Tom decides; the Berkeley author
at the V4 deadline)?

CRAFT REVIEW ONLY — facts/hashes/commands are verified and LOCKED; do not re-run git. Notes on:
structure & pacing; prose (clunkiest sentence + rewrite; hardest/weakest paragraph); ~ beats; open
& close; At home. Rank top 5 changes by impact; end with the single most important change. Quote the
draft.
