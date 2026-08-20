# THIS IS A HACK TO GET V4 OUT THE DOOR

Buried inside PostgreSQL — the database quietly running underneath a huge share of the world's
software — there is a number, and the number is one third.

Here is what it does. When the database receives a query, it has to *plan* how to run it, and to
plan well it needs to estimate how many rows each condition will match. Usually it has
statistics to work from. But when a condition is something it can't measure — a function call in
a `WHERE` clause, say — it has to fall back on a pure guess, and its guess is: one third of the
rows will match. That single number then shapes how the entire query gets executed.

Why one third? No reason at all. It's a placeholder. And we know it's a placeholder because the
person who wrote it left a note. The note is from 1992 — the code predates the modern project,
having been inherited from a decade of academic work at Berkeley — and it is written, in
capital letters, like a man in a hurry:

> THIS IS A HACK TO GET V4 OUT THE DOOR. FUNCS SHOULD BE ABLE TO HAVE SELECTIVITIES THEMSELVES.
> -- JMH 7/9/92

Picture that afternoon. July 1992, a deadline to ship version 4 of the academic Postgres, a
programmer who needs the planner to produce *some* answer, no time to work out the correct one.
So he types `0.3333333`, shouts into the comment that this is a hack and somebody should really
do it properly, and ships. This is the story of what happened to that hack over the next
thirty-three years — three decisions across ten years, all about a hack already decades old —
and the surprising truth that the right move, every time, was to leave it alone.

## 2015: the fix he doesn't make

Fast-forward to 2015. The one-third guess has by now silently shaped the behavior of every
PostgreSQL database on earth for twenty-three years. And Tom Lane — who has worked on this
project since 1998 and is, as we'll see, very nearly its single most prolific contributor — is
working in exactly the file where that guess lives. In fact he's building real improvements to
it: for certain function calls, he adds the ability to use actual statistics instead of the
blind guess.

Which means the old placeholder is right there, and the perfect moment to finally delete it has
arrived. He's already replacing the guess with something real wherever he can. Why not clean up
the leftover — swap that unprincipled one-third for something more defensible — and finish the
job the 1992 note literally asked for?

He refuses, and writes down why: *changing a default estimate that's survived for twenty-three
years seems like something not to do without a lot more testing than I care to put into it.*

Read that carefully, because it isn't laziness — it's the opposite. The number is wrong. But it
has been wrong, *in exactly the same way,* for twenty-three years. Which means every database
index, every tuned query, every application that runs acceptably today does so on top of that
specific wrong number. Change it, and you'd instantly re-plan millions of live queries — some
faster, some catastrophically slower — with no way to know in advance which. A wrong answer that
the entire world has quietly adapted to is no longer simply a bug. It has become a kind of
promise.

## 2023: the feature he won't build

The same instinct shows up again, in a sharper form. For years, users had asked for a specific
feature: the ability to delete a single value from a list-of-allowed-values type (an "enum"). It
sounds simple. It is, in fact, a minefield — that value might be sitting inside existing data,
inside saved queries, inside the internal structure of indexes.

Rather than build it badly, or wait for someone else to try, in 2023 Tom Lane did something
unusual. He added the feature's *syntax* to the database — so you can now type the command — and
wired it up to do exactly one thing: refuse, and print a checklist of the hard problems that
would have to be solved first. He even said so in his own note: *this is really just a docs
patch.*

Why go to the trouble of building a command that only rejects itself? Because he put the warning
in the one place the next person to attempt the feature is guaranteed to look: the exact syntax
they'd have to start from. A wiki page, a mailing list — those are places people skip before
diving in. The code is not. So he shipped, in effect, the reasons *not* to ship the thing,
planted right at the door.

## 2025: the fix he undoes

And then the decision that ties it all together. In 2025 — ten years after he declined to touch
it — a well-intentioned cleanup finally removed that one-third fallback for some cases, on the
sensible grounds that the database had better tools now. Tom Lane put it back. And the comment he
attached is the whole chapter in miniature:

> This seems a pretty unprincipled choice, but Postgres has been using that estimate for function
> calls since 1992. The hoariness of this behavior suggests that we should not be in too much
> hurry to use another value.

Set that beside the original 1992 note and watch the instruction completely flip. The first one
said: *this is a hack, replace it.* This one admits the choice is unprincipled — and then argues
that its very *age* is the reason to keep it. *Fix me* has become, over thirty-three years, *do
not fix me.* He restored a number a graduate student called a hack, and left a warning for the
next person tempted to be clever about removing it. It is still there today.

## The hand

You keep meeting the same name in this story because it is, remarkably, mostly one person. Tom
Lane's very first contribution to PostgreSQL, back in 1998, wasn't a grand feature — it was a
small fix to some compiler settings. In the twenty-seven years since, he has made **16,863**
changes to the project, more than any other human being in its history.

And the thread running through all of it is not the features he added. It's his judgment about
what *not* to disturb. The 1992 hack he guards. The enum feature he refuses to build and
documents instead. Anyone can admire the commit that adds something new. The work that actually
keeps a thirty-year-old database trustworthy is the quieter kind: the commit that adds a warning
where a feature was demanded, or that puts a wrong number back on purpose and explains why you
shouldn't touch it.

## At home

If you take one habit from this, take a healthy suspicion of your own urge to tidy. When you find
an ugly constant or an embarrassing `HACK` comment in code you've inherited, before you fix it,
go look at its history — search for who touched it and read what they said. Very often you'll
discover that someone with far more context already stood exactly where you're standing, felt the
same urge to clean it up, and deliberately chose not to — and wrote down why. The most valuable
thing in an old codebase is frequently not its elegant machinery but its load-bearing hacks: the
ugly bits that have been wrong for so long that everything else has quietly grown to depend on
them. The tell is a second comment stacked on the first — not "fix this," but "here is why fixing
this is the dangerous move." When you find that, you've found someone being careful on your
behalf across the years. Read it before you reach for the delete key.

---

*The 1992 hack comment, the 0.3333333 guess, Tom Lane's 2015 refusal and 2025 restoration, the
enum feature that ships as a warning, and his 16,863-commit record are all real and public,
reproducible with a git command each. The full technical dig is here:
[THIS IS A HACK TO GET V4 OUT THE DOOR — the full dig](15-postgres.full.html).*
