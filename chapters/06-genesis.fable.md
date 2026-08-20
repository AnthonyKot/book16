# Initial revision

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

I have a ritual for famous repositories, and I suspect you have it too: clone, then
`git log --reverse`, then scroll to the top and look at day one. This chapter is that ritual
performed on six projects the reader has heard of. I should warn you now that the ritual is a
séance. What answers is not usually the founder.

## The robot's title card

Stay with PHP a moment, because the whole first morning is instructive. The robot's empty root is
timestamped 18:10:10 on 7 April 1999. The next commit — Andi Gutmans importing the entire Zend
engine, thousands of lines — is timestamped 18:10:10. The same second. [R1] No human commits a
world in the same second as an empty directory; a converter's clock does. And eight minutes
later, the inventor of PHP makes his first appearance in his own language's history. Rasmus
Lerdorf's first recorded act, in full:

```console
$ git show a6043d3e1e
    *** empty log message ***
 
+
 #include "zend.h"
```

One blank line, above an include. [R2] The man who created the language enters its permanent
record adding whitespace, under a message the tooling wrote for him because he didn't leave one.
PHP itself was years old by then — none of that life is here.

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

The second kind of genesis lie is committed by humans, on purpose, and the largest software
project on earth commits it in writing. The Linux kernel's first commit is folklore —
`1da177e4c3f4` — but almost nobody reads past the version number in its subject. The message:

```console
$ git log -1 --format='%B' 1da177e4c3f4
Linux-2.6.12-rc2

Initial git repository build. I'm not bothering with the full history,
even though we have it. ...
Let it rip!
```

*I'm not bothering with the full history, even though we have it.* [R6] Fourteen years of Linux —
1991 to 2005 — exist, in his hands, and he leaves them out because the import would be 3.2GB and
git is nine days old. The first object in what is now a 1.4-million-commit history is 17,291
files arriving from nowhere, 6.7 million lines with no past. It is the most honest first commit
in this chapter: a cut that tells you it is a cut, and then — *Let it rip!* — drives off.

Most cuts don't announce themselves. Redis's day one looks like a birth until you read the
details like an examiner:

```console
$ git log --reverse --format='%aI %s' | head -1
2009-03-22T10:30:00+01:00 first commit
```

Ten-thirty and zero seconds, on a Sunday. Human commits do not land on :00; staged ones do. Open
the tree: the license says `Copyright (c) 2006-2009` — three years older than the repository —
and the source declares `REDIS_VERSION "0.07"`. [R11] Version 0.07 of a thing does not appear in
a first commit; it appears when a private project is carried into the light, its adolescence
edited out. And the author, it turns out, is a connoisseur of the form: sixteen years later,
starting a new phase of his life with the project, antirez minted himself *another* root — a
2025 parentless commit titled `First internal release.` [R12] Genesis, for him, is not an event.
It is a genre.

Bitcoin's cut is the strangest, because of who is missing. The repository's first commit lands on
30 August 2009 — the network it implements had been mining since January.

The author is `sirius-m`, an early volunteer — not the founder.

