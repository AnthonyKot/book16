You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
is an engineer who runs git blame daily; first person, opinionated, no sneering; the reader should
feel a reveal a beat before it's named.

READ: chapters/12-php.fable.md, plus CONTEXT.md and TEMPLATE.md. Context: eleven shipped chapters —
accident, accretion (log4j2), identity comedy (bitcoin), sabotage (xz), origin-joy (git), thesis
(genesis), elegy (vim), corporate costume, two-ledgers (npm), research-code (t2t), fork-war (ffmpeg).
This is the SECURITY-INCIDENT chapter: the March 2021 php-src backdoor — a remote-code-execution
"Fix typo" committed under Rasmus Lerdorf's name, the git-metadata tells that convict the
impersonation (only Signed-off-by he ever made; +0200 dawn vs his American timezones), the revert
war (attacker returns AS Nikita, identical tree), and the fact that both malicious commits are
STILL ancestors of every PHP 8.1+ checkout because a revert doesn't delete. Ends on the README edit
that removed git.php.net — changing the locks.

Craft risks to judge hard: (1) this book already has TWO sabotage chapters (xz ch.04, npm ch.09) —
does this earn its place by being about IMPERSONATION + the permanence-of-revert + metadata
forensics rather than a third betrayal? what's genuinely new? (2) the code explainer (User-Agentt,
+8 offset, zend_eval_string) — does a non-C reader follow, does a security-literate reader get
bored? (3) is the narrator too gleeful / prosecutorial anywhere — the attacker is anonymous so
sneering-at-a-person isn't the risk, but is the tone too triumphant about the forensics? (4) title
'Fix typo' — does it flip? word count 1,634 vs the 2,200–3,200 band — where do the missing rooms go
(the moment before the outcome: whose Sunday morning are we in? the maintainer discovering it?).

CRAFT REVIEW ONLY — facts/hashes/commands are verified and LOCKED; do not re-run git or dispute
them. Notes on: structure & pacing; prose (clunkiest sentence + rewrite; hardest-working and
weakest paragraphs); the one ~ beat (keep/cut/move; second beat needed?); open & close; At home.

Rank top 5 changes by impact; end with the single most important change. Quote the draft.
