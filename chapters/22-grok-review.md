# Gate review: “This major disk crash”

Chapter 22, curl, P.S. candidate. **1,804** words of body by the TEMPLATE counter (`awk` to `## Receipts`); **1,772** with the `<!-- CHECK -->` stripped. Against a 2,200–3,200 band. Factual gate plus craft. One flag gates: **FAIL.**

The bones are the right bones. A root that is a working directory; a crash sentence sitting inside that tree; a junk-cleanup twelve days after the root, not twelve days after the crash; a changelog that bottoms out on somebody else’s tool; the same man on both ends of a 26-year ledger; a shortlog that rebalances without a ceremony. Distinctness from genesis is already in the object (a stuffed recovery tree, not a conversion title card). Distinctness from vim is **FAIL.** Six must-fixes. The crash and the junk delay are in the right sections; the binary is not claimed deleted; 20,578 of 39,474 is 52.13 percent, and 20,578 > 18,896, so “more than the other 1,506 combined” is true. What gates is a false date phrase, one dropped console line, unmarked ubiquity, a near-loss paragraph that talks over its own quote, “founder” after the chapter un-founds him, and a handover the receipts cannot carry.

Body is **1,804** words (TEMPLATE counter to `## Receipts`); **1,772** with the CHECK stripped.

---

## Must-fix

**1. “Twelve days into the new year” is false.**

> And tidy he did. Twelve days into the new year, the ballast goes back over the side [R6]:

January 10 is the tenth day of the year. Twelve days is the interval from the root (1999-12-29) to the junk cleanup (2000-01-10) — the delay the scout originally hung on the crash. The events are in the right sections. The phrase still relocates the twelve.

Fix: “Twelve days later, the ballast goes back over the side.” The panel already prints `2000-01-10`. Do not write “twelve days after the crash.” Do not write “January 12.”

**2. The R4 fence drops a line the command prints.**

```
$ git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | sed -n '43,52p'
```

`sed -n '43,52p'` is ten lines. Line 52 of `CHANGES` is blank. Receipts keep that blank; the fable fence ends on `server!`. A reader who runs the dollar line gets one more line than the panel.

Fix: add the trailing blank inside the fence so it matches R4 byte-for-byte. Leave the command. The other six console panels match their receipts, including the long R10 awk.

**3. Cold-open ubiquity is an unmarked external claim.**

> the very first thing in the history of the tool that now moves data for practically everything with a network plug

That phrase is the prompt’s example of an unmarked external. It is not in the receipts, and it is not next to the CHECK.

Fix: cut from “that now moves data” through “network plug.” The cold open does not need the blast radius. Do not CHECK this clause in two places.

**4. The near-loss paragraph contradicts the quote it is built from.**

> In November 1999 the physical home of that future was one "good old trust-worthy source disk," and the disk died.

> What stood between curl and oblivion was the boring redundancy of a CVS server and some scattered backups — and the founder's instinct, five weeks later, to commit *everything he still had*

The same CHANGES entry that names the dead disk also names the copies: “backed up elsewhere or stored in this CVS server.” The physical home was not one disk. “Everything he still had” is not in the receipts; the root is a shovel-load, not an inventory of last copies. “Oblivion” is the counterfactual the quote already refuses.

Fix, same length: “In November 1999 one home of that future was a ‘good old trust-worthy source disk,’ and the disk died. What stood between curl and a hole in the ledger was the boring redundancy of a CVS server and some scattered backups — and, five weeks later, a root that committed the recovered working tree whole, junk and the binary included, before sorting any of it.” Do not claim the Dec 29 dump was the unique surviving copy. The closing lesson (“the tidy version of your project is worth nothing if it exists in one place”) can stay; that is what the crash taught *him*.

**5. “Founder,” three times, after the chapter has just un-founded him.**

> when somebody else out-committed the founder

> The founder's name is on the newest commit

> the founder's instinct, five weeks later

R5 bottoms out at Rafael Sagula, “which started all this!”, with Stenberg entering at 1.1; HISTORY.md makes him the new maintainer in December 1996. The chapter’s own pre-history beat is that stack. “Founder” walks it back.

Fix: “out-committed Stenberg”; “Stenberg’s name”; “his instinct” (or “the maintainer’s instinct”). Do not add a receipt to make “founder” true.

**6. Annual-lead rows are not a handover, and “Vim’s held breath” collapses the register.**

> at the tip of the history the annual lead has, quietly, changed hands.

> succession in a healthy project doesn't look like Vim's held breath. It looks like a shortlog, gradually rebalancing, while everyone is busy working.

R10 is six years someone else out-authored Stenberg. It is not a maintainer change, not a ceremony, and not 2026 as a completed year (the pin is August 18). The hedges around it are the right instinct — “Nothing in the repository marks this as a moment”; the newest commit is still his; volume belongs to someone else. Then “changed hands” and “succession” spend those hedges, and the Vim clause does two more kinds of damage: a P.S. chapter that cannot be read without the vim chapter, and an explicit contrast with the elegy this chapter was told to stay distinct from. The shortlog already is the distinct claim.

