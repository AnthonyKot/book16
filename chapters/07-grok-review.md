# Craft review: “The current maintainer”

Chapter 07, Vim — Bram Moolenaar’s last weekend and the succession. 1,691 words of body against a
2,200–3,200 band. This is a craft review, not a fact check. Hashes, dates, commands, and quoted
output are locked. I am not touching them.

The bones are the right bones, and they are in the right order. The open withholds the man’s name
and the fact of an ending; the turn sentence is the best sentence in the book so far; the objects
are already the elegy. A teapot at 18:57. Six hours in 2019. A LICENSE sentence that promises an
announcement. A July-13 author date on an August-8 commit. A standing instruction, thirteen years
old, to send one man flowers. Three sentences in this draft are keepers for the series, and two
more will be if the wreaths around them die. I will name them.

The problem is not sneering. The ledger is flat, and the flatness is carrying the grief, until the
narrator keeps certifying that it is carrying the grief. “That is the last thing” lands, and then
the paragraph becomes a table of contents. The timestamp pair is the unique archaeology — the
thing no obituary will tell you — and it is introduced as “the object I find most affecting.” A
real man died in 2023. His successors already wrote the dedication. You do not need to write the
second one.

This is also not a chapter 03 situation. 1,691 is not lean-and-right. The weekend is five commits
with one perfect Saturday in them. The bridge is one paragraph of feeling about two dates. The
band is permission to sit in the rooms. It is not permission to eulogize.

---

## 1. Structure and pacing

### The order of beats is right. Do not reshuffle.

Weekend → one name → constitution → bridge → announcement → at home.

Chronology *is* the grief, and it is the only honest shape for an elegy told from a ledger. You
cannot feel nine thousand commits as a constitution until you have watched five that did not know
they were last. You cannot feel Christian Brabandt as the name in the 2019 revert until 404
Solution-lines have put him on the other side of a mailbox. You cannot feel a July-13 author date
until you know the work waited in that mailbox for twenty years, and that a revert in 2019 is why
it was still waiting. You cannot feel the LICENSE announcement until the LICENSE has promised one.
Moving the bridge before one-name would make Christian a stranger in a timestamp. Moving the
announcement before the bridge would pay the public farewell before the private object, and the
public farewell is louder; it will eat what it follows, which is already the pacing problem, but
eating what it *precedes* would be worse. Moving the death into the open’s first sentence would
be chapter 01 all over again.

Do not put the dedication in the doorway. Do not put the timestamp pair in the doorway. Do not
open on the shortlog (chapters 03 and 04). Do not open on the LICENSE sentence (that is the
title’s payment). Keep the order.

What the order is not doing is *volume*. After the turn, One name is a shortlog that informs. The
bridge is the emotional center the chapter needs, and it is currently a caption. The announcement
is three perfect diffs plus a eulogy of the narrator’s own. The leftover is being out-shouted by
the section that follows it. That is a pacing problem, not an order problem. Starve the
announcement of sermons. Feed the two dates. Do not swap them to “save” the bridge; an elegy that
jumps backward after Farewell to Bram in order to say *actually the real object* is a narrator
trick. Time is the grief. Stay in it. Fix the volume.

### The open is the right object. It does the assignment.

Friday, 18:57, error numbers unused, `err_teapot()`. Consecutive-open is a clock after chapter
06’s absence, which is clean, and it is not chapter 01’s clock: that one named the disaster in
sentence two. This one names a teapot. TEMPLATE.md: drop the reader into one concrete moment,
ideally the thing that will turn out to matter, shown before we know it matters. You did. The
maintainer is not named. The weekend is not billed as last. The format string on the first
command does not even print an author. We get E418, then an alphabetization that will not stand,
then midnight, then:

> Saturday passes without a commit.

Protect that sentence. It is a keeper. It should have whitespace on both sides. It does not, quite
— it shares a paragraph with Sunday 02:38 — but it is doing the thing the rest of the open is
trying to do: the ledger, flat. Then the stranger’s typo, the credit, the counter, 9.0.1677.

This is the room. He is not dying on the page. He is closing a gap in error numbering, then
sorting a help list, then renaming buffers so a warning can be read. The last act is the social
contract the next section will teach, shown once, unlabeled: someone else’s patch, Bram commits
it, credits the author, ticks `src/version.c`. Do not label it here. One name will name it. If you
add “this is how Vim always worked” in the open, Sunday becomes a lecture and the turn has nothing
left to convert.

The knowing reader, who has 3 August 2023 in their head and a July date in sentence one, is
already waiting. That is tolerable if the weekend is inhabited enough that even they are in the
room, not in the lobby. Right now the five commits are a list with one perfect Saturday. Sit in
Friday night a hair longer — the numbers were free, the help list was unalphabetical, that will
not stand — without adding “how like him” or “he had no idea.” The not-knowing is the point, and
it has to stay implicit or the open announces the end by protesting that it isn’t one.

Cut, from the open, the magazine ranking and the hanging seven-job fragment (see Prose). Keep the
teapot. Do not apologize for the joke because he died. Solemnizing Friday night is the other
sentimentality. The joke is what he did. Flattening it would be a wreath.

### The ‘That is the last thing’ turn lands. Then the paragraph spends it.

The prompt asks this plainly, so I will be exact.

The withheld name pays off in the first sentence that contains it:

> That is the last thing Bram Moolenaar ever did to Vim.

That is the turn. The reader who did not know has been with “the maintainer” for a teapot and a
typo; the full name arrives in the sentence that says last. The reader who did know still has to
watch the sentence happen to the weekend they just sat in. Either way it is a beat they feel
before the rest of the paragraph names the rest. Do not invert it. Do not “build tension and
mic-drop the death date.” The sentence is the landing. Protect it. Give it whitespace after.

Then you write the chapter’s table of contents:

