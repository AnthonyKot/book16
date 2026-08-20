# empty commit to trigger a github mirror

It is 2:08 in the morning, one Thursday in May 2015, and a release manager for PHP — the
programming language behind a huge share of the web — has a problem that no amount of code can
solve. The code is fine. The plumbing is stuck.

To understand his fix, you need one idea about how projects record their history. Every change to
the code is saved as a "commit" — a labelled entry in a permanent logbook, with an author, a
timestamp, a note, and a snapshot of every file at that moment. Normally you make a commit
*because* you changed something. But a commit doesn't actually have to change anything. It can be
a labelled entry whose snapshot is byte-for-byte identical to the one before it. An empty entry.
A log line that records an event without recording any change.

That is exactly what this release manager makes at 2:08 a.m. PHP's official code lived on its own
server; the copy on GitHub was a mirror that only updated itself when it saw a fresh commit
arrive. He had nothing to fix — he just needed the mirror to *wake up and look*. And the smallest
thing a mirror will notice is a new commit. So he committed nothing, and said so, right in the
note attached to it: **"empty commit to trigger a github mirror."** A knock on a door with nobody
behind it. The plumbing unstuck, the mirror pulled, and the permanent history of one of the
world's most-used languages now contains a 2 a.m. doorbell that changed not a single line.

Once you know empty commits exist, you find them everywhere — and they turn out to be a small,
honest sign language. People reach for one whenever they need to say something that has no natural
home inside a file. There are three things they tend to say.

## "Wake up"

The first is the doorbell you just saw: a signal aimed not at a human but at a *machine* watching
the history. The PHP one woke a mirror. Its identical twin lives, of all places, inside Apple's
Swift language, where an engineer left an entry whose note simply reads **"Empty commit for CI."**
"CI" is the automated system that rebuilds and re-tests a project every time a new commit lands —
so when you need those robots to run again but have nothing to change, you commit nothing to poke
them. That one survives to be found only because it sits on an abandoned working branch nobody
ever merged: a doorbell still ringing in a room that got locked and forgotten.

## "You are here"

The second thing an empty commit can say is aimed at a human, but one in the future. In late 2023,
an OpenSSL developer named Hugo Landau was deep in the kind of work that gives maintainers
nightmares: a sprawling, delicate reorganization of the code that handles a whole network
protocol, touching files all across the system — the sort of change where, months later, someone
trying to understand the history will be hopelessly lost. So, seconds apart one morning, he
planted four empty entries, and their notes read like chapter titles:

> MARKER: End of Phase 1
> MARKER: End of Phase 2: Transfer of Responsibilities Done, Legacy Compat Retained
> MARKER: End of Phase 3: Legacy Cleanup
> MARKER: End of Phase 4: Finalization

Four commits that changed nothing, each one a signpost hammered into the timeline itself:
*everything behind this point was Phase 2; everything ahead is Phase 3.* He could have written
those boundaries in a design document — but a design document is not where a future reader digging
through the project's history will actually be looking. The history is. So he wrote the table of
contents directly into it, for a stranger he'll never meet who is one day trying to reconstruct
his thinking.

## "This was handled"

The third kind is the strangest, because it disguises itself as ordinary work. In the FFmpeg
project, there is a commit whose note looks exactly like a genuine bug fix: a specific file, a
specific defect, all the right words. But its snapshot is identical to the one before it — it
changed nothing. What happened is that on this particular maintenance branch, the fix was
*already there*; someone had copied it in earlier. Applying it a second time did nothing, and yet
the maintainer kept the empty result anyway, as a kind of receipt — a permanent note saying *this
fix was considered and dealt with here*, filed even though there was nothing left to do.

And sometimes the same shape appears without anyone meaning it. In late 2014, in the chaotic days
after Node.js had been forked and its leadership was in open revolt, the same contributor's patch
got recorded twice, twelve minutes apart — the first time doing the work, the second time
changing nothing, because the work was already done. Was the second an intentional receipt or
just a duplicate landed by an exhausted maintainer clearing a backlog under pressure? The history
cannot tell you, and neither can I. That is the quietly profound part: the history does not record
*why* people do things. It records *that* they did them. A deliberate note and an accidental echo
look exactly alike, kept side by side forever, because the logbook doesn't store intentions — only
events, and an event with nothing inside it is still an event.

## At home

Here is the one fact underneath all of it, and it is genuinely useful to hold: a commit is not
the same thing as a change. It's a labelled, dated, signed event, and the change it carries is
optional. That gives you one habit and one tool.

The habit: when a commit's note promises a fix, don't assume it made one — a note describing a
change on top of an unchanged snapshot is almost always a harmless receipt, not a lie, and knowing
that will stop you hunting for a difference that was never there.

The tool: when *you* need to say something that doesn't belong in any file — wake up an automated
system, mark a boundary in a big messy piece of work, put on record that something was decided —
you can leave a permanent, signed, dated note in the exact place your teammates are guaranteed to
look, without touching a single line of code. A commit doesn't have to change anything.

Sometimes the most useful thing it can do is simply exist.

---

*The 2 a.m. mirror trigger, the "Empty commit for CI," the four QUIC phase markers, the backport
with nothing left to apply, and the patch that landed twice are all real and public, each a commit
whose snapshot exactly matches its parent's — reproducible with a git command each. The full
technical dig is here: [empty commit to trigger a github mirror — the full dig](16-empty.full.html).*
