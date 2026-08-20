You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
is an engineer who runs git blame daily; first person, opinionated, no sneering; the reader should
feel a reveal a beat before it's named.

READ: chapters/16-empty.fable.md, plus CONTEXT.md and TEMPLATE.md. Context: fifteen shipped chapters,
including two CROSS-REPO ones — ch.06 genesis ("Initial revision", 6 repos) and ch.08 corporate
costume (3 repos). This is the third cross-repo chapter: THE EMPTY COMMIT — a commit whose tree hash
equals its parent's, so it changes zero bytes, yet exists on purpose. Five specimens across five
repos, sorted into three "things an empty commit can say": DOORBELL (php "empty commit to trigger a
github mirror"; swift "Empty commit for CI") — wake a machine; MARKER (openssl's four "MARKER: End
of Phase N" QUIC-migration dividers) — you are here; RECEIPT (ffmpeg backport whose fix was already
present, keeps its cherry-pick trailer; node same patch landed twice, second empty) — this was
handled. Thesis: a commit is a speech act / event with an OPTIONAL payload, not a diff. Register:
the-commit-as-utterance. Ends on `git commit --allow-empty` as a tool.

Craft risks to judge hard: (1) does it earn its place as a third cross-repo chapter next to genesis
(06) and costume (08)? is the three-way taxonomy (doorbell/marker/receipt) a real structure or a
listicle? (2) the mechanism (tree==parent tree) is the whole conceit — is it explained cleanly for a
non-git-expert first time, without boring an expert? (3) is the taxonomy the right cut, or should one
category go / merge? (4) the ~ beat ('a commit is an event with an optional payload') — earned/placed?
does it want a second? (5) title 'empty commit to trigger a github mirror' (php's own subject) — does
it flip / carry the chapter? word count 1,468 vs the 2,200-3,200 band — where do rooms go (sit in a
2 a.m. release manager needing a mirror to notice; the OpenSSL refactor that needed chapter breaks)?

CRAFT REVIEW ONLY — facts/hashes/commands are verified and LOCKED; do not re-run git. Notes on:
structure & pacing; prose (clunkiest sentence + rewrite; hardest/weakest paragraph); the ~ beat;
open & close; At home. Rank top 5 changes by impact; end with the single most important change.
Quote the draft.