> He died twenty-five days later, on 3 August 2023 — the date is in the repository, and we will
> come to how it got there. Nothing in those final five commits knows it is an ending. A teapot
> joke, an alphabetization, a valgrind timeout, a buffer rename, a stranger's typo: the thirty-year
> authorship of one of the world's most-used programs closes on a weekend indistinguishable from a
> thousand before it.
>
> ~ The last commit is never a speech.
>
> This chapter is about what a succession looks like when the ledger has only ever held one name.

Four jobs, all of them the turn, restated.

**The date and the trailer.** “The date is in the repository, and we will come to how it got
there” is a spoiler of the dedication commit, and it is the narrator as source. The chapter’s
method, which you are rightly proud of, is that even the death date comes from `version9.txt`.
Saying so in the doorway, *and* giving the date, *and* promising we will come to how, means the
help file can only confirm. He died: the turn is allowed one clause of that, because “last thing”
without death can read as retirement, and being coy about a real death is the other taste failure.
The calendar math (“twenty-five days later”), the date itself, and “we will come to how” are the
narrator with a countdown. Let the help file date it. The turn names the death; the repo names the
day.

**The re-list.** We just watched the five commits. Listing them again, with “thirty-year
authorship” and “one of the world’s most-used programs” (the second time in a page, and thirty
years is scale this chapter has not yet earned from the tree — the git starts in 2004; One name
will count 9,166), is the open performed as a eulogy. “Indistinguishable from a thousand before
it” is the actual line, and it is almost a keeper, and it is currently the moral of a restatement.
If it survives, it survives as one sentence after the turn, not as the cadence of a list we
already lived.

**The pull-quote.** “The last commit is never a speech” is the chapter’s law, and it is good, and
in the doorway it is a proverb the narrator uses to recover from the punch. Pull-quotes in this
book have been blast radii (every object name since 01:10; a NVIDIA README that cannot leave).
This one is a moral. After the paragraph that already said it, it is a restatement with whitespace
privileges. Move it, or cut it here. If it belongs anywhere, it belongs after we have watched the
succession also refuse to be a speech — the end of the bridge, or not at all, because the objects
will have said it.

**The thesis sentence.** “This chapter is about…” is “This is the story of the night” (chapter
05) and “This chapter is that ritual performed on six projects” (chapter 06). TEMPLATE.md’s only
negative instruction on the open is “Not ‘This is the story of…’.” You wrote the cousin. The
heading **One name** is already the thesis. Cut the sentence.

**Move:** keep “That is the last thing Bram Moolenaar ever did to Vim.” One clause: he died. Stop.
Maybe “Nothing in those commits knows it.” Then One name, without a contract. The dedication will
date the death. The shortlog will earn the scale. The timestamp pair will earn “never a speech.”
You do not have to.

### One name is the right room. It is a caption of a shortlog.

Decade windows, not the top row, the *only* row. That is a reveal the reader feels a beat before
you gloss it, because the command output has one name. Protect “Not the top row. The *only* row.”
Then 9,166 / 9,166, then the mailbox: you mail a patch; Bram reviews it, commits it as himself,
writes your name into the body. Then 404 commits whose Solution-line credits Christian. Then:

> Hold on to that name.

Chapter 01 was dinged for “keep that in your pocket” in a doorway. Here the payoff is the rest of
the chapter, so it is more earned, and it is still the teacher’s hand on the reader’s wrist. “Four
hundred and four. The name in the parentheses is Christian Brabandt.” Then we meet him at 15:45 on
27 November 2019 as an author. The reader will hold the name. You do not have to tell them to.

> The author field says Bram; the *paragraph* says everyone.

Keeper. Isolate it. Then the bus-factor sentence, which is true, and then:

> Both things were true, and the difference between them is this whole story.

Wrist. Cut “this whole story.” The difference is the next three sections. They can be the
difference without a caption.

What is missing is one Tuesday of the mailbox, because 404 is a number that informs. One
Bram-authored commit whose body credits Christian — Problem/Solution, his name in parentheses,
Bram in the author field — is the social contract as an object, not as a paragraph about a social
contract. Do not add a 405th. Do not add a biography of Christian. He is alive. The tree showing
him in the parentheses for 404 patches is the respect you owe him. A character reference from the
narrator (“the worthy successor,” “the man who had been waiting”) is a different taste problem,
and you mostly have not committed it. Do not start.

The spelled-out “Nine thousand one hundred and sixty-six for nine thousand one hundred and
sixty-six” is the one moment of biblical census. The shortlog above it is digits. Pick digits, or
pick the spelled-out pair and let it be the one grandeur; do not do both in six lines. I would
keep the spelled-out pair if the wreaths elsewhere die. It can bear that weight. It cannot bear
that weight *and* “thirty-year authorship” *and* “monument.”

Small clash: “by its own dedication, more than a decade into its life” uses *dedication* for the
2004 import’s self-account, and the chapter’s dedication is `version9.txt`. Say “by its own
account” or “already a decade old the day this git starts.” Save *dedication* for August 13.

### The constitution is the hardest-working section. Do not let the first sentence name the verdict.

> The one-name era cracks, once, in 2019, and the crack is instructive because of how fast it
> closes.

“Instructive because” is chapter 04’s “worth watching because.” The heading has already said
constitution. Then six hours, then the three-line `Merge pull request` log, then:

> The gap *is* the constitution — never written down, enforced by exactly one revert, and it
> expired with its author.

That is a keeper, and it is the landing, and it should not have been previewed as a crack that
closes. Show 15:45, Christian, nine lines of CI. Show 21:57, the revert. “Six hours.” Then the
three-line log, oldest first, 2019, 2019, 2023-08-07. The reader who can count will feel three and
a half years. *Then* the gap is the constitution. Once. “Expired with its author” is slightly the
gavel, and it is earned by the third line being four days after the death, and it will be cleaner
if the turn has already said he died without having already moralized the five commits.

