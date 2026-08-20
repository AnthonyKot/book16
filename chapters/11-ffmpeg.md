# As discussed

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [As discussed](11-ffmpeg.html).*

```console
$ git -C repos/ffmpeg log -1 --format='%aD%n%an%n%B' 111ccca602
Wed, 19 Jan 2011 18:53:53 +0100
Michael Niedermayer
Revert "Initial MAINTAINERS update"

This reverts commit f4f5cab94e0881cd30965b28f3d78d9c63d6918e.

Reason is that this has been mistakely commited as discussed.
```

One sentence of explanation, two spelling mistakes, and a phrase — *as discussed* — pointing
at a conversation that is not in the repository. [R1] What had been committed, mistakenly or
otherwise, the afternoon before? A deletion. Seven lines out of a file called `MAINTAINERS`:

```console
$ git -C repos/ffmpeg show --format='%aD %an <%ae>%n%s' f4f5cab94e -- MAINTAINERS
Tue, 18 Jan 2011 11:05:51 -0800 Jason Garrett-Glaser <jason@x264.com>
Initial MAINTAINERS update Per http://lists.mplayerhq.hu/pipermail/ffmpeg-devel/2011-January/103440.html.

-Project Leader
-==============
-
-Michael Niedermayer
-  final design decisions
```

[R2] A heading, a name, and a three-word job description. The man reverting the deletion is
the man the deleted lines name. Both commits cite a discussion — one links a mailing-list
thread, the other says *as discussed* — and git holds neither conversation. It holds what
people did afterward, for eleven years, and that turns out to be the better record.

## January

FFmpeg in the winter of 2011 is ten years old and inside half the video software on earth,
and it is governed the way many projects of that age are: the founder long gone, and one
successor holding "final design decisions." That arrangement is not absurd — a codebase this
dense benefits from one coherent technical will, and someone has to be able to say no. The
alternative the senior maintainers wanted is not absurd either — authority attached to the
subsystems people actually maintain, decisions by review instead of by office. Serious
engineers choose each of these structures every day, and the argument between them was real
on both sides. Git did not record the argument. It recorded the chores the argument
produced.

January 17: the project's git how-to is rewritten [R3]:

```console
$ git -C repos/ffmpeg show --format= ffe9fd253f -- doc/git-howto.txt | grep -E '^\+.*[Mm]erge' | head -1
+  Caveat: Since merge commits are forbidden at least for the initial
```

*Merge commits are forbidden. The master tree will reject pushes with merge commits.* On its
own, a defensible engineering rule — linear history, controlled integration; I have approved
that same paragraph in other projects. Remember it anyway. January 18: the MAINTAINERS edit
removes the leader section, citing the thread. January 19: the revert restores it, *as
discussed*.

~ The revert is the last commit in which this project is one project.

Within weeks, the group behind the edit left to found Libav — the same code and the same
history, continued under a different name and different governance — and for the next
several years the two trees developed side by side.
<!-- CHECK: Libav announced March 2011 by departing FFmpeg maintainers — public record; the split itself is off-repo. -->

## The string

The first thing the split made visible in the objects was a word. A new project needs its
own name in the code it ships, so in March 2011 Libav began renaming — first the docs and
configure in the shared tree, which the FFmpeg side reverted the next afternoon [R7], and
then, in the fork, this:

```console
$ git -C repos/ffmpeg show --shortstat --format='%aD %an %s' 2912e87a6c | tail -1
 1335 files changed, 5388 insertions(+), 5388 deletions(-)
```

[R7] `Replace FFmpeg with Libav in licence headers` — one word, exchanged 5,388 times in a
single commit. And because the trees kept trading history, the word became tidal: each
integration re-imported one name, each cleanup re-exported the other, for years. Today git
can answer one narrow question — which sentence stands at FFmpeg's HEAD:

```console
$ git -C repos/ffmpeg grep -l 'This file is part of Libav' HEAD | wc -l
0
$ git -C repos/ffmpeg grep -l 'This file is part of FFmpeg' HEAD | wc -l
5042
```

[R8] Zero and five thousand and forty-two. One part of a fork's long outcome, reduced to a
grep.

## qatar

How did the trees trade history, exactly? Here is the strangest sustained pattern I know of
in any repository. Seventy-five days after "merge commits are forbidden" entered the
FFmpeg how-to, this object was minted:

```console
$ git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%H %aI %an %s' --reverse | head -1
4defa68fe25eae4d7c27341e3b35811c047dcd3f 2011-04-02T01:51:44+02:00 Michael Niedermayer Merge remote branch 'qatar/master'
```

