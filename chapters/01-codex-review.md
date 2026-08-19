# Craft review: “The nine minutes”

## Editorial diagnosis

This is a strong chapter with a genuinely unusual story shape. Its best move is not the famous bad edit; it is the discovery that the bad edit sat inert for four months, followed by a zero-content rename that activated it. That is the chapter’s signature. The current draft contains the reveal, but it partly spends it in advance: the opening gives away the full consequence, the heading “Four months in the wrong place” states the twist before the prose can deliver it, and “Because he put the file in the wrong place” names it in the very next sentence.

The other structural issue is competition among endings. The chapter reaches a clean narrative conclusion with the 2008 repair and the empty CVE searches, then adds the reused release stanza, the backfilled stable tag, the hollow branch, the quilt afterlife, and the at-home lesson. All are interesting, but together they make the last third feel like three codas. The reconstruction material belongs in the book, but it should be shorter or tied more explicitly to the opening’s warning about how this repository lies.

The tone is generally excellent: technically confident, sympathetic to the maintainer, and willing to say what the narrator thinks. The paragraph about what the compiler caught is the model for the rest of the chapter. It explains the code, advances the plot, and lets the irony emerge from the evidence rather than from a verdict on the person.

## Top five changes, ranked by impact

1. **Make the September rename the true turn.** Let the May diff appear to be the disaster, then reveal that it did nothing. Remove the spoiler from the heading and give “The bug is checked in and inert” its own line. After a beat of whitespace, show the rename. The reader should realize what `{rand => crypto/rand}` means a fraction before the narrator says, “That is the commit that arms it.”

2. **Replace the outcome-summary opening with the concrete nine-minute sequence.** The existing first paragraph tells us the culprit, mechanism, duration, and consequence before we have anything to interpret. Begin with 16:25, 16:34, the innocuous intention, and the six lines. Withhold “every cryptographic key … guessable” until the mechanism has been shown. This will also make the title do narrative work rather than merely label a known disaster.

3. **Move or compress the repository-provenance detour.** The `git log --reverse` / `--first-parent` material delays “The room” just when the cold open should be accelerating. Keep two sentences at most near the start—enough to establish why the narrator is in Debian’s packaging history—and move the graft/ancestry lesson into “The reconstruction,” where misleading history is the actual subject. This would also give that late section a deliberate callback instead of the feel of a second mini-chapter.

4. **Turn “The blast radius” into a scene-sized consequence, not a list.** Twenty months, 32,768 possibilities, and SSH/SSL/OpenVPN arrive in four sentences. Spend 80–120 more words making the attack legible at human scale: the key still looks like a key; the cryptography is not cracked; the attacker generates the same tiny catalog and performs a lookup. Then land “You did not break the key. You enumerated it.” as a standalone line.

5. **Consolidate the three codas and end on one habit.** The release-stanza disguise, reconstructed stable tag, quilt survivor, and two at-home search lessons currently jostle for last-word status. Keep the tag reconstruction as a brief aftershock, trim the release-stanza paragraph if necessary, and make the final movement run cleanly from the surviving `valgrind.patch` to the narrator’s own search habit. Preserve “They wrote down the ticket number, not the crime”; it is the strongest closing sentence in the draft.

## Structure and pacing

The chapter has two turns:

- the apparent turn: the first `MD_Update` is the seed path, not another noisy output read;
- the deeper turn: the dangerous file was at a dead path until a later pure rename.

That double turn is more interesting than a conventional “small edit, huge disaster” story. Build the pacing around it. The current `## The turn` heading announces a template beat, then the next heading gives away the superior surprise. I would merge “The turn” and “Four months in the wrong place” into one continuous movement, or use a neutral heading such as `## Two calls` and no heading at all before the dead-path reveal.

The reveal sequence should look roughly like this:

1. Show the two calls and explain their different jobs.
2. Name the apparent consequence: “He has disabled the seeding.”
3. Let the housekeeping changelog lower the reader’s guard.
4. Pivot: “Except that, for four months, none of this changes a single key.”
5. Show `rand/md_rand.c` versus `crypto/rand/md_rand.c`.
6. Isolate: “The bug is checked in and inert.”
7. Show the zero-line rename and let the reader infer activation.

“Nobody in the room knows this” is useful empathy, but it currently arrives before the draft reveals that there is not yet anything to know operationally. Change it to something like “Nothing in the commit looks like an emergency. It closes a bug and disappears into an already-open changelog stanza.” Save the room’s ignorance of the actual disaster for the September activation.

The pace is best from “Valgrind, of course, is still noisy” through “it was looking at the wrong function.” Do not interrupt that run. By contrast, the opening archaeology takes sixteen lines before Kurt appears. That is the principal drag.

The blast radius is rushed. The reconstruction is comparatively overdeveloped: it receives two commands, two explanatory paragraphs, and a quilt epilogue after the central incident has resolved. I would cut roughly 100–150 words from the opening provenance and reconstruction, then reinvest that space in the room and blast radius.

The paragraph doing the most work is:

> “The `/* */` wrapper he'd put around the *second* call sat inside a line that already had a `/* purify complains */` comment … The build break was the last automated check between Kurt and the disaster, and it was looking at the wrong function.”

It carries mechanism, causality, dramatic irony, and restraint at once. The reader sees the check fire and still miss the danger. Preserve this nearly intact; consider setting the final sentence as its own paragraph.

The paragraph pulling its weight least is the one beginning:

> “1998. Ralf Engelschall, upstream. That is a lie of a useful kind …”

It is good material, but here it asks the reader to learn grafting, ancestry, `svn-inject`, overlays, and `--first-parent` before the human problem begins. Its real payoff is the later warning that a repository can be a reconstruction. Move most of it there. Near the opening, “This repository splices upstream history to Debian’s packaging history; I follow the packaging side” is enough.

## Prose: sentence-level edits

These rewrites preserve the stated facts while putting the emphasis closer to the end of each sentence.

> “Between them, `git` records the moment a maintainer quieted a warning and, without knowing it, made every cryptographic key his distribution would generate for the next two years guessable by anyone who cared to try.”

This is overloaded and cashes out the story too soon. Suggested rewrite: “Nine minutes separate a file import from a six-line attempt to quiet Valgrind. Both commits look responsible.” Put the consequence later.

> “That is a lie of a useful kind — the packaging history does not start in 1998, it is *grafted onto* the upstream history, and the two lines share no common ancestor.”

Suggested rewrite: “That 1998 beginning is useful, but false for the history I want. Debian’s packaging line was grafted onto upstream; the two have no common ancestor.”

> “The errors were not in his code. They were in a design choice OpenSSL had made deliberately: to squeeze every unpredictable scrap it could into the entropy pool, it hashed in a buffer *before* filling it, uninitialized bytes and all.”

The first sentence risks sounding like exoneration by narrator rather than reconstruction. Suggested rewrite: “The reports pointed into upstream code, at a deliberate OpenSSL choice: hash a buffer before filling it, uninitialized bytes and all, to capture every available scrap of unpredictability.”

> “Garbage in, but garbage is entropy, and the whole point of a random number generator is that more unpredictability is better.”

“Garbage in” evokes “garbage out,” which momentarily tells the reader the design itself is broken. Suggested rewrite: “Here the garbage was useful: even bytes nobody had initialized could add unpredictability to the pool.”

> “One spot, and one spot only, is wrapped in `#ifndef PURIFY` — a switch you flip when you're running the memory checker, so the deliberately-dirty read disappears and Purify stops complaining.”

Suggested rewrite: “Only one read sits behind `#ifndef PURIFY`. Turn on the checker, and that deliberately dirty read disappears.”

> “Every call that says ‘here is some entropy — the process ID, the time, the contents of `/dev/urandom`’ arrives through `ssleay_rand_add` and gets hashed in by exactly the `MD_Update(&m,buf,j)` he just wrapped in `/* */`.”

Suggested rewrite: “The process ID, the time, `/dev/urandom`: callers hand all of it to `ssleay_rand_add`. The first `MD_Update(&m,buf,j)` is the line that mixes it in—and that is the line now inside `/* */`.”

> “And then the best part, the part that is pure `git` and that no CVE writeup will tell you: for four months, it doesn't matter. Because he put the file in the wrong place.”

The narrator announces the quality of the reveal and then explains it immediately. Suggested rewrite: “Except that for four months, none of this changes a single key.” Stop the paragraph there. Let the two paths disclose why.

> “**(R8)** ‘Really fixing.’ A pure rename, zero content change, moving the file onto the path the compiler reads. *That* is the commit that arms it — six months of released Debian and Ubuntu will descend from this Sunday afternoon, not from May.”

Suggested rewrite: “**(R8)** ‘Really fixing.’ Zero lines changed. The file merely moves onto the path the compiler reads. *That* is the commit that arms it.” Move the release-duration sentence to the blast radius so this moment ends on the click.

> “It is the confession of a man who now understands exactly which line he commented out.”

“Confession” adds guilt and claims interior knowledge; the commit subject already carries the realization. Suggested rewrite: “The subject now names the missed mechanism exactly.”

> “And it went out the door wearing someone else's clothes.”

The metaphor competes with the later fire/Tuesday metaphor. Suggested rewrite: “Even the release stanza makes the fix look smaller than it is.”

> “The lesson Debian took from the worst key disaster of the decade was ‘use quilt,’ and they named the survivor after the thing that started it.”

This is memorable but too glib about institutional intent, and it edges toward sneering. Suggested rewrite: “What the repository preserves is stranger: the harmless half survives as `valgrind.patch`, still carrying the name of the tool that started the chain.”

## Formatting and readability for static HTML

- Hide the answer in the body, not the navigation. `## Four months in the wrong place` is a spoiler in the page outline and any generated table of contents. Use a neutral heading (`## The path`, if one is needed) or remove the heading.

- Use fenced-code language labels consistently: `console` for commands and output, `diff` for hunks. Static HTML readers will parse the plus/minus lines much faster with restrained syntax coloring.