> Christian had the *permissions* to merge a PR. Permissions were not the constitution.

Keep that. It is not a slap. The next sentences already say the revert is not angry and does not
editorialize. Protect the not-angry. Cut, or starve:

> It is a boundary, drawn the way Bram drew everything: quietly, in the tree itself.

“The way Bram drew everything” is intimacy with the dead. You have a teapot, a sorted help file,
and a revert. That is not everything. The revert is quiet because the revert is quiet. You do not
have to make a style of the man.

Then the LICENSE, January 2020, the least romantic reason: GitHub’s crawler does not run `:help
uganda`. That is the room — bureaucratic, almost funny, the opposite of a clause about mortality.
The quoted sentence is the title’s payment. Then:

> Read cold, it is boilerplate. Read from 2023, it is a clause about mortality, filed under
> licensing, waiting.

This is the first taste failure that is also a structure failure. CONTEXT.md: reconstruct what
the actor knew when they typed. In January 2020 he is copying a license so a website can see it.
He is not filing a clause about mortality. The reader in 2026 will feel the clause. You naming
“mortality” is hindsight-flattering *and* the narrator crying so the reader doesn’t have to. “Read
cold, it is boilerplate” is enough. Stop. The 2023 reading is the rest of the chapter. If you have
to keep a second sentence, keep “If this changes it will be announced,” which is already in the
quote, not “mortality… waiting,” which is a short story sitting on a LICENSE.

The LICENSE beat also does the thing chapter 05 did with Greaves: it tells us how to read the
object before we have been allowed to. The quote is the photograph. “Boilerplate” can follow.
“Mortality” cannot.

### Headings: mostly labels, one spoiler, one echo

`One name`, `The constitution`, `The bridge`, `The announcement`, `At home`.

`One name` is the shortlog. `At home` is the book’s convention. `The constitution` echoes chapter
05’s “The constitution didn’t notice”; here it is a different object (a revert, a LICENSE), so it
can stay if the prose does not lean on the echo. `The announcement` is what the LICENSE promised,
so it is a label, not a verdict — barely.

`The bridge` names the metaphor before we see two dates on a housekeeping patch. The reader should
meet `author 2023-07-13` / `committer 2023-08-08` as a timestamp pair, then feel the span. The
heading tells them it is a bridge. **Patch 9.0.1679**, or no heading, or the two dates. I would
take the two dates. The metaphor can happen to them.

### First person is present, and it is the wrong I

The engineer who runs `blame` daily should appear at the shortlog (already almost there: “Run the
org-chart question”), at the timestamp pair (author date versus committer date is this narrator’s
actual tool), and at At home. That is three pairs of hands. Then get out of the way.

What you have instead:

> Now the object I find most affecting in this repository

> What the successors did next is, to me, the most Vim-shaped grief imaginable

> We watched that full time

The teacher’s *I*, the eulogist’s *I*, the congregation’s *we*. Opinions are allowed. “I find
most affecting” is not an opinion about an object; it is a stage direction for the reader’s
tear ducts. “To me” before “grief imaginable” is the same direction with a coinage. “We watched”
is a squeeze. Cut all three. If the first person wants a feeling, it can stand next to the
timestamps *after* they have landed, one clause, or not at all. The timestamps do not need a
sponsor.

---

## 2. Prose

Keepers, already, for the series. Do not sand them.

> Saturday passes without a commit.

> That is the last thing Bram Moolenaar ever did to Vim.

> The author field says Bram; the *paragraph* says everyone.

And two that are almost keepers, and will be if the wreaths around them die:

> The gap *is* the constitution — never written down, enforced by exactly one revert, and it
> expired with its author.

> One human becomes an org URL.

A sixth, which is the title as a human instruction, and which is already his joke, not yours:

> For thirteen years this file had carried a standing instruction to send one man flowers.

Do not embroider that last one. The README diff is the photograph. “Now the flowers go to a
mailing list” is the naming, once. Stop.

### The clunkiest sentence

> The maintainer of one of the world's most-used programs, on a Friday night, implementing a 1998
> April Fools' RFC in his text editor, because the error number was free and the joke was right
> there.

It is a fragment. It has seven jobs: fame-rank, Friday night, RFC year, April Fools’, text editor,
error number free, joke right there. “One of the world’s most-used programs” is magazine (chapter
06 flagged “the most scrutinized codebase in finance”), and you will say it again in the turn
paragraph. `E418: I'm a teapot` has already done the joke. The RFC gloss is a teacher in the
doorway; the people who know RFC 2324 already know, and the people who don’t still have a teapot.

Rewrite, after the function names, as a sentence with a verb:

> It is Friday night. E418 and E503 were unused, so he put the teapot in, because the numbers were
> free.

Or, if you want the joke’s extra line to carry the tone:

> `E418: I'm a teapot`, and — if you ask it nicely — `E503: Coffee is currently not available`.
> The numbers were free.

Then the alphabetization, which is the better second beat anyway: the joke is not allowed to leave
the help file unsorted. That is the man, without a ranking.

Runner-up, and the one that is clunk *because* it is a eulogy:

> They kept the machine, because the machine was the man's actual monument, and because a
> one-maintainer project survives exactly to the degree that its rituals turn out to be detachable
> from its maintainer.

Two because-clauses. The first is a funeral oration. The second is the thesis, and it is
interesting, and it is currently riding in the hearse. Rewrite, thesis only:

> They kept the patch counter, the subject grammar, the Problem/Solution form. A one-maintainer
> project survives to the degree those rituals come off the maintainer.

Then stop. “Monument” cannot be saved. See Taste.

Third, the doorway’s census of itself:

> This chapter is about what a succession looks like when the ledger has only ever held one name.

Rewrite: delete.

