Here is my craft review of Chapter 11, strictly judging the narrative machinery, structure, and prose.

### 1. Neutrality Audit
The draft largely avoids sneering, but a few phrases inadvertently pick a side, framing the Libav founders as mutineers rather than developers with a principled grievance.
*   **Quote:** *"the leader whose removal had been attempted"* (Line 97) — This borders on describing a coup. Change it to *"the leader whose position they had tried to delete"* to stick to the repo reality.
*   **Quote:** *"folded the forkers' work"* (Line 98) — "Forker" carries a slight pejorative tang. Use *"the departing maintainers' work"* or *"Libav's code"*.
*   **Quote:** *"long after the shooting stopped"* (Line 164) — A bit loaded and adversarial. Try *"long after the split"* to maintain the cool, archaeological tone.

### 2. The Qatar Section
This is absolutely the emotional center, and the 2 a.m. histogram is fire. It *does* land as devotion, but only if you step out of the way. Right now, you over-diagnose it slightly.
*   **Quote:** *"He would not join them and he would not let them diverge. He absorbed them."* (Lines 101-102)
*   **Fix:** Cut this. Let the timestamps and the repetition do the work. Simply showing that he sat up at 2 a.m. for 1,100 days to fold their work into his tree is devastatingly powerful on its own. Trust the reader to feel the obsession without spelling it out.

### 3. Title & Word Count (Missing Rooms)
*   **The Title:** "As discussed" is brilliant. It perfectly flips the premise—the most explosive, decade-long schism in open-source history masked by the most mundane corporate sign-off imaginable.
*   **The Missing Words (1,762 vs 2,200-3,200 band):** The missing 500+ words belong in **THE ROOM**. The `TEMPLATE.md` demands you reconstruct what the actor knew and wanted. Right now, you state *"The disagreement was real and principled on both sides"* (Line 44), but you only *show* Niedermayer's devotion. You need to build Jason Garrett-Glaser's room on January 18. Why was the edit made? Show the burden of maintaining the project and why senior devs felt bottlenecked by "final design decisions." Then, build Anton Khirnov's room in 2022 when he sweeps away the ghost office.

### 4. Structure & Pacing: Section Order
*   **Fix:** Swap "The scar" and "The office".
*   Chronologically and emotionally, the 2017 command-line tool rename in "The scar" is the mechanical compromise of how they started to reconcile. "The office" (2022) is the ultimate burial. Ending the historical narrative on the mechanical `--follow` quirk undercuts the raw power of Khirnov’s epitaph (*"The position does not exist anymore"*). Put the scar first so the chapter ends on the human resolution.

### 5. Prose Notes
*   **Clunkiest sentence:** *"That is the entire visible surface, in git, of the most famous schism in open-source media software: one day a developer removes the project leader's office from the org chart, citing a mailing-list thread; the next day the project leader puts his office back, citing a discussion."* (Lines 31-35).
    *   **Rewrite:** *"That is the entire visible surface of the most famous schism in open-source media. One day, a developer removes the leader's office from the org chart, citing a mailing-list thread. The next day, the leader puts it back, citing a discussion."* (Shorter, punchier).
*   **Hardest-working paragraph:** The qatar histogram section (*"The modal hour is two in the morning..."*). It executes the book’s entire premise flawlessly—extracting profound human narrative purely from git metadata.
*   **Weakest paragraph:** The opening to January (*"This is FFmpeg in the winter of 2011: ten years old..."*). It’s pure exposition and reads like Wikipedia. Use this space to build the missing "Room" for the Libav founders instead.

### 6. The `~` Beat
*   **Quote:** `~ The revert is the last commit in which this project is one project.` (Line 62)
*   **Keep it, but lock it in.** It currently floats vaguely at the end of the January section. Integrate it right after the Libav departure is mentioned.
*   **Second beat needed:** Yes. Add a second beat right before "The office" section to mark the quiet fade of the war before the final epitaph. Example: `~ The fork did not end. It just stopped being merged.`

### 7. Open & Close / At Home
*   **Cold Open:** Hits the exact right notes. We see the mundane commit before we realize it's the start of a war.
*   **Close / At Home:** Phenomenal. Winding the `git log -S` and histogram habits into the conclusion rather than a sidebar is exactly what the TEMPLATE demands. *"The written rule said merge commits are forbidden. The record says 1,151, mostly at 2 a.m., all by one man. Believe the record."* is a perfect mic drop.

---

### Top 5 Changes by Impact

**5. Clean up the neutrality leaks.**
Change *"leader whose removal had been attempted"* and *"forkers"* to keep the narrator strictly unbiased. Both sides must feel like they are doing the right thing.

**4. Adjust the `~` beats.**
Keep the first one, but add a second beat right before the 2022 epitaph to help pace the deceleration of the war.

**3. Trim the diagnosis in the Qatar section.**
Cut *"He would not join them and he would not let them diverge. He absorbed them."* The sheer weight of 1,151 merges at 2 a.m. delivers the emotional punch; you don't need to explain it to the reader.

**2. Reorder the ending sections.**
Move "The scar" before "The office". You must end the historical narrative on Khirnov's 2022 epitaph (*"The position does not exist anymore"*), not on a quirky `--follow` amputated history lesson. The human ending must follow the mechanical one.

**1. Build the missing Rooms.**
*(The single most important change)*. The draft is short because you skipped the TEMPLATE's "ROOM" beat for the Libav side. You write, *"The disagreement was real and principled on both sides,"* but you only *show* the principled nature of Niedermayer's 2 a.m. devotion. To make this chapter work—and to hit your word count—you must build the room for Jason Garrett-Glaser on Jan 18. What was the exact friction that forced the deletion of the "final design decisions" heading? Then, build the room for Anton Khirnov in 2022. Give us the perspective of the returnee finally sweeping away the ghost office.
