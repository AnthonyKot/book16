1. **GATE — Stop giving away the thirty-nine-second reveal.** Both versions name it before the branch evidence arrives: “the real one is thirty-nine seconds away” in the [full dig](/home/diablo/book16/chapters/23-heartbleed.md:27) and “the commit that did ship is sitting thirty-nine seconds away” in the [reader cut](/home/diablo/book16/chapters/23-heartbleed.reader.md:12). Delete both. The structural placement is right; the advance notice kills it. Let “NOT in the release” open the hole, explain the two histories, then let the timestamps answer it.

2. **GATE — Rename “The twin.”** The heading prints the section’s punchline before the twin appears. Use `## Two histories` or `## The other branch`. Likewise, `## The missing check` announces its conclusion; `## The heartbeat` is cleaner. `## Who wrote it` is acceptable, though `## The fields` better matches the evidence and reduces the courtroom tone.

3. **GATE — Put the narrator back into the dig.** Both forms read like polished exhibits, not like an engineer walking me through an obsession. The book’s original failure mode—“exhibits without a narrator”—is showing again. Two or three first-person interventions are enough:

   - “Now watch it fall apart” → “Then I ask the question that should settle it.”
   - “Look again at those lines” → “I read past the names and into the commit message.”
   - “The habit this chapter wants…” → “When I inherit a famous origin commit, I test it against the release before I write a sentence about it.”

4. **GATE — Make the cold open leaner.** It has the right object and a strong reversal, but both openings spend the later mechanism and blast radius in advance. Half a million servers, passwords, session keys, and private keys all recur later. Save them. Suggested reader-cut opening:

   > Heartbleed has a famous origin commit. New Year’s Eve, 2011, just before eleven: a small heartbeat feature and one missing length check.  
   >   
   > I ask Git whether that commit is inside the release that bled. It isn’t.

   In the full dig, retain the first commit block and ancestry command; that raw `NOT in the release` is much stronger than “Now watch it fall apart.”

5. **GATE — “Who wrote it” earns its place, not its present length.** Keep it immediately after the twin: the timestamp record has already put Henson’s name in view, so the transition is natural. But cut roughly 40% from both versions. The full paragraph beginning “Author *and* committer are Stephen Henson” repeats Henson’s role six times and turns a metadata discrepancy into a miniature prosecution. Replace its argument with something closer to:

   > Git names Henson as author and committer. The message names Seggelmann as submitter and `steve` as reviewer. That was the workflow: the maintainer made the commit under his own name while preserving the patch’s source in prose. The fields and the message answer different questions.

   Then retain one restrained verdict: the patch was submitted by one person and applied by another.

6. **GATE — Remove the two Henson interior drifts.** “The one who typed `Reviewed by: steve` and moved on” invents a scene and mental posture. “On his night off” invents his personal circumstances. Cut both. “Holiday evening” is recoverable because it stays with the timestamp; “moved on” and “night off” make him a character beyond what the fields establish.

7. **GATE — Remove sentences that explain the turn before the record lands it.** Besides the premature “thirty-nine seconds” lines:

   - “There is a second substitution hiding in plain sight” tells me what to conclude before I see the author/message fields. Replace it with a question: “Then I ask Git a different question: who wrote it?”
   - “The bug itself is almost nothing, which is the point” announces the interpretation before explaining the heartbeat. Begin directly: “A heartbeat message says, in effect…”
   - After the twin, “which is exactly why the mix-up is harmless, and exactly why it’s worth stopping on” labors a conclusion the timestamps have already produced. Use: “The diffs are identical. The histories are not. If I am tracing what shipped, only one object counts.”

8. **GATE — Preserve the mechanism paragraphs; they are the chapter’s best writing.** In the full dig, the paragraph from “`n2s(p, payload)` reads…” through “It is an absent one” does the most work: it translates the code, reconstructs the exploit, and names the absence only after I have seen it. In the reader cut, the paragraph beginning “So an attacker could send a one-byte heartbeat…” is the workhorse. Do not expand either. The weakest paragraphs are the long authorship verdicts beginning “Author *and* committer…” in the full form and “That was the old OpenSSL way…” in the reader form. Those are where the cuts belong.

9. **GATE — Use one beat line, at the timestamps.** After the two timestamps have appeared—after the console block in the full dig and after the branch explanation in the reader cut—replace the bold inline treatment with:

   > ~ 22:59:57. 23:00:36.

   Then continue: “The first became famous. The second shipped.” Do not also add a beat after `NOT in the release`; two isolated punches for one reveal will feel manufactured.

10. **GATE — Tighten several overlong sentences.**

   - Full: “Send a heartbeat that says ‘here are 65535 bytes’ and hands over one…”  
     Rewrite: “Send one byte and claim 65,535. OpenSSL returns that byte, then 65,534 bytes lying beside it in memory: session keys, passwords, perhaps the server’s private key.”

   - Full: “The copy that shipped — the one that is an ancestor…”  
     Rewrite: “The famous `4817504d` is the master copy. Its stable-branch twin is the one in every bleeding release. It arrived thirty-nine seconds later.”

   - Reader: “The absent check shipped in OpenSSL 1.0.1…”  
     Split after “1.0.1g.” Begin the blast-radius sentence separately with “At disclosure…”

   - Both: “The line simply looked complete…to everyone who read it” claims a collective interior. Use the observable fact: “For twenty-seven months, the omission left no mark on either branch. That is the quiet terror of a missing check: there is nothing on the screen to notice.”

11. **GATE — Shorten “At home” and make the reader version actionable.** The takeaway belongs; the current recapitulation does not. The full ending is about twice as long as it needs to be, and the reader cut says “one command settles it” without naming the command. Use one compact paragraph in both:

   > At home, when I meet a famous origin commit, I test it against the release before I build a sentence on it: `git merge-base --is-ancestor <commit> <release>^{}`. The same diff can live in different commit objects, so I check ancestry first, then read the author, committer, and message together. The story I inherited is a place to start looking. It is not the receipt.

   The final two sentences earn their place. The preceding catalog of branches, rebases, cherry-picks, fields, newspapers, and the entire Heartbleed recap does not.

12. **OPTIONAL — Add exactly one sharper Git-mechanism sentence to the full dig.** After “same change, different hashes,” add: “A commit includes its parent, not just its patch, so the same change on two histories becomes two objects.” That makes the twin technically intuitive. The reader cut’s “different fingerprints” explanation is sufficient.

13. **OPTIONAL — Keep the code blocks as they are.** The `console` fences are correct, including the piped source excerpts; none should become `diff`. The R3 merge-base block is the least entertaining receipt, but the full-dig promise justifies it. Tighten the prose around it rather than removing it. Do not add block output to the reader cut; its single inline at-home command is enough.

14. **OPTIONAL — Keep the title.** “The commit the internet blames” announces the inherited accusation, not the reversal. It creates the question the chapter then breaks open. “Thirty-nine seconds” would be more coy but less specific and less aligned with *Blame*. The title is not the problem; prematurely naming the twin is.
