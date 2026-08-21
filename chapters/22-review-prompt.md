You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
is an engineer who runs git blame daily; first person, opinionated, no sneering; the reader should
feel a reveal a beat before it's named.

READ: chapters/22-curl.fable.md, chapters/22-curl.receipts.md, plus CONTEXT.md and TEMPLATE.md.
Context: NEW P.S.-candidate chapter (source 22): curl's root commit as a disk-crash recovery,
opening a quarter-century of one maintainer. The published book runs xz / debian-openssl / t2t /
dual-ec / postgres / php / npm / vim. Adjacent registers to stay distinct from: the vim chapter
(one-maintainer elegy/succession) and the P.S. genesis chapter (what first commits really are).
This chapter's distinct claim: the first commit as a SURVIVAL artifact, and succession-without-
ceremony. Calibration: a professional-SDE reader scores concision and real-world consequence
hardest.

Spine (verified, LOCKED to receipts): sole root ae1912cb 1999-12-29 Daniel Stenberg "Initial
revision," 144 files / 37,273 insertions; the root tree contains config.cache/log/status, four
.patch files, prior tarball curl-6.3.1.tar.gz (242,680 bytes), and built executable src/curl
(100755, 1,830,293 bytes); root CHANGES opens at Version 6.4 (Dec 1999) and contains the
1999-11-23 entry "I've had this major disk crash… backed up elsewhere or stored in this CVS
server!"; CHANGES bottoms out at HttpGet 1.0 by Rafael Sagula ("which started all this!") with
Stenberg entering at 1.1; tip HISTORY.md dates HttpGet 0.1 to 1996-11-11 and Stenberg's
maintainership from December 1996; 067a75e8 2000-01-10 "removed junk files" deletes 9 files /
3,046 deletions (tarball, patches, config droppings — NOT src/curl; the draft must not claim the
binary was deleted then); at pin 695aa157 (2026-08-18): 39,474 commits, 1,507 mailmapped
authors, Stenberg 20,578; his first commit is the root and his latest is the pinned tip
("urldata: remove the aptr struct"); he leads every decade; six years led by others — Yang Tse
2008/2009, Steve Holme 2013/2014, Viktor Szakats 2025/2026.

FACTUAL GATE (one flag gates): every hash, date, name, quote, count, and console line in prose
must appear in chapters/22-curl.receipts.md — console fences must be reproduce-true (verify every
panel byte-for-byte against the receipts, including the long awk one-liners; flag any dropped or
altered output line). The crash was 36 days before the root, NOT "twelve days" (the scout got
this wrong; twelve days is the JUNK CLEANUP delay) — check the prose keeps these separate. "More
than the other 1,506 combined" — verify the arithmetic against 20,578 of 39,474. List the one
<!-- CHECK: --> marker (curl's billions-of-installations ubiquity) and judge scope; flag any
OTHER external claims lacking a marker (e.g., "everything with a network plug," "cars,
televisions").

Craft risks to judge hard: (1) the cold open "The first commit of curl contains a copy of curl"
— earned by the ls-tree panel, or too cute? (2) does the chapter hold one plot (recovery →
pre-history → endpoints → succession-without-ceremony → near-loss), or sag into a stats tour in
"The other endpoint"? (3) the explicit contrast with vim ("succession… doesn't look like Vim's
held breath") — does referencing another chapter work in P.S., or should it stand alone? (4) the
Szakats 2025/2026 beat — presented with receipt-true modesty (the receipts show only annual
leaders, not a handover)? (5) title "This major disk crash" — flips? (6) body word count vs the
2,200-3,200 band — where to cut or grow?

Output: a numbered gate list (must-fix), then optional suggestions. Be specific — quote the
line, say the fix.
