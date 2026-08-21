# Fixed once (badly) by me eleven years ago

Most commit messages are written to explain a change. Every so often one is written to confess.
Here is how Linus Torvalds opened a patch to the Linux kernel in October 2016:

> This is an ancient bug that was actually attempted to be fixed once (badly) by me eleven years
> ago … but that was then undone due to problems on s390.

A patch that opens by citing two older patches is a patch that has read its own history. This one
names the scene of the mistake, the person who made it — himself — and the follow-up that undid
the first fix eleven years earlier. That eleven-year gap is the story, because for most of it the
kernel that runs most of the world's servers and phones carried a hole that had already been
found, already been patched, and then had the patch taken back out — for a genuinely good reason,
after which everyone was free to forget it for a decade.

## The first fix

August 2005. Linus writes a small patch to the part of the kernel that manages memory, describing
a subtle race in something called copy-on-write.

Copy-on-write, or COW, is one of the most elegant tricks an operating system has. When two
programs hold what looks like the same page of memory, the kernel doesn't keep two copies — it
keeps one, marks it read-only, and hands both a pointer. The instant one tries to *write*, the
hardware traps, the kernel quietly gives that writer a private copy, and the write lands on the
copy. Two programs, the illusion of two pages, the cost of one.

The race lives in the tiny gap between "the hardware traps" and "the kernel makes the copy." In
that window, two threads racing just right can make a write land on the *original* read-only page
instead of a private copy — a program scribbling on memory it was only ever allowed to read. Hold
onto that, because it is the whole future of this story: a write landing on a page you could only
read is exactly how, years later, an ordinary user rewrites a file the system swears is
untouchable. In 2005 this is, in Linus's own later words, a "purely theoretical race," and he
fixes it the way you tighten a screw you walked past. The fix even made the code *shorter*.

## The undo

Two days later, the fix comes back out — and not by a fool. It's reverted by three of the most
respected kernel-memory engineers alive, for a precise reason: Linus's fix relied on a piece of
hardware bookkeeping (the "dirty" bit) that behaved differently on IBM's mainframe architecture,
s390. So the elegant patch was right on the machines most people had and *wrong* on a machine some
people had — and "wrong in the memory manager on one architecture" is not something you ship. They
backed the approach out and replaced it with something safer for everyone.

I want to be fair to this, because hindsight makes it look careless and it was the opposite. They
had a fix for a race nobody had ever triggered that broke a real, supported computer. They
protected the real computer. Anyone responsible would have. The theoretical race went back to
being theoretical — on purpose.

And there is the quiet mechanism of the whole disaster. A correct decision doesn't leave a ticket
open. The revert didn't say "come back when s390 is fixed." Nothing tied the sleeping race to a
future where it might wake up. The knowledge that the hole was still there had nowhere to live
except the memory of the people in that email thread — and memory is not version-controlled.

## What the years changed

Nothing in the code had to change for the danger to grow; the world changed around the frozen
lines. Two clocks were running the whole time. The first: the reason for the 2005 revert quietly
*expired* — s390 got a proper implementation of that hardware bit in 2013, so the objection that
killed the original fix stopped being true years before anyone connected it back to the sleeping
race. The obstacle dissolved and nobody noticed, because nobody was watching an obstacle that
guarded a door everyone had forgotten. The second clock, in Linus's words: "the VM has become more
scalable, and what used a purely theoretical race back then has become easier to trigger." The
kernel learned to do more at once, and a collision that was almost impossible to force in 2005
became something an attacker could hit. No commit made it dangerous. Time did.

## Caught in the act

The bug wasn't rediscovered by someone reading old code. It was found already in use. The 2016 fix
credits `Reported-and-tested-by: Phil "not Paul" Oester` — a researcher who had been capturing the
web traffic hitting his own servers and pulled a live, working exploit for this race straight out
of the capture. The attack caught in the act, not imagined in a lab. (The "not Paul" is his own
joke, a man tired of being confused with someone else, now preserved forever in the kernel's
permanent record because he happened to notice a fire that had smoldered since 2005.)

The fix was authored on October 13th and committed five days later, on the 18th — the day before
the public write-ups appeared, with a request to ship it back through every supported kernel. Five
days between a finished fix and its public commit, ending the day before the world is told, is the
shape a coordinated disclosure leaves behind.

The repair itself was tiny — thirteen lines — and its idea was, in spirit, the very thing Linus
tried in 2005: check the dirty bit properly. It took eleven years to ship, not because the idea was
wrong, but because the ground it needed — a fixed s390 — didn't exist yet. And, as always in this
book, the fix wasn't the end: a forgotten twin case caused an infinite loop and had to be patched
in 2017, and as late as 2022 the whole mechanism was reworked, in a commit that finally said the
name out loud — *"Ever since the Dirty COW (CVE-2016-5195)…"* Six years on, the bug had become a
landmark other engineers steer by, the way sailors name a reef after the ship that found it.

## What it cost

This is why it isn't a curiosity. Dirty COW let any unprivileged user on a machine turn "I can
read this file" into "I am root." The vulnerable code shipped in every Linux kernel from September
2007 until the 2016 fix — roughly nine years, which by then meant most of the servers on the
internet and, through Android, a huge share of the world's phones. The exploit was fast, reliable,
and left nothing in the logs. It was patched in the mainline kernel within days of Oester's
report — but between "the mainline kernel" and "the billions of devices running it" stands every
vendor and carrier who has to ship the update, and many never did. The fix was eleven years late to
the source, and for a great many phones it never arrived at all.

## At home

The habit here is a specific paranoia, aimed at your revert button. When you back out a fix — for a
real, defensible reason, the way those engineers did in 2005 — the danger it addressed does not go
back in the box. It goes to sleep, and it sleeps exactly as long as your reason stays true. The
2005 revert was correct, and it left nothing behind, and "nothing behind" is what cost eleven
years. So when you revert something that closed a hole, leave a live tripwire, not a memory: a
comment that says *this is safe only because of X — revisit when X changes*, or a test that screams
when the unsafe condition returns, or an issue naming the reverted commit. Any of them turns
"someone has to remember" into "the code remembers."

And when you're on the other side — staring at a suspicious line, a flag that guards something
expensive — don't reach for `git blame`, which only explains the lines that survived. Reach for
`git log -S` on the exact text and read every commit that ever added or removed it, oldest first. A
protection added, reverted, and only restored eleven years later isn't noise. It's an argument the
code had with itself, and the reason it's set the way it is lives in the message of whoever set it
last. Linus rebuilt the entire eleven-year arc from two hashes because someone had written them
down. The history remembers what the three smartest people in the room forgot. You only have to
ask it.

---

*The 2005 fix and its two-day undo, the 2016 confession commit, the "not Paul" credit, the
five-day disclosure gap, and the 2017–2022 tail are all real and public, reproducible with a git
command each. The full technical dig is here:
[Fixed once (badly) by me eleven years ago — the full dig](17-dirtycow.full.html).*
