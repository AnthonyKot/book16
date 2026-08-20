# Nothing much to see here

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [Nothing much to see here](08-costume.html).*

```console
$ git -C repos/msdos show -s --format=fuller fce0f75959 80ab2fddfd | grep -E 'commit|Date'
commit fce0f75959b9806f4016beb7b19e19b37cc97b6c
AuthorDate: Wed Mar 3 16:51:26 1982 -0800
CommitDate: Fri Sep 21 17:51:26 2018 -0700
commit 80ab2fddfdf30f09f0a0a637654cbb3cd5c7baa6
AuthorDate: Fri Aug 12 17:53:34 1983 -0700
CommitDate: Fri Sep 21 17:53:34 2018 -0700
```

The dates are thirty-six years apart. The seconds match. 16:51:26 in the −0800 of a March
afternoon and 17:51:26 in the −0700 of a September evening are the identical instant of UTC;
the second commit repeats the trick at 17:53:34. [R1, R2] Two commits, four dates, and every
pair lands on the same tick of the same clock. Git will tell you how that happens: hand it
only a calendar day — `--date "1982-03-03"` — and its date parser fills the missing hours,
minutes and seconds from the wall clock of the machine you are sitting at, right now. Someone
in 2018 typed a date from 1982, and the moment of typing bled through into it.

~ The planted date is precise about everything except the thing it plants.

## The drawer

September 2018. A program manager named Rich Turner has two folders of 8086 assembly —
MS-DOS 1.25 and 2.0 — and a repository to put them in. His first commit is his own, honestly
dated, four minutes before the eighties arrive. [R1] Then he faces the question every museum
faces: what date goes on the plaque?

Sit in that choice for a minute, because I might have made it too. The folders are full of
files that carry their own dates — revision banners at the top of each file, source control
from before source control, maintained by hand:

```console
$ git -C repos/msdos show fce0f75959:v1.25/source/MSDOS.ASM | grep -n '03/03/82' | head -2
31:; 1.25 03/03/82 Put marker (00) at end of directory to speed searches
```

Commit these trees with today's date and `git log` reads as two thousand eighteen wall to
wall — a museum whose every exhibit is labeled *acquired Thursday*. The files say 1982. Label
the box with the date its newest artifact claims, and the log reads like the history it
holds. So the last banner entry in MSDOS.ASM becomes the author date of the v1.25 drop, the
banner in the v2.0 tree gives 08/12/83, and the plaque matches the vitrine. [R3] It is a
curator's decision, made in an afternoon, and if the clock hadn't leaked it would have taken
forensics to notice.

But a folder is not a day. The same v1.25 tree carries Tim Paterson's 8086 assembler, whose
banner keeps going past the plaque date:

```console
$ git -C repos/msdos blame -L 20,24 -- v1.25/source/ASM.ASM
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800 21) ; 07/04/82  2.41  Fix Intel's 8087 "reverse-bit" bug; don't copy date
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800 22) ; 08/18/82  2.42  Increase stack from 80 to 256 (Damn! Overflowed again!)
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800 23) ; 01/05/83  2.43  Correct over-zealous optimization in 2.42
```

A commit stamped 3 March 1982, containing work from August 1982 and January 1983 — including
the only swear word in the tree, a man twice overflowed by his own stack. [R5] The folder is
a drawer someone emptied into git, a career flattened to an afternoon. And the drawer keeps
its own provenance paperwork. Sitting beside the assembly is the email that delivered it:

```console
$ git -C repos/msdos blame -- v1.25/Tim_Paterson_16Dec2013_email.txt | sed -n '1,4p'
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800  1) From: Tim Paterson
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800  3) Date: Mon, 16 Dec 2013 10:34:17 -0800
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800  4) Subject: RE: Source code to MS-DOS 1.0
```

A message written in December 2013, and `git blame` attributes every line of it to March
1982. [R4] Blame, remember, is not a witness. It names whoever made the copy. A repository
someone packs for you is two documents — the files, and the wrapping — and here they sit one
command apart, disagreeing.

