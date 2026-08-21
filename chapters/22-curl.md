# This major disk crash

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [This major disk crash](22-curl.html).*

The first commit of curl contains a copy of curl.

Here is the ledger's own listing — a selection from the tree of the root commit, dated December
29th, 1999, titled `Initial revision`, 144 files, 37,273 insertions [R1, R2]:

```console
$ git -C repos/curl ls-tree -r --long ae1912cb0d494b48d514d937826c9fe83ec96c4d | awk '$5=="CHANGES" || $5=="Makefile" || $5=="config.cache" || $5=="config.log" || $5=="config.status" || $5=="curl-6.3.1.tar.gz" || $5=="src/curl" || $5 ~ /^curl.*patch$/'
100644 blob 34cc7bf83ce0739690cee6e5fab993d7acb685d9   72928	CHANGES
100644 blob 0eaf99620d26bd02992030c4382f71e16af72b7d   12983	Makefile
100644 blob ba8353a0d1c15691912bff0769341cc08866f2a8    4548	config.cache
100644 blob ac13614e42bc5ec48a804e41635c876ba4969e1c    3858	config.log
100755 blob 8c3de4b68fa32c94f7c8a4ea91fe9f000eb20b0d   20162	config.status
100644 blob 38bba51aa8910f0d41d755f44a007753df656eb0  242680	curl-6.3.1.tar.gz
100644 blob 25a1b3b60c7861ca33acca5ec01c72a6358c7185   19010	curl.beos-patch
100644 blob 242e308f9f25c6b3e7d2de4521e69ec2d70446cc   36246	curl_631_general.patch
100644 blob 03738dbc037c1ff723ef4fe469e402bda88c70a7    2328	curl_63_form.patch
100644 blob 9df65e232bb489e07de21815f07975d429441eb0    3051	curl_63_partialdl.patch
100755 blob cba40a4c0c9a3d5d2992840616c9f4f7d8af9340 1830293	src/curl
```

Look at what is in there. `config.cache`, `config.log`, `config.status` — the droppings a build
leaves behind, files I would normally keep out of a repository. A stack of `.patch` files. A
release tarball of the *previous* version, `curl-6.3.1.tar.gz`, a quarter megabyte of compressed
history sitting inside the history. And `src/curl`, mode `100755`, 1.8 million bytes: a compiled,
executable binary of the program, checked into its own first commit.

No one composes a first commit like this. A first commit like this is not composed at all. It is a
shovel-load — a working directory picked up whole, dirt and all, and set down inside a
version-control system. Which raises the only question worth asking about it: what happened right
before this?

For once, the repository answers in plain words.

## Five weeks earlier

Among those 144 files is `CHANGES`, the project's hand-kept log — 72,928 bytes of it, years of
dated entries, already ancient at the moment of the "first" commit. Its top entries are days old:
Version 6.4, with work dated the 27th and 28th of December [R3], the day before the root. This is
not a cold archive being deposited. It is a working tree in mid-stride.

Scroll down a page and you reach late November, and this [R4]:

```console
$ git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | sed -n '43,52p'
   different directories than the sources.

Version 6.3.1

Daniel (23 November 1999):
 - I've had this major disk crash. My good old trust-worthy source disk died
   along with the machine that hosted it. Thank goodness most of all the
   things I've done are either backed up elsewhere or stored in this CVS
   server!
```

The disk died on November 23rd. The repository begins thirty-six days later. Curl's "Initial
revision" is not an initiation — the sequence makes it read as a recovery: everything that
survived, gathered up and committed in one motion, tarball and binary and build droppings
included, by someone who had just watched a machine take his source with it.

And the ballast goes back over the side soon enough. Twelve days later [R6]:

```console
$ git -C repos/curl show --format='%H%n%aI%n%an <%ae>%n%s' --stat 067a75e8957a91fb3407d1112931991998ae9219
067a75e8957a91fb3407d1112931991998ae9219
2000-01-10T23:29:47+00:00
Daniel Stenberg <daniel@haxx.se>
removed junk files

 config.cache            |   86 ----
 config.h                |  220 ---------
 config.log              |   90 ----
 config.status           |  492 ------------------
 curl-6.3.1.tar.gz       |  Bin 242680 -> 0 bytes
 curl.beos-patch         |  695 --------------------------
 curl_631_general.patch  | 1265 -----------------------------------------------
 curl_63_form.patch      |   92 ----
 curl_63_partialdl.patch |  106 ----
 9 files changed, 3046 deletions(-)
```

