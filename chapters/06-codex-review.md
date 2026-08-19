# Craft review: “Initial revision”

## Verdict

The tour form works. More than that, it earns the book’s first departure from the single-repository pattern because the chapter is not really presenting six curiosities; it is building a taxonomy of false beginnings. The sequence—robot, deliberate cut, funeral, accident, control—moves from harmless metadata artifact toward increasingly consequential distortions of ancestry. The reader comes to understand that a root commit is a property of a surviving container, not proof of an origin.

The chapter does, however, flirt with listicle form in **“The cut.”** Linux, Redis, and Bitcoin arrive in the same compact evidence-then-aphorism rhythm, and the third stop makes the reader feel the author could keep producing famous repositories indefinitely. That is a local pacing problem, not a reason to abandon the tour. Cut Bitcoin from this chapter. It is the least cleanly classified exhibit, it revisits a repository that already has a chapter, and its paragraph contains three competing revelations: the missing founder, the already-shipped version, and the twin conversion objects. Redis is the better covert-cut example because its clues are legible inside the tree and teach the reader how to inspect a repository at home. Cutting an exhibit while expanding the chapter is not contradictory: at 1,960 words, the draft is short because it races between evidence, not because it lacks examples.

## Structure and pacing

The mechanism-grouped order is right.

**Robot → cut** establishes the essential distinction: sometimes the false beginning is produced by migration machinery, and sometimes a human knowingly chooses a boundary. **Funeral** then changes the emotional temperature. OpenTTD is not a cleaner or cleverer import; it is salvage after loss. **Accident** is the proper climax because it overturns the remaining assumption that even an artificial root must at least be intentional. The Git control belongs last and pays off both the chapter title and Python’s repeated subject line.

The section most in need of revision is the transition into and through “The cut.” The Linux paragraph is excellent because the actor states his reason in his own message. Redis then shows the silent version of the same mechanism. That completes the pair. Bitcoin does not escalate it; instead, it crosses backward into conversion-robot territory with “the same moment exists as two objects” and sideways into the missing-Satoshi story. The category begins to blur just when the chapter needs its distinctions to feel inevitable.

Linux appearing twice is an asset. Its first appearance is the canonical, deliberate truncation; its second is an unrelated root that entered through graph topology. Those are meaningfully opposed uses of the same repository, and the return makes Linux the chapter’s internal test case rather than a repeated anecdote. Signal the design more plainly. “And then there is the way…” disguises the callback. Something as simple as “Return to the kernel and ask a different question: how many day-ones does it have?” would make the recurrence feel composed.

The control case contains the right reveal but cues it a fraction too loudly. The placement of the actual phrase is correct: the console prints `Initial revision`, the reader recognizes the Python echo, and only then does the narrator say what it means. That is exactly the desired one-beat lead. The premature part is the drumroll: “And its subject line — I checked twice — is:”. Because the title and Python have already loaded the phrase, this invitation makes the reader hunt for the punchline before seeing it. Use the neutral “Its first subject line is:” and let the output do the work.

There is also a smaller suspense leak in “One. The tool itself. Git’s own repository…”. The answer arrives before the causal pleasure of the answer. Let the reader see the impossibility first: a repository made with a two-hour-old tool cannot have pre-tool history; its eleven files implement the recorder being used to preserve them. Then name Git. The reader will arrive there just ahead of the narrator.

## Per-exhibit weight

- **PHP:** Keep the cold-open weight. “The oldest thing in the PHP repository is nothing” is immediate, concrete, and strange, and the empty-tree receipt lets a non-specialist see the paradox. Rasmus entering the record by adding a blank line is a second, human-scale image rather than redundant evidence.

- **Python:** Keep. It is the strongest robot counterexample because the contradiction is inside the artifact: an August commit contains a September signature. It also plants `Initial revision` for the control case. The sentence about three version-control systems is dense but earns its density.

- **Linux, deliberate cut:** Keep at roughly its current length. The quoted admission—“I’m not bothering with the full history, even though we have it”—does more work than any general explanation could, and “Let it rip!” gives the actor energy without making him a target.

- **Redis:** Keep, but trim the ornamental 2025 coda if more room is needed. The copyright span and version `0.07` are clean, transferable clues. “Genesis, for him, is not an event. It is a genre” is polished, but it pushes attention toward the author’s personal habit rather than the chapter’s distinction between origin and import. The absolute “Human commits do not land on :00” also sounds more prosecutorial than the otherwise humane narrator. Phrase it as suspicion—“Ten-thirty and zero seconds is the first seam”—and allow the older copyright and version number to prove the case.

- **Bitcoin:** Cut from this chapter. Its best sentence, “Day one of a clone is wherever the importer happened to be standing,” states the chapter’s thesis beautifully and can be moved into the transition out of “The cut.” The rest is good material, but it is carrying a second chapter’s worth of identity and conversion questions in the smallest space. Coming after the shipped Bitcoin chapter, it also risks making the corpus feel narrower precisely when this chapter is meant to widen it.

- **OpenTTD:** Keep and give it a little air. This is the emotional center of the tour. The paradox “Revision one *is* revision 975” is instantly understood, while the crashed repository gives absence a cost rather than treating it as a clever metadata puzzle.

- **Linux, accidental root:** Keep as the climax and make the return explicit. “It feels like Tuesday” is the chapter’s best moment-before-the-outcome formulation: no one is foolish, no one is malicious, and the permanent cosmological consequence is invisible at the time.