### The paragraph doing the most work

The three-line `Merge pull request` log, through “expired with its author.”

It has to (a) make six hours into a policy, (b) make three and a half years visible as silence,
(c) put Christian on both sides of the forbidden grammar, (d) arrive four days after the death
without a new eulogy, (e) name the constitution once. It does. That is why it is the paragraph to
build the middle of the chapter from, and why “the crack is instructive” in front of it, and “the
way Bram drew everything” beside it, are the sentences to cut. Give the command output air. Let
“Six hours.” be its own line. Then the log. Then the gap. Do not add a sixth job (mortality, soul,
monument) onto this paragraph; it is already at capacity, and it is at capacity on evidence.

Honorable mention: the open from the teapot through 9.0.1677, which has to not announce an ending
while being the ending. Saturday is doing the work. The hanging fragment and the ranking are the
drag. The Sunday typo is the right last object — small, someone else’s, credited. Do not swap it
for the crypt rename because the crypt rename is “authored” last and sounds more like a last
act. The last thing he *did* is the queue. That is precise, and it is kinder, and it is true to
the social contract. Keep the committer-last as the turn. At home can teach author versus
committer without the open having to.

### The paragraph pulling its weight least

The turn-restatement: death date, trailer, five-commit list, thirty-year close, pull-quote,
“This chapter is about.” It does not belong to Friday night, it issues the elegy contract, it
spends the dedication, and it costs the turn its silence.

Second-weakest: “Now the object I find most affecting…” through “not a manifesto.” See Bridge.
The dates are load-bearing. The sponsor-sentence is not.

Third: At home’s opening, “Two habits from this dig, and they point in opposite directions of
the clock.” That is a chalkboard. See Close.

### Other prose notes, shorter

- `[R2]` through `[R13]` on the reading surface: same note as 01–06. Quiet them. The trailing
  list is the right place. A reader must be able to see the teapot without holding locators.
- “one of the world’s most-used programs”: twice in the open. Cut both. Scale is 9,166, or the
  fact that the help file is being alphabetized at 23:19. You do not need to rank Vim.
- Italics as elbow: *only* row, *paragraph*, *permissions*, *is* the constitution. You have
  earned about two. *Only* and *paragraph* are the right two. *Permissions* can stay if the
  sentence around it stays dry. The italic on *is* in “the gap *is* the constitution” is the
  narrator squeezing a verb that is already the landing.
- “the place Vim actually keeps its soul”: soul is the wreath-word. The help system is where
  `:help uganda` lived and where the dedication goes. Say the help system, or say “where Vim
  keeps the things it means.” Do not say soul.
- “While still working full-time on Vim.” The successors wrote that. Quoting it is correct. The
  next sentence, “We watched that full time: it looked like a teapot error and a sorted help file
  at midnight,” is you gilding their gilding. They already wrote the eulogy. A callback to the
  teapot can be a clause, or nothing. I would cut “We watched that full time.” The reader watched
  it. They do not need to be told they did.
- “When Christian finally commits it himself”: *finally* editorialize a five-day gap. He commits
  it. Five days after. The adverb is a small novel about reluctance. You do not have his interior,
  and you should not want it.
- Tense: present-in-the-weekend is right (files, works, processes, Saturday passes). Past for the
  death. Present for the tree we still have (the LICENSE keeps, the counter did not reset). After
  the turn-paragraph is stripped, do not slide the weekend into “would be his last.” Hindsight
  tense is how the open announces.
- “a crowd on the other side of a mailbox, with one man deciding, one man typing, one man ticking
  the counter”: the triple is slightly oratorical and mostly earned. Keep two. Three is the
  cadence of a eulogy.
- “patch 9.0.1678 was followed by patch 9.0.1679, authored before the world it landed in”: almost
  a keeper as a last line, and 1678 is currently a stranger. It appears as a PR title in the
  three-line log (`import-9.0.1678`) and then as a number-rhyme in the close. If the close hangs
  on 1678 then 1679, one sentence earlier has to let 1678 be a patch (k-takata’s import, Christian
  merging it — the forbidden grammar, first use in three and a half years). Or close on 1679 only,
  with the July 13 date, and let 1678 stay in the log. Do not make the last sentence an insider
  rhyme.
- Three sections want to be “the first act of the new era”: the August 7 merge (constitution
  expires), 9.0.1679 (unfinished business), August 13 Farewell (the promised announcement). Pick.
  The merge is the constitutional first act. 1679 is the emotional one. Farewell is the named one.
  The draft gives “first act of the new era is not a manifesto” to 1679, which is the right
  *emotional* assignment. Then announcement says they changed almost nothing, which is the same
  landing a second time. Let 1679 be unfinished business, not “first act,” if August 7 has already
  been the grammar returning. Or let August 7 be the grammar, 1679 be the work, Farewell be the
  promise, and do not crown any of them.

---

## 3. The bridge

The prompt asks whether the authored-July-13 / committed-August-8 pair is the emotional center it
should be, so I will not bury it.

**The object is the center. The section is not, yet.**

The unique archaeology of this chapter — the thing the obituaries do not have — is not the
teapot, and it is not Farewell to Bram. It is these two lines:

```console
author    Christian Brabandt 2023-07-13T11:45:54+02:00
committer Christian Brabandt 2023-08-08T20:39:55+02:00
```

Authored while Bram is alive, five days past the teapot weekend. Committed five days after the
death. Leftover test files whose names trace to the crypt rename in Bram’s last authored patch.
The work waited where all his work had waited. When it lands, the original date is still on it.

That is the leftover. That is this chapter’s `valgrind.patch`, this chapter’s four-line diff at
01:10. It should have whitespace on both sides of the command, a short room on each date, and a
stop. What it has is a drumroll, a restatement of the dates, a narrator’s assurance that the first
act is not a manifesto, and then a louder section.

