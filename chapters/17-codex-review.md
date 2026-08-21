Reading additional input from stdin...
OpenAI Codex v0.148.0
--------
workdir: /home/diablo/book16
model: gpt-5.6-sol
provider: openai
approval: never
sandbox: read-only
reasoning effort: high
reasoning summaries: none
session id: 01a0253d-5a8a-75a0-8949-6a1600ea30a9
--------
user
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
warning: Codex could not find bubblewrap on PATH. Install bubblewrap with your OS package manager. See the sandbox prerequisites: https://developers.openai.com/codex/concepts/sandboxing#prerequisites. Codex will use the bundled bubblewrap in the meantime.
codex
I’ll audit the draft against the receipts first, then assess the six craft risks and identify a concrete ~10% cut. No web lookup: the chapter’s own receipts are the factual gate you specified.
exec
/bin/bash -lc "pwd && rg --files -g 'AGENTS.md' -g 'CONTEXT.md' -g 'TEMPLATE.md' -g 'chapters/17-dirtycow.*.md'" in /home/diablo/book16
 succeeded in 210ms:
/home/diablo/book16
CONTEXT.md
TEMPLATE.md
chapters/17-dirtycow.receipts.md
chapters/17-dirtycow.fable.md

exec
/bin/bash -lc "wc -l -w CONTEXT.md TEMPLATE.md chapters/17-dirtycow.receipts.md chapters/17-dirtycow.fable.md && sed -n '1,240p' CONTEXT.md && sed -n '1,260p' TEMPLATE.md" in /home/diablo/book16
 succeeded in 169ms:
   94  1000 CONTEXT.md
   22   225 TEMPLATE.md
  398  2304 chapters/17-dirtycow.receipts.md
  275  2883 chapters/17-dirtycow.fable.md
  789  6412 total
# Blame — authoring context

Working title: **Blame**. Git archaeology: each chapter is one dig in a public repository,
reproducible by the reader. Receipts are commit hashes; `verify.sh` (to be written after the
pilot settles the receipt format) clones and re-checks them.

## Why this book exists (the quality diagnosis — do not lose this)

Born 2026-08-18 from a diagnosis of why the earlier shelf reads as boring:
1. **Exhibits without a narrator.** Fix: the narrator is an engineer who runs `blame` daily and
   is walking you through *their* obsession. First person allowed. Opinions allowed.
2. **No surprise.** Fix: every chapter is built around a reveal the reader should feel a beat
   before it is stated. Cut digs that only confirm folklore (surprise ≤2).
3. **Uniform template.** Fix: TEMPLATE.md defines *beats*, not sections. Chapters may open on a
   diff, a timestamp, a name, or a hole. No two consecutive chapters open the same way.

Second reader lesson (book14, 2026-08-18): rigor lives in the receipts file; the reading
surface stays plain and entertaining. A reader must be able to *see the moment* without holding
locators in their head.

## Non-negotiables

- **Never false.** Every hash, date, author, message and diff quoted in prose must exist in the
  receipts file, which is generated by `scripts/receipts-NN.sh` running real commands against a
  real clone. Never quote command output from memory or from a scout report — the two-model
  audit (2026-08-19) showed scouts silently tidy transcripts.
- **Moment before the outcome.** Reconstruct what the actor knew when they typed. No sneering,
  no hindsight-flattering. The reader should think "I might have done this."
- **Chapter changes how the reader reads their own repo.** Each chapter ends with what to run
  at home — woven in, not a boxed sidebar.
- **Reader cut ≤ 2,000 words by default; up to 3,000 when the story earns it** (user, 2026-08-21:
  "if story is good, it could be up to 3,000"). The default is still the target — the extra
  thousand is for material that raises the score, never a license to skip the trim pass; the SDE
  reader's #1 note was concision. The counter is prose-only:
  `grep -v '^<!--' NN-x.reader.md | wc -w` (authoring comments excluded; the italic footer and
  code panels count). Settled 2026-08-21 after two sessions counted the same file differently.
- External (non-git) facts carry `<!-- CHECK: -->` markers until an adversarial review pass
  clears them, then `<!-- VERIFIED: evidence + source URL -->` comments preserve the invisible
  audit trail (book14 pipeline: draft → grok/agy/codex reviews → canonical).
- **Never put grep-filtered diff output inside a ```diff fence.** Grep strips hunk boundaries and
  can stitch lines from different functions into a "diff" that exists nowhere in the tree (this
  bit ch.05's centerpiece on 2026-08-19 — caught by a blind reader test). Grep transcripts belong
  in ```console with the pipe visible; real hunks are shown verbatim via sed line-ranges.

## Pipeline per chapter

1. Scout report (grok) + second-opinion verification (codex) — done for 23 repos, `scout/`.
2. `scripts/receipts-NN.sh` → `chapters/NN-x.receipts.md` (verbatim, regenerable).
3. `chapters/NN-x.fable.md` draft with CHECK markers, body ≤3,200 words.
4. Adversarial reviews from a shared prompt; apply gate items; 0 CHECKs → `chapters/NN-x.md`.
5. Human reader test (score 1–10) before the chapter counts as done.

## State

- `scout/` — 23 grok reports + 23 codex verify/extend reports + SELECTION.md (Round 1 ranking;
  v2 with Round 2 + codex digs pending).
