# Gate review: “Making numbers look nice”

Chapter 19, OpenTTD, P.S. candidate. 2,235 words of body against a 2,200–3,200
band. Factual gate plus craft. One flag gates: **FAIL**. Four must-fixes, then
judgments the prompt asked for that are not gates.

The bones are the right bones. A one-cell diff; a name the ledger can only call
*Yourself*; a two-sentence constitution over a revert; a coin-flip twenty lines
below the table that makes 320 and 420 different currencies; five lines of
comment as the entire net effect. The distinctness claim is already in the
middle of the draft and i**FAIL.** Four must-fixes. The middle of the chapter already has the right story — the pretty cell was wrong on the merits, and the revert wrote the comment at the snag. What gates is two commands that do not produce the lines under them, two claims the receipts do not support, and a landing that asks a consequence-scoring reader to grade the chapter on a curve.

The draft does **not** claim 320 is “the original binary speaking,” and it does **not** say frosch lived with the values since 2007. Do not add either on the way through.

---

## Must-fix

**1. The two 2007 `sed` ranges do not produce the output underneath them.**

Table panel:

```
$ git -C repos/openttd show --format='' --no-ext-diff 61fe35688046b7ef36305ebd92b79bfcc535783f -- src/town_cmd.cpp | sed -n '44,51p'
```

A reader who runs that gets the *old* branch being deleted (`m = 160;` / `if (!CHANCE16(1, 12))`), not the new table. The displayed lines are show-output **34–39**. The gate panel’s `sed -n '69,70p'` prints `t->growth_rate = …`, not the `+		m = …` / `+		if (n == 0 && !CHANCE16(1, 12)) return;` pair, which are **57–58**.

Those addresses are line numbers in `chapters/19-openttd.receipts.md`, copied into `sed`. Fix the commands to `sed -n '34,39p'` and `sed -n '57,58p'`. Leave the displayed lines; they already match R3.

**2. “Ten becomes eleven characters wide, if you count generously” is false.**

> One cell of one table. Ten becomes eleven characters wide, if you count generously:

`320` and `420` are the same width. The change is one digit, 3 → 4. The hedge does not make the count true. Cut the sentence. “One cell of one table.” already does the work. If you want a size: “one digit” or “a 3 becomes a 4.”

**3. Frosch’s “decade” is not in the receipts, and it is the cousin of a forbidden claim.**

> November 20th, 2019, one o'clock in the morning, a developer named frosch — at that point more than a decade into working on this codebase [R6]:

R6 is the revert. It gives `2019-11-20T01:00:07+01:00` and the name. It does not give a first-commit date. The scout already failed “frosch personally lived with the values since 2007”; this is that claim with the table sanded off. (True in the clone — first frosch commit is 2008-01-10 — and still not a receipt, and still not this story. Do not add the receipt; it would also rhyme with postgres’s Tom Lane census.)

Cut from the em dash through “codebase.” Keep the timestamp and the name. `[R6]` then cites what it actually contains.

**4. The malus did not “migrate,” and “even further” is not in the receipts.**

> By 2019 the penalty had migrated to a different function in the file, even further from the table than in 2007, which is why a close reader of the table alone had no chance.

Supported: in 2007 the table and the `CHANCE16` gate share `UpdateTownGrowRate` (R3 hunk header). In 2019 the table lives in `GetNormalGrowthRate` (R5) and frosch’s note names the malus in `UpdateTownGrowth()` (R7). Different functions: yes.

Not supported: that the *penalty* moved, and that the distance grew. In the tree the table was extracted into a helper; the coin-flip stayed in the growth-update function (renamed `UpdateTownGrowth`). “Even further” is a measurement the receipts never take.

Fix, same length: “By 2019 the table lived in its own helper, `GetNormalGrowthRate`; the penalty frosch names sat in `UpdateTownGrowth()` — a different function, which is why a close reader of the table alone had no chance.” That uses only names R5 and R7 already print. Do not add the 2019 `Chance16` line; it is not in the receipts (and it is `Chance16`, not `CHANCE16`).

---

## Judgments that are not gates

**CHANCE16 “one in twelve.”** Presented as reading, not receipt. “`CHANCE16(1, 12)` is the game's coin-flip helper — pass roughly one time in twelve” hedges with *roughly* and reads the arguments. Leave it. Do not add `macros.h`.

**“Eleven times out of twelve sent home without progress.”** Supportable from R3 as the polarity of `!CHANCE16(1, 12)`, given that reading. The `return` exits the 2007 growth function before the countdown is applied; “without progress” is fair. Not a gate.

**The CHECK.** One marker, correctly scoped to game identity:

> <!-- CHECK: OpenTTD is an open-source reimplementation of Transport Tycoon Deluxe (Chris Sawyer, 1995); needs external source for the game name/year. -->

The reader-facing sentence is milder: “a beloved 1990s business-simulation game about building transport empires.” It does not name TTD, Sawyer, or 1995. Do not clear the CHECK. The live unverified word on the page is “1990s.” The clone’s README at the audited tip already says “a transport simulation game based upon the popular game Transport Tycoon Deluxe, written by Chris Sawyer” — that can become an R11, after which the prose may name TTD from git. 1995 is not in that README; leave the year off the page.

