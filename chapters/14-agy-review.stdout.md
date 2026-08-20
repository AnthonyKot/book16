Here is the craft review of the `14-openssl.fable.md` draft.

### 1. The Causation Boundary (The "Forced" Narrative)
The draft establishes a brilliant, necessary hedge at Line 116: *"Whether the non-acceptance was substantive, procedural, or a matter of timing, the git does not say."* 

However, the prose repeatedly violates this boundary throughout the rest of the text, leaning heavily into a narrative of external coercion that the git simply cannot prove. You are overclaiming the causality. The git proves bureaucratic friction, not an adversarial override. You must flag and rewrite the following:

*   **Lines 30-31:** *"...a three-year argument between what he wanted to delete and what he was allowed to."* 
    *Critique:* "Allowed to" implies a denial of permission. The git only shows it missed the window or criteria for 2.0.7.
*   **Lines 136-137:** *"...the forced revert..."* 
    *Critique:* "Forced" claims external compulsion. Henson may have simply been acting as a responsible release manager adhering to compliance rules.
*   **Line 154:** *"...what he wanted and what he was overruled by..."*
    *Critique:* "Overruled" implies a direct antagonistic command rather than a certification blocker.
*   **Lines 164-165:** *"...where an outside process reached into the code and overrode the people who write it..."*
    *Critique:* This is the most egregious violation. The process didn't "reach in"; the project voluntarily maintained a FIPS module and was bound by its rules. 

### 2. The External `CHECK` Markers
All three `CHECK` markers (L40, L45, L111) are perfectly executed. They contain genuinely external facts (the 2006 standardization, the 2013 Snowden leaks, and the definition of the FIPS 140-2 program). Crucially, the prose explicitly insulates the git-proven story from the external history at Line 47: *"You do not need to trust any of that to feel the story in the git, though..."* The text relies on the external facts for context, but builds its emotional stakes purely from the commit log.

### 3. Craft Risks

**Risk 1: Earning its place next to xz/php.**
Yes, it earns its place, but only if you lean into the distinction. `xz` and `php` are about active, malicious sabotage. OpenSSL is about the terrifying banality of compliance keeping a threat alive. The theme—a compliance checkbox beating a security fix—is strong, but it is currently muddled by the overclaims of coercion mentioned above. If you make this about the cold, unfeeling nature of certification schedules rather than a shadowy authority figure, it becomes a distinct and terrifying chapter.

**Risk 2: Legibility of the Crypto/FIPS background.**
The technical exposition is outstanding. Lines 35-39 ("it is the whole game... your encryption is theatre") distill cryptography brilliantly. Lines 108-115 explain FIPS as a "frozen artifact" perfectly. It will not bore an expert because you have framed the technical reality strictly as narrative stakes.

**Risk 3: The `~` Beat (Aphorism placement).**
`~ A validated artifact cannot be repaired, only re-approved — which means, for a while, the certificate outranks the fix.`
The beat is earned, but placed awkwardly at Line 122. It interrupts the chronological momentum between the 2.0.7 rejection and the 2.0.8 resolution. It will hit much harder if moved down (around Line 131) to serve as the structural punchline to the entire ordeal before transitioning to Henson's eventual disappearance.

**Risk 4: The Ellipsis "Flip".**
Right now, the title doesn't quite flip. In the opening (L12), the ellipsis is introduced as *"the tired trailing dots of someone doing a thing they have already done"*. In the conclusion (L128), it represents *"the plain human weariness of having to do it twice"*. That is a reiteration, not a turn. To achieve a flip, the cold open needs to frame the ellipsis as mundane (e.g., standard developer annoyance at sloppy code churn or a bad merge). The turn should then reveal that these specific dots represent a multi-year geopolitical security crisis flattened into routine compliance paperwork.

**Risk 5: Word count (1,653 words) and "The Room".**
You are roughly 500–1,000 words short of the target band because you have entirely skipped "THE ROOM" beat. The narrative rushes from December 2013 to May 2014 without grounding the reader in the maintainer's daily reality. You drop a massive clue at Line 140: *"Heartbleed in and Heartbleed out"*. Heartbleed broke in April 2014. That means in May 2014, while the entire internet was on fire and Henson was at the center of it, he was simultaneously doing compliance paperwork to put a suspected NSA backdoor *back into* OpenSSL. Expand the narrative between lines 94 and 105. Ground us in his Tuesday during that revert. If you build the crushing texture of his environment, his disappearance in 2017 hits like a freight train.

---

### Top 5 Changes Ranked by Impact

**5. Relocate the `~` Aphorism Beat**
Move the aphorism (Line 122) to the end of "The revert" section. Let the narrative flow directly from the 2.0.7 rejection to the 2.0.8 resolution, and then drop the aphorism as the concluding lesson of the FIPS vs. Security war.

**4. Execute the Ellipsis "Flip" in the Cold Open**
Rewrite the opening paragraph (L12-17) to assume the ellipsis is just standard, petty developer annoyance. Let the reveal be the terrifying scale of what is actually causing that annoyance, earning the emotional weight at the end.

**3. Build "The Room" around May 2014**
Expand the narrative around the revert (L94-L105) to fill the missing word count. You must put the reader in Henson's seat in May 2014. Use the proximity to Heartbleed to texture his exhaustion. What does it actually feel like to maintain this module alone while the world scrutinizes it?

**2. Soften the "At Home" Conclusion**
Revise lines 163-165: *"you have found the place where an outside process reached into the code and overrode the people who write it..."* Change this to reflect procedure, not an invasion. For example: *"...you have found the place where a project's bureaucratic obligations outranked its authors, and the maintainer was decent enough to leave a paper trail."*

**1. Eradicate the "Forced" Causation Overclaims (The Single Most Important Change)**
You must respect your own boundary (Line 116). Remove the phrases *"allowed to"* (L31), *"the forced revert"* (L136), and *"overruled by"* (L154). The git does not prove Henson was commanded by a hostile external actor; it proves he was bound by a release schedule and a frozen compliance artifact. Framing it as a hostile override undermines the unique tragedy of the chapter: it wasn't a shadowy cabal forcing his hand, it was just the banality of version control and certification paperwork keeping a backdoor alive. Fixing this elevates the chapter from a conspiracy theory to a structural tragedy.
