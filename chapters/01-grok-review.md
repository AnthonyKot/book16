# Craft review: “The nine minutes”

Chapter 01, Debian OpenSSL. 2,071 words of body against a 2,200–3,200 band. This is a craft review, not a fact check. Hashes, dates, commands, and quoted output are locked. I am not touching them.

The bones are good. The voice is already the book’s voice: first person, in the repo, opinionated without sneering. Three sentences in this draft are keepers for the whole series. The problem is not talent. The problem is that the chapter *tells the reader the disaster in sentence two*, then spends 2,000 words confirming it, while its actual surprises — the nine minutes as a responsible Tuesday, the dead path, the compiler staring at the wrong function — have to fight their way out of a plot summary they never asked for.

The draft is also 129 words *under* the floor, not just under the cap. That is permission, not a mandate to pad. Every addition below is in service of a beat that is currently asserted rather than inhabited.

---

## 1. Structure and pacing

### The open dumps the ending, then lectures

The first sentence is the right object: two commits, nine minutes, a Tuesday. Then this:

> Between them, `git` records the moment a maintainer quieted a warning and, without knowing it, made every cryptographic key his distribution would generate for the next two years guessable by anyone who cared to try.

That is the blast radius, the turn, and the moral, stacked in one sentence, before we have met Kurt, seen the comment, or watched a hand move. CONTEXT.md exists because the earlier shelf had “no surprise.” This sentence is that failure mode in a nicer coat. A reader who already knows CVE-2008-0166 nods and settles in for folklore. A reader who doesn’t has nothing left to feel a beat before it is named, because you just named it.

Then the pacing stalls. We clone, we `git log --reverse | head`, we get 1998, and then a full paragraph of method:

> 1998. Ralf Engelschall, upstream. That is a lie of a useful kind — the packaging history does not start in 1998, it is *grafted onto* the upstream history, and the two lines share no common ancestor.

“Keep that in your pocket” is a teacher’s aside in the middle of a cold open. It is true, it is useful, and it is in the wrong room. The reconstruction section is where tags lie and DAGs mislead. Put the graft there, or cut it to one clause on the way into the packaging history. Do not make the reader sit through `--first-parent` before they are allowed to meet the man with the bug report.

**Move:** the 1998 / graft / `--first-parent` lesson out of the open. Either park it at the top of “The reconstruction,” or reduce it to: “I clone the packaging repo, not upstream. That is where it lived.” The clone URL can stay. The lecture cannot.

### The room is the right room. It does not spend the nine minutes.

“Here is what Kurt Roeckx knew on 2 May 2006, and here is what he did not.” That is a contract. You pay the first half — bug report, Valgrind, Purify, the 1998 comment as a *scope*. You never pay the second half as a sentence. You also never sit in 16:25–16:34. The title is a duration. The duration is two timestamps at the end of a paragraph:

> Kurt read that comment as a rule. On 2 May at 16:25 he imports upstream's `md_rand.c` into the package. Nine minutes later, at 16:34, he generalizes the exception.

That is the whole human action. Import, then generalize. We do not see the two call sites looking the same. We do not feel the DRY instinct. We do not get the half-second where a `#ifndef PURIFY` reads like policy. TEMPLATE.md: reconstruct what the actor knew when they typed. The reader should think “I might have done this.” Right now they think “ah, he generalized.” That is a plot point, not a room.

**Expand there, not in the graft.** A short paragraph between the import and the 16:34 commit: two `MD_Update(&m,buf,j)` calls, one already behind the switch, the comment looking like a rule for the file rather than a rule for a line. Stop before you tell us he was wrong.

### The turn lands — then keeps talking

The turn *sentence* is the best line in the draft:

> He has not disabled a Purify workaround. He has disabled the seeding.

That is the reveal. It should have whitespace on both sides. It does not. It is the hinge of a paragraph that immediately explains PID space, “astronomical,” and “enumerate over a weekend.” Those belong, but they belong *after a beat*. Let the seeding line sit. Then the collapse.

The paragraph that precedes it does too much in one breath (see Prose). Structurally it is correct: show the two functions, let the reader notice `ssleay_rand_add` is not a throwaway, *then* name it. Tighten the approach and isolate the landing. Do not move the turn.