The subject is blunt: `removed junk files`. The tarball, the patches, the config droppings — 3,046
lines of recovery scaffolding, deleted once the project was safely breathing again. But deleted
from the *tip*, not from history. The shovel-load is still sitting in the root, permanently, which
is the only reason this chapter can show it to you. The emergency was cleaned up; the evidence of
the emergency is forever.

## Before the beginning

`CHANGES` has one more thing to say, and it is about how far back a project can reach past its own
first commit. Read the file's *bottom* — its oldest entries [R5]:

```console
$ git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | tail -12
 - Implemented URLs (and skipped the old syntax).
 - Output is written to stdout, so to achieve the above example, do:
   httpget http://143.54.10.6/info_logo.gif > test.gif

Version 1.1
 Daniel Stenberg <Daniel.Stenberg@sth.frontec.se>
 - Adjusted it slightly to accept named hosts on the command line. We
   wouldn't wanna use IP numbers for the rest of our lifes, would we?

Version 1.0
  Rafael Sagula <sagula@inf.ufrgs.br>
  - Wrote the initial httpget, which started all this!
```

The log does not begin with curl, and it does not begin with Daniel Stenberg. It bottoms out at a
tool called **HttpGet**, version 1.0, by Rafael Sagula — *"Wrote the initial httpget, which started
all this!"* — with Stenberg arriving at version 1.1 as the person who "Adjusted it slightly." The
project's own history file, kept at the repository's tip, supplies the dates: Sagula released
HttpGet 0.1 on November 11th, 1996; Stenberg's first release with his additions came on December
17th of that year, and he quickly became the project's maintainer [R5].

So the true stack of beginnings runs: someone else's tool, 1996; Stenberg takes it over, weeks
later; it becomes curl; a disk dies, November 1999; and only *then*, December 1999, does the
git-visible "Initial revision" happen — a recovery snapshot of an already three-year-old project
originally written by somebody else. Every layer of that is invisible if you read the root
commit's subject line and stop.

## The other endpoint

Run the camera forward, because the man shoveling his surviving files into CVS at the end of 1999
is still here. Ask the clone for his latest commit [R8]:

```console
$ git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp --format='%H %aI %cI %an <%ae> %s' 695aa15743685a9d46c4c41bb9c95221d4659541 | head -1
695aa15743685a9d46c4c41bb9c95221d4659541 2026-08-18T23:58:16+02:00 2026-08-19T07:49:55+02:00 Daniel Stenberg <daniel@haxx.se> urldata: remove the aptr struct
```

His first commit is this repository's root. His latest, as of this dig, is its *tip* — August 18th,
2026, at two minutes to midnight, still refactoring internals. Same email address on both. A little
over twenty-six years apart, with 39,474 commits and 1,507 mailmapped authors in between, of which
Stenberg authored 20,578 [R7].

But the record is more honest than a monopoly, and the exceptions are the part I would frame [R10]:

```console
$ git -C repos/curl log --use-mailmap --format='%ad%x09%aN' --date=format:'%Y' 695aa15743685a9d46c4c41bb9c95221d4659541 | awk -F '\t' '{count[$1 SUBSEP $2]++; years[$1]=1} END {for (year in years) {max=0; leader=""; for (key in count) {split(key, part, SUBSEP); if (part[1]==year && (count[key]>max || (count[key]==max && part[2]<leader))) {max=count[key]; leader=part[2]}} if (leader != "Daniel Stenberg") print year, max, leader}}' | sort -n
2008 649 Yang Tse
2009 492 Yang Tse
2013 664 Steve Holme
2014 664 Steve Holme
2025 1352 Viktor Szakats
2026 888 Viktor Szakats
```

Six calendar years when somebody else out-authored Stenberg: Yang Tse in the late 2000s, Steve
Holme in the mid-2010s, and — look at the dates — Viktor Szakats right now, in 2025 and 2026.

Be careful what that proves. These rows do not show a handover: they show annual author counts,
nothing about who holds the keys, and the 2026 figure runs only to the August pin. Stenberg
authored the tip commit himself. What the rows do show is work distributing — the one-person
project has never been only one person, and at the head of the history the year's volume has moved
to someone else without a single commit marking it as a moment.

## What was almost lost