> Now the object I find most affecting in this repository, and it is a timestamp pair on a
> housekeeping patch.

“My favorite commit, because of what it says it is” (chapter 05). “My favorite subject line,
because it is a death notice” (chapter 06). Same wind-up, worse stakes, because the object is a
real death’s queue. Cut the sentence. Start on the command. “When 9.0.1679 lands, look at its two
dates.” Or just the `git show -s --format='author…'` block, with no sponsor.

Then you restate what the command just printed:

> Authored 13 July. Committed 8 August.

The command is the photograph. The two short sentences can be the naming, once, if they are *all*
the naming. They are currently the start of a paragraph that explains the queue, names the crypt
rename again, names 3 August again, names “five days after the death,” and lands:

> the first act of the new era is not a manifesto. It is unfinished business from the old
> maintainer's last week, carried across the gap with its original date still on it.

“Unfinished business… original date still on it” is the almost-keeper. “Not a manifesto” is the
landing you will do again in announcement (“they changed almost nothing”). “Carried across the
gap” is the narrator’s hand on a pair of timestamps that already *are* the gap. “New era” is
slightly a magazine. Rewrite, after the command, as two rooms and a stop:

**July 13.** Bram is alive. Christian is cleaning leftover test files; the names go back to the
crypt rename from the last authored patch. He does what he has done for twenty years: he puts it
in the queue.

**August 8.** He commits it himself. The author date is still July 13.

Stop. Do not say manifesto. Do not say gap. Do not say most affecting. Do not say first act. The
reader who has been through 404 parentheses and a six-hour revert will know why it waited, and
what it means that he is the committer now. If you need one sentence after the two dates, the
almost-keeper, starved:

> Unfinished business from the last week, with its original date still on it.

That is the center. It becomes the center when you stop introducing it as the center, and when
the announcement does not arrive as a second, louder center.

**Do not invent Christian’s grief.** The two dates are as close as you can get. “Finally” is
already too much interior. A sentence about what it cost him to type `git commit` is exploiting a
living person as the scene partner of a dead one. He cleaned up test files and he committed them.
The ledger’s flatness is the respect.

**Volume, not position.** I would not move the bridge after the announcement. Chronology is the
elegy; Farewell on August 13 is the public object; the leftover is allowed to be quieter and
earlier. What you do instead: cut the drumroll; sit in the two dates; and in announcement, do not
re-land “they changed almost nothing” as “the most Vim-shaped grief imaginable.” Announcement’s
job is three diffs and the dedication quote. The grief is the dates. If announcement also moralizes
continuity, the reader is told twice and feels it zero times.

Is it the emotional center it should be? **No, not as written. Yes, as an object.** The fix is
subtraction of sponsor-prose plus a short inhabited July 13, not an adjective upgrade and not a
reshuffle.

---

## 4. Taste

A real person died in 2023. Christian Brabandt is alive and named. Taste is not a tone note. It is
whether the chapter uses a death as material.

### The ledger is the ethical form. Keep using it.

The teapot is not exploiting. It is what Friday night was. Skipping it for solemnity would be
worse: a death-polite chapter that refuses the last joke. The stranger’s typo is not exploiting.
The 2019 revert is not exploiting. The LICENSE diff is not exploiting. The flowers line is his
joke (“comments, patches, flowers and suggestions”), thirteen years in the tree; using *his*
word as the succession image is the right taste. The timestamp pair is not exploiting. The
dedication quote is the successors speaking; quoting it is correct. Naming Christian, 404 times
in parentheses and then as committer, is the respect the tree already paid him. Do not add
Uganda, ICCF, illness, a cause of death, a funeral, neovim, a comparison to other dead
maintainers. None of that is this dig, and most of it would be the other book, the one that
mines a life.

### Lines that would read as exploiting a death

**“a clause about mortality, filed under licensing, waiting.”** Dramatic irony parked on a 2020
housekeeping commit. He was making a license findable on GitHub. You are writing an epitaph on
his paperwork. Cut “mortality.” This is the one I would not argue about.

**“the machine was the man's actual monument.”** You are delivering the funeral oration. The
successors kept a patch counter. That is the fact. Monument is a cathedral word (chapter 06 had
“act of cosmology” and was told to put it down). A living project is not a tomb, and calling it
one slightly kills it for the sake of a cadence. Cut monument.

**“the place Vim actually keeps its soul.”** Same family, smaller. Cut soul.

**“the most Vim-shaped grief imaginable.”** See below.

**“the flowers found a new address”** (At home). The announcement already moved the flowers, in
his words, in a diff. Repeating flowers as your last-paragraph bouquet is the narrator laying a
wreath the README did not ask for. Keep the diff. Cut the reprise.

**“thirty-year authorship of one of the world's most-used programs closes on a weekend…”** Scale
plus closing-cadence, in the paragraph that has just named the death. It is a magazine obituary
sentence. The five commits were the obituary. You do not also compose one.

**Calendar math as pathos.** “twenty-five days later,” “five days past his teapot weekend,” “five
days after the death,” “ten days after his death,” “four days after his death.” Some of these are
orientation and are fine. The stack is a countdown. If the turn does not already do twenty-five,
the rest can be dates, which the commands already print.

What is *not* exploiting, and should not be sanded out of fear: the teapot; Saturday; the typo;
“One human becomes an org URL”; the flowers *diff*; “while still working full-time on Vim” as a
quote; the July 13 date left on the August 8 commit. Dryness is the ethics. Those objects are dry.

### Lines where the narrator cries so the reader doesn’t have to

> Now the object I find most affecting in this repository

Stage direction. Cut.

> What the successors did next is, to me, the most Vim-shaped grief imaginable: they changed
> almost nothing.