One other leak: “Nobody in the room knows this” is the right note, but it is followed by changelog-date trivia (6 April vs 2 May) that is a different kind of git-clever. The April trailer is a nice texture. It is not the next sentence after you have just killed the entropy pool. Give the death one more beat of silence, then the housekeeping. Or move the April date down into the “it reads like housekeeping” / unreleased-entry point, where it earns its keep.

### The four-months twist is in the right place. It is not one twist.

Position: after the turn, before the blast radius. Correct. You cannot feel “inert” until you know what the file *does*. Do not move this section earlier. Do not bury it after 2008.

The problem is density. Under one heading you run three reveals:

1. The file is at `rand/md_rand.c`. The compiler reads `crypto/rand/md_rand.c`. Four months of a live bug that is a no-op.
2. 17 September, “Really fixing,” a rename that *arms* it.
3. Fifty-seven minutes later, nested comments; the compiler catches the harmless half.

That is a three-act play in a closet. (1) is the chapter’s unique archaeology — “no CVE writeup will tell you.” (2) is the real shipping moment, and it fights the title, which still thinks May is the event. (3) is the cruelest irony in the piece and it is currently a runway into the next code block.

**Split, or at least break.** Keep “Four months in the wrong place” for the dead path through the `ls-tree` proof. Give the Sunday — the rename *and* the nested-comment build break — its own heading, or a hard visual break and a one-line paragraph between them. Something as small as:

> Fifty-seven minutes later the compiler gets a vote. It votes on the wrong line.

Then the `a590e4f469` block. The reader needs a breath, because “the build break was looking at the wrong function” is a second turn, and second turns die in the shadow of first turns unless you light them.

“And then the best part, the part that is pure `git` and that no CVE writeup will tell you” is the narrator elbowing the reader in the ribs. Cut the wind-up. The fact is the wind-up.

### Blast radius, then a second chapter

“The blast radius” does three jobs: twenty months of keys, the three-line fix that will not grep, the translations-stanza clothes. All three belong. The third (“someone else’s clothes”) is the best metaphor in the draft and then gets explained to death in packaging jargon. Keep the metaphor; one concrete beat of the stanza; stop. The `postinst` threshold is a receipt, not a sentence the uninitiated can feel. If you keep it, make it a human action: upgrading services get asked a question they would not have been asked on a translations Tuesday.

“The reconstruction” is where the chapter changes jobs. Up to here we have been in 2006–2008 with Kurt. Then we get a 2009 backfill of the etch tag, a `merge-base` that is not an ancestor, *and* the quilt leftover named `valgrind.patch` through 2016. That is a seminar on how to read a Debian tag, followed by the best coda image you have.

The etch material is real archaeology and it teaches a habit (“compare author date to changelog trailer”). It is also a new plot after the emotional peak. If you keep it, it cannot be the same length as the May–September story. Compress the merge-base into the date mismatch — we already understood “2009 commit, 2008 changelog” from the `git log -1`. The `exit=1` block restates. One proof is enough.

**Do not cut the leftover.** `valgrind.patch` carrying the original excuse until upstream deletes the file is the last image, and it should be the last image of the story proper. It is currently the last paragraph of a section called “The reconstruction,” which is the wrong frame. The leftover is not a reconstruction. It is the name that would not die.

Suggested order from the fix onward:

1. Blast radius (keys, enumerate) — short, concrete.
2. The fix, the empty greps, someone else’s clothes — one movement.
3. Optional, compressed: the etch tag is a year late (teaching beat, half the current length).
4. The leftover, named `valgrind.patch`, into At home. Do not put a heading between the leftover and the habit. They are the same thought.

### Headings are the template, wearing a nametag

“The room,” “The turn,” “The blast radius,” “At home” are beat names from TEMPLATE.md. CONTEXT.md’s diagnosis of the earlier shelf included “uniform template.” If chapter 02 also has a section called “The turn,” you have rebuilt the thing you were trying to kill. These headings should be *this* story’s objects: the comment, the dead path, the Sunday, the empty grep, the leftover.

You already have one that works: **“Four months in the wrong place.”** That is a title. Make the others earn that standard.

---

## 2. Prose

### Sentences to rewrite

**1.** (open, sentence two)

