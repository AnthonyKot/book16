This is a sharp, beautifully observed piece of archaeology. The through-line—that the repository is just a projection, and the *real* specification is the weights—is one of the strongest thematic spines in the book. The juxtaposition of the 2017 ruling (correctness wins because it's cheap) against the 2019 ruling (compatibility wins because the weights have cemented the bug) is the philosophical core. 

But you’re running about 400 words light because you are rushing the rooms. You aren’t sitting in the mundane Tuesday chore-work before the disasters hit. 

Here is my craft review, addressing your specific risks, followed by the ranked changes.

### 1. The ML Background
*   **The Mask Explainer:** This is the hardest-working paragraph in the draft. *"The mask is the exam conditions. Take it away, and the exam is open-book..."* Do not touch a word of this. A general reader will grasp the stakes instantly, and an ML-literate reader will respect the sheer economy of the metaphor. It serves the narrative perfectly without boring anyone.
*   **The Sinusoid:** The explanation is accurate, but it reads a bit like a textbook. It tells us the math but doesn’t put us in the room with the contributor spotting the degenerate signal. (See prose notes below for the fix).

### 2. Sprawl vs. Through-line & The Missing Rooms
You have five mini-stories, but they actually form a tight three-act structure: The Artifact Arrives (birth + leakr), The Human Error (`look_right`), and The Calcification (the two rulings). The sprawl is an illusion caused by moving too fast. 
The missing 400 words belong in the **ROOM** beat. You are skipping the "moment before the outcome" (per the `TEMPLATE.md` mandate).
*   For `look_right`, give us Lukasz Kaiser’s Tuesday on August 1, 2017. He’s porting image problems. He adds `look_right=True`. Why? Expand on the sheer banality of the mistake.
*   For the 2019 rollback, sit with the on-call engineer at Google who had to write `*** Reason for rollback ***`. They must have loaded a checkpoint and stared in horror at the gibberish output. Reconstruct that realization.

### 3. The Fade ('The timer')
If Chapter 07 owns the elegy register, then 'The timer' is dangerously close to stepping on its toes with that final line: *"a note between two people passed to a room that emptied years ago."* 
**Dry it out.** The T2T repo didn't die a tragic death; it was simply superseded. The eerie part isn't that the room is empty; it's that the machinery is still running with no one at the wheel. Lean into the cold automation. The final commit is a robot updating the copyright year on a mailing list nobody reads. End on the mechanical persistence of the bot, not a ghost story.

### 4. The Title: 'Giving 0 losses'
It works, and it flips beautifully right at the Vaswani revert. Usually, zero loss is the impossible dream of perfect mastery. Here, it flips into a blaring alarm bell for a data leak. It holds up.

### 5. Open & Close
*   **Cold Open:** Excellent. *"The birth is not a birth — it is a delivery"* perfectly establishes the "projection" theme. 
*   **At home:** Strong, actionable advice, but it tries to do slightly too much by pivoting from the `git log -S` trick to reading `breaks existing` subjects. Still, the habit of pickaxing your safety invariants is pure gold. Keep it.

### 6. Prose & The Two `~` Beats
*   **The `~` beats:**
    *   `~ In a model that predicts the future, a perfect score is not mastery. It is a leak.` ➔ **KEEP.** It is the perfect drop-the-mic pivot before the revert.
    *   `~ The spec is not the paper. The spec is the weights people have already trained, and the weights have shipped.` ➔ **MOVE.** This is the thesis of the whole chapter. Don't bury it in the middle of the "other verdict" section. Move it to the very end of the narrative, right before "At home."
*   **Weakest paragraph:** The opening of 'The timer': *"After that, the repository does what exported research repositories do. The commit counts by year: 2,228 in 2018, then 1,192..."* It’s a dry data dump. Weave the decay into the human departure instead of just listing numbers.

***

### Top 5 Changes Ranked by Impact

**5. Dry out the Fade (The Timer)**
Strip the elegiac tone from the final paragraph. 
*Draft:* "...a note between two people passed to a room that emptied years ago." 
*Action:* Cut it. Make this fade about the cold, robotic persistence of the automation updating copyright years for a dead mailing list.

**4. Untangle the Sinusoid Sentence**
Break up the clunkiest sentence in the draft. 
*Draft:* "An outside contributor reads the sinusoidal position code — the famous formula that tells a Transformer where each word sits in the sentence — and notices that position zero produces a degenerate signal: sine of zero is zero, cosine is one, so the first token's positional fingerprint is half zeros and half ones."
*Rewrite:* "An outside contributor is reading the sinusoidal position code—the formula that tells a Transformer where each word sits. They notice position zero produces a degenerate signal. Sine of zero is zero; cosine is one. The first token's positional fingerprint is half zeros and half ones."

**3. Move the Thesis Beat**
*Draft:* `~ The spec is not the paper. The spec is the weights people have already trained, and the weights have shipped.`
*Action:* Move this beat to the very end of the narrative section, just before "At home." It is the philosophical conclusion of the entire chapter.

**2. Expand the 2019 Rollback Room**
Spend 100-150 words in the room with the person diagnosing the broken checkpoints before Copybara reverted the fix. Make the reader feel the realization that millions of dollars of compute had calcified a math bug into a permanent standard. This adds missing word count and heightens the contrast with the cheap 2017 ruling.

**1. Sit in the `look_right` Room (The Single Most Important Change)**
To fix your sprawl and hit your word count, you must expand the moment *before* the bug. 
*Draft:* "It arrived folded into a routine porting commit, the day's honest chore-work, where nobody's eye would snag on it..." 
*Action:* Unpack that Tuesday. What was Kaiser porting? Why did he add an opt-out flag and default it to True? Put the reader in his shoes making a perfectly rational, mundane decision for convenience that accidentally poisoned the well. This fulfills your core mandate ("no sneering, reader should think 'I might have done this'") and anchors the chapter's missing heart.
