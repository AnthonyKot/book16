You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
is an engineer who runs git blame daily; first person, opinionated, no sneering; the reader should
feel a reveal a beat before it's named.

READ: chapters/18-signatures.fable.md, chapters/18-signatures.receipts.md, plus CONTEXT.md and
TEMPLATE.md. Context: NEW P.S.-candidate chapter (source 18), cross-repo method chapter
(find-type: signature & tag-object archaeology). The published book runs xz / debian-openssl /
t2t / dual-ec / postgres / php / npm / vim — note the book OPENS with the xz chapter, so this
chapter's xz scene must add, not repeat. Recent reader-test calibration: a professional-SDE
reader scores concision and real-world consequence hardest; a multi-story chapter (Costume) was
just demoted for "messy, no plot" — this chapter's four-scene structure is the biggest risk.

Spine (verified, LOCKED to receipts): openssl 1.0.1g Heartbleed-fix release tag annotated but
unsigned ("error: no signature found", tagger Henson 2014-04-07; fix authored 04-06T00:51; 2016
pre6 tag carries PGP, Caswell); xz v5.6.0/v5.6.1 tags carry PGP blocks (tagger Jia Tan), signed
trees OMIT m4/build-to-host.m4 while m4/.gitignore names it, path has zero commits across all
refs; bitcoin v0.3.20.2 signed "critical bug-fix release" (Andresen 2011) whose target commit is
outside HEAD's history, reachable only via the tag, with a patch-identical twin on HEAD
(patch-id equal); noversion signed 2018 policy tag on a 2014 commit; log4j2 rel/2.15.0/2.16.0/
2.17.0 — three PGP-bearing tags in eight days, taggers Goers/Sicker/Gregory, 2.17.0 authored by
Goers but tagged by Gregory; go 71,792 commits all %G?=N, 491 tags all lightweight; linux
mergetag embedded in a 2026 merge while the clone has zero tag refs; cpython tag object "2.0"
made 2017 targeting a 2011 branch-close commit.

FACTUAL GATE (one flag gates): every hash, date, name, quote, count, and console line in prose
must appear in chapters/18-signatures.receipts.md. CRITICAL precision item: the receipts prove
PGP signature MATERIAL is embedded in tag objects; they do NOT prove cryptographic validity or
key trust (keys unavailable). Flag any prose that says or implies "validly signed" where only
"carries a signature block" is supported — the xz scene calls the signature "true"/"flawless";
judge whether that overclaims, and propose exact wording if so. Also flag: the linux clone
cannot prove the tag was deleted (only that its ref is absent); "backdated" for cpython means a
2017 tag pointing at 2011, not a falsified tagger date. List every <!-- CHECK: --> marker and
judge scope.

Craft risks to judge hard: (1) plot vs catalog — do the four scenes build one argument with an
emotional spine, or does it read as a tour (the Costume failure mode)? Would cutting "The field,
briefly" strengthen it? (2) the anatomy lesson placement — right spot, right length? (3) the xz
scene vs the book's opening xz chapter — additive or repetitive? (4) is the at-home section too
long/multi-command for the concision-scoring reader? (5) title "error: no signature found" —
does it work on a contents page next to the other titles? (6) word count vs the 2,200-3,200
band — where would you cut?

Output: a numbered gate list (must-fix), then optional suggestions. Be specific — quote the
line, say the fix.