> Between them, `git` records the moment a maintainer quieted a warning and, without knowing it, made every cryptographic key his distribution would generate for the next two years guessable by anyone who cared to try.

The sentence is doing four jobs and finishing the book. Split, and *do not put the guessable keys here.*

Rewrite: “Between them, a maintainer quiets a warning. Both commits look like hygiene.”

If you cannot bear to lose the stakes from the first screen, put one concrete object, not the outcome: “Between them, a comment moves from one function to two.”

**2.** (graft)

> That is a lie of a useful kind — the packaging history does not start in 1998, it is *grafted onto* the upstream history, and the two lines share no common ancestor.

“Lie of a useful kind” is the narrator performing. Three clauses after the dash bury the instruction.

Rewrite, if this stays at all: “The packaging history does not start in 1998. It is grafted onto upstream, and the two lines share no ancestor.”

**3.** (the approach to the turn — over-long, buries the point)

> Every call that says "here is some entropy — the process ID, the time, the contents of `/dev/urandom`" arrives through `ssleay_rand_add` and gets hashed in by exactly the `MD_Update(&m,buf,j)` he just wrapped in `/* */`.

Quotes inside a quote, an em dash, two identifiers, then the punch. The punch is the wrap. It arrives exhausted.

Rewrite:

> Every seed the process has — PID, time, `/dev/urandom` — comes in through `ssleay_rand_add`. The line that hashes it into the pool is `MD_Update(&m,buf,j)`. That is the line inside the `/* */`.

**4.** (section wind-up)

> And then the best part, the part that is pure `git` and that no CVE writeup will tell you: for four months, it doesn't matter. Because he put the file in the wrong place.

“The best part, the part that is” is a stutter. “Pure `git`” is fan service. The fragment after the period is doing the real work.

Rewrite: “For four months, it does not matter. He put the file in the wrong place.”

**5.** (sneering-adjacent, and it flattens a precise subject line)

> It is the confession of a man who now understands exactly which line he commented out.

“Confession” prosecutes. The book’s rule is the moment before the outcome, no hindsight-flattering, and no sneering. The subject line already *is* the understanding. You do not need to stand behind him and name his soul.

Rewrite: “The subject names the function and the call. That is new.”

**6.** (good metaphor, then a traffic jam)

> The urgency flips from `low` to `high` and the `postinst` restart threshold moves so upgrading services get prompted — the only two signs, in the packaging, that this was the fire and not a Tuesday.

Fire / Tuesday is worth saving. The compound subject is not.

Rewrite: “Urgency goes from `low` to `high`. That, and a prompt on upgrade, are the only signs in the packaging that this was the fire and not a Tuesday.”

**7.** (coda, almost)

> The lesson Debian took from the worst key disaster of the decade was "use quilt," and they named the survivor after the thing that started it.

Glib on quilt, right on the name. Lead with the name. Drop the superlative — “worst of the decade” is a magazine. You have not spent this chapter ranking disasters.

Rewrite: “They named the survivor `valgrind.patch`. The original excuse, still on the file, release after release, until the file was gone.”

**8.** (At home, mixed metaphor)

> A `#ifndef SANITIZER` that disables a *read* is a loaded gun, because the next person to touch the file will read the comment as a rule and widen it.

The chapter is about commenting out a seed, not about a gun. The second clause is the actual lesson.

Rewrite: “A `#ifndef SANITIZER` that disables a *read* is an invitation. The next person to touch the file will read the comment as a rule, and widen it.”

### The paragraph doing the most work

This one, in “The turn”:

> Two functions, two identical comments, two `MD_Update` calls commented out. The second one is the one Purify actually complained about — the throwaway buffer, already behind `#ifndef PURIFY`. Fine. But the first one is in `ssleay_rand_add`, and `ssleay_rand_add` is not a throwaway. It is *the function that mixes the caller's seed into the pool.* Every call that says "here is some entropy — the process ID, the time, the contents of `/dev/urandom`" arrives through `ssleay_rand_add` and gets hashed in by exactly the `MD_Update(&m,buf,j)` he just wrapped in `/* */`.

It has to (a) distinguish the two sites, (b) teach what `ssleay_rand_add` is, (c) make the wrap feel like a hand on a live wire, and (d) set up “He has not disabled a Purify workaround.” It does all four, which is why it is tired. Break it after “not a throwaway.” Let “It is the function that mixes the caller’s seed into the pool” be its own line. Then the rewritten entropy sentence. Then a blank line. Then “He has not disabled…”

