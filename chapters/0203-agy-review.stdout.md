Here is the craft review of your two draft chapters. I’ve written this to `chapters/0203-agy-review.md` and also printed it below for you.

***

# Craft Review: Chapters 02 and 03

## Chapter 02: Log4j2

**Structure & Pacing**
The "slow accretion / no villain" thesis lands beautifully. Stepping chronologically through the 5 commits across 11 years builds a creeping sense of dread. It never drags because each commit acts as a distinct, logical plot beat. The reader gets to watch the trap assemble itself, agreeing with every sensible engineering decision along the way.

**Prose**
* **Clunky**: "The mitigation that the entire internet will scramble to apply in December 2021 — `log4j.formatMsgNoLookups=true` — has been sitting in the jar, one boolean away, since 2017." (The tense mixing of "will scramble" and "has been sitting" trips up the read.)
* **Rewrite**: "The exact mitigation the entire internet scrambled to apply in December 2021 — `log4j.formatMsgNoLookups=true` — had been sitting in the jar, one boolean away, since 2017."

**Paragraphs**
* **Hardest working**: "Now the pieces are all present, and no single person put them together. `${` in a message reaches the interpolator (2012)..." This paragraph flawlessly synthesizes the 2010, 2012, and 2013 threads into a single, terrifying knot, cashing in on the pacing built up to this point.
* **Weakest**: The opening paragraph ("There is a version of the Log4Shell story where someone is careless..."). It tells instead of showing, and it violates your own rule to "drop the reader into one concrete moment."

**Expansion**
The 1715-word length feels tight and punchy, but you can easily earn the expansion toward your 2200-word target by fleshing out "THE ROOM" for the 2016 off-switch commit. Right now, we jump from the Apache Camel complaint straight to the fix. What did the ticket actually look like? Grounding the reader in the mundane reality of developers treating a world-ending vulnerability as a minor compatibility annoyance will reinforce the "competent people doing normal work" thesis.

**Open & Close**
* **Open**: As noted, the cold open breaks your established style ("Not 'This is the story of...'"). It needs to be cut or completely reworked. Start with the concrete `git clone` or the 2010 commit.
* **Close**: The "At home" close is stellar. Advising the reader to "grep for the *seam*" is a genuinely transferable and insightful git habit. 

**Title**
"The verb that arrived late" is intriguing but slightly inaccurate—the verb (`jndi`) arrived in 2013, which wasn't late at all. It was the *off-switch* that was late. Consider something that nods to the compounding thesis, like "A Vulnerability Built Like a Coral Reef" or "The Open Vocabulary."

---

## Chapter 03: Bitcoin

**Structure & Pacing**
The short length works perfectly. It’s an excellent palate cleanser. The pacing is snappy, dropping the reader right into the punchline (the `shortlog`) and then explaining the mechanics of the accident. 

**Prose**
* **Clunky**: "And here is the part that makes it a chapter instead of a bug report: the correct version exists."
* **Rewrite**: "But the strangest part of the record isn't the error—it's that the correct version exists right alongside it."

**Paragraphs**
* **Hardest working**: "You might expect someone to have fixed it. Sixteen years, thousands of contributors... Every commit's hash is computed from its contents, and the author field is part of the contents." This perfectly translates deep, dry git internals into narrative stakes.
* **Weakest**: "This is the smallest story in the book and one of the truest. Nobody was attacked. Nothing broke." It breaks the fourth wall and tells rather than shows. The low stakes are obvious; you don't need to announce them.

**Expansion**
Do not expand this chapter. The shorter ~1000-word length is absolutely right. Padding this to hit the 2200-word band would stretch a great, punchy joke into a tedious lecture. Let it be a quick breather.

**Open & Close**
* **Open**: The cold open is fantastic—it enters on a concrete `shortlog` output that immediately raises a question.
* **Close**: The "At home" close correctly turns a quirky bit of trivia into a fundamental, memorable lesson on git cryptography and immutability. 

**Title**
"A flag with 8 commits" is perfect. It sparks immediate curiosity.

---

## Top 5 Changes by Impact

1. **Ch02 Cold Open**: Scrap the "There is a version of the Log4Shell story..." intro. Start immediately with the `git clone` command or the 2010 commit to respect the "enters concrete" rule.
2. **Ch03 Meta-Commentary**: Delete "This is the smallest story in the book..." Let the low stakes and humor speak for themselves without breaking the fourth wall. 
3. **Ch02 "The Room" Expansion**: Expand the 2016 Camel bug report section. Quoting the mundane reality of the ticket will firmly root the "no villain, just compounding work" thesis.
4. **Ch02 Title**: Change "The verb that arrived late" to something that reflects the thesis better, as JNDI wasn't late.
5. **Prose Polish**: Fix the clunky tense mixing in Ch02 ("will scramble" / "has been sitting") to smooth out the reading experience.

---

## Most Important Changes

* **Ch 02**: Rewrite the cold open. Your `CONTEXT.md` explicitly forbids "This is the story of..." openings. Trust your receipts and drop the reader straight into the code.
* **Ch 03**: Cut the meta-commentary in the second paragraph ("This is the smallest story in the book..."). The relief of this palate cleanser relies on playing the absurdity totally straight.
