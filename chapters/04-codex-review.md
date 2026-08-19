# Craft review: Chapter 4, “One character”

## Overall judgment

This is the right material in the right broad order, and it is already lean, legible, and morally more serious than the usual xz retelling. The chapter understands its real subject: sabotage did not resemble sabotage while it was being installed; it resembled relief, maintenance, build hygiene, and a security improvement. The `.gitignore` absence and the Landlock period are an excellent paired turn. One teaches Git not to report a file; the other makes a safety check report the opposite of reality.

The draft’s main craft problem is that it does not trust those objects quite enough. Before we reach them, the opening tells us there is a villain, one person, deliberate action, patient trust-building, ordinary-looking commits, and a weapon outside the repository. Later, “the first surprise,” “the second surprise,” and `## The period` announce the turns again. The reader therefore recognizes evidence for a thesis already supplied instead of feeling the thesis form a beat before the narrator names it. That is exactly the “announcing” pattern the earlier reviews rejected.

The chapter should grow, but selectively. At about 1,507 body words, it is not merely concise; it has compressed the acquisition of trust and the blast radius—the two human parts—while giving the mechanisms enough room. A version around 2,100–2,300 words would still feel fast. The added words should make Lasse’s local view and the release/repository gap more concrete, not add attacker biography, supply-chain folklore, or speculation about identities.

## Open and the Chapter 2 cross-reference

> “The last chapter had no villain. This one has nothing else.”

The contrast earns its place in the book’s sequencing, but not as an announced comparison in this opening. It reads like an editor’s note about why Chapter 4 follows Chapter 2 rather than like the first moment of Chapter 4. More seriously, “nothing else” establishes a totalizing villain frame before the chapter introduces Lasse, the useful work, the repository, or the limits of what Git can establish. This chapter plainly does contain something else: a victim, a maintenance crisis, a release-process seam, and two habits for the reader. The sentence makes the ethical field smaller at the precise moment the chapter needs to widen it.

The rest of the paragraph compounds the problem:

> “Everything you are about to read was done on purpose, by one person, patiently, over two and a half years …”

That is both a plot synopsis and a degree of singular certainty the chapter later declines to claim about Hans. “Under a name” is appropriately careful; “by one person” is not. The direct address—“Everything you are about to read”—also violates the project’s preference for entering on an object rather than announcing a story.

Cut the paragraph. Do not relocate the Chapter 2 comparison; let adjacency do that work. A stronger cold open can use the chapter’s own central object without spending its meaning:

> Nine days before the 5.6.0 release, this line entered xz:
>
> ```diff
> +build-to-host.m4
> ```
>
> It was added to `.gitignore`.

Then rewind to January 2022 and “The welcome.” Chapter 3 opens on a `shortlog` and a malformed name; this would open on a diff hunk whose meaning is withheld, so it also satisfies the requirement that consecutive chapters enter on different kinds of objects. When the narrative returns to the line, the empty path and the tarball can disclose why it mattered.

## Structure and pacing

The five acts are in the right causal and emotional order: welcome → Hans → `.gitignore` → period → exit. Trust has to precede capability; capability has to precede concealment; concealment makes the disabled sandbox legible as intent; the exit then reads as denouement rather than evidence being stacked at random. Keep that backbone. The useful structural change is a brief cold-open flash-forward to `.gitignore`, followed by the existing chronology.

“The welcome” is necessary but too summarized. The sequence jumps from one defensive patch, to a list of categories, to `AUTHORS`, to “doing more of the work than Lasse,” and then supplies the verdict: “They are watching a burnout end.” The reader understands the proposition but has not spent enough time approving the contributor. This is where 200–300 added words can earn their keep: one or two concrete examples of the ordinary work already supported by the record, what burden that work removes, and what the repository looks like from Lasse’s side at the time. Replace the mind-reading phrase “They are watching a burnout end” with something observable, such as “They are watching maintenance cease to be solitary.” Let usefulness accumulate before stating that usefulness was the route to trust.

The Hans act belongs here, but it should be shorter and cooler. Its heading—“A name that only adds one thing”—and verbs such as “vanishes,” “donates,” and “disappears” create a noir silhouette before the text states the epistemic limit. The displayed command also has no displayed result, which reads as an accidental blank rather than a receipt. Show a concise locked result or keep the command in the receipts list. Most important, replace the coy sentence “I am not going to tell you who Hans was” with a clean limit: “Git cannot tell me who Hans Jansen was. It can show the contribution and its timing.” The current version sounds as if the narrator knows a secret and is withholding it; the actual authority of the book comes from not claiming one.

The `.gitignore` act is the chapter’s conceptual center and the period is its visual climax. That division is good. What hurts the escalation is the miniature conclusion between them:

> “If you take one habit from this chapter, it is this: diff what you *ship* against what you *commit*.”

