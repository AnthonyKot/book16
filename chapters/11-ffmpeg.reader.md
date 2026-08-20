# As discussed

On the 19th of January 2011, the lead developer of FFmpeg — the software engine that decodes
video for half the internet, inside browsers and phones and players you use daily — filed a
one-line change with a one-sentence explanation:

> Reason is that this has been mistakely commited as discussed.

Two spelling mistakes and the world's most boring phrase: *as discussed*. The change he was
undoing had been filed the afternoon before, by another senior developer, and it did exactly
one thing: it deleted seven lines from the project's org-chart file. A heading — *Project
Leader* — a name, and a three-word job description: *final design decisions*.

The name in the deleted lines was Michael Niedermayer. The person restoring them was Michael
Niedermayer. Someone had deleted the leader's office from the org chart; a day later, the
leader put it back, *as discussed*. Both entries point at discussions — a mailing-list
thread, a conversation — that the project's ledger does not contain. What the ledger
contains instead is everything the argument caused people to *do*, for the next eleven
years. That turns out to be the better record.

## January

Some background, told fairly, because everyone in this story is a serious engineer acting on
conviction. FFmpeg in 2011 was ten years old; its founder was long gone; and it was run the
way many aging projects are: one enormously prolific successor held final say over
everything. That structure has real virtues — coherent direction, someone who can say no —
and real costs: everything waits on one person, and the senior developers maintaining whole
subsystems wanted authority to live with the people doing the maintaining, decisions made by
review rather than by office. Both are legitimate ways to run a project. The argument
between them happened on a mailing list. The ledger recorded only its chores: one day, a new
contributor guide declaring a strict rule — *merge commits are forbidden* (a merge being the
operation that folds one line of development into another; forbidding them keeps history
tidy). The next day, the org-chart deletion. The day after, the restore.

Within weeks, the group behind the deletion left — taking a complete copy of the code and
its entire history, as open source allows — and founded a parallel project under a new name:
**Libav**. For the next several years, two nearly identical projects developed side by side,
each releasing its own version of the same ten-year inheritance.
<!-- CHECK: Libav announced March 2011 by departing FFmpeg maintainers — public record; the split itself is off-repo. -->

## The two-in-the-morning merges

What the leader did next is the strangest sustained pattern I have ever seen in a ledger.

Seventy-five days after "merge commits are forbidden" entered his project's own
documentation, Niedermayer performed a merge — of the *rival project's entire tree*, folded
into FFmpeg, at 01:51 in the morning, from a source he had named, for reasons the ledger
never explains, `qatar`. Then he did it again the next night. And the next.

Over the following three years the ledger records **1,151** of these merges. Every single
one authored by him. No one else ever did one.

Understand what each of those entries is. Merging a rival's tree is not a click. It means
reading everything they changed since yesterday; it means, whenever both projects touched
the same file — constantly, for two projects sharing everything — resolving the collision by
hand and owning the result. Some days that's five minutes; some days it's the whole evening.
I have put off a *single* merge like that for a week. He did eleven hundred and fifty-one.
And the ledger records the hours: the most common time of day for these entries is two in
the morning. The second most common is two in the afternoon. The timestamps say when. They
do not say why, and I won't guess on a living man's behalf. Whatever you choose to call it —
devotion, stubbornness, strategy, insomnia — the effect is plain: for three years, nothing
Libav built was allowed to escape FFmpeg. The rival's every improvement arrived, nightly,
resolved by one man's hands.

And then, in April 2014, it stops. The last of the 1,151 merges is a routine one — an
assembler conversion, two files in conflict — with no goodbye in it, no line drawn. The
source called qatar simply never appears again. The ledger cannot say why the cadence ended;
the habit ended the way habits end.

## The word

What were the two projects fighting over, in the ledger itself? Among other things: a
single word. Every source file in the project opens with a boilerplate sentence — *This
file is part of FFmpeg.* In March 2011 the departing project, reasonably enough, renamed
its copy: one commit exchanged the word in 1,335 files at once. And because the two trees
kept absorbing each other's work, the word became tidal — every merge re-imported one name,
every cleanup restored the other, for years.

Today you can ask the ledger one narrow question: which sentence stands in FFmpeg's current
code? The answer: *part of Libav* appears in zero files. *Part of FFmpeg* appears in 5,042.
One part of a fork's long outcome, reduced to a single search.

There is even a fossil of the reconciliation. In 2017, FFmpeg merged a Libav change that had
reorganized its command-line tools into a folder called `avtools`. FFmpeg's own famous tool
lived elsewhere, under its own name. The merged result put the file at a *third* address —
`fftools/ffmpeg.c` — a path that had existed in neither project: Libav's folder idea,
FFmpeg's file name, the exact same bytes FFmpeg always had. Six years into the split, the
two inheritances were still being spliced together, one path at a time. (It left a scar,
too: ask git for that famous file's history and it now appears to begin in 2017 — seventeen
years amputated by a rename no tool can see through.)

## The office

Which brings the story back to the seven deleted lines, because that little section of the
org chart has a complete sixteen-year biography, and its last two entries say more than all
of 2011.

**July 2015.** Niedermayer edits the section himself — and removes only his own name. The
heading stays. *Final design decisions* stays. What remains in the file, for the next seven
years, is an office with nobody in it: a title, a rule, and a blank where a person used to
be. He doesn't stop working — a decade later he is still one of the most active developers
in the project. He takes his name off the door and leaves the office standing.

**September 2022.** The empty office is finally taken down. And the person who files that
change is Anton Khirnov — by then the third-most-prolific contributor in the project's
entire history, and one of the developers who had left for Libav in 2011.
<!-- CHECK: Anton Khirnov was among the Libav founders/maintainers — public record. --> The forks had
wound down years before; the people had, one by one, come back to the shared tree. His
explanation is four words:

> The position does not exist anymore.

Not *he lost*. Not *we won*. A fact, recorded eleven years late, by someone who had once
left over it. The 2011 entries had each cited a discussion the ledger never held. This one
cites nothing. There was nothing left to discuss.

## At home

If you work with a shared codebase, two habits from this dig. When you want the real story
of a project's governance, don't read its documentation — search the history of its
org-chart file for the *headings*, and read closely the entry that deletes a name but
leaves the role, and the one, maybe years later, that deletes the empty role. And when a
project tells you its rules, check them against its record. FFmpeg's written rule said
merge commits are forbidden. Its record says 1,151 of them, all by one man, most often at
two in the morning. Believe the record.

---

*The seven-line deletion and its restore, the no-merge rule, the 1,151 qatar merges and
their hour histogram, the 0-versus-5,042 word count, the path born in neither parent, and
the four-word ending are all real and public, reproducible with a git command each. The
full technical dig is here: [As discussed — the full dig](11-ffmpeg.full.html).*
