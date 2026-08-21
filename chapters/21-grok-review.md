# Gate review: “Said public when I meant private”

Chapter 21, Node.js / io.js, P.S. candidate. Body **2,196** words by the TEMPLATE counter (`awk` to `## Receipts`); **2,109** with `<!-- CHECK -->` comments stripped. Against a 2,200–3,200 band. Factual gate plus craft. One flag gates: **FAIL.**

The plot is the right plot: a private constitution, a four-week clock, a binary that changes its name, a homecoming, and a changelog that claims a parent git will not acknowledge. Distinct from “Remove promises” (nothing shared but the clone) and from ffmpeg (reunification-by-document, not a hostile-merge war). What gates is a truncated console fence, two claims the receipts’ own diffs contradict, a git-word that fiFactual gate: **FAIL.** Body is **2,196** words by the TEMPLATE counter (2,109 with CHECK comments stripped) — undFactual gate: **FAIL**. Eight of nine console fences reproduce. The failures are surrounding claims, one truncated hunk, and a symlink the receipts’ own diff does not add.

---

## CHECK markers

**1. Joyent / TJ Fontaine** (lines 50–52)

> Node.js was corporately stewarded by Joyent in 2014; TJ Fontaine was Joyent's Node.js project lead at the time; community frustration over release cadence and governance drove the fork; needs external source.

Necessary, but too wide. Joyent-as-steward is already in the ledger (`joyent/node` URLs in R2, “remind Joyent” in R3). Fontaine’s *title* is not: R2 only records an unaccepted invitation. Keep a marker on the title (or cut “the man running the official project at Joyent”). Cut “community frustration … drove the fork” from the marker and from the prose until a contemporaneous source exists — that is the rebels’ diagnosis stated as fact. “Most important young platform on the server” sits *outside* this marker and needs a source or a deletion.

**2. io.js 1.x–3.x timeline** (lines 148–150)

> io.js shipped independent releases v1.0.0 (Jan 2015) through v3.3.0 (Sep 2015), on a rapid cadence, while joyent/node remained on 0.10/0.12; needs external source for the release timeline.

Necessary for the v4 numbering turn, but it should not stay external. This clone already has the tags (`v1.0.0` 2015-01-14, `v2.0.0` 2015-05-04, `v3.0.0` 2015-08-04, `v3.3.0` 2015-09-02; `v0.12.0` 2015-02-06). `scripts/receipts-21.sh` already has an R12 for them; `chapters/21-iojs.receipts.md` does not. Add the tag listing to the receipts, then retire this CHECK. Until then, “through the spring of 2015” and “1.x, 2.x, 3.x” overstates: v3.0.0 is August, v3.3.0 is September, and 0.12.0 shipped *after* io.js 1.0.0.

**3. Convergence / Foundation** (lines 168–169)

> the io.js/Node.js convergence of mid-2015 produced the Node.js Foundation, with Joyent transferring stewardship and io.js merging back; needs external source.

Indispensable. “Based on the recent convergence” (R6) does not name a foundation, a transfer, or a cession. Verify Foundation formation and stewardship change from a primary source, then write it as a transfer, not a surrender. “Joyent ceded the project … and the fork agreed to come home” is CHECK 3 plus a winner’s narrative.

---

## Must-fix gates

**1. The first console hunk is not reproduce-true.**

Lines 26–36 print this command with no `sed`:

```text
$ git -C repos/node show --format='' --no-ext-diff e7dec60a63b9171465fd4037a04aeb709198aea2 -- doc/tc-meetings/2014-10-29.md
```

and stop after the `+` line. A reader running that command gets three more context lines, which R3 already prints in full:

```text
  * "four weeks" is up on November 8th
  * someone on the Advisory Board needs to remind Joyent of this in the
    next advisory board meeting so they aren't suprised by it even though
```

Fix: print the whole hunk (it is only 13 lines), or add `| sed -n '1,10p'` if you truly want the short cut. Do not leave a bare `git show` over a truncated hunk. This is the cold-open exhibit; it has to be exact.