[R4] A merge — the forbidden object — of the other project's entire tree, from a remote
named `qatar`, at 01:51 in the morning. Then again the next night. Then:

```console
$ git -C repos/ffmpeg rev-list --count --min-parents=2 --grep=qatar HEAD
1151
$ git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%an' | sort | uniq -c
   1151 Michael Niedermayer
```

[R4] One thousand one hundred fifty-one qatar merges across three years — roughly one a day
— and every single one authored by the same person. Stop on what one of those objects *is*,
because I think you have to have done this work to feel the number. A merge of a rival tree
is not a click. It is reading what changed over there since yesterday; it is carrying both
lines of descent forward so the histories stay joined; and when the two sides have touched
the same file — which happens constantly between trees that share everything — it is
resolving the collision by hand, line by line, and owning the result. Some days that is
five minutes. Some days it is the whole evening. I have postponed a single such merge for a
week. This history contains eleven hundred and fifty-one of them, one author, and the hours
they were made:

```console
$ git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%ad' --date=format:%H | sort | uniq -c | sort -rn | head -3
    103 02
     94 14
     90 01
```

[R5] The most common hour is two in the morning; the second is two in the afternoon. The
objects say when. They do not say why, and I am not going to guess on a living man's
behalf. Read the histogram yourself and decide what to call it.

And then it stops:

```console
$ git -C repos/ffmpeg log -1 --format='%aI%n%B' 4899ccd295
2014-04-11T14:41:42+02:00
Merge remote-tracking branch 'qatar/master'

* qatar/master:
  DNxHD: convert inline asm to yasm

Conflicts:
	libavcodec/x86/Makefile
	libavcodec/x86/dnxhdenc.asm
```

[R6] The last qatar merge is an assembler port with two conflicted Makefiles. There is no
farewell in it, no line drawn. The remote simply never appears again. Git cannot say why
the cadence ended; the habit ended the way habits end.

## fftools/ffmpeg.c

Years later, doing the ordinary thing — asking for the biography of the project's most
famous file — I hit the strangest object in this dig. `git log --follow --
fftools/ffmpeg.c` says the file's history begins in October 2017. [R13] Seventeen years of
`ffmpeg.c` missing. So I opened the commit where the path first appears. It is a merge of a
Libav commit — Libav had reorganized its command-line tools under `avtools/`, with its tool
named `avconv.c`; FFmpeg's tool was `ffmpeg.c` at the root. Look at the three trees:

```console
$ git -C repos/ffmpeg ls-tree 'fd5f4ac081^1' ffmpeg.c | head -1
100644 blob 1d248bc269d8...	ffmpeg.c
$ git -C repos/ffmpeg ls-tree 'fd5f4ac081^2' avtools/avconv.c | head -1
100644 blob 5c36761c1d14...	avtools/avconv.c
$ git -C repos/ffmpeg ls-tree fd5f4ac081 fftools/ffmpeg.c | head -1
100644 blob 1d248bc269d8...	fftools/ffmpeg.c
```

[R13] The merged tree contains `fftools/ffmpeg.c` — a path that exists in *neither parent*.
The blob is byte-for-byte FFmpeg's old `ffmpeg.c`; the directory idea is Libav's; the
combination was coined inside the merge resolution itself. Six years into the split, the
two inheritances are still being spliced, path by path — and the splice left a trap:
`--follow` chases renames by comparing ordinary diffs, and a path born inside a merge
resolution is invisible to it. The most famous file in the project has a git biography
seventeen years shorter than its life.

## The office

Which leaves the seven lines from January. I expected the pickaxe to print a war. It
printed four commits, sixteen years apart:

```console
$ git -C repos/ffmpeg log -S 'Project Leader' --format='%h %ai %an %s' -- MAINTAINERS
07d930014d 2022-09-20 10:42:38 +0200 Anton Khirnov MAINTAINERS: remove the project leader section
111ccca602 2011-01-19 18:53:53 +0100 Michael Niedermayer Revert "Initial MAINTAINERS update"
f4f5cab94e 2011-01-18 11:05:51 -0800 Jason Garrett-Glaser Initial MAINTAINERS update
7f2a97537c 2006-02-08 11:32:03 +0000 Diego Biurrun List of people maintaining different parts of FFmpeg.
```

[R9] Created in 2006. Deleted and restored in the twenty-four January hours. And then two
entries from after everything, which between them say more than the whole 2011 archive.

July 2015: Niedermayer edits the section himself — and removes only his own name. [R10]
`MAINTAINERS: Remove myself as leader`. The heading stays. The phrase *final design
decisions* stays. What remains in the file, for the next seven years, is an office with no
one in it — a heading, a rule, and a blank where a person used to be. He does not stop
working; a decade later he is still among the most active names in the tree. He takes his
name off the door and leaves the office standing.

