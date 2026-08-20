# The current maintainer

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [The current maintainer](07-vim.html).*

On the evening of Friday, 7 July 2023, at 18:57, the maintainer of Vim closed a gap in his
editor's error numbering. The numbers E418 and E503 were unused, and he had found a use:

```console
$ git show -s --format='%s%n%b' 80adaa8ae8
patch 9.0.1673: cannot produce a status 418 or 503 message
Problem:    Cannot produce a status 418 or 503 message.
Solution:   Add err_teapot().
```

`E418: I'm a teapot`, says the new function, and — if you ask it nicely — `E503: Coffee is
currently not available`. [R2] A maintainer, on a Friday night, implementing a 1998 April Fools'
RFC in his text editor, because the error number was free and the joke was right there. Four and
a half hours later, at 23:19, he files the next patch: the new `err_teapot` entry has made a
help-file list unalphabetical, and that will not stand. [R3] He works past midnight — a test
timing out under valgrind at 00:25, then, at 00:54, patch 9.0.1676, renaming some buffers in a
crypt test so a warning can be read properly. [R4]

Saturday passes without a commit. Then, at 02:38 on Sunday morning, he processes one item from
the queue — someone else's patch, a stranger fixing the spelling of "arguements" in a syntax test
file. He applies it — the stranger's name on the author line, his own on the committer line —
and ticks the version counter, patch 9.0.1677. [R5]

~ That is the last thing Bram Moolenaar ever did to Vim.

The repository gives the date of his death as 3 August 2023.

## One name

Run the org-chart question — who actually wrote this thing? — on Vim in decade windows and the
answer does not need a table:

```console
$ git shortlog -sn HEAD --since=2004-01-01T00:00:00Z --until=2011-01-01T00:00:00Z
  2649	Bram Moolenaar
$ git shortlog -sn HEAD --since=2011-01-01T00:00:00Z --until=2019-01-01T00:00:00Z
  6517	Bram Moolenaar
```

Not the top row. The *only* row. [R6] From the day this repository begins — a 2004 import of an
editor already, by its own dedication, more than a decade into its life — through the end of
2018, every single commit is authored by one man. Nine thousand one hundred and sixty-six for
nine thousand one hundred and sixty-six.

Which would look like a project with no community, except for where the community actually is.
Vim's social contract was: you mail a patch; Bram reviews it, commits it as himself, and writes
your name into the message body. The author field says Bram; the *paragraph* says everyone. Here
is what fifteen years of contributing to Vim looked like from the contributor's side:

```console
$ git log --author='Bram Moolenaar' --grep='(Christian Brabandt)' --reverse --format='%h %aI %s' | head -1
12682fda7 2010-03-10 updated for version 7.2.389
    Problem:    synIDattr() cannot return the font.
    Solution:   Support the "font" argument. (Christian Brabandt)
```

March 2010: Christian Brabandt's work enters Vim for the first time — as a parenthesis at the end
of Bram's sentence. It happens again. It happens, in total, four hundred and four times:

```console
$ git log --author='Bram Moolenaar' --grep='(Christian Brabandt)' --format='%h' | wc -l
404
```

[R7] Four hundred and four commits authored by Bram whose Solution line credits the same man,
across thirteen years. The git author field, read naively, says Vim's bus factor was 1. The
bodies say there was a crowd — but a crowd on the other side of a mailbox, with one man deciding,
one man typing, one man ticking the counter in `src/version.c`.

Hold the two mechanics side by side. A merged pull request is a door: the contributor's finished
commit walks into the tree under the contributor's own name, placed there by the contributor's
own hands. Bram's mailbox was a serving hatch: the patch arrived as text, and whatever happened
next happened at his keyboard. In his last years the hatch's paperwork grew more generous — from
April 2021 the patches he applied kept their sender's name on the author line, which is how a
stranger named THARAK HEGDE can be the author of a commit only Bram ever touched — and by the
end, 223 names had entered the author column that way, 1,420 commits. [R16] So the author field
is the wrong place to look for the constitution. Look at the other column. Committer, whole
history, while he lived: Bram Moolenaar, 17,981. GitHub's robot signature, left by web-button
actions, four. Another human being: once. [R16]

## The constitution

That once is an evening in November. On 27 November 2019, at 15:45, Christian Brabandt commits
nine lines of CI configuration with his own hands and merges them through a GitHub pull request —
the only commit of Bram's lifetime whose committer field names another human, and also, as it
happens, the first in the whole history with anyone else's name in the author field. [R6, R8]
At 21:57 the same evening, Bram reverts it. [R8] Six hours. The revert's message body is empty —
nine lines of YAML removed without one word of explanation. [R15] Christian had the *permissions*
to merge a PR. Permissions were not the constitution.

