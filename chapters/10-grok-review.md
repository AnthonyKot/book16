# Craft review: “Giving 0 losses”

Chapter 10, tensor2tensor — the research-code chapter. 1,827 words of body against a
2,200–3,200 band. This is a craft review, not a fact check. Hashes, dates, commands, and
quoted output are locked. I am not touching them.

The bones are the right bones, and they are in the right order. A README, then 155 seconds
later `transformer.py` as a parts list; Piper stamps on a public wall; `look_right=True`
inside a WMT chore; 0 losses; two compatibility rulings that went opposite ways; a TODO at
HEAD. The through-line is already a sentence the book has earned: this clone is not the
workshop, and it is not the spec. Three sentences in this draft are keepers for the series,
and two more will be if the captions around them die. I will name them.

The problem is not five stories. Five photographs of one fact is the chapter — the public
git is a projection, the weights are the spec, the paper is a postcard. The problem is that
all five are currently postcards, the doorway issues the delivery as a thesis, and the
title’s own words are translated four times before Vaswani is allowed to type them. 1,827
is under the floor. That is permission to sit in two Tuesdays the captions skip. It is not
permission to eulogize a research repo, and it is not a mandate to teach sinusoids.

That is the whole job.

---

## Does five stories sprawl?

**No, as photographs. Yes, as five short documentaries.**

The argument is one move, run on one repository: what you clone is not where the work
happened, and it is not what the field will obey. Birth is the projector’s first frame.
leakr is the frame that showed the office. `look_right` is a mask failing in public while
the real workshop is still inside. The two rulings are the moment the projection learns
what it is allowed to change. The TODO is what a projection keeps after the people have
gone. That is not a listicle. That is one exported tree answering, five times, *where is
the source of truth?* Keep all five names. Keep the question.

What blurs the set is treating every name as a room.

A research-code chapter cannot inhabit five Tuesdays in this band. TEMPLATE.md still wants
a room. The honest shape is: **two inhabited rooms, postcards for the supporting
photographs.** The 155-second dump is already the birth’s photograph (do not also census
the paper). leakr is already a postcard (do not expand it). `look_right` is the title’s
room, and it is currently a signature change plus a caption of a curve. The 2019 rollback
is the spec’s room, and it is currently a trig lesson plus a constitution. The TODO is the
leftover, and it is currently a weekend.

Do not cut leakr. Without the blaze path, “projection” is a metaphor. Do not cut the 2017
ruling. Without “This breaks existing models,” 2019 is a policy, not a reversal. Do not cut
the TODO. It is the object the fade exists to deliver. Cut the *register* that turns a
deprecation curve into chapter 07, and cut the leaderboard that turns a delivery into a
Wikipedia page for eight authors.

The missing words do not go into a sixth story. They go into the two Tuesdays the book
always needed: the three days when 0 losses still looked like winning, and the nine days
when a sincere one-line fix of the paper sat on HEAD. Sit there. Starve the rest.

### The mask explainer works. The sinusoid does not.

The prompt asked this plainly, so I will be exact.

The mask paragraph is four sentences, and it is doing the chapter’s work, not a primer’s:

> A model like this learns by predicting the next word of a sentence it is already
> holding. During training the full sentence is in memory, so the code must blindfold each
> position — a *mask* — to keep it from reading the words it is supposed to be predicting.
> The mask is the exam conditions. Take it away, and the exam is open-book, and the model
> doesn’t learn language; it learns to copy.

A general-technical reader can hold an exam. An ML-literate reader is not being taught
attention; they are being pointed at the constraint the signature is about to violate.
Nobody is bored, because the next object is the default. Keep the metaphor. Do not add
*causal*, *autoregressive*, or a diagram. Do not expand it. The one overclaim is the
sentence that introduces it:

> Now the dig this chapter is named for, and it needs one piece of background, which is
> also the paper’s whole idea.

The chapter is not named for `look_right`. The paper’s whole idea is not the mask. The
mask is the constraint the architecture cannot survive without. Cut the wrist. Cut the
promotion. Keep “that function” later, which is already careful — this is
`masked_local_attention_1d`, not a claim that the Transformer itself was open-book for
three days. Protect that care. Do not inflate the heading to pay for it.

The sinusoid paragraph fails both readers at once:

> An outside contributor reads the sinusoidal position code — the famous formula that
> tells a Transformer where each word sits in the sentence — and notices that position
> zero produces a degenerate signal: sine of zero is zero, cosine is one, so the first
> token’s positional fingerprint is half zeros and half ones.