Move this to “At home.” Here it releases the tension, tells the reader the lesson, and makes the period feel like a bonus example after the chapter has already concluded once.

The one-character reveal almost lands, but the text gives it away three times before allowing recognition: the title primes a character; `## The period` names which one; and “The second surprise is a single character” explains its scale and significance. Use a neutral heading such as `## The check`. Cut the “second surprise” sentence. Establish Landlock and the responsible-looking commit, show the three-line diff, and give the diff white space. Then begin the next paragraph with “The test never compiles.” A technical reader will have noticed `+.`; a general reader will feel that something in the tiny hunk is wrong; the explanation arrives one beat later for both.

The causal chain after the diff is clear but breathless:

> “The test program never compiles, so the check always fails, so CMake concludes Landlock is ‘not available,’ so `xz` never sandboxes itself …”

The repeated “so” is appropriate once, but four links flatten the moment. Give the false result its own sentence: “The test program never compiles. CMake records that failure as ‘Landlock not available,’ and `xz` proceeds without the sandbox.” That lets the reader experience the inversion instead of racing through it.

“The exit” is correctly placed after the climax, and the backward-readable `SECURITY.md` edit supplies an ominous afterimage. Keep it brief so it does not compete with the period as a third reveal. Ending the historical narrative on Lasse’s removal commit is also right: agency returns to the victim and the repository becomes a record of repair.

## Prose and narrator

The hardest-working paragraph begins “Read what that does.” It explains the generated tarball, the clean working tree, the repository/release distinction, Git’s induced silence, and the later cherry-picks in seven sentences. Its best line is:

> “Git, the tool everyone trusts to show them what changed, was specifically taught to say nothing.”

That is the chapter’s thesis made out of mechanism rather than commentary. Preserve it. The paragraph is carrying enough that “The crime scene is the *tarball*” can lose the crime-story diction; “The payload is in the *tarball*” is plainer and lets the Git sentence remain the rhetorical peak.

The weakest paragraph is the opening. It spends the villain, duration, singular actor, trust, maintenance disguise, and off-repository payload before the dig begins. It also puts the narrator in lecturer mode rather than in the repository. Cutting it will improve surprise, ethics, pace, and voice at once.

The clunkiest sentence is:

> “The work Hans contributes is support for GNU indirect functions — ifunc, the mechanism that lets a library pick which version of a function to use at load time, at runtime.”

The nominal phrase “The work Hans contributes is support,” the singular “ifunc,” and “at load time, at runtime” all snag the sentence. Rewrite:

> “Hans contributes support for GNU indirect functions, or ifuncs, which let a library choose a function implementation while it loads.”

The narrator is otherwise surprisingly absent for a book whose narrator runs `blame` daily. The one explicit “I” is the unhelpful “I am not going to tell you.” Add two small archaeological turns instead: where the narrator expects to find `build-to-host.m4` and gets an empty path, and where the narrator’s eye catches—or initially passes over—the period. No memoir is needed. A pair of sentences such as “I went looking for the payload in the path history. Git returned nothing” would give the evidence a discoverer and make the empty output dramatic rather than merely expository.

Several excellent lines should survive revision:

- “Nobody in the room is watching a heist. They are watching a burnout end.” The first sentence is excellent moment-before-outcome framing; revise only the second sentence’s claim about internal state.
- “Everything before that date is written in the language of maintenance.” This elegantly binds the acts.
- “The sabotage and the fix are the same one character, pointing opposite directions.” This earns the title after the evidence appears.
- “Blame, here, is not a question of who to punish. It is a question of which line to read twice.” This is the right close.

## Ethical register

The draft is not sneering. It consistently presents the early work as genuinely useful, calls the ifunc mechanism legitimate, treats sandboxing as responsible maintenance, and refuses to blame Lasse for accepting help. The closing distinction between blame as punishment and blame as attention is exactly the book’s needed ethical stance.

The risks come from cumulative thriller language and certainty, not contempt. “Villain,” “heist,” “weapon,” “crime scene,” “audacious,” “tell,” “goes dark,” “house,” “inventory of grief,” and “headstone” appear in a short chapter. Any two or three could sharpen it; together they turn an unknown actor into a stock antagonist and aestheticize Lasse’s victimhood. The most important cuts are “This one has nothing else,” “crime scene,” and one or both of the “house”/“headstone” metaphors.

Lasse is treated sympathetically, but the close presumes feelings the commit cannot prove:

> “The final word is Lasse’s, returning to a house that turned out not to be his alone. His removal commit reverts the backdoor and reads like an inventory of grief …”

“Inventory” is grounded in the list that follows; “house” and “grief” assign an interior experience. Let the commit be the emotional evidence: “Lasse’s removal commit is an inventory: the affected releases, the vanished maintainer, the commits to revert.” Likewise, “the way you edit a headstone” is vivid but risks converting a living victim’s administrative repair into the narrator’s elegy. “The second name leaves the header and reappears below, labelled and dated” is already strong enough.

