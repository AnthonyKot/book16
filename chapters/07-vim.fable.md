# The current maintainer

On the evening of Friday, 7 July 2023, at 18:57, the maintainer of Vim closed a gap in his
editor's error numbering. The numbers E418 and E503 were unused, and he had found a use:

```console
$ git show -s --format='%s%n%b' 80adaa8ae8
patch 9.0.1673: cannot produce a status 418 or 503 message
Problem:    Cannot produce a status 418 or 503 message.
Solution:   Add err_teapot().
```

`E418: I'm a teapot`, says the new function, and — if you ask it nicely — `E503: Coffee is
currently not available`. [R2] The maintainer of one of the world's most-used programs, on a
Friday night, implementing a 1998 April Fools' RFC in his text editor, because the error number
was free and the joke was right there. Four and a half hours later, at 23:19, he files the next
patch: the new `err_teapot` entry has made a help-file list unalphabetical, and that will not
stand. [R3] He works past midnight — a test timing out under valgrind at 00:25, then, at 00:54,
patch 9.0.1676, renaming some buffers in a crypt test so a warning can be read properly. [R4]

Saturday passes without a commit. Then, at 02:38 on Sunday morning, he processes one item from
the queue — someone else's patch, a stranger fixing the spelling of "arguements" in a syntax test
file. He applies it, credits the author, ticks the version counter, patch 9.0.1677. [R5]

That is the last thing Bram Moolenaar ever did to Vim. He died twenty-five days later, on
3 August 2023 — the date is in the repository, and we will come to how it got there. Nothing in
those final five commits knows it is an ending. A teapot joke, an alphabetization, a valgrind
timeout, a buffer rename, a stranger's typo: the thirty-year authorship of one of the world's
most-used programs closes on a weekend indistinguishable from a thousand before it.

~ The last commit is never a speech.

This chapter is about what a succession looks like when the ledger has only ever held one name.

## One name

Run the org-chart question on Vim in decade windows and the answer does not need a table:

```console
$ git shortlog -sn HEAD --since=2004-01-01 --until=2011-01-01
  2649	Bram Moolenaar
$ git shortlog -sn HEAD --since=2011-01-01 --until=2019-01-01
  6517	Bram Moolenaar
```

Not the top row. The *only* row. [R6] From the day this repository begins — a 2004 import of an
editor already, by its own dedication, more than a decade into its life — to late 2019, every
single commit is authored by one man. Nine thousand one hundred and sixty-six for nine thousand
one hundred and sixty-six.

Which would look like a project with no community, except for where the community actually is.
Vim's social contract was: you mail a patch; Bram reviews it, commits it as himself, and writes
your name into the message body. The author field says Bram; the *paragraph* says everyone. You
can measure the arrangement:

```console
$ git log --author='Bram Moolenaar' --grep='(Christian Brabandt)' --format='%h' | wc -l
404
```

Four hundred and four commits authored by Bram whose Solution line credits Christian Brabandt.
[R7] Hold on to that name. The git author field, read naively, says Vim's bus factor was 1 for
fifteen years. The bodies say there was a crowd — but a crowd on the other side of a mailbox,
with one man deciding, one man typing, one man ticking the counter in `src/version.c`. Both
things were true, and the difference between them is this whole story.

## The constitution

The one-name era cracks, once, in 2019, and the crack is instructive because of how fast it
closes. On 27 November, at 15:45, the first non-Bram author in the history of the repository
lands a commit — Christian Brabandt, adding nine lines of CI configuration, merged through a
GitHub pull request. At 21:57 the same evening, the change is reverted. [R8] Six hours. The
revert is not angry; nothing in it editorializes. It is a boundary, drawn the way Bram drew
everything: quietly, in the tree itself. Christian had the *permissions* to merge a PR. Permissions
were not the constitution.

And here is the receipt that turns those six hours into policy. Ask for every `Merge pull
request` in the entire history, oldest first:

```console
$ git log --reverse --grep='Merge pull request' --format='%ai %an %s' | head -3
2019-11-27  Christian Brabandt  Merge pull request #5273 from chrisbra/cirrus_ci
2019-11-27  Bram Moolenaar      Merge pull request #5275 from vim/revert-5273-cirrus_ci
2023-08-07  Christian Brabandt  Merge pull request #12740 from k-takata/import-9.0.1678
```

Three and a half years of silence between the second line and the third. [R8] The first PR ever
merged is the 2019 experiment; the second is Bram reverting it; the third is four days after his
death. The gap *is* the constitution — never written down, enforced by exactly one revert, and it
expired with its author.

Written down — actually, it was written down, once, in the most bureaucratic corner of the tree.
In January 2020 Bram added a LICENSE file, for the least romantic reason imaginable: `Problem:
Vim license not easy to find on github.` The license had lived in the help system for decades —
`:help uganda` — but GitHub's crawler does not run help commands, so he copied it into a root
file the website could see. [R9] And in it, this sentence:

```console
$ git show c838626fea:LICENSE | sed -n '24,25p'
          The current maintainer is Bram Moolenaar <Bram@vim.org>.  If this
          changes it will be announced in appropriate places (most likely
```

The license names one human being, and promises: *if this changes it will be announced.* [R9]
Read cold, it is boilerplate. Read from 2023, it is a clause about mortality, filed under
licensing, waiting.

## The bridge

Now the object I find most affecting in this repository, and it is a timestamp pair on a
housekeeping patch. When the succession's first numbered patch lands — 9.0.1679, Christian
Brabandt, cleanup of leftover test files — look at its two dates:

```console
$ git show -s --format='author    %an %aI%ncommitter %cn %cI' 84bc00e9b5
author    Christian Brabandt 2023-07-13T11:45:54+02:00
committer Christian Brabandt 2023-08-08T20:39:55+02:00
```

Authored 13 July. Committed 8 August. [R10] On 13 July, Bram is alive, five days past his teapot
weekend; Christian is debugging a problem in test files — files whose names trace to the crypt
rename in Bram's final authored patch. The work then waits where all his work had waited for
twenty years: in the queue, for Bram. It is still waiting there on 3 August. When Christian
finally commits it himself, five days after the death, the first act of the new era is not a
manifesto. It is unfinished business from the old maintainer's last week, carried across the gap
with its original date still on it.

## The announcement

The license had promised an announcement, and on 13 August 2023, ten days after his death, it
arrives — as commit `e978b4534a`, `Farewell to Bram and dedicate upcoming Vim 9.1 to him`,
merged, in the grammar Bram had reverted in 2019, as a GitHub pull request. [R11] Three files
tell the whole handover.

The LICENSE keeps its promise:

```diff
-          The current maintainer is Bram Moolenaar <Bram@vim.org>.  If this
+          The current maintainers are listed here: https://github.com/orgs/vim/people.
```

One human becomes an org URL. The README edits the gentlest line in the project:

```diff
-Send any other comments, patches, flowers and suggestions to:
-	Bram Moolenaar <Bram@vim.org>
+Send any other comments, patches, flowers and suggestions to the vim-dev mailing list:
+	<vim-dev@vim.org>
```

For thirteen years this file had carried a standing instruction to send one man flowers. [R13]
Now the flowers go to a mailing list. [R11] And the help system — the place Vim actually keeps
its soul — gains the sentence that puts his death date into the permanent record:

```console
$ git show e978b4534a:runtime/doc/version9.txt | sed -n '47,48p'
Vim version 9.1 is dedicated to Bram Moolenaar, who passed away on August 3rd 2023
while still working full-time on Vim.
```

*While still working full-time on Vim.* [R11] We watched that full time: it looked like a teapot
error and a sorted help file at midnight.

