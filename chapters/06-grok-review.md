# Craft review: “Initial revision”

Chapter 06, the genesis lie — six repositories, four mechanisms, git as the control case. 1,960 words of body against a 2,200–3,200 band. This is a craft review, not a fact check. Hashes, dates, commands, and quoted output are locked. I am not touching them.

The bones are the right bones. The thesis is one sentence the book has earned the right to attempt: the first commit of a famous repository is never a beginning. The objects are already the book’s objects — an empty tree, a September signature in an August commit, *Let it rip!*, a volunteer standing on someone else’s copyright, r1 that is r975, a two-line README that can never leave `master`, and the phrase `Initial revision` said once in truth. Three sentences in this draft are keepers for the series, and two more are close. I will name them.

The problem is the form’s contract with the reader. This is the first cross-repo chapter. The five shipped chapters were one dig, one room, one leftover. A tour can work. A census cannot. Right now the draft is a strong argument wearing a museum’s floor plan: mechanism headings that name the verdict, three cuts at equal volume, linux appearing twice without a fuse, a doorway that announces six projects, and a close that restates the tour as a checklist. It is not yet a listicle. It is one more exhibit, and one more “this kind of genesis is…,” away from becoming one.

Do not add a seventh name. Do not chase 3,200. The floor is permission to sit down in two Tuesdays the postcards currently skip. It is not a mandate to complete a set.

---

## Does the tour form work?

**Yes, as an argument. Not yet as a chapter.**

The defense against listicle is already in the draft, and it is the right defense: group by *mechanism*, not by fame. Robot title card, deliberate cut, funeral, accidental extra genesis, control case. That is a thesis with a spine, not a Wikipedia list of “famous first commits.” Keep the grouping. Keep all six names on the tour — PHP, CPython, Linux, Bitcoin, Redis, OpenTTD, plus git as the exception that is not a seventh kind. Cutting a famous name to “sharpen” the set will not sharpen it. What blurs the set is treating every name as a room.

A tour chapter cannot inhabit six Tuesdays in this band. TEMPLATE.md still wants a room. The honest shape is: **one inhabited room per mechanism, postcards for the supporting names.** PHP is already the robot’s room (empty tree, the same second, Rasmus’s blank line). Linux’s message is the cut’s room, and it is currently a gloss. OpenTTD’s subject line is the funeral’s photograph, and it is enough if you stop wind-uping it. The NVIDIA merge is the accident’s room, and it is currently a caption that says “it feels like Tuesday.” Git is the control case, and it is currently a riddle with the answer in the first sentence.

Redis and bitcoin, in this economy, are postcards. They are good postcards. They are not rooms. The listicle feeling is what happens when three cuts arrive at the same volume as the inhabited exhibits, each introduced as a new kind (“the second kind of genesis lie,” “Most cuts don’t announce themselves,” “Bitcoin’s cut is the strangest”). That is a docent walking a gallery. Stop promoting postcards. Sit in the rooms.

Linux twice is not automatically a blur. Two mechanisms in one project is the chapter’s luck: the honest cut *and* the accidental extra genesis live in the same DAG. The blur is that they do not know each other. We watch `1da177e4` drive off, then redis, then bitcoin, then a funeral, then we ask the kernel how many day-ones it has, as if we had not just been there. Seven exhibits fall out of six repositories because linux is split by three other names. Fuse them, or delay the second linux as a rhyme that uses the first. Do not present linux as exhibit 3 and exhibit 6.

**Cut an exhibit?** No. Trim *The cut* so it is not three museum cards. If, after linux is a room and bitcoin’s twin-hash is a clause, the section still feels like a list, demote bitcoin further — not because it is weak, but because chapter 03 already taught that this git is a copy, and the missing-founder beat then has to be a re-angle, not a recap. Do not cut redis. Redis is new to the book, it is the portable examiner (round-zero seconds, copyright older than the repo, version north of 0.1), and the 2025 second root is the only time genesis is a *genre*. That idea is this chapter’s. Linux is the honest cut. Bitcoin is the missing founder. Redis is the habit. Three jobs. One of them is currently doing two jobs in one breath (see bitcoin, Prose). That is a trim, not a funeral.

---

## 1. Structure and pacing

### The order of mechanisms is right. Do not reshuffle the argument.

Robot → cut → funeral → accident → control case.

Empty, then omitted, then destroyed, then surplus, then true. That is the only honest shape for this thesis. Chronological-by-project would be a listicle. Famous-to-obscure would be a listicle. Control case first would spend the exception in the doorway, which is the failure mode of every previous open in this book. Funeral before cut would confuse a death with a choice. Accident before we have lived inside a cut would make the NVIDIA README a curiosity instead of a second creation story.

Do not put git earlier. Do not put OpenTTD in the open (the absence-open is PHP’s, and it is the right one). Do not alphabetize.

