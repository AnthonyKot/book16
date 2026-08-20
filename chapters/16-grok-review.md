# Craft review: “empty commit to trigger a github mirror”

Chapter 16, the empty commit — five repositories, three speech acts, the commit as an event
with an optional payload. 1,468 words of body against a 2,200–3,200 band. This is a craft
review, not a fact check. Hashes, dates, commands, and quoted output are locked. I am not
touching them.

The bones are the right bones, and they are in the right order. Same hash twice at 2:08 in
the morning; a subject that is the title; a knock on a door with no one behind it; a CI
doorbell left ringing in a locked room; four MARKER subjects, two seconds, a table of
contents typed into the graph; a bug-fix subject sitting on an empty tree; the same patch
landed twice, twelve minutes apart, the second a hollow echo. The through-line is already a
sentence the book has earned the right to attempt: a commit is not a diff. It is an event,
and the change is optional. Three sentences in this draft are keepers for the series, and two
more will be if the seminar around them dies. I will name them.

The problem is the form’s contract with the reader. This is the third cross-repo chapter.
Chapter 06 was six firsts and the law that a famous beginning is never a beginning. Chapter
08 was three companies and the law that the files and the wrapping are packed by different
hands. A tour can work. A census of empty commits cannot. Right now the draft is a strong
argument wearing a museum’s floor plan: the ontology named in paragraph four, a promise of
four things and a delivery of three, headings that are the verdict, specimens at equal
volume, and a close that restates the tour as a checklist plus a tool. It is not yet a
listicle. It is one more “the second thing an empty commit can say,” and one more trip
through a repository this book has already walked, away from becoming one.

Do not add a sixth name. Do not chase 3,200. The floor is permission to sit down in two
Tuesdays the postcards currently skip. It is not a mandate to complete a set.

---

## Does it earn its place as a third cross-repo chapter?

**Yes, as an argument. Not yet as a chapter.**

The prompt asked this first, so I will not bury it.

Chapter 06 is about the first node: is it a beginning? Chapter 08 is about the wrapping of
the node: who packed the dates, and what did they decide history *is*? This chapter is about
the node with no tree-change: is a commit a diff? That is not a leftover of genesis, and it
is not a costume in a new coat. It is a revision of the unit the whole book is made of.
Fifteen chapters have treated commits as changes — blame lines, deletions, reverts, planted
dates, a hack left in a file. The empty commit is the object that makes the book’s instrument
visible as an *utterance*. That is the right to exist. Protect that. It is currently a
caption on five specimens.

What does *not* earn the slot is a well-labelled gallery of empty commits in repositories
the reader has already visited.

All five names are reunions. PHP is 06’s empty tree and 12’s `Fix typo`. Swift is 08’s
Saturday night. OpenSSL is 14’s Dual EC (and 01’s Debian). FFmpeg is 11’s revert. Node is
13’s promises. A reunion is legal if the *object* is new and the Tuesday is inhabited. A
reunion of captions is a clip show. Ferenc at 2:08 is not Rasmus’s blank line. Hugo’s four
MARKERs are not Dual EC. Zhao’s hollow backport is not the fork. Rod Vagg clearing a queue
is not Ryan deleting `lib/promise.js`. Those Tuesdays are already in the receipts. They are
not yet on the page.

The reader of 06 has already seen identical trees. Python’s first two commits share a
snapshot, and the draft of that chapter said, in so many words, that commits which change
nothing are what conversion robots leave behind. PHP’s founding object in that chapter is
the empty tree — a genesis with no world in it. This photograph will feel like those until
a human name and 2:08 and a subject that *confesses purpose* land. That is the turn, and it
is already in the open, and it is currently spent as jacket copy:

> This is the thing the rest of the book has been circling without naming: a commit is not,
> fundamentally, a change.

Do not write “as we saw in chapter 06.” Do not write “unlike the conversion leftover.” Do
not write “circling without naming.” The 2 a.m. name will distinguish an empty *commit*
from an empty *tree* if you let Ferenc exist as a man with a mirror to wake, not as the
occasion for the ontology. The rhyme is the book’s. Naming it is a trailer.

**The three-way taxonomy is a real structure. The form is a listicle.**

Doorbell, marker, receipt. That is not three flavors of trivia. It is three addressees:

- a *machine, now* — wake up and look
- a *human, later* — you are here
- a *ledger* — this was handled

Three illocutionary acts, one object (tree hash equals parent tree). That is the same
defense chapter 06 used (group by mechanism, not by fame) and the same defense chapter 08
used (three answers to one question). Keep all three categories. Keep all five names on
the tour. Cutting a category to “sharpen” the set will not sharpen it. What blurs the set
is treating every name as a room, and naming the taxonomy in the doorway before anyone has
knocked.

A tour chapter cannot inhabit five Tuesdays in this band. TEMPLATE.md still wants a room.
The honest shape is: **one inhabited room per speech act, postcards for the supporting
names.** PHP is already the doorbell’s room (2:08, same hash twice, the subject that is
the title) and it is currently a briefing. OpenSSL’s four MARKERs are the marker’s room,
and they are currently a caption. FFmpeg’s bug-fix subject on an empty tree is the
receipt’s photograph, and it is the one reveal in the back half that currently works.
Swift is a postcard (the twin, the locked room). Node is a postcard (the echo, twelve
minutes). The listicle feeling is what happens when five specimens arrive at the same
volume, each introduced as a new kind (“The second thing an empty commit can say,” “The
third thing is the strangest”), after a paragraph that promised four.

That is a docent walking a gallery. Stop promoting postcards. Sit in the rooms. Do not
cut Swift. Do not cut node. Do not merge doorbell into marker (a robot is not a future
reader). Do not merge marker into receipt (a chapter break is not paperwork). The cut is
right. The *delivery* is a list.

---

## 1. Structure and pacing

### The order of speech acts is right. Do not reshuffle the argument.

Doorbell → marker → receipt.

