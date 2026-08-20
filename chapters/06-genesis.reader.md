# Initial revision

The oldest thing in the PHP repository is nothing.

I mean that literally. Every software project keeps a ledger of its own changes, going back to a
first entry — and the first entry in the ledger of PHP, the language that ran half the early web,
contains no PHP. No code at all. Zero bytes. Its author is listed as "SVN Migration" — not a
person; a robot. Its note says it was "initialized by cvs2svn" — the name of a conversion tool.
The founding record of one of the world's most used programming languages is an empty folder,
filed by a machine.

People have a ritual with famous projects: open the ledger, scroll to the very first page, and
gaze at the moment of creation. This chapter is about what is actually on that first page. I went
looking in seven famous ledgers. What I found was two robots, one honest cut, two cover-ups, one
funeral, one accident nobody can ever undo — and, exactly once, a true beginning.

## The robot's title card

PHP's whole first morning has the same machine handwriting. The empty founding entry is stamped
18:10:10 on an April evening in 1999. The next entry — a human importing the language's entire
new engine, thousands of lines — is stamped 18:10:10. *The same second.* No person files a world
in the same second as an empty folder; a conversion robot's clock does. And the inventor of PHP,
Rasmus Lerdorf? His first appearance in his own language's permanent record, eight minutes later,
is the addition of a single blank line, under a note reading "*** empty log message ***" —
boilerplate the tooling wrote because he didn't leave a note. The language was five years old by
then. None of that life made it into the ledger. The founding is one filing system over, or in a
box in the attic, or gone.

Python's version is subtler, and I like it more, because it looks so plausible. Every history of
the language repeats the sacred date: Guido van Rossum, August 9th, 1990, "Initial revision." And
there it is, right at the top of the ledger, exactly as advertised. But look one entry down. The
second entry — filed a month later, with a different note — contains *byte-for-byte identical
contents*. An entry that changes nothing is the fingerprint a conversion robot leaves when it
turns a stack of old records into a tidy story. Then open the actual file inside that August 9th
entry: it signs off, in Guido's own hand, "last modified 10 Sep 90." A file dated September,
inside an entry dated August.

When a document and its date disagree, the date is the artifact. And this ledger has passed
through *three* different record-keeping systems on its way to the present — the raw entry still
carries the stamps of all three, like a passport with three countries' exit stamps on one page.
There are 178 entries in Python's ledger titled
exactly "Initial revision." They are not initial. They are not revisions. They are the label a
machine glued onto paperwork it could not read.

~ The date on a famous first entry is a title card, typed by whoever did the last conversion.

## The honest cut

The other way a beginning goes missing is that a human decides it should — and the largest
software project on earth has the decision in writing. The Linux kernel's first ledger entry, from
April 2005, says, in its author's own words: *"I'm not bothering with the full history, even
though we have it."*

Be fair to him before you gasp. It's Linus Torvalds; the record-keeping tool he's moving to is
git, which at that moment is nine days old, because he wrote it himself the week before. The full
history of Linux — fourteen years of it — would weigh 3.2 gigabytes in the newborn tool, and
nothing exists yet to make that manageable. So he weighs the entire recorded past of the world's
most important open project against having a usable tool by Saturday, cuts, and says so. Then
signs off: *"Let it rip!"* Seventeen thousand files arrive from nowhere, six point seven million
lines with no past. It is the most honest first entry in this chapter — a cut that tells you it's
a cut — and it drives off whistling.

## Read for the seams

Most cuts don't announce themselves. Redis, the database that caches half the internet, begins
at exactly 10:30:00 on a Sunday — zero seconds, a clock too round for a human hand. Inside that
"first" entry, the license already says *2006–2009* — three years older than the ledger — and
the code declares itself *version 0.07*. Nothing is born at version 0.07.
Version 0.07 is what walks in the door when a private project steps into the light with its
adolescence edited out. Its author, it turns out, is a connoisseur of the form: sixteen years
later, opening a new chapter of his life with the project, he minted himself *another* first
entry, titled "First internal release." Genesis, for him, is not an event. It is a genre.

And Bitcoin — the most scrutinized codebase in finance — has a first entry with the perfect title,
*"First commit"*, and everything else about it wrong. It is dated August 2009, eight months *after*
the Bitcoin network started running. The name on it is not the founder's: it is `sirius-m`, the
username of an early volunteer, importing somebody else's finished work. The files announce their
real parentage on the inside: *BitCoin v0.1.5 ALPHA, Copyright (c) 2009 Satoshi Nakamoto*. A
version number north of zero and a copyright line, wrapped in someone else's "First commit."