### The paragraph pulling its weight least

The graft paragraph in the open (1998 / useful lie / `--first-parent` / keep that in your pocket). It does not belong to this story’s first two minutes, it teaches a general Debian-repo fact the reader does not yet need, and it costs the cold open its temperature.

Runner-up: the `merge-base --is-ancestor` block in “The reconstruction.” Once you have shown AuthorDate 2009 against a May 2008 changelog, the reader has the lesson. Exit 1 is a second stamp on the same envelope.

### Small voice notes

- “Garbage in, but garbage is entropy, and the whole point of a random number generator is that more unpredictability is better.” — this is the right idea, slightly sing-song. One clause can go. “Garbage is entropy. That was the point.”
- “It does not say the practice is wrong. It says one function is noisy under one tool.” — keep. That is the room.
- “A modified file at a path the build doesn't use is a no-op.” — keep. Do not decorate it.
- “You did not break the key. You enumerated it — precompute every possible key, look yours up.” — keep. This is the blast radius in a human mouth.
- “They wrote down the ticket number, not the crime.” — keep the cadence; consider swapping “crime” for “consequence” if you want to stay off the prosecutor’s register. I would keep “crime.” The book is called *Blame*. The last word can have a tooth. It is aimed at the *record*, not at Kurt.
- “six months of released Debian and Ubuntu will descend from this Sunday afternoon” will collide, in the reader’s ear, with “predictable for twenty months” a screen later. I am not litigating which span is which. I am saying the ear will do math you did not ask for. Repeat one duration, or make the six-month phrase clearly a different quantity (lineage of a release train, not the outage). As written they sound like a contradiction.

---

## 3. Formatting and readability

This ships as static HTML. The reading surface is currently a little noisy for a screen, and noisy in ways that fight CONTEXT.md: “a reader must be able to *see the moment* without holding locators in their head.”

### Get the locators off the page

The body is salted with **(R1, R2)**, **(R5)**, **(R8)**. On HTML those render as bold parentheticals in the middle of narration. They are the receipts file leaking. The trailing `## Receipts` list is the right place. If you need a hook for verify.sh or for a later hyperlink, make the R-number a small end-of-paragraph link, or a `data-` attribute, or a footnote-style superscript that does not interrupt the clause. Do not make a first-time reader step over **(R6)** to get to “because it lands in an unreleased entry.”

### Headings, again, as typography

Six `h2`s named after the beat sheet will look, in a chapter list, like every chapter is the same house. Use story objects. Proposed, not mandatory:

- (no heading — cold open)
- `/* purify complains */` or “The comment as a rule”
- “Four months in the wrong place” (keep)
- “Really fixing” (the Sunday)
- “Someone else’s clothes” or “Nothing for CVE-2008-0166”
- the leftover, untitled, running into At home

### Code blocks: keep the money, cut the homework

Keep:

- The `/* purify complains */` grep. That is the 1998 object. Give it a `c` or `diff` language tag if the HTML highlighter will take it.
- The two-hunk diff in the turn. This is the photograph. Tag it `diff`. The `...` between hunks is fine; a comment in the prose (“two sites, same comment”) already orients.
- The empty greps. Two commands, no output. That is a visual joke that teaches. Do not describe the emptiness; show it. In HTML, the short empty block is a gift. Maybe a one-line paragraph after: “Nothing.”
- `ls-tree` with one path present and one absent. The absence *is* the proof.

Consider cutting or folding into prose:

- The opening `git log --reverse | head` once the graft lecture moves. If you keep a first command, make it the command that finds *this* story, not the command that finds 1998.
- The etch `merge-base` block, if the 2009 author date stays in prose.

Untagged fences will all highlight the same way. For static HTML, `console` / `diff` / `c` is worth the extra token. Readers scan fences; language tags make the photograph different from the shell.

### Where the eye gets lost

