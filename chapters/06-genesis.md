# Initial revision

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [Initial revision](06-genesis.html).*

The oldest thing in the PHP repository is nothing.

I mean that precisely. Ask git to print the founding commit of the language that ran half the
early web, raw:

```console
$ git cat-file -p f70a4db647
tree 4b825dc642cb6eb9a060e54bf8d69288fbee4904
author SVN Migration <svn@php.net> 923508610 +0000

    Standard project directories initialized by cvs2svn.
```

The author is a robot. The message is a robot's. And that tree — `4b825dc642...` — is a famous
object: it is the hash of the empty tree, the name git gives to nothing at all. You can mint it
yourself from `/dev/null`. [R1] The first commit of PHP contains zero bytes of PHP. A conversion
tool, marching CVS into Subversion years after the fact, needed a place to hang "standard project
directories," and git — which does not store empty directories — faithfully preserved the result:
a genesis with no world in it.

## The robot's title card

The rest of PHP's first morning has the same handwriting. The robot's empty root is timestamped
18:10:10 on 7 April 1999. The next commit — Andi Gutmans importing the entire Zend engine,
thousands of lines — is timestamped 18:10:10. The same second. [R1] No human commits a world in
the same second as an empty directory; a converter's clock does. Eight minutes later, the
inventor of PHP makes his first appearance in his own language's history. Rasmus Lerdorf's first
recorded act, in full:

```console
$ git show a6043d3e1e
    *** empty log message ***
 
+
 #include "zend.h"
```

One blank line, above an include. [R2] The man who created the language enters its permanent
record adding whitespace, under a message the tooling wrote for him because he didn't leave one.
PHP itself was years old by then — none of that life is here.
<!-- CHECK: PHP dating to 1994 (PHP/FI) — public record, not in this repo; the repo's own first payload is already version 4-era Zend code. -->
The founding is one repository over, or in a tarball, or gone. What this git remembers begins the
morning two people imported a rewrite.

Python's is subtler, and I like it more, because it looks so plausible. Every history of the
language repeats the date: Guido van Rossum, 9 August 1990, `Initial revision`. And there it is
at the top of the log, exactly as advertised. [R3] Now look one commit down. The second commit,
a month later, with a different message — `Warning about incompleteness.` — has the *identical
tree*. Byte for byte, the same content, two different moments. [R3] Commits that change nothing
are what conversion robots leave behind when they novelize a stack of RCS check-ins into a
linear story.

Then open the file inside the 9 August commit. The README ends:

```console
$ git show 7f777ed95a:Doc/README | tail -2
--Guido (last modified 10 Sep 90)
```

[R4] The file in the August commit signs off in September. The content contradicts its own
timestamp, and when a file and its date disagree, the date is the artifact. The raw object
confesses the whole journey in one line — `HG:extra convert_revision:svn%3A...` — a git commit
carrying a Mercurial header that quotes a Subversion path. [R5] Three version control systems
deep, and at the bottom of the shaft, a title card. The repository contains 178 commits whose
subject is exactly `Initial revision`. [R4] They are not initial. They are not revisions. They
are the stamp a machine put on paperwork it could not read.

~ The date on a famous first commit is a title card, typed by whoever did the last conversion.

## The cut

The other way a genesis goes missing is that a human decides it should, and the largest software
project on earth has its decision in writing. The Linux kernel's first commit is folklore —
`1da177e4c3f4` — but almost nobody reads past the version number in its subject. The message:

```console
$ git log -1 --format='%B' 1da177e4c3f4
Linux-2.6.12-rc2

Initial git repository build. I'm not bothering with the full history,
even though we have it. ...
Let it rip!
```

[R6] Sit in his April for a second, because the decision is more reasonable than it reads.
It is 2005. BitKeeper is gone; git is nine days old, a hand tool with no porcelain — we watched
it being built one chapter ago. He has fourteen years of Linux history, 1991 to 2005, sitting
right there — *even though we have it* — and importing it means asking his newborn, unproven tool
to swallow 3.2GB before anyone has written the infrastructure that would make that bearable. So
he weighs the whole recorded past of the world's most important open project against the next
Saturday afternoon of usable tooling, cuts, and says so in the commit. The first object in what
is now a 1.4-million-commit history is 17,291 files arriving from nowhere, 6.7 million lines with
no past. It is the most honest first commit in this chapter: a cut that tells you it is a cut,
and then — *Let it rip!* — drives off.