What the order is not doing is *pacing*, and the pacing problem has a name: linux.

### Linux is one project with two faces. It is paced as two exhibits.

The famous first commit says it is a cut. Fourteen years in his hands, left out, 17,291 files from nowhere, *Let it rip!*. Then we leave. We do redis. We do bitcoin. We do a crashed SVN. Then:

> Ask the kernel how many day-ones it has:

Four. One of them is the commit we just watched drive off. That table should *hurt*. It currently informs. The honest cut is row four of a four-row log, and the 2016 README is an ancestor of the same `master`. The delayed fuse can work — we believed `1da177e4` was *the* first, then we learn it is one of four — but only if the accident’s first move is “the kernel we just watched cut its own past,” not a fresh quiz. Right now the quiz is a new exhibit. The reader re-orients: *ah, linux again.* That is the listicle beat.

Two legal fixes. Pick one.

**A. Fuse.** After *Let it rip!*, still in the cut, ask `--max-parents=0`. Four. The honest cut is only one of them. Then the README, the merge of unrelated histories, the file gone and the commit permanent. Redis and bitcoin follow as the cuts that did not announce themselves. Funeral. Control case. Linux becomes one movement: he left fourteen years out, and the DAG still acquired three more births.

**B. Delay, but rhyme.** Keep the accident where it is (after the funeral, before the control case) so the surplus-genesis sits next to the exception. Open the accident on `1da177e4` in the four-row log, not on “ask the kernel.” The reader should recognize the hash before they count the rows.

I prefer A if The cut is feeling long, B if you want the funeral to interrupt — a death, then the discovery that even the surviving famous first is not unique. Either way: linux cannot be introduced twice. The second appearance has to be the first appearance, returning.

### The ‘Initial revision’ echo does not land a beat early. It lands two beats late.

The prompt asks this plainly, so I will be exact.

The *intended* trick is the book’s trick: the reader sees git’s subject, recognizes the phrase from Python’s 178 stamps (and from the chapter title), feels the rhyme, *then* you name it. Quote, then:

> *Initial revision.* The exact phrase the conversion robot stamped on Python’s paperwork 178 times, false every time. Here, once, in the corpus of this book, it is the plain truth.

That landing is correct. The blockquote-then-name is a beat early, which is what CONTEXT.md asked for. Do not invert it. Do not “build tension and mic-drop the blockquote.” That would be the narrator naming the rhyme before the evidence, which is the opposite of the assignment.

What steals the early beat is everything *in front of* the quote:

> Six repositories, six firsts, not one of them a beginning: two robot title cards, three cuts, a funeral, and an accidental fourth Genesis. So does any famous repository just... start? Where the first commit is the actual first act of the project’s existence?
>
> One. The tool itself.

That is the exception, spent. Then “I checked twice,” which is a drumroll on the subject line. Then the quote, which can only confirm. Then you name the phrase we were told to watch for.

Also: the reader has already been in this room. Chapter 05 opened the eleven files of `e83c516331` and printed this exact subject on the way to 01:10. You cannot discover the first commit of git in chapter 06. You can *re-read* it. The surprise is not the subject. The surprise is that the phrase which was true at 15:13 on 7 April is the same phrase that is a lie 178 times in Python. Put the reader back in that afternoon — eleven files, not empty, a man typing the tool that will record every fake day-one in this chapter — and show the subject without a census and without a riddle. They will feel the phrase. Then name it. Once. Cut “in the corpus of this book.” Cut “I checked twice.” Cut “One. The tool itself.”

There is a small arithmetic tell in the census sentence, and I am flagging it as craft, not as a fact dispute: “six firsts” plus a list that runs two robots, three cuts, a funeral, *and* an accidental fourth Genesis is seven, because linux contributed twice. The sentence is doing table-of-contents and cannot even count its own tour. That is what census-prose costs.

### PHP is the right cold-open exhibit. The tour contract interrupts it.

The oldest thing is nothing. The empty tree. A robot. Zero bytes of PHP. That is a cold open. It is an *absence*, which chapter 01’s review reserved for a later chapter, and chapter 05 opened on a sentence in a README, so consecutive-open is clean. Then this:

> I have a ritual for famous repositories, and I suspect you have it too: clone, then `git log --reverse`, then scroll to the top and look at day one. This chapter is that ritual performed on six projects the reader has heard of. I should warn you now that the ritual is a séance. What answers is not usually the founder.

Jacket copy. Headcount. Thesis. Metaphor. “The reader has heard of” is a small condescension. “I should warn you now” is a trailer. Then `## The robot's title card` and “Stay with PHP a moment, because the whole first morning is instructive,” which is the teacher putting the photograph back on the table after announcing the gallery hours.

**Move:** delete the ritual/séance/six-projects paragraph from the doorway. Stay with PHP through the same-second Zend import and Rasmus’s blank line. *Then* Python. The reader does not need to be told it is a tour. They can count. The ritual of `git log --reverse` can live in At home, where it is a habit, or in one clause on the way to Python, where it is method. It cannot be the contract of paragraph four.

