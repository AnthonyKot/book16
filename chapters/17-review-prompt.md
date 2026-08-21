You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
is an engineer who runs git blame daily; first person, opinionated, no sneering; the reader should
feel a reveal a beat before it's named.

READ: chapters/17-dirtycow.fable.md, chapters/17-dirtycow.receipts.md, plus CONTEXT.md and
TEMPLATE.md. Context: this is a NEW P.S.-candidate chapter (source 17). The published book runs
xz / debian-openssl / t2t / dual-ec / postgres / php / npm / vim. Recent reader-test calibration:
a professional-SDE reader scores concision and real-world consequence hardest; whimsy and
stakes-free archaeology rate low.

Spine (verified, LOCKED to receipts): Linus's 2005-08-01 fix of the get_user_pages COW race
(4ceb5db9, "4 insertions, 17 deletions"); the 2005-08-03 undo for s390/copy_one_pte (f33ea7f4,
Dickins/Piggin/Torvalds); the 2016-10-13 fix (19be0eaf) whose message confesses "attempted to be
fixed once (badly) by me eleven years ago", credits Reported-and-tested-by Phil "not Paul" Oester,
and shows a five-day authored/committed gap; the 2017 THP follow-up (8310d48b); 2020 "COW can
break either way" (17839856); 2022 removal of FOLL_COW naming Dirty COW/CVE-2016-5195 (5535be30);
Bitcoin twin: false->true fix b8f80196 + later CVE-2018-17144 comment 38bfca6b.

FACTUAL GATE (one flag gates): every hash, date, name, message quote, and diff line in the prose
must appear in chapters/17-dirtycow.receipts.md. Flag any that don't, any paraphrase that
overstates a receipt, and any causal "because" the record can't support. The draft deliberately
avoids claiming f33ea7f4 was a wholesale revert (it replaced the approach) and avoids "the weekend
it was named" folklore — verify it stays that way. List every <!-- CHECK: --> marker and judge
whether each external claim is (a) necessary and (b) accurately scoped.

Craft risks to judge hard: (1) the cold open on the 2016 confession — earned, or does it spend the
reveal too early? (2) is the COW explanation legible to a non-kernel reader without boring the SDE
reader the book is calibrated to? (3) the Bitcoin cousin section — does it sharpen the one-token
thesis or dilute a single-protagonist chapter (the book just demoted a chapter for multi-story
sprawl)? (4) the "revert leaves no tripwire" at-home beat — is it concrete and runnable, or a
sermon? (5) title "Fixed once (badly) by me eleven years ago" — does it flip on a contents page?
(6) word count 2,600 in a 2,200-3,200 band — where would you cut 10%?

Output: a numbered gate list (must-fix), then optional suggestions. Be specific — quote the line,
say the fix.
