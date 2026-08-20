You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
is an engineer who runs git blame daily; first person, opinionated, no sneering; the reader should
feel a reveal a beat before it's named.

READ: chapters/10-t2t.fable.md, plus CONTEXT.md and TEMPLATE.md. Context: nine shipped chapters —
accident (debian-openssl), accretion (log4j2), identity comedy (bitcoin), sabotage (xz), origin-joy
(git 01:10), thesis-tour (genesis lie), elegy (vim), corporate costume (msdos/the-algorithm/swift),
two-ledgers (event-stream+colors). This one is the RESEARCH-CODE chapter: tensorflow/tensor2tensor,
the repo where the Transformer's code went public three days after the paper. Spine: the exported
projection (Piper/Copybara), the look_right mask bug that trained to zero loss ("a perfect score is
a leak") reverted by Vaswani himself, and the two opposite compatibility rulings ("This breaks
existing models" 2017 vs the checkpoint rollback 2019 — the weights are the spec). Ends on the
Shazeer TODO still at HEAD.

Craft risks to judge hard: (1) the ML background paragraphs (the mask explainer, the sinusoid) —
does a general-technical reader follow, and does an ML-literate reader get bored? (2) the chapter
has FIVE mini-stories (birth, leakr, look_right, two rulings, fade) — sprawl vs through-line; what
would you cut or expand? Word count is 1,827 vs the 2,200–3,200 band — where do the missing rooms
go (TEMPLATE says sit in the moment before the outcome)? (3) the fade section — ch.07 already owns
the elegy register; is 'The timer' too close to it, or dry enough? (4) title 'Giving 0 losses' —
the commit's own words; does it flip correctly at the revert?

CRAFT REVIEW ONLY — facts/hashes/commands are verified and LOCKED; do not re-run git or dispute
them. Notes on: structure & pacing; prose (clunkiest sentence + rewrite; hardest-working and
weakest paragraphs); the two ~ beats (keep/cut/move); open & close; At home.

Rank top 5 changes by impact; end with the single most important change. Quote the draft.