**Title.** It flips. At the open, Yourself is making numbers look nice. At the turn, that is the thing the project refuses. It does not collide with PHP’s “Fix typo.” Keep it.

**Word count.** 2,235, at the floor. Lean is right for this reader and this blast radius. Do not grow. Gates 2–4 are cuts or swaps. Do not use the unused band to invent player-economy impact the receipts do not have.

**Yourself.** Holds the no-fool promise. The ledger joke (“the ledger can only call *you*”) is the right register; the close (“under a name like *Yourself* — is the reader you are writing for”) is warm. The one elbow-grab is “I promise I am not making this up.” Optional cut. “Drive-by” leans sneering; the paragraph that follows (“this chapter is not about a fool”) earns it back.

**Hidden clause.** Legible without the game. Countdown, smaller-is-faster, columns as station counts, then the toll gate on column zero. “Quoted in a different currency” is the sentence a non-player can carry. No extra lore required. The 2007 distance is ~20 show-lines (table at 38, gate at 58), not thirty.

**Distinctness from postgres.** Real in “The revert” and “The five-line monument.” Postgres kept a number that *was* a hack because it had become a contract; the comment is a refusal written in advance. This restored a number that only *looked* wrong; the pretty fix was incorrect on the merits; the comment is a genre that only a revert can write. “There is a genre of comment that only a revert can write” is the chapter’s own sentence. Protect it. Same-y where “Still standing” analogizes to the disaster chapters — that is postgres’s ending, smaller.

**Consequence.** The current landing is special pleading:

> On the scale of this book's disasters it is a rounding error. That is precisely why I am showing it to you: this is what the *successful* version of every other chapter's story looks like, and the ledger lets us watch each component of the defense actually work.

That asks a consequence-scoring reader to care because of xz, and it collapses the distinctness claim into “disaster chapter that went well.” The two-day cost is honest and should stay. The analogy should not.

Keep “two days… no further casualties.” Replace the book-meta with the merits point this chapter owns: the 320 was never the bug; the bug was a correct-looking correction; the blast radius is five lines of comment that have held. Then “Watch the comment survive” can stay as evidence the antibody worked, not as a tour of the rest of the book. “A comment's success is measured in commits that never happened” is already the closer that reader will accept.

---

## Optional

- Opening `git show` (no `sed`) and the R8 `git diff` (no `sed`) both print more than the panel shows. Pin with `sed` or include the hunk header. Milder than gate 1, because a reader still sees the cell.
- Blame command drops `--date=iso-strict` from R10. Restore it if the command is meant to be regenerable.
- “A thousand mechanical touches”: eaae0bb5 is 564 files. “Project-wide” is enough.
- “The lines around them have changed hands”: R10’s funded row blames to 2018, *before* the monument. Only the `uint16_t` declaration changed after.
- `[R3, R10]` on the station-index claim: R3 never names `CountActiveStations`. R5 and R10 do. Cite `[R5, R10]`.
- “Monday in November 2019” is calendar inference from `2019-11-18` (it was). Keep or drop; don’t CHECK it.
- “Thirty lines away,” twice. Twenty in the 2007 show.
- “Presumably years earlier and long forgotten,” of the `Yourself` git config: not in the receipts. “Git records whatever name you configured” is enough.

Do not add original-binary language, a frosch-tenure subplot, a 2019 `Chance16` listing, or another hundred words of blast radius. After the four gates, this is a short creed chapter, and the length is the point.
ls
  are the gate; these are the same class of defect, milder, because a reader
  still sees the cell.
- Blame command drops `--date=iso-strict` from R10. Harmless next to the
  editorial `...`; restore it if the command is meant to be regenerable.
- “A thousand mechanical touches”: eaae0bb5 is 564 files, 4,565 insertions,
  4,565 deletions. Rhetorical, not a receipt. “Project-wide” is enough.
- “The lines around them have changed hands”: R10’s funded row blames to 2018
  (before the monument). Only the `uint16_t` declaration changed after. Say
  the declaration changed hands, or drop the clause.
- `[R3, R10]` on the station-index claim: R3 never names `CountActiveStations`.
  R5 and R10 do. Cite `[R5, R10]`.
- “Monday in November 2019” is calendar inference from `2019-11-18` (it was).
  Fine as date-arithmetic; not in the receipts as a weekday. Keep or drop;
  don’t CHECK it.
- “Thirty lines away” twice (hidden clause; five-line monument). Twenty in the
  2007 show. Optional with the hidden-clause note above.
- “Presumably years earlier and long forgotten,” of the `Yourself` git config:
  not in the receipts. “Git records whatever name you configured” is enough.

Do not add: original-binary language, a frosch-since-2007 (or since-2008)
subplot, a 2019 `Chance16` listing, player-facing “what the two days felt like
in game,” or another hundred words of blast radius. The unused band is not
permission. After the four gates, this is a short creed chapter, and the
length is the point.