Fix: keep the table and the two facts (his name on the tip; Szakats on 2025 and 2026-through-the-pin). Cut “changed hands,” cut “succession,” cut the Vim sentence. End on the sentence you already have: “Nothing in the repository marks this as a moment.” If you need a close: “It looks like a shortlog, gradually rebalancing, while everyone is busy working.” That stands alone.

---

## CHECK inventory

One marker, on the blast-radius sentence:

> it ships inside operating systems, cars, televisions, and phones, in billions of installations. <!-- CHECK: curl is installed in the tens of billions of devices/instances per the project's own estimates (curl.se); ships by default in Windows, macOS, iOS, Android, cars, TVs; needs external source. -->

Scope is right: the SDE reader scores consequence, and this is the consequence. Prose is milder than the comment (“billions,” not “tens of billions”). “Cars, televisions, and phones” live inside the marked sentence; they are not a second unmarked claim. Do not clear the CHECK. Do not let “among the most widely deployed pieces of software in existence” ride along once the comment is sourced — either the source supports the superlative, or cut it to “among the most widely deployed pieces of software its own project will claim.”

The only other unmarked external in the body is gate 3.

---

## Craft (not gates)

**Cold open.** Earned, not too cute. “The first commit of curl contains a copy of curl” is the genesis move inverted — stuffed, not empty — and the ls-tree panel makes it literal twice (`curl-6.3.1.tar.gz` and `src/curl` at 1,830,293 bytes, mode `100755`). The reader feels the shovel-load a beat before the crash names it. Keep the line. Optional cut: “I want to show you that before I explain it” and “my favorite object in this entire book.”

**Plot.** One plot, in the right order: recovery → pre-history → endpoints → volume-without-ceremony → near-loss. It sags only in “The other endpoint,” and the sag is numbers, not a second story. The two R8 lines are the beat. Then 39,474 / 1,507 / 20,578 / fifty-two percent / 1,506 combined / leads every decade — six ways to say the same census before the year table, which is the actual turn. Cut the decade sentence (R9 is a weaker R10). Pick one of “more than fifty-two percent” and “more than the other 1,506 combined.” Keep the year table.

**Szakats.** Receipt-true if gate 6 is applied. Do not grow this into a passing-the-torch scene.

**Title.** It flips. At the open it is the disaster; at the turn it is why the first commit looks like a dump. It does not collide with genesis (`Initial revision`) or vim (`The current maintainer`). Keep it.

**Word count.** 1,804, about 400 under the TEMPLATE floor; inside CONTEXT’s “≤ 2,000 default.” Do not pad. If 2,200 is hard, grow in two places that raise the score: unused R3 (`CHANGES` opens at Version 6.4, dated 27–28 December, root on the 29th — an active working tree, not a cold archive), and, after the CHECK is sourced, one concrete deploy fact instead of “billions” as atmosphere. If concision governs P.S., waive the floor in writing and leave it short.

**Binary / junk.** Pass. “The tarball, the patches, the config droppings” does not name `src/curl`.

**Genesis overlap.** Real at the subject line (`Initial revision`) and nowhere else. Protect the shovel-load; do not add a cvs2git subplot.

---

## Optional

- “file number one-hundred-and-something”: true in the clone (path 131 of 144), not in the receipts, and not visible from the filtered ls-tree. Cut the ordinal.
- “files every tutorial tells you never to commit”: narrator color. “Files I would normally keep out of a repository” if you want it quieter.
- At home, “every one of those is a fossil” / “almost never” / “usually”: universals the receipts cannot underwrite. “Can be,” “may not,” “look for.”
- “Twenty-six and a half years”: 9,729 days, closer to 26 years 8 months. “More than twenty-six years” if you touch the line.
- “3,046 lines of recovery scaffolding”: the tarball is `Bin 242680 -> 0 bytes` and is not lines. “3,046 deletions of recovery scaffolding.”
- Drop the first R8 panel. The root has already been shown; the new information is the tip.

Do not add a binary-was-kept subplot, a 1990s decade row, a Szakats handover, install-base numbers beyond what the CHECK can source, or another chapter’s name. After the six gates, this is the survival-artifact chapter, and the shortlog is the succession-without-ceremony — named as a shortlog, not as a passing of keys.

Full review is in `chapters/22-grok-review.md`.
you never to commit”: narrator color, not a CHECK. “Files I would normally keep out of a repository” if you want it quieter.
- `"Removed junk files."` / `"adjusted it slightly."`: subjects and changelog lines with house capitalization. Optional to match the receipt bytes; not a gate on the order of #2.
- At home, “every one of those is a fossil” / “the subject line will almost never say so” / “there is usually a sentence like”: universals the receipts cannot underwrite. “Can be,” “may not,” “look for.”
- “Twenty-six and a half years”: 9,729 days, closer to 26 years 8 months. “More than twenty-six years” if you touch the line.
- “3,046 lines of recovery scaffolding”: the tarball is `Bin 242680 -> 0 bytes` and is not lines. “3,046 deletions of recovery scaffolding.”
- Drop the first R8 panel. The root has already been shown; the new information is the tip.

Do not add: a binary-was-kept subplot, a 1990s decade row, a Szakats handover, install-base numbers beyond what the CHECK can source, or another chapter’s name. After the six gates, this is the survival-artifact chapter, and the shortlog is the succession-without-ceremony — named as a shortlog, not as a passing of keys.
