# The nine minutes

It is a Tuesday afternoon in May 2006, and somewhere a maintainer named Kurt Roeckx has a bug to
close before he gets up from his desk. Not a glamorous bug. A tooling complaint — one of those
tickets that sits in your queue with a number attached, someone else's warning on someone else's
code, waiting for you to make the red text stop so you can move on to the next one.

He opens the file. He makes a small change. Nine minutes later he commits it and, in every sense
that mattered to him that afternoon, he is done.

He has just made every encryption key his operating system will generate for the next two years
guessable by a stranger. He will not find out for twenty months. Almost nobody will. And the whole
thing — the mistake, the moment it goes live, the moment it's caught — is sitting in plain view in
a version-control history that anyone can download today. This is the story of those nine minutes,
reconstructed from the record they left behind.

## What the machine was doing

To feel the mistake, you have to know one strange thing about how a computer makes a secret.

When your laptop generates an encryption key — for a secure website, for logging into a server —
it needs randomness. Real, unguessable randomness, the kind that doesn't come naturally to a
machine that does exactly what it's told. So the software scrapes together every unpredictable
scrap it can find: the exact time, the process's ID number, a trickle of noise the operating
system keeps around for exactly this purpose. It stirs all of that into a pool, and the secret is
drawn from the pool.

The particular software here, OpenSSL, did something that looked insane to an outsider. To gather
*even more* unpredictability, it would also stir in a handful of raw, uninitialized memory —
whatever leftover junk happened to be sitting in a chunk of the computer it hadn't filled in yet.

Think of it as a cook sweeping whatever is already on the floor into the pot. A health inspector
would faint. But this is not a kitchen, it is a randomness pool, and the entire goal is chaos.
Garbage nobody can predict is *good* garbage. The cooks knew it looked filthy, and they had left
themselves a note in the code, years earlier, saying so — a small comment, in one exact spot,
that amounted to: *yes, we know this one line looks wrong; leave it, it's on purpose.*

That note is where the trouble starts. Because a note that says "leave this one line alone" reads,
to the next person who comes along on a Tuesday with a bug to close, a lot like *permission*.

## The nine minutes

Here is Kurt's problem, in plain terms. A memory-checking tool — the software equivalent of a
smoke detector for sloppy code — was shrieking about that deliberate scoop of floor-dust. Reading
uninitialized memory is exactly the kind of thing the detector exists to catch, and it could not
tell "reckless bug" from "reckless on purpose." So it screamed. The bug report was, essentially:
*make the smoke detector stop.*

The obvious way to make it stop is to not scoop the floor-dust. And in the file, there were two
places that did the scooping, and they looked almost identical — same function call, same shape.
So Kurt did the natural, tidy, symmetrical thing: he commented out both of them. Silence the
detector in both spots. Close the ticket.

Here is what that change did, in pseudocode, with the C stripped away:

```pseudocode
before:   stir in ( the floor-dust )              <- detector complains here
          stir in ( the real seed )

after:    # stir in ( the floor-dust )            <- commented out; detector goes quiet
          # stir in ( the real seed )             <- ...also commented out
```

Look at the second line. One of the two calls he silenced was not scooping floor-dust at all. It
was the line that stirred in *the real seed* — the time, the process ID, the good randomness, the
actual point of the whole exercise. The two calls looked alike. They did not do alike. One was
decoration; the other was the engine.

~ He had not silenced a false alarm. He had switched off the randomness.

From that moment, the pool the secret gets drawn from is fed by essentially one thing: the
process's ID number. And on a Linux machine, that number is smaller than 33,000. An encryption key
is supposed to be one unguessable choice out of a number so large it has no name. Now it is one
choice out of thirty-odd thousand — a raffle you could run out of a spreadsheet.

Nothing about the commit looked like a catastrophe. The message was routine. It closed a bug. It
slipped into a housekeeping entry and read, to anyone glancing at it, like tidying. That is the
first uncomfortable truth of this story: the worst change was indistinguishable from the most
boring one.

