I'll read the draft, receipts, and book context first, then gate every hash, date, quote, and craft risk against the locked spine.Next I’ll read the draft and receipts side by side so every quoted hash, date, and line can be gated.I’ll verify weekday math, quoted command output, word count, and the external CHECK claims against the receipts and the public record.The review prompt and a published chapter will show the expected gate format and the voice this draft has to match.The console fences and a few paraphrases overstate the record. I’ll write the gate list against the receipts, then the CHECK inventory and the six craft risks.Body is 2,600 words to `## Receipts` (TEMPLATE count). Folklore checks: the draft does **not** call `f33ea7f4` a wholesale revert (the undo section correctly says they “reverted the approach and replaced it”), and it never uses “the weekend it was named.” Those two stay clean. Everything below is what does not.

---

## Gate (must-fix)

**1. Console fences that a reader cannot reproduce.**
CONTEXT’s rule is that a ` ```console ` block is a command plus its output. Several panels here are editorially stitched. A reader who runs the command gets something else — the same class of bug that bit ch.05.

- **2005 message** (`The first fix`): the command is `git show -s --format='%B' 4ceb5db9…` with no `sed`/`head`, but the panel emits `...` and drops `and thus` from the “losing the dirty bit” sentence. Git never prints `...`. Fix: either paste R1’s body whole, or add `| sed -n '1,9p'` (or similar) and quote those lines verbatim, including `and thus`.
- **“What the years changed”**: command is `| sed -n '5,11p'` of `%b`. Actual lines 5–11 of that body are a blank, the full “In the meantime…” paragraph (including `abf09bed3cce` / `v3.9`), and another blank. The panel shows a truncated “In the meantime…” plus the “Also, the VM…” paragraph, which is lines 12–13. Fix: use `sed -n '6,13p'` and quote R4 without `...`.
- **`can_follow_write_pte` panel**: command is `show … -- mm/gup.c | sed -n '5,15p'`. That range starts at the `@@` hunk header and ends mid-return; it does not start at `+/*` and does not include the closing `}`. The function as printed *is* in R6. Fix: point the command at R6’s combined diff (`-- include/linux/mm.h mm/gup.c | sed -n '13,33p'`) or retarget the gup.c-only range so it matches.
- **Bitcoin `false`→`true`**: command is `| sed -n '5,8p'`. Lines 5–8 are the `@@` header, a blank, `// Check transactions`, and the `for` line. The `false`/`true` lines are **9–10**. Fix: `sed -n '8,10p'`.
- **Bitcoin CVE comment**: command is `| sed -n '4,6p'` on `38bfca6b -- src/validation.cpp`. Line 4 of that show is `+++ b/src/validation.cpp`; lines 5–6 are the **first** hunk (BIP30 / CVE-2012-1909). The quoted `// Must check for duplicate inputs (see CVE-2018-17144)` is the second hunk, R11’s `sed -n '14,21p'`. This is the dangerous one: a reader running the printed command lands on a different CVE. Fix: use the R11 range.

The opening 2016 `%B` panel is the same pattern (command would print the whole body; the fence stops after paragraph one) but at least what it shows is prefix-true. Give it `| sed -n '1,6p'`.

**2. “Authored by Hugh Dickins” is not what git records.**

> “the commit is authored by Hugh Dickins, cleaned up by Nick Piggin, committed by Linus himself [R2]”

R2: `Author: Nick Piggin <nickpiggin@yahoo.com.au>`, then `Signed-off-by: Hugh Dickins`, then `[ Cleanups by Nick Piggin ]`, then Linus as committer. The spine’s “Dickins/Piggin/Torvalds” is fair as a trio credit; “authored by Hugh Dickins” is not. Fix: “signed off by Hugh Dickins, cleaned up and recorded as author by Nick Piggin, committed by Linus.” Same fix in the Receipts list line for R2.

**3. “Fourteen lines” is a misread of `--stat`.**

> “The actual repair is fourteen lines [R4]”

R4: `2 files changed, 13 insertions(+), 2 deletions(-)`. The `14` is only `mm/gup.c | 14 ++++++++++++--` (12 ins + 2 del). Fix: “thirteen insertions and two deletions” (or “the `gup.c` hunk is twelve insertions and two deletions”).

**4. Bitcoin subject is truncated, then miscounted.**

> “The commit message is four words of understatement — "Fix crash bug with duplicate inputs"”

R10 subject: `Fix crash bug with duplicate inputs within a transaction` — eight words, not four, and the quoted six-word clip is not the subject. Fix: quote the full subject; drop the word count, or call it understatement without counting.

**5. “The one time” the author/commit dates disagree is false.**

> “The one time the two dates on a Torvalds commit disagree, the disagreement is itself a security artifact.”

The five-day gap on `19be0eaf` is real (R4: authored `2016-10-13T13:07:36-07:00`, committed `2016-10-18T14:13:29-07:00`). Walking 80 Torvalds-authored commits ending at that hash, six already have mismatched dates (printk splits hours apart; `netfilter: Fix slab corruption` is overnight). Fix: “a five-day gap, on a commit Linus both authored and committed” — do not claim uniqueness.

**6. The five-day gap is not, on this record, “the coordinated-disclosure window.”**

> “That gap is the coordinated-disclosure window: the fix existed, finished, for five days before it entered the public tree, while distributions were handed it privately so the patch and the announcement could land together.”

R4 shows the gap, `Acked-by: Hugh Dickins`, `Reviewed-by: Michal Hocko`, and `Cc: stable@vger.kernel.org`. It does not say embargo, distros, or coordinated disclosure. Review is an equally supported reading of the same five days. This is a causal “because” the receipts cannot carry. Fix: report the gap and the `Cc: stable`; if you want disclosure, put it behind a CHECK with a distro advisory dated against Oct 18–20, and do not let the CHECK do all the work of the paragraph.

**7. The “second clock” invents hardware Linus did not name.**

> “The machines of the era are mostly single-processor”
> “the window that was nearly impossible to hit on a 2005 uniprocessor became something an attacker with a tight enough loop could hit reliably on 2016 hardware.”
> “no commit made it dangerous. Time did.”

R4: “the VM has become more scalable, and what used a purely theoretical race back then has become easier to trigger.” That is kernel concurrency, not “2005 was uniprocessor.” SMP was already the Linux story in 2005; “reliably” / “tight enough loop” are not in the receipts (Oester’s “< 5 seconds” is external and isn’t even on the nearby CHECK). Fix: stay inside Linus’s two sentences. If you want the exploit-reliability beat, CHECK it separately and attach it to Oester, not to 2005 hardware.

**8. Opening language slides toward the wholesale revert you correctly avoided later.**

> “already been found, already been fixed, and then un-fixed”
> “deliberately let back out”

`f33ea7f4` replaced the `pte_dirty` check with `VM_FAULT_WRITE` / the FOLL_WRITE game; it did not put 4ceb5db9’s tree back. The undo section already has the right sentence (“They reverted the approach and replaced it with a more elaborate mechanism”). Fix the open to that sentence. “Let back out” is the folklore-adjacent slip. Linus’s “undone” is quotable; it does not license “un-fixed” as a tree fact.

**9. 2017 THP is an infinite loop, not “a variant hole.”**

> “leaving an infinite loop and a variant hole”

R7: `follow_trans_huge_pmd` forgotten → “infinite loop in the kernel.” It does not describe another Dirty-COW-class write. Fix: drop “variant hole.” The infinite loop and `Cc: stable` are enough.

**10. Bitcoin: “refactor,” “someone forge money,” “mint coins from nothing” overstate R10/R11.**

R10: `Fix crash bug with duplicate inputs within a transaction` / `Introduced by #9049` / `false` → `true`. R11: `// Must check for duplicate inputs (see CVE-2018-17144)`. The receipts do not call #9049 a refactor, do not say inflation, and do not name a miner. Bitcoin Core’s later disclosure does: PR #9049 was an *optimization* that skipped a duplicate-input check, and the inflation case is a **miner** including such a transaction in a block — not “someone” forging money. Those claims belong on CHECK 4, and the CHECK’s scope should say miner/inflation, not a general forge. Until then, the prose can only say: one boolean, introduced by #9049, later labeled CVE-2018-17144 next to that call.

**11. Hyperbole with no CHECK and no receipt.**

> “one of the most serious Linux vulnerabilities ever shipped”

Red Hat rated it Important (local). Ars used “most serious” as a headline; that is not a receipt. Fix: cut, or CHECK a specific claim (local root, in the wild, every 2.6.22–4.8.3 machine).

---

## CHECK inventory

**CHECK 1** (open): “Dirty COW = CVE-2016-5195, a local privilege-escalation race… disclosed October 2016.”

- (a) **The name pairing is not necessary as a CHECK** — R9 already has `Dirty COW (CVE-2016-5195)`. LPE and “disclosed October 2016” *are* necessary if you want blast radius the SDE reader will score; receipts only give the in-tree name six years later.
- (b) Scope is fine **if** you keep LPE + disclosure date and drop the name/CVE identity (already gated by R9). “Disclosed October 2016” is the fix/commit window (authored 13th, committed 18th); public writeups are Oct 19–20. Don’t write “disclosed” as if R4 were the advisory.

**CHECK 2** (years changed): `abf09bed3cce` “s390/mm: implement software dirty bits” in v3.9, “released ~2013.”

- (a) **Necessary as a year**, not as a hash. The hash and `v3.9` are already in R4. The year is what makes Clock 1 tick (reason died years before 2016).
- (b) Accurate: that commit is `2012-11-07`; v3.9 is April 2013. Drop the tilde; say “v3.9, 2013.” Once you quote `sed` correctly, the reader sees `v3.9` in the panel and the CHECK only has to carry the calendar year.

**CHECK 3** (Oester): “discovered Dirty COW being actively exploited in the wild, from an HTTP exploit captured on a server he ran; **he named it**.”

- (a) **The in-the-wild capture is necessary** — it is the chapter’s only blast-radius beat that isn’t “eleven years.” Receipts only have `Reported-and-tested-by: Phil "not Paul" Oester`.
- (b) **“He named it” is false.** Ars / Help Net Security: Oester extracted an uploaded binary from HTTP captures on his own webservers. The name “Dirty COW” is the dirtycow.github.io branding, not his. The prose does not say he named it; the CHECK does. Strike “he named it.” Tighten the prose “compromised server’s captured traffic” to “an exploit binary he pulled from HTTP captures on a server he ran.”

**CHECK 4** (Bitcoin CVE-2018-17144): “consensus/inflation… DoS and coin inflation via duplicate inputs… September 2018.”

- (a) Necessary **only if the cousin section survives**. If you cut Bitcoin, delete the CHECK.
- (b) Directionally right (Core’s 2018-09-20 notice: DoS + inflation, fix in 0.16.3 on the 18th, report on the 17th). Scope it to a miner inflating supply, and to the later comment as the in-repo naming, not as the disclosure itself.

---

## Craft risks

**1. Cold open on the 2016 confession — earned object, spent reveal.**
The confession is the best object in the material, and for an SDE reader it does the job the Git/Costume chapters failed: this is not stakes-free archaeology. Keep the quote as the open.

What fails is the next two beats. The title is the confession; the first panel is the confession; paragraph three then names Dirty COW / CVE-2016-5195 and immediately says “names came at the end.” That is the chapter contradicting itself. The reader should feel Dirty COW a sentence before R9 says it. Fix: keep the 2016 panel, cut the CVE name from the open entirely, and let “eleven years” + `get_user_pages` do the work for people who already know. Everyone else gets the name when Hildenbrand says “Ever since the Dirty COW (CVE-2016-5195)” — which is the actual “names came at the end” the open promised.

**2. COW explanation — yes, it is legible, and it does not bore.**
“Two programs, the illusion of two pages, the cost of one” is the right altitude: a non-kernel reader can hold it, an SDE does not need a PTE lecture. Do not add `madvise` / `/proc/self/mem`. Do add **one** consequence sentence after the race, not more mechanism: the write can land on a page the process was only allowed to read — which, later, is how an unprivileged user dirties a root-owned mapping. That is the SDE’s real-world hook. The current explainer stops at “illusion punctured.”

**3. Bitcoin cousin — it dilutes. Cut it, or shrink it to four sentences.**
The published book just demoted a chapter for multi-story sprawl. This chapter already has a protagonist (Linus), a two-day undo, an eleven-year fuse, and a 2016–2022 tail. Bitcoin brings new names (Daftuar, lucash-dev), a new repo, and a different failure mode. The one-token thesis is already made by `4 insertions, 17 deletions` and by `FOLL_COW`. `git log -S` at home *is* the transferable habit; Bitcoin is a second exhibit of the same habit.

SELECTION once paired them. Calibration since then is “one person, one artifact.” If you keep a cousin, one paragraph: the diff, the crash-bug subject, the later comment. Not a section with two panels.

**4. At-home tripwire — the thesis is right; the beat is a sermon plus a generic tool.**
“When you revert a fix, the hole does not go back in the box” is the chapter’s actual takeaway, and it is earned by 2005. What is missing is the artifact they should have left. Don’t list “open ticket / test / comment.” Write the comment 2005 did not ship, in the voice of that patch:

`/* pte_dirty follow is safe only once s390 has software dirty bits. Until then we take the VM_FAULT_WRITE path. Revisit when that lands. */`

That is concrete. Then one command: `git log -S 'pte_dirty' -- mm/memory.c` (or whatever the 2005 token was), not a generic “run `git log -S` on a suspicious boolean.” The boolean hunt is the Bitcoin chapter’s at-home, smuggled in.

**5. Title — it flips, in this book’s house style. Keep it.**
`One character`, `THIS IS A HACK TO GET V4 OUT THE DOOR`, `The current maintainer` also refuse to name the CVE. On a P.S. contents page, “Fixed once (badly) by me eleven years ago” is Linus’s mouth before you know it is Linus’s mouth. That is a flip.

Two nits, not gates: (i) the confession says “**attempted** to be fixed once (badly)”; dropping “attempted to be” makes 2005 sound like a completed fix. Small, but it is the whole story. (ii) Title + open + first panel are the same line three times. If the title stays, the open can afford to start one sentence later — “Most commit messages are written to explain a change…” — and not reprint the eleven-year clause in narration before the panel.

**6. Where to cut 10% (~260 words, down to ~2,340).**
In order, what they buy:

| Cut | ~Words | Why |
|---|---|---|
| Entire “one-character cousin” | ~290 | Exactly the 10%, and the sprawl fix. Do this first. |
| If Bitcoin stays: 2020 “break either way” paragraph | ~80 | Aftermath without new consequence; 2022 already names the reef. |
| Open, from “This one names the crime scene” through “let back out” | ~90 | Repeats the undo section, and it is the revert-slip. |
| “not Paul” human-interest (tired of being confused / immortalized / smoldering) | ~50 | The credit line is the joke; the gloss is costume-chapter energy. |
| Second pass on the COW explainer (keep the homely trick; cut the recap of the race in the next paragraph) | ~40 | You explain it, then explain it again as the 2005 window. |

Do not cut the undo’s “I want to be scrupulously fair” paragraph. That is the book’s non-negotiable, and it is the reason this chapter is not sneering. Do not cut the 2022 Hildenbrand quote if you have taken Dirty COW out of the open — that quote becomes the turn.

---

## Optional

- Rename **“The half-second that wasn’t.”** Nothing in the chapter is a half-second (Oester’s number, external, is “< 5 seconds”). It reads as a leftover heading. “Reported-and-tested-by” is the object.
- First person is thin: two “I want…” and a closing “You only have to ask it.” The diagnosis was exhibits-without-a-narrator. One more inhabited beat — sitting in the five-day gap *as an engineer looking at `AuthorDate` ≠ `CommitDate`* — would do more than another year of aftermath.
- Blast radius is still under-served for the SDE calibration. After CHECKs 1 and 3 clear, spend four sentences on: local root, in the wild, Android/servers, eleven years in every tree that had not backported. That is the xz-style “how far the payload got” ending this chapter currently lacks. The 2017/2020/2022 tail is not that ending.
- “Nobody filed ‘come back when s390 is fixed.’” You cannot prove an absence from these receipts. Soften to: the replacement commit does not mention coming back.