**2. `f60abb0c` is not the first commit on the stranded branch.**

Line 53: “the first commit on the stranded branch *is* the plan.” False. `origin/archived-io.js-v0.10 --not origin/main` is sixteen commits; `f60abb0c` is the fifth. The first four are Timothy J Fontaine’s “node: Now working on v0.13.0”, two `upstream/v0.12` merges, and cjihrig’s `net:` change. R1 looks like it supports the sentence only because its log is path-filtered to `CONTRIBUTING.md` and `doc/tc-meetings`.

Fix: “the first *governance* commit on the stranded branch is the plan,” or “On October 1 the branch acquires its plan.” Do not call it first.

**3. `a69ab27a` does not add the `iojs -> node` symlink.**

Line 172: “The build system even gains, in the same file, an `iojs -> node` compatibility symlink.” Receipts-list R6: “installer restores `bin/node` and adds the `iojs -> node` symlink.” Both are false. R6’s own diff shows the comment as unchanged context (no `+`). The parent tree already has:

```text
# Install iojs -> node compatibility symlink.
...
try_symlink('iojs', link_path)
```

with `link_target = 'bin/node'`. `a69ab27a` only restores `bin/node` as the installed binary; the symlink block is leftover from January. The locked spine is wrong on this point relative to the receipts.

