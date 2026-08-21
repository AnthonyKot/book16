# This major disk crash

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [This major disk crash](22-curl.html).*

The first commit of curl contains a copy of curl.

I want to show you that before I explain it, because the ledger's own listing is better than any
paraphrase. Here is a selection from the tree of curl's root commit — the very first thing in the
history of the tool that now moves data for practically everything with a network plug — dated
December 29th, 1999, titled `Initial revision`, 144 files, 37,273 lines [R1, R2]:

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

Look at what is *in* there. `config.cache`, `config.log`, `config.status` — the droppings a build
leaves behind, the files every tutorial tells you never to commit. A stack of `.patch` files. A
release tarball of the *previous* version, `curl-6.3.1.tar.gz`, a quarter megabyte of compressed
history sitting inside the history. And — my favorite object in this entire book — `src/curl`,
mode `100755`, 1.8 million bytes: a compiled, executable *binary* of curl, checked in as file
number one-hundred-and-something of the project's first commit.

No one composes a first commit like this. A first commit like this is not composed at all. It is
a *shovel-load* — a working directory picked up whole, dirt and all, and set down inside a
version-control system. The question a first commit like this asks is: what happened right before
this? And for once, the repository answers in plain words.

## Five weeks earlier

Among the 144 files is `CHANGES`, the project's hand-kept log — 72,928 bytes of it, years of
dated entries, already ancient at the moment of the "first" commit. Scroll down a page from its
top and you reach late November 1999, five weeks before the root, and this entry [R4]:

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

*I've had this major disk crash. My good old trust-worthy source disk died along with the machine
that hosted it.* There it is — the event standing just outside the frame of the root commit,
recorded by the survivor himself, inside the very tree that survived. The disk died in November.
The repository begins in December. Curl's "Initial revision" is not an initiation. It is a
*recovery* — a man gathering everything that was "backed up elsewhere or stored in this CVS
server," tarball, binary, build droppings and all, and getting it under version control before
the universe could take another swing at it. You do not curate a shovel-load like that when you
have just watched a disk die with your source on it. You commit first and tidy later.

And tidy he did. Twelve days into the new year, the ballast goes back over the side [R6]:

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

"Removed junk files." The tarball, the patches, the config droppings — 3,046 lines of recovery
scaffolding, deleted the moment the project was safely breathing again. But deleted from the
*tip*, not from history: the shovel-load is still right there in the root, permanently, which is
the only reason this chapter can show it to you. The emergency was cleaned up. The evidence of
the emergency is forever.

## Before the beginning

The `CHANGES` file has one more thing to say, and it is about how far back a project can reach
past its own first commit. Read the file's *bottom* — the oldest entries in the log [R5]:

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
tool called **HttpGet**, version 1.0, by Rafael Sagula — *"which started all this!"* — with
Stenberg entering at version 1.1 as the guy who "adjusted it slightly." The project's own history
file, kept at the repository's tip, fills in the dates: Sagula, a Brazilian developer, released
HttpGet 0.1 on November 11th, 1996; Stenberg's first release as the new maintainer followed
within weeks [R5]. So the true stack of beginnings runs: someone else's tool, 1996; Stenberg
takes it over, 1996; it becomes curl; a disk dies, November 1999; and only *then*, December 1999,
does the git-visible "Initial revision" happen — a recovery snapshot of an already three-year-old
project originally written by somebody else. Every layer of that is invisible if you read the
root commit's subject line and stop.

## The other endpoint

Now run the camera forward, because the man shoveling his surviving files into CVS at the end of
1999 is still there. Ask the pinned clone for Stenberg's first and latest commits [R8]:

```console
$ git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp --reverse --format='%H %aI %cI %an <%ae> %s' 695aa15743685a9d46c4c41bb9c95221d4659541 | head -1
ae1912cb0d494b48d514d937826c9fe83ec96c4d 1999-12-29T14:20:26+00:00 1999-12-29T14:20:26+00:00 Daniel Stenberg <daniel@haxx.se> Initial revision
```

```console
$ git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp --format='%H %aI %cI %an <%ae> %s' 695aa15743685a9d46c4c41bb9c95221d4659541 | head -1
695aa15743685a9d46c4c41bb9c95221d4659541 2026-08-18T23:58:16+02:00 2026-08-19T07:49:55+02:00 Daniel Stenberg <daniel@haxx.se> urldata: remove the aptr struct
```

His first commit is the repository's root. His latest, as of this dig, is the repository's *tip*
— August 18th, 2026, at two minutes to midnight, still refactoring internals. The same email
address on both. Twenty-six and a half years separate those two lines, and the ledger between
them holds 39,474 commits by 1,507 different people, of which Stenberg wrote **20,578** — more
than fifty-two percent, more than the other 1,506 combined [R7]. Group the years into decades
and he leads every one of them: the 2000s, the 2010s, the 2020s [R9].

But the record is more honest than a monopoly, and the exceptions are the part I'd frame [R10]:

```console
$ git -C repos/curl log --use-mailmap --format='%ad%x09%aN' --date=format:'%Y' 695aa15743685a9d46c4c41bb9c95221d4659541 | awk -F '\t' '{count[$1 SUBSEP $2]++; years[$1]=1} END {for (year in years) {max=0; leader=""; for (key in count) {split(key, part, SUBSEP); if (part[1]==year && (count[key]>max || (count[key]==max && part[2]<leader))) {max=count[key]; leader=part[2]}} if (leader != "Daniel Stenberg") print year, max, leader}}' | sort -n
2008 649 Yang Tse
2009 492 Yang Tse
2013 664 Steve Holme
2014 664 Steve Holme
2025 1352 Viktor Szakats
2026 888 Viktor Szakats
```

Six calendar years, out of twenty-eight, when somebody else out-committed the founder: Yang Tse
in the late 2000s, Steve Holme in the mid-2010s, and — look at the dates — Viktor Szakats *right
now*, in 2025 and 2026. The one-person project has never been only one person, and at the tip of
the history the annual lead has, quietly, changed hands. The founder's name is on the newest
commit; the year's volume belongs to someone else. Nothing in the repository marks this as a
moment. That is exactly why it is worth noticing: succession in a healthy project doesn't look
like Vim's held breath. It looks like a shortlog, gradually rebalancing, while everyone is busy
working.

## What was almost lost

Here is the consequence that makes the 1999 shovel-load more than a curiosity. The tool whose
source sat on that dying disk is now, by its own project's accounting, among the most widely
deployed pieces of software in existence — it ships inside operating systems, cars, televisions,
and phones, in billions of installations. <!-- CHECK: curl is installed in the tens of billions
of devices/instances per the project's own estimates (curl.se); ships by default in Windows,
macOS, iOS, Android, cars, TVs; needs external source. --> Practically all of it is maintained,
to this day, with one person writing half the commits. In November 1999 the physical home of that
future was one "good old trust-worthy source disk," and the disk died. What stood between curl
and oblivion was the boring redundancy of a CVS server and some scattered backups — and the
founder's instinct, five weeks later, to commit *everything he still had*, junk and binaries
included, before sorting any of it. The ugliest first commit in this book is ugly for the best
reason there is: it was made by someone who had just learned, the hard way, that the tidy version
of your project is worth nothing if it exists in one place.

## At home

Go look at your project's actual beginning — not the README's story, the root: `git rev-list
--max-parents=0 HEAD`, then `git ls-tree -r --long <root>` and sort your eye by size. Read what
is really in there. A tarball inside the tree, build droppings, a compiled binary, a `CHANGES`
file already years long — every one of those is a fossil of the day someone moved, rescued, or
recovered the project, and the subject line will almost never say so. Then read the oldest log
file *as it existed at the root* (`git show <root>:CHANGES | tail`), because the pre-history of a
project — the other tool it used to be, the other person who started it — survives, when it
survives at all, in the files, not in the commits. And when you find your own root is a
shovel-load: before you judge it, check the dates against the nearest disaster. Somewhere five
weeks before the ugliest first commit you will ever inherit, there is usually a sentence like
*I've had this major disk crash* — written by the person who saved everything you now get to
read.

## Receipts

- **R1** `git -C repos/curl rev-list --max-parents=0 ...` + `show --shortstat ... ae1912cb0d49...` — the sole root: 1999-12-29, Daniel Stenberg, "Initial revision," 144 files, 37,273 insertions.
- **R2** `git -C repos/curl ls-tree -r --long ae1912cb0d49... | awk ...` — the root tree holds `config.cache`/`config.log`/`config.status`, four `.patch` files, the prior release tarball `curl-6.3.1.tar.gz` (242,680 bytes), and the built executable `src/curl` (mode 100755, 1,830,293 bytes).
- **R3** `git -C repos/curl show ae1912cb0d49...:CHANGES | sed -n '1,25p'` — the root CHANGES opens at Version 6.4, dated entries from late December 1999.
- **R4** `... | sed -n '43,52p'` — the 1999-11-23 entry: "I've had this major disk crash. My good old trust-worthy source disk died along with the machine that hosted it… backed up elsewhere or stored in this CVS server!"
- **R5** `... :CHANGES | tail -12` + `show 695aa157...:docs/HISTORY.md | sed -n '15,24p'` — the log bottoms out at HttpGet 1.0 by Rafael Sagula ("which started all this!"), Stenberg entering at 1.1; HISTORY.md dates HttpGet 0.1 to 1996-11-11 and Stenberg's maintainership to December 1996.
- **R6** `git -C repos/curl show --stat ... 067a75e8957a...` — 2000-01-10, "removed junk files": the tarball, patches, and config droppings deleted; 9 files, 3,046 deletions.
- **R7** `rev-list --count` + `shortlog -sn` at pin `695aa157...` — 39,474 commits, 1,507 mailmapped authors; Daniel Stenberg 20,578.
- **R8** `git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp` (reverse head / head) — his first commit is the root (1999-12-29); his latest is the pinned tip (2026-08-18, "urldata: remove the aptr struct").
- **R9** decade aggregation of `log --use-mailmap --format='%ad%x09%aN'` — Stenberg leads the 1990s/2000s/2010s/2020s in the clone.
- **R10** year-leader aggregation — the six years led by others: Yang Tse 2008–09, Steve Holme 2013–14, Viktor Szakats 2025–26.
