I have read the draft and the surrounding materials. I've written the full craft review to [04-agy-review.md](file:///home/diablo/book16/chapters/04-agy-review.md) as requested. Here is the review:

# Craft Review: Chapter 04 (xz)

## Open & Close (and the Ch. 02 cross-reference)

The opening cross-reference ("The last chapter had no villain. This one has nothing else.") is a glaring violation of the `TEMPLATE.md` COLD OPEN rule. It announces the theme instead of dropping the reader into a concrete moment, acting exactly like the banned "This is the story of..." framing. It tells rather than shows. It does not earn its place.

The close also violates the template's formatting constraints. By putting the takeaway under an explicit `## At home` heading, you've created the exact "boxed sidebar" the template forbids ("woven into the closing, never a boxed sidebar"). These paragraphs need to be woven naturally into the narrative exit.

## Structure & Pacing

The five-act chronological structure (welcome -> Hans -> gitignore -> the period -> exit) works beautifully to build the trap step-by-step. 

However, the titular one-character reveal in "The period" fails to land because it violates THE TURN rule. You announce it before showing it: 

> "The second surprise is a single character, and it is the most audacious thing in the whole affair because it is hiding in a commit whose message says it is a security *improvement*."

To make the reader feel it a beat before it's named, cut this setup. Drop the CMake diff first, point to line two, and let the syntax error dawn on them before you spell out the sabotage.

## Prose

**Hardest-working paragraph:** 
> "Nobody in the room is watching a heist. They are watching a burnout end. That is the point of the two and a half years — not the code, the *trust*." 
This brilliant observation carries the emotional core of the chapter and perfectly satisfies the "no hindsight-flattering" rule.

**Weakest paragraph:** 
The opening paragraph, because it's throat-clearing that prevents the story from starting.

**Clunky sentence:**
> "The malicious build script gets generated into the release tarball by the autotools machinery — but it is added to `.gitignore` so that if it ever appears in a working tree, `git status` stays clean and no maintainer notices an unexpected file."

*Rewrite:* "Autotools generates the malicious build script into the release tarball. By adding it to `.gitignore`, the attacker ensures that if a maintainer generates the script locally, `git status` stays clean. The unexpected file remains invisible."

## Ethical Register

The tone is pitch-perfect. Lasse is treated with profound empathy without being stripped of agency ("returning to a house that turned out not to be his alone"). Jia is observed coldly as a patient actor, avoiding both glorification and cartoonish villainy. 

Your handling of "Hans Jansen" is a masterclass in the book's epistemology:
> "I am not going to tell you who Hans was; the git history cannot, and this book only tells you what the git history can prove."
No sneering, no overclaiming. The ethical register is flawless.

## Expansion

The draft is severely under weight (closer to 1,200 body words against a 2,200-3,200 band), and the missing heft should go entirely into **The Blast Radius**. 

The template requires showing "what it cost and for how long, told concretely," but the draft barely mentions Andres Freund and completely omits the scale of the averted disaster. Added material detailing how close this came to compromising the SSH daemon across the global Linux ecosystem would earn its keep by contextualizing the stakes. You can also expand on **The Room** by showing Lasse's maintenance burden before 2022 to heighten the impact of the "rescue." The current draft is far too lean on context.

## Title

"One character" is strong and intriguing. Even though it points to the climax, it's abstract enough that it doesn't spoil the exact nature of the period before the reader arrives at it. Keep it.

## Top 5 Changes by Impact

5. **Kill the `## At home` heading:** Weave the closing commands and habits seamlessly into the final section to avoid the banned "boxed sidebar" feel.
4. **Fix the clunky passive voice:** Rewrite the `.gitignore` explanation in "The weapon that is not here" to be active and punchy.
3. **Expand THE BLAST RADIUS:** You are ~1,000 words short. Add the missing template beat detailing the scale of the averted SSH disaster and the sheer luck of Freund's latency hunt.
2. **Stick THE TURN in "The period":** Don't announce the single character before showing it. Show the CMake diff first, point out the lone `.`, and let the reader discover the sabotage.

**1. The single most important change: Kill the opening paragraph.**
> "The last chapter had no villain. This one has nothing else. Everything you are about to read was done on purpose, by one person, patiently, over two and a half years..."
This explicitly violates the COLD OPEN "no-announcing" rule. Cut the throat-clearing entirely. Drop the reader straight into the `git clone` command and the first innocuous patch. The story is strong enough to speak for itself.