- Final public sequence, second edition (source IDs remain stable for receipts): 04 xz → ch.01;
  01 Debian OpenSSL → ch.02; 10 t2t → ch.03; 14 Dual EC → ch.04; 15 Postgres → ch.05;
  12 PHP → ch.06; 09 npm → ch.07; 07 Vim → ch.08. (2026-08-21, from the SDE reader test,
  user's constraint: exactly 4 out / 4 in, order and rework delegated to the working sessions.
  OUT: Git — readers "didn't get it"; Costume — "messy, no plot", scored 4; Node — weak plot,
  "I'd replace right away"; Log4j2 — scored 6 with a rewrite-level concision complaint, and it
  is the corpus's most-retold folklore, so its surprise budget is lowest. IN: PHP, npm, t2t,
  Dual EC — Dual EC matches the formula the reader rewarded (one person, one artifact,
  restraint, real stakes). Order logic: xz opens (user's pick); xz→Debian OpenSSL is a
  deliberate contrast (attack, then honest mistake); t2t and Postgres are breathers between
  the security chapters; PHP→npm pairs repo forgery with registry sabotage; Vim keeps the
  elegy close.)
- The other eight completed investigations remain accessible under `P.S. Drafts` on the contents
  page, but are not part of the numbered book.

## SDE reader test (2026-08-21, in progress)

Full scoreboard from a professional-engineer reader: **Postgres and Vim best** ("more or less
well written" — the writing carried them); **xz 7**; **Log4j2 6**; **Debian OpenSSL and Node
"kind of ok"** — entertaining but not high-quality writing/story (OpenSSL misses the
significance of the bug; Node has a weak plot → demoted); **Costume 4 → demoted**; **Git
worst** — readers "didn't get it". Calibration: this reader scores PROSE QUALITY first
(the two most-restrained chapters won), then real-world consequence; clever-meta and
whimsy registers (Costume, Git) rate low even when model reviewers and blind sims rate them
high. Recurring note: write more concisely, and end with the real post-factum impact (for
xz: how far the payload actually got, the sshd/libsystemd target, the Jia Tan working-hours
research; for Debian OpenSSL: the two years of guessable keys). Open follow-ups: impact
endings for xz and Debian OpenSSL (sourced, VERIFIED-marked); concision trims on flagged
chapters; soft sim defects on t2t/npm. (The 4-out/4-in swap itself landed — see the sequence
note above.)

## Fix backlog (blind reader-test pass, 2026-08-19)

**All cleared 2026-08-20.** Ch.01/04 applied 2026-08-19; ch.02 (fifth beat restored as "2021 —
this feature is not used", full-dig aphorism corrected to "default is off", Goers/Kozak named),
ch.03 (mailmap/indifference reframe both forms + R6 no-.mailmap receipt, verbatim shortlog open
in reader, annoyance line cut), ch.06 reader (Bitcoin paragraph rebuilt on twin roots + sirius-m),
ch.07 reader (mailbox-vs-serving-hatch physical beat) applied 2026-08-20.
# Chapter beats (not sections)

A chapter is 2,200–3,200 words of body. It hits these beats in whatever order the story wants;
the ONLY rule is that no two consecutive chapters open on the same kind of object.

- **COLD OPEN** — drop the reader into one concrete moment: a diff hunk, a clock, a name, an
  absence. Not "This is the story of…". Ideally the thing that will turn out to matter, shown
  before we know it matters.
- **THE ROOM** — reconstruct what the actor knew and wanted right then. Their tools, their
  ticket, their Tuesday. This is where "no sneering" lives.
- **THE TURN** — the reveal. The reader should feel it a sentence before it is named. Put the
  receipt (hash + command) at the turn, inline, small.
- **THE BLAST RADIUS** — what it cost and for how long, told concretely (who, how many, how
  long it stayed dark).
- **AT HOME** — the command the reader should run on their own repo, woven into the closing,
  never a boxed sidebar. The habit is the takeaway.

Receipts: prose may quote only what appears in `chapters/NN-x.receipts.md`. Reference receipts
by their R-number in a trailing `## Receipts` list (R1, R4, …) with the one-line locator.

Word count method (body only, excludes the Receipts list):
`awk '/^## Receipts/{exit} {print}' chapters/NN-x.md | wc -w`

exec
/bin/bash -lc "sed -n '1,430p' chapters/17-dirtycow.receipts.md" in /home/diablo/book16
 succeeded in 184ms:
# Receipts — source 17 Dirty COW (the eleven-year COW race)

Verbatim outputs against the local torvalds/linux and bitcoin/bitcoin clones.
Regenerate with `scripts/receipts-17.sh`. Long outputs selected editorially with sed/head.

## R1 — 2005-08-01: Linus's first attempt to fix the write-access race
```
$ git -C repos/linux show --stat --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommitter: %cn <%ce>%nCommitDate: %cI%n%n%B' 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6
commit 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6
Author: Linus Torvalds <torvalds@g5.osdl.org>
AuthorDate: 2005-08-01T11:14:49-07:00
Committer: Linus Torvalds <torvalds@g5.osdl.org>
CommitDate: 2005-08-01T11:14:49-07:00

Fix get_user_pages() race for write access

There's no real guarantee that handle_mm_fault() will always be able to
break a COW situation - if an update from another thread ends up
modifying the page table some way, handle_mm_fault() may end up
requiring us to re-try the operation.

That's normally fine, but get_user_pages() ended up re-trying it as a
read, and thus a write access could in theory end up losing the dirty
bit or be done on a page that had not been properly COW'ed.

This makes get_user_pages() always retry write accesses as write
accesses by making "follow_page()" require that a writable follow has
the dirty bit set.  That simplifies the code and solves the race: if the
COW break fails for some reason, we'll just loop around and try again.

Signed-off-by: Linus Torvalds <torvalds@osdl.org>


 mm/memory.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)
```

## R2 — 2005-08-03: the s390/copy_one_pte objection and replacement protocol
```
$ git -C repos/linux show --stat --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommitter: %cn <%ce>%nCommitDate: %cI%n%n%B' f33ea7f404e592e4563b12101b7a4d17da6558d7
commit f33ea7f404e592e4563b12101b7a4d17da6558d7
Author: Nick Piggin <nickpiggin@yahoo.com.au>
AuthorDate: 2005-08-03T20:24:01+10:00
Committer: Linus Torvalds <torvalds@g5.osdl.org>
CommitDate: 2005-08-03T09:12:05-07:00

[PATCH] fix get_user_pages bug

Checking pte_dirty instead of pte_write in __follow_page is problematic
for s390, and for copy_one_pte which leaves dirty when clearing write.

So revert __follow_page to check pte_write as before, and make
do_wp_page pass back a special extra VM_FAULT_WRITE bit to say it has
done its full job: once get_user_pages receives this value, it no longer
requires pte_write in __follow_page.

But most callers of handle_mm_fault, in the various architectures, have
switch statements which do not expect this new case.  To avoid changing
them all in a hurry, make an inline wrapper function (using the old
name) that masks off the new bit, and use the extended interface with
double underscores.

Yes, we do have a call to do_wp_page from do_swap_page, but no need to
change that: in rare case it's needed, another do_wp_page will follow.

Signed-off-by: Hugh Dickins <hugh@veritas.com>
[ Cleanups by Nick Piggin ]
Signed-off-by: Linus Torvalds <torvalds@osdl.org>


 include/linux/mm.h | 22 +++++++++++++++++-----
 mm/memory.c        | 31 +++++++++++++++++++++++--------
 2 files changed, 40 insertions(+), 13 deletions(-)
```

## R3 — the three commits on one exact author-date timeline
```
$ git -C repos/linux show -s --format='%H %aI %an | %s' 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6 f33ea7f404e592e4563b12101b7a4d17da6558d7 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619
4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6 2005-08-01T11:14:49-07:00 Linus Torvalds | Fix get_user_pages() race for write access
f33ea7f404e592e4563b12101b7a4d17da6558d7 2005-08-03T20:24:01+10:00 Nick Piggin | [PATCH] fix get_user_pages bug
19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 2016-10-13T13:07:36-07:00 Linus Torvalds | mm: remove gup_flags FOLL_WRITE games from __get_user_pages()
```

## R4 — 2016: Linus's full account of the ancient bug, the undo, and the new fix
```
$ git -C repos/linux show --stat --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommitter: %cn <%ce>%nCommitDate: %cI%n%n%B' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619
commit 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619
Author: Linus Torvalds <torvalds@linux-foundation.org>
AuthorDate: 2016-10-13T13:07:36-07:00
Committer: Linus Torvalds <torvalds@linux-foundation.org>
CommitDate: 2016-10-18T14:13:29-07:00

mm: remove gup_flags FOLL_WRITE games from __get_user_pages()

This is an ancient bug that was actually attempted to be fixed once
(badly) by me eleven years ago in commit 4ceb5db9757a ("Fix
get_user_pages() race for write access") but that was then undone due to
problems on s390 by commit f33ea7f404e5 ("fix get_user_pages bug").

In the meantime, the s390 situation has long been fixed, and we can now
fix it by checking the pte_dirty() bit properly (and do it better).  The
s390 dirty bit was implemented in abf09bed3cce ("s390/mm: implement
software dirty bits") which made it into v3.9.  Earlier kernels will
have to look at the page state itself.

Also, the VM has become more scalable, and what used a purely
theoretical race back then has become easier to trigger.

To fix it, we introduce a new internal FOLL_COW flag to mark the "yes,
we already did a COW" rather than play racy games with FOLL_WRITE that
is very fundamental, and then use the pte dirty flag to validate that
the FOLL_COW flag is still valid.

Reported-and-tested-by: Phil "not Paul" Oester <kernel@linuxace.com>
Acked-by: Hugh Dickins <hughd@google.com>
Reviewed-by: Michal Hocko <mhocko@suse.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Willy Tarreau <w@1wt.eu>
Cc: Nick Piggin <npiggin@gmail.com>
Cc: Greg Thelen <gthelen@google.com>
Cc: stable@vger.kernel.org
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>


 include/linux/mm.h |  1 +
 mm/gup.c           | 14 ++++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)
```

## R5 — the 2016 diff, hunk one: introduce FOLL_COW
```
$ git -C repos/linux show --format= --no-ext-diff 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 -- include/linux/mm.h mm/gup.c | sed -n '1,12p'
diff --git a/include/linux/mm.h b/include/linux/mm.h
index e9caec6a51e9..ed85879f47f5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2232,6 +2232,7 @@ static inline struct page *follow_page(struct vm_area_struct *vma,
 #define FOLL_TRIED	0x800	/* a retry, previous pass started an IO */
 #define FOLL_MLOCK	0x1000	/* lock present pages */
 #define FOLL_REMOTE	0x2000	/* we are working on non-current tsk/mm */
+#define FOLL_COW	0x4000	/* internal GUP flag */
 
 typedef int (*pte_fn_t)(pte_t *pte, pgtable_t token, unsigned long addr,
 			void *data);
```

## R6 — the 2016 diff, remaining hunks: validate COW and stop clearing FOLL_WRITE
```
$ git -C repos/linux show --format= --no-ext-diff 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 -- include/linux/mm.h mm/gup.c | sed -n '13,50p'
diff --git a/mm/gup.c b/mm/gup.c
index 96b2b2fd0fbd..22cc22e7432f 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -60,6 +60,16 @@ static int follow_pfn_pte(struct vm_area_struct *vma, unsigned long address,
 	return -EEXIST;
 }
 
+/*
+ * FOLL_FORCE can write to even unwritable pte's, but only
+ * after we've gone through a COW cycle and they are dirty.
+ */
+static inline bool can_follow_write_pte(pte_t pte, unsigned int flags)
+{
+	return pte_write(pte) ||
+		((flags & FOLL_FORCE) && (flags & FOLL_COW) && pte_dirty(pte));
+}
+
 static struct page *follow_page_pte(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmd, unsigned int flags)
 {
@@ -95,7 +105,7 @@ retry:
 	}
 	if ((flags & FOLL_NUMA) && pte_protnone(pte))
 		goto no_page;
-	if ((flags & FOLL_WRITE) && !pte_write(pte)) {
+	if ((flags & FOLL_WRITE) && !can_follow_write_pte(pte, flags)) {
 		pte_unmap_unlock(ptep, ptl);
 		return NULL;
 	}
@@ -412,7 +422,7 @@ static int faultin_page(struct task_struct *tsk, struct vm_area_struct *vma,
 	 * reCOWed by userspace write).
 	 */
 	if ((ret & VM_FAULT_WRITE) && !(vma->vm_flags & VM_WRITE))
-		*flags &= ~FOLL_WRITE;
+	        *flags |= FOLL_COW;
 	return 0;
 }
```

## R7 — 2017 aftermath: the forgotten transparent-huge-page check, also sent to stable
```
$ git -C repos/linux show -s --format='%H%nAuthorDate: %aI%nAuthor: %an <%ae>%nSubject: %s%n%n%b' 8310d48b125d19fcd9521d83b8293e63eb1646aa | sed -n '1,17p;57,77p'
8310d48b125d19fcd9521d83b8293e63eb1646aa
AuthorDate: 2017-01-24T15:17:48-08:00
Author: Keno Fischer <keno@juliacomputing.com>
Subject: mm/huge_memory.c: respect FOLL_FORCE/FOLL_COW for thp

In commit 19be0eaffa3a ("mm: remove gup_flags FOLL_WRITE games from
__get_user_pages()"), the mm code was changed from unsetting FOLL_WRITE
after a COW was resolved to setting the (newly introduced) FOLL_COW
instead.  Simultaneously, the check in gup.c was updated to still allow
writes with FOLL_FORCE set if FOLL_COW had also been set.

However, a similar check in huge_memory.c was forgotten.  As a result,
remote memory writes to ro regions of memory backed by transparent huge
pages cause an infinite loop in the kernel (handle_mm_fault sets
FOLL_COW and returns 0 causing a retry, but follow_trans_huge_pmd bails
out immidiately because `(flags & FOLL_WRITE) && !pmd_write(*pmd)` is
true.
Fix this by updating follow_trans_huge_pmd in huge_memory.c analogously
to the update in gup.c in the original commit.  The same pattern exists
in follow_devmap_pmd.  However, we should not be able to reach that
check with FOLL_COW set, so add WARN_ONCE to make sure we notice if we
ever do.

[akpm@linux-foundation.org: coding-style fixes]
Link: http://lkml.kernel.org/r/20170106015025.GA38411@juliacomputing.com
Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Greg Thelen <gthelen@google.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
```

## R8 — 2020 aftermath: Linus documents that COW can break either way
```
$ git -C repos/linux show -s --format='%H%nAuthorDate: %aI%nAuthor: %an <%ae>%nSubject: %s%n%n%b' 17839856fd588f4ab6b789f482ed3ffd7c403e1f | sed -n '1,21p;31,55p'
17839856fd588f4ab6b789f482ed3ffd7c403e1f
AuthorDate: 2020-05-27T18:29:34-07:00
Author: Linus Torvalds <torvalds@linux-foundation.org>
Subject: gup: document and work around "COW can break either way" issue

Doing a "get_user_pages()" on a copy-on-write page for reading can be
ambiguous: the page can be COW'ed at any time afterwards, and the
direction of a COW event isn't defined.

Yes, whoever writes to it will generally do the COW, but if the thread
that did the get_user_pages() unmapped the page before the write (and
that could happen due to memory pressure in addition to any outright
action), the writer could also just take over the old page instead.

End result: the get_user_pages() call might result in a page pointer
that is no longer associated with the original VM, and is associated
with - and controlled by - another VM having taken it over instead.

So when doing a get_user_pages() on a COW mapping, the only really safe
thing to do would be to break the COW when getting the page, even when
only getting it for reading.
This adds logic to force a COW event by setting FOLL_WRITE on any
copy-on-write mapping when FOLL_GET (or FOLL_PIN) is used to get a page
pointer as a result.

The current semantics end up being:

 - __get_user_pages_fast(): no change. If you don't ask for a write,
   you won't break COW. You'd better know what you're doing.

 - get_user_pages_fast(): the fast-case "look it up in the page tables
   without anything getting mmap_sem" now refuses to follow a read-only
   page, since it might need COW breaking.  Which happens in the slow
   path - the fast path doesn't know if the memory might be COW or not.

 - get_user_pages() (including the slow-path fallback for gup_fast()):
   for a COW mapping, turn on FOLL_WRITE for FOLL_GET/FOLL_PIN, with
   very similar semantics to FOLL_FORCE.

If it turns out that we want finer granularity (ie "only break COW when
it might actually matter" - things like the zero page are special and
don't need to be broken) we might need to push these semantics deeper
into the lookup fault path.  So if people care enough, it's possible
that we might end up adding a new internal FOLL_BREAK_COW flag to go
with the internal FOLL_COW flag we already have for tracking "I had a
COW".
```

## R9 — 2022 aftermath: an explicit Dirty COW/CVE mention and removal of FOLL_COW
```
$ git -C repos/linux show -s --format='%H%nAuthorDate: %aI%nAuthor: %an <%ae>%nSubject: %s%n%n%b' 5535be3099717646781ce1540cf725965d680e7b | sed -n '1,20p;50,67p;83p'
5535be3099717646781ce1540cf725965d680e7b
AuthorDate: 2022-08-09T22:56:40+02:00
Author: David Hildenbrand <david@redhat.com>
Subject: mm/gup: fix FOLL_FORCE COW security issue and remove FOLL_COW

Ever since the Dirty COW (CVE-2016-5195) security issue happened, we know
that FOLL_FORCE can be possibly dangerous, especially if there are races
that can be exploited by user space.

Right now, it would be sufficient to have some code that sets a PTE of a
R/O-mapped shared page dirty, in order for it to erroneously become
writable by FOLL_FORCE.  The implications of setting a write-protected PTE
dirty might not be immediately obvious to everyone.

And in fact ever since commit 9ae0f87d009c ("mm/shmem: unconditionally set
pte dirty in mfill_atomic_install_pte"), we can use UFFDIO_CONTINUE to map
a shmem page R/O while marking the pte dirty.  This can be used by
unprivileged user space to modify tmpfs/shmem file content even if the
user does not have write permissions to the file, and to bypass memfd
write sealing -- Dirty COW restricted to tmpfs/shmem (CVE-2022-2590).
This fixes CVE-2022-2590. Note that only x86_64 and aarch64 are
affected, because only those support CONFIG_HAVE_ARCH_USERFAULTFD_MINOR.

Fortunately, FOLL_COW is no longer required to handle FOLL_FORCE. So
let's just get rid of it.

Thanks to Nadav Amit for pointing out that the pte_dirty() check in
FOLL_FORCE code is problematic and might be exploitable.

Note 1: We don't check for the PTE being dirty because it doesn't matter
	for making a "was COWed" decision anymore, and whoever modifies the
	page has to set the page dirty either way.

Note 2: Kernels before extended uffd-wp support and before
	PageAnonExclusive (< 5.19) can simply revert the problematic
	commit instead and be safe regarding UFFDIO_CONTINUE. A backport to
	v5.19 requires minor adjustments due to lack of
	vma_soft_dirty_enabled().
Cc: <stable@vger.kernel.org>	[5.16]
```

## R10 — Bitcoin twin: the entire 2018 repair is false to true
```
$ git -C repos/bitcoin show --stat --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommitter: %cn <%ce>%nCommitDate: %cI%n%n%B' b8f801964f59586508ea8da6cf3decd76bc0e571
commit b8f801964f59586508ea8da6cf3decd76bc0e571
Author: Suhas Daftuar <sdaftuar@gmail.com>
AuthorDate: 2018-09-17T15:50:55-04:00
Committer: Suhas Daftuar <sdaftuar@gmail.com>
CommitDate: 2018-09-17T15:50:55-04:00

Fix crash bug with duplicate inputs within a transaction

Introduced by #9049


 src/validation.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
```

```
$ git -C repos/bitcoin show --format= --no-ext-diff b8f801964f59586508ea8da6cf3decd76bc0e571 -- src/validation.cpp | sed -n '1,13p'
diff --git a/src/validation.cpp b/src/validation.cpp
index 947192be0e..59c3fb425f 100644
--- a/src/validation.cpp
+++ b/src/validation.cpp
@@ -3122,7 +3122,7 @@ bool CheckBlock(const CBlock& block, CValidationState& state, const Consensus::P
 
     // Check transactions
     for (const auto& tx : block.vtx)
-        if (!CheckTransaction(*tx, state, false))
+        if (!CheckTransaction(*tx, state, true))
             return state.Invalid(false, state.GetRejectCode(), state.GetRejectReason(),
                                  strprintf("Transaction check failed (tx hash %s) %s", tx->GetHash().ToString(), state.GetDebugMessage()));
 
```

## R11 — Bitcoin's later in-repo comment names CVE-2018-17144 at that true call
```
$ git -C repos/bitcoin show -s --format='commit %H%nAuthorDate: %aI%nAuthor: %an <%ae>%n%n%B' 38bfca6bb2ad68719415e9c54a981441052da072 | sed -n '1,18p'
commit 38bfca6bb2ad68719415e9c54a981441052da072
AuthorDate: 2018-11-10T09:11:22-08:00
Author: lucash-dev <lucash.dev@gmail.com>

Added comments referencing multiple CVEs in tests and production code.

This commit adds comments referencing multiple CVEs both in production and test code.
CVEs covered in this commit:

CVE-2010-5137
CVE-2010-5139
CVE-2010-5141
CVE-2012-1909
CVE-2012-2459
CVE-2012-3789
CVE-2018-17144

```

```
$ git -C repos/bitcoin show --format= --no-ext-diff 38bfca6bb2ad68719415e9c54a981441052da072 -- src/validation.cpp | sed -n '14,21p'
@@ -3136,6 +3136,7 @@ bool CheckBlock(const CBlock& block, CValidationState& state, const Consensus::P
             return state.Invalid(ValidationInvalidReason::CONSENSUS, false, REJECT_INVALID, "bad-cb-multiple", "more than one coinbase");
 
     // Check transactions
+    // Must check for duplicate inputs (see CVE-2018-17144)
     for (const auto& tx : block.vtx)
         if (!CheckTransaction(*tx, state, true))
             return state.Invalid(state.GetReason(), false, state.GetRejectCode(), state.GetRejectReason(),
```


exec
/bin/bash -lc "nl -ba chapters/17-dirtycow.fable.md | sed -n '1,330p'" in /home/diablo/book16
 succeeded in 191ms:
     1	# Fixed once (badly) by me eleven years ago
     2	
     3	*This is the full dig — every command, every receipt. The plain-English telling of the same story
     4	is here: [Fixed once (badly) by me eleven years ago](17-dirtycow.html).*
     5	
     6	Most commit messages are written to explain a change. Every so often one is written to confess.
     7	Here is the opening of a patch Linus Torvalds committed to the Linux kernel in October 2016 [R4]:
     8	
     9	```console
    10	$ git -C repos/linux show -s --format='%B' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619
    11	mm: remove gup_flags FOLL_WRITE games from __get_user_pages()
    12	
    13	This is an ancient bug that was actually attempted to be fixed once
    14	(badly) by me eleven years ago in commit 4ceb5db9757a ("Fix
    15	get_user_pages() race for write access") but that was then undone due to
    16	problems on s390 by commit f33ea7f404e5 ("fix get_user_pages bug").
    17	```
    18	
    19	A patch that begins by citing two older patches by their hashes is a patch that has read its own
    20	history. This one names the crime scene, the original culprit — himself — and the accomplice who
    21	quietly undid the first fix eleven years earlier. That eleven-year gap is the subject of this
    22	chapter, because for most of it the kernel that runs most of the world's servers, phones, and
    23	routers carried a hole that had already been found, already been fixed, and then un-fixed for an
    24	excellent reason. This is not a story about a bug nobody caught. It is worse: it is a story about
    25	a bug that was caught, patched, and then deliberately let back out.
    26	
    27	The security world would eventually give it a name — Dirty COW — and a serial number,
    28	CVE-2016-5195. <!-- CHECK: Dirty COW = CVE-2016-5195, a local privilege-escalation race in the
    29	Linux kernel's copy-on-write handling, disclosed October 2016; needs external source. --> But
    30	names came at the end. Let us start where the ledger does, on a Monday morning in 2005.
    31	
    32	## The first fix
    33	
    34	August 1st, 2005, 11:14 in the morning, Pacific time. Linus writes a small patch to a file called
    35	`mm/memory.c` — the part of the kernel that manages memory, the most load-bearing code there is —
    36	and his message describes a race condition with unusual candor for a bug report [R1]:
    37	
    38	```console
    39	$ git -C repos/linux show -s --format='%B' 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6
    40	Fix get_user_pages() race for write access
    41	
    42	There's no real guarantee that handle_mm_fault() will always be able to
    43	break a COW situation ...
    44	a write access could in theory end up losing the dirty
    45	bit or be done on a page that had not been properly COW'ed.
    46	```
    47	
    48	To feel this you need one idea, and it has a homely name: copy-on-write, or COW. When the system
    49	has two programs that both hold what looks like the same page of memory, it does not actually keep
    50	two copies. It keeps one, marked read-only, and hands both programs a pointer to it. The moment
    51	one of them tries to *write*, the hardware traps, the kernel quietly makes a private copy for the
    52	writer, and the write lands on the copy. Two programs, the illusion of two pages, the cost of one
    53	until the instant someone changes something. It is one of the most elegant tricks in an operating
    54	system, and almost everything relies on it.
    55	
    56	The race Linus is describing lives in the gap between "the hardware traps" and "the kernel makes
    57	the copy." There is a narrow window in which two threads, racing, can arrange for a write to land
    58	on the *original* read-only page instead of a private copy — the illusion punctured, one program
    59	scribbling on memory it was only supposed to be able to read. In 2005 this is, in his own later
    60	words, a "purely theoretical race." The machines of the era are mostly single-processor; the
    61	window is vanishingly thin. He fixes it anyway, the way a careful person tightens a screw they
    62	walked past, and moves on. Note the shape of it: `4 insertions, 17 deletions` [R1]. The fix made
    63	the code *shorter*. It simplified the exact function at the center of the story. Remember that.
    64	
    65	## The undo
    66	
    67	Two days later, August 3rd, the fix comes back out. Not by accident, and not by a fool — the
    68	commit is authored by Hugh Dickins, cleaned up by Nick Piggin, committed by Linus himself [R2].
    69	Three of the most respected memory-management engineers alive, agreeing. Their reason is precise
    70	[R2]:
    71	
    72	```console
    73	$ git -C repos/linux show -s --format='%B' f33ea7f404e592e4563b12101b7a4d17da6558d7
    74	[PATCH] fix get_user_pages bug
    75	
    76	Checking pte_dirty instead of pte_write in __follow_page is problematic
    77	for s390, and for copy_one_pte which leaves dirty when clearing write.
    78	...
    79	```
    80	
    81	Linus's fix had worked by inspecting a specific bit of hardware bookkeeping — the "dirty" bit,
    82	which marks a page as having been written to. On the mainframe architecture called s390, that bit
    83	did not behave the way the fix assumed. So the elegant two-day-old patch was correct on the
    84	machines most people had and *wrong* on a machine some people had, and "wrong in the memory
    85	manager on one architecture" is not a thing you ship. They reverted the approach and replaced it
    86	with a more elaborate mechanism that sidestepped the dirty bit entirely.
    87	
    88	This is the decision the whole chapter pivots on, and I want to be scrupulously fair to it,
    89	because hindsight makes it look careless and it was the opposite. They had a fix for a theoretical
    90	race that broke a real architecture. They chose the real architecture. Faced with "a bug nobody
    91	has ever triggered" versus "a regression on hardware we support," any responsible maintainer
    92	protects the hardware. The theoretical race went back to being theoretical. The screw Linus had
    93	tightened was loosened again, on purpose, and everyone in that thread was right to loosen it.
    94	
    95	The trap was set not by a mistake but by a correct decision, and it would stay set for eleven
    96	years, because a correct decision does not leave a ticket open. Nobody filed "come back when s390
    97	is fixed." The knowledge that the race still existed lived only in three people's heads and in a
    98	reverted patch that, by definition, no longer ran.
    99	
   100	## What the years changed
   101	
   102	Nothing in `mm/memory.c` had to change for the danger to grow. The *world* changed around the
   103	frozen code. Here is Linus in 2016 again, naming the two things that turned a curiosity into a
   104	weapon [R4]:
   105	
   106	```console
   107	$ git -C repos/linux show -s --format='%b' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 | sed -n '5,11p'
   108	In the meantime, the s390 situation has long been fixed ...
   109	
   110	Also, the VM has become more scalable, and what used a purely
   111	theoretical race back then has become easier to trigger.
   112	```
   113	
   114	Two clocks, running the whole time. The first: the reason for the 2005 revert *expired*. The s390
   115	dirty bit got a proper implementation in a kernel released around 2013 <!-- CHECK: commit
   116	abf09bed3cce "s390/mm: implement software dirty bits" landed in Linux v3.9, released ~2013; the
   117	receipt R4 quotes the message naming abf09bed3cce and v3.9. -->, which meant the objection that
   118	killed the original fix had quietly stopped being true years before anyone connected it back to
   119	the sleeping race. The obstacle dissolved and nobody noticed, because nobody was watching that
   120	particular obstacle — why would they? It guarded a door everyone had forgotten.
   121	
   122	The second clock: machines grew. A "purely theoretical" race needs a freakishly precise collision
   123	of timing to trigger. But as processors gained cores and the kernel learned to run more things at
   124	once, the window that was nearly impossible to hit on a 2005 uniprocessor became something an
   125	attacker with a tight enough loop could hit reliably on 2016 hardware. The code stood still while
   126	the thing that made it safe — slowness, single-threadedness, luck — drained away underneath it.
   127	This is the quiet horror of the chapter: no commit made it dangerous. Time did.
   128	
   129	## The half-second that wasn't
   130	
   131	The bug was not rediscovered by an auditor reading old memory-management code. It was found the
   132	way these things usually are — in the wild, already being used. The 2016 fix carries an unusual
   133	credit line [R4]:
   134	
   135	```console
   136	$ git -C repos/linux show -s --format='%b' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 | grep -i reported
   137	Reported-and-tested-by: Phil "not Paul" Oester <kernel@linuxace.com>
   138	```
   139	
   140	*Reported-and-tested-by.* Not "found while reviewing." A researcher named Phil Oester extracted a
   141	live exploit from a compromised server's captured traffic — the attack caught in the act, not
   142	imagined in a lab. <!-- CHECK: Phil Oester discovered Dirty COW being actively exploited in the
   143	wild, from an HTTP exploit captured on a server he ran; he named it; needs external source. --> By
   144	the time the patch landed, this was not a theoretical race anymore in any sense. It was a
   145	technique. The parenthetical "not Paul" is a small human joke sitting in the metadata of one of
   146	the most serious Linux vulnerabilities ever shipped — a man tired of being confused with someone
   147	else, immortalized in the permanent record of the kernel because he happened to be the one who
   148	caught a fire that had been smoldering since 2005.
   149	
   150	Look at the two timestamps on the fix, because they tell you how the disclosure worked [R4]:
   151	
   152	```console
   153	$ git -C repos/linux show -s --format='authored %aI%ncommitted %cI' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619
   154	authored 2016-10-13T13:07:36-07:00
   155	committed 2016-10-18T14:13:29-07:00
   156	```
   157	
   158	Written October 13th, committed October 18th — a five-day gap, in a project where Linus usually
   159	commits his own work the same second he writes it. That gap is the coordinated-disclosure window:
   160	the fix existed, finished, for five days before it entered the public tree, while distributions
   161	were handed it privately so the patch and the announcement could land together. The one time the
   162	two dates on a Torvalds commit disagree, the disagreement is itself a security artifact.
   163	
   164	## The fix, and its long tail
   165	
   166	The actual repair is fourteen lines [R4], and its heart is a new internal flag with an honest name
   167	[R5, R6]:
   168	
   169	```console
   170	$ git -C repos/linux show --format= --no-ext-diff 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 -- mm/gup.c | sed -n '5,15p'
   171	+/*
   172	+ * FOLL_FORCE can write to even unwritable pte's, but only
   173	+ * after we've gone through a COW cycle and they are dirty.
   174	+ */
   175	+static inline bool can_follow_write_pte(pte_t pte, unsigned int flags)
   176	+{
   177	+	return pte_write(pte) ||
   178	+		((flags & FOLL_FORCE) && (flags & FOLL_COW) && pte_dirty(pte));
   179	+}
   180	```
   181	
   182	Instead of the racy trick of clearing the "I want to write" flag mid-fault, the code now sets a
   183	new flag, `FOLL_COW`, that means precisely *"yes, we already did the copy."* The write is allowed
   184	only once that flag confirms the copy really happened. The fix is, in spirit, the same insight
   185	Linus had in 2005 — validate the dirty bit properly — now that the hardware everywhere could
   186	finally support it. Eleven years to ship the same idea, because the idea was never wrong; only its
   187	timing was.
   188	
   189	And then the receipts show the thing this book keeps insisting on: a fix is not an ending. Three
   190	months later, in 2017, Keno Fischer discovers the 2016 patch fixed the ordinary case but forgot
   191	its twin — the same check on "transparent huge pages" — leaving an infinite loop and a variant
   192	hole; that too goes to the stable kernels [R7]. In 2020 Linus revisits the whole area to document
   193	that a copy-on-write page "can break either way," a subtlety the original model had glossed [R8].
   194	And in 2022 David Hildenbrand removes the `FOLL_COW` flag entirely while fixing a *descendant*
   195	vulnerability, and his message finally says the ancestor's name out loud [R9]:
   196	
   197	```console
   198	$ git -C repos/linux show -s --format='%b' 5535be3099717646781ce1540cf725965d680e7b | sed -n '1,3p'
   199	Ever since the Dirty COW (CVE-2016-5195) security issue happened, we know
   200	that FOLL_FORCE can be possibly dangerous, especially if there are races
   201	that can be exploited by user space.
   202	```
   203	
   204	Six years after the fix, the bug is no longer an embarrassment to be described obliquely. It is a
   205	landmark other engineers navigate by — "ever since Dirty COW" — the way sailors name a reef after
   206	the ship that found it.
   207	
   208	## The one-character cousin
   209	
   210	I want to set one more commit beside this, from a different project, because it isolates the single
   211	transferable lesson. In 2018, Bitcoin shipped a fix for a bug that could have let someone forge
   212	money. The entire repair is this [R10]:
   213	
   214	```console
   215	$ git -C repos/bitcoin show --format= --no-ext-diff b8f801964f59586508ea8da6cf3decd76bc0e571 -- src/validation.cpp | sed -n '5,8p'
   216	     for (const auto& tx : block.vtx)
   217	-        if (!CheckTransaction(*tx, state, false))
   218	+        if (!CheckTransaction(*tx, state, true))
   219	```
   220	
   221	One word. `false` to `true`. That boolean controls whether the code bothers to check a block's
   222	transactions for duplicate inputs — the check that stops someone from spending the same coin twice
   223	inside one transaction, which in a currency is the difference between money and not-money. It had
   224	been switched off by an earlier refactor that looked, like all the dangerous ones in this book,
   225	completely reasonable. The commit message is four words of understatement — "Fix crash bug with
   226	duplicate inputs" — and it does not mention that the same flaw could mint coins from nothing. That
   227	admission arrives two months later, when someone adds a single comment naming the disaster [R11]:
   228	
   229	```console
   230	$ git -C repos/bitcoin show --format= --no-ext-diff 38bfca6bb2ad68719415e9c54a981441052da072 -- src/validation.cpp | sed -n '4,6p'
   231	+    // Must check for duplicate inputs (see CVE-2018-17144)
   232	     for (const auto& tx : block.vtx)
   233	         if (!CheckTransaction(*tx, state, true))
   234	```
   235	
   236	<!-- CHECK: CVE-2018-17144 was a Bitcoin Core consensus/inflation vulnerability fixed September
   237	2018, potentially allowing denial-of-service and coin inflation via duplicate inputs; needs
   238	external source. --> The Linux hole was a bit assumed to be safe; the Bitcoin hole was a boolean
   239	flipped to `false`. Both are one token. Both cost years or dollars. And in both, the git history
   240	is the only place the true weight of the change is recorded — never in the commit that *made* the
   241	danger, always in a later one that names it, once someone downstream has paid.
   242	
   243	## At home
   244	
   245	The habit here is a specific kind of paranoia, and it is aimed at your revert button. When you back
   246	out a fix — for a real, good, defensible reason, the way those engineers did in 2005 — the danger
   247	that fix addressed does not go back in the box. It goes back to sleep, and it sleeps exactly as long
   248	as your reason stays true. So when you revert something that closed a hole, leave a live tripwire,
   249	not a memory: an open ticket that references the reverted commit's hash, a test that fails loudly if
   250	the unsafe condition returns, a comment at the site that says *this is safe only because of X* — so
   251	that the day X stops being true, someone is standing there. The 2005 revert was correct and left
   252	nothing behind, and "nothing behind" is what cost eleven years.
   253	
   254	The tool that makes this searchable is right in front of you. When you meet a suspicious line —
   255	a boolean that guards something expensive, a check that looks skippable — run `git log -S` on the
   256	exact text to pull up every commit that ever added or removed it, and read those messages in
   257	order. A flag that was `true`, then `false`, then `true` again is not noise. It is an argument the
   258	code had with itself, and the reason it is currently set the way it is usually lives in the message
   259	of whoever set it last. Linus could reconstruct the entire eleven-year arc from two hashes because
   260	someone — him — had written those hashes down. The history remembers what the three smartest people
   261	in the room forgot. You only have to ask it.
   262	
   263	## Receipts
   264	
   265	- **R1** `git -C repos/linux show -s ... 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6` — 2005-08-01, Linus, "Fix get_user_pages() race for write access": the first fix; `4 insertions, 17 deletions`.
   266	- **R2** `git -C repos/linux show -s ... f33ea7f404e592e4563b12101b7a4d17da6558d7` — 2005-08-03, Hugh Dickins / Nick Piggin / committed by Linus: reverts the `pte_dirty` approach because it breaks s390 and `copy_one_pte`.
   267	- **R3** `git -C repos/linux show -s --format='%H %aI %an | %s' 4ceb5db9... f33ea7f4... 19be0eaf...` — the three commits on one timeline: 2005-08-01, 2005-08-03, 2016-10-13.
   268	- **R4** `git -C repos/linux show -s ... 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619` — 2016 fix; message names the 2005 attempt and revert by hash, "ancient bug", s390 fixed in abf09bed3cce (v3.9), "easier to trigger"; `Reported-and-tested-by: Phil "not Paul" Oester`; authored 2016-10-13, committed 2016-10-18; `Cc: stable`.
   269	- **R5** `git -C repos/linux show ... 19be0eaf... -- include/linux/mm.h mm/gup.c | sed -n '1,12p'` — hunk one: `+#define FOLL_COW 0x4000`.
   270	- **R6** `... | sed -n '13,50p'` — remaining hunks: `can_follow_write_pte()` validating `FOLL_COW && pte_dirty`, and `*flags |= FOLL_COW` replacing `*flags &= ~FOLL_WRITE`.
   271	- **R7** `git -C repos/linux show -s ... 8310d48b125d19fcd9521d83b8293e63eb1646aa` — 2017, Keno Fischer: the forgotten transparent-huge-page case; infinite loop; `Cc: stable`.
   272	- **R8** `git -C repos/linux show -s ... 17839856fd588f4ab6b789f482ed3ffd7c403e1f` — 2020, Linus: documents "COW can break either way."
   273	- **R9** `git -C repos/linux show -s ... 5535be3099717646781ce1540cf725965d680e7b` — 2022, David Hildenbrand: "Ever since the Dirty COW (CVE-2016-5195)…", removes `FOLL_COW`, fixes CVE-2022-2590.
   274	- **R10** `git -C repos/bitcoin show ... b8f801964f59586508ea8da6cf3decd76bc0e571 -- src/validation.cpp` — 2018, Suhas Daftuar: "Fix crash bug with duplicate inputs", the entire diff is `false` → `true`.
   275	- **R11** `git -C repos/bitcoin show ... 38bfca6bb2ad68719415e9c54a981441052da072 -- src/validation.cpp` — 2018, later commit adds `// Must check for duplicate inputs (see CVE-2018-17144)` beside that call.

codex
The receipt pass has already found a few hard gates: the chapter sometimes turns a documented five-day timestamp gap into an undocumented disclosure narrative, and several “nobody remembered” claims outrun what Git can prove. I’m checking the quoted command panels and the undo wording next, since both affect the book’s reproducibility promise.
exec
/bin/bash -lc "git -C repos/linux show --format= --no-ext-diff 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 -- mm/gup.c | sed -n '1,20p'; git -C repos/bitcoin show --format= --no-ext-diff b8f801964f59586508ea8da6cf3decd76bc0e571 -- src/validation.cpp | sed -n '1,12p'; git -C repos/bitcoin show --format= --no-ext-diff 38bfca6bb2ad68719415e9c54a981441052da072 -- src/validation.cpp | sed -n '1,10p'" in /home/diablo/book16
 succeeded in 195ms:
diff --git a/mm/gup.c b/mm/gup.c
index 96b2b2fd0fbd..22cc22e7432f 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -60,6 +60,16 @@ static int follow_pfn_pte(struct vm_area_struct *vma, unsigned long address,
 	return -EEXIST;
 }
 
+/*
+ * FOLL_FORCE can write to even unwritable pte's, but only
+ * after we've gone through a COW cycle and they are dirty.
+ */
+static inline bool can_follow_write_pte(pte_t pte, unsigned int flags)
+{
+	return pte_write(pte) ||
+		((flags & FOLL_FORCE) && (flags & FOLL_COW) && pte_dirty(pte));
+}
+
 static struct page *follow_page_pte(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmd, unsigned int flags)
diff --git a/src/validation.cpp b/src/validation.cpp
index 947192be0e..59c3fb425f 100644
--- a/src/validation.cpp
+++ b/src/validation.cpp
@@ -3122,7 +3122,7 @@ bool CheckBlock(const CBlock& block, CValidationState& state, const Consensus::P
 
     // Check transactions
     for (const auto& tx : block.vtx)
-        if (!CheckTransaction(*tx, state, false))
+        if (!CheckTransaction(*tx, state, true))
             return state.Invalid(false, state.GetRejectCode(), state.GetRejectReason(),
                                  strprintf("Transaction check failed (tx hash %s) %s", tx->GetHash().ToString(), state.GetDebugMessage()));
diff --git a/src/validation.cpp b/src/validation.cpp
index 436c62261b..d0ce3f78fc 100644
--- a/src/validation.cpp
+++ b/src/validation.cpp
@@ -1865,7 +1865,7 @@ bool CChainState::ConnectBlock(const CBlock& block, CValidationState& state, CBl
     // If such overwrites are allowed, coinbases and transactions depending upon those
     // can be duplicated to remove the ability to spend the first instance -- even after
     // being sent to another address.
-    // See BIP30 and http://r6.ca/blog/20120206T005236Z.html for more information.
+    // See BIP30, CVE-2012-1909, and http://r6.ca/blog/20120206T005236Z.html for more information.

exec
/bin/bash -lc "git -C repos/linux show -s --format='%b' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 | nl -ba | sed -n '1,18p'; git -C repos/bitcoin show --format= --no-ext-diff 38bfca6bb2ad68719415e9c54a981441052da072 -- src/validation.cpp | nl -ba | sed -n '10,24p'" in /home/diablo/book16
 succeeded in 208ms:
     1	This is an ancient bug that was actually attempted to be fixed once
     2	(badly) by me eleven years ago in commit 4ceb5db9757a ("Fix
     3	get_user_pages() race for write access") but that was then undone due to
     4	problems on s390 by commit f33ea7f404e5 ("fix get_user_pages bug").
     5	
     6	In the meantime, the s390 situation has long been fixed, and we can now
     7	fix it by checking the pte_dirty() bit properly (and do it better).  The
     8	s390 dirty bit was implemented in abf09bed3cce ("s390/mm: implement
     9	software dirty bits") which made it into v3.9.  Earlier kernels will
    10	have to look at the page state itself.
    11	
    12	Also, the VM has become more scalable, and what used a purely
    13	theoretical race back then has become easier to trigger.
    14	
    15	To fix it, we introduce a new internal FOLL_COW flag to mark the "yes,
    16	we already did a COW" rather than play racy games with FOLL_WRITE that
    17	is very fundamental, and then use the pte dirty flag to validate that
    18	the FOLL_COW flag is still valid.
    10	+    // See BIP30, CVE-2012-1909, and http://r6.ca/blog/20120206T005236Z.html for more information.
    11	     // This logic is not necessary for memory pool transactions, as AcceptToMemoryPool
    12	     // already refuses previously-known transaction ids entirely.
    13	     // This rule was originally applied to all blocks with a timestamp after March 15, 2012, 0:00 UTC.
    14	@@ -3136,6 +3136,7 @@ bool CheckBlock(const CBlock& block, CValidationState& state, const Consensus::P
    15	             return state.Invalid(ValidationInvalidReason::CONSENSUS, false, REJECT_INVALID, "bad-cb-multiple", "more than one coinbase");
    16	 
    17	     // Check transactions
    18	+    // Must check for duplicate inputs (see CVE-2018-17144)
    19	     for (const auto& tx : block.vtx)
    20	         if (!CheckTransaction(*tx, state, true))
    21	             return state.Invalid(state.GetReason(), false, state.GetRejectCode(), state.GetRejectReason(),

exec
/bin/bash -lc "awk '/"'^## Receipts/{exit} {print}'"' chapters/17-dirtycow.fable.md | wc -w; sed -n '208,241p' chapters/17-dirtycow.fable.md | wc -w; sed -n '3,4p;19,30p;88,98p;114,127p;140,162p;189,206p;243,261p' chapters/17-dirtycow.fable.md | wc -w; rg -n '<"'!-- CHECK:'"' chapters/17-dirtycow.fable.md" in /home/diablo/book16
 succeeded in 195ms:
2600
319
1297
28:CVE-2016-5195. <!-- CHECK: Dirty COW = CVE-2016-5195, a local privilege-escalation race in the
115:dirty bit got a proper implementation in a kernel released around 2013 <!-- CHECK: commit
142:imagined in a lab. <!-- CHECK: Phil Oester discovered Dirty COW being actively exploited in the
236:<!-- CHECK: CVE-2018-17144 was a Bitcoin Core consensus/inflation vulnerability fixed September

exec
/bin/bash -lc "git -C repos/linux log --oneline -S'pte_dirty' -- mm/memory.c | head -20; git -C repos/linux log --oneline -S'FOLL_COW' -- include/linux/mm.h mm/gup.c | head -20; git -C repos/linux log --oneline --grep='[Rr]evert' --all | head -10" in /home/diablo/book16
 succeeded in 188ms:
fatal: your current branch 'master' does not have any commits yet
fatal: your current branch 'master' does not have any commits yet
3abe3d0223dd Merge tag 'kbuild-7.3-1' of git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux
d5b95e612cde Revert "i2c: designware: defer probe if child GpioInt controllers are not bound"
dac3e89a2c90 Merge tag 'drm-fixes-2026-08-15' of https://gitlab.freedesktop.org/drm/kernel
b26d316aaa8e Merge tag 'clk-fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
7581e7c73e8f Merge tag 'drm-misc-fixes-2026-08-13' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
3aa1dcaa4f6f Revert "wifi: mt76: Disable napi when removing device"
2bbea6b819be Revert "drm/sched: Switch default policy to fair"
9e9da8625427 Revert "drm/sched: Remove FIFO and RR and simplify to a single run queue"
67cf83ac8316 Revert "drm/sched: Embed run queue singleton into the scheduler"
aa82a2530257 Revert "accel/amdxdna: Remove drm_sched_init_args->num_rqs usage"

exec
/bin/bash -lc "git -C repos/linux log --oneline 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 -S'pte_dirty' -- mm/memory.c | head -20; git -C repos/linux log --oneline 5535be3099717646781ce1540cf725965d680e7b -S'FOLL_COW' -- include/linux/mm.h mm/gup.c | head -20" in /home/diablo/book16
 succeeded in 4863ms:
53da3bc2ba9e mm: fix up numa read-only thread grouping logic
4bbd4c776a63 mm: move get_user_pages()-related code to separate file
1da177e4c3f4 Linux-2.6.12-rc2
5535be309971 mm/gup: fix FOLL_FORCE COW security issue and remove FOLL_COW
19be0eaffa3a mm: remove gup_flags FOLL_WRITE games from __get_user_pages()

exec
/bin/bash -lc "git -C repos/linux show -s --format='%B' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 | nl -ba | sed -n '1,10p'; git -C repos/linux show -s --format='%B' 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6 | nl -ba | sed -n '1,18p'; git -C repos/linux show -s --format='%B' f33ea7f404e592e4563b12101b7a4d17da6558d7 | nl -ba | sed -n '1,15p'" in /home/diablo/book16
 succeeded in 214ms:
     1	mm: remove gup_flags FOLL_WRITE games from __get_user_pages()
     2	
     3	This is an ancient bug that was actually attempted to be fixed once
     4	(badly) by me eleven years ago in commit 4ceb5db9757a ("Fix
     5	get_user_pages() race for write access") but that was then undone due to
     6	problems on s390 by commit f33ea7f404e5 ("fix get_user_pages bug").
     7	
     8	In the meantime, the s390 situation has long been fixed, and we can now
     9	fix it by checking the pte_dirty() bit properly (and do it better).  The
    10	s390 dirty bit was implemented in abf09bed3cce ("s390/mm: implement
     1	Fix get_user_pages() race for write access
     2	
     3	There's no real guarantee that handle_mm_fault() will always be able to
     4	break a COW situation - if an update from another thread ends up
     5	modifying the page table some way, handle_mm_fault() may end up
     6	requiring us to re-try the operation.
     7	
     8	That's normally fine, but get_user_pages() ended up re-trying it as a
     9	read, and thus a write access could in theory end up losing the dirty
    10	bit or be done on a page that had not been properly COW'ed.
    11	
    12	This makes get_user_pages() always retry write accesses as write
    13	accesses by making "follow_page()" require that a writable follow has
    14	the dirty bit set.  That simplifies the code and solves the race: if the
    15	COW break fails for some reason, we'll just loop around and try again.
    16	
    17	Signed-off-by: Linus Torvalds <torvalds@osdl.org>
    18	
     1	[PATCH] fix get_user_pages bug
     2	
     3	Checking pte_dirty instead of pte_write in __follow_page is problematic
     4	for s390, and for copy_one_pte which leaves dirty when clearing write.
     5	
     6	So revert __follow_page to check pte_write as before, and make
     7	do_wp_page pass back a special extra VM_FAULT_WRITE bit to say it has
     8	done its full job: once get_user_pages receives this value, it no longer
     9	requires pte_write in __follow_page.
    10	
    11	But most callers of handle_mm_fault, in the various architectures, have
    12	switch statements which do not expect this new case.  To avoid changing
    13	them all in a hurry, make an inline wrapper function (using the old
    14	name) that masks off the new bit, and use the extended interface with
    15	double underscores.

exec
/bin/bash -lc "rg -n -i '\\bbecause\\b|\\bso\\b|\\btherefore\\b|\\bmeant\\b|\\bwhich meant\\b' chapters/17-dirtycow.fable.md" in /home/diablo/book16
 succeeded in 195ms:
6:Most commit messages are written to explain a change. Every so often one is written to confess.
22:chapter, because for most of it the kernel that runs most of the world's servers, phones, and
83:did not behave the way the fix assumed. So the elegant two-day-old patch was correct on the
89:because hindsight makes it look careless and it was the opposite. They had a fix for a theoretical
96:years, because a correct decision does not leave a ticket open. Nobody filed "come back when s390
117:receipt R4 quotes the message naming abf09bed3cce and v3.9. -->, which meant the objection that
119:the sleeping race. The obstacle dissolved and nobody noticed, because nobody was watching that
147:else, immortalized in the permanent record of the kernel because he happened to be the one who
150:Look at the two timestamps on the fix, because they tell you how the disclosure worked [R4]:
161:were handed it privately so the patch and the announcement could land together. The one time the
186:finally support it. Eleven years to ship the same idea, because the idea was never wrong; only its
210:I want to set one more commit beside this, from a different project, because it isolates the single
248:as your reason stays true. So when you revert something that closed a hole, leave a live tripwire,
250:the unsafe condition returns, a comment at the site that says *this is safe only because of X* — so
259:of whoever set it last. Linus could reconstruct the entire eleven-year arc from two hashes because
266:- **R2** `git -C repos/linux show -s ... f33ea7f404e592e4563b12101b7a4d17da6558d7` — 2005-08-03, Hugh Dickins / Nick Piggin / committed by Linus: reverts the `pte_dirty` approach because it breaks s390 and `copy_one_pte`.

codex
Gate verdict: not ready. The hashes, named people, quoted diff lines, and core dates are present in the receipts, but several causal claims exceed the record. The draft also partially lapses into the wholesale-revert framing it meant to avoid.

## Must-fix gates

1. **The cold open spends the reveal twice.**

   The title, opening quotation, and lines 19–25 disclose the complete structure before the 2005 dig begins:

   > “already been found, already been fixed, and then un-fixed”

   > “deliberately let back out”

   The confession is an excellent turn, but a poor cold open if surprise remains a requirement. Open on `4 insertions, 17 deletions`, follow the two-day replacement, then reveal the 2016 confession around “The trap was set.” The reader will recognize the eleven-year shape just before Linus names it.

   The title does flip on a contents page: it has voice, culpability, and elapsed time. But if retained, do not immediately repeat and explain it. Alternatively, **“The Reason Expired”** preserves more of the reveal.

2. **The chapter does not consistently preserve the “replacement, not wholesale revert” distinction.**

   These lines restore the misleading version:

   > “the hole … had already been found, already been fixed, and then un-fixed”

   > “Two days later … the fix comes back out.”

   > “The theoretical race went back to being theoretical.”

   > “The 2005 revert was correct and left nothing behind”

   R2 says the `pte_dirty` check was reverted and replaced with the `VM_FAULT_WRITE` protocol. Fix the framing throughout:

   > “Two days later, the dirty-bit approach was replaced with a more elaborate protocol.”

   Then let the 2016 message establish that the ancient bug nevertheless survived. “Deliberately let back out” must go: the record supports an attempted replacement, not a conscious decision to reopen a hole.

   The draft successfully avoids the “weekend it was named” folklore. Keep it that way.

3. **The R2 authorship is misstated.**

   > “the commit is authored by Hugh Dickins, cleaned up by Nick Piggin, committed by Linus”

   Git records **Nick Piggin** as author. The message carries Hugh Dickins’s sign-off, says “Cleanups by Nick Piggin,” and was committed by Linus. Use:

   > “The patch came from Hugh Dickins, was cleaned up and recorded in Git under Nick Piggin’s authorship, and was committed by Linus.”

   Also change the R2 receipt summary from “because it breaks s390” to the receipt’s narrower “because the check is problematic for s390 and `copy_one_pte`.” “Broke a real architecture” similarly overstates the record.

4. **Several console panels are not reproducible as printed.**

   The displayed lines exist in the receipts, but the commands shown would not produce those excerpts:

   - Line 107 uses `sed -n '5,11p'` but prints material from lines 6–13.
   - Line 170 uses `sed -n '5,15p'`; the displayed function is actually around lines 9–17 of that command’s output.
   - Line 215 uses `sed -n '5,8p'`; the shown three-line change is around lines 8–10.
   - Line 230 uses `sed -n '4,6p'`; the CVE comment is around lines 18–20.
   - The `%B` panels at lines 10, 39, and 73 silently omit output or insert a synthetic `...`.

   Regenerate every panel from the literal printed command. Either show exact contiguous output or turn shortened fragments into prose quotations. Do not present editorial ellipses as console output.

5. **The five-day gap is converted into a disclosure story the receipts cannot prove.**

   > “That gap is the coordinated-disclosure window”

   > “distributions were handed it privately”

   > “so the patch and the announcement could land together”

   > “The one time the two dates on a Torvalds commit disagree”

   R4 proves only an authored timestamp of October 13 and committed timestamp of October 18. It does not establish why, who received the patch, what announcement accompanied it, what Linus “usually” does, or that this was the sole exception.

   Keep the observable fact and its tension:

   > “The patch was authored five days before it was committed. Git records the delay; it does not explain it.”

   Anything stronger needs a separate verified source and a `CHECK`.

6. **The COW explanation is approachable but omits the mechanism that matters.**

   The first paragraph is legible, but “two programs … a pointer” is technically loose, while the next paragraph jumps directly to an attacker writing the original page. The unexplained object is `get_user_pages()` itself.

   Compress and sharpen:

   > “Two virtual mappings can point at one physical page. Their page-table entries are write-protected; a write faults, and the kernel normally gives the writer a private copy. `get_user_pages()` lets kernel code obtain the page behind such a mapping. In the 2005 race, another thread could change the page table during the fault, and a write retry could lose the fact that COW still had to happen.”

   Delete the unsupported explanation that 2005 machines were “mostly single-processor” and that added processor cores made the race reliable. R4 says the **VM became more scalable** and the race became easier to trigger; it does not supply that CPU-history causal chain.

7. **The 2016 repair is romanticized beyond the diff.**

   > “The write is allowed only once that flag confirms the copy really happened.”

   The flag alone does not confirm it; R6 checks `FOLL_COW` **and** `pte_dirty()`.

   > “now that the hardware everywhere could finally support it”

   R4 speaks specifically about the s390 situation, not universal hardware support.

   > “the idea was never wrong; only its timing was”

   This conflicts with both “attempted to be fixed once (badly)” and R2’s architectural objection. Replace the passage with the narrower point: the 2016 fix could reuse dirty-bit validation after the s390 obstacle had been removed, but with a different protocol.

8. **The record cannot support the chapter’s claims about what nobody remembered or left behind.**

   Unsupported assertions include:

   > “Nobody filed ‘come back when s390 is fixed.’”

   > “The knowledge … lived only in three people’s heads”

   > “nobody noticed”

   > “The 2005 revert … left nothing behind”

   > “what the three smartest people in the room forgot”

   Git cannot prove the absence of tickets, tests, discussion, or human memory. It demonstrably did leave commit messages and hashes behind.

   Use a bounded formulation:

   > “The supplied Git record shows no live tripwire connecting the later s390 repair to the old race; the 2016 commit had to reconstruct that connection from the two earlier commits.”

   Even “shows no live tripwire” should be based on a broader repository search if retained; otherwise say simply that the receipts do not show one.

9. **The Bitcoin section dilutes the protagonist and contains several unsupported expansions.**

   I would cut lines 208–241 entirely. It repeats a comparison already made elsewhere in the book, switches repositories at the climax, and turns a strong Linux chapter into a two-vulnerability thesis essay.

   Its factual problems reinforce that choice:

   - “could have let someone forge money,” “mint coins from nothing,” and “cost … dollars” require external support.
   - R10 says “Introduced by #9049”; it does not establish an “earlier refactor” that “looked completely reasonable.”
   - “The commit message is four words” is wrong: **“Fix crash bug with duplicate inputs” is six words.**
   - “Git history is the only place the true weight … is recorded” is false and contradicts the chapter’s own CVE references.
   - The Linux repair is not meaningfully “one token”; its 2016 diff is 13 insertions and two deletions. Calling both bugs one-token failures forces the analogy.

   This cut removes **319 words**. Add roughly 50 words of verified Dirty COW consequence and the body falls from 2,600 to about 2,330 words—a net cut of just over 10%.

10. **The at-home beat has the right artifact but makes an unproved sermon out of this case.**

   The ticket/test/comment examples are useful. The weak part is the declaration that “nothing behind” caused eleven years, plus this overstatement:

   > “`git log -S` … pull[s] up every commit that ever added or removed it”

   `-S` finds commits where the number of occurrences of the string changes; it can miss moves or rewrites with no count change.

   Make the exercise concrete:

   ```console
   git log --all --oneline --grep='[Rr]evert' -- path/to/file
   git log --all -S'exact_guard_or_flag' -- path/to/file
   git show <revert-hash>
   ```

   Then ask whether the revert names the condition that would make it safe to restore the old fix, and whether that condition is represented by a ticket, test, or comment. A particularly good narrator line would be:

   > “`git blame` explains the lines that survived. When the interesting line was removed, I switch to `git log -S`.”

11. **All four `CHECK` markers remain gates.**

   - **Lines 27–29: Dirty COW/CVE/local privilege escalation/disclosure date.**  
     Necessary: the name/CVE and privilege-escalation consequence are essential; the precise disclosure month is not.  
     Scope: R9 supports the Dirty COW–CVE-2016-5195 association, but not “local privilege escalation” or “disclosed October 2016.” Verify those externally or narrow to the receipt.

   - **Lines 115–117: Linux v3.9 “released around 2013.”**  
     Necessary: no. R4 already gives the stronger archaeological fact—software dirty bits made it into v3.9.  
     Scope: the commit and v3.9 are receipt-backed; the calendar translation is not. Delete “released around 2013” and the marker.

   - **Lines 140–143: Phil Oester, active exploitation, captured HTTP traffic, server ownership, naming.**  
     Necessary: active exploitation is the chapter’s best prospective blast-radius evidence. The HTTP mechanics and “he named it” are optional.  
     Scope: R4 supports only `Reported-and-tested-by: Phil "not Paul" Oester`. The marker combines four distinct external claims; split and verify them separately. Do not clear it from that credit line alone.

   - **Lines 236–238: CVE-2018-17144, denial of service, inflation, September fix.**  
     Necessary: only if the Bitcoin section survives; I recommend deleting it.  
     Scope: R11 links duplicate-input checking to the CVE. It does not prove the DoS/inflation consequences or that a released fix “shipped” in September. “Potentially” is appropriately cautious, but still needs a source.

## Optional suggestions

- Replace “crime scene,” “culprit,” “accomplice,” “not by a fool,” and “three smartest people” with plainer engineering language. They add courtroom theatre to a chapter whose strongest quality is that the 2005 decision was reasonable.

- Cut “one of the most serious Linux vulnerabilities ever shipped” and the sailors-and-reef close unless you can substantiate the ranking. A concrete consequence will carry more weight than superlative or metaphor.

- The long-tail paragraph should say the THP omission caused an **infinite loop**, not “an infinite loop and a variant hole.” R7 does not call it another security hole.

- Add one verified blast-radius paragraph where the Bitcoin section currently sits: what an unprivileged attacker could concretely gain, what evidence exists of real exploitation, and which systems or kernel range were exposed. That is the missing payoff for the SDE reader.
tokens used
48,288
Gate verdict: not ready. The hashes, named people, quoted diff lines, and core dates are present in the receipts, but several causal claims exceed the record. The draft also partially lapses into the wholesale-revert framing it meant to avoid.

## Must-fix gates

1. **The cold open spends the reveal twice.**

   The title, opening quotation, and lines 19–25 disclose the complete structure before the 2005 dig begins:

   > “already been found, already been fixed, and then un-fixed”

   > “deliberately let back out”

   The confession is an excellent turn, but a poor cold open if surprise remains a requirement. Open on `4 insertions, 17 deletions`, follow the two-day replacement, then reveal the 2016 confession around “The trap was set.” The reader will recognize the eleven-year shape just before Linus names it.

   The title does flip on a contents page: it has voice, culpability, and elapsed time. But if retained, do not immediately repeat and explain it. Alternatively, **“The Reason Expired”** preserves more of the reveal.

2. **The chapter does not consistently preserve the “replacement, not wholesale revert” distinction.**

   These lines restore the misleading version:

   > “the hole … had already been found, already been fixed, and then un-fixed”

   > “Two days later … the fix comes back out.”

   > “The theoretical race went back to being theoretical.”

   > “The 2005 revert was correct and left nothing behind”

   R2 says the `pte_dirty` check was reverted and replaced with the `VM_FAULT_WRITE` protocol. Fix the framing throughout:

   > “Two days later, the dirty-bit approach was replaced with a more elaborate protocol.”

   Then let the 2016 message establish that the ancient bug nevertheless survived. “Deliberately let back out” must go: the record supports an attempted replacement, not a conscious decision to reopen a hole.

   The draft successfully avoids the “weekend it was named” folklore. Keep it that way.

3. **The R2 authorship is misstated.**

   > “the commit is authored by Hugh Dickins, cleaned up by Nick Piggin, committed by Linus”

   Git records **Nick Piggin** as author. The message carries Hugh Dickins’s sign-off, says “Cleanups by Nick Piggin,” and was committed by Linus. Use:

   > “The patch came from Hugh Dickins, was cleaned up and recorded in Git under Nick Piggin’s authorship, and was committed by Linus.”

   Also change the R2 receipt summary from “because it breaks s390” to the receipt’s narrower “because the check is problematic for s390 and `copy_one_pte`.” “Broke a real architecture” similarly overstates the record.

4. **Several console panels are not reproducible as printed.**

   The displayed lines exist in the receipts, but the commands shown would not produce those excerpts:

   - Line 107 uses `sed -n '5,11p'` but prints material from lines 6–13.
   - Line 170 uses `sed -n '5,15p'`; the displayed function is actually around lines 9–17 of that command’s output.
   - Line 215 uses `sed -n '5,8p'`; the shown three-line change is around lines 8–10.
   - Line 230 uses `sed -n '4,6p'`; the CVE comment is around lines 18–20.
   - The `%B` panels at lines 10, 39, and 73 silently omit output or insert a synthetic `...`.

   Regenerate every panel from the literal printed command. Either show exact contiguous output or turn shortened fragments into prose quotations. Do not present editorial ellipses as console output.

5. **The five-day gap is converted into a disclosure story the receipts cannot prove.**

   > “That gap is the coordinated-disclosure window”

   > “distributions were handed it privately”

   > “so the patch and the announcement could land together”

   > “The one time the two dates on a Torvalds commit disagree”

   R4 proves only an authored timestamp of October 13 and committed timestamp of October 18. It does not establish why, who received the patch, what announcement accompanied it, what Linus “usually” does, or that this was the sole exception.

   Keep the observable fact and its tension:

   > “The patch was authored five days before it was committed. Git records the delay; it does not explain it.”

   Anything stronger needs a separate verified source and a `CHECK`.

6. **The COW explanation is approachable but omits the mechanism that matters.**

   The first paragraph is legible, but “two programs … a pointer” is technically loose, while the next paragraph jumps directly to an attacker writing the original page. The unexplained object is `get_user_pages()` itself.

   Compress and sharpen:

   > “Two virtual mappings can point at one physical page. Their page-table entries are write-protected; a write faults, and the kernel normally gives the writer a private copy. `get_user_pages()` lets kernel code obtain the page behind such a mapping. In the 2005 race, another thread could change the page table during the fault, and a write retry could lose the fact that COW still had to happen.”

   Delete the unsupported explanation that 2005 machines were “mostly single-processor” and that added processor cores made the race reliable. R4 says the **VM became more scalable** and the race became easier to trigger; it does not supply that CPU-history causal chain.

7. **The 2016 repair is romanticized beyond the diff.**

   > “The write is allowed only once that flag confirms the copy really happened.”

   The flag alone does not confirm it; R6 checks `FOLL_COW` **and** `pte_dirty()`.

   > “now that the hardware everywhere could finally support it”

   R4 speaks specifically about the s390 situation, not universal hardware support.

   > “the idea was never wrong; only its timing was”

   This conflicts with both “attempted to be fixed once (badly)” and R2’s architectural objection. Replace the passage with the narrower point: the 2016 fix could reuse dirty-bit validation after the s390 obstacle had been removed, but with a different protocol.

8. **The record cannot support the chapter’s claims about what nobody remembered or left behind.**

   Unsupported assertions include:

   > “Nobody filed ‘come back when s390 is fixed.’”

   > “The knowledge … lived only in three people’s heads”

   > “nobody noticed”

   > “The 2005 revert … left nothing behind”

   > “what the three smartest people in the room forgot”

   Git cannot prove the absence of tickets, tests, discussion, or human memory. It demonstrably did leave commit messages and hashes behind.

   Use a bounded formulation:

   > “The supplied Git record shows no live tripwire connecting the later s390 repair to the old race; the 2016 commit had to reconstruct that connection from the two earlier commits.”

   Even “shows no live tripwire” should be based on a broader repository search if retained; otherwise say simply that the receipts do not show one.

9. **The Bitcoin section dilutes the protagonist and contains several unsupported expansions.**

   I would cut lines 208–241 entirely. It repeats a comparison already made elsewhere in the book, switches repositories at the climax, and turns a strong Linux chapter into a two-vulnerability thesis essay.

   Its factual problems reinforce that choice:

   - “could have let someone forge money,” “mint coins from nothing,” and “cost … dollars” require external support.
   - R10 says “Introduced by #9049”; it does not establish an “earlier refactor” that “looked completely reasonable.”
   - “The commit message is four words” is wrong: **“Fix crash bug with duplicate inputs” is six words.**
   - “Git history is the only place the true weight … is recorded” is false and contradicts the chapter’s own CVE references.
   - The Linux repair is not meaningfully “one token”; its 2016 diff is 13 insertions and two deletions. Calling both bugs one-token failures forces the analogy.

   This cut removes **319 words**. Add roughly 50 words of verified Dirty COW consequence and the body falls from 2,600 to about 2,330 words—a net cut of just over 10%.

10. **The at-home beat has the right artifact but makes an unproved sermon out of this case.**

   The ticket/test/comment examples are useful. The weak part is the declaration that “nothing behind” caused eleven years, plus this overstatement:

   > “`git log -S` … pull[s] up every commit that ever added or removed it”

   `-S` finds commits where the number of occurrences of the string changes; it can miss moves or rewrites with no count change.

   Make the exercise concrete:

   ```console
   git log --all --oneline --grep='[Rr]evert' -- path/to/file
   git log --all -S'exact_guard_or_flag' -- path/to/file
   git show <revert-hash>
   ```

   Then ask whether the revert names the condition that would make it safe to restore the old fix, and whether that condition is represented by a ticket, test, or comment. A particularly good narrator line would be:

   > “`git blame` explains the lines that survived. When the interesting line was removed, I switch to `git log -S`.”

11. **All four `CHECK` markers remain gates.**

   - **Lines 27–29: Dirty COW/CVE/local privilege escalation/disclosure date.**  
     Necessary: the name/CVE and privilege-escalation consequence are essential; the precise disclosure month is not.  
     Scope: R9 supports the Dirty COW–CVE-2016-5195 association, but not “local privilege escalation” or “disclosed October 2016.” Verify those externally or narrow to the receipt.

   - **Lines 115–117: Linux v3.9 “released around 2013.”**  
     Necessary: no. R4 already gives the stronger archaeological fact—software dirty bits made it into v3.9.  
     Scope: the commit and v3.9 are receipt-backed; the calendar translation is not. Delete “released around 2013” and the marker.

   - **Lines 140–143: Phil Oester, active exploitation, captured HTTP traffic, server ownership, naming.**  
     Necessary: active exploitation is the chapter’s best prospective blast-radius evidence. The HTTP mechanics and “he named it” are optional.  
     Scope: R4 supports only `Reported-and-tested-by: Phil "not Paul" Oester`. The marker combines four distinct external claims; split and verify them separately. Do not clear it from that credit line alone.

   - **Lines 236–238: CVE-2018-17144, denial of service, inflation, September fix.**  
     Necessary: only if the Bitcoin section survives; I recommend deleting it.  
     Scope: R11 links duplicate-input checking to the CVE. It does not prove the DoS/inflation consequences or that a released fix “shipped” in September. “Potentially” is appropriately cautious, but still needs a source.

## Optional suggestions

- Replace “crime scene,” “culprit,” “accomplice,” “not by a fool,” and “three smartest people” with plainer engineering language. They add courtroom theatre to a chapter whose strongest quality is that the 2005 decision was reasonable.

- Cut “one of the most serious Linux vulnerabilities ever shipped” and the sailors-and-reef close unless you can substantiate the ranking. A concrete consequence will carry more weight than superlative or metaphor.

- The long-tail paragraph should say the THP omission caused an **infinite loop**, not “an infinite loop and a variant hole.” R7 does not call it another security hole.

- Add one verified blast-radius paragraph where the Bitcoin section currently sits: what an unprivileged attacker could concretely gain, what evidence exists of real exploitation, and which systems or kernel range were exposed. That is the missing payoff for the SDE reader.