Rasmus is the right second photograph: the inventor enters his own language’s history adding whitespace, under a message the tooling wrote. That is this chapter’s “Gavin’s first commit is `Fix CRLF`,” and it does not sneer. Protect it. It is the human landing after the robot. Do not move it into the open’s thesis paragraph. The thesis paragraph should not exist.

### Python pays the title. It is slightly overpacked.

Identical trees, a September sign-off in an August commit, a Mercurial header quoting a Subversion path inside a git object, 178 subjects exactly `Initial revision`. That is four turns. The 178 is the title. The September line is the photograph. The identical tree is the mechanism. `HG:extra convert_revision` is the shaft.

Keep all four if three of them are evidence and one is a landing. Right now each is a landing. The reader ticks. Let the README tail be the turn they feel (file and date disagree). Let 178 be the naming, once, into the pull-quote about title cards. Identical trees can be the proof that precedes the README, quietly. The three-VCS header is texture on the object, not a fourth drum. “They are not initial. They are not revisions.” Keep that. It is the title, diagnosed, and it has to stay true until git makes it a lie.

### The cut is three postcards. Linux should be the room.

Linus’s message is the most honest first commit in the set, and the draft says so, and then does not sit in the Tuesday. Git is nine days old. The import is 3.2GB. He has the history. He leaves it out, *in writing*. TEMPLATE.md: the reader should think “I might have done this.” Right now they think “ah, a famous cut.” That is a plot point. Spend the reasonable choice. Stop before you tell us it is a lie of omission. The message already says it is a cut. The honesty *is* the room.

Then redis, which is doing the chapter’s portable work: 10:30:00, copyright 2006–2009, `REDIS_VERSION "0.07"`, and sixteen years later another root. Three examiner proofs of one fact (this is an import), plus the genre beat. Keep the genre:

> Genesis, for him, is not an event. It is a genre.

That is a keeper. Cut “starting a new phase of his life with the project,” which psychologizes antirez past the log. Two of the three examiner details can stay; the third is At home’s checklist leaking into the exhibit. Round-zero seconds and 0.07 are enough. The copyright year is the same sentence as 0.07.

Then bitcoin, which is the strangest cut and the most congested paragraph in the draft (see Prose). Missing founder, volunteer, Satoshi’s copyright inside the tree, eight months of shipped work, *and* twin objects from two conversion runs. The twins are Python’s identical-trees in a new coat, sitting in the wrong section (a robot leftover inside a human cut). Chapter 03 already stood the reader in “this clone is not Satoshi’s repository.” What is new is day one: `sirius-m`, `First commit`, `BitCoin v0.1.5 ALPHA`, the founder in the tree and not in the author field. That is the postcard. One paragraph. The twins, if they survive, are a clause, not a second landing.

Do not write “as we saw in chapter 03.” The reader has a memory. Use it.

### The funeral is the jewel. The heading and the wind-up spend it.

> OpenTTD’s first commit is my favorite subject line in this book, because it is a death notice that types like a birth announcement:

“My favorite… because” is “here is the pivot.” The heading is already **The funeral**. Then the subject, which is the photograph:

> `(svn r1) Import of revision 975 of old (crashed) SVN`

Then “Revision one *is* revision 975,” which is the naming. The reader who saw r1 / 975 in the quote already felt it. Good — a beat early — except you told them “death notice” before the quote. Model this on chapter 05’s Sumer, not on “my favorite because.” Show the subject as if we might take it for a birth. Stop. Then: revision one is revision 975. Then the shipping game, fourteen languages, 0.3.3, the timestamp frozen two weeks before the crash. Then, once:

> The first commit is a funeral, and the funeral is the founding.

Keep that sentence. It is a keeper. Give it whitespace. Cut the wind-up. If the first person wants a favorite, it can say so *after* the subject, or not at all.

### The accident is the leftover. It is in the right place if linux rhymes. It is asserted, not sat in.

Four roots. Two deliberate (btrfs, greybus). One famous cut. One two-line README from a scratch repo at NVIDIA, merged in, file gone, commit permanent. That is this chapter’s `valgrind.patch` — the thing that cannot leave. The pull-quote is earned:

> ~ Every clone of Linux, forever, carries a second creation story, and it reads: "This is for sharing upstreaming activities."

Protect it. Do not restate it.

What is missing is the Tuesday. “A merge of unrelated histories doesn’t feel like an act of cosmology when you run it — it feels like Tuesday” is the right idea, and “act of cosmology” is the narrator reaching for a cathedral (see Séance). Sit in the merge: a scratch README, a GPIO tree, unrelated histories, the kind of convenience that feels like nothing. Stop. Do not say cosmology. `--max-parents=0` will do the cosmology without the word. Then the pull-quote. Then At home is this command, because this is the leftover.