Most cuts don't announce themselves; you have to read for the seams. Redis's day one is
timestamped 10:30:00, on a Sunday — zero seconds, the first seam. The tree it delivers says the
rest: the license reads `Copyright (c) 2006-2009` — three years older than the repository — and
the source declares `REDIS_VERSION "0.07"`. [R11] Version 0.07 of a thing does not appear in a
first commit; it appears when a private project is carried into the light, its adolescence edited
out. The author, it turns out, is a connoisseur of the form: sixteen years later, starting a new
phase of his life with the project, antirez minted himself *another* root, a 2025 parentless
commit titled `First internal release.` [R12] Genesis, for him, is not an event. It is a genre.

Bitcoin's cut is a postcard with the wrong signature. Day one is 30 August 2009 — the network it
implements had been mining since January —
<!-- CHECK: Bitcoin network live since 2009-01 (genesis block) — public record, not provable from this repo. -->
and the hand that types `First commit` belongs to a handle, `sirius-m`, that matches nothing in
the tree it imports: the readme inside announces `BitCoin v0.1.5 ALPHA / Copyright (c) 2009
Satoshi Nakamoto`. [R9, R10] Eight months of the founder's shipped work arrive as somebody
else's day one — and they arrive twice. The import ran two ways, and the history keeps twin
roots: same subject, identical trees, two different hashes, sitting side by side like a document
notarized by two clerks. [R9] Satoshi's January keystrokes are in neither.

~ Day one of a clone is wherever the importer happened to be standing.

## The funeral

OpenTTD:

```console
$ git log --reverse --format='%s' | head -1
(svn r1) Import of revision 975 of old (crashed) SVN
```

Revision one *is* revision 975. [R13] The project's previous version control system died — took
with it revisions 1 through 974, the entire recorded act of creation — and a developer named
truelight stood in the wreckage on an August afternoon with whatever the last backup held.
Consider what that afternoon is like. The work is safe — the *tree* survived — but the story is
gone: every author, every date, every wrong turn of revisions 1 through 974, the whole record of
how a group of strangers rebuilt a beloved game, unrecoverable. What do you do? You type the
truth into the subject line — *old (crashed) SVN* — and you start counting again from one. The
tree that lands in "r1" is already a shipping game: 129,220 lines, fourteen languages, a readme
declaring `Release version: 0.3.3`, a keyword timestamp frozen two weeks before the crash. [R13]
Everything this book would most want to watch happened in a repository that no longer exists.
The first commit is a funeral, and the funeral is the founding.

## The accident

Back to the kernel, because the cut Linus made in 2005 turns out not to be the strangest thing
about its origins. Ask the honest question — not `log --reverse`, but *how many parentless
commits does this history contain*:

```console
$ git log --max-parents=0 --format='%aI %an %s' origin/master
2016-02-23 ldewangan          Share upstreaming patches
2014-08-11 Greg Kroah-Hartman greybus: Initial commit
2007-01-26 Chris Mason        Btrfs: Initial checkin, basic working tree code
2005-04-16 Linus Torvalds     Linux-2.6.12-rc2
```

Four. [R7] There at the bottom is the honest cut we just read — and it has acquired three
siblings. Two are deliberate: btrfs and greybus were born in their own repositories and merged
in, histories and all. The 2016 one is nobody's decision at all. An engineer at NVIDIA, Laxman
Dewangan, starts a scratch repository to pass patches around; its entire founding tree is a
two-line README:

```console
$ git show a101ad9451:README.md
# linux-upstream
This is for sharing upstreaming activities.
```

Picture his Tuesday. He needs his work based on the GPIO maintainer's latest tree, so, standing
on his scratch branch, he merges that tree into it — unrelated histories, sure, but the merge
does what he needs and the patches get where they are going. Then the GPIO work is integrated
upstream, and the scratch root rides along into the mainline kernel. The README file itself is
long gone from the tip. The commit is not, and can never be: it is an ancestor of `master`,
permanently. [R7, R8]

~ Every clone of Linux, forever, carries a second creation story, and it reads: "This is for
sharing upstreaming activities."

Nobody decided that. No one would. A merge of unrelated histories doesn't feel like an act of
cosmology when you run it — it feels like Tuesday — but `--max-parents=0` does not forget, and
now the kernel's book of Genesis has four first pages, one of which is a note a man left for
himself.

