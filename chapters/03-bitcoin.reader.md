# A flag with 8 commits

Every software project keeps a ledger of who did what. Ask Bitcoin's ledger to count the work of
its creator — the famous pseudonym, the person nobody has ever identified — and this is what it
prints, verbatim:

```console
 245  s_nakamoto
  26  Satoshi Nakamoto
   8  --author=Satoshi Nakamoto
```

Three spellings of one name, three counts. The first two are what you would expect: the pseudonym
as an old version-control system recorded it, and the pseudonym as a plain name. Look at the third
row. It is credited with eight pieces of work, and it is not a person. It is a typo — a fragment
of a command that a real, identifiable human typed by hand in the summer of 2010, and the ledger
has been faithfully crediting that fragment as a contributor ever since.

This is the story of how a man tried to do a respectful thing, made a one-character mistake while
doing it, and how that mistake became a permanent part of the most studied software history in the
world.

## The janitor

To understand it you have to know where the ledger came from. Bitcoin did not start out in the
repository everyone studies today. For its first eight months it lived somewhere else, on an older
system, and the history that later became official was a *copy* — kept alongside the original,
patches carried over one by one.

In the middle of 2010 the project was quietly changing hands. The founder was still around, but a
new name had arrived: Gavin Andresen, who would go on to run the project for the next half-decade.
And he arrived the way maintainers almost always arrive — doing chores. His very first entry in the
ledger is not a grand design. It is a fix for line endings. He was cleaning the floor so the new
copy of the house would be livable.

Two weeks later, he was carrying the founder's patches across from the old system into the new one.
Which is where the flag comes from.

## The respectful thing

Here is what Gavin was trying to do, and it is the opposite of careless.

When you copy someone else's work into a ledger, the honest move is to make sure the ledger says
*they* wrote it, not you. Git — the tool keeping the ledger — has a switch for exactly that. You
tell it "record the author as this person," and it writes down the real author while noting that you
were merely the one who filed it. It is the generous, correct thing to do. Gavin was preserving the
founder's name on the founder's work.

What actually got written into the ledger, eight times over five days at the end of July 2010, was
not the founder's name. It was the founder's name *with the switch still attached to the front of
it* — the instruction "record the author as" glued onto the value, as if the two were one string.

Picture filling in a form where the box says *Author:* and instead of writing a name you write
"Author: Satoshi Nakamoto" — the label and all — into the box. Somewhere a quotation mark landed one
character away from where it should have been, and the shell handed git the whole phrase as data.
Git, which does not judge, wrote down exactly what it was given.

And you can see the intention and the error in the same place. Each of those eight entries records
Gavin as the person who filed it, and the misquoted switch as the person who wrote it. The honest
impulse and the slip, side by side, in one object.

Sweeter still: the *correct* version of one of those same patches is sitting right there in the same
history, applied properly on the old system the same day, credited cleanly to the founder. Same
change, same day, done right — on one branch of the project's early life. On the other branch it is
credited to a flag. Both are in the ledger. Neither was ever corrected.

## Why nobody fixed it

You would expect someone to have cleaned this up. Sixteen years, thousands of contributors. Surely
you fix eight entries that credit a piece of work to a command-line argument.

The deep fix is genuinely impossible — and here is the part most people never think about. In git,
the name of the author is not a sticker on the outside of the work. It is *inside* the work. Every
entry in the ledger has an identity — a long fingerprint — and that fingerprint is computed from
everything in the entry, author included. Change the author and the fingerprint changes. Change one
fingerprint and every entry that came after it, which refers back to it, changes too. The whole
chain, forward, forever. And Bitcoin is a project whose entire reason for existing is the idea that
a chain of fingerprints should be tamper-evident, whose history has been copied independently by
thousands of people. You do not rewrite that chain to fix a cosmetic typo.

But there is also a shallow fix, and git ships it: a small note you can add to a repository saying
"when you see this string, display that name instead." It rewrites nothing — it just dresses the
output. Five minutes of work, done in thousands of projects. Bitcoin's repository contains no such
note. In sixteen years, nobody has even papered over the display.

~ The mistake is load-bearing now.

So the flag stands twice over: at the deep layer, protected by the same immutability that makes the
project worth studying — and at the shallow layer, where it could be hidden in five minutes, by the
fact that nobody minds. The most famous absent author in software has, among his credited work,
eight pieces signed by a fragment of a command, and the project has decided, year after year, that
this is fine.

## What to carry away

There is a small, useful lesson here, and it is not "be more careful with quotation marks."

It is that in git, a name is not metadata sitting *beside* the work. It *is* the work,
cryptographically. Which means authorship is at the same time the easiest thing in the world to fake
— type any name you like into that switch and git will believe you — and the hardest thing in the
world to fix, because correcting it means changing everything downstream. Both of those facts are
true at once, and both of them live in these eight entries.

So two habits. When you go to preserve someone's name on their work — the decent, generous thing
Gavin was doing — look at what you are actually about to file before you file it, because you will
not get a second chance. And when you are reading an old history and find a strange author on some
piece of work, do not assume it is who it says it is. Do not even assume it is *what* it says it is.
Sometimes it is a person. Sometimes it is a flag.

---

*All three ledger entries, the eight commits, the correctly credited twin, and Gavin's first
line-endings fix are real and public. The full technical dig — with every command you can run
yourself on a clone of the repository — is here: [A flag with 8 commits — the full dig](03-bitcoin.full.html).*
