# empty commit to trigger a github mirror

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [empty commit to trigger a github mirror](16-empty.html).*

It is 2:08 in the morning, a Thursday in May 2015, and a PHP release manager named Ferenc
Kovacs has a problem that no file on his disk can fix. The code is fine. The pipes are stuck:
PHP's real home is its own server, GitHub is a mirror of it, and the mirror wakes up and pulls
only when it sees a new commit arrive. He has nothing to change and needs the mirror to move
anyway. So he makes a commit that changes nothing. Ask git what it did — compare the snapshot
this commit stores against the snapshot its parent already stored:

```console
$ git -C repos/php rev-parse '00d8e26d71^{tree}' '00d8e26d71^^{tree}'
a064a669874bc010c940635e33981edf3f74e62a
a064a669874bc010c940635e33981edf3f74e62a
```

[R1] The same hash, twice. A git commit points at a *tree* — a complete snapshot of every file
in the project — and two commits with the same tree hash contain the identical project, to the
byte. This commit's tree is its parent's tree. Nothing was added, removed, or altered. It is an
empty commit, and it announces its whole reason for living in its subject line:

```console
$ git -C repos/php show -s --format='%s' 00d8e26d71
empty commit to trigger a github mirror
```

[R1] A knock on a door with no one behind it. The code was already right; what he needed was for
a machine watching the graph to *notice*, and the smallest thing a machine will notice is a new
commit. So he manufactured one made of pure notice — and git, which keeps everything, kept it.
The permanent history of one of the most deployed languages on earth now contains a 2 a.m.
doorbell that rang once and changed not a line.

It has a twin in, of all places, the Swift compiler. On a branch nobody ever merged, an Apple
engineer left this:

```console
$ git -C repos/swift show -s --format='%h %ai %an%n%s' 63fd0d0ea6
63fd0d0ea6d 2021-12-17 11:01:36 -0800 Anders Bertelrud
Empty commit for CI
```

[R2] Same trick, same tree-equals-parent emptiness [R2], said even plainer: `Empty commit for
CI`. Continuous integration — the robots that build and test a project — fire on new commits, so
when you need them to run and have nothing to change, you commit nothing. This one survives to be
found only because it lives on a stale engineering branch that was spun up to make the robots run
and then abandoned [R2]: a doorbell still ringing in a room that got locked.

## you are here

Two years on and a world away from a CI trigger, an OpenSSL developer named Hugo Landau is
somewhere in the middle of the kind of work that keeps maintainers up at night: a long,
dangerous restructuring of the QUIC networking code, files cracked open across the whole
subsystem, the sort of change where in three months a colleague — or he himself — will be
staring at the history trying to reconstruct what order any of it happened in. At 10:27 one
morning in November 2023, seconds apart, he plants four signposts:

```console
$ for h in 304e56e870 a96f48995e cbf4b68333 99655cb91d; do git -C repos/openssl show -s --format='%h %ai %an | %s' $h; done
304e56e8703 2023-11-09 10:27:13 +0000 Hugo Landau | MARKER: End of Phase 1: Unused QUIC_PORT
a96f48995ed 2023-11-09 10:27:13 +0000 Hugo Landau | MARKER: End of Phase 2: Transfer of Responsibilities Done, Legacy Compat Retained
cbf4b68333d 2023-11-09 10:27:14 +0000 Hugo Landau | MARKER: End of Phase 3: Legacy Cleanup
99655cb91d6 2023-11-09 10:27:14 +0000 Hugo Landau | MARKER: End of Phase 4: Finalization & SRT Handling
```

[R3] Four commits, each carrying the exact snapshot of the one before it [R3], each changing
nothing, each a chapter break driven into the history itself: *the work behind you was Phase 2;
the work ahead is Phase 3.* A refactor that touched the whole subsystem becomes a book with
labeled sections, and the section breaks are empty commits. He could have written those
boundaries in a design doc or a pull-request description — but those are not where a future
reader spelunking through `git log` will be. The graph is. So he wrote the table of contents into
the graph, in commits that hold nothing but their own titles, for a stranger he will never meet
who is trying to read his mind.

~ A commit is an event with an optional payload. Take the payload away and the event is still there — which is sometimes the entire point.

## the deed and its echo

The last kind is the strangest, because it wears the clothes of real work. In FFmpeg, in 2026:

```console
$ git -C repos/ffmpeg show -s --format='%h %ai %an%n%s' 7df9a56f0d
7df9a56f0d2 2026-03-11 21:48:33 +0800 Zhao Zhili
avformat/rtmpproto: fix listen_timeout conversion for special negative values
```