This is the one. It names the emotion (*grief*), coins a shape for it (*Vim-shaped*), attributes
the coining to the narrator’s sensibility (*to me*, *imaginable*), and then says the actual
sentence (“they changed almost nothing”), which was doing the work. The reader who has seen the
counter not reset, the Problem/Solution form survive, and a July date on an August commit is
already in the grief. Labeling it is how you take it back. Cut the sponsor. Keep, if you keep
anything, “They changed almost nothing.” Then the counter, the grammar, `Signed-off-by:` as the
only new ritual. Stop before monument. Stop before detachable-rituals if At home is going to be
that thought, or keep detachable-rituals *instead of* At home restating it, once.

> We watched that full time: it looked like a teapot error and a sorted help file at midnight.

Shoulder-squeeze. The dedication said full-time. We did watch it. Cut “We watched that full time.”
A clause of teapot-and-help-file can stay if it is dry: the full time looked like E418 and a
sorted list. Even that is close. I would cut the whole sentence. The open already happened.

> ~ The last commit is never a speech.

Not tears, but a proverb in the place where silence should be. The narrator recovering. See
Structure.

**“drawn the way Bram drew everything: quietly.”** Affectionate omniscience. You did not know him.
The revert is quiet. That is all you can say, and it is enough.

### Living people

Christian Brabandt is not a symbol and not a widow. The draft mostly knows this. Risks that are
still on the page: *finally*; “Hold on to that name” as if he were a plot point (he is a
maintainer); any future sentence that praises him as the right successor. The 404, the 2019
evening, the July 13 patch, the Farewell PR, the unreset counter: that is the portrait. Do not
improve it. Do not psychologize the 2019 merge as overreach; you already said the revert was not
angry. Keep it not angry.

The “crowd, six names deep in the shortlog” are also alive. A crowd is the right granularity. Do
not list them as a memorial committee. Do not make the post-death shortlog a tribute video.

### The other taste failure: withholding as a trick

If you cut the death from the turn entirely, and make the reader wait through One name and
Constitution for the dedication to say “passed away,” you will be accused — correctly — of using
a death as a reveal. “That is the last thing” plus he died: human. The date from the help file:
method. A withheld body until section five: a trick. Do not do that. The current draft’s problem
is the opposite (over-naming), but the fix is not coyness.

---

## 5. Expansion

1,691 words. The floor is 2,200. You have about 500 words of honest headroom before anyone should
mention the cap, and about 1,500 before you are writing the biography this chapter must not
become.

The trap: the chapter is under the floor *and* the risk of filling it is sentimentality. So the
500 cannot be feeling. They cannot be Uganda, illness, a narrator who heard the news, Christian’s
inner life, a meditation on bus factor, a longer RFC 2324, neovim, or “this is the elegy’s job in
the book.” They have to be ledger: Tuesdays the captions currently skip. Landing around 2,200–2,400
is the floor used honestly. Do not chase 3,200. An elegy that fills the cap becomes a life. A
third consecutive chapter under the floor, thinner than 05 and 06, will feel like the book is
evaporating. Inhabit. Do not pad. Do not bronze.

Add in three places, maybe a fourth. Not more.

### A. Sit in Friday night without announcing it (the open, after the teapot, before Saturday)

Right now: ranking-fragment, alphabetization, valgrind clause, crypt rename, Saturday, typo.

Add four to eight sentences that are only the room. The numbers were free. The help list was
unalphabetical and that will not stand. A warning in a crypt test could not be read, so the
buffers get renamed. Stop before last. Stop before “he had no idea.” Do not add a sixth commit.
Do not explain RFC 2324. The alphabetization is the character. Give it a breath so Saturday can
be silence rather than item four in a list.

This is how even the knowing reader stays in the room instead of waiting in the lobby for the
sentence they know is coming.

### B. One mailbox Tuesday (One name, after the 404, before the constitution)

Right now: shortlog, only row, 9,166, social-contract paragraph, 404, hold-on-to-that-name,
bus-factor.

Add one Bram-authored commit whose body credits Christian — a real Problem/Solution, his name in
parentheses, Bram in the author field. That is the arrangement as an object. Then 404 is a count
of objects we have seen one of. Then the 2019 evening can crack something we have touched. Do not
add a tour of other names in parentheses. Christian is the name the chapter needs. A crowd on the
other side of a mailbox can remain a clause.

### C. Sit in the two dates (The bridge, instead of “most affecting”)

Right now: drumroll, command, restatement, queue-explanation, not-a-manifesto.

Replace the sponsor-prose with July 13 as a room and August 8 as a room (see Bridge). This is
substitution plus a little air, not a new exhibit. It is the non-negotiable expansion, because
this is the leftover and it is currently a caption of a `git show -s`. It is also how the 500
words avoid becoming a eulogy: the dates get the words the adjectives currently occupy.

If you take the crypt-rename thread (the leftover test files trace to patch 9.0.1676), keep it as
one clause, the way you have it. It is the right thread. Do not walk back into Friday to
re-explain the crypt test.

### D. One post-death patch in his grammar (Announcement, after the three diffs, instead of monument)

Right now: LICENSE, flowers, dedication, “We watched that full time,” Vim-shaped grief, counter
didn’t reset, crowd in the shortlog, machine/monument/detachable.

The three diffs are enough handover. What is missing is one Christian (or anyone) patch after
August 3 that still says `patch 9.0.NNNN:` and Problem/Solution. The claim “they changed almost
nothing” is a caption of a shortlog. Show one. Then the counter, unreset, is visible. Then you
do not need monument. `Signed-off-by:` and a PR number are the new ritual, and they are already
in the draft; they just have nothing to stand next to except a sermon.

This may be a substitution: cutting Vim-shaped grief, monument, soul, and “We watched” funds the
example.

### Whitespace, not words, around the keepers