The general reader does not need `sin(0)`. The ML reader already knows it, and “the famous
formula” is a tour-guide’s hand on their shoulder. The photograph is already in the diff:
`tf.range(length)` versus `tf.range(1, 1+length)`. Count from one instead of zero. What
both readers need, in one sentence without trig, is why that is not a comment: the first
position is a pattern every existing checkpoint has learned around, and moving the pattern
does not crash the load. Then the rollback. The math class is the thing to cut so the nine
days can exist.

---

## 1. Structure and pacing

### The order is right. Do not reshuffle.

Birth → projection → `look_right` → two rulings → leftover → at home.

You cannot feel a projection until a 155-second dump has arrived from somewhere else. You
cannot feel `look_right=True` as chore-work until the wall has already shown the office.
You cannot feel 2019 as a reversal until 2017 has broken models on purpose, cheaply. You
cannot feel a TODO at HEAD until the spec has shipped and the repo’s job has become *not
to move*. Chronological-by-surprise would put Vaswani in the doorway and spend the title
before the dump has taught us this git is late. Mechanism-first would put the two rulings
ahead of the mask and make 0 losses a footnote to a policy paper. Do not.

Do not open on `look_right` (chapter 09 already opened on a diff; also, the title would
have to fight its way back from a parameter). Do not open on the TODO (that is chapter
07’s last-commit trick, and it is the leftover, not the instrument). Do not put the 2019
rollback before Vaswani (the title would never flip; it would be a constitution with a
mask anecdote attached). Keep the order.

What the order is not doing is *volume*. Birth is a dump plus a census. leakr is the right
length. `look_right` is a signature, a rename, a caption, a proverb, a revert. The rulings
are a hinge, a day-16 subject, a trig dump, a rollback quote, a constitution, a proverb.
The timer is a spreadsheet, a Saturday at 2 a.m., a copyright bump, and then the object.
That is five exhibits at caption-volume, two of which needed to be rooms. Do not swap the
photographs to fake the sharpening. Starve 1, 2, and 5. Inhabit 3 and 4.

### The open is the right object. It dumps the chapter.

TEMPLATE.md: a concrete moment, ideally the thing that will turn out to matter, shown
before we know it matters. You did. Two commits, 155 seconds, 74 files, 15,315 lines, and
the file is `models/transformer.py`, whole. Chapter 09 opened on a diff. This opens on a
log. Consecutive-open is already satisfied. Protect the dump.

Then the docstring, which is the first keeper:

> Two lines of architecture that would eat the next decade, described with the enthusiasm
> of a parts list.

Protect that. It should have whitespace after. It does not. It is the hinge of a paragraph
that immediately dates the paper, names the birth a delivery, names Sepassi as permission,
names `Google Inc.`, and then runs the paper as a shortlog:

> Of the paper’s eight humans, some show up in the weeks after — Kaiser with 673 commits
> eventually, Shazeer 166, Parmar 92, Vaswani 57, Gomez 30 — and three never appear in
> this history at all

Uszkoreit 0 is a photograph. The leaderboard is a census. Kaiser, Shazeer, Vaswani will
walk on when they act; you do not need their career totals in the doorway to introduce
them. Then the jacket copy:

> The most influential neural architecture of its era arrived in public git as a fait
> accompli, authored by a company, pushed by an engineer, its inventors present only as
> names that start committing later — because the real history happened somewhere else, in
> a repository you will never clone.

That is the chapter, spent. “Fait accompli,” “most influential,” “a repository you will
never clone” — hype, thesis, and a wink at Piper before Piper has a stamp. Chapter 06 put
the tour contract in this slot and was told to cut it. Chapter 08 put the three-company
law here and was told to cut it. This is that sentence, with a parts list in front of it.
The reader can feel a dump. They cannot feel a dump if you have already said *delivery*
and *somewhere else*.

**Move:** stay with 155 seconds, the parts list, `AUTHORS: Google Inc.`, the three names
at zero. Stop. Let **The projection** be the first time anyone says the work happened in
a monorepo. Cut “the birth is not a birth — it is a delivery.” The 74 files already said
that.

### The projection is the right postcard. Leave it a postcard.

PiperOrigin-RevId, two internal paths, a dictionary that stayed inside, “the projection
shows the office.” That is the length. Do not add a Copybara tutorial. Copybara will
commit the 2019 rollback; that is the rhyme, and it is free if you let the 2019 header
sit. leakr is not a second leak story. It is the projector incriminating itself, then we
go to the dig. Keep it hungry.

### look_right is the title’s room. It previews the revert, then captions the curve.

The first command of the section is `git log -S look_right`, newest first:

> a0bd0177 2017-08-04 14:41:57 -0700 Ashish Vaswani Reverted back to the previous
> masked_local_attention_1d ...