Machine, then future human, then ledger. You cannot put receipt first: the strangest
specimen (a subject that looks like work) has nothing to be strange against until we have
seen emptiness said plainly. You cannot put marker first: the open *is* the doorbell, and
leaving Ferenc to start on Hugo would make the title a caption on a chapter about
OpenSSL. You cannot end on the doorbell: `--allow-empty` as a tool is paid by all three,
and the examiner habit (do not trust the message; check the tree) is born from the
receipt. Chronological-by-repo would be a listicle. Famous-to-obscure would be a
listicle. This is not that. Keep the order.

What the order is not doing is *pacing*, and the pacing problem has a name: the doorway.

### The open earns the same hash. It spends the chapter.

TEMPLATE.md: drop the reader into one concrete moment, ideally the thing that will turn
out to matter, shown before we know it matters. You did, for one screen. 2:08, a Thursday
in May 2015, a release manager, two tree hashes that match. The reader who does not know
`^{tree}` still sees the same hex twice. That is the photograph. Protect it. It should
have whitespace after “The same hash, twice.” It does not. It is the hinge of a paragraph
that immediately teaches what a tree is, names *empty commit*, ranks PHP, quotes the
title, italicizes the title, announces the ontology, explains the mirror, names Ferenc,
coins the doorbell, and then issues a four-item tour contract.

Two photographs, not one, which is why “earn or announce?” is a real question.

**What the reader can see.** Two hashes, identical. A subject that says `empty commit to
trigger a github mirror`. A time of night. A human name. The same-hash is the earn. Let
it sit. The subject is the second photograph, and it is the title, and it should land as
a `show -s` line the way chapter 08 let `nothing much to see here` land as a `git log`
line — *after* a beat in which emptiness is a fact, not a thesis.

**What the open announces anyway.**

> This is the thing the rest of the book has been circling without naming: a commit is
> not, fundamentally, a change. A commit is an *event* — a new node in the graph, with
> an author, a timestamp, and a message — and the change it carries is optional.

Jacket copy. Book-consciousness. Thesis. *Event* in italics. Then Ferenc is allowed to
need the mirror, which is the room, in the leftover of a paragraph that has already
spent him as an illustration. Then:

> Once you can see one empty commit, you start seeing them everywhere, and they turn
> out to be a small, honest language of their own — a way people use the commit itself,
> never its contents, to say four different things.

Headcount. Wreath (`honest language`). Arithmetic tell: four things, three headings.
Chapter 06 put “this chapter is that ritual performed on six projects” in this slot and
was told to cut it. Chapter 08 put “Git is a container for history, so each company had
to decide what history *is*” in this slot and was told to cut it. Chapter 15 put “This
chapter is about what happened to that hack over the next thirty-three years” in this
slot and was told to cut it. This is that sentence, with a doorbell in it.

**Move:** delete the circling/ontology paragraph and the four-things paragraph from the
doorway. Stay with 2:08 through the same hash, the subject, the mirror, and the knock.
*Then* Swift as a twin, without “of all places” and without a CI primer that reteaches
the doorbell. Hugo last of the human rooms, without “the second thing an empty commit
can say.” The law can sit once, after we have seen one knock, or after the receipt has
complicated emptiness, or at home, where it is a habit. It cannot be the contract of
paragraph four.

### Consecutive-open is clean. Protect its temperature.

Chapter 15 opened on a number in a file (`0.3333333`, then a shout in a neighboring
blob). This opens on a clock, then a `rev-parse` of two trees. Different objects.
TEMPLATE.md’s only structural rule is satisfied. A reader will still feel a *lecture
after the photograph* if the tree-primer and the thesis occupy the same breath as the
hashes. The object can survive if it is *only* the object: 2:08, same hash twice, the
subject. Do not also open on a comment (pays 15). Do not open on Hugo’s four-line log
(pays the marker). Do not open on the ffmpeg subject (pays the receipt, and it is the
one later surprise). Do not open on `--allow-empty` (pays the close). The title is a
knock. The open is two hashes that should not be the same. Let them meet in Ferenc’s
mouth, not in a proverb.

### PHP is the right cold-open exhibit. It is a caption on itself.

The doorbell *is* the chapter’s instrument, and it has to be in the doorway because
Swift will rhyme it and At home will hand `--allow-empty` over as the same knock, on
purpose. What is thin is the Tuesday. “Ferenc Kovacs had nothing to fix; he needed the
mirror to *notice* something” is the right sentence, and then he has already
manufactured pure notice. TEMPLATE.md: reconstruct what the actor knew when they typed.
The reader should think “I might have done this.” Right now they think “ah, an empty
commit to trigger a mirror,” which is the title, confirming itself.

Sit for four to eight sentences in the choice — PHP’s real home is its own server;
GitHub is a mirror that wakes on a new commit; it is 2:08; the bytes are already
right; the world that looks at GitHub will not see the release until the mirror
notices — and stop before you tell us a commit is an event. The knock will do the
ontology. Fairness to the man at the keyboard lives here, not in a preface that then
says *fundamentally, a change*.

Do not invent the specific release. The receipts have a release manager, a timestamp,
a subject. Use them. “Something” is currently a hole in the only inhabited clause the
open has.

### The doorbell section is a postcard wearing a heading.

PHP was the room. **The doorbell** is Swift, and Swift is the right twin, and it is
the right length once the CI glossary dies. `Empty commit for CI` is the same speech
act, said even more plainly. The leftover image is already a keeper:

> The doorbell got left ringing in a room that got locked.

Protect that. Do not explain it. Do not also land “aimed not at a human reading the
history but at a machine watching the graph” as a second landing; the locked room is
the landing, and the addressee (machine, not human) is the hinge into Hugo, one
clause, not a recap of PHP.

“of all places, the Swift compiler” is a nudge at a reunion. Starve it. The reader
who remembers chapter 08’s Saturday night does not need to be told Swift is a
surprising house for a doorbell. This is a different object (a stale `eng/` branch,
2021, CI). Do not discover Swift. Do not mint the empty tree again. Do not name
Lattner. The reader has a memory. Here the empty commit is a scratch branch someone
spun up to make the robots run. That difference is the postcard. It only works if you
do not reteach continuous integration as if the PHP mirror had not already been a
robot watching the graph.

