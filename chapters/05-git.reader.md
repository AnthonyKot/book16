# Magically fixes all errors

Every chapter in this book is checked the same way: against git, the tool that
remembers what happened to software. Git can do this because of one idea, and the idea fits in a
sentence: *the name of a thing is the fingerprint of its contents.* Not a label somebody chose —
a fingerprint, computed from the bytes themselves. Change one comma in a file and its name
changes. That is why the receipts in this book work; you cannot quietly swap the contents and
keep the name.

This chapter is about the night that rule was made. It is the one story here with no villain, no
victim, and no disaster — just a man alone at a keyboard at one in the morning, changing what a
name means for everything his tool would ever store, and finding out twenty-five minutes later
that he'd missed a spot.

## An afternoon in April

In the spring of 2005, the team that builds Linux — the operating system underneath a great deal
of the internet — abruptly lost the tool it used to keep track of its own code. So its creator,
Linus Torvalds, sat down and wrote a replacement himself. The first version took an afternoon:
eleven files of code and a design document, checked in at 15:13 on a Thursday, under a title that
called his new invention "the information manager from hell."

Three minutes later — one hundred and seventy-seven seconds, the record is exact — he filed a
second change, adding copyright notices. Its note to posterity is disarmingly honest: the tool's
interface "sucks," he writes, everything is done by hand from the command line — *but I think
this is in theory actually a viable way of describing the world. So copyright it.*

Sit in that gap. The thing barely works. Using it is embarrassing. And he stops, three minutes
in, to claim ownership — not of the program but of the *idea*. That sentence is where a weekend
hack becomes a project.

The design document from that afternoon contains the law this chapter turns on. It says, in
effect: a stored object's fingerprint-name is always computed from the *compressed* copy — the
squeezed-down version the tool keeps on disk — "not the original one." Written with the total
confidence of someone two hours into a design. Hold on to it.

## The workshop

For the next two weeks, git is a hand tool. There is no command that just commits your work; the
manual literally tells you the machine will hand you back your new commit's name "and you should
save it away for later use" — the bookkeeping system trusts *you* to write down the receipt. And
the record still holds fossils of that workshop. One entry from that April announces, in a
confident subject line, the addition of two useful scripts — and if you ask git what that entry
actually changed, the answer is: nothing. Byte for byte, nothing. The scripts had gone in six
days earlier; working by hand, he'd re-recorded an announcement whose work was already done.

No harm in it. But pocket the shape, because it is the oldest lesson in this book wearing its
gentlest clothes: what a change *says* and what a change *does* are recorded separately, and
nothing forces them to agree.

## Ten past one in the morning

Now the law itself. Naming things by the fingerprint of the compressed copy is, at first glance,
perfectly sensible — the compressed file is the actual thing sitting on disk, so checking it is
effortless. But look at what the name is now attached to. Compression software squeezes. Update
it, tune it, swap it, and it may squeeze the same contents into slightly different bytes — same
letter, different envelope. And this law fingerprints *the envelope*.

Which means the name of your data would change when the packaging software changed — for a system
whose entire promise is *the name is the content*, the name was actually the wrapper.

Thirteen days in, at 01:10 in the morning, he fixed it — by moving four lines. From that moment the
fingerprint is computed from the *original* bytes — the letter, never the envelope — plus a small
label saying what kind of thing it is and how big. And because thirteen days of history already
existed under the old law, the same midnight change shipped a little companion program whose only
job was to walk through everything made so far and re-name it under the new rule. The whole
world, such as it was, became a migration.

Twenty-four minutes later, a second entry. He had changed the naming of everything — and missed
*files*. Ordinary files: the single most common
thing a system like this stores. One code path was still fingerprinting envelopes. The 01:34
entry owns up in one line and then, in the next, exhales:

*Happily, convert-cache just magically fixes all errors.*

That "happily" is the whole night. The mistake cost nothing — because the little converter he
happened to have written an hour earlier, for the migration, turned out to be exactly the mop
this new mess needed. Foresight didn't prevent the error. It made the error cheap.

~ Then, with the world renamed twice before two in the morning, he apparently went to bed.

Every name git has ever given anything since — every fingerprint in every copy of every project
on earth that uses it, including the receipts this book runs on — is the output of those four
lines from 01:10.

## The document that didn't notice

Here is the detail I keep returning to. That founding design document, the one with the law in
it? Neither of the night's two changes touched it. The law changed at 01:10; the document kept
saying the old thing — for thirty-two more days. Nobody rushed to correct it, because everyone
who mattered already knew, and the set of everyone was approximately one.

The correction, when it finally came in late May, arrived from someone else entirely — the
project had readers now — inside a tidy-up whose description says, in full: "Whitespace and
asciidoc formatting changes only." Formatting changes *only*. And tucked inside it, the sentence
defining how everything gets its name is quietly rewritten, with the old law demoted to a
parenthetical: *(historical note: in the dawn of the age of git this was the sha1 of the
compressed object)*.

The change that amends the constitution says it changes nothing. It is the empty-announcement
fossil from the workshop, inverted — there, the words claimed more than the change; here, less.
Same lesson either way, and it is the sharpest one in this chapter: the description is testimony.
The change itself is evidence. Read the evidence.

And savor that parenthetical. "The dawn of the age of git" was *five weeks earlier*. The old law
had lived thirteen days, and it was already being written about the way we write about ancient
Sumer.

## The mayfly

One last fate to report. The little converter — the mop of the night, the only program that ever
spoke both naming laws — lived exactly five months and was deleted in a September housecleaning.
Nobody would ever need it again: everything created after that April night was born under the new
law, and the handful of things born before had already been converted by their only user. The
migration tool for the most durable name in software had the lifespan of a mayfly. Which is the
quiet moral of the whole night: permanence lives in the *rule*, not the machinery around the
rule. The machinery is disposable the moment its work is done.

## Try it

You can hold that night in one hand, today. If there is a terminal near you, ask git to name five
letters, then compute the fingerprint yourself — no git, just the little label, the raw bytes,
and the standard fingerprint tool:

```console
$ printf 'hello' | git hash-object --stdin
b6fc4c620b67d95f953a5c1c1230aaab5db5a1b0
$ printf 'blob 5\0hello' | sha1sum
b6fc4c620b67d95f953a5c1c1230aaab5db5a1b0  -
```

The same forty characters. That equality *is* the four-line decision from ten past one in the
morning, still answering. It will give you the same answer the day you read this, and twenty
years from now — the same answer it gave the first tired man who checked it, at 01:34, before
going to bed.

---

*Every timestamp, message, and change in this story is real and public — the 177 seconds, the
empty announcement, the 01:10 and 01:34 entries, the month the document slept, the
"formatting changes only" patch. The full technical dig, with every command and receipt, is here:
[Magically fixes all errors — the full dig](05-git.full.html).*