- The turn section is command → six-line stat → “Six lines. Read the diff” → diff → the two-functions paragraph. That is the right sequence, but it is a wall. After the diff, before “Two functions,” a one-line paragraph: “Two sites.” Then the explanation. The HTML will breathe.
- “Four months” is three fences in a row with thin mortar. A pull-quote or a one-liner between the rename and the nested-comment commit is the difference between a twist and a log dump.
- The long italic in the room — *this specific read, of this throwaway output buffer, is the one Purify hates, and here is the one place we make an exception* — will render as a slab of emphasis. Italics are not a container for a policy. Shorten, or make it a blockquote of the *comment*, not a blockquote of your gloss.

### Pull-quotes (use two, not five)

These are the lines that should be impossible to miss on a phone:

1. “He has not disabled a Purify workaround. He has disabled the seeding.”
2. “The build break was the last automated check between Kurt and the disaster, and it was looking at the wrong function.”

Optional third, as the closer of the story proper: “They named the survivor after the thing that started it.”

Do not pull-quote the open. Do not pull-quote “And then the best part.”

### Whitespace the HTML will actually use

- One-line paragraph for the clock: “16:25. Import. 16:34. He generalizes the exception.”
- One-line paragraph for “Really fixing.” — you almost have this; isolate it further. It is his words. Let them stand as a heading or a quote, not a clause inside a `--stat` recap.
- After the seeding sentence, a full break. Not a new `h2`. A break.

---

## 4. Expansion

You have ~1,100 words of headroom before the cap, and you are still short of the 2,200 floor. Add in four places. Not more. Do not add a history of OpenSSL. Do not add a CVE-timeline recap. Do not add more git pedagogy in the open.

### A. Sit in the nine minutes (after 16:25, before 16:34)

Right now: “he imports… Nine minutes later… he generalizes the exception.”

Add a short paragraph that is *only* what the two call sites look like to a person trying to be tidy. Two `MD_Update(&m,buf,j)`. One already behind `#ifndef PURIFY`. A comment that reads like a file-level rule. The instinct is not vandalism. It is “the other one should match.” One sentence of identification: this is the same gesture as grepping a sanitizer annotation and widening it so the log goes quiet. Stop. Do not say he was about to disable seeding. The turn says that.

This is the non-negotiable from CONTEXT.md (“I might have done this”) and it is the only way the title tells the truth.

### B. Make 15 bits a thing you can feel (blast radius, after “a PID on Linux is a number under 32,768”)

You have the number, and you have “enumerate over a weekend,” and later “at most fifteen bits.” Add one concrete image of scale, not a formula. A PID is a 15-bit integer. 32,768 keys is not a haystack. It is a file that fits in memory, a table you build once and `grep`. An SSH host key from a Debian box in that window is not “weak.” It is *on the list*. One sentence that makes a sysadmin feel their `known_hosts`.

Do not add attack choreography. Do not add a tutorial. Add the difference between “breaking” and “looking up.” You already have “You did not break the key. You enumerated it.” Give that line a physical object.

### C. The compiler’s wrong vote (after “nested comments don’t work”)

This is the rushed irony. Add four to six sentences on what a build failure *feels* like at 14:29: you are not thinking about entropy; you are thinking about a comment style. Nested `/* */` is a beginner mistake. `#if 0` is the grown-up fix. You apply it to the site the compiler named. You do not go looking for the site that compiled. The last automated check is a smoke alarm that went off because of toast.

Keep Kurt blameless here. The cruelty is the tool’s attention, not his character.

### D. Fuse the leftover with the habit (end of leftover → At home)

You currently explain quilt, then explain At home as a separate lesson list. Spend the extra words connecting them: the comment that survives is the comment that will get widened next time. `valgrind.patch` is not a cute coda. It is the exhibit for `git log -S` on tool names. One paragraph that walks from the surviving patch name to the command, and you can cut the “loaded gun” lecture because the file *is* the lecture.

Do not expand the etch backfill. If anything, shrink it to fund A–D.

---

## 5. Open and close

### Cold open — not yet the strongest entry

What works: the clock, the pair of commits, “the same person,” “the responsible thing.” What fails: sentence two is a spoiler, and the next screen is a `git log` seminar.

Stronger version, same object:

> Two commits, nine minutes apart, on a Tuesday afternoon in May 2006. Both by the same person. Both doing the responsible thing.

