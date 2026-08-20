You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
is an engineer who runs git blame daily; first person, opinionated, no sneering; the reader should
feel a reveal a beat before it's named.

READ: chapters/14-openssl.fable.md, plus CONTEXT.md and TEMPLATE.md. Context: thirteen shipped
chapters — accident, accretion, identity, sabotage (xz), origin-joy, thesis, elegy, corporate
costume, two-ledgers (npm), research-code (t2t), fork-war (ffmpeg), security (php backdoor),
deletion-folklore (node). This is the COMPLIANCE-VS-SECURITY chapter: openssl's Dual EC DRBG, a
suspected-NSA-backdoor random generator, told from the six-commit revert war (add / disable /
remove / REVERT-the-removal / remove-again "..."). The distinctive claim: the obstacle to deleting
a suspected backdoor was a CERTIFICATION process (FIPS validation) that outranked the maintainer —
"not accepted for 2.0.7" / "now accepted for 2.0.8 onwards" are Henson's own commit-body words.
Ends on Henson (who wrote every commit, ~1/3 of the tree) vanishing from the log in 2017.

CRITICAL boundary (a scout verification FAILED the causal claim): the git proves ONLY "not accepted
for 2.0.7" — it does NOT prove a lab required Dual EC, that certification demanded it, or whether
the non-acceptance was substantive/procedural/timing. The draft already hedges this ("Whether the
non-acceptance was substantive, procedural, or a matter of timing, the git does not say") — VERIFY
that hedge holds everywhere and flag ANY sentence that overclaims the causation or implies the
maintainer was forced to keep a backdoor. Also: 3 CHECK markers carry external facts (Dual EC =
suspected backdoor, NIST withdrawal, FIPS program) — confirm each is genuinely external and the
prose doesn't state them as git-proven.

Craft risks: (1) does the chapter earn its place next to xz/php (both backdoors)? the NEW thing is
"a compliance checkbox beats a security fix" — is that distinct and clear? (2) is the ML/crypto/FIPS
background legible to a general reader without boring an expert? (3) the ~ beat — earned/placed? (4)
title 'Remove Dual EC DRBG again...' with the ellipsis — does it flip? word count 1,653 vs the
2,200-3,200 band — where do rooms go?

CRAFT REVIEW ONLY — facts/hashes/commands are verified and LOCKED; do not re-run git. Rank top 5
changes by impact; end with the single most important change. Quote the draft.
