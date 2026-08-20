# Craft review — Chapter 15, “THIS IS A HACK TO GET V4 OUT THE DOOR”

## Overall

This is a fresh chapter, and the artifact is excellent. Node is about deletion changing the story a
project tells about its origin. OpenSSL is about a maintainer carrying out opposite operations across
an institutional boundary. PostgreSQL can be about something neither chapter owns: a maintainer who
has the authority and the opportunity to make the obvious change, understands why the obvious change
is attractive, and declines anyway. In 2025 he goes further and restores the ugly behavior. The
refusal is not defeat, succession, or compliance. It is an exercise of technical judgment.

The draft knows that, but says it before it dramatizes it. The opening gives away “nothing, on
purpose,” calls Tom “one of the most careful engineers in open source,” and states the chapter’s
verdict before Tom has appeared. Thereafter the prose repeatedly tells us that the wrong number is
load-bearing. The reader understands the thesis, but does not yet get to experience the temptation
to change the number—the experience that would make the refusal feel like engineering rather than
mere conservatism.

The missing 500–700 words should therefore not become more PostgreSQL history or more praise of Tom.
They should become decision room: why a planner must put a number where its knowledge runs out; why
the 1992 author reasonably chose *some* number; what the 2015 patch could improve and what it could
not prove; and how much cleaner the patch would look if Tom changed the fallback while he was there.
The chapter becomes distinctive when the reader wants the cleanup a beat before Tom refuses it.

The locked provenance remains accurate. The draft explicitly says the date was “dated in the source
itself,” then displays `-- JMH 7/9/92` from the imported 1996 root. It never suggests that Tom supplied
the date. There are zero `CHECK` markers, and the substantive spine is entirely in-repo. The only
phrase that strains the zero-external-claim standard is the disposable flourish that PostgreSQL
“runs a large slice of the world’s applications.” Cut that phrase rather than add a marker; the
chapter loses nothing, and then nothing needs a `CHECK`.

## Structure and pacing

The current sequence is 1992 → 2015 → 2025 → 2023 → career scale → general lesson. It peaks at the
2025 restoration, steps backward to the enum companion, reaches a second abstract climax in “The
hand,” and then explains the moral once more in “At home.” That makes the last third feel like three
codas.

A stronger ascent is:

1. Open on `0.3333333`, explain only enough planner logic to establish why an answer is compulsory,
   and reveal the dated V4 comment.
2. End the opening room with the narrator going in search of the commit that finally obeyed the
   `XXX`. Do **not** tell us yet that the answer is “nothing, on purpose.”
3. Present the 2015 commit title as the apparent answer: `Allow planner to use expression-index
   stats...`. Let the reader think this is the cleanup. Then disclose Tom’s refusal in the body.
4. Move the 2023 enum production here. It converts one conservative choice into a method: when he
   cannot safely ship the requested behavior, he puts the reasons at the exact point where a future
   implementer will try.
5. Return to the number in 2025. This is the climax because Tom does not merely leave the fallback;
   he restores it and rewrites the inherited instruction. The `XXX` has completed its inversion.
6. Fold “At home” into the career-scale coda. Give the reader the search habit, then end on the 1998
   loader flags and `16,863`, not on a paragraph of generalized wisdom.

This order also turns the companion into a bridge instead of an appendix. The 1992 code contains a
placeholder that asks for a future implementation. The 2023 code contains a placeholder that blocks
a premature implementation. The 2025 comment resolves the contrast: old source once said *replace
me*; the new source says *not in too much hurry*. That is the chapter’s real pattern.

The rooms can add roughly 600 words without padding:

- Give the planner 100–125 words. A planner cannot answer “unknown”; it has to compare a scan, an
  index, and join orders, and those comparisons require an estimate of how many rows survive. One
  compact example is enough.
- Give the V4 comment 125–175 words. The room is already in the typography: capitals, an initial, a
  date, and a release named as the constraint. Stay with those objects rather than inventing a
  Berkeley office or private thoughts. “I went looking for the commit that obeyed” would also bring
  the daily-blame narrator onto the page.
- Give 2015 250–300 words. Explain what “use expression-index stats” changes: Tom improves the cases
  with evidence and leaves the unknowable fallback alone. Let the narrator confess the cleanup they
  would have wanted in the same patch. Then the line about not doing it without more testing lands as
  a choice under uncertainty, not an oracle’s maxim.
- Give the grammar production 100–150 words of non-compiler explanation. A grammar production is the
  place the parser learns what a command means; Tom makes the command recognizable only so it can
  stop and explain why it is unsafe. That is legible and strange enough to deserve a beat.