## Four months of nothing

And then — a mercy, and a trap.

For four months, the mistake did nothing at all. Because Kurt had put the edited file in the wrong
folder.

The way this software was packaged, the maintainer's edits were laid over the original code like a
stencil — you cut a hole exactly where you want to change something, and everywhere else the
original shows through. Kurt had cut his hole one folder to the side of where the program actually
looked. So the computer, building the software, walked right past his sabotaged file and used the
clean original. The broken version was checked in, dated, real — and completely inert. A loaded
gun in the wrong drawer.

The smoke detector, of course, kept complaining, because the fix wasn't really in effect. So four
months later, on a Sunday afternoon, Kurt fixed the *filing*. He moved the file into the right
folder. He changed not a single line of its contents — just its location. The commit message says,
with a small note of satisfaction, that he is *really* fixing the bug this time.

~ That Sunday is the moment the gun moved into the loaded drawer.

Everything the operating system shipped from then on was built from the broken file.

There was one last chance to catch it, and this is the cruelest detail in the whole affair. When
Kurt moved the file, the code briefly wouldn't compile — a small syntax problem in one of the two
edits. The compiler, the last automatic check standing between him and disaster, threw an error
and forced him to look.

But it threw the error on the *harmless* edit — the floor-dust one — because of an unrelated quirk
in how that particular line was written. The fatal edit, the one that killed the real seed,
compiled perfectly and said nothing. Kurt fixed the thing the compiler pointed at, and shipped.

~ The last safety check was staring at the wrong line.

## What it cost

For twenty months, every secure server key, every website certificate, every VPN credential
created on one of the world's most popular operating systems came out of that crippled pool.

Here is what makes it uniquely bad, and it is worth slowing down for, because it is not what
"broken encryption" usually means. The keys still *looked* perfect — long, official, impressive
strings of numbers. Nothing about them announced they were weak. But every one was drawn from that
raffle of thirty-odd thousand possibilities. So an attacker didn't need to break anything. They
could generate all thirty-odd thousand possible keys in advance, once, and keep them on a shelf.
Then, when they saw your key in the wild, they didn't attack it.

~ They looked it up.

The repair, when it finally came in May 2008, was almost insultingly small: delete the comment
marks, let the real seed flow again. One line, essentially, undone. The commit that did it named
the exact function Kurt had silenced two years earlier — a maintainer writing down, at last, the
precise thing he'd switched off without knowing.

And here is a small, sharp lesson hiding in that fix. Its message never once said "security." It
never said "regenerate your keys." It never mentioned the disaster by name. If you searched the
entire history today for the official code of this catastrophe — one of the most serious in the
history of open-source software — you would find *nothing*, because the people who fixed it
described it the way they'd experienced it: as a bug in a random number generator, quietly closed.
The worst events don't announce themselves in the record. They wear the same clothes as the
boring ones.

## The thing worth carrying away

Nobody in this story was a fool, and nobody was a villain. Kurt Roeckx was doing careful,
conscientious work — closing a ticket, silencing a warning, keeping a giant piece of shared
infrastructure tidy on a Tuesday afternoon. The tragedy is built entirely out of reasonable moves.
A note that meant "leave this alone" got read as "this is safe to remove." Two lines that looked
the same weren't. A safety check looked at the wrong one.

If there is one habit to take from it, it is this: be careful the day you *quiet* a warning. A tool
complaining about your code is annoying, and the fastest way to make it stop is often to remove the
thing it's pointing at. But sometimes the tool is right, and the annoyance is the only thing
standing between you and a mistake you won't notice for two years. The moment you reach to silence
an alarm is exactly the moment to ask, once, out loud: *what is it actually trying to tell me?*

---

*Want the receipts? Every claim above is reconstructed from real commits you can download and check
yourself — the exact timestamps, the six-line change, the wrong folder, the compiler's misfire, the
one-sentence fix. The full technical dig, with every command, is here: [The nine minutes — the full dig](01-debian-openssl.full.html).*