Ask for every `Merge pull request` in the entire history, oldest first:

```console
$ git log --reverse --grep='Merge pull request' --format='%ai %an %s' | head -3
2019-11-27  Christian Brabandt  Merge pull request #5273 from chrisbra/cirrus_ci
2019-11-27  Bram Moolenaar      Merge pull request #5275 from vim/revert-5273-cirrus_ci
2023-08-07  Christian Brabandt  Merge pull request #12740 from k-takata/import-9.0.1678
```

Three and a half years of silence between the second line and the third. [R8] The first PR ever
merged is the 2019 experiment; the second is the revert; the third is four days after his death.
The gap *is* the constitution.

It was also, once, written down — in the most bureaucratic corner of the tree. In January 2020
Bram added a LICENSE file, for the least romantic reason imaginable: `Problem: Vim license not
easy to find on github.` The license had lived in the help system for decades — `:help uganda` —
but GitHub's crawler does not run help commands, so he copied it into a root file the website
could see. [R9] And in it, this sentence:

```console
$ git show c838626fea:LICENSE | sed -n '24,25p'
          The current maintainer is Bram Moolenaar <Bram@vim.org>.  If this
          changes it will be announced in appropriate places (most likely
```

The license names one human being, and promises: *if this changes it will be announced.* [R9]

## 13 July / 8 August

Git keeps two clocks on every commit, the way it keeps two names, and most of us only ever read
one of each. The author date is when
the work was made; the committer date is when it entered the tree. On almost every commit you
will ever inspect they agree, or differ by trivia — a rebase, a cherry-pick — and so the eye
learns to skip the second line. Here is the commit that will teach you to stop skipping it.
Patch 9.0.1679, the first numbered patch after 9.0.1678, a cleanup of leftover test files:

```console
$ git show -s --format='author    %an %aI%ncommitter %cn %cI' 84bc00e9b5
author    Christian Brabandt 2023-07-13T11:45:54+02:00
committer Christian Brabandt 2023-08-08T20:39:55+02:00
```

[R10] Author date, 13 July. Bram is alive, five days past the teapot. Christian is debugging
leftover test files — files whose names trace to the crypt rename in Bram's final authored patch.
He finishes the work and it goes where his work had always gone: into the queue, to wait for
Bram.

Now put the whole month on one screen. Every commit in the repository between 8 July and
9 August:

```console
$ git log --format='%ci %an | committer=%cn | %s' --since=2023-07-08 --until=2023-08-09 --reverse
2023-07-09 02:38  THARAK HEGDE       | committer=Bram Moolenaar     | patch 9.0.1677: typo in syntax test input file
2023-08-07 03:24  ObserverOfTime     | committer=K.Takata           | patch 9.0.1678: blade files are not recognized
2023-08-07 17:00  Christian Brabandt | committer=GitHub             | Merge pull request #12740
2023-08-08 20:39  Christian Brabandt | committer=Christian Brabandt | patch 9.0.1679: Cleanup Tests from leftover files
```

[R14] Twenty-nine days in which the repository does not move at all. The typo fix at 02:38, and
then nothing — no commits, no merges, a project holding its breath — until patch 9.0.1678 arrives
on 7 August, through a merged pull request, the grammar that had been used exactly twice before,
in 2019, for six hours. And the next day, 9.0.1679: the cleanup Christian had written in July. The
patch retained its 13 July author date until he committed it, himself, on 8 August. Unfinished
business from the old arrangement, carried across the gap with its original date still on it.

## The announcement

The license had promised an announcement, and on 13 August 2023 it arrives — as commit
`e978b4534a`, `Farewell to Bram and dedicate upcoming Vim 9.1 to him`, merged as a GitHub pull
request. [R11] Three files.

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
Now the flowers go to a mailing list. [R11] And the help system gains the sentence that puts his
death date into the permanent record:

```console
$ git show e978b4534a:runtime/doc/version9.txt | sed -n '47,48p'
Vim version 9.1 is dedicated to Bram Moolenaar, who passed away on August 3rd 2023
while still working full-time on Vim.
```