The outcome is on the page before the signature. Then we go back to 1 August. Then we get
the default. Then we are told the news is too good. Then the proverb translates the title.
Then Vaswani types the title. That is not sitting in the moment before the outcome. That
is a recap with receipts in the original order of `git log`.

Show the introduction first. `75270907`, the signature, the docstring against the default.
Sit there. The revert is the turn, not the section’s cold open.

The archaeology in the middle is already good, and then it winks at the series:

> It arrived folded into a routine porting commit, the day’s honest chore-work, where
> nobody’s eye would snag on it — the same way every dangerous change in this book
> arrives.

Keep the chore-work. Cut “in this book.” Chapter 09 was told not to say “unlike xz.” Same
rule. The reader has a memory. The subject line `More WMT corrections, port image problems
to Problem` is the camouflage; it does not need a tour of previous camouflage.

The file-rename that changes the bug’s address is a keeper in one sentence. Do not make it
a subplot. It is already one sentence. Protect it.

Then the curve, which is the title’s only chance to mean a score:

> For three days, any model trained with that function was taking an open-book exam. And
> here is the thing about this failure mode: it does not look like failure. It looks like
> the best training run you have ever seen — loss collapsing toward zero, the model
> apparently mastering language at unprecedented speed, every metric singing. The only
> tell is that the news is too good.

The first three sentences are the room. The last sentence is the narrator snatching the
tell so the ~ beat and Vaswani will not have to. See Title. Sit in the miracle. Do not
also grade it.

Then:

> On August 4, the first author of the paper reads the curve correctly

“First author of the paper” is Wikipedia. The archaeology is: the man who knew what the
mask was for, because he put it there. You already have that sentence, later, under a
wreath. Use it as identification, not as prestige.

### The other verdict is the chapter’s unique claim. It is a hinge plus a trig lesson.

> The revert is one of two compatibility rulings in this repository, and they went
> opposite ways, and the pair is the closest thing I know to a definition of what shipping
> research code means.

The reader can hold two rulings. They cannot discover a pair that you have already called
a definition. Show 2017. Show 2019. Let the pair name itself, once, in the ~ beat that
already does that job.

Ruling one is the right length. Shazeer’s subject, undisguised; two weeks deep;
correctness was cheap. Do not expand it. It is the control case. It is a postcard that
earns 2019. Protect:

> Correctness won, because the world’s investment was two weeks deep and correctness was
> cheap.

Ruling two is the room, and it is currently a formula, a merge, a nine-day clause, a
rollback quote, and then two namings of the law. The outside contributor is the person
TEMPLATE.md asked you to sit with: they think the spec is the paper; they send one sincere
line; it merges; for nine days HEAD is “more correct.” We never stand in those nine days.
We get “sat on HEAD for nine days. Then:” and the constitution arrives. The Copybara
header is on the page and unused — T2T Team, no-reply, the projection performing the
ruling. That is the through-line coming back. It is currently metadata over a quote.

Do not make 2017 and 2019 equal volume. Stakes are not equal. Expand 2019. Keep 2017 as the
cheap twin.

### The timer is the leftover. It is wearing chapter 07’s weekend.

Chapter 07 owns: a last human act, a Saturday with no commit, a stranger’s typo at 02:38,
a patch authored before the world it landed in. This section currently offers: a
maintainer at two in the morning on a Saturday, a last commit at 03:18, a mailing list
nobody answers, a note passed to a room that emptied years ago. The objects are not the
same. The cadence is.

The objects are dry, and they are the right leftover for *this* chapter. 2,228 commits,
then 4. Maintenance → deprecated, one word. `Internal change`, a copyright-year bump. And
the TODO:

> `# TODO(noam): ask rsepassi for help here.`
>
> He never asked, or the answer isn’t here.

That last sentence is a keeper. Dry, two possibilities, no wreath. Then the draft puts the
wreath on anyway:

> Both names have left the shortlog. The TODO waits at HEAD, a note between two people
> passed to a room that emptied years ago.

The first of those sentences is a fact. The second is chapter 07’s cousin. Stop at HEAD.
The emptied room is the narrator certifying that a leftover is moving.

The year-counts can stay as one clause, and they should be wired to the 2019 ruling, not
to a funeral: once the weights are the spec, the repo’s job is to stop. That is the
through-line, not an elegy. Kaiser’s one word is a deprecation, not a teapot. Keep the
timestamp in the command; do not novella “two in the morning on a Saturday.” Keep the
copyright bump if it stays machinery; cut “nobody answers.”

Rename **The timer**. A timer is a countdown to a death. The leftover is a TODO. Call it
an object from the tree, or don’t. Do not call it a clock running out.