September 2022: the empty office is taken down. The commit is signed by Anton Khirnov —
third-most-prolific author in this repository's history [R12], and one of the developers
who had left for Libav in 2011.
<!-- CHECK: Anton Khirnov was among the Libav founders/maintainers — public record; in-repo his commits arrive via qatar merges during the fork years. -->
The forks had wound down; people had, one by one, come back to the shared tree. [R11]

```console
$ git -C repos/ffmpeg show -s --format='%B' 07d930014d | head -3
MAINTAINERS: remove the project leader section

The position does not exist anymore.
```

Not *he lost*. Not *we won*. A fact, four words, recorded eleven years late by someone who
had once left over it. The 2011 commits each cited a discussion git never held. This one
cites nothing. There was nothing left to discuss.

## At home

Two habits from this dig. First: pickaxe the headings, not just the names — `git log -S
'Some Heading' -- MAINTAINERS` (or OWNERS, or CODEOWNERS) prints a role's biography on one
screen, and the two commits worth reading closely are the one that deletes a *name* but
leaves the *section*, and the one, maybe years later, that deletes the empty section. Ask
what each meant in your project; here, one was a resignation and the other was the four
words above. Second: `git log --follow` your own most famous file before you trust its age
— a rename that happened inside a merge resolution will amputate its history without a
trace. And if your project ever survived a fork, find what the other tree's remote was
actually called, then count: `git log --grep=<name> --min-parents=2`. The written rule here
said merge commits are forbidden. The record says 1,151, all by one man, with two in the
morning as its most common hour. Believe the record.

## Receipts

- **R1** `git -C repos/ffmpeg log -1 --format='%aD%n%an%n%B' 111ccca602` — the restore, 2011-01-19: "Reason is that this has been mistakely commited as discussed."
- **R2** `git -C repos/ffmpeg show f4f5cab94e -- MAINTAINERS` — 2011-01-18, Jason Garrett-Glaser: the seven deleted lines (Project Leader / Michael Niedermayer / final design decisions), citing the mailing-list thread.
- **R3** `git -C repos/ffmpeg show ffe9fd253f -- doc/git-howto.txt` — 2011-01-17: "merge commits are forbidden… The master tree will reject pushes with merge commits."
- **R4** `git -C repos/ffmpeg log --grep=qatar --min-parents=2 --reverse | head -1` + `rev-list --count` + author uniq — first qatar merge 2011-04-02 01:51; 1,151 qatar merges, all authored by Michael Niedermayer.
- **R5** `git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%ad' --date=format:%H | sort | uniq -c | sort -rn` — hours: 103 at 02, 94 at 14, 90 at 01.
- **R6** `git -C repos/ffmpeg log -1 --format='%aI%n%B' 4899ccd295` — the last qatar merge, 2014-04-11: DNxHD yasm conversion, two conflicted paths, no farewell.
- **R7** `git -C repos/ffmpeg show --shortstat 2912e87a6c` + `log -1 c0b1bc8d17` — "Replace FFmpeg with Libav in licence headers," 1,335 files, 5,388 in / 5,388 out; the earlier partial rename reverted next day.
- **R8** `git -C repos/ffmpeg grep -l 'This file is part of Libav' HEAD | wc -l` (0) vs `'part of FFmpeg'` (5,042) — which sentence stands at HEAD.
- **R9** `git -C repos/ffmpeg log -S 'Project Leader' -- MAINTAINERS` — the section's four-commit biography, 2006–2022.
- **R10** `git -C repos/ffmpeg show f2c58931e6` — 2015-07-31, "MAINTAINERS: Remove myself as leader": only the name line deleted; heading and "final design decisions" remain.
- **R11** `git -C repos/ffmpeg show 07d930014d` — 2022-09-20, Anton Khirnov: "remove the project leader section / The position does not exist anymore."
- **R12** `git -C repos/ffmpeg shortlog -sn HEAD | head -5` + `rev-list --count --min-parents=2 --author='Michael Niedermayer'` — Niedermayer 30,170 commits (6,625 merges); Khirnov third all-time at 5,833.
- **R13** `git -C repos/ffmpeg ls-tree` on `fd5f4ac081^1`, `^2`, and the merge + `log --reverse --follow -- fftools/ffmpeg.c | head -1` — `fftools/ffmpeg.c` exists in neither parent, carries FFmpeg's exact blob, and `--follow` history starts 2017-10.

*Full transcripts: `chapters/11-ffmpeg.receipts.md` (regenerate with `scripts/receipts-11.sh`).*