The museum got a second wing in April 2024, and this time the plaque is true. One commit:
1,339 files, 527,719 insertions — MS-DOS 4.0 plus the cancelled Multitasking DOS — author
`Mark Zbikowski`, committer `Microsoft Open Source`, subject `MZ is back!`. [R6] His initials
have been in the repository since 2018, spelled out in the 1983 tree's own roster of the
development group — `Tim Paterson (Ret.)`, `Nancy Panners (Parenting)`, `Mark Zbikowski` —
and in the 1985-sourced tree he delivers, the same roster has gone to initials with one
annotation surviving the compression: `NP (Parenting)`. [R7] The names shrank; the courtesy
didn't. `git blame` now assigns those old roster lines to Mark Zbikowski in 2024, and for
once the attribution is nearly right: he made this copy, and the copy names him. His
initials also survive as the `MZ` signature at the start of DOS MZ executables and, later,
every Windows PE executable.

The day before his commit, the curators changed the sign on the door — the README heading
`# Contribute!`, which the world had answered with twenty translations of the plaque, became
`# For historical reference`. [R8] Museums have git histories too.

## The second first commit

Twitter's repository inverts every one of those choices. Real files under planted dates
there; true dates here, around a history that isn't one. The whole founding, raw:

```console
$ git -C repos/the-algorithm log --max-parents=0 --format='%an <%ae>%n%s%n%b'
twitter-team <>
Twitter Recommendation Algorithm
Please note we have force-pushed a new initial commit in order to remove some
publicly-available Twitter user information. Note that this process may be required
in the future.
```

An author with no email. A subject that is a product name. And a body announcing that this
first commit is a replacement — there was an earlier first commit, public long enough to need
removing, and it survives only as the reason given for replacing it. [R9] The replacement
kept the hole: the day-one tree still contains code that loads a file called
`/config/authors.yml` — the lists of tracked accounts — and git has never once seen that
file:

```console
$ git -C repos/the-algorithm log --all --full-history --oneline -- '**/authors.yml' | wc -l
0
```

[R12] A ghost with a doorknob. You can see the shape of the secret exactly — four named
buckets, loaded at startup — and never its contents.

What the code did with those lists is why anyone remembers this repository. The day-one
predicate file counts, among other things:

```console
$ git -C repos/the-algorithm show ef4c5eb65e:.../HomeTweetTypePredicates.scala | grep -n 'author_is_'
225:      "author_is_elon",
230:      "author_is_power_user",
236:      "author_is_democrat",
242:      "author_is_republican",
```

[R11] The hydrator that fed them explains itself: `These author ID lists are used purely for
metrics collection` — an A/B-testing guardrail, says the comment, to make sure no change
harms one group over others. [R11] Maybe so. Three commits into the public history, the
labels were deleted — and the two clocks, the same two clocks that undid the MS-DOS plaque,
print this:

```console
$ git -C repos/the-algorithm log --reverse --format='%h %aI %cI %s' | head -3
ef4c5eb 2023-03-31T17:36:31-05:00 2023-03-31T17:36:31-05:00 Twitter Recommendation Algorithm
64e7548 2023-03-31T13:15:49-07:00 2023-03-31T17:39:21-05:00 Fix simclusters README
ec83d01 2023-03-31T13:39:57-07:00 2023-03-31T17:39:34-05:00 Remove stats collection code...
```

The release is committed at 17:36 Central. The deletion of the Elon and party predicates
carries an author clock of 13:39 Pacific — one hour and fifty-seven minutes earlier — and a
commit clock three minutes later. [R10] An author date is writable; these clocks cannot prove
when the patch was actually made. But this is the timeline Twitter itself published, and what
it presents is: cleanup, release, cleanup — the deletion already waiting when the release
appears, not outrage followed by a three-minute response.

~ Somewhere in the metadata there is always a clock that wasn't asked.

The rest of the ledger is short. The complete census of this repository's authors, for all
time:

```console
$ git -C repos/the-algorithm shortlog -sn --all
    25	twitter-team
     3	dzhao
     2	Pouriya Jahanbakhsh
     1	Auro
```

Six commits by named people, all within the first four days; twenty-five snapshots by the
team account. [R13] After July 2023 the repository says nothing for 783 days. Then, in
September 2025, the same empty-email author adds 988 files and 65,319 lines under the
subject `update for-you recommendations code`. [R14] Inside, political labels are back —
supplied now by Grok, which classifies each post, with a new comment alongside:

```console
$ git -C repos/the-algorithm grep -n 'grok_politics' HEAD -- .../HomeTweetTypePredicates.scala
394:      "grok_politics_left", // Purely for metrics tracking. Does not affect the recommendations.
398:      "grok_politics_right", // Purely for metrics tracking. Does not affect the recommendations.
```

[R15]

## The room they shipped

Apple published a different kind of first commit. When Swift was open-sourced in December
2015, the repository the public cloned began like this:

```console
$ git -C repos/swift log --reverse --format='%h %aI %an %s' | head -2
18844bc6522 2010-07-17T23:50:59+00:00 Chris Lattner initial swift test
afc81c1855b 2010-07-18T00:04:11+00:00 Chris Lattner initial checkin, nothing much to see here.
```

Ten minutes to midnight on a Saturday, July 2010, five years before anyone outside Apple may
look. The first commit is git's empty tree — `4b825dc642...`, the name git gives to nothing
at all. A man is starting a programming language, there is no syntax yet, and the first
object he keeps is a blank. Thirteen minutes later the entire language is nine files, and the
compiler's main function reads, in full, `int main() { }`. [R16] The subject line is a shrug
typed at four minutes past midnight, and it is accurate.

They published that. The empty Saturday, and then the whole secret adolescence behind it:
24,610 commit messages still citing `rdar://` tickets into Apple's internal bug tracker,
which the public cannot open, starting ten days into the language [R18]

— and the week in July 2011 when methods were declared with the keyword `meth`, killed five
days later by a commit that explains itself: `This is cleaner both conceptually and in
implementation, and eliminates drug references. :)`. [R19] A design meeting you can replay,
smiley preserved in the object. Nobody sanitized the room. The room is the product.

The costume is one garment, and blame wears it on every line of the early files:

```console
$ git -C repos/swift blame -L 3,5 5e88a21755 -- lib/Lex/Lexer.cpp
5e88a2175579 (Chris Lattner 2010-07-18 00:48:07 +0000 3) // This source file is part of the Swift.org open source project
5e88a2175579 (Chris Lattner 2010-07-18 00:48:07 +0000 5) // Copyright (c) 2014 - 2015 Apple Inc. and the Swift project authors
```

Blame says Chris Lattner typed `Copyright (c) 2014 - 2015` in July of 2010. [R17] The
license header was written into the historical blobs when the conversion was made for
release — the repository's own log shows `LICENSE.txt` arriving in November 2015, three
weeks before the public got their clones [R17] — so every file in the secret years opens
with a sentence from the future. It is the same move as Microsoft's, run in reverse:
Microsoft forged the date and kept the files; Apple kept the dates and forged the
letterhead. The night before you publish your history, someone from legal walks through it,
and the walk leaves footprints.

## At home

Every repository you are handed — vendored, forked, migrated, "open-sourced" — is a box
somebody packed, and the box will tell you how if you print both clocks:

```console
$ git log --format='%h  %aI  %cI  %s' --reverse | head
```

Author date far from commit date is always a story — an import, a rebase, a cherry-pick, a
patch that outlived its author, or a plaque; and a date-only forgery confesses in the seconds
field. Then let `git log --max-parents=0 --all` say what the box admits about its first page,
and `git log --all --full-history -- <path>` whether a file the code names was ever really
there. Above all, read the files against their own wrapping: a banner dated past its commit,
a copyright younger than its blame line, an email from 2013 wearing 1982 — the contents and
the container were packed by different hands, and they disagree exactly where someone made a
decision.

The box Microsoft packed says `MS-DOS v1.25 Release`, and the date on the plaque is the date
of nothing. The box Twitter packed says `Twitter Recommendation Algorithm`, and holds no
algorithm's history — thirty-one photographs of one. The box Apple packed says there is
nothing much to see here. It is the only one of the three with everything inside.

## Receipts