### The marker is the jewel. The heading and the floor plan spend it.

Four subjects, two seconds, `MARKER: End of Phase N`. That is this chapter’s
photograph of a human talking to a future reader, and it is the one specimen that
cannot be mistaken for a CI trick. Keep all four lines. Keep “seconds apart.” The
identical clocks (10:27:13 twice, 10:27:14 twice) are a batch, and the batch is the
Tuesday: he had the phases, he typed the table of contents into the graph, he allowed
empty, he did it in two seconds because the dividers are not the work.

Right now the section opens:

> The second thing an empty commit can say is *you are here*.

Verdict before the log. Then “a long, dangerous restructuring,” which is a caption on
scale. Then the log, which can only confirm. Then the each-each-each sentence (see
Prose) that names Phase 2 and Phase 3 of a four-phase refactor in one italic. Then a
seminar about pull-request descriptions and “as we keep seeing.” Then the ~, which is
the open’s thesis, returning.

**Move:** cut “The second thing an empty commit can say.” Open on the four-line log,
or on 10:27. Stop. Four titles, two seconds, no files changed. Then sit in the
refactor the way chapter 08 sat in Rich Turner’s plaque: a hundred files, phases that
would otherwise smear, six months later a reader of `git log` who will not open the
design doc. I might have done this. Stop before *you are here*. The subjects already
say MARKER. The table of contents *is* the room.

Do not add a QUIC primer. Do not add Hugo’s biography. Do not explain what
`QUIC_PORT` was. The titles are the photograph. The room is why a dangerous
restructure needs chapter breaks *in the graph*.

### The receipt is the turn of the back half. FFmpeg earns it. Node repeats it.

FFmpeg is the right order: a subject that is a real bug fix, then the same-hash, then
empty, then the cherry-pick trailer. That is the book’s trick — feel it a beat before
it is named — and it is the only later exhibit that currently does it.

It almost fumbles the beat:

> That is not the subject of an empty commit. That is the subject of a real bug fix

Teacher with a pointer. The assignment is to drop them into a persuasive subject and
let the `rev-parse` hollow it out. You told them it was a trick, then showed the
trick. Cut the two sentences. Print the subject. Print the identical hashes. Then,
once, receipt. “The paperwork of the backport outlived the work of it” is the keeper.
Give it whitespace.

Node is the same act, cleaner as a DAG (ancestor, twelve minutes, same author date,
two commit dates) and currently a second landing at full volume. “the purest version
of the same act” is a purity ranking, the cousin of chapter 15’s “there is a purer
example.” Cut *purest*. Cut “the first hectic days of the project’s new governance,”
which is magazine and a caption instead of a room. The photograph is two subjects
that match, twelve minutes on the committer clock, `merge-base --is-ancestor`
printing a sentence. Keep that. One paragraph. “Git preserved both — the deed and
its echo.” Keep that. It is a keeper. Do not also sit in io.js governance. The prompt
did not ask for a third room, and the receipts do not owe you one.

If, after Ferenc is a room and Hugo is a room, the back half still lists, node is the
name to demote further — not because it is weak, but because ffmpeg already taught
the hollow subject, and the ancestor is then a rhyme, not a recap. Do not cut node.
The echo is this chapter’s leftover-image for the receipt the way the locked room is
the leftover-image for the doorbell.

### Headings: the right argument, the wrong spoiler

`The doorbell`, `The marker`, `The receipt`, `At home`.

For a tour, mechanism headings *are* the thesis. They are better than `PHP`, `Swift`,
`OpenSSL`. They are also verdicts before photographs. That is tolerable if the first
sentence of each section does not *also* name the verdict. Right now both happen.
Pick: headings as labels, photographs first in the prose.

`The doorbell` can stay if Swift starts on Anders’s subject, not on “The PHP knock
has a twin.” `The marker` can stay if Hugo starts on the four-line log, not on
*you are here*. `The receipt` can stay if Zhao starts on the rtmpproto subject, not
on “the third thing is the strangest.”

`At home` stays. It is the book’s convention.

### First person is almost absent, and the I that exists is the book

The engineer: not here. This narrator runs `blame` daily and is walking you through
an obsession. Fifteen chapters have earned an I at the instrument. This chapter’s
instrument is comparing two trees. One I belongs on the same-hash, or on
`--allow-empty`, not both:

> I asked the commit what it changed. The tree said nothing.

That is not a personality. That is the tool. Opinions are allowed; the draft’s
opinions currently arrive as omniscience (`fundamentally`, `honest language`,
`the strangest`, `purest`).

The book: “the rest of the book has been circling without naming.” “as we keep
seeing.” One pair of hands, two places: at both hashes (already, as method), and at
At home. Then get out of the way. Do not add memoir. Do not add a census. Do not add
a circling-I that spends the ontology so that Ferenc cannot.

---

## 2. The mechanism

**Clean as a photograph. Triple-landed as a primer. Do not add a lesson. Cut two of
the three namings.**

The prompt asked whether tree-equals-parent-tree is explained for a non-expert the
first time, without boring an expert. The answer is: the command already explains
it, and the prose then explains it three more times.

Present, after the `rev-parse`:

> The same hash, twice. A git commit points at a *tree* — a complete snapshot of
> every file — and this commit’s tree is byte-for-byte identical to its parent’s.
> Nothing was added, changed, or removed. It is an empty commit: a new, permanent
> object in the history of one of the most widely deployed languages on earth, that
> alters not a single line of it.

A non-expert can hold that: same snapshot, nothing changed, and they named it empty.
An expert is not bored *if* we stay at 2:08. The expert is bored because the
photograph (`a064a669…` twice) already said it, “byte-for-byte identical” said it,
“Nothing was added, changed, or removed” said it, and “alters not a single line”
said it again, and then we still have not sat in the release. That is the same
volume problem as chapter 15 reteaching selectivity after the `XXX` had already
said the guess was wrong.

