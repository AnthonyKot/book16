**CRAFT REVIEW: 13-node.fable.md**

**Structure & Pacing (Spine vs. Mirror)**
The Promises-deletion spine and the `sys`-mirror cohere brilliantly—they are not two separate chapters. They are two halves of the same thesis: a deletion is an assertion of power. The Promises story is clearly the primary spine, establishing that a founder's deletion can rewrite a project's cultural folklore. The `sys` story serves as the thematic mirror, proving the ultimate rule: a deletion only holds if the person who actually merges the patches agrees to it. However, the transition between the two feels abrupt ("But watch what happens two years later..."), which brings us to the missing word count.

**The Missing Rooms (Word Count)**
You are short about 700–1,000 words because you skipped "The Room" (as mandated by `TEMPLATE.md`) for both pivotal moments.
* **Ryan's Room (February 2010):** You give us the timestamp (Saturday evening) and the empty commit body, but what was the moment before? What was Ryan facing that made 306 lines of deletion the necessary path? Reconstructing this prevents the narrator from sneering at the decision and humanizes the folklore.
* **Isaac's Room (June 2012):** What did the ecosystem look like when `require('sys')` started throwing? What pressure was Isaac under on his Tuesday when he wrote "Un-break" and restored the shim? 
Fleshing out these two rooms will naturally fix the pacing, bridge the spine and the mirror, and pad the word count where it matters most.

**Prose**
* **Hardest/Weakest paragraph:** The opening paragraph (Lines 3–9). It actively violates the `TEMPLATE.md` non-negotiable to avoid "This is the story of..." openings. Starting with a sweeping thesis about callback hell and folklore delays the reader from entering the scene and strips the reveal of its surprise. 
* **Triumphant Narrator:** Yes, the narrator is too triumphant in the opening. Telling the reader their folklore is "wrong, and the repository has known it was wrong the whole time" (Line 8) feels like a sneering dunk. The narrator should be an obsessed guide sharing an archaeological discovery, not a prosecutor catching the reader out. 
* **Clunkiest sentence:** 
  > "It is the origin story you have heard. It is also wrong, and the repository has known it was wrong the whole time. Ask:" (Lines 7-8)
* **Rewrite:** 
  > "This is the origin story we inherited. But the repository remembers something else:"

**The `~` Beat**
> `~ "This project never had X" almost always means someone deleted X, and the deletion is the thing worth reading.` (Line 51)
**Move it.** It is announced too early. At line 51, you haven't yet proven *why* deletions hide so well. Move it to the end of the "Why you can't find it" section, immediately after:
> "The tree is the current state of an argument. It is not the argument." (Line 81)
Once the reader understands that a modern file search (`lib/promise.js`) yields nothing and the class was buried inside `src/node.js`, the beat feels profoundly earned. You do not need a second explicit `~` beat. Line 126 ("a deletion only holds if the next person is willing to keep it deleted") perfectly anchors the `sys` mirror on its own.

**Open, Close, & Title**
* **Title:** "Remove promises" flips flawlessly. It starts as a literal git commit subject, evolves into a statement on Node's foundational technical direction, and lands as a metaphor for the broken contract of a founder's deprecated vision (the `sys` deletion that Isaac reversed).
* **Open:** Needs a complete tear-down. Drop the reader directly into the June 2009 `Add Promise class` commit or Ryan's Saturday night, and let the discrepancy with the folklore emerge naturally.
* **Close (At Home):** Exceptional. You wove the takeaway (`git log -S`, `git log --follow`) directly into the narrative's closing philosophy. It doesn't feel like a boxed sidebar; it feels like the natural conclusion of the chapter's thesis.

***

**Top 5 Changes by Impact**

**5. Connect the Mirror smoothly:** Bridge the transition from the Promises deletion to the `sys` mirror by explicitly framing `sys` as a test of the rule established in 2010 (that founder deletions are absolute only when they own the tree).

**4. Soften the narrator's tone in the opening:** Shift from the triumphant "you're wrong" posture to one of shared discovery, keeping the "no sneering" mandate intact. 

**3. Move the `~` beat:** Relocate the beat to line 82, letting the realization of how git hides deletions (by content, not just filepath) settle in before delivering the aphorism.

**2. Rebuild the Cold Open:** Scrap the folklore thesis statement in lines 3-9. Drop the reader immediately into a concrete moment (the 2009 diff or the Saturday night commit) to honor the template.

**1. Build "The Room" for Ryan and Isaac (The Single Most Important Change):** The missing words belong here. Reconstruct the moment before Ryan typed `Remove promises` with an empty commit body, and the moment before Isaac pushed the `Un-break` shim. Grounding these decisions in the actors' immediate reality will fulfill the template, anchor the shifting power dynamics, and elevate the chapter from a neat git trick to a compelling story about human consensus.