- **Git:** Keep as the sole control. It is not a seventh collectible; it tests the rule the preceding exhibits have taught.

## Prose and metaphor

The séance metaphor earns its sentence but not yet its place in the chapter. “I should warn you now that the ritual is a séance. What answers is not usually the founder” is sharp: it turns a familiar engineering habit into a question about whose voice survives. But séance disappears while the draft cycles through title cards, genesis, an examiner, a funeral, a book, an archivist, and a container. Either echo séance once—OpenTTD gives the natural opportunity, because a survivor rather than a founder answers—or cut it and let provenance be the controlling idea. I would keep it and give it one quiet return. Do not extend it into a full conceit.

The hardest-working paragraph is the OpenTTD paragraph beginning “Revision one *is* revision 975.” It names the paradox, reconstructs the human situation without invention (“a survivor … stood in the wreckage”), quantifies what arrived, identifies what cannot be recovered, and converts the heading’s metaphor into argument: “The first commit is a funeral, and the funeral is the founding.” Nothing there is merely decorative.

The weakest paragraph is the Bitcoin paragraph beginning “Bitcoin’s cut is the strangest, because of who is missing.” It is not badly written; it is under-ranked material. Founder absence, volunteer identity, a pre-existing release, two conversion objects, and missing January keystrokes all compete for the turn. Because two of its crucial framing statements currently need external CHECKs, it also feels less self-contained than the surrounding repository evidence. Most importantly, it does not clarify “cut” after Linux and Redis have already established the mechanism.

The clunkiest sentence is in the closing:

> “When you meet a famous ‘first commit,’ read it like an examiner reads a document: compare its tree to its neighbor’s (`git rev-parse <a>^{tree} <b>^{tree}` — identical trees mean a title card), read the files against the commit date (a September signature in an August commit convicts the date, not the file), and treat round-zero seconds, robot authors, copyright years older than the repository, and version numbers north of 0.1 as what they are: the seams of an import.”

It is carrying the command, two explanations, four warning signs, the examiner metaphor, the title-card metaphor, and the verdict. Rewrite it as:

> “When you meet a famous ‘first commit,’ examine the seam. Compare its tree with its neighbor’s: `git rev-parse <a>^{tree} <b>^{tree}`. Then read the files against the date. Identical trees, round-zero timestamps, robot authors, older copyrights, and a version already north of 0.1 can all tell you that you are looking at an import.”

This also softens “convicts,” which makes the examiner sound like a prosecutor. The draft is at its best when opinionated observation replaces prosecution: “it feels like Tuesday,” “a genesis with no world in it,” and “a death notice that types like a birth announcement.”

## Open, close, title, and expansion

The open is excellent and should remain substantially intact. It starts on an absence, unlike the previous chapter’s origin joy, and “I mean that precisely” is the narrator’s ideal register: confident, slightly obsessive, and ready to show the object. The one possible compression is in the paragraph after the raw commit, but the explanation of the empty tree is worth the space for readers who do not already know the hash.

The close contains the correct at-home practice but becomes a recap of every clue. After the clean control-case snap, the long catalogue dissipates energy. Keep `git log --max-parents=0 --all`, keep one compact instruction for testing adjacent trees and dates, and stop sooner. The strongest available final sentence is already in the draft: “Day one of the clone is day one of the container.” Move it to the final position. The current last sentence—“The thing itself began somewhere the log cannot see — with one exception, and you have to build the recorder itself to earn it”—re-explains a joke the control case has already landed.

“Initial revision” is the right title. It begins as neutral repository language, becomes fraudulent bureaucracy in Python, and turns literally true in Git. No other phrase in the draft performs that three-stage change.

Do expand the body into the 2,200–3,200 band, but do not add another repository or lengthen every exhibit. If Bitcoin is removed, add roughly 450–600 words of connective tissue and narrator instead. The missing material is the reason this tour matters to someone who runs `blame` daily: a root feels like an answer because the command cannot walk past it, yet the chapter shows that this stopping point may belong to a converter, a release decision, a crash, or an unrelated merge. Put that idea after the séance opening, sharpen the robot-to-human-cut distinction in a short transition, and give the return to Linux and the control reveal more breathing room. This will make the piece feel like one guided argument rather than six compressed reports.

## Top five changes, ranked by impact

1. **Cut the Bitcoin exhibit and relocate “Day one of a clone is wherever the importer happened to be standing.”** This removes the listicle bulge, avoids an early return to a previously featured repository, and restores clean mechanism grouping.

2. **Use the recovered space—and the chapter’s existing word-count deficit—to add the narrator’s `blame`-based interpretive spine.** Explain why engineers mistake the graph’s stopping point for the thing’s beginning. This is what turns a strong taxonomy into a chapter of *Blame*.

3. **Re-stage the control reveal.** Withhold “Git” until the reader has inferred the self-recording exception, and replace “I checked twice” with a neutral lead-in so `Initial revision` lands in the console before the narrator names the echo.

4. **Make the second Linux appearance an explicit return.** Frame the first visit as a chosen boundary and the second as an accidental extra root; the contrast is the chapter’s strongest structural escalation.

5. **Shorten the at-home catalogue and end on “Day one of the clone is day one of the container.”** The chapter should close on its changed way of seeing, not on a second explanation of the control-case joke.

The single most important change is to **cut Bitcoin and spend that space building the narrator’s through-line about why a root commit feels like an origin when daily tools such as `blame` can only show where surviving ancestry stops**.
