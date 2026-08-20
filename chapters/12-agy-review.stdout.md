# Craft Review: Blame, Chapter 12 (php.fable)

## The Craft Risks (Answers to your questions)
1. **Does it earn its place?** Yes. It doesn't read as a third betrayal because the core themes are entirely different. While *xz* (ch.04) was a long-con of trust, this chapter is about *identity forgery* (metadata forensics) and *graph mechanics* (the permanence of a reverted commit). The attacker coming back wearing the mask of the man who just banned them is a uniquely git-specific horror story.
2. **The Code Explainer:** It works perfectly. The non-C reader is guided by the plain-English translation (`+8` letters of zerodium), while the security reader is engaged by the psychological audacity of the camouflage (`User-Agentt` vs a random string) and the taunt. It's efficient and shouldn't be expanded.
3. **Narrator Tone:** It is slightly too gleeful and prosecutorial. Phrases like "The repository convicts the impersonation by itself," and "The costume does not fit" veer into *CSI: Miami* territory. The horror of an impersonated founder should feel cold and unsettling. Dial back the swagger and let the metadata's stark honesty do the heavy lifting.
4. **Title "Fix typo":** It flips brilliantly. First, it's an innocent excuse to bypass CI. Then it's the literal camouflage of the doubled 't' in `User-Agentt`. Finally, it becomes the surreal, repetitive battle cry of a revert war on a Sunday afternoon.
5. **The Missing Word Count:** Your draft is ~1,100 words because you entirely skipped the **ROOM** and **BLAST RADIUS** beats mandated by your template. The missing words belong in the 5-hour gap between the backdoor and the revert, and the fallout that killed `git.php.net`.

## Structure & Pacing
- **The Missing Rooms:** You jump from the attacker's metadata straight to the revert. We need the "moment before the outcome" for Nikita Popov. What did his Sunday look like? Why did he look at a `[skip-ci]` commit from the language's founder? We also need the room of the *old* infrastructure—the realization that the house itself (`git.php.net`) was compromised.
- **The Blast Radius:** Since the payload was caught before a release, the blast radius wasn't a million compromised servers; the blast radius was the death of a 20-year-old self-hosted infrastructure. Frame the move to GitHub as the true casualty of the attack.

## Prose Notes
- **Hardest-working paragraph:** The code explainer ("[R2] Eleven lines. Read what they do..."). It demystifies C seamlessly while highlighting the attacker's smugness.
- **Weakest paragraph:** "Five hours later, a real maintainer catches it, and his revert is the closest thing to an official statement the git history contains:" — This is a pure summary transition that violates the "no hindsight" rule. Drop us into the moment of discovery instead.
- **Clunkiest sentence:** "The word `zerodium` is not in any of those subject lines. It is not in any commit message anywhere in the repository — `git log --grep=zerodium` finds nothing. [R7] The only way to see the backdoor in the log is to search the *contents* of the diffs, the way I just did. The subjects are all quotation marks and the word 'typo.' The evidence is one layer down."
*Rewrite for punchiness:* "A `git log` for 'zerodium' finds nothing. The subjects are a hall of mirrors repeating the word 'typo'; to see the war, you have to search the contents of the diffs."

## The `~` Beat
- **Current beat:** `~ A revert does not remove the crime. It records it, and files it under the graph, forever.`
- **Verdict:** **Keep it.** It's a fantastic thesis for the chapter. It's placed well, but it could also serve as the devastating final thought of the entire chapter if you wanted to move it down.
- **Second beat needed?** Yes. You need one earlier in the "tells" section about identity. Something like: `~ In git, a name is just a string you type. It is the metadata that tells the truth about the hands on the keyboard.`

## Open, Close, and "At Home"
- **Cold Open:** Excellent. Dropping the innocent `[skip-ci]` commit and immediately showing the horrifying payload diff is exactly what the template calls for.
- **At Home:** Solid, actionable advice. However, the transition into it ("The habit from this dig is...") feels a bit didactic. The final sentence, though, is a banger ("a fossil you can hold..."). Keep the landing exactly as is.

***

## Top 5 Changes by Impact

**5. Frame the death of `git.php.net` as the Blast Radius.**
Since the backdoor never shipped to users, the casualty wasn't PHP itself—it was the project's self-hosted independence. Expand on what it meant to abandon a custom server for Microsoft's SaaS forge to satisfy the template's Blast Radius beat.

**4. Add a second `~` beat on identity.**
Anchor the "Tells" section with an aphorism about how git authorship is a trust-based illusion, while timestamps and trailers are the physical evidence of habit.

**3. Chill out the prosecutorial tone.**
Remove the gloating swagger ("The repository convicts the impersonation," "The metadata is a costume"). Play it completely cold. The fact that the attacker forgot to change their local machine's +0200 timezone is chilling enough without the narrator doing a victory lap.

**2. Fix the weakest transition into the revert war.**
Instead of saying "Five hours later, a real maintainer catches it...", stretch that moment out. Build the tension of how close this came to going unnoticed before dropping the Nikita Popov revert receipt.

**1. Write the maintainer's "ROOM" (The Moment Before the Outcome).**
> *Draft quote:* "Five hours later, a real maintainer catches it, and his revert is the closest thing to an official statement the git history contains:"

**Why it matters:** This single sentence bypasses the most human part of the entire incident and violates your own `TEMPLATE.md` mandate to "reconstruct what the actor knew and wanted right then." To fix this, you must expand this transition into a full scene. Reconstruct Nikita Popov's Sunday morning. He sees a commit from the creator of the language. It explicitly says `[skip-ci] Fix typo`. Why did he look deeper? Did an automated email diff catch his eye? Did he happen to review the weekend commit stream? Put the reader in his chair *before* he types the revert command. Exploring the psychology of this discovery—the sheer disbelief of seeing a backdoor authored by Rasmus—will organically provide the 600+ words your draft is currently missing.