- After `E418: I'm a teapot` / E503. Then the alphabetization.
- After “Saturday passes without a commit.”
- After “That is the last thing Bram Moolenaar ever did to Vim.” Then he died. Then One name.
  No list, no proverb, no “this chapter is.”
- After “Not the top row. The *only* row.”
- After “The author field says Bram; the *paragraph* says everyone.”
- After “Six hours.”
- After the three-line PR log, before “The gap *is* the constitution.”
- After the LICENSE quote, before “Read cold, it is boilerplate.” No mortality.
- After the timestamp command. Then July 13. Then August 8. Then, maybe, unfinished business.
  No manifesto.
- After “One human becomes an org URL.”
- After the flowers diff. “Now the flowers go to a mailing list.” Stop.
- After the dedication quote. Do not explain full-time.
- After “They changed almost nothing,” if it survives without Vim-shaped. Then one patch in his
  grammar. Then At home.

### What not to add

- Biography. Illness. Cause of death. Uganda, ICCF, charity. The man in the repo is a committer.
  That is the assignment.
- Christian’s feelings, family, interviews, a “he never wanted this.” Alive. Named. Ledger only.
- A narrator who remembers where they were when they heard. Memoir is the wrong I.
- Neovim, forks, “the community rallied.” Not this dig.
- A longer teapot: RFC 2324 as a sidebar, HTTP 418 lore. The error strings are the joke.
- A sixth beat (the import of 9.0.1678 as its own section, a walk through `src/version.c` as
  tutorial, a second timestamp pair). 1678 is a clause or a close-rhyme, not an act.
- Any sentence that begins “this chapter is,” “the most affecting,” “Vim-shaped,” “actual
  monument,” “clause about mortality,” or “we watched.”
- A contrast-hinge with chapter 06 or 04 (“after a tour of fake beginnings, a real ending”;
  “after a sabotage of a one-maintainer project, a death of one”). The reader has a memory. Do
  not write “the last chapter.” Chapter 04 already got this note.

If the chapter comes out at 2,150 because the wreaths were cut and Friday night was a short
paragraph, that is closer to honest than padding to 2,200 with a meditation on bus factor. The
band is a band, not a dare. Consecutive chapters should not all be the same length; a mid-length
elegy after a mid-length tour is the craft, *if the rooms are sat in.* Caption-lean is not.

---

## 6. Open and close

### Cold open — the strongest last-weekend in the book, then a spoiler of the rest of it

What works: Friday 18:57, unused error numbers, `err_teapot()`, the withheld name, the
alphabetization that will not stand, Saturday, 02:38, a stranger’s spelling, the counter. What
fails: the ranking-fragment; then, after the turn sentence, everything from “twenty-five days
later” through “This chapter is about.”

Stronger version, same object:

> On the evening of Friday, 7 July 2023, at 18:57, the maintainer of Vim closed a gap in his
> editor's error numbering.

Then the command. Then E418 / E503. Then the help list, midnight, Saturday as its own paragraph,
Sunday’s typo. Then:

> That is the last thing Bram Moolenaar ever did to Vim.

He died. Stop. One name.

Do not open on the LICENSE (pays the title). Do not open on the timestamp pair (pays the leftover).
Do not open on the shortlog (pays One name; also chapters 03 and 04). Do not open on the dedication
(pays the method; also the wreath). The title is present tense and bureaucratic. The open is a
Friday night teapot. Let them meet at the LICENSE, not in paragraph two.

Consecutive-open is already clean. Protect its temperature. The clock is allowed; the obituary
sentence is not a clock.

### At home — three habits, then a bouquet, then the line you actually want

TEMPLATE.md wants the command the reader should run on their own repo, woven, never boxed. You
have not boxed it. You have listed it, twice, and then brought the flowers back.

Two directions of the clock is already a chalkboard heading in prose. Inside it, three habits:

1. `--author` versus `--committer` for last days
2. `git log --reverse --grep='Merge pull request'` and the gaps
3. shortlog in windows, person versus process, then the succession sentence in the tree

Chapter 05’s At home was a seminar on three habits. Chapter 06’s was the tour as a worksheet.
This is the same shape with a wreath on the end:

> It changed. It was announced. The flowers found a new address, and patch 9.0.1678 was followed
> by patch 9.0.1679, authored before the world it landed in.

“It changed. It was announced” is the LICENSE, restated, and it is almost dry enough to keep.
“The flowers found a new address” is the bouquet. “Authored before the world it landed in” is
the leftover, returning, and it is the last line the chapter has earned.

Stronger close:

1. Last story image: 9.0.1679, author date July 13, committer date August 8. Not the flowers
   reprise. The announcement already moved the flowers. The leftover is the date that waited.
2. One woven paragraph, two commands not three: run the shortlog in windows (is the author column
   a person or a process?). If it is a person, look today — while it is dull — at where the tree
   writes down what happens next. Vim kept that in a license, one sentence. Gaps in `Merge pull
   request` can be a clause, off the 2019 log, not a second assignment. Author versus committer
   last-days is the bridge in one breath, not a new lesson, and it can live here *or* in the
   bridge section, not both at full volume.
3. Last line, keep and isolate: “patch 9.0.1679, authored before the world it landed in.” If 1678
   has been a patch on the page, 1678 then 1679 can be the cadence. If it has not, do not make
   the last sentence require the receipts. Cut “the flowers found a new address.” Cut “Two habits
   from this dig, and they point in opposite directions of the clock.”

The LICENSE sentence as a habit is the right At home for this chapter: *if this changes, it will
be announced in appropriate places.* That is a command you can run on a tree you depend on
(search for who is named, and whether anyone promised an announcement). The merge-gap command is
the constitution’s habit. Pick one as the spine. The other is a clause. Three spines is a course.

---

## 7. Title

**Keep “The current maintainer.”**