### Headings: one object, one metaphor, two labels, one leak

`The projection` — a metaphor, earned by the stamp. Keep.

`look_right` — an object. Keep. Best heading in the draft.

`The other verdict` — a label, and it announces the pair. Pay the 2017 subject instead:
**This breaks existing models**. Then 2019 can invert a heading the way the rollback
inverts the ruling. Or no heading that says *verdict*. Do not put the constitution on the
door.

`The timer` — the elegy leak, as above.

`At home` stays. It is the book’s convention.

### First person is almost missing, and the one “I” you have is a rereader

The engineer who runs blame daily is allowed to want things. The I this book has earned
is chapter 08’s: *I might have made that plaque too.* The I this draft has is:

> this is the part I keep rereading
>
> the closest thing I know to a definition
>
> leaving the lesson where the next archaeologist would dig

A rereader, a definer, an archaeologist naming the method. Wrong I. You need the I that
has merged a flag inside `More WMT corrections`, and the I that has sent the off-by-one
against a famous formula. Those are the two Tuesdays. “No sneering” lives there, and right
now it is surviving on the absence of mockery, which is not the same as reconstructing
what Kaiser knew, or what the outside contributor wanted. Do not add a census I. Do not
add a columnist I. Put one pair of hands on the default and one on the range, then get
out of the way.

---

## 2. Prose

Keepers, already, for the series. Do not sand them.

> Two lines of architecture that would eat the next decade, described with the enthusiasm
> of a parts list.

> A blindfold with an opt-out, opted out.

> The only tell is that the news is too good.

That third one is a keeper as a line and a problem as a position. See Title. If it stays
on the page it cannot sit in the same breath as the ~ beat. I would rather keep the ~ and
move this line, or cut it, than sand it.

And two that are almost keepers, and will be if the wreaths around them die:

> Correctness won, because the world’s investment was two weeks deep and correctness was
> cheap.

> He never asked, or the answer isn’t here.

A sixth, the leftover as a last image, currently over-written:

> The TODO waits at HEAD

And a seventh, which is the chapter’s law, currently said three times:

> The spec is not the paper. The spec is the weights people have already trained

Say it once. The ~ beat is the once.

### The clunkiest sentence

> The most influential neural architecture of its era arrived in public git as a fait
> accompli, authored by a company, pushed by an engineer, its inventors present only as
> names that start committing later — because the real history happened somewhere else, in
> a repository you will never clone.

Sixty-odd words, stacked appositions, a *because* that explains the joke, hype in the
first clause, Piper in the last, the chapter’s thesis as a single breath in paragraph
two. This is the first verdict after the parts list. It cannot be a press release.

Rewrite, after `Google Inc.` and the three zeros, as objects:

> The AUTHORS file names a company. Three of the paper’s eight names will never appear in
> this log. The other five start committing later. The work is already done.

Then **The projection**. Do not also say *delivery*. Do not also say *somewhere else*. The
stamp will say it.

Runner-up, and the one that is clunk *because* it is in the title’s payment:

> Sixty-nine hours after the unsafe default landed, Vaswani deletes the parameter,
> restores the left-only neighborhood, and — this is the part I keep rereading — writes
> the diagnosis into the commit message, so that the next person who sees a miraculous
> loss curve on this code path will find the sentence explaining it.

Plot, wreath, purpose-clause, “next archaeologist” waiting in the next sentence. Chapter
07 was told to cut “the object I find most affecting.” This is that wrist, on the revert.
Sixty-nine hours is the fact. The diagnosis in the message is the fact. Rewrite, two
beats, after the `fuller` block:

> Sixty-nine hours later he deletes the parameter and restores the left-only neighborhood.
> The message is the diagnosis, left on the object, for whoever hits a miraculous curve
> next.

No incident report, no postmortem — that contrast can stay, one sentence, dry. Cut “I keep
rereading.” Cut “the next archaeologist would dig.” The reader is the archaeologist. You
do not need to say so.

Third, the hinge that is a throat-clear:

> The revert is one of two compatibility rulings in this repository, and they went
> opposite ways, and the pair is the closest thing I know to a definition of what shipping
> research code means.

Three *and*s, a hedge-boast, the definition issued before either ruling has been shown.
Rewrite: delete. Open on Shazeer’s subject. The pair will exist after the second
photograph.

### The paragraph doing the most work

The docstring against the default:

> Read the old docstring against the new default. The function’s name promises a mask; its
> documentation promised *a neighborhood to the left* — the past only. The new version
> adds a parameter, `look_right`, and defaults it to `True`. A blindfold with an opt-out,
> opted out. It arrived folded into a routine porting commit, the day’s honest chore-work,
> where nobody’s eye would snag on it — the same way every dangerous change in this book
> arrives. The next day the whole file moved from `models/` to `layers/` in a housekeeping
> commit [R7], so the bug even changed address while it was live.

It has to (a) make the reader do the reading, (b) land the default, (c) compress the
footgun, (d) put it in chore-work, (e) note the rename. It does (a)–(c), which is why it
is the paragraph to build the section from, and why (d) is the room if you cut the series
wink, and why (e) is already the right weight. Give the signature air. Let “opted out”
have whitespace after it. Then the WMT subject as the camouflage, without “this book.”
Then the address-change, one sentence. Do not add William. Do not add `use_whole_block`.
The paragraph is the archaeology. It is currently also a contents page for the series’
dangerous changes.

Honorable mention: the too-good curve (quoted above). It converts a signature into a felt
failure mode without a primer. That is why it is the other paragraph to build from, and
why “The only tell is that the news is too good” has to leave so the ~ beat can be the
tell.

### The paragraph pulling its weight least

The eight-humans census, already quoted. It is a table in a sentence, in the doorway, and
its punchline — Uszkoreit 0 — does not need the career totals in front of it. The zero is
the hole. The 673 is a leaderboard. Cut the numbers. Meet Kaiser when he ports. Meet
Shazeer when he breaks the tokenizer. Meet Vaswani when he reads a curve.

Runner-up, the timer’s first paragraph: year-counts, then Sepassi’s last, Shazeer’s last,
as a fade-by-spreadsheet. The counts can be one clause on the way to Kaiser’s one word.
They cannot be the opening of the leftover. The leftover is the TODO. Everything in front
of it that sounds like a career ending is chapter 07, in miniature, without a death to
justify the register.

The sinusoid paragraph is the weakest *as teaching*. See the mask/sinusoid verdict. It is
not the weakest as structure; it is in the right place, wearing the wrong clothes.

### Other prose notes, shorter

“The birth is not a birth — it is a delivery.” The dash-negation is a tic the book has
mostly outgrown. The 74 files are the delivery. Delete the gloss.

“a fait accompli” / “the most influential neural architecture of its era.” The book does
not hype git in chapter 05. Do not hype this. The parts list eats the decade without a
medal.

“the same way every dangerous change in this book arrives.” Series wink. Cut.

“Now the dig this chapter is named for.” Wrist, and inaccurate. Cut.

“the first author of the paper reads the curve correctly.” Prestige. The message is the
reading.

“Mathematically defensible; arguably what the paper should have done.” This is the outside
contributor’s Tuesday, crushed into a clause. Unpack it in the nine-day room. Do not leave
it as a hedge.

“the rollback message is the constitution of the whole field in three sentences.” Sponsor
for the ~ beat, and “the whole field” is magazine. Cut. The rollback is three sentences.
Let them be.

“every one of them had learned, in its millions of weights, to expect the ‘wrong’ zeros in
position one.” “Position one” fights “position zero” in the paragraph above. Say the first
token. The scare quotes on *wrong* are doing the 2019 ruling’s job in advance; the rollback
will say it.

“an account that is a mailing list nobody answers.” A small sneer at an empty org. The
account is `T2T Team` / `no-reply`. That is dry enough.

“a note between two people passed to a room that emptied years ago.” Wreath. Stop at HEAD.

`[R5, R6]`, `[R1]`, `[R2]` on the page, often. Quiet them. The commands are the receipts
the reader can see. The brackets are a worksheet.

The CHECK on the arXiv date stays until the adversarial pass. Fine.

---

## 3. Title

**Keep “Giving 0 losses.”** It is the commit’s own words, in the commit’s own grammar, and
that is this book’s title tradition: *To improve performance*, *add flat map*, *Nothing
much to see here*. Do not rename to `look_right`. Do not rename to the spec. The parameter
is the heading. The diagnosis is the title.

Does it flip at the revert? Almost. It would, if the page would let “0 losses” be a score
for one full breath.

On the cover, a general-technical reader does not know what a loss is. An ML reader hears
a perfect training run, slightly broken English. Both are useful. The series reader knows
the phrase will appear in a commit and will invert. That is the contract. Do not explain
the title in the doorway.

On the page, the phrase is translated four times before its source:

1. The title itself, already in the reader’s hand.
2. “loss collapsing toward zero… every metric singing” — the success reading, one
   paragraph, correct.
3. “The only tell is that the news is too good” — the narrator grades the success.
4. “a perfect score is not mastery. It is a leak” — the ~ beat translates the title.
5. Vaswani: “giving 0 losses indicating that it was peeking into the future.”