The chapter needs one early sentence establishing how it will use the name Jia Tan: it is the identity recorded by Git, not a claim that the narrator knows who controlled that identity. After that, “Jia” can remain readable shorthand. With Hans, state the narrower limit separately. This avoids both coy speculation and numbing repetition of “the account.” Also replace motive-coloured constructions where the mechanism is stronger. For example:

> “which is exactly what you want if you are about to ship a backdoor and would prefer it not be caged”

could become:

> “The failed probe leaves the process unsandboxed just before the backdoored release.”

The second version does not soften the sabotage; it makes the claim through sequence and effect instead of an imagined inner monologue.

Finally, “none of the usual defenses were asleep” is broader than the chapter has shown and sounds like a blanket acquittal. The more precise and more disturbing point is that the repository looked maintained and the relevant commits advertised ordinary or protective purposes. Say that. Ethical care does not require declaring every defense awake; it requires showing why the visible signals were persuasive.

## Expansion: what earns space

This should not be padded to 3,200 words, but unlike the Bitcoin interlude it has enough unspent story to approach the lower band naturally. Add roughly 550–750 words in four places:

1. **Trust formation, 200–300 words.** Turn “test cleanups, coverage scripts, CMake work” into one compact sequence of observable help. Show what a reviewer would see and why accepting more of it is reasonable. This is the room of the chapter and currently only a summary.
2. **The archaeological absence, 120–180 words.** Let the first-person narrator search the tracked path, confront the blank result, and explain in plain language how a generated release tarball can differ from the Git tree. This is where the book’s distinctive narrator and the nonexpert reader need each other.
3. **Blast radius, 120–180 words.** The template asks what it cost and how long it stayed dark. The current draft names releases 5.6.0 and 5.6.1 and Andres Freund but mostly skips from mechanism to removal. Add one compact, verified account of exposure and response, centered on concrete consequences rather than a general CVE recap.
4. **Lasse’s repair, 80–120 words.** Stay inside the repository: what had to be reverted, relabelled, or re-established. This gives the victim more than metaphor and makes “The project is one person’s again” an observed result rather than a flourish.

Do not add theories about who Jia or Hans “really” was, the external pressure campaign, a catalog of affected distributions, a technical teardown of the payload, or a generic lecture on open-source burnout. Those would make the chapter longer while moving it away from the evidence and its singular Git lesson.

## Close and title

The “At home” section has the right two habits, but the first has already appeared verbatim after `.gitignore`. Move that earlier paragraph here and say it once. Then compress the opening recap—“none of the usual defenses,” “the maintainer was diligent,” “the contributor was … excellent”—because the welcome should have made the reader feel those claims already.

The final movement should be: shipped tree versus committed tree; negative path of an improvement; commit message versus diff; the last sentence about reading a line twice. The existing final sentence is excellent and should remain the last sentence. It returns “blame” to the book’s method, refuses punishment as the easy moral, and leaves the reader with an action.

“One character” is a good title if the prose stops explaining it in advance. It is compact, points toward the period without naming it, and can carry a productive ambiguity between a glyph and an identity in a Git record. But do not force its possible “one person” meaning with the opening claim “by one person”; given the chapter’s own epistemic caution, that makes the title feel like an overclaim. If the revision instead centers the absent shipped file more than the dot, “A clean tree” is the strongest alternative. My preference is to keep “One character,” rename `## The period`, and let “The sabotage and the fix are the same one character” cash the title late.

## Top five changes, ranked by impact

1. **Restore the reveal architecture.** Cut the opening synopsis and Chapter 2 comparison; remove “first surprise,” “second surprise,” and `## The period`; cold-open on the unexplained `.gitignore` line and let the reader notice `+.` before it is decoded.
2. **Make the epistemic boundary explicit and reduce thriller diction.** Treat Jia as the identity in the record, state what Git cannot establish about Hans, avoid singular-actor certainty, and let Lasse’s commit carry emotion without “house,” “grief,” and “headstone” doing it for him.
3. **Expand the human room and blast radius, not the attacker lore.** Spend 550–750 added words on how useful work earns trust, the narrator’s failed Git search, the verified concrete exposure, and the repository work of recovery.
4. **Keep the five-act chronology but repair its tension.** Use `.gitignore` only as a cold-open glimpse before rewinding; move the premature “take one habit” paragraph to “At home”; keep the exit short enough to function as denouement.
5. **Put the engineer-narrator back at the terminal and clean the reading surface.** Replace the coy “I am not going to tell you” with two real acts of looking, simplify the ifunc sentence and the Landlock causal chain, and either show a locked result for the visually empty Hans command or remove that empty display.

The single most important change: remove every advance label around the turn so the reader sees `+.` and feels the failed check one beat before the narrator names sabotage.