Keep: “The same hash, twice.” Keep one sentence that a commit points at a snapshot,
and this snapshot matches its parent. Cut the rest of the triple. Cut “one of the
most widely deployed languages on earth,” which is puff, the cousin of chapter 15’s
“large slice of the world’s applications.” PHP can be php-src. The 2 a.m. is the
scale.

Do not explain `^` versus `^{tree}`. The sentence before the command already
translated it: “compare the snapshot this commit stores against the snapshot its
parent stores.” That is the non-expert’s grammar. The expert reads the command. Do
not add parent pointers, object databases, or a diagram of a commit object. Do not
add `git cat-file -p` of the commit to show the `tree` line. Chapter 06 already
printed a commit object raw, and it was PHP, and it was the empty tree. Re-printing
it here would blur the two emptinesses the open has to keep apart.

Swift and ffmpeg repeat the `rev-parse`. That is the book’s method (proof each
time, not a citation). Fine. Node correctly switches photographs (`merge-base
--is-ancestor`). Keep that switch. Do not also `rev-parse` node in the prose; the
receipts already have it.

At home may re-teach the check in one command, which is the habit. It may not
re-teach what a tree is.

The one distinction the primer currently fails to make is the one the series
already earned: this tree is not empty. It is a full snapshot that happens to
match. Chapter 06’s PHP open was nothing at all (`4b825dc642…`). This hash is
`a064a669…`, twice. A reader who has been through 06 will, for one beat, think
*empty tree again*. Let the hex be different on the page and the subject be a
human’s, and do not write “this is not the empty tree.” The different hex is the
distinction. Naming it is a seminar.

---

## 3. Is the taxonomy the right cut?

**Yes. Do not merge. Do not drop a category. Starve Swift and node until they are
postcards. The “four” is a counting error, not a missing kind.**

Doorbell is not marker. A GitHub mirror and a CI robot are the same addressee
(machine, now). A MARKER in a QUIC refactor is a different addressee (human, later).
Merging them would get you “empty on purpose” as a single bin, which is the scout
report, not a chapter.

Marker is not receipt. “You are here” is a divider a person plants in their own
work. “This was handled” is paperwork that a patch was considered, even though the
bytes were already home. One is a table of contents. One is a ledger. The ffmpeg
subject that looks like a fix is only strange because we have already seen emptiness
*confessed* (PHP, Swift, MARKER). If you merge receipt into marker, you throw away
the examiner habit At home wants to hand over: a message that promises a change can
sit on an empty tree, and that is not fraud.

Could Swift go? Then doorbell is only the open. The twin is how a speech act becomes
a practice rather than a PHP quirk, and the locked room is the leftover-image. Keep
the name. Demote the section. One paragraph, or a clause at the end of Ferenc.

Could node go? Then receipt is only ffmpeg. The ancestor is the DAG-proof that the
second landing is an echo, and “the deed and its echo” is a keeper. Keep the name.
One paragraph.

Could ffmpeg go? No. It is the only specimen whose subject does *not* confess
emptiness. Without it, the examiner habit has nothing to be born from. PHP, Swift,
and Hugo all say empty or MARKER in the subject. Zhao says `fix listen_timeout`.
That is the turn.

A fourth category is not hiding in the receipts. Accidental empties, merge commits,
notes, tags: different objects, and “None of these is a mistake” would then have to
become a court. The three-way is the argument *because* it refuses the oops-bin.
Fix the count. Do not hunt a fourth thing to make the sentence true.

---

## 4. The ~ beat

**Keep the thought. Starve the second sentence. Move it off the markers. A second
is earned after the receipt, and it is a different thought.**

Present placement, after Hugo, before Zhao:

> ~ A commit is an event with an optional payload. Take the payload away and the
> event is still there, which is sometimes the whole point.

The ~ is the right thought in the wrong neighborhood, wearing the open’s coat, and
already spent.

**Spent.** Paragraph four named *event*, named optional, named the graph, named
author and timestamp and message. The knock said “pure notice.” Swift said “wake up
and look.” Then the ~ says event, payload, still there, whole point. Named,
demonstrated, italicized, *then* felt as a caption. Same disease as chapter 13
putting “never existed” after the folklore had been caught, chapter 14 putting
“certificate outranks the fix” after the FIPS constitution, and chapter 15 putting
“a number wrong long enough is a contract” after *conservative* and “not the same
thing as a bug.”

**Wrong neighborhood.** After the markers, “optional payload” is true and dull.
Markers *are* titles without files; the reader already has that. The thought becomes
sharp only when a payload is *claimed* and still absent. That is Zhao. That is the
rtmpproto subject on an empty tree. Until then, empty means what the subject says.
After Zhao, empty can lie — or rather, the subject can speak a change the tree
refuses to second. That is when “optional payload” stops being a CI trick and
becomes an ontology.

**Slightly long.** Two sentences. Keepers in this book are one. “Take the payload
away and the event is still there, which is sometimes the whole point” is the
narrator glossing the proverb. The first sentence is the proverb.

**Move nothing of the thought; move the tildes.** Cut the circling-paragraph so the
thought is available. Then pick one:

**A. One ~, after the receipt, starved.** Print Zhao’s identical hashes, the
cherry-pick trailer, “the paperwork of the backport outlived the work of it.” Then:

> ~ A commit is an event with an optional payload.

Do not take the second sentence. Do not say *fundamentally*. Do not say *speech
act* in the same breath; that word can live once in At home or not at all.
*Event* and *payload* are this narrator’s register. *Speech act* is Austin, and it
is a seminar.

**B. Two ~s, two thoughts.** First, after Ferenc’s knock, starved, once the same
hash has been felt and the subject has been allowed to sit:

> ~ A commit is an event with an optional payload.

Second, after Zhao (or after node’s echo), a *different* thought, the examiner’s:

> ~ The message is a speech. The tree is a fact.

Or:

> ~ A subject is not a diff.