And here is my favorite wrinkle: it happened *twice*. The import ran two ways, and the ledger keeps
twin first entries — same title, same contents down to the byte, two different fingerprints —
sitting side by side like a document that was notarized twice by two clerks. The founder's actual
January keystrokes, the moment the folklore wants? In neither. Not anywhere you can clone.

~ Day one of the copy is wherever the person making the copy happened to be standing.

## The funeral

My sixth ledger opens with the strangest first line in this book:

*"(svn r1) Import of revision 975 of old (crashed) SVN"*

Entry number one describes itself as entry number nine hundred seventy-five. OpenTTD is a
beloved fan-rebuilt classic game, and its original ledger — revisions 1 through 974, the entire
recorded act of creation — died when the server hosting it crashed. Consider that afternoon. The
*work* survived, in a backup of the final state. The *story* did not: every author, every date,
every wrong turn of two years of loving reconstruction, gone. What do you do? You type the truth
into the first line — "old (crashed) SVN" — and you start counting again from one. What lands in
that "first" entry is a finished, shipping game: 129,220 lines, fourteen languages, version 0.3.3.
The first entry is a funeral, and the funeral is the founding.

## The accident

Now back to Linux, because the cut Linus made turns out not to be the strangest thing about its
origins. There is an honest question you can put to any ledger: not "what's the first page," but
"*how many* first pages are there" — entries with no parent, no predecessor, stories that start
from nothing. The Linux kernel has **four**.

The 2005 cut is one. Two others are adoptions — subsystems born in their own ledgers and merged
in, histories and all, on purpose. The fourth is an accident, and it is my favorite object in
this chapter. In 2016, an engineer at NVIDIA started a scratch notebook to pass patches around.
Its entire founding content is two lines:

*# linux-upstream*
*This is for sharing upstreaming activities.*

Picture his Tuesday. He needs his work combined with another maintainer's tree, so he merges that
tree into his scratch notebook — it does what he needs, the patches get where they're going,
nobody thinks about it again. Then his work is folded into the mainline kernel… and the scratch
notebook's first page rides along. The two-line note itself was deleted long ago. The *entry*
cannot be: it is now a permanent ancestor of the kernel's history, cryptographically welded in.

~ Every copy of Linux, forever, carries a second creation story, and it reads: "This is for
sharing upstreaming activities."

Nobody decided that. No one would. Merging two unrelated histories doesn't feel like an act of
cosmology when you do it — it feels like Tuesday — but the ledger does not forget, and now the
kernel's book of Genesis has four first pages, one of which is a note a man left for himself.

## The one true beginning

Of the ledgers I dug through for this book, exactly one begins with an actual beginning — and it
could hardly be otherwise, because it belongs to git, the record-keeping tool itself. A tool
cannot have a history from before it existed. Git's ledger opens with git's own birth: eleven
files, written in one afternoon, recorded by the two-hour-old tool they themselves implement. And
the title its author typed on that first entry?

*"Initial revision of 'git', the information manager from hell."*

**Initial revision.** The exact phrase the conversion robot stamped onto Python's paperwork 178
times, false every time. Here, once, it is the plain truth. You have to build the recorder itself
to earn it.

## What to carry away

If you keep a project of your own, ask it the honest question sometime — not what the first page
says, but *how many* first pages there are; git will list them in one command. If a fork was ever
absorbed or a scratch repo merged on some forgotten Tuesday, there are more than you think, and
each is a story. And when you meet a
famous first commit, read it the way an archivist reads a document: not "what does it say" but
"*who made this copy, and what did they leave out?*" The seams are always the same — a clock too
round, an author too robotic, a copyright older than the ledger, a version number that isn't
newborn, a file that contradicts its own date. None of this makes the history worthless. It makes
it a document with a provenance.

Day one of the copy is day one of the *container*. The thing itself began somewhere the ledger
cannot see. Once you know that, the first page stops being a window and becomes what it always
was: the first page someone chose to keep.

---

*All of these first commits — the empty tree, the September file in the August entry, "Let it
rip!", the 10:30:00 Sunday, the twin notarized "First commit"s, the crashed-SVN funeral, the
two-line README welded into Linux, and the one true "Initial revision" — are real and public,
reproducible with a git command each. The full technical dig is here:
[Initial revision — the full dig](06-genesis.full.html).*