That is not a flip at the revert. That is a flip at (3), a proverb at (4), and a citation
at (5). The book’s trick is: feel a beat before it is named. The ~ beat *is* that feel.
Vaswani *is* the name, and the title’s payment. (3) is the narrator snatching both jobs.
Cut (3), or move it after Vaswani as a backward glance, not as a pre-translation.

Sit in (2) longer. Let 0 losses be a miracle — the best run you have ever seen, the score
the title seemed to promise. *Then* the ~ beat, one line, whitespace on both sides. *Then*
the `fuller` block, and the phrase is sourced, and the title has flipped from a result to
a confession. Do not also have the pickaxe log preview `Reverted` in the section’s first
command. The revert is the landing, not the exhibit label.

The title does not need a medal after it lands. Do not write “this is why the chapter is
called.” The words in the message are enough. They are slightly off, *giving 0 losses*,
and the offness is character. Keep it.

---

## 4. The two ~ beats

**~1 — keep, where it is.**

> In a model that predicts the future, a perfect score is not mastery. It is a leak.

This is the feel-early. It has to sit after the curve-as-success and before Vaswani names
the peek. Do not move it after the revert (that would be a caption of a caption). Do not
cut it. It is the title’s translation, and it is a keeper for the series.

Two small cares, not a rewrite. “Predicts the future” is loftier than the exam we taught;
the exam will carry it anyway, and I would not sand the line to “predicts the next word.”
The word *leak* also sat in leakr, a page earlier, as a dictionary against internal paths.
Do not pun it. Do not avoid it. leakr is a tool name. This *leak* is the right word. The
reader can hold two leaks from an exported repo without a narrator pointing at the rhyme.

What ~1 cannot survive is “The only tell is that the news is too good” in the sentence
before it. Two tells. Keep this one.

**~2 — keep the first two clauses; cut the sponsor; do not move.**

> The spec is not the paper. The spec is the weights people have already trained, and the
> weights have shipped.

This is the chapter’s law. It is in the right place: after the 2019 rollback, not in the
doorway, not in At home. Keep it there. Cut the sentence that precedes it (“the rollback
message is the constitution of the whole field in three sentences”), which is the same
law, named, so the ~ can only confirm. Cut the restatement in At home (“a spec nobody
wrote down”). Three payments is chapter 08’s doorway problem, at the other end of the
essay.

“And the weights have shipped” is a third clause, and it is the right third clause — this
is the shipping-research-code chapter — but only if it is not also the hinge, the
constitution, and the closing worksheet. If you need a cut inside the line, cut *shipped*
before you cut *spec*. I would keep the whole line and kill the two sponsors.

Do not move ~2 into At home. At home is a habit. This is a law that has just been
photographed. Moving it would turn the close into a seminar.

---

## 5. Word count, cuts, rooms

1,827 against a floor of 2,200. About 370 words short of the band, 1,370 short of the
cap. This is not a chapter 03 situation, and it is not a chapter 09 situation. 1,827 is
not lean-and-right. The dump is two commits with a census on them. The title story is a
signature with a caption of a curve. The spec story is a trig dump with a nine-day
clause. The band is permission to sit in the rooms. It is not permission to complete a
set, and it is not a mandate to chase 3,200.

Do not add William’s sliding window. Do not add BERT. Do not add a Copybara explainer.
Do not add a sixth ruling. Do not add a life of Vaswani. The floor funds two Tuesdays.
The cuts fund them too.

### Cut, in order of what they buy

- The doorway thesis: “the birth is not a birth,” “most influential,” “fait accompli,”
  “a repository you will never clone.”
- The eight-humans leaderboard. Keep Google Inc. Keep the three zeros. Meet the others
  when they type.
- “Now the dig this chapter is named for” / “the paper’s whole idea.”
- The pickaxe log that previews `Reverted`. Show 75270907 first.
- “the same way every dangerous change in this book arrives.”
- “The only tell is that the news is too good” (or move it after the revert).
- “this is the part I keep rereading” / “the next archaeologist would dig” / “first
  author of the paper.”
- The hinge that calls the pair a definition.
- Sine, cosine, degenerate signal, “the famous formula.”
- “constitution of the whole field in three sentences.”
- The timer’s weekend: two in the morning on a Saturday as pathos, “nobody answers,”
  “a room that emptied years ago.”
- At home’s second habit, which restates ~2.

That is not 370 words. It is more like 250–400, which is fine, because the rooms are
larger than the cuts. Cut to make air, not to make quota.

### A. Sit in the miracle (look_right, after the signature, before Vaswani)