I would take B if the open is stripped, because the ontology wants to happen at the
knock (the title’s specimen) and the examiner wants to happen at the hollow fix (the
specimen that does not confess). I would take A if you only have one tilde in you,
and then it must wait for Zhao. Do not leave it on Hugo. Hugo’s law is already in
his subjects. Wrapping MARKER in a proverb is a wreath on a wreath.

Do not add a third. Candidates that should not get tildes: the knock (the title is
already the knock; the image “a knock on a door with no one behind it” is already
the ~ without tildes); the locked room (an image; tildes would caption it); “the
deed and its echo” (already a sentence); `--allow-empty` (a command; At home is the
landing); “sometimes the most useful thing it can do is exist” (the last line; a ~
there is a TED closer on top of a closer).

The current ~ has to die on Hugo either way. It is the open, returning, in the one
section that had a chance to be a room.

---

## 5. Title

**Keep “empty commit to trigger a github mirror.” Stop explaining it. Let it look
like a PHP trick until the language appears.**

It is the right title for the book and the right title for a tour. It is not
folklore (“The Empty Commit,” “Speech Acts,” “Allow Empty”). It is an object.
Ferenc’s own subject, 02:08 on 28 May 2015. House style: `Initial revision`,
`Nothing much to see here`, `THIS IS A HACK TO GET V4 OUT THE DOOR`, `Fix typo`.
The title is a mouth, not a thesis.

The double *is* available, and it is currently unpaid. We think it means a quirky
2 a.m. hack to poke GitHub. Doorbell spends the hack as a speech act aimed at a
machine. Marker spends emptiness as a table of contents. Receipt spends emptiness
as paperwork, and the subject no longer even says empty. By the close,
`--allow-empty` is the same knock, on purpose, in the reader’s repo. That is a flip
in the same family as chapter 08: a shrug that was also a museum, a dump, and a man
alone with `int main() { }`. Here: a mirror trick that is also a language.

The title only gets to do that work if the first screen does not explain the
language.

Right now a reader sees `empty commit to trigger a github mirror` on the contents
page, then is shown two hashes, then is shown the subject again, then is told a
commit is not a change, then is promised four things. The title has confirmed
itself, twice, before Swift has rhymed it. Chapter 08 put “the reason this chapter
has the title it has” in this slot and was told to cut it. This is that payment,
without even waiting for a heading. The title plus the `show -s` is the setup.
Hugo and Zhao are the widening. The close is the flip: the thing Ferenc typed at
2:08 is a tool you can use. Do not narrate the flip in paragraph four. Do not
italicize the subject as a title after the command has printed it. Let them see
`empty commit to trigger a github mirror` in the `git show` output. They will feel
the contents page. Then the knock. Then Swift, then Hugo, then Zhao. Then, at the
last line, exist.

Three risks.

**The title explains PHP in advance.** The reader who sees the phrase on the
contents page, then meets it at 2:08, is confirming a label. That is acceptable for
a title-as-trap: we think it means a mirror hack, the tour reveals a language, the
close reveals a tool. It is not acceptable if the open *also* says this is the
thing the book has been circling. The trap works once. You currently spring it
before the first heading.

**Wrong center.** The event of the open is two hashes. The event of the leftover is
a cherry-pick trailer on a hollow fix, or a doorbell in a locked room, or
`--allow-empty`. The title sits on PHP. That is a two-center chapter, which a
three-act tour is allowed to be, as long as the title is the argument (a commit can
be pure notice) and not a caption on one doorbell. Hugo and Zhao are how the title
stays the argument. If the chapter is only Ferenc, the title is a one-liner. Keep
the taxonomy; cut the floor plan; the title will hold.

**Unpaid flip.** If the close keeps “Sometimes the most useful thing it can do is
exist” after the open has already said a commit is an event with an optional
payload, the flip is a restatement. Expansion below is how the title stops being a
stamp and becomes a turn: sit in 2:08, show the subject, do not name the ontology,
let Swift/Hugo/Zhao widen it, let the close do one job.

I would not use the alternatives unless the open stays a thesis dump, in which case
the title cannot flip and should not pretend to.

Alternatives, in order, if you change it:

1. **A knock on a door with no one behind it** — the open’s keeper image, viscerally
   this book, no trap. Loses Ferenc’s mouth. The title you have is a human.
2. **--allow-empty** — the close’s tool, the habit, drier. Lab on a contents page.
   Best if you decide the method is the chapter. Loses the 2 a.m.
3. **The deed and its echo** — receipt-only, too pleased.

I would not use “The empty commit” (thesis as title, folklore). I would not use
“An event with an optional payload” (the ~ as a title; chapter 06 was told not to
title the séance). I would not use “The doorbell” (one category). I would not use
“you are here” (Hugo only).

Keep Ferenc’s subject. Stop italicizing it. Let the knock, then the language, then
the last line, do the work.

---

## 6. Prose

Keepers, already, for the series. Do not sand them.

> The same hash, twice.

> a knock on a door with no one behind it

> The doorbell got left ringing in a room that got locked.

And two that are almost keepers, and will be if the seminar around them dies:

> The paperwork of the backport outlived the work of it.

> Git preserved both — the deed and its echo.

A sixth, the leftover as a last line:

> A commit does not have to change the code. Sometimes the most useful thing it can
> do is exist.

And a seventh, which is the chapter’s law, currently in the doorway and again as a
~, where it cannot be a discovery:

> a commit is not, fundamentally, a change. A commit is an *event* … and the change
> it carries is optional.

Move it. Starve it. Do not sand it.

### The clunkiest sentence

> Once you can see one empty commit, you start seeing them everywhere, and they
> turn out to be a small, honest language of their own — a way people use the
> commit itself, never its contents, to say four different things.

Tour contract, wreath, em dash, and a count the chapter cannot cash. The reader who
just heard a 2 a.m. doorbell is now being enrolled in a language course. This is
the last prose of the open. It cannot be a syllabus.

Rewrite: delete.

Then start **The doorbell** on Anders’s subject, or on the stale branch.