- The first log command and the `ls-tree` command are wider than a typical reading column. Ensure `<pre>` blocks scroll horizontally rather than wrapping; a wrapped path comparison destroys the visual evidence. If the renderer permits it, place the two queried paths on separate shell-continuation lines without changing the command’s substance.

- The bold receipt markers (`**(R5)**`) repeatedly become the darkest object after each code block. Render them as small superscript links or muted marginal references. The evidence should remain reachable without competing with “Six lines,” “2009,” and other dramatic entries.

- Use whitespace instead of more emphasis at the key beats. Strong candidates for one-line paragraphs are “He has disabled the seeding,” “The bug is checked in and inert,” “That is the commit that arms it,” and “You did not break the key. You enumerated it.” Do not isolate all four; choose the dead-path line and one of the latter two.

- A pull quote is justified once, beside the rename: **“The bug is checked in and inert.”** It captures the chapter’s distinctive contribution. Avoid pulling the familiar catastrophe language from the opening.

- The code blocks are well chosen and short. Keep all central diffs. If the opening provenance is moved, its long one-line log output can go with it; the narrative will then reach the human scene with only one early visual interruption.

- The headings `The room`, `The turn`, and `The blast radius` expose the book’s beat sheet. Since the template explicitly says these are beats rather than sections, replace at least `The turn` and `The blast radius` with story-specific language or remove them. “The room” works because it promises viewpoint, not plot mechanics.

## Expansion opportunities

There is room to add, but the gain should come from comprehension and felt stakes, not more repository findings.

1. **After the original `#ifndef PURIFY` snippet, add the maintainer’s plausible reading experience.** Two or three sentences could describe what the page presents: the tool’s name is attached to a suspicious read, the test output points to the same file, and the existing conditional looks like precedent. End with a line such as: “The comment looks less like a warning than permission.” This deepens “I might have done this” without inventing dialogue.

2. **Before explaining the two `MD_Update` calls, add a compact input/output analogy.** For example: one call pours new ingredients into the pool; the other handles bytes on the way out. They have the same spelling but opposite narrative roles. This would help a non-C reader understand why copying the exception from one call to the other is the whole mistake.

3. **At the dead-path reveal, add one sentence that makes overlays spatial.** Something like: “The overlay is a stencil laid over the upstream tree; cut the hole four directories away, and the original code shows through untouched.” Then return immediately to the two paths. This makes a packaging-specific mechanism visible without adding another technical detour.

4. **Expand the first blast-radius paragraph with the attacker’s workflow.** Use only the mechanism already in the draft: a key still appears cryptographic and enormous, but it belongs to a catalog of at most 32,768 possibilities; the attacker prepares the catalog and matches the observed key. Then isolate “You did not break the key. You enumerated it.” This is the place where another 80 words will earn the most.

## Open and close

The cold open has energy, but it is a trailer rather than a scene: it summarizes the entire causal chain before the reader has seen the two commits. A stronger entry would show the clock and the benign surface, withholding the catastrophe:

> At 16:25 on a Tuesday afternoon, Kurt Roeckx imports one file into Debian’s OpenSSL package. At 16:34, he adds six lines to it. The message says he is stopping Valgrind errors in unrelated code and closing a bug. I would have read the comment before the call beneath it, and the comment would have reassured me. Nine minutes. That is all the distance `git` leaves between precedent and generalization.

This version enters on a clock, preserves sympathy, establishes the narrator, and leaves the reader a question: what did the apparently responsible generalization do? The clone/provenance material can follow in compressed form, or the chapter can go directly to “Here is what Kurt knew.”

The “At home” ending earns its keep because it converts the incident into two transferable habits: search for checker-related exceptions, and search mechanisms rather than incident names. The problem is that both lessons are packed into one paragraph after the chapter has already offered several endings. Give the paragraph a cleaner ascent and keep its excellent last line. For example:

> In my own repositories, I now search for the names of tools inside exceptions: `valgrind`, `purify`, `asan`, `coverity`. Then I use `git log -S` to see whether a narrow accommodation became a rule somewhere else. I search for the disabled read, not the incident name. The people who did it were closing a bug. They wrote down the ticket number, not the crime.

This keeps the useful command, restores the first-person narrator, and drops “loaded gun,” which is vivid but more accusatory than the rest of the chapter. The final sentence should remain the final sentence.

## Title

“The nine minutes” is good if the opening is revised to make those nine minutes the span in which a narrow exception becomes a general rule. It is understated, human-scaled, and does not spoil the dead-path turn. Keep it under that condition.

If the chapter is recentered more strongly on the activation rather than the May reasoning, the best alternatives are:

- **“Really fixing”** — the strongest alternative; it uses the commit’s own innocent phrase and gains a second meaning at the rename.
- **“Zero content change”** — emphasizes the chapter’s most surprising archaeological finding without disclosing the path error.
- **“The wrong file”** — clear and memorable, but it spoils more of the reveal than either of the above.

## The single most important change

Hide the four-month dead-path twist until the reader has concluded that the May edit immediately caused the disaster, then let the zero-content September rename overturn that conclusion. That is the chapter only this repository can tell, and it should land as the true turn.