The title is a duration: sixty-nine hours. Right now the duration is a number at the
front of the wreath-sentence. TEMPLATE.md: reconstruct what the actor knew when they
typed. Two actors, actually, and the draft sneers at neither, which is the right ethic
and the wrong volume.

Kaiser, 1 August: a porting commit, WMT corrections, image problems. The old docstring
still says left. The new default says `True`. Sit in the flag as a reasonable parameter
on a function you are generalizing — not as a man who decided to cheat. You do not know
why the default is true, and you must not invent a motive. You know it arrived inside
the day’s chore-work, and that you might have merged it. One paragraph. Stop before you
tell us it was peeking.

Then the three days, from the training-run side. Loss goes to zero. Every metric sings.
This is what “giving 0 losses” sounds like when it is still a score. Do not invent a
curve git does not hold. Sit in the *reading* of a curve: the news is the best you have
seen, and the man who will revert it has not typed yet. The ~ beat can land now. Then
August 4.

Do not add a training tutorial. Do not add a lab anecdote. The room is a default, a
subject line, and a score that looks like mastery. That is enough to flip the title.

### B. Sit in the nine days (the 2019 fix, after the one-line diff, before the rollback)

An outside contributor reads the position code, notices the numbering, sends one sincere
line. “Mathematically defensible; arguably what the paper should have done” is their
Tuesday, not your hedge. They think the spec is the paper. The PR merges. For nine days
HEAD is the formula as a reasonable person would write it, and every existing checkpoint
will still load, and none of them will mean what they meant. Then Copybara rolls it back,
T2T Team, no-reply, because the weights have shipped.

Sit in the sincerity. Sit in the nine days as a live HEAD, not as a clause. Let the
Copybara header be the projection performing the constitution — do not say that sentence;
show the committer. Then the rollback body, which is already the best three sentences in
the section because you did not write them. Then ~2, once.

This is also the first-person room: *I have sent this PR.* Off-by-one against a famous
formula, paper in one tab, code in the other. No sneering. The reader should think they
might have done this. Right now they think “ah, they counted from one.” That is a plot
point, not a room.

### What not to add

A history of attention. A walk through `transformer.py`. The paper’s eight-author
biographies. William. `use_whole_block`. A second leak story that puns leakr against the
~ beat. A sixth compatibility ruling. Any sentence that begins “unlike chapter 07.” Any
descendant model (BERT, GPT) as blast radius — the blast radius is the checkpoints, and
the rollback already said so. Do not chase 3,200. Two rooms, mid-band, done.

---

## 6. Open and close

### Cold open — the right object, then a press release

The object is right. `log --reverse | head -2`, a one-line README, 155 seconds, 74 files,
the architecture as a parts list. That is a delivery shown before anyone says delivery.
Chapter 09 was a diff. This is a two-commit clock. Consecutive-open is already a
different kind of object; do not also keynote.

Cut everything after `Google Inc.` that is not the three zeros. The paper-three-days-
earlier clause can stay — it is the one external beat the dump needs, and it is already
CHECKed. The docstring does not say the paper’s title. Keep that negation; it is a
photograph, not a gloss. Isolate the parts-list sentence. Then the projection, with a
stamp, not with a thesis.

Do not open on `look_right`. Do not open on the TODO. Do not open on a shortlog
(chapters 03 and 04). Do not open on Vaswani’s message (that is the title’s payment).

### At home — three habits, then the line you actually want

> The habit from this dig is `git log -S` on the names of your safety mechanisms —
> `mask`, `causal`, `look_right`, whatever guards your invariants — because the moment a
> guard was loosened is almost never a commit *about* the guard; it rides inside the
> day’s chore-work, and pickaxe is how you find it. And when you inherit research code,
> read the subjects for `breaks existing` and `Reason for rollback` — those commits, not
> the changelog, are where the project told the truth about what its users’ trained
> weights had turned into: a spec nobody wrote down. Then go look at your own miraculous
> metric, the one that improved more than it should have, and ask what it can see.

Three habits, one paragraph, and the middle one is ~2 again. Chapter 07 was told two
habits, not three. Chapter 09 fused both halves to one command. Fuse this.

The pickaxe on guard-names is the method of the title story, and it is the habit that
changes how you read a chore-work commit. Keep it. The miraculous metric is the title’s
leftover applied to the reader’s own run, and it does not even require git, which is why
it is this chapter’s unique takeaway. Keep it. Isolate it.

Cut the middle. `breaks existing` / `Reason for rollback` is a worksheet on the pair, and
the pair has already been photographed. If a clause of it must live, it lives inside the
pickaxe sentence (subjects as well as symbols), not as a second command that restates the
law.