That is a real bug fix's subject — a named file, a specific defect. But its tree is its parent's:

```console
$ git -C repos/ffmpeg rev-parse '7df9a56f0d^{tree}' '7df9a56f0d^^{tree}'
9b69b789e7e03903fadeb92bb08c71f5a648b849
9b69b789e7e03903fadeb92bb08c71f5a648b849
```

[R4] Empty. This is a release-maintenance branch, and the fix was *already there* — cherry-picked
in earlier — so applying it again did nothing, yet the commit was kept, cherry-pick trailer and
all [R4]. It is a receipt: a permanent, deliberate note that says *this fix was considered and
handled for this branch*, filed even though there was nothing left to file. The paperwork of the
backport outliving the work of it, on purpose.

Node.js has the same shape without the certainty of intent. In December 2014 — days after the
project had been forked and renamed to io.js, its governance in open revolt, its maintainers
landing a backlog under real pressure — a contributor's patch was committed, and then committed
again, twelve minutes later:

```console
$ git -C repos/node show -s --format='%h %aI committed %cI by %cn%n%s' 766d063e05 71e9d0fb1b
766d063e057 2014-12-03T18:28:40+11:00 committed 2014-12-04T21:20:28+11:00 by Rod Vagg
configure: remove shared cares build option
71e9d0fb1b4 2014-12-03T18:28:40+11:00 committed 2014-12-04T21:32:05+11:00 by Rod Vagg
configure: remove shared cares build option
```

[R5] Same patch, twice, twelve minutes apart. The first did the work; the second is empty,
because by the time it landed the first was already its ancestor:

```console
$ git -C repos/node merge-base --is-ancestor 766d063e05 71e9d0fb1b && echo 'first landing is already an ancestor of the second'
first landing is already an ancestor of the second
```

[R5] Whether the second was a deliberate receipt or a duplicate landed by a tired maintainer
clearing a queue, git cannot tell you and neither can I — and that is exactly the line worth
seeing. FFmpeg's empty commit was a speech act, meant. Node's may have been an accident. Git
recorded both identically, because git does not record intent; it records events, and an event
with nothing in it is still an event. The deed and its echo, kept side by side, indistinguishable
in the graph.

## At home

The one mechanical fact under all of this: a commit is not its diff. It points at a whole-project
snapshot, and when that snapshot equals its parent's — same tree hash — the commit changed
nothing while remaining a full, permanent, attributed, timestamped event. Which gives you a
reading habit and a writing tool. Reading: when a commit's message promises a change, don't trust
it, check it — `git rev-parse '<commit>^{tree}' '<commit>^^{tree}'` prints the same hash twice
when nothing moved, and a fix-shaped subject sitting on an empty tree is almost always a receipt,
not a fraud, which will stop you hunting for a diff that was never there. Writing: reach for `git
commit --allow-empty` whenever you need to say something to the graph that has no home in a file —
wake a pipeline, divide a refactor, mark that a thing was decided — and it will leave a note,
signed and dated, in the one place your teammates are guaranteed to look.

Sometimes the most useful thing a commit can do is exist.

## Receipts

- **R1** `git -C repos/php rev-parse '00d8e26d71^{tree}' '00d8e26d71^^{tree}'` (equal) + `show -s --format='%s'` — 2015-05-28, Ferenc Kovacs, "empty commit to trigger a github mirror"; commit tree identical to parent tree.
- **R2** `git -C repos/swift show -s 63fd0d0ea6` + `rev-parse` (equal) + `branch -r --contains` — 2021-12-17, Anders Bertelrud, "Empty commit for CI," empty, reachable only from a stale `eng/` remote branch.
- **R3** `git -C repos/openssl show -s` for the four `MARKER: End of Phase N` commits (2023-11-09, Hugo Landau) + `rev-parse` on the first (equal) — empty commits used as phase dividers in a QUIC migration.
- **R4** `git -C repos/ffmpeg show -s 7df9a56f0d` + `rev-parse` (equal) + `%b | grep 'cherry picked'` — 2026-03-11, Zhao Zhili, a real-looking backport whose tree is empty because the fix was already present; keeps the cherry-pick trailer.
- **R5** `git -C repos/node show -s 766d063e05 71e9d0fb1b` + `rev-parse '71e9d0fb1b^{tree}' '71e9d0fb1b^^{tree}'` (equal) + `merge-base --is-ancestor` — the same patch landed twice twelve minutes apart; the second landing is empty because the first is already its ancestor.

*Full transcripts: `chapters/16-empty.receipts.md` (regenerate with `scripts/receipts-16.sh`).*
