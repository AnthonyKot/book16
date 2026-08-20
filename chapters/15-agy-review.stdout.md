Here is the craft review for chapter 15, "Postgres." 

This is a phenomenal chapter. The core conceit—that a wrong number becomes a contract, and that true maintenance is the discipline of *not typing*—is one of the most mature engineering observations in the book. It does not feel same-y compared to Node or OpenSSL. Node is about folklore and deletion; OpenSSL is about the danger of compliance. This chapter is about **active restraint**, and the 2023 parser commit is what elevates it from "an old line of code surviving" to "a masterclass in engineering a refusal." 

Here are the notes on craft, pacing, and structure to get this from 1,688 words into the target 2,200–3,200 band without padding.

### 1. Structure, Pacing, & The Missing "Rooms"
You are missing the 500+ words that belong to the TEMPLATE.md "ROOM" beat. The pacing feels a bit rushed because we jump from 1996 to 1992 to 2015 to 2025 without feeling the physical gravity of the moments *before* the commits.

*   **The 1992 Room (JMH):** You currently gloss over JMH in a single sentence. Slow down. Put us in the room at Berkeley in July 1992. What was V4 of academic Postgres? What did the deadline pressure feel like? Reconstruct the moment of typing `0.3333333` and then hitting caps lock to type `THIS IS A HACK`. Give us the Tuesday, the blinking cursor, the guilt, and the pragmatic need to make the compiler yield so they could ship. 
*   **The 2015 Room (Tom Lane):** You have Tom looking "right at it, with a better idea in hand." Expand the temptation here. He is literally writing the patch that enables expression-index stats. He has the machinery to do it right. Deleting the hack is just one backspace away. This is where you build the tension—the sheer temptation of the "clean" fix—before he consciously pulls his hand away from the keyboard. 

### 2. Is the planner/selectivity legible?
Yes, flawlessly so. 
> *"When the planner sees a query condition it cannot estimate... it guesses that one third of the rows will match."*
This is elegant, precise, and gives the non-DB reader exactly what they need to understand the stakes without boring an expert with cost-estimation math. Do not touch this.

### 3. The `~` Beats
Your current beat is magnificent and perfectly placed after the 2015 refusal:
> *~ A number that has been wrong for long enough stops being a mistake and becomes a contract.*

**Is a second needed?** Yes. You need a second beat at the end of the 2023 `ALTER TYPE` section to synthesize what makes this chapter distinct: the concept of active restraint. The parser trick is brilliant because it shows that a refusal takes work. 
*Candidate:* `~ Sometimes the highest form of engineering is writing code to enforce a refusal.` 
*(or)* `~ The most load-bearing code in a system is often a warning not to write any.`

### 4. The Title: `THIS IS A HACK TO GET V4 OUT THE DOOR`
Keep it in all-caps. It absolutely flips—it starts as a frantic, embarrassed apology in 1992 and ends up as a revered, load-bearing monument in 2025. Does it work on a contents page? Yes, precisely because it breaks the formatting rules. It looks like an anomaly, which perfectly signals "git archaeology." Let it scream.

### 5. Prose: Clunkiest Sentence
> *"Twenty-seven years and sixteen thousand eight hundred sixty-three commits later, more than any other human in the project's history, and the through-line of that enormous body of work is not the features he added but the judgment about what not to disturb."*

**Why it’s clunky:** It’s a massive, breathless comma splice that loses its grammatical subject halfway through. 
**Rewrite:** *"Twenty-seven years and nearly seventeen thousand commits later, his volume of work is unmatched. Yet the through-line of that massive legacy isn't the features he added—it's his judgment about what to leave alone."*

### 6. Prose: Weakest Paragraph
> *"The commit adds no feature. It adds a refusal — and places that refusal exactly where the next person to attempt the feature is guaranteed to look, which is the grammar file, at the syntax they are about to implement. He could have written this on a wiki, or a mailing list, but those are places people do not look before they start coding. The parser is. The message is longer than the code because the code is a signpost, and the signpost is the point."*

**Why it’s weak:** The phrasing *"which is the grammar file, at the syntax they are about to implement"* drags the momentum. The fragment *"The parser is."* is an orphaned thought that stumbles rather than punching.
**Rewrite:** *"He placed that refusal exactly where the next ambitious implementer is guaranteed to look: the grammar file. He could have written this warning on a wiki or a mailing list, but developers don't check wikis before they start coding. They check the parser. The code is a signpost, and the signpost is the point."*

### 7. Open & Close
*   **Cold Open:** It works beautifully. *"Somewhere in the query planner... there is a number, and the number is one third."* It drops the reader straight into the anomaly.
*   **At Home:** Waving the command into the prose is good, but the instruction is slightly abstract (*"run `git log -S` on the ugly constant"*). Make it literal. Tell the reader to go to their own repository and run `git log -S "XXX"` or `git log -S "HACK"`. Ground the philosophical takeaway in a physical keystroke.

---

### Top 5 Changes by Impact

**5. Anchor the "At Home" command:** Make the reader's homework explicit (e.g., `git log -S "XXX"`). 
**4. Add a second `~` beat:** Place it after the 2023 parser commit to formalize the concept of "active restraint." 
**3. Fix the weakest paragraph:** Tighten the grammar file explanation to give the "signpost" line the punch it deserves.
**2. Build the 1992 Room:** Give us the V4 deadline pressure that forced JMH to hardcode the fraction. Make the reader feel the pragmatic guilt of the hack.
**1. Build the 2015 Room (The Most Important Change):** Slow down time at the moment of temptation. Tom Lane has the fix in hand. The machinery is built. Put the reader in his chair in the moments *before* he decides not to hit enter. Expanding this room is the key to hitting your word count organically and cementing the emotional core of the chapter.
I've provided the complete review above, and the task has finished successfully! Let me know if you need any adjustments or if you'd like me to review another chapter.