Inside the tree he imports, the readme announces someone else's ownership: `BitCoin v0.1.5 ALPHA
/ Copyright (c) 2009 Satoshi Nakamoto`. [R10] The most scrutinized codebase in finance begins
with a volunteer typing `First commit` over eight months of another person's shipped work — and
it begins *twice*: the same moment exists as two objects, one clean, one wearing a `git-svn-id`
trailer, same tree, different hashes, twin geneses from two runs of history-conversion. [R9]
Satoshi's January keystrokes are not in either. Day one of a clone is wherever the importer
happened to be standing.

## The funeral

OpenTTD's first commit is my favorite subject line in this book, because it is a death notice
that types like a birth announcement:

```console
$ git log --reverse --format='%s' | head -1
(svn r1) Import of revision 975 of old (crashed) SVN
```

Revision one *is* revision 975. [R13] The project's previous version control system died — took
with it revisions 1 through 974, the entire recorded act of creation — and a survivor named
truelight stood in the wreckage and started counting again from what he could salvage. The tree
that lands in "r1" is already a shipping game: 129,220 lines, fourteen languages, a readme
declaring `Release version: 0.3.3` with a keyword timestamp frozen two weeks before the crash.
[R13] Everything this book would most want to watch — the actual beginning, whatever produced
those 129,220 lines — happened in a repository that no longer exists. The first commit is a
funeral, and the funeral is the founding.

## The accident

And then there is the way a repository acquires a genesis nobody chose at all. Ask the kernel how
many day-ones it has:

```console
$ git log --max-parents=0 --format='%aI %an %s' origin/master
2016-02-23 ldewangan          Share upstreaming patches
2014-08-11 Greg Kroah-Hartman greybus: Initial commit
2007-01-26 Chris Mason        Btrfs: Initial checkin, basic working tree code
2005-04-16 Linus Torvalds     Linux-2.6.12-rc2
```

Four. [R7] Two are deliberate — btrfs and greybus were born in their own repositories and merged
in, histories and all. The 2016 one is the accident. An engineer at NVIDIA starts a scratch
repository to pass patches around; its entire founding tree is a two-line README:

```console
$ git show a101ad9451:README.md
# linux-upstream
This is for sharing upstreaming activities.
```

Then, working on that branch, he merges the GPIO maintainer's tree into it — into the
README-rooted line, unrelated histories and all — and when that work is later integrated, the
scratch root rides along into the mainline kernel. The README file itself is long gone from the
tip. The commit is not, and can never be: it is an ancestor of `master`, permanently. [R7, R8]

~ Every clone of Linux, forever, carries a second creation story, and it reads: "This is for
sharing upstreaming activities."

Nobody decided that. No one would. A merge of unrelated histories doesn't feel like an act of
cosmology when you run it — it feels like Tuesday — but `--max-parents=0` does not forget, and
now the kernel's book of Genesis has four first pages, one of which is a note a man left for
himself.

## The control case

Six repositories, six firsts, not one of them a beginning: two robot title cards, three cuts, a
funeral, and an accidental fourth Genesis. So does any famous repository just... start? Where the
first commit is the actual first act of the project's existence?

One. The tool itself. Git's own repository begins with git's own birth — eleven files, written
that afternoon, committed with the two-hour-old tool they implement, by the man who typed them.
[R14] It could hardly be otherwise: git could not have a history before git existed. The one
repository whose day one is real is the one that made all the fake day-ones recordable. And its
subject line — I checked twice — is:

```console
$ git log --reverse --format='%s' | head -1
Initial revision of "git", the information manager from hell
```

*Initial revision.* The exact phrase the conversion robot stamped on Python's paperwork 178
times, false every time. Here, once, in the corpus of this book, it is the plain truth.

## At home

Run the honest question on your own repository: `git log --max-parents=0 --all`. You may believe
you know the answer. If a subtree was ever squashed in, a fork absorbed, a scratch repo merged on
a Tuesday, you have more geneses than you think, and each is a story someone has forgotten. When
you meet a famous "first commit," read it like an examiner reads a document: compare its tree to
its neighbor's (`git rev-parse <a>^{tree} <b>^{tree}` — identical trees mean a title card), read
the files against the commit date (a September signature in an August commit convicts the date,
not the file), and treat round-zero seconds, robot authors, copyright years older than the
repository, and version numbers north of 0.1 as what they are: the seams of an import. None of
this makes the history worthless. It makes it a *document with a provenance* — and the first
question an archivist asks of any document is not "what does it say" but "who made this copy,
and what did they leave out." Day one of the clone is day one of the container. The thing itself
began somewhere the log cannot see — with one exception, and you have to build the recorder
itself to earn it.

## Receipts

- **R1** `git -C repos/php log --reverse | head -4` + `cat-file -p f70a4db647` + `hash-object -t tree /dev/null` — robot root at the empty tree `4b825dc642...`; Andi Gutmans's Zend import at the identical second 18:10:10.
- **R2** `git -C repos/php show a6043d3e1e` — Rasmus Lerdorf's first mark: one blank line, "*** empty log message ***".
- **R3** `git -C repos/cpython log --reverse | head -3` + `rev-parse 7f777ed95a^{tree} 3310257195^{tree}` — first two commits, different dates, identical tree.
- **R4** `git -C repos/cpython show 7f777ed95a:Doc/README | tail -2` — "--Guido (last modified 10 Sep 90)" inside the 9 Aug commit; 178 subjects exactly `Initial revision`.
- **R5** `git -C repos/cpython cat-file -p 7f777ed95a | head -6` — `HG:extra convert_revision:svn%3A...`: hg header quoting an svn path inside a git object.
- **R6** `git -C repos/linux log -1 --format='%B' 1da177e4c3f4` + `diff-tree --root --shortstat` — "I'm not bothering with the full history, even though we have it. ... Let it rip!"; 17,291 files, 6,718,755 insertions.
- **R7** `git -C repos/linux log --max-parents=0 origin/master` + `show a101ad9451:README.md` — four roots; the 2016 root is "# linux-upstream / This is for sharing upstreaming activities" (ldewangan@nvidia.com).
- **R8** `merge-base --is-ancestor a101ad9451 origin/master` (yes) + `cat-file -e origin/master:README.md` (gone) — the genesis is permanent; the file is not.
- **R9** `git -C repos/bitcoin show -s 4405b78d60 e071a3f6c0` + `rev-parse ...^{tree}` — "First commit" twice: same tree, two hashes, one with a `git-svn-id` trailer; author `sirius-m`.
- **R10** `git -C repos/bitcoin show 4405b78d60:readme.txt | head -3` — "BitCoin v0.1.5 ALPHA / Copyright (c) 2009 Satoshi Nakamoto"; also `e00d4805d7` "No dll's here".
- **R11** `git -C repos/redis log --reverse | head -1` + `show ed9b544e10:COPYING | head -1` + `grep REDIS_VERSION` — 10:30:00 sharp; "Copyright (c) 2006-2009"; `REDIS_VERSION "0.07"`.
- **R12** `git -C repos/redis log --max-parents=0 --all` — four roots, including antirez's 2025 `First internal release.`
- **R13** `git -C repos/openttd log --reverse | head -1` + `diff-tree --root --shortstat efaeb275f7` + `show efaeb275f7:readme.txt | head -3` — "(svn r1) Import of revision 975 of old (crashed) SVN"; 129,220 lines; "Release version: 0.3.3".
- **R14** `git -C repos/git log --reverse | head -1` — `e83c516331`, "Initial revision of 'git', the information manager from hell": the control case.

*Full transcripts: `chapters/06-genesis.receipts.md` (regenerate with `scripts/receipts-06.sh`).*