Runner-up, and the one that is clunk because it is three *each*es plus a miscount
inside the italic:

> Four commits, each carrying a snapshot identical to the one before it [R3], each
> changing nothing, each a signpost planted in the history to say *the work between
> here and the last marker was Phase 2; between here and the next is Phase 3*.

Four markers. The italic names two phases. The reader who just saw Phase 1 through
Phase 4 in the log is now doing table-of-contents arithmetic in a relative clause.

Rewrite, after the log, as a room with a Tuesday in it:

> Four titles, two seconds, nothing in the trees. The work between the first marker
> and the second was Phase 2; between the second and the third, Phase 3. A refactor
> that would otherwise be a smear becomes a book, and the chapter breaks are empty.

Then sit. Then stop. Do not also say pull-request descriptions. Do not also say
“as we keep seeing.”

Third, the doorway’s ontology:

> This is the thing the rest of the book has been circling without naming: a commit
> is not, fundamentally, a change.

Rewrite: delete. The knock is the naming. The ~, later, is the proverb. You do not
need a theory of circling.

### The paragraph doing the most work

The open, from 2:08 through the knock, if the ontology and the four-things die:

> At 2:08 in the morning on a Thursday in May 2015, a PHP release manager made a
> commit to php-src. Ask git what it changed — compare the snapshot this commit
> stores against the snapshot its parent stores:

Then the `rev-parse`. Then “The same hash, twice.” Then one starved sentence of
snapshot-matches-parent. Then the subject, undiagnosed. Then the mirror, Ferenc,
nothing to fix, the knock, a 2 a.m. doorbell. Stop.

That sequence is the chapter’s unique archaeology: a famous language, a human hour,
two hashes that match, a subject that confesses purpose. The command is the method.
The knock is the image. They do not tell us what to feel about the rest of the
book. They do not prosecute emptiness as a trick. They let a `rev-parse` be a way
of looking, and they let the title sit as a subject line in a man’s mouth.
Everything the doorway is trying to do with *event* and *optional* and *four
things*, this one does by looking at two blobs at 2:08.

Runner-up, if ffmpeg is allowed to arrive without “that is not the subject of an
empty commit”: the rtmpproto subject, then the identical hashes, then the trailer.
That is the center of the back half as a photograph. It is currently a briefing
about hollowness with the photograph inside it.

Honorable mention, because it is already the right volume:

> The doorbell got left ringing in a room that got locked.

Keep ringing. Keep locked. The sentence that follows about both doorbells being
*wake up and look* is the method, one clause early, and then the marker section
says *you are here* as if we needed the floor plan. Let the locked room be the
doorbell’s last image, and let Hugo start on 10:27.

### The paragraph pulling its weight least

The four-things paragraph in the open (see above). It does not belong to Ferenc’s
first four minutes, it issues the listicle contract, it spends the thesis, it
miscounts, and it costs the clock-open its temperature.

Second-weakest: At home’s first paragraph, from “None of these is a mistake”
through the recap of *wake up*, *you are here*, *this was handled*. See Close.

Third: the Swift CI glossary (“Continuous integration — the automated system that
builds and tests a project — is triggered by new commits, so when you need it to
run and have nothing to change, you commit nothing, on purpose”). The subject
already said `Empty commit for CI`. PHP already said trigger. The locked room is
the news. The glossary is a textbook caption on a postcard.

### Other prose notes, shorter

- `[R1]` through `[R5]` on the reading surface: same note as 01–15. Quiet them.
  The trailing list is the right place. A reader must be able to see the same hash
  twice without holding locators in their head.
- Italics as elbow: *tree*, *event*, *notice*, *wake up and look*, *you are here*,
  *already there*, *receipt*, *speech act*. You have earned about two of those.
  The italic on *event* is the right one if the circling-paragraph dies and the ~
  does not also have it. *notice* in “pure notice” is a finger; the knock image
  does not need it. *speech act* in At home is a seminar word; *event* already did
  the job.
- “one of the most widely deployed languages on earth”: magazine. Cut.
- “of all places”: a nudge at a reunion. Cut.
- “a small, honest language of their own”: wreath. The specimens are the language.
- “long, dangerous restructuring”: caption on scale. Sit instead.
- “as we keep seeing”: teacher. Cut.
- “the strangest, because it looks the most like real work and is the most
  completely hollow”: verdict before the subject. Cut. The rtmpproto line is the
  strange.
- “the purest version”: purity ranking. Cut.
- “the first hectic days of the project’s new governance”: magazine. Cut, or let
  December 2014 be a date.
- “None of these is a mistake, and that is the point worth carrying”: the
  sneer-guard talking. If the rooms are inhabited, the reader already thinks I
  might have done this. You do not have to acquit the specimens.
- Tense: present-in-the-repo is right for what the clone still holds (the hashes
  still match; the stale branch is still stale). Past for the Tuesdays (2:08; 10:27;
  twelve minutes). After the doorway census is gone, do not slide Ferenc into “a
  commit is an event.” He knocked.
- “Git kept it forever, because git keeps everything”: true, and a hair of the
  narrator pleased with git. Once. Not again at node (“Git preserved both”) unless
  you keep only the second, which is the better sentence.
- First person is allowed and this chapter has almost none, except the book’s I.
  That is why the opinions read as a docent. One I at the hashes, or at
  `--allow-empty`. One landing.

---

## 7. Open and close

### Cold open — the right object, then a gallery map

What works: 2:08, the `rev-parse`, the same hash twice, the subject, the knock, the
2 a.m. doorbell. What fails: the tree-primer stacked three deep; “widely deployed”;
the circling/ontology paragraph; the italic title after the command has printed it;
the four-things syllabus; then “The PHP knock has a twin.”

Stronger version, same object:

> At 2:08 in the morning on a Thursday in May 2015, a PHP release manager made a
> commit to php-src.

Then the command. Then:

> The same hash, twice.