### Headings: the right argument, the wrong spoiler

`The robot's title card`, `The cut`, `The funeral`, `The accident`, `The control case`, `At home`.

For a tour, mechanism headings *are* the thesis. They are better than `PHP`, `Python`, `Linux`. They are also verdicts before photographs. That is tolerable if the first sentence of each section does not *also* name the verdict. Right now both happen. Pick: headings as labels, photographs first in the prose. “The control case” is the one I would rename, because it is a lab word and it announces the exception. **The information manager from hell** is this story’s object, and chapter 05 already taught it. Or no heading — the subject line *is* the heading, once the census preface is gone.

`At home` stays. It is the book’s convention.

### First person is present, and half of it is the wrong I

The engineer: “I mean that precisely.” “I have a ritual.” “Python’s is subtler, and I like it more.” Those are allowed. Opinions are allowed.

The teacher: “I should warn you now.” “Stay with PHP a moment, because the whole first morning is instructive.” “I checked twice.” “my favorite subject line in this book, because.” “This chapter is that ritual performed on six projects.”

One pair of hands, two places: at the empty tree (already there — “You can mint it yourself from `/dev/null`”), and at `--max-parents=0` on the reader’s repo. Then get out of the way. Do not add memoir. Do not add a census. “I like it more” can survive next to Python’s plausible title card; it is an opinion about an object, not a drumroll.

---

## 2. Prose

Keepers, already, for the series. Do not sand them.

> The oldest thing in the PHP repository is nothing.

> Genesis, for him, is not an event. It is a genre.

> The first commit is a funeral, and the funeral is the founding.

And two that are almost keepers, and will be if the seminar around them dies:

> Day one of the clone is day one of the container.

> They are not initial. They are not revisions.

A sixth, the leftover as a sentence:

> The README file itself is long gone from the tip. The commit is not, and can never be: it is an ancestor of `master`, permanently.

### The clunkiest sentence

> The most scrutinized codebase in finance begins with a volunteer typing `First commit` over eight months of another person's shipped work — and it begins *twice*: the same moment exists as two objects, one clean, one wearing a `git-svn-id` trailer, same tree, different hashes, twin geneses from two runs of history-conversion.

Four jobs, an em dash, a colon, then a second exhibit bolted on. The missing founder is the cut. The twins are a conversion artifact, and we have already watched Python mint two commits for one tree. The sentence is how a postcard becomes a traffic jam.

Rewrite, missing founder only:

> The author is `sirius-m`, an early volunteer. Inside the tree he imports, the readme still says who owns the work: `BitCoin v0.1.5 ALPHA / Copyright (c) 2009 Satoshi Nakamoto`. Day one is a volunteer typing `First commit` over eight months of someone else’s shipped code. Satoshi’s January keystrokes are not in the object.

If the twins must stay, they stay as a clause after a period, not as a second landing:

> The same import exists twice — two hashes, one tree, one of them wearing a `git-svn-id` trailer. Conversion, again.

Runner-up, and the pun that announces The cut:

> The second kind of genesis lie is committed by humans, on purpose, and the largest software project on earth commits it in writing.

`committed` / `commits` is the narrator pleased with git. The sentence is also a verdict before the photograph.

Rewrite:

> The largest software project on earth left fourteen years out, and said so.

Then the message. Then *Let it rip!*.

Third, the doorway’s census:

> This chapter is that ritual performed on six projects the reader has heard of.

Rewrite: delete.

### The paragraph doing the most work

Python, from the README tail through the pull-quote:

> Then open the file inside the 9 August commit. The README ends:
>
> `--Guido (last modified 10 Sep 90)`
>
> The file in the August commit signs off in September. The content contradicts its own timestamp, and when a file and its date disagree, the date is the artifact. The raw object confesses the whole journey in one line — `HG:extra convert_revision:svn%3A...` — a git commit carrying a Mercurial header that quotes a Subversion path. Three version control systems deep, and at the bottom of the shaft, a title card. The repository contains 178 commits whose subject is exactly `Initial revision`. They are not initial. They are not revisions. They are the stamp a machine put on paperwork it could not read.
>
> ~ The date on a famous first commit is a title card, typed by whoever did the last conversion.

It has to (a) make August/September a photograph the reader feels, (b) teach file-over-date, (c) show three version-control systems in one object, (d) pay the chapter title 178 times, (e) land the law of the section. It does all five, which is why it is the paragraph to build the tour from, and why it is tired at “the bottom of the shaft.” Break after “the date is the artifact.” Let the convert_revision line be its own beat. Let 178 plus “They are not initial” be the landing, then the pull-quote. Do not sand “paperwork it could not read.” Do not add a fifth conversion.

