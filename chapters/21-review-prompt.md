You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
is an engineer who runs git blame daily; first person, opinionated, no sneering; the reader should
feel a reveal a beat before it's named.

READ: chapters/21-iojs.fable.md, chapters/21-iojs.receipts.md, plus CONTEXT.md and TEMPLATE.md.
Context: NEW P.S.-candidate chapter (source 21), the Node/io.js fork war told from repository
evidence. The published book runs xz / debian-openssl / t2t / dual-ec / postgres / php / npm /
vim; the DEMOTED "Remove promises" chapter used this same repo — this chapter must share nothing
with it beyond the clone. The book also has an ffmpeg fork-war chapter in P.S. — judge whether
this one is distinct (governance rupture + reunification-by-document vs ffmpeg's hostile-merge
war). Calibration: a professional-SDE reader scores concision and real-world consequence hardest;
one plot, no catalog.

Spine (verified, LOCKED to receipts): origin/archived-io.js-v0.10 holds 16 commits reachable from
no other ref; f60abb0c 2014-10-01 Mikeal Rogers (committed by isaacs, node-forward/node PR #1)
drafts governance — TC roster, "No more than 30% of the TC membership can be affiliated with the
same employer," invitations not accepted incl. TJ Fontaine; e7dec60a 2014-10-29 "Said public when
I meant private." fixes one word in doc/tc-meetings/2014-10-29.md whose text includes "four
weeks" up November 8th, "remind Joyent," and "'soft' fork and not a 'hard' fork"; 51514c8e
2014-12-01 README becomes "io.js … began as a GitHub fork of joyent/node … open governance
model"; f17f473a 2015-01-08 Ben Noordhuis renames the binary node→iojs; a69ab27a 2015-08-13
cjihrig renames back "based on the recent convergence" (96 files, 2162+/2187-, adds iojs→node
symlink); 8a9a3bf7 Rod Vagg imports the io.js v3.3.0 changelog ("cherry-picked from v3.x @
1a6e52db30"), ancestor of v4.0.0; v3.3.0 is NOT an ancestor of v4.0.0 (divergence 151 vs 209
from base a020d9a5); v4.0.0's CHANGELOG declares itself "relative to the last io.js v3.x branch
release, v3.3.0."

FACTUAL GATE (one flag gates): every hash, date, name, quote, count, and console line in prose
must appear in chapters/21-iojs.receipts.md — console fences must be reproduce-true (verify every
sed range against the receipts' outputs; the draft uses some custom format strings — a reader
running the printed command must get exactly the printed lines). CRITICAL: the draft must NOT
claim v4.0.0 is git-parented on or descended from v3.3.0 — the receipts prove the opposite; the
supported claim is changelog-baseline continuity ("declared, not merged"). Verify the draft keeps
that distinction everywhere, including the receipts list. List every <!-- CHECK: --> marker
(Joyent/TJ Fontaine context; io.js 1.x-3.x release timeline; convergence/Foundation outcome) and
judge necessity and scope.

Craft risks to judge hard: (1) does the war hold as ONE plot (rehearsal → four weeks → io.js →
homecoming → seam), or does the middle read as a tour? (2) the seam section is the chapter's
thesis ("continuity is editorial, not ancestral") — is it earned and legible to a reader who has
never heard of io.js? (3) no-sneering: is Joyent treated fairly (the record only shows the
rebels' side — does the prose acknowledge that)? (4) title "Said public when I meant private" —
flips? (5) distinctness from the ffmpeg fork chapter and the demoted node chapter. (6) body word
count vs the 2,200-3,200 band — where to cut or grow?

Output: a numbered gate list (must-fix), then optional suggestions. Be specific — quote the
line, say the fix.