Then one sentence of snapshot-matches-parent. Then the `show -s`. Stop. The title
is on the page. Then the mirror, the Tuesday, nothing to fix, the knock. No census.
No circling. No *event* yet. Swift can start with an Apple engineer on a branch
nobody merged, which is when a twin is a photograph and not a hinge.

Do not open on Hugo (pays the marker). Do not open on Zhao’s subject (pays the
receipt; also a `show -s` after chapter 12’s `show -s` of a PHP header, and this
book has already opened PHP that way). Do not open on `--allow-empty` (pays the
close). Do not open on the empty tree (pays chapter 06, and blurs the two
emptinesses). The title is a knock. The open is two hashes that match. Let them
meet at 2:08, not in a proverb.

Consecutive-open is already a clock after a comment. Protect its temperature by not
also being a lecture.

### At home — the right two habits, then the tour as a worksheet, then the right last line

The habits are right. Two is the book’s number.

1. When a message promises a change, check the tree.
   `git rev-parse '<commit>^{tree}' '<commit>^^{tree}'` — or `git show --stat` and
   an empty file list.
2. `--allow-empty` as a tool: trigger a pipeline, mark a boundary, record that a
   thing was decided.

That is this chapter’s `git log -S`, born from Zhao’s hollow subject and Ferenc’s
knock. TEMPLATE.md wants it woven, not boxed. You have not boxed it. You have
listed the three speech acts first:

> People reach for one when they need to say something to the graph that has no
> natural home in a file: *wake up* to a mirror or a CI robot, *you are here* to a
> future reader lost in a refactor, *this was handled* on a branch where it turned
> out there was nothing to handle.

That is the tour, restated as homework. Chapter 06’s At home was the tour as a
worksheet. Chapter 08’s was the same shape. This is the same shape. The reader who
has been on the tour does not need the tour again. The reader who wants a checklist
can use the receipts.

Then two commands in one paragraph, which is almost the weave, except `git show
--stat` and `rev-parse` are two ways to say the first habit, and “or, more
precisely” is the narrator fussing. Pick one command for the examiner. I would pick
`rev-parse` of the two trees, because that *is* the conceit, and `--stat` is the
quiet version a person already knows. Mention `--stat` as a clause, not as a
competitor.

Then the last line, which is the last line:

> A commit does not have to change the code. Sometimes the most useful thing it can
> do is exist.

Stronger close:

1. Last story image: Zhao’s trailer on a hollow fix, or the doorbell in the locked
   room, or Ferenc’s 2 a.m. I would pick the hollow subject if the receipt has been
   allowed to be the third act, because the close then pays the examiner *and* the
   title (emptiness that no longer even says empty) without a recap. The locked
   room is the doorbell’s leftover and already landed.
2. One woven paragraph, two habits not three: when a message promises a change,
   compare the trees. Then `--allow-empty` when you need the graph to hear you and
   have nothing to put in a file. Two clauses, off Zhao and Ferenc, not a manual.
   Do not reprise Hugo’s phases. Do not say speech act if the ~ already said event.
3. Last line, keep and isolate: “Sometimes the most useful thing it can do is
   exist.” Cut “None of these is a mistake.” Cut the three-act recap. Cut “A
   commit is a *speech act*, not a diff” if you have to choose between that
   sentence and the last line; the speech-act sentence is the register, and it is
   good, and it is currently the start of a seminar in front of the last line. I
   would keep *event* in the ~ and let *exist* be the last line, with whitespace
   between the command paragraph and it. I would not keep both stacked on *speech
   act*.

`--allow-empty -m "…"` is the right last command. It is the title, as a tool. Do
not explain the flag. The chapter *is* the explanation, if the open has not already
been one.

---

## 8. Word count, cuts, rooms

1,468. Under the floor by seven hundred, and under the two earlier cross-repo
chapters by five to seven hundred more (06 shipped at 1,946; 08 at 2,155). Recent
neighbors have landed short on purpose — 15 is 1,636; 13 and 14 sat in that band
too — and were still told to sit in the Tuesday the captions skipped. This is not
chapter 03 (lean-and-right on eight commits). This is a tour whose postcards are
excellent and whose rooms are thin. Lean-and-right would mean two Tuesdays
inhabited, Swift and node as postcards, the leftover the last image, the ontology
said once, the title flipped once. Right now the tour is a briefing with excellent
photographs glued to it.

The official cap is not the job. Do not chase 3,200. A five-repo chapter that fills
the cap becomes the listicle you are trying not to write. Landing around 2,000–2,400
is the previous cross-repo length, honest, after the doorway census dies and two
rooms exist. If it comes out at 1,900 because two rooms were short paragraphs and
the syllabus was cut, that is closer to honest than padding to 2,200 with a third
category. The band is a band, not a dare.

### Cut, in order of what they buy

1. The circling/ontology paragraph in the doorway.
2. The four-things syllabus (and the count).
3. The triple landing of “nothing changed,” the widely-deployed puff, the italic
   title after the command.
4. Swift’s CI glossary; “of all places”; “The PHP knock has a twin”; “same shape,
   same purpose.”
5. “The second thing an empty commit can say”; “the third thing is the strangest”;
   “the purest version”; “hectic days of new governance”; “None of these is a
   mistake”; At home’s three-act recap; the ~ on Hugo.

That is several hundred words. Spend them in two places, not five.

### A. Sit in the 2 a.m. knock (the open, after the subject, before Swift)

Right now: timestamp, command, primer, empty commit named, title, ontology, then
Ferenc has already manufactured pure notice.

Add four to eight sentences that are only what a release manager at 2:08 knows.
The real home is the project’s own server. GitHub is a mirror. The mirror wakes
when it sees a new commit. The bytes are right. The world that looks at GitHub
will not see this until the mirror notices. He has nothing to put in a file. He
types a subject that is the entire payload and allows empty. I might have done
this. Stop before *event*. Stop before *fundamentally*. The knock is the ontology,
and it already happened as an image; here we need the reasonable Tuesday or the
doorbell is a caption.

This is the non-negotiable from CONTEXT.md (“I might have done this”) and it is
how the title stops being a one-liner confirming itself.