Honorable mention, and the leftover’s mouth: the NVIDIA paragraph that ends in “a note a man left for himself.” The Tuesday is in it. The cathedral (“act of cosmology,” “book of Genesis,” “four first pages”) is also in it. Keep the Tuesday. Keep “No one would.” Cut the biblical stack, or pick one image. The pull-quote already does “second creation story.” Three creation-myths in one beat is the séance problem in a new coat.

### The paragraph pulling its weight least

The ritual paragraph in the open (clone / `log --reverse` / six projects / séance / not usually the founder). It does not belong to PHP’s first two minutes, it issues the listicle contract, it spends the thesis, and it costs the absence-open its temperature.

Second-weakest: the control-case opener (six firsts, the riddle, “One. The tool itself”). Census, then answer, then the photograph we no longer need.

Third: At home’s examiner sentence, the one with nested parens, `rev-parse <a>^{tree}`, “convicts the date,” and a list of seams. That is the tour, restated as homework. See Close.

### Other prose notes, shorter

- `[R1]` through `[R14]` on the reading surface: same note as 01–05. Quiet them. The trailing list is the right place. A reader must be able to see the moment without holding locators in their head.
- Italics as elbow: *identical tree*, *twice*, *document with a provenance*, *Initial revision*. You have earned about two of those. The italic on the phrase in the control case is the right one if the drumroll dies. “Let it rip!” is already his; you do not need to squeeze it.
- “No human commits a world in the same second as an empty directory; a converter's clock does.” Keep. That is the robot section’s law, in a human mouth.
- “Human commits do not land on :00; staged ones do.” Keep. That is the examiner, portable.
- “Version 0.07 of a thing does not appear in a first commit; it appears when a private project is carried into the light, its adolescence edited out.” Slightly oratorical on “adolescence.” The 0.07 is enough.
- “the most scrutinized codebase in finance”: magazine. You do not need to rank bitcoin.
- “the largest software project on earth”: also magazine, but it is a true scale, and it earns *Let it rip!*. Once. Not again.
- “I mean that precisely.” Keep. That is this narrator.
- Tense: present-in-the-repo is right for a tour (“the oldest thing is nothing”). Past for the Tuesdays you actually sit in. After the open is stripped, PHP can stay present; Linus’s nine-day-old git should be a past Tuesday.
- “in the corpus of this book”: book-consciousness, same family as chapter 05’s “the entire archaeology this book practices.” Cut it here. The control case is the instrument of the book becoming visible; you do not have to tap the glass.

---

## 3. The séance metaphor

The prompt asks this first among the local questions, so I will not bury it.

> I should warn you now that the ritual is a séance. What answers is not usually the founder.

**It does not earn its place as written. It could earn a place. I would still cut it.**

Why it is tempting: `git log --reverse` is a calling-up. What answers, in this chapter, is a robot, a volunteer, a funeral, a scratch README. The founder is usually not home. That is the thesis, as an image.

Why it fails:

1. **It is a trailer.** “I should warn you now” plus “what answers is not usually the founder” is the jacket copy of the chapter, in the doorway, before Python has stamped `Initial revision` 178 times. CONTEXT.md exists because the earlier shelf had no surprise. A séance that tells you the ghost will be the wrong ghost is a spoiler in a better coat.

2. **It is never paid.** The funeral would pay it: you called the dead, the dead answered with a death notice. You do not return to séance there. At home is an examiner and an archivist — “the first question an archivist asks of any document.” Those are the chapter’s real vocabulary. Séance, funeral, book of Genesis, act of cosmology, second creation story, title card: that is five frames for one idea. The narrator who runs `blame` daily is an archivist. OpenTTD’s subject is allowed to be a death notice, because it *is* one. You do not also need a medium.

3. **It clashes with the ethical register.** A séance is gothic. This book does not sneer, and it also does not costume. Truelight salvaging r975 is not a ghost story. ldewangan’s README is not a spirit. Rasmus’s blank line is a man in a conversion. Gothic is a way of enjoying the distance. Cut it.

**Move:** keep the ritual as an engineer’s ritual — clone, `git log --reverse`, look at day one — and park it where it is a method, not a warning. Cut “séance.” Cut “what answers is not usually the founder.” That sentence is the thesis, and the exhibits have to *be* the thesis. If you are lonely for a metaphor in the open, you already wrote a better one, and it is not a metaphor: *nothing*. The empty tree. Stay there.

If someone fights for séance, the only legal placement is one clause after OpenTTD’s subject, once, after the reader has seen r1=975 — and even then I would not. The funeral sentence is enough.

---

## 4. Per-exhibit weight

PHP has the cold open, and it should. Absence, empty tree, same-second import, inventor as whitespace: that is one mechanism, inhabited. Do not shorten PHP to make room for a fourth cut.

Python is the title’s payment. Slightly overpacked (see above), not overweight.

