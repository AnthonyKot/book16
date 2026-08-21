# This major disk crash

The first commit of curl contains a copy of curl.

Not a description of curl, not the source that builds it — those are there too. I mean a compiled,
executable binary of the program, 1.8 million bytes of it, checked in as one file among 144 in the
project's own first commit. Alongside it: a release tarball of the *previous* version, a quarter
megabyte of compressed history sitting inside the history. A stack of patch files. And the
droppings a build leaves behind — `config.cache`, `config.log`, `config.status` — the files I would
normally keep out of a repository.

No one composes a first commit like this. A first commit like this is not composed at all. It is a
shovel-load: a working directory picked up whole, dirt and all, and set down inside a
version-control system. Which raises the only question worth asking about it — what happened right
before this?

For once, the repository answers in plain words.

## Five weeks earlier

Among those 144 files is `CHANGES`, the project's hand-kept log — 72,928 bytes of it, years of
dated entries, already ancient at the moment of the "first" commit. Its newest entries are days
old, dated the 27th and 28th of December 1999, the day before the root. This is not a cold archive
being deposited somewhere safe. It's a working tree caught mid-stride.

Scroll down a page and you reach late November, and this:

> **Daniel (23 November 1999):** I've had this major disk crash. My good old trust-worthy source
> disk died along with the machine that hosted it. Thank goodness most of all the things I've done
> are either backed up elsewhere or stored in this CVS server!

The disk died on November 23rd. The repository begins thirty-six days later. Curl's "Initial
revision" is not an initiation — the sequence makes it read as a *recovery*: everything that
survived, gathered up and committed in one motion, tarball and binary and build junk included, by
someone who had just watched a machine take his source with it.

The ballast goes back over the side soon enough. Twelve days later, a commit titled, bluntly,
`removed junk files` deletes the tarball, the patches, and the config droppings — 3,046 lines of
recovery scaffolding, dropped once the project was safely breathing again. But deleted from the
*present*, not from the past. The shovel-load is still sitting in the root commit, permanently,
which is the only reason you can see it. The emergency was cleaned up; the evidence of the
emergency is forever.

## Before the beginning

That `CHANGES` file has one more thing to say, and it's about how far back a project can reach past
its own first commit. Read its *bottom* — the oldest entries:

> **Version 1.1** — Daniel Stenberg — Adjusted it slightly to accept named hosts on the command
> line. We wouldn't wanna use IP numbers for the rest of our lifes, would we?
>
> **Version 1.0** — Rafael Sagula — Wrote the initial httpget, which started all this!

The log doesn't begin with curl, and it doesn't begin with Daniel Stenberg. It bottoms out at a
tool called HttpGet, by a Brazilian developer named Rafael Sagula — *"which started all this!"* —
with Stenberg arriving one version later as the person who "adjusted it slightly." The project's
own history file fills in the dates: Sagula released HttpGet in November 1996; Stenberg's first
release with his own additions came that December, and he quickly became the maintainer.

So the real stack of beginnings runs: somebody else's tool, 1996; Stenberg takes it over, weeks
later; it becomes curl; a disk dies, November 1999; and only *then*, at the end of December, does
the git-visible "Initial revision" happen — a recovery snapshot of an already three-year-old
project originally written by someone else. Every layer of that is invisible if you read the root
commit's subject line and stop.

## The other endpoint

Now run the camera forward, because the man shoveling his surviving files into CVS at the end of
1999 is still here. His first commit is this repository's root. His most recent, as of this dig, is
its *tip* — August 18th, 2026, at two minutes to midnight, still refactoring internals. The same
email address on both, a little over twenty-six years apart, with 39,474 commits and 1,507 authors
in between — of which Stenberg wrote 20,578.

But the record is more honest than a monopoly, and the exceptions are the part I'd frame. Ask which
years someone *else* out-committed him and you get six: Yang Tse in the late 2000s, Steve Holme in
the mid-2010s, and — look at the dates — Viktor Szakats right now, in 2025 and 2026.

Be careful what that proves. Those rows show annual commit counts, not a handover: nothing about
who holds the keys, and the 2026 number only runs to August. Stenberg wrote the newest commit
himself. What the rows *do* show is work distributing — the one-person project has never been only
one person, and at the head of the history the year's volume has moved to someone else, without a
single commit anywhere marking it as a moment.

## What was almost lost

Here's why the 1999 shovel-load is more than a curiosity. The tool whose source sat on that dying
disk now runs, by its own project's estimate, in more than twenty billion installations — inside
phones, cars, tablets, game consoles, servers, and desktop operating systems.
<!-- VERIFIED: the curl project estimates more than twenty billion curl installations worldwide (Stenberg's own repeated figure, acknowledged as an estimate), across phones, cars, tablets, game consoles, servers and desktop OSes. https://everything.curl.dev/project/users.html and https://thenewstack.io/the-world-runs-20-billion-instances-of-curl-wheres-the-support/ -->
Practically all of it is still maintained by a project where one person wrote more than half the
commits.

In November 1999, one physical home of that future was a "good old trust-worthy source disk," and
it died. What stood between curl and oblivion was the unglamorous redundancy the entry itself names
— a CVS server and backups kept elsewhere — and then, thirty-six days later, a first commit that
preserved a working tree whole enough to include its own tarball, patches, build residue, and
compiled binary. The ugliest first commit I know of is ugly for the best reason there is: it was
made by someone who had just learned, the hard way, what happens when the tidy version of your
project exists in exactly one place.

## At home

Go look at your project's actual beginning — not the README's story, the root commit. List its
files and sort your eye by size. Read what's really in there. A tarball inside the tree, build
droppings, a compiled binary, a changelog already years long — any of those can be a fossil of the
day someone moved, rescued, or recovered the project, and the commit message may not say a word
about it. Then read the oldest log file *as it existed at that root*, because the pre-history of a
project — the other tool it used to be, the other person who started it — survives in the files
when it survives nowhere else.

And when a root turns out to be a shovel-load, before you judge whoever made it, check its date
against the nearest disaster. Somewhere near the ugliest first commit you'll ever inherit, there
may be a sentence like *I've had this major disk crash* — written by the person who saved
everything you now get to read.

---

*The 144-file root with its compiled binary, the disk-crash entry five weeks earlier, the "removed
junk files" cleanup, the HttpGet pre-history, and the twenty-six years between one author's first
and latest commits are all real and public, reproducible with a git command each. The full
technical dig is here: [This major disk crash — the full dig](22-curl.full.html).*