Here is why the 1999 shovel-load is more than a curiosity. The tool whose source sat on that dying
disk is now, by its own project's estimate, running in more than twenty billion installations —
inside phones, cars, tablets, game consoles, servers, and desktop operating systems.
<!-- VERIFIED: the curl project estimates more than twenty billion curl installations worldwide (Stenberg's own repeated figure, acknowledged as an estimate), across phones, cars, tablets, game consoles, servers and desktop OSes. https://everything.curl.dev/project/users.html and https://thenewstack.io/the-world-runs-20-billion-instances-of-curl-wheres-the-support/ -->
Practically all of it is still maintained by a project where one person authored more than half the
commits.

In November 1999, one physical home of that future was the "good old trust-worthy source disk," and
it died. What stood between curl and oblivion was the unglamorous redundancy the entry itself
names — the CVS server and backups kept elsewhere — and then, thirty-six days later, a root commit
that preserved a working tree whole enough to include its own tarball, patches, build residue, and
compiled binary. The ugliest first commit in this book is ugly for the best reason there is: it was
made by someone who had just learned, the hard way, what happens when the tidy version of your
project exists in only one place.

## At home

Go look at your project's actual beginning — not the README's story, the root: `git rev-list
--max-parents=0 HEAD`, then `git ls-tree -r --long <root>`, and sort your eye by size. Read what is
really in there. A tarball inside the tree, build droppings, a compiled binary, a `CHANGES` file
already years long — any of those can be a fossil of the day someone moved, rescued, or recovered
the project, and the subject line may not say so. Then read the oldest log file *as it existed at
the root* (`git show <root>:CHANGES | tail`), because the pre-history of a project — the other tool
it used to be, the other person who started it — survives in the files when it survives at all.

And when the root turns out to be a shovel-load, before you judge whoever made it, check its date
against the nearest disaster. Somewhere near the ugliest first commit you will ever inherit, there
may be a sentence like *I've had this major disk crash* — written by the person who saved
everything you now get to read.

## Receipts

- **R1** `git -C repos/curl rev-list --max-parents=0 ...` + `show --shortstat ... ae1912cb0d49...` — the sole root: 1999-12-29, Daniel Stenberg, "Initial revision," 144 files, 37,273 insertions.
- **R2** `git -C repos/curl ls-tree -r --long ae1912cb0d49... | awk ...` — the root tree holds `config.cache`/`config.log`/`config.status`, four `.patch` files, the prior release tarball `curl-6.3.1.tar.gz` (242,680 bytes), and the built executable `src/curl` (mode 100755, 1,830,293 bytes).
- **R3** `git -C repos/curl show ae1912cb0d49...:CHANGES | sed -n '1,25p'` — the root `CHANGES` opens at Version 6.4 with entries dated 27–28 December 1999, the days before the root commit.
- **R4** `... | sed -n '43,52p'` — the 1999-11-23 entry: "I've had this major disk crash. My good old trust-worthy source disk died along with the machine that hosted it. Thank goodness most of all the things I've done are either backed up elsewhere or stored in this CVS server!"
- **R5** `... :CHANGES | tail -12` + `show 695aa157...:docs/HISTORY.md | sed -n '15,24p'` — the log bottoms out at HttpGet 1.0 by Rafael Sagula ("Wrote the initial httpget, which started all this!"), Stenberg at 1.1 ("Adjusted it slightly"); HISTORY.md dates HttpGet 0.1 to 1996-11-11 and Stenberg's first release with his additions to 1996-12-17.
- **R6** `git -C repos/curl show --stat ... 067a75e8957a...` — 2000-01-10, subject `removed junk files`: tarball, patches, and config droppings deleted; 9 files, 3,046 deletions. (`src/curl` is not among them.)
- **R7** `rev-list --count` + `shortlog -sn` at pin `695aa157...` — 39,474 commits, 1,507 mailmapped authors; Daniel Stenberg authored 20,578.
- **R8** `git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp` (reverse head / head) — his first authored commit is the root (1999-12-29); his latest is the pinned tip (2026-08-18, "urldata: remove the aptr struct").
- **R9** decade aggregation of `log --use-mailmap --format='%ad%x09%aN'` — top five authors per author-date decade in the clone.
- **R10** year-leader aggregation — the six years led by another author: Yang Tse 2008–09, Steve Holme 2013–14, Viktor Szakats 2025–26 (2026 partial, to the August pin).