Fix the prose to what R6 actually shows: the installer still *carries* that comment and `try_symlink` after the rename-back. Fix the R6 bullet the same way. Do not build the blast radius on “the rename-back required a symlink.” The poetic line (“the fork's name reduced … to an alias”) is also the wrong arrow: the leftover code is `bin/node -> iojs`, not `iojs -> node`.

**4. Do not call v3.3.0 v4’s parent.**

Lines 192–195:

> The written record declares its parent: Node 4 is io.js 3.3, continued. … The rebels' release line became the official one.

“Parent” is the Git relationship R9 disproves. “Release line became the official one” will be read as branch ancestry. The supported claim is changelog-baseline continuity.

Replace with: “The changelog declares its comparison baseline: this list is relative to io.js v3.3.0. The published numbers keep the fork’s counting — v1, v2, v3, then Node v4.”

In the receipts list, R7 currently reads “an ancestor of v4.0.0.” True of `8a9a3bf7`, easy to misread as true of `v3.3.0`. Write: “the separate changelog-import commit `8a9a3bf7` is an ancestor of v4.0.0; the v3.3.0 *tag* is not.”

Add the printed seam command (`merge-base --is-ancestor …; echo $?` → `1`) to R9. The `1` is reproduce-true and not in the receipts file.

**5. Scope “declared, not merged” to the two release tags.**

Lines 177 and 213–217: “two places that disagree” and “That seam is the true shape of the reunification.” R9 proves `v3.3.0^{}` is not an ancestor of `v4.0.0^{}` (151 vs 209 from `a020d9a5`). It does not prove convergence contained no merges.

Fix: “two layers that answer different questions.” Then: “The continuity *asserted between these two releases* is editorial, not ancestral. That does not mean the projects never merged; it means the v3.3.0 release commit is not in v4.0.0’s parent chain. This particular continuity was declared, not merged.” Cut “which is why nobody has needed to look underneath it for a decade” — that causal claim is not in the receipts.

**6. R1 as printed does not prove “reachable from no other ref.”**

Lines 8–10 and the R1 bullet: “sixteen commits that are reachable from nowhere else … Not from `main`, not from any release.” The printed R1 command is `--not origin/main`, plus `branch -r --contains` on the *tip* only. “Any release” is a tag claim R1 never makes.

The stronger check (every ref except `refs/remotes/origin/archived-io.js-v0.10`, plus `tag --contains` on the tip) does return 16 and zero tags in this clone — and `scripts/receipts-21.sh` already has it as R11, which is **not in** `chapters/21-iojs.receipts.md`. Regenerate so R11 (and R12) exist, then keep the locked sentence. Do not leave the spine resting on `--not origin/main`.

**7. The blast radius is a victory speech, not a cost.**

Lines 221–224: “no body count: no code lost, no community split that lasted longer than nine months … permanent constitution of one of the most-used platforms on earth.”

- “No code lost” is false-adjacent: R9 just showed 151 commits on the v3.3.0 side of the divergence.
- “Nine months” is not in the receipts and depends on whether the war starts at October 1, December 1, or January 8.
- “Most-used platforms” / “permanent constitution” are unsourced superlatives.

Delete them. Consequence the SDE reader will score: after Foundation verification (CHECK 3), the published Node line numbers from the fork; the changelog of v4.0.0 is relative to a release it is not descended from; bisect and “every change since 3.3.0” both go wrong at that seam. That is the real-world cost. Line 226, “A version number that starts at 4 because someone else spent 1 through 3,” is the right artifact — keep it, lose the parade.

**8. Cite R2 only for what R2 holds.**

Lines 73–74: “one of them TJ Fontaine, the man running the official project at Joyent [R2].” R2 has the invitation and the non-acceptance. It does not have the job title. Move the title behind CHECK 1, or drop it: “one of them TJ Fontaine, invited, not accepted.”

**9. The ledger is the organizers’ side. Say so.**

Lines 76–77 (“You write it about a specific employer”) and 109 (“holding a loaded fork and drafting the press release that says it isn't one”) are prosecutorial while Joyent never speaks. “There is no sneering available here; read the room” (line 109) *announces* fairness instead of practicing it. The ffmpeg chapter steelmanned both structures in two sentences; this chapter does not.

Keep the 30% inference, mark its limit: “The rule names employer concentration as the problem this group chose to write down. These minutes are their diagnosis, not Joyent’s answer.” Replace the loaded-fork sentence with the minutes’ actual worry: warn Joyent before going public, and message a “soft” fork. Cut “it did not belong to its contributors” (line 48) and “the people with their hands on the code” (lines 79–80) — those are the demoted Node chapter’s thesis in different clothes.

**10. At-home commands overclaim, and the body is under the band.**

Lines 233–243:

- `rev-list --count <branch> --not origin/main` finds commits absent from main, not commits unique among every ref. Say exactly that.
- `git merge-base --is-ancestor v3 v4` prints nothing; the lesson is the exit status. Add `; echo $?`.
- Cut “A branch nobody merged and nobody deleted is usually a branch somebody couldn't bring themselves to do either to.” Speculation.
- “The graph tells you what happened” restates the documents-versus-truth trap the seam just dismantled. “The graph tells you how the commits relate.”

Template count: **2,196** body words (four under 2,200), including inline CHECK text; reader-visible after stripping comments is **~2,109**. Do not pad. Cut ~150 words of exhibit translation (the six-name TC roster, “Read it slowly, because every line is load-bearing,” the README paraphrase that restates the panel). Put ~250–350 into: CHECK 3 once sourced, the one-sided-record sentence, and one first-person engineering beat at the seam — bisecting or trusting “relative to v3.3.0” and landing in the 151/209 hole. Right now the narrator is a curator. The book’s narrator runs `blame` daily.

---

## Optional suggestions

**Title.** It flips. The reader sees `public` become `private` in the hunk a beat before the prose names the private room, and the last sentence returns the title without a second pun. Keep it.

**Plot.** Rehearsal → four weeks → io.js → homecoming → seam holds as one war, not a tour. The seam currently feels bolted on because “So who won?” starts a new question. Bridge: “Renaming the executable settled the product’s name. Importing the changelog settled which release history the reunited project would publish.” Then the `is-ancestor` panel.

**“Five weeks later”** (line 135) is 38 days; leave it. **“four quiet words”** (line 166) is five (`based on the recent convergence`). Say “five” or drop the count.

**Distinctness.** Clear of “Remove promises” at the receipt level (no Promises, no `sys`, no Ryan Dahl Saturday). The remaining overlap is thematic: daily workers versus corporate stewardship. Gate 9’s cuts handle it. Distinct from ffmpeg if the seam stays the thesis: ffmpeg is a hostile-merge war that never fully reunifies (“The position does not exist anymore”); this is a governance rupture rehearsed in a private repo and closed by a document that claims a parent git will not grant. Keep the rename-out/rename-back short so the chapter does not read as a second string-replacement fork war. The binary rename is the right “it became a product” beat; it is not the turn.

**Optional enrichment, only if you un-filter R1.** The first unique commits on the stranded branch are TJ Fontaine’s v0.13 work. That is Joyent’s side sitting on the same shelf as the war-room minutes. One sentence of that, receipted, would do more for fairness than any disclaimer — and it would make “sixteen stranded commits” a room instead of a count. Do not add it without putting the unfiltered log in the receipts. Do not let it become a second plot.

**Receipts-script drift.** `scripts/receipts-21.sh` already contains R11 (unique vs every other ref) and R12 (v1/v2/v3/v3.3.0 tags). The receipts file on disk ends at R10. Regenerating closes gates 2-adjacent, 6, and CHECK 2. Do that before the next draft, not after.
en the prose can say what the tags say, and this CHECK shrinks to nothing — or to “rapid cadence” if you still want that adjective. Prefer the tags.

**CHECK 3** (homecoming, after “based on the recent convergence”): *the io.js/Node.js convergence of mid-2015 produced the Node.js Foundation, with Joyent transferring stewardship and io.js merging back.*

- **Necessary** if you want to explain “convergence” as an institution. The commit only says “the recent convergence.” A reader who has never heard of io.js can survive on that word plus the rename; they cannot survive on “Joyent ceded the project to a neutral foundation” without a source.
- **Scope is loaded.** “Ceded,” “agreed to come home,” and the CHECK’s own “io.js merging back” all narrate winners, and “merging back” fights gate 5. Source the Foundation announcement and the stewardship transfer as two facts. Then write: “stewardship moved into the Node.js Foundation; the projects converged.” Do not write “merging back.” The seam is the chapter’s thesis; the CHECK must not contradict it.

Until 1 and 3 are `VERIFIED`, they cannot carry “What it cost.”

---

## Craft (the six risks)

**One plot, not a tour.** It holds. Rehearsal → four weeks → io.js (README, then binary, then 1.x–3.x) → homecoming → seam. Each middle object is spent later: the README’s “open governance” is the war’s noun; the binary rename is the product-turn that the August rename plays backwards; 1.x–3.x is the numbering the changelog needs. That is not a catalog. The only sag is “So who won?” — it asks a new question instead of turning the rename-back. Bridge: “Renaming the executable settled the product’s name. The first reunified release is where you find out what the *history* settled.” Then the changelog fence.

**Seam, earned and legible.** Yes, to a reader who has never heard of io.js, provided gate 5 is applied. The open already trains documents-on-a-stranded-ref. The README teaches the name. `merge-base --is-ancestor` is an SDE-native turn; they will feel “not an ancestor” a beat before “Declared, not merged.” What is not yet earned is the leap from “these two tags” to “the true shape of the reunification.” Keep the thesis inside the two releases and the cherry-pick (`8a9a3bf7`, “cherry-picked from v3.x @ 1a6e52db30”). That is enough, and it is in the receipts.

**No-sneering.** Not yet. See gate 7. The narrator is careful toward the rebels (“least possible violence,” “the only way they knew how to be”) and incurious toward Joyent. ffmpeg’s “both arrangements are not absurd” is the model; steal its posture, not its merges.

**Title.** It flips, and it flips early — which is correct for a found-object title in this book (`Remove promises`, `As discussed`). Cold open: a typo. One beat later: the sentence being corrected is about a secret. By the close, public/private is the four-week clock and the soft/hard messaging, and the subject line is an organizer who did not think he was writing the title. It does not name the seam thesis. Good. A thesis-title (`Declared, not merged`) would lecture. Keep this.

**Distinctness.** Pass, with two watch-its.

- Versus **Remove promises**: different years, different objects, different question (was an API deleted vs. did a governance fork come home). No Promises, no `sys`, no Ryan Dahl, no Saturday night. Isaac Schlueter is a TC name here and the protagonist there — the draft correctly does not make him a character. Cut “did not belong to its contributors” and “the people with their hands on the code”; those are the demoted chapter’s inheritance thesis in different clothes.
- Versus **ffmpeg / “As discussed”**: both are governance forks; both rename the product. ffmpeg is eleven years of forbidden merges and a name that never came home. This is nine-or-so months, a constitution in `CONTRIBUTING.md`, a soft-fork clock, and a changelog that stitches what the graph will not. Distinct enough for P.S. coexistence **if the seam stays the thesis** and the 96-file rename-back stays one sentence (it currently is). Do not let the rename stats swell toward ffmpeg’s 1,335 files / 5,388 words; that would make them the same chapter with different nouns.

**Word count.** 2,196 (TEMPLATE) / 2,109 (comments out). Under the 2,200 floor, not over. Do not pad. The SDE reader scores concision first.

Cut ~80–100: “Read it slowly, because every line is load-bearing”; the README paraphrase that restates the fence; the loaded-fork sentence; the symlink sentence (gate 3, also false); “no body count / nine months / most-used platform.”

Grow ~150–250, only in three places: (a) the Joyent chair, four sentences, gate 7; (b) the seam scoped to the two tags, gate 5, which is a substitution not a balloon; (c) “What it cost” rebuilt on version numbers + changelog baseline + (once CHECK 3 is verified) the Foundation, not on the absence of a corpse. One first-person beat at the seam — bisecting across it, or trusting a changelog to enumerate every change — is already in “At home”; it can afford a single concrete “I have done this” without becoming a sidebar.

Net: land in the low 2,300s. The extra thousand in the band is for material that raises the score. Fairness and consequence do. Another exhibit of `target_name` does not.

---

## Optional suggestions

- **Use the Oct 29 Joyent merge that is already in the sixteen.** Same afternoon as the minutes, Ben Noordhuis lands `Merge remote-tracking branch 'joyent/master'`. That is the “soft fork” as an object, and it is fairer to Joyent than any adjective: they were still pulling. It needs one line in R1’s unfiltered log. Do not tour the other fourteen.
- **`isaacs` as committer of `f60abb0c` (R2, PR-URL `node-forward/node/pull/1`).** Color, not plot. Skip it. Isaac is the demoted chapter’s second protagonist; naming him here as the man who landed the constitution re-tangles the two.
- **At home, two nits.** `rev-list --count <branch> --not origin/main` is correctly described in that section as “what the main line doesn’t.” Leave it; the overclaim is in the open (gate 4). `git merge-base --is-ancestor v3 v4` prints nothing — the lesson is the exit code. Add `; echo $?` to match fence 9. Cut “A branch nobody merged and nobody deleted is usually a branch somebody couldn't bring themselves to do either to.” Archaeology, not mind-reading.
- **“Five weeks later”** (Dec 1 → Jan 8 is 38 days). Ordinary rounding, not a gate. “By January 8” if you want the date instead.
- **“Evented I/O for V8 javascript.”** is in R4 as the deleted first line and would make “Node’s original one-line description” a quote instead of a gloss. One line, if you are already touching that fence.
- First-person is thin until “At home.” One “the typo-fix is my favorite kind of receipt” in the open is the right amount of taste. Do not add more opinions about the rebels. Add one about the seam, which is the narrator’s actual job.

The chapter is close. The war is one war. The title is a found object. The seam is the reason to publish it next to ffmpeg rather than instead of nothing. Fix the fence, the first-commit, the symlink, the word “parent,” and give Joyent a chair. Then it is a chapter.
