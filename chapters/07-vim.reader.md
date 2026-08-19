# The current maintainer

On the evening of Friday, July 7th, 2023, the maintainer of Vim — the text editor that lives on
essentially every Unix machine on earth — spent his evening on a joke. Two error numbers in his
editor had never been assigned a meaning, and he had found one: he wired them to a famous 1998
April Fools' internet standard, so that Vim could now, under the right circumstances, report
*E418: I'm a teapot*, and, if asked nicely, *E503: Coffee is currently not available*. He filed
it the way he had filed everything for decades, as a numbered patch with a one-line problem and
a one-line solution.

Four and a half hours later he filed the next one: the new "teapot" entry had made an
alphabetized help list unalphabetical, and that would not stand. He worked past midnight — a test
that ran too slowly under a diagnostic tool at 00:25, some renamed files in another test at
00:54, so a warning could be read properly.

Saturday passed without an entry. Then, at 2:38 on Sunday morning, he processed one item from his
mailbox — a stranger's fix for the misspelling "arguements" in a test file. He applied it,
credited the author, and ticked his patch counter.

~ That is the last thing Bram Moolenaar ever did to Vim.

The project's own records give the date of his death: August 3rd, 2023. Nothing in that final
weekend knows it is an ending. A teapot, an alphabetization, a stranger's typo — and then
silence.

## One name

To understand what happened next, you have to understand how strange this project was.

Ask the ledger who wrote Vim, decade by decade, and the answer is not a list. It is a name. From
the day the record begins in 2004 until late 2019 — fifteen years — every single entry, nine
thousand one hundred and sixty-six of them, is authored by one man.

Which would look like a project with no community at all, except for where the community actually
was. Vim's social contract was this: you mailed Bram your improvement; he reviewed it, entered it
himself, and wrote your name in parentheses at the end of his note. Your work got in. Your name
got in. Your *entry* was his. There is a man named Christian Brabandt whose work first entered
Vim in March 2010, as exactly such a parenthesis — and then again, and again, four hundred and
four times over thirteen years, every time inside an entry authored by Bram. The ledger, read
naively, says this project's survival depended on a single person. The fine print says there was
a crowd — but a crowd on the other side of a mailbox, with one man deciding, one man typing, one
man ticking the counter.

## The six-hour constitution

Only once while he lived did anyone else's name appear on an entry. In November 2019, Christian —
by then trusted enough to hold the keys — added nine lines of housekeeping through the modern
route, the kind of one-click merge the rest of the software world uses daily. Six hours later,
the same evening, Bram removed it. His removal note contains no explanation. Not a word. Nine
lines, deleted in silence.

It wasn't anger; it was a boundary. Christian had the *permissions*. Permissions were not the
constitution. And here is the fact that turns those six hours into law: that modern one-click
merge was used exactly twice in the project's entire history while Bram lived — once for that
experiment, once for his removal of it — and then never again. Until four days after his death.

The constitution was also, once, written down, in the least likely place. In 2020, Bram added a
formal license file to the project (for a mundane reason: the website couldn't find the license
where Vim traditionally kept it, inside its own help system). And in that license, one sentence:

*The current maintainer is Bram Moolenaar. If this changes it will be announced in appropriate
places.*

A legal document, naming one human being, and promising an announcement. Read cold in 2020, it is
boilerplate. Keep it in mind.

## July 13th / August 8th

Git — the record-keeper — stamps every entry with two dates, and almost nobody reads the second
one. The first says when the work was *written*. The second says when it *entered the ledger*.
They almost always match. Here is the entry that will teach you to check:

The first numbered patch of the new era — a small cleanup of leftover test files, by Christian —
carries these two stamps:

*written: July 13th, 2023. entered: August 8th, 2023.*

On July 13th, Bram is alive, five days past his teapot weekend. Christian finishes a bit of work
— cleanup connected, as it happens, to files from Bram's very last authored patch — and it goes
where his work had always gone for thirteen years: into the queue, to wait for Bram.

Then look at the ledger for the weeks that follow, and you will see something you will almost
never see in a famous, living project. Between July 9th and August 7th there are no entries. None.
Twenty-nine days in which the most widely installed text editor on earth does not move — a
project holding its breath. On August 7th, four days after Bram's death, the ledger moves again:
someone else's pending patch enters, through the one-click route used twice in 2019. And the next
day, Christian enters his July cleanup — himself, at last — still carrying its July 13th date.

Unfinished business from the old world, carried across the gap with its original date still on
it.

## The announcement

The license had promised an announcement. On August 13th, ten days after his death, it arrived,
as an ordinary entry in the ledger titled "Farewell to Bram and dedicate upcoming Vim 9.1 to
him." It touches three files, and the three files are the whole story of a succession.

The license keeps its promise. *The current maintainer is Bram Moolenaar* becomes *the current
maintainers are listed here*, followed by a web address. One human becomes a URL.

The README edits the gentlest line in the project. For thirteen years it had carried a standing
instruction: *Send any other comments, patches, flowers and suggestions to: Bram Moolenaar.*
Flowers. Now the flowers go to a mailing list.

And the help system — where Vim keeps everything that matters — gains one sentence: *Vim version
9.1 is dedicated to Bram Moolenaar, who passed away on August 3rd 2023 while still working
full-time on Vim.*

After that, the record shows continuity, not ceremony. The patch counter did not reset. The
numbered-patch format, the Problem/Solution note — his format — appears in every entry to this
day. What changed is the one thing that never changed while he lived: the author column now holds
a crowd, six names deep and growing, every one of them filing patches in the old form, into the
old counter.

## What to carry away

If you rely on a project maintained by one person — and you do, whether you know it or not — the
question worth asking is not "what happens if." It is "where is it written down." Vim's answer
was one sentence long, filed under licensing, three years before anyone needed it: *if this
changes it will be announced in appropriate places.* It changed. It was announced.

And if you ever find yourself reading a ledger like this one, read both dates. Almost always they
agree, and the second one is noise. But now and then they disagree by weeks, and the gap between
them is a held breath — work written in one world, landed in another.

~ The last patch of the old world was a stranger's typo, applied at 2:38 in the morning. The
first patch of the new one was written while its world was still alive.

---

*Every entry in this story is public and reproducible — the teapot patch, the 404 parentheses,
the six-hour revert with the empty note, the two dates on the cleanup, the twenty-nine silent
days, the farewell that edits the license, the flowers line. The full technical dig, with every
command, is here: [The current maintainer — the full dig](07-vim.full.html).*