Last line an object, not a seminar. “Ask what it can see” is the line. Whitespace before
it. Do not also leave the reader with a spec nobody wrote down; ~2 already did, if you
let it.

The leftover of the *story* is the TODO, and it should remain in **The timer**, not be
imported into At home as a bouquet. Chapter 07 put flowers in At home and was told to
stop. This chapter’s TODO is already in the right place. Do not send it flowers. Stop at
HEAD, then change how they read a metric.

### The fade versus chapter 07, one more time

Dry enough *as objects*. Not dry enough *as written*.

Keep: the year-counts as one clause (wired to “the repo’s job is to stop”); Kaiser’s one
word; the TODO; “He never asked, or the answer isn’t here.”

Cut or starve: the weekend clocks as atmosphere; “nobody answers”; the emptied room; the
heading **The timer**.

A deprecation curve is not an elegy. A note to `rsepassi` is not patch 9.0.1677. The
difference is the register. Trust the leftover. Stop writing the emptied office.

---

## Top 5 changes, by impact

1. **Sit in the 0. Let the title flip at the revert.** Cut the pickaxe log that previews
   `Reverted`. Cut “The only tell is that the news is too good.” Cut “I keep rereading”
   and “the next archaeologist.” Show the signature, sit in the chore-work, let the curve
   be a miracle, then the ~ beat, then Vaswani types *giving 0 losses*. This is the
   change that makes a title from a commit’s words actually invert, instead of being
   translated four times and then cited.

2. **Stop issuing the chapter in the doorway.** Cut “the birth is not a birth,” “most
   influential,” “fait accompli,” “a repository you will never clone,” and the eight-
   humans leaderboard. Stay with 155 seconds, the parts list, `Google Inc.`, the three
   zeros. Let **The projection** be the first time anyone names the monorepo. This is the
   change that lets a dump be a dump.

3. **Sit in the nine days of the sincere fix.** Cut the trig. Cut the hinge that calls
   the pair a definition. Cut “constitution of the whole field.” Keep 2017 as the cheap
   twin. Let Copybara perform 2019. Let ~2 be the only naming of the spec. This is the
   research-code change: the outside contributor thought the paper was the spec, and the
   reader should think they might have sent the PR.

4. **Starve the timer of elegy.** Keep the TODO. Keep “He never asked, or the answer
   isn’t here.” Cut the emptied room, “nobody answers,” Saturday-at-2 a.m. as pathos.
   Year-counts as one clause on the way to a one-word deprecation, wired to 2019 (once
   the weights shipped, the repo’s job was to stop), not to a funeral. Rename **The
   timer**. Chapter 07 already owns the last weekend.

5. **Photographs before verdicts; one I; one last line.** Cut the series wink. Cut “the
   paper’s whole idea.” Quiet the R-brackets. First person on the default and on the
   range, not on rereading. Fuse At home to pickaxe-the-guards, then isolate “ask what it
   can see.” Keep ~1 where it is. Keep ~2 where it is; kill its two sponsors. Do not add
   acts. Do not chase 3,200.

---

## The single most important change

**Trust the 0. Let “giving 0 losses” be a score before it is a confession.**

The public dump, the Piper stamp, the two rulings, the TODO — those photographs are
already the chapter, and they will land if the title is allowed to mean what it seemed to
mean for sixty-nine hours. Right now the doorway has already said *delivery*, the mask
section has already said *Reverted*, the narrator has already said the news is too good,
the ~ beat has already said *leak*, and Vaswani is left to confirm. That is folklore in a
research-code coat: the reader is told the exam was open-book, then shown the message
that says so.

Cut the preview. Cut the tell. Sit in a porting commit whose default is `True` and in a
curve that looks like mastery. Then one line:

> In a model that predicts the future, a perfect score is not mastery. It is a leak.

Then the man who put the mask there types the title, and the title flips, and the rest of
the chapter — a cheap broken tokenizer, a sincere off-by-one that would have silently
wrecked every checkpoint, a TODO still at HEAD — can be photographs of the same fact:
this clone is not the workshop, and it is not the spec. The spec is the weights people
have already trained. You only need to say that once, and only after a one-line fix of
the paper has sat on HEAD for nine days and been rolled back by a robot.

That is the book. The press release is in the doorway, the leftover is wearing another
chapter’s weekend, and the book is in the other room: 155 seconds, a parts list, a
blindfold opted out inside `More WMT corrections`, a score that went to zero, two
subjects that disagree about whether existing models may be broken, and a note to
`rsepassi` that nobody is left to answer, which is not an elegy. It is a leftover. Leave
it.