Stop. Clone in one sentence of method (“I go to the Debian packaging repo, not upstream, because that is where it lived”). Go to the room. Do not say “guessable.” Do not say “two years.” Do not say “cryptographic key.” Let *ssleay_rand_add* be the first time the reader understands the stakes. Let September be the second. The folklore can wait until the blast radius, where “every SSH host key” will land like a delayed charge instead of a jacket copy.

If you want a different object entirely, the TEMPLATE allows an absence. The two empty greps are a hell of an open — “the search anyone would actually type,” nothing — and then you work backward to May. I would not do that for chapter 01. The empty grep is a better *middle* shock because by then we know what should have been greppable. Opening on absence is a trick you should save for a later chapter, and CONTEXT.md says no two consecutive chapters open the same way; spend the clock here.

Do not open on the 1998 comment. It is a beautiful object and it belongs in the room, as the thing Kurt reads, not as the thing we show before we have a reader.

### “At home” — it earns half its keep

The habit is right. `git log -S` on sanitizer comments; do not grep the crime. TEMPLATE.md wants it woven, not boxed, and you have not boxed it. Good.

What does not earn: two lessons at equal volume in one paragraph, after you have already closed the story on `valgrind.patch`. The leftover is the At home. Right now you set down a perfect image and then give a seminar that restates it.

Stronger close:

1. Last story image: they named the survivor `valgrind.patch`. It rides until 2016.
2. One woven paragraph: so when you hunt, you hunt the *tool name in the comment*, not the CVE in the subject. `git log -S` on `valgrind`, `purify`, `asan`, `coverity`. The next widening will look like hygiene.
3. Last line, keep: “They wrote down the ticket number, not the crime.”

Cut “the shape of it, and the shape recurs” — that is the narrator announcing a thesis. The quilt patch *is* the recurrence. Cut “The dig here isn’t the CVE.” We know. You have been showing us.

---

## 6. Title

**Keep “The nine minutes” only if you actually spend them.** Right now the title promises a duration the body treats as a timestamp. If expansion A happens, the title becomes honest and I would keep it. It is mysterious, it is a clock, it is not folklore.

If you do not inhabit 16:25–16:34, the title is a feint, and the chapter’s unique find is the dead path. Then change it.

Alternatives, in order:

1. **Really fixing** — his words, the rename that arms it, the irony without a wink. Best if you decide September is the event (it is).
2. **The dead path** — the archaeology no CVE writeup has. Best if you want the book’s brand (git shape, not crypto folklore) on the chapter label.
3. **The comment as a rule** — the mechanism, and the At home, in five words. Drier. More reusable as a type for later chapters, which may be a reason *not* to use it here.

I would not use “Purify complains” (too interior), “Uninitialised” (too cute), or “Four months in the wrong place” as the chapter title (that is already a great *heading*; using it twice flattens it).

---

## Top 5 changes, by impact

1. **Do not name the disaster in paragraph one.** Cut the guessable-keys sentence. Move the graft lecture. Open on the nine minutes as a responsible Tuesday and walk into the room. This is the change that turns a well-written recap into a chapter with a turn.
2. **Spend the nine minutes.** Two call sites, one comment, the generalization instinct. Pay off “what he did not know” without sneering. This is how “I might have done this” happens, and it is how the title stops lying.
3. **Give Sunday its own air.** Dead path is twist one. “Really fixing” is twist two. Nested comments / wrong function is twist three. They cannot share a single unbroken slope of `git show`. Split or break; pull-quote the compiler looking at the wrong function.
4. **Take locators and beat-names off the reading surface.** No **(R5)** in the line of sight. Headings named for this story, not for TEMPLATE.md. Two pull-quotes. Language tags on fences. This is how the HTML stops looking like a lab notebook.
5. **Close on the leftover, not on a lesson list.** `valgrind.patch` *is* At home. Fuse them. Isolate “He has not disabled a Purify workaround. He has disabled the seeding.” Shrink etch/`merge-base` to fund the above.

---

## The single most important thing

**Stop announcing the ending in sentence two, and spend the nine minutes you named the chapter after.**

Everything else — the dead path, the compiler’s wrong vote, the empty grep, the patch that kept the original excuse — will land if the reader has first stood next to Kurt at 16:25, looking at a comment that really does look like a rule, and felt the urge to make the other site match. That is the book. The CVE is the folklore. Right now the folklore is in the doorway, and the book is in the other room.
)