Linux appears twice. That is the weight problem, not bitcoin’s existence. Two linuxes at full postcard-plus-verdict, with funeral in between, is how six names become seven exhibits. Fuse or rhyme (Structure). The accident is the heavier of the two linuxes, and should be: it is the leftover, the unique archaeology, the At home in embryo. The cut is the famous object and the ethical room (a reasonable omission). Both stay. Neither should be a full independent exhibit.

**Bitcoin: trim, do not cut.** The missing founder is the strangest cut in the set, and it is not chapter 03. Chapter 03 is a handover in 2010 and a quoting mistake. This is 30 August 2009, `sirius-m`, Satoshi in the readme, not in the author. Keep that postcard. Cut the twin-hash landing, or demote it to a clause. Cut “most scrutinized codebase in finance.” One paragraph, then leave. If the section still lists, this is the name to demote further, because the reader has already been in bitcoin’s import story. Do not write a second bitcoin chapter inside a tour.

**Redis: do not cut.** The prompt asks this as a pair with bitcoin, so: redis is the weaker *story* and the stronger *habit*. 10:30:00, 0.07, copyright 2006–2009 are the seams At home wants the reader to run at home. The 2025 `First internal release.` is the only time a founder does genesis as a form, twice. Linux cannot teach that. Bitcoin cannot teach that. Cutting redis to “sharpen the contrast between Linux and Bitcoin” would sharpen a gallery wall and throw away the portable find. Trim the examiner triple to two proofs. Keep the genre sentence. Keep the name on the tour.

OpenTTD is the right length once the wind-up dies. Do not grow truelight’s interior. We do not have his Tuesday except as a subject line, a line count, and a frozen keyword. Sit with *his* words. They are stranger than wreckage-prose.

Git is too light *as a discovery* and will be the right weight *as a re-read*. Do not add eleven files again. Chapter 05 did that. Add the juxtaposition: that afternoon against PHP’s empty tree. The control case is not “git also has a first commit.” It is “the only first commit that is a beginning is the recorder’s, and you have already been there.”

---

## 5. Expansion

1,960 words. The floor is 2,200. You have about 240 words of honest headroom before anyone should mention the cap, and about 1,240 before you are padding.

This is not chapter 03. Chapter 03 was eight commits and a quoting boundary; staying short *was* the craft. This is also not chapter 04. Chapter 04 had five acts and caption-rooms. This is a tour whose postcards are excellent and whose rooms are thin. Lean-and-right would mean two Tuesdays inhabited, linux one movement, the leftover the last image, the exception said once, the title flipped once. Right now the tour is a briefing with excellent photographs glued to it.

Add in two places, maybe a third. Not more. Do not add a seventh repository. Do not add a history of CVS or BitKeeper. Do not add Satoshi lore. Do not add an antirez biography. Do not add a séance that returns. Do not add a primer on empty trees beyond `/dev/null`. Do not chase 3,200. A tour that fills the cap becomes the listicle you are trying not to write. Landing around 2,200–2,400 is the floor used honestly.

### A. Sit in Linus’s reasonable cut (The cut, after the message, before redis)

Right now: folklore hash, the quoted message, 14 years, 3.2GB, git is nine days old, 17,291 files, most honest first commit, *Let it rip!*.

Add a short paragraph that is only what a man with a nine-day-old tool and 3.2GB of history in his hands would do. He has it. The import would be the history. He leaves it out, and he writes that down. I might have done this. The honesty is the opposite of PHP’s robot: a human, on purpose, labelling the hole. Stop. Do not say lie. Do not say folklore. Then, if you take fix A, `--max-parents=0` from here. If you take fix B, *Let it rip!* and leave, and the accident will rhyme.

This is the non-negotiable from CONTEXT.md (“I might have done this”) and it is how The cut stops being a postcard of a famous message.

### B. Sit in the NVIDIA Tuesday (The accident, after the two-line README, before the pull-quote)

Right now: four roots, two deliberate, the 2016 one is the accident, README quoted, merge of unrelated histories, file gone, commit permanent, “feels like Tuesday,” book of Genesis.

Add four to eight sentences that are only the convenience. A scratch repo to pass patches. A two-line README. A merge that does not feel like founding anything. Then `--max-parents=0` does not forget. Then the pull-quote. Cut “act of cosmology” if the room exists; you will not need it. Cut “book of Genesis has four first pages” or keep *one* biblical crumb, not three.

This is how the leftover becomes a duration and not a caption, and it is the At home in embryo: the command is `--max-parents=0`, and the story of that command is a Tuesday merge.

### C. Re-read git, don’t discover it (The control case, instead of the riddle)

Right now: census, riddle, “One. The tool itself,” eleven files in a clause, “I checked twice,” the subject, the italic phrase.

Replace the census with the juxtaposition you have already earned. PHP’s first object is the empty tree. Git’s is eleven files, that afternoon, the two-hour-old tool, the man who typed them. The reader was in that room one chapter ago. Show the subject. Let `Initial revision` hit. Then name the echo. Once. The “could hardly be otherwise” clause can survive as a single sentence after the landing, not as the answer to a quiz.

