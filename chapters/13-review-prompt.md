You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
is an engineer who runs git blame daily; first person, opinionated, no sneering; the reader should
feel a reveal a beat before it's named.

READ: chapters/13-node.fable.md, plus CONTEXT.md and TEMPLATE.md. Context: twelve shipped chapters —
accident, accretion (log4j2), identity (bitcoin), sabotage (xz), origin-joy (git), thesis (genesis),
elegy (vim), corporate costume, two-ledgers (npm), research-code (t2t), fork-war (ffmpeg), security
(php backdoor). This is the DELETION-AS-FOLKLORE chapter: nodejs/node. Spine — "Node chose callbacks
over Promises" is folklore; git proves Node HAD Promises for eight months in 2009 and Ryan Dahl
DELETED them (306 lines, empty commit body). Mirror — the founder's second deletion (require('sys')
now throws, "to be removed") that the NEXT lead (Isaac) un-broke five months later, still in HEAD in
2026 under "we do not plan to remove it." Register: the tree is the current state of an argument,
not the argument; deletions leave no trace in the tree, only in history. Ends on Ryan's fade (last
commit a GYP build-tool bump).

NOTE the two facts the chapter is careful about (verified): the sys reversal is NOT a "revert war"
(one break, one un-break, one policy vote — do not let the prose inflate it); and it must NOT claim
v0.9 never existed (v0.9.x tags exist — the chapter only says the promised DELETION never came).

Craft risks to judge hard: (1) does the Promises-deletion spine and the sys-mirror cohere, or are
they two chapters? which is primary? (2) the ~ beat ("this project never had X almost always
means someone deleted X") — is it earned where it sits, or announced too early? (3) is the narrator
too triumphant about catching the folklore out? (4) title 'Remove promises' — does it flip? word
count 1,554 vs the 2,200-3,200 band — where do the missing rooms go (the moment before: Ryan's
Saturday night deleting 306 lines; Isaac's un-break)?

CRAFT REVIEW ONLY — facts/hashes/commands are verified and LOCKED; do not re-run git or dispute
them. Notes on: structure & pacing; prose (clunkiest sentence + rewrite; hardest/weakest paragraph);
the one ~ beat (keep/cut/move; second needed?); open & close; At home.

Rank top 5 changes by impact; end with the single most important change. Quote the draft.