Do not spend the new room expanding “every PostgreSQL database on earth,” enumerating hypothetical
catastrophes, or making a general case for legacy compatibility. The local decision is more
interesting than the universal sermon.

## The planner explanation

The existing explanation is almost at the right level. “When the planner sees a query condition it
cannot estimate ... it guesses that one third of the rows will match” is plain enough for a non-DB
reader, while `selectivity`, `WHERE`, and expression-index statistics give an expert the real object.
The missing link is not more terminology; it is consequence. A general reader needs one sentence
answering: *what does the planner do with this fraction?*

Something like this would do the job:

> The planner has to choose how to reach the rows before it can run the query. If it expects almost
> all of them, a scan may be cheap; if it expects a few, an index may win. It cannot enter “unknown”
> in that comparison, so the placeholder had to be a number.

Then stop. An expert will recognize the simplification and keep moving. The draft currently spends
more space on the scale of the supposed blast radius than on this small causal link. Reverse that
ratio. Also avoid making “wrong” do too much work. `0.3333333` is unprincipled and often inaccurate,
but an estimate is not wrong in quite the same way as a bad computation. “Arbitrary” is the more
precise pressure word in the explanatory prose; “wrong” can remain in the aphorism if its bluntness
is wanted.

## The reveal and the title

Keep the title, including the capitals. On a contents page it will be a loud, long block, but the
loudness belongs to JMH, not to the book’s marketing voice. It also names the chapter’s first
meaning: an embarrassed deadline confession. By 2025 the same sentence has acquired a second
meaning. The hack is no longer merely what got V4 out the door; it is behavior later releases have
learned to expect. That is a real flip.

The current opening prevents the flip by explaining the entire story:

> This chapter is about what happened to that hack over the next thirty-three years, because the
> answer is: nothing, on purpose, and the person who kept deciding to do nothing is one of the most
> careful engineers in open source.

Cut it. It is synopsis, verdict, and praise before the evidence. A better exit from the cold open
would preserve the forward pull:

> An initial, a date, a release deadline, and an instruction to the future: replace this. I went
> looking for the commit that obeyed.

Now the 2015 title appears to answer the search, and the reader can feel the refusal one sentence
before the commit body names it.

## The `~` beats

The existing line is earned and correctly placed after the 2015 decision:

> ~ A number that has been wrong for long enough stops being a mistake and becomes a contract.

It is memorable, and “contract” usefully translates planner behavior into dependency. Its risk is
that it sounds like a general legacy-code proverb before the 2025 restoration proves the rule. If
the structure remains unchanged, move it to after the 2025 comment. If the enum episode moves between
2015 and 2025 as recommended, keep it after 2015: it can act as the hinge from one apparent exception
to a maintainer’s repeated practice, while the later restoration supplies the proof.

A second `~` beat is not required. The chapter will be strongest if the 2025 `fix me` / `do not fix
me` inversion is allowed to stand without a slogan underneath it. If the expanded enum room needs a
landing, the best second candidate is:

> ~ A refusal lasts longer when you put it where the feature would go.

That line adds something the first beat does not: location is part of the engineering. A more
artifact-centered alternative is:

> ~ The missing feature had an implementation: a warning in its place.

Use one, not both. The first is better because it connects directly to the parser production and to
the book’s interest in where institutional memory survives.

## Prose

The prose is cleanest when it reads the artifact closely: “The message is longer than the code
because the code is a signpost, and the signpost is the point” is excellent. The draft is weakest
when it inflates that close reading into universal praise—“one of the most careful engineers in open
source,” “every PostgreSQL database on earth,” “the whole ecosystem,” “a whole career’s worth.” Tom’s
scale is already astonishing. The narrator does not need to tell us how astonished to be.

The clunkiest sentence is the first long sentence in “At home”:

> But run `git log -S` on the ugly constant or `git blame` on the embarrassing comment, and check its
> age against the code around it — if a placeholder has survived long enough, the correct move may be
> the one the project actually made: not to fix it, but to write a *second* comment above the first
> explaining why the obvious fix is now the dangerous one.

It contains two commands, three conditions, the chapter’s thesis, and a prescribed outcome. More
importantly, age alone is not the lesson: old code can simply be old. The valuable evidence is a
recorded opportunity to change it and a reasoned refusal. Rewrite it as:

> When an `XXX`, `HACK`, or `TODO` embarrasses you, do not clean it up yet. Blame the line, then run
> `git log -S'<constant>' -- <path>` and look for the commit where someone had a chance to remove it
> and declined.