This may be a *substitution* more than an addition. Cutting the census funds it.

### Whitespace, not words, around the keepers

- After “The oldest thing in the PHP repository is nothing.”
- After Rasmus’s blank line, before Python.
- After “They are not initial. They are not revisions.” Then the pull-quote.
- After *Let it rip!*.
- After “Genesis, for him, is not an event. It is a genre.”
- After OpenTTD’s subject, before “Revision one *is* revision 975.”
- After “the funeral is the founding.”
- After the NVIDIA pull-quote. Do not explain it.
- After “*Initial revision.* … it is the plain truth.” Then At home. No second sermon on the recorder.

### What not to add

- A seventh exhibit, a “what about Postgres,” a tour of `--max-parents=0` across the scout list.
- Converter-operator interior. Robots do not have Tuesdays. The same-second clock is the robot’s room.
- Truelight’s feelings. The subject line is the feeling.
- Bitcoin network lore beyond the CHECK already in the draft. The readme is the object.
- Any sentence that begins “this chapter is,” “six projects,” “the second kind of,” or “I should warn you.”
- A contrast-hinge with chapter 05 (“the last chapter was also git’s first commit”). The reader has a memory. The re-read *is* the hinge. Do not write “as we just saw.”

If the chapter comes out at 2,150 because two rooms were short paragraphs and the census was cut, that is closer to honest than padding to 2,200 with a third cut. The band is a band, not a dare. Consecutive chapters should not all be the same length; a mid-length tour after a mid-length origin is the craft.

---

## 6. Open and close

### Cold open — the strongest first sentence in the book so far, then a gallery map

What works: “The oldest thing in the PHP repository is nothing.” The `cat-file`. The empty-tree hash, mintable from `/dev/null`. Zero bytes of PHP. Consecutive-open is an absence after chapter 05’s law-in-a-README, which is exactly the object chapter 01 reserved. What fails: everything from “I have a ritual” through “what answers is not usually the founder,” and then “Stay with PHP a moment, because…”

Stronger version, same object:

> The oldest thing in the PHP repository is nothing.
>
> I mean that precisely. Ask git to print the founding commit of the language that ran half the early web, raw:

Then the `cat-file`. Then the robot, the empty tree, zero bytes of PHP. Then the same second, Andi, then Rasmus’s blank line. Stop. No census. No séance. No “this chapter is.” Python can start with “Python’s is subtler, and I like it more” *after* we have been in PHP, which is when an opinion is a comparison and not a trailer.

Do not open on git (pays the exception). Do not open on OpenTTD (pays the jewel). Do not open on the four-row linux log (pays the leftover; also a table, and chapter 03 opened on a shortlog). Do not open on “Initial revision” as a quoted subject (pays the title). The title is a trap. The open is nothing. Let them meet later.

### At home — the right command, then the tour as a worksheet

The habit is right. `git log --max-parents=0 --all` is this chapter’s `git log -S`, born from the NVIDIA leftover. TEMPLATE.md wants it woven, not boxed. You have not boxed it. You have listed it.

The long examiner sentence — compare trees, file against date, round-zero seconds, robot authors, copyright years, version numbers north of 0.1 — is every exhibit, in parentheses, in one breath. The reader who has been on the tour does not need the tour again. The reader who wants a checklist can use the receipts.

Stronger close:

1. Last story image: the NVIDIA README, gone from the tip, permanent as an ancestor. Or, if the control case is the last story image, the phrase `Initial revision` said once in truth. Pick one leftover. I would pick the README, because git’s phrase is the turn of the chapter and the README is the thing that follows the reader home. The exception is not a habit. The extra root is.
2. One woven paragraph: so run `--max-parents=0 --all`. You may have more geneses than you think. When you meet a famous first, read the tree against its neighbor, the file against the date — two clauses, off Python, not a manual. Round seconds and 0.07 are redis in one breath, not a list.
3. Last line, keep and isolate: “Day one of the clone is day one of the container.” The next sentence, about building the recorder to earn a real day one, is the control case restated. If the control case has landed, you do not need it. If you keep a clause, make it light: the log cannot see the beginning. One exception. You already stood in it.

Cut “None of this makes the history worthless. It makes it a *document with a provenance*” if you have to choose between that and “day one of the container.” The provenance sentence is the archivist, and it is good, and it is currently the start of a seminar. I would keep “who made this copy, and what did they leave out” as the last question, and let “day one of the container” be the last answer. I would not keep both stacked on “with one exception.”

---

## 7. Title

**Keep “Initial revision.”**

It is the right title for the book and the right title for a tour. It is not folklore (“Famous First Commits,” “The genesis lie”). It is an object. It is a double: the robot stamp, 178 times, false; and the one afternoon it was true. The double *is* the chapter. Python spends the lie. The control case spends the truth. The open spends *nothing*, which is the other pole.