- **R1** `git -C repos/msdos log --reverse --format='%h %aI %cI %an %s'` — the first four commits: an honest 2018 root, then two commits whose author dates claim 1982 and 1983 with 2018 commit dates, four minutes apart.
- **R2** `git -C repos/msdos show -s --format=fuller fce0f75959 80ab2fddfd` — AuthorDate and CommitDate of both drops share the same UTC clock second, 36 and 35 years apart.
- **R3** `git -C repos/msdos show fce0f75959:v1.25/source/MSDOS.ASM | grep '03/03/82'` (and MSHEAD.ASM `08/12/83`) — the planted dates come from the files' own revision banners.
- **R4** `git -C repos/msdos blame -- v1.25/Tim_Paterson_16Dec2013_email.txt` — a 16 Dec 2013 provenance email, every line blamed to Rich Turner, 3 March 1982.
- **R5** `git -C repos/msdos blame -L 20,24 -- v1.25/source/ASM.ASM` — revision entries dated 07/04/82 through 05/09/83 inside the commit stamped 03/03/82; "Damn! Overflowed again!"
- **R6** `git -C repos/msdos show -s --format=fuller 2d04cacc53` + `--shortstat` — "MZ is back!": author Mark Zbikowski, committer Microsoft Open Source, 1,339 files, 527,719 insertions.
- **R7** `git -C repos/msdos blame -L 3,9 -- v2.0/source/MSHEAD.ASM` vs `-L 5,10 -- v4.0/src/INC/MSHEAD.ASM` — full names with `(Parenting)` in the 1983 tree; initials with `(Parenting)` intact in the 1985-sourced tree.
- **R8** `git -C repos/msdos log -S 'Contribute!' -- README.md` + `show a5eb02a4d7 -- README.md` — the heading flips from `# Contribute!` (2018) to `# For historical reference` (2024-04-25).
- **R9** `git -C repos/the-algorithm log --max-parents=0 --format=...` — the sole root: `twitter-team <>`, "Please note we have force-pushed a new initial commit…"
- **R10** `git -C repos/the-algorithm log --reverse --format='%h %aI %cI %s' | head -3` + `show --shortstat --format=fuller ec83d01dca` — the deletion: authored 13:39:57 −0700, committed 17:39:34 −0500, three minutes after the 17:36:31 release; 5 files, +3/−66.
- **R11** `git -C repos/the-algorithm show ef4c5eb65e:<predicates file> | grep author_is_` + `<hydrator file> | grep -A3 'purely for metrics'` — `author_is_elon` / `author_is_power_user` / `author_is_democrat` / `author_is_republican`, and the "used purely for metrics collection" comment.
- **R12** `git -C repos/the-algorithm show ef4c5eb65e:<module> | grep authors.yml` + `log --all --full-history -- '**/authors.yml'` — the code loads `/config/authors.yml`; no commit has ever contained it.
- **R13** `git -C repos/the-algorithm shortlog -sn --all` — 25 twitter-team, 3 dzhao, 2 Pouriya Jahanbakhsh, 1 Auro; the last human-authored commits are 2023-04-04.
- **R14** `git -C repos/the-algorithm log --format='%h %aI %cI %s' 72eda9a24f^..c54bec0d4e` + `show --shortstat c54bec0d4e` — 2023-07-13 to 2025-09-03, then 988 files, +65,319/−3,195, "update for-you recommendations code".
- **R15** `git -C repos/the-algorithm log -S grok_politics_left --all` + `grep -n grok_politics HEAD -- <predicates file>` — the labels return in `c54bec0d4e` with `// Purely for metrics tracking. Does not affect the recommendations.`
- **R16** `git -C repos/swift log --reverse | head -2` + `rev-parse '18844bc652^{tree}'` + `show afc81c1855:tools/swift/swift.cpp` — the empty tree `4b825dc642...`; "initial checkin, nothing much to see here."; `int main() { }`.
- **R17** `git -C repos/swift show 5e88a21755:lib/Lex/Lexer.cpp | head -6` + `blame -L 3,5` + `log --diff-filter=A -- LICENSE.txt` — the Swift.org / 2014–2015 header blamed to 2010-07-18; LICENSE.txt added 2015-11-02 by Ted Kremenek.
- **R18** `git -C repos/swift log --grep=rdar --oneline | wc -l` + `--reverse | head -1` — 24,610 commits citing rdar://; the first is `35328c4921c`, ten days into the language.
- **R19** `git -C repos/swift log -S kw_meth --reverse` + `log -1 --format='%B' 0fc77abf5c` — `meth` introduced 2011-07-19, removed 2011-07-24: "…eliminates drug references. :)".

*Full transcripts: `chapters/08-costume.receipts.md` (regenerate with `scripts/receipts-08.sh`).*