Do not invent a version number the receipts do not have. Do not send him to a
history of PHP’s GitHub mirror. The subject is the interior.

### B. Sit in the chapter breaks (The marker, after the four-line log, before the ~)

Right now: second-thing, long-dangerous, the log, each-each-each, pull requests,
spelunking, the ~.

Replace the floor plan with 10:27. Four titles, two seconds. A refactor of the
QUIC stack that will be unreadable as a smear six months later. The design doc is
a place people do not look while walking history. The graph is where they will be.
So the table of contents is four empty commits. I might have done this. Stop
before *you are here*. The subjects already say MARKER.

This is how the marker becomes a duration and not a caption, and it is the second
half of `--allow-empty` at home: not only wake a robot, mark a boundary.

### What not to add

- A sixth repository, a “what about linux,” a tour of every empty commit in
  `scout/`. Bitcoin’s empty phase-dividers are in a scout report; they would be a
  second marker, and Hugo is the marker.
- A primer on commit objects, parent pointers, or the empty tree. The photograph
  is two hashes. Chapter 06 owns `/dev/null`.
- “Unlike chapter 06.” “Unlike the conversion robot.” “The rest of the book has
  been circling.” The reader has a memory. The 2 a.m. name *is* the hinge.
- A QUIC networking explainer, `QUIC_PORT`, a biography of Hugo, a biography of
  Ferenc, io.js governance, a history of PHP’s self-hosted git.
- Zhao’s interior beyond the subject, the trailer, and the maintenance branch. The
  hollow fix is the photograph; a portrait is not.
- A fourth ~. A fourth category. Any sentence that begins “this chapter,” “four
  different things,” “the second thing an empty commit can say,” “the rest of the
  book,” or “none of these is a mistake.”
- A contrast-hinge with 06 or 08 (“after fake beginnings, empty events”; “after a
  costume, an utterance”). The reader has a memory. Do not write “the last
  chapter.”

The rooms are the missing seven hundred words. Starving the doorway, the glossary,
the floor-plan first sentences, the ~ on Hugo, and the At-home seminar is what
makes room for them. The open stays 2:08 and two hashes. Swift stays a locked
room. The ~ stays a starved line after Zhao, or two starved lines in two places.
Node stays an echo. Two inhabited hours, postcards for the rest. That is the
chapter 08 shape after the census died, and it is the right one.

The band is permission to sit. It is not permission to admire emptiness more
eloquently.

---

## Top 5 changes, by impact

1. **Do not issue a taxonomy contract in the doorway, and do not name the ontology
   before the knock.** Cut the circling/event paragraph. Cut “four different
   things.” Stay with 2:08 through the same hash, the subject, the mirror, and a
   knock on a door with no one behind it. Consecutive-open is already a clock;
   protect its temperature. This is the change that turns a well-labelled gallery
   into a chapter — and it is the change that lets the title flip once instead of
   confirming itself in paragraph four.

2. **Inhabit two Tuesdays, not five captions.** Ferenc at 2:08, nothing to fix, a
   mirror that will not notice (expansion A). Hugo at 10:27, four titles, two
   seconds, a refactor that needed chapter breaks in the graph (expansion B).
   Starve Swift to the locked room. Starve node to the deed and its echo. Do not
   add a sixth name. Do not add a fourth category. Do not chase 3,200.

3. **Place the ~ after the payload has been claimed and found absent — or split it
   into two thoughts.** Cut it off Hugo. Starve “Take the payload away… whole
   point.” One proverb after Zhao (ontology), or one after Ferenc and a second
   after Zhao (ontology, then “the message is a speech; the tree is a fact”). Do
   not restate paragraph four. Do not ~ the knock, the locked room, or the last
   line.

4. **Photographs before verdicts; ffmpeg without a pointer; mechanism once.** Cut
   “The second thing an empty commit can say is *you are here*.” Cut “the third
   thing is the strangest.” Cut “That is not the subject of an empty commit.”
   Print the rtmpproto subject, then the hashes, then receipt. Teach
   tree-equals-parent in one sentence, not three. Quiet `[R1]`…`[R5]`. Do not
   write “this is not the empty tree”; the hex is the distinction.

5. **At home as two habits, not a recap; one last line.** Cut “None of these is a
   mistake.” Cut the *wake up* / *you are here* / *this was handled* checklist.
   Weave `rev-parse` of the two trees and `git commit --allow-empty`. Isolate
   “Sometimes the most useful thing it can do is exist.” Keep the title. Stop
   italicizing it. Let `--allow-empty` be the title, as a tool.

---

## The single most important change

**Stop introducing the tour, and sit in the 2 a.m. knock until it is a Tuesday.**

Cut the paragraph that runs from “This is the thing the rest of the book has been
circling without naming” through “four different things.” Stay in 2:08 until Ferenc
has needed a mirror to notice, and has had nothing to put in a file, and has typed
a subject that is the entire payload. Then a stale branch where the doorbell is
still ringing. Then four MARKER titles in two seconds, a table of contents in the
graph, a man who might have been you. Then a bug-fix subject on an empty tree, a
cherry-pick trailer, an echo twelve minutes later. The three speech acts will be
visible. The title will widen once, at the last line, where it is already written
as a tool.

Everything else — the same hash twice, a knock on a door with no one behind it, a
doorbell in a locked room, chapter breaks that hold nothing but their own titles,
paperwork that outlived the work, the deed and its echo, `--allow-empty` at home —
will land if the reader has first watched two hashes match at 2:08, and has not
been told they are about to see a language of empty commits, and has not been told
that a commit is not, fundamentally, a change. That is the book. The census is
folklore in a nicer coat. Right now the folklore is in the doorway, the kernel of
the chapter is a gallery map, and the book is in the other room: `a064a669…` twice,
a release manager with nothing to fix, four titles at 10:27, a fix that changes
nothing, and a subject a man typed at 2 a.m. that turned out, without a contents
page to help it, to be the smallest possible thing to notice.