It is the right title for the book and the right title for an elegy that must not wear black on
the contents page. It is not folklore (“Farewell to Bram,” “The last commit,” “A teapot for
Bram”). It is an object. It is present tense, singular, bureaucratic, the LICENSE’s own phrase,
and the sentence that will change. The double is the chapter: there is a current maintainer,
named; then there is an org URL, and a promise kept. The title is dry. Dry is the ethics.

Three risks.

**The title captions the LICENSE beat.** The reader who sees “The current maintainer” on the
contents page, then meets the sentence in January 2020, is confirming a label. That is acceptable
for a title-as-trap if the open is a teapot and the LICENSE arrives as paperwork. It is not
acceptable if you also say “clause about mortality” over the paperwork. The title plus the quote
is the setup. 2023 is the flip. Do not narrate the flip as mortality in advance of the dedication.

**Wrong center.** The event of the open is Friday night. The event of the leftover is July 13 /
August 8. The title sits on the LICENSE. That is a two-center chapter, which an elegy-plus-succession
is allowed to be, as long as the title is the argument (one named human, a promised announcement)
and not a caption on the teapot. It is. The teapot is the cold open; “the current maintainer” is
the law. Fine.

**Present tense against a dead man.** Some readers will find the title a flinch — as if he still
were. That is the point of keeping his phrase until the diff crosses it out. I would not change
it to past tense to be tasteful. Past tense would be the wreath. The LICENSE was present tense.
The diff is the past tense. Let the diff do it.

I would not use the alternatives unless the LICENSE beat stays a “clause about mortality,” in
which case the title cannot be dry and should not pretend to be.

Alternatives, in order, if you change it:

1. **If this changes** — the clause, still his words, still bureaucratic, a hair more ominous on
   the contents page. Best if you decide the LICENSE is the chapter (the unique promise). Loses
   the singular human. The title you have is the human.
2. **That is the last thing** — the turn, too much of a mic drop as a title, and it announces the
   elegy the open is trying not to announce.
3. **9.0.1677** — the last commit, caption, insider.

I would not use “Farewell to Bram” (the PR title, their wreath, not yours). I would not use
“Send flowers” or “Patches, flowers and suggestions” (cute, and it *would* exploit). I would not
use “The last commit is never a speech” (thesis as title). I would not use “err_teapot()” (the
open, wrong center). I would not use “One name” (the bus-factor section, not the elegy). I would
not use “Unfinished business” (the bridge, and a little sentimental as a contents-page phrase).

Keep “The current maintainer.” Stop explaining it with mortality. Let the 2020 sentence be
boilerplate. Let the 2023 diff be the change the boilerplate promised.

---

## Top 5 changes, by impact

1. **Let “That is the last thing Bram Moolenaar ever did to Vim” be the turn, and then stop.**
   Cut the death-date trailer, the five-commit re-list, the thirty-year obituary cadence, the
   pull-quote in the doorway, and “This chapter is about.” He died: one clause. The help file
   will date it. Consecutive-open is already a teapot on a Friday; protect the silence after
   the sentence that converts it. This is the change that stops the elegy from announcing itself.

2. **Let the timestamp pair be the grief, without a sponsor.** Cut “the object I find most
   affecting.” Sit in July 13 and August 8 as two rooms. Starve “not a manifesto” so announcement
   does not have to land the same plane. Do not reshuffle the beats; fix the volume. This is the
   unique archaeology. Right now it is a caption of `git show -s`.

3. **Stop certifying the grief.** Cut “clause about mortality,” “the most Vim-shaped grief
   imaginable,” “the man's actual monument,” “soul,” “We watched that full time,” “the flowers
   found a new address.” The ledger is already carrying it. The narrator’s hand is the thing
   that puts it down. This is the taste change and the prose change; they are the same change.

4. **Inhabit three Tuesdays, not five captions.** Friday night without ranking and without last
   (expansion A). One mailbox commit that is the 404 as an object (expansion B). One post-death
   patch still in his grammar, instead of monument-prose (expansion D). Do not add acts. Do not
   add a life. Do not chase 3,200. The floor is permission to sit down.

5. **Photographs before verdicts; leftover into At home; one last line.** Cut “the crack is
   instructive because.” Cut “Hold on to that name” as a wrist. Cut “the way Bram drew
   everything.” Quiet `[R2]`…`[R13]`. Rename or drop **The bridge** as a heading. Fuse 9.0.1679
   (July 13 still on it) into a short At home: shortlog in windows, where the tree writes what
   happens next. Isolate “authored before the world it landed in.” Two habits, not three, and no
   bouquet.

---

## The single most important change

**Trust the ledger. Stop writing the second eulogy.**

Keep the turn sentence. Cut everything in that paragraph that restates it, and cut the wreaths
that follow it through mortality, most-affecting, Vim-shaped grief, monument, soul, and the
flowers’ return. Sit in Friday night until Saturday can be silence. Sit in July 13 until August 8
is a commit, not a metaphor. Quote the dedication; do not gild it. Christian is a name in
parentheses for 404 patches and then a committer on an unreset counter; that is the portrait.

Everything else — E418 on a Friday, an alphabetization that will not stand, 9,166 for 9,166, six
hours in 2019, a LICENSE that promised an announcement, one human who becomes an org URL, a
standing instruction to send one man flowers, patch 9.0.1679 with its original date still on it —
will land if the reader has first watched a maintainer close a gap in error numbering, and has
not been told they are in an elegy, and has not been told that the timestamps are affecting. That
is the book. The wreath is folklore in a kinder coat. Right now the folklore is in the doorway
after the best sentence you have, the leftover is a caption, and the book is in the other room: a
teapot, a Saturday with no commit, a stranger’s spelling of *arguments*, two dates on a
housekeeping patch, and a bureaucratic sentence in a LICENSE that turned out, without anyone
filing it that way, to be the thing that had to be kept.
)