Three risks.

**The title explains Python in advance.** The reader who sees `Initial revision` on the contents page, then meets 178 of them, is confirming a label. That is acceptable for a title-as-trap: we think it means “beginnings,” Python reveals it means paperwork, git reveals it means the one true beginning. It is not acceptable if the control case *also* says “I checked twice” and “the exact phrase.” The title plus Python is the setup. Git is the flip. Do not narrate the flip before the quote.

**Wrong center.** The event of the open is the empty tree. The event of the leftover is the NVIDIA README. The title sits on Python/git. That is a two-center chapter, which a tour is allowed to be, as long as the title is the argument and not a caption on one postcard. It is. PHP is the cold open; `Initial revision` is the law. Fine.

**Unpaid flip.** If the control case stays a riddle with the answer first, the title’s second meaning never happens on the page. It is asserted. Expansion C is how the title stops being a stamp and becomes a turn.

I would not use the alternatives unless the control case stays a census, in which case the title cannot flip and should not pretend to.

Alternatives, in order, if you change it:

1. **Day one of the container** — the close’s keeper, the law of the tour, drier, no trap. Best if you decide the NVIDIA leftover is the chapter (the unique archaeology). Loses the Python/git double.
2. **Let it rip!** — Linus’s mouth, the honest cut, joy without sneer. Wrong center (one exhibit). Save it for the sentence.
3. **The empty tree** — the open, the famous hash, viscerally this book. Wrong center (the robot only). The open should keep it; the contents page should not.

I would not use “The genesis lie” (thesis as title, folklore). I would not use “Four first pages” (linux only). I would not use “The control case” (lab). I would not use “A séance” (the metaphor you should cut).

Keep “Initial revision.” Stop explaining it. Let the 178, then the one, do the work.

---

## Top 5 changes, by impact

1. **Do not issue a six-project contract in the doorway, and do not name the thesis as a séance.** Cut the ritual/census/warning paragraph. Stay with PHP through the empty tree, the same second, and Rasmus’s blank line. Consecutive-open is already the absence; protect its temperature. This is the change that turns a well-labelled gallery into a chapter — and it is the change that stops the tour becoming a listicle in paragraph four.

2. **Make linux one movement, not two exhibits.** Fuse the honest cut to `--max-parents=0`, or delay the accident as a rhyme that uses `1da177e4`. The reader should not have to re-meet the kernel. Seven exhibits from six names is the blur; the fuse is the sharpening. Do not cut redis or bitcoin to fake the sharpening.

3. **Let `Initial revision` flip a beat early, the way the book asked.** Cut the control-case riddle (“Six repositories… One. The tool itself”). Cut “I checked twice.” Re-read chapter 05’s afternoon against PHP’s empty tree. Show the subject. *Then* name the phrase, once. The title depends on this. Do not invert the quote-then-name; the quote-then-name is the beat. Everything in front of the quote is what kills it.

4. **Inhabit two Tuesdays, not seven captions.** Linus leaving 3.2GB out because git is nine days old (expansion A). ldewangan’s scratch merge that does not feel like founding anything (expansion B). Trim bitcoin’s twins to a clause; trim redis’s examiner triple to two proofs plus the genre sentence. Do not add acts. Do not add a seventh name. Do not chase 3,200.

5. **Photographs before verdicts; leftover into At home; one last line.** Cut “my favorite subject line, because it is a death notice” before OpenTTD’s quote. Cut “the second kind of genesis lie.” Quiet `[R1]`…`[R14]`. Fuse the NVIDIA README (gone from the tip, permanent on `master`) into `--max-parents=0 --all`. Isolate “Day one of the clone is day one of the container.” Cut the examiner encyclopedia. Cut “in the corpus of this book.” Pick archivist, not séance, not Genesis.

---

## The single most important change

**Stop introducing the tour, and stop splitting linux until six names feel like seven exhibits.**

Cut the paragraph that runs from “I have a ritual” through “what answers is not usually the founder.” Stay in the empty tree until Rasmus has added his blank line. Then make the kernel one project: a man who writes down that he is cutting fourteen years, and a DAG that still acquires a two-line README as a second creation story. Redis and bitcoin are postcards on the way. OpenTTD is the photograph you do not wind up. Git is a re-read, not a riddle.

Everything else — September inside August, 178 stamps that are not initial, genesis as a genre, r1 that is r975, a merge that felt like Tuesday, `Initial revision` said once in truth, `--max-parents=0` at home — will land if the reader has first stood in a repository whose oldest object is nothing, and has not been told they are about to see six of these. That is the book. The census is folklore in a nicer coat. Right now the folklore is in the doorway, the kernel is two galleries, and the book is in the other room: an empty tree, a death notice that types like a birth, a README that cannot leave, and a phrase the conversion robot stamped on Python 178 times, waiting to be true.