That is shorter, more actionable, and distinctly this chapter’s habit.

The hardest-working paragraph begins “`This seems a pretty unprincipled choice...` Read what he has
done here.” It carries the 1992/2025 inversion, explains `hoariness`, identifies the warning to the
next maintainer, and confirms the number’s survival on HEAD. It is the chapter’s best paragraph, but
it repeats the inversion four times: “inverted the instruction,” “no longer says *fix me*,” “says
*do not fix me*,” and “warning ... not to be clever.” Keep the first two formulations and let the
quoted comment perform the rest. The saved space should become room before the decision, not more
commentary after it.

The weakest paragraph is the closing paragraph of “The hand”:

> Loader flags to trap null-pointer dereferences. Twenty-seven years and sixteen thousand eight
> hundred sixty-three commits later, more than any other human in the project’s history, and the
> through-line of that enormous body of work is not the features he added but the judgment about what
> not to disturb.

The first sentence is a good small object. The second asks two examples to establish the through-line
of 16,863 commits, then becomes encomium: “the hardest and least visible engineering decision there
is.” Narrow the claim and keep the scale. This chapter can show that two unusually revealing commits
expose a kind of work a contribution count misses; it need not redefine Tom’s whole career from this
sample.

## Open, close, and “At home”

The raw-number opening is strong. It differs from Node’s zero/history trick and OpenSSL’s subject-line
sequence, and the number is both concrete and initially meaningless. Preserve that strangeness. The
only pacing fault is the immediate solution quoted above. Let the `XXX` and dated capitals establish
the expectation that somebody eventually fixed it.

The story’s proper close is now hidden in the middle: the 2025 comment converts an invitation into a
boundary. After that turn, the enum example should not arrive as “a purer example”; nothing is purer
than the title artifact changing meaning thirty-three years later. Put enum before restoration, then
let the restoration be the last technical act.

“At home” currently becomes a warning to revere old ugliness. That is not quite Tom’s practice. He
does not keep the number merely because it is old: in 2015 he improves the cases for which he has
better evidence, identifies the remaining default as risky, and names the testing he is unwilling to
pretend has been done. The transferable habit is therefore not *old means load-bearing*. It is:
before changing an embarrassing constant, find its decision history; separate the cases you can
prove from the fallback you cannot; and leave the refusal where the next implementer will encounter
it.

Compress that into one paragraph and merge it with “The hand.” The chapter can run the at-home
search, return to Tom’s first small commit, print the count, and end on scale. A closing sentence in
the right register would be:

> The count says 16,863. These two commits show the work the count cannot: the changes that reached
> Tom Lane and stopped.

That keeps the ending on Tom without claiming that all 16,863 commits share one moral. It also makes
refusal active: changes did not merely fail to happen; they reached a maintainer who decided where
they should stop.

## Top five changes, ranked by impact

1. **Restore the reveal by deleting the opening synopsis.** Let the 2015 title look like the promised
   fix, then let Tom’s own commit body refuse it. The reader must want the cleanup before learning why
   restraint is the work.
2. **Reorder the middle to 2015 refusal → 2023 parser refusal → 2025 restoration.** This creates an
   ascent from leaving code alone, to encoding a refusal, to actively restoring the old behavior,
   and saves the `fix me` / `do not fix me` inversion for the climax.
3. **Spend 500–700 new words on decision room, especially 2015.** Explain why the planner needs a
   number, show exactly which cases Tom can improve, and give the narrator a credible urge to clean
   up the fallback. Do not spend the words on project stature or generalized blast radius.
4. **Make restraint evidence-based rather than age-worship.** Replace “if it is old, do not touch it”
   with the more useful habit: find the prior opportunity, the recorded refusal, and the boundary
   between cases supported by evidence and the unknown fallback.
5. **Collapse the three codas into one and end on scale.** Trim the repetitive 2025 gloss, move enum
   earlier, fold “At home” into “The hand,” cut the career-wide encomium, and let the 1998 loader flags
   plus `16,863` supply the final weight. Keep one `~` beat; add the parser-placement beat only if the
   expanded companion needs a landing.

## The single most important change

Make the reader want Tom to replace `0.3333333` before Tom declines. Right now the chapter announces
that “nothing, on purpose” is wise and then supplies evidence. Rebuild 2015 as a genuine moment of
temptation—an apparently perfect cleanup, supported cases on one side and an untestable fallback on
the other—so the reader feels the danger of the fix one beat before Tom names his refusal. That is
what will make this RESTRAINT chapter distinct from every previous story about an old line and the
maintainer who inherited it.