## The control case

There is one repository left to ask, and it is the one none of these tricks could reach: the tool
itself could not have a history before it existed. Git's repository begins with git's own birth —
eleven files, written in an afternoon we have already sat through, committed with the two-hour-old
tool they implement, by the man who typed them. [R14] Its subject line:

```console
$ git log --reverse --format='%s' | head -1
Initial revision of "git", the information manager from hell
```

*Initial revision.* The phrase the conversion robot stamped on Python's paperwork 178 times,
false every time — here, once, it is the plain truth. You have to build the recorder itself to
earn it.

## At home

Ask your own repository the honest question: `git log --max-parents=0 --all`. You may believe you
know the answer. If a subtree was ever squashed in, a fork absorbed, a scratch repo merged on
some forgotten Tuesday, you have more geneses than you think, and each one is a story. And when
you meet a famous "first commit," read it the way an archivist reads a document — not "what does
it say" but "who made this copy, and what did they leave out." The seams are always the same:
a clock too round, an author too robotic, a copyright older than the repository, a version number
north of 0.1, a file that contradicts its own date. None of this makes the history worthless. It
makes it a document with a provenance.

~ Day one of the clone is day one of the container.

The thing itself began somewhere the log cannot see. Once you know that, `log --reverse` stops
being a window and becomes what it always was: the first page someone chose to keep.

## Receipts

- **R1** `git -C repos/php log --reverse | head -4` + `cat-file -p f70a4db647` + `hash-object -t tree /dev/null` — robot root at the empty tree `4b825dc642...`; Andi Gutmans's Zend import at the identical second 18:10:10.
- **R2** `git -C repos/php show a6043d3e1e` — Rasmus Lerdorf's first mark: one blank line, "*** empty log message ***".
- **R3** `git -C repos/cpython log --reverse | head -3` + `rev-parse 7f777ed95a^{tree} 3310257195^{tree}` — first two commits, different dates, identical tree.
- **R4** `git -C repos/cpython show 7f777ed95a:Doc/README | tail -2` — "--Guido (last modified 10 Sep 90)" inside the 9 Aug commit; 178 subjects exactly `Initial revision`.
- **R5** `git -C repos/cpython cat-file -p 7f777ed95a | head -6` — `HG:extra convert_revision:svn%3A...`: an hg header quoting an svn path inside a git object.
- **R6** `git -C repos/linux log -1 --format='%B' 1da177e4c3f4` + `diff-tree --root --shortstat` — "I'm not bothering with the full history, even though we have it. ... Let it rip!"; 17,291 files, 6,718,755 insertions.
- **R7** `git -C repos/linux log --max-parents=0 origin/master` + `show a101ad9451:README.md` — four roots; the 2016 root is "# linux-upstream / This is for sharing upstreaming activities" (ldewangan@nvidia.com).
- **R8** `merge-base --is-ancestor a101ad9451 origin/master` (yes) + `cat-file -e origin/master:README.md` (gone) — the genesis is permanent; the file is not.
- **R9** `git -C repos/bitcoin show -s 4405b78d60 e071a3f6c0` + `rev-parse ...^{tree}` — "First commit" twice: same tree, two hashes, one with a `git-svn-id` trailer; author `sirius-m`.
- **R10** `git -C repos/bitcoin show 4405b78d60:readme.txt | head -3` — "BitCoin v0.1.5 ALPHA / Copyright (c) 2009 Satoshi Nakamoto".
- **R11** `git -C repos/redis log --reverse | head -1` + `show ed9b544e10:COPYING | head -1` + `grep REDIS_VERSION` — 10:30:00 sharp; "Copyright (c) 2006-2009"; `REDIS_VERSION "0.07"`.
- **R12** `git -C repos/redis log --max-parents=0 --all` — four roots, including antirez's 2025 `First internal release.`
- **R13** `git -C repos/openttd log --reverse | head -1` + `diff-tree --root --shortstat efaeb275f7` + `show efaeb275f7:readme.txt | head -3` — "(svn r1) Import of revision 975 of old (crashed) SVN"; 129,220 lines; "Release version: 0.3.3".
- **R14** `git -C repos/git log --reverse | head -1` — `e83c516331`, "Initial revision of 'git', the information manager from hell": the control case.

*Full transcripts: `chapters/06-genesis.receipts.md` (regenerate with `scripts/receipts-06.sh`).*