After that, the record shows continuity, not ceremony. The patch counter did not reset. The
subject grammar — `patch 9.0.NNNN:` — did not change. The Problem/Solution form is in every
commit, Christian's included; the new era adds `Signed-off-by:` lines and PR numbers. Since
3 August the author column holds a crowd — six names deep in the shortlog — every one of them
filing patches in the same form, into the same counter. [R12] And the committer column, which
held one man's name 17,981 times and another human's exactly once, now belongs mostly to the man
who was reverted in six hours: Christian Brabandt, 5,881 commits and counting — with the door
itself, GitHub's merge-button signature, standing open beside the hatch, 434 times. [R16, R17]

## At home

The habit this chapter teaches is the second clock. `git log --format='%aI %cI'` prints both
dates; `--author` and `--committer` filter by different people; and on any commit where the two
disagree by more than a rebase, there is a story in the gap — work that waited, a gate that
changed, sometimes a whole world that ended between the writing and the landing. The related
habit is smaller: when you want to know how a project really makes decisions, don't read its
governance file. Ask `git log --reverse --grep='Merge pull request'` and read the gaps.
Constitutions live in reverts and silences.

Vim's answer to the question every one-maintainer project will eventually be asked was one
sentence long, filed under licensing, three years early: *if this changes it will be announced in
appropriate places.* It changed. It was announced.

~ Patch 9.0.1678 was followed by patch 9.0.1679, authored before the world it landed in.

## Receipts

- **R1** `git log --committer='Bram' --format='%ci %an | %s' | head -5` — the final five: teapot (18:57 Fri), sorted help (23:19), valgrind (00:25), crypt rename (00:54), a stranger's typo (02:38 Sun).
- **R2** `git show 80adaa8ae8` — 2023-07-07 18:57, patch 9.0.1673, `err_teapot()`: E418 / E503.
- **R3** `git show 416bd916b4` — 23:19, patch 9.0.1674, the help list re-alphabetized.
- **R4** `git show -s --format=fuller 16abd997c9` — 00:54, patch 9.0.1676: the last commit Bram authored.
- **R5** `git show 4c0089d696` — 02:38, patch 9.0.1677: author THARAK HEGDE, committer Bram; "arguements" → "arguments".
- **R6** `git shortlog -sn HEAD --since/--until` decade windows — 2,649/2,649 and 6,517/6,517 Bram; first non-Bram author 2019-11-27 (Christian Brabandt, Cirrus CI).
- **R7** `git log --author='Bram Moolenaar' --grep='(Christian Brabandt)'` — 404 commits; the first, `12682fda7`, 2010-03-10.
- **R8** `git log --reverse --grep='Merge pull request' | head -3` — 2019-11-27 add, 2019-11-27 revert (six hours), then nothing until 2023-08-07; revert stat: 2 files, 10 deletions.
- **R9** `git show c838626fea` + `:LICENSE` lines 24–25 — 2020-01-08, "Vim license not easy to find on github"; "The current maintainer is Bram Moolenaar… If this changes it will be announced."
- **R10** `git show -s 84bc00e9b5` — patch 9.0.1679: authored 2023-07-13, committed 2023-08-08.
- **R11** `git show e978b4534a` — 2023-08-13, "Farewell to Bram": LICENSE maintainer line, README flowers line, version9.txt dedication ("passed away on August 3rd 2023 while still working full-time on Vim").
- **R12** `git log --reverse --committer='Christian Brabandt' --since=2023-08-03 | head -2` + `shortlog -sn --since=2023-08-03` — same grammar, counter unreset; the author column becomes a crowd (1,164 / 544 / 314 …).
- **R13** `git log --reverse -S 'flowers' -- README.txt | head -1` — the flowers line enters README.txt 2010-08-07.
- **R14** `git log --since=2023-07-08 --until=2023-08-09 --reverse` — four commits in thirty-two days: the typo fix, then twenty-nine days of nothing, then 9.0.1678, the merge, and 9.0.1679.
- **R15** `git show -s --format='%b' d52986e7be` — the revert's message body: empty.
- **R16** `git log --until=2023-08-03 --format='%an'` (non-Bram: count + unique) + `--format='%cn' | sort | uniq -c` — while he lived: 1,420 non-Bram-authored commits across 223 names, the first `bb01a1ef3` (Yegappan Lakshmanan, 2021-04-26); committer column 17,981 Bram / 4 GitHub / 1 Christian Brabandt.
- **R17** `git log --since=2023-08-03 --format='%cn' | sort | uniq -c | sort -rn` — the hands after: Christian Brabandt 5,881, GitHub 434, then trivia.

*Full transcripts: `chapters/07-vim.receipts.md` (regenerate with `scripts/receipts-07.sh`).*