What the successors did next is, to me, the most Vim-shaped grief imaginable: they changed
almost nothing. The patch counter did not reset. The subject grammar — `patch 9.0.NNNN:` — did
not change. The Problem/Solution form survives in every commit, Christian's first included; the
new era adds only `Signed-off-by:` lines and PR numbers. [R12] Since the death, the author
column has become what it never was in life — a crowd, six names deep in the shortlog — but
every one of them files patches in a dead man's format, into a counter he started. [R12] They
kept the machine, because the machine was the man's actual monument, and because a
one-maintainer project survives exactly to the degree that its rituals turn out to be
detachable from its maintainer.

## At home

Two habits from this dig, and they point in opposite directions of the clock. Looking backward:
`--author` and `--committer` give you two different last days, and both matter — the last
authored commit is what the person still wanted to fix; the last committed one is the queue they
would not leave sitting. When you need to know how a project really made decisions, don't read
its governance file; ask `git log --reverse --grep='Merge pull request'` and read the gaps —
constitutions live in reverts and silences, not in documents. And looking at any project you
depend on: run the shortlog in windows and see whether the author column is a person or a
process. If it is a person, look — today, while it is a dull question — at where the project
writes down what happens next. Vim kept that answer in its license, one sentence long, for three
years before anyone needed it: *if this changes, it will be announced in appropriate places.* It
changed. It was announced. The flowers found a new address, and patch 9.0.1678 was followed by
patch 9.0.1679, authored before the world it landed in.

## Receipts

- **R1** `git log --committer='Bram' --format='%ci %an | %s' | head -5` — the final five: teapot (18:57 Fri), sorted help (23:19), valgrind (00:25), crypt rename (00:54), a stranger's typo (02:38 Sun).
- **R2** `git show 80adaa8ae8` — 2023-07-07 18:57, patch 9.0.1673, `err_teapot()`: E418 / E503.
- **R3** `git show 416bd916b4` — 23:19, patch 9.0.1674, the help list re-alphabetized.
- **R4** `git show -s --format=fuller 16abd997c9` — 00:54, patch 9.0.1676: the last commit Bram authored.
- **R5** `git show 4c0089d696` — 02:38, patch 9.0.1677: author THARAK HEGDE, committer Bram; "arguements" → "arguments".
- **R6** `git shortlog -sn HEAD --since/--until` decade windows — 2,649/2,649 and 6,517/6,517 Bram; first non-Bram author 2019-11-27 (Christian Brabandt, Cirrus CI).
- **R7** `git log --author='Bram Moolenaar' --grep='(Christian Brabandt)' | wc -l` — 404 Bram-authored commits crediting Christian in the body.
- **R8** `git log --reverse --grep='Merge pull request' | head -3` — 2019-11-27 add, 2019-11-27 revert (six hours), then nothing until 2023-08-07; revert stat: 2 files, 10 deletions.
- **R9** `git show c838626fea` + `:LICENSE` lines 24–25 — 2020-01-08, "Vim license not easy to find on github"; "The current maintainer is Bram Moolenaar… If this changes it will be announced."
- **R10** `git show -s 84bc00e9b5` — patch 9.0.1679: authored 2023-07-13, committed 2023-08-08 — the bridge across the death.
- **R11** `git show e978b4534a` — 2023-08-13, "Farewell to Bram": LICENSE maintainer line, README flowers line, version9.txt dedication ("passed away on August 3rd 2023 while still working full-time on Vim").
- **R12** `git log --reverse --committer='Christian Brabandt' --since=2023-08-03 | head -2` + `shortlog -sn --since=2023-08-03` — same grammar, counter unreset; the author column becomes a crowd (1,164 / 544 / 314 …).
- **R13** `git log --reverse -S 'flowers' -- README.txt | head -1` — the flowers line enters README.txt 2010-08-07.

*Full transcripts: `chapters/07-vim.receipts.md` (regenerate with `scripts/receipts-07.sh`).*
