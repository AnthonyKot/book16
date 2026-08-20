# Craft review: “As discussed”

## Verdict

This chapter has the right objects and, in the empty `Project Leader` heading, a genuinely
great ending. Its special contribution to *Blame* is not simply that a project forked. It is
that git preserves a constitutional dispute in several incompatible forms at once: a deleted
office, 1,151 integrations of the rival tree, thousands of renamed headers, a path with no
parent, and finally an office removed after its occupant had already left it empty. The objects
complicate any winner’s account. That is exactly why the chapter can remain neutral without
becoming bloodless.

The draft is not neutral enough yet. It explicitly grants that “The disagreement was real and
principled on both sides,” but it does not give either principle room; after that sentence it
often describes the Libav founders collectively as a faction and assigns Niedermayer a private,
combative purpose. The most serious examples are “so that FFmpeg would contain everything Libav
had and Libav would have nothing FFmpeg lacked,” “He would not join them and he would not let them
diverge,” and “the other tree’s flow of work thinned until there was nothing left worth sitting up
for.” None is needed. The first two diagnose a living person from a commit pattern; the third
turns Libav’s decline into a contemptuous verdict. The git objects are more interesting than
those verdicts.

Structurally, the chapter reaches its best close in “The office,” then continues into “The scar”
and an instructional appendix. The fix is not to cut the scar. Move it before the office and make
it the technical consequence of the integration history. Then let the office biography complete
the human and constitutional story. A clean order is **January / string / qatar / scar / office**.
It restores chronology, puts qatar at the physical and emotional center, and reserves “The
position does not exist anymore” for the final narrative landing.

At 1,762 words, the chapter needs rooms, not more conclusions. It has enough aphorisms already.
The missing space belongs inside the two principles, inside the repeated work of merging, and
inside the narrator’s failed `--follow` search.

## Structure and pacing

The cold open works. The reader sees Michael Niedermayer’s name above the revert, then sees the
same name inside the deleted office, a beat before the prose says:

> The man reverting the deletion is the man the deleted lines name.

That is the book’s desired reveal mechanism: the commands let me notice; the narrator confirms.
Keep the two objects adjacent and keep the question “What had been committed, mistakenly or
otherwise, the afternoon before?” The phrase “doing more work than any sentence in this book” is
slightly overpitched before this chapter has earned the claim, but it points at the right title
object.

“January” currently summarizes the parties rather than putting either inside a room. This is
where 150–200 new words should establish the two plausible engineering principles without
inventing dialogue. A project with one person holding final design authority can value coherent
technical direction, continuity, and the ability to decide. Senior maintainers removing that
office can value distributed responsibility, review, and authority attached to maintained
subsystems. The existing no-merge rule can likewise be presented as a legible engineering
choice—a linear history and controlled integration—not merely as a “constitution” waiting to be
contradicted. Let both arrangements look like things serious maintainers might choose before git
shows what happened next.

Move “The string” immediately after January. It belongs to March 2011 and makes the abstraction
of “same code, same history, different name” physical. It also lets each project’s principle
remain legible: a new project needs its own name in the code it publishes; the continuing FFmpeg
tree has equal reason to retain its own. “You can ask git who won” converts a current-tree string
count into a verdict on the entire fork. Narrow the claim. Git can say which licence sentence is
at FFmpeg’s HEAD: zero Libav headers, 5,042 FFmpeg headers. That is already a hard, satisfying
landing. “A fork’s outcome, reduced to a grep” should become something like “One part of the
fork’s outcome, reduced to a grep.”

Put “qatar” third and give it the largest share of the added space. The sequence of receipts is
excellent: first merge, total count, single author, hour histogram, abrupt last merge. What it
lacks is a pause in which the reader understands the work represented by the objects. Add roughly
250–350 words, grounded in the narrator’s experience of merging: two parents preserve both lines
of descent; repeated integrations require examining what changed; some land cleanly and some,
like the last displayed merge, name conflicts. Do not manufacture 1,151 nights of hand-resolved
conflicts, but let the final two conflicted paths make the cost tangible. The narrator can say
what seeing that cadence does to an engineer who has postponed one difficult merge for a week.
That conveys devotion or obsession as an emotional possibility without naming either as a
diagnosis.

The histogram itself needs more restraint and therefore more force. The evidence shown says that
02 is the modal hour—103 entries—not that most of the 1,151 merges happened then. The close’s
“mostly at 2 a.m.” overstates the chapter’s own exhibit. Prefer a formulation such as “Two in the
morning is the most common hour in the objects.” Also distinguish an author timestamp from a
camera in someone’s room. “Sat up at night” may be a reasonable image, but after it the prose
compounds inference into motive. Let the numbers sit on the page before interpreting them. The
reader will feel the life around `02` without being instructed what kind of life it was.

Move “The scar” after qatar. It belongs in the chapter because it changes how the reader uses git,
and because a merge that produces a path found in neither parent is a beautiful material
consequence of the two-tree history. It feels appended only because the office has already ended
the story. In the new position, make it a first-person archaeological scene: the narrator runs
`--follow`, hits the impossible 2017 beginning, inspects both parents, and discovers the third
path. That is worth 120–180 new words. The section should be called “The merge” or “Neither
parent” until the amputation has actually been discovered; “The scar” tells us how to feel before
we see the break.

Then end the narrative with “The office.” It already contains the chapter’s deepest temporal
shape: created in 2006, contested over twenty-four hours in 2011, vacated in 2015, dismantled in
2022. Nothing after “The position does not exist anymore” can raise the stakes. The practical
habit should grow out of the pickaxe that found those four entries, and the final sentence should
return to what “as discussed” can and cannot mean in git.

## Neutrality audit

The draft avoids the prohibited word and never openly declares heroes or villains. Its
side-taking happens instead through pronouns, mind-reading, and unequal descriptions.

- “one prodigiously productive successor” is admiring, while “a group of senior maintainers who
  no longer accept that arrangement” gives the other group only opposition. Name the engineering
  values of both structures, not merely one person’s output and the other side’s refusal.

- “each convinced it was the real one” is symmetrical but still mind-reading, and makes both
  projects sound vain. “Both continued developing the shared history under different names and
  governance” stays with observable action.

- “Niedermayer’s answer to the fork” is plausible framing; what follows is not. “not to ignore it
  and not to fight it,” “so that … Libav would have nothing,” “He would not join them,” and “He
  absorbed them” turn integration into a campaign whose intention the repository cannot supply.
  State the astonishing policy: beginning in April, he repeatedly merged the other tree into
  FFmpeg. Readers can experience that as tenacity, inclusion, competition, preservation, or all
  four.

- “the no-merge constitution their side had written” assigns a January project document
  retroactively to a faction. “The January rule” is both clearer and fairer.

- “the other tree’s flow of work thinned until there was nothing left worth sitting up for” is
  the chapter’s least neutral sentence. It dismisses Libav’s work, presumes Niedermayer’s
  valuation of it, and explains an ending the commit itself does not explain. Stop at the much
  stronger observation: “The remote simply never appears again.” The absence is the point.

- “the departing side began renaming the project inside the shared history” makes a rename sound
  like an appropriation. “Libav renamed the project in the tree it had forked” gives the same
  action a comprehensible project reason. FFmpeg restoring its name can be described with the
  same generosity.

- “long after the shooting stopped” and “a man from the other side of the wall” keep people
  trapped in battle roles after the evidence shows them contributing to one tree. Use names and
  affiliations precisely. “One of the developers who had left for Libav” supplies the meaningful
  reversal without martial scenery.

- “Their directory idea, our file name” is the clearest accidental declaration of allegiance.
  The first-person plural makes the narrator a member of FFmpeg’s camp. Use “Libav’s directory
  organization, FFmpeg’s executable name,” then be equally careful with “compromise”: the merge
  object proves a result containing both inheritances, not that two parties negotiated it.

- “That is how this war actually ended” makes one 2017 path carry more political meaning than it
  can bear. It can be “one way the split survives in the tree” or “what integration looks like in
  one merge.”

- “the thing the war was about” reduces a broad governance conflict to the `Project Leader`
  heading. Say it was “one office at the center of the dispute.” The narrower formulation makes
  the object more credible, not less important.

The governing tonal rule should be: attribute purpose only where the object contains purpose;
elsewhere, describe repeated action and let its possible motives remain plural. Neutrality here
does not mean flattening the asymmetry—Niedermayer authored all 1,151 qatar merges—but refusing to
turn that asymmetry into a psychological verdict.

## Prose

The clunkiest sentence is:

> The no-merge constitution their side had written became, in his hands, a thousand merge
> commits with their remote’s name in the subject line.

It tangles two uses of “their,” converts a project rule into factional property, and tells the
reader to see the merges as a reversal imposed by one man. A cleaner, harder version is:

> The January rule banned merge commits. Beginning in April, this history acquired 1,151 of
> them, each authored by Niedermayer and each naming `qatar`.

The hardest-working paragraph begins:

> July 2015: Niedermayer edits the section himself — and removes only his own name.

It advances time, reveals character through a minimal diff, distinguishes leaving an office from
leaving a project, and turns a file structure into an image without declaring a winner. Preserve
the empty-office sequence. Its last line, “He just takes his name off the door and leaves the
door,” repeats “door” awkwardly; “He takes his name off the door and leaves the office standing”
keeps the image and the distinction.

The weakest paragraph begins:

> And then it just stops:

The command and “The remote simply never appears again” are superb. Everything after that tries
to furnish an explanation and an elegy the object does not contain: “nothing left worth sitting
up for” is dismissive, and “the habit ended the way habits end” is generic. End the section on the
unexplained absence, or use one plain narrator sentence acknowledging that git cannot tell why
the cadence stopped.

Several other formulations are vivid but overdetermine the evidence. “a written declaration,”
“armistice,” “shooting,” “the other side of the wall,” “epitaph,” and “returnee” accumulate a war
lexicon that makes continued integration and later shared contribution harder to see. The
chapter’s objects already supply conflict. Save the figurative language for the office and its
door; let the qatar objects remain procedural and uncanny.

The narrator also needs to be more present. “the strangest sustained habit I know of in any
repository” is opinionated, but most of the chapter speaks as an omniscient historian. Add the
engineer at moments of method: what the narrator expects `-S 'Project Leader'` to find, why a
remote name becomes a search key, and what it feels like when `--follow` declares a famous file
only five years old. First person is especially useful for neutrality because “I read this as”
marks an interpretation honestly instead of presenting it as someone else’s motive.

## The `~` beat

Cut the current beat:

> The revert is the last commit in which this project is one project.

It arrives after the prose has already named the fork, depends on an off-repo boundary, and is
less true to the chapter’s paradox than the 1,151 subsequent merges. The striking discovery is
not simply that one history became two; it is that the split becomes visible through repeated
integration.

Use one `~` beat, not two, and move it into qatar after the count and hour histogram:

> ~ Git records the fork as 1,151 acts of integration.

That sentence lets the reader see the paradox in the receipts a beat before the prose unfolds
its implications. A second tilde would compete with the office’s four-word ending, which needs no
authorial gloss.

## Title, open, and close

“As discussed” is the right title object but does not yet flip. At the opening it means an opaque
claim to consensus: the discussion is elsewhere, and either side can point outside the tree. The
rest of the chapter never substantially revises that meaning, so the title remains ironic rather
than deepening.

Make it flip from **missing conversation** to **observable shared work**. The repository cannot
recover the January discussion, but it can show what the projects continued to exchange, what
one tree repeatedly integrated, what names remained, and what office eventually disappeared.
Do not claim those objects prove agreement. The richer turn is that discussion and agreement are
not the same thing: git loses the argument but preserves the revisions people made in response
to one another.

The open should therefore retain its epistemic limit—“Both citations point off-repo”—but drop
“where the actual war was being fought,” which makes the commits sound secondary. They are the
book’s primary evidence. A cleaner bridge would say that git does not preserve the meeting, then
ask what it preserves instead.

The close should not be “Believe the record.” That is too prosecutorial for a chapter whose
central lesson is that the record does **not** reveal what was discussed or why each person acted.
It also follows “mostly at 2 a.m.,” the draft’s least precise description of the histogram.
End with calibrated confidence: the record proves acts, sequence, authorship, and surviving
structure; it does not prove private motive.

A possible final turn—not necessarily final copy—is:

> I cannot recover what “as discussed” meant in that room. I can recover what both trees kept
> saying to each other afterward.

That line flips the title, returns to the limitation established in the opening, and leaves both
parties acting rather than one side winning.

## At home

The two practices are strong: pickaxe the name of an office, and search merge subjects for the
other tree’s remote. Keep both. Remove the literal `## At home` heading and weave them through the
last movement. The template asks for a habit, and the chapter can make the narrator model it:
“Since this dig, I pickaxe role headings, not only people’s names.” The remote-name search can
follow as the second half of the same practice: written policy lives in documentation; practiced
integration lives in merge objects.

Retain the useful distinction that deleting a person while leaving a role is different from
deleting the role. Soften the universal equation “the commit that deletes a name … is a
resignation”; in another repository it may be a replacement or cleanup. Here, the specific diff
and subject make it a resignation. At home, tell readers to inspect that difference rather than
pre-decide its meaning.

Likewise, an hour histogram does not by itself tell “what the policy cost somebody.” It shows
when the objects say the work was authored. Invite the reader to notice the distribution and then
inspect conflicts and cadence. That is a more reproducible habit and a more honest extension of
the chapter’s method.

## Where the missing words should go

The revision will probably need to cut 150–250 words of diagnosis and martial metaphor before
adding 650–850 words of room, leaving a body around 2,250–2,400 words. Add the space here:

- **150–200 words in January:** make centralized technical direction and distributed maintainer
  authority both read as principled engineering arrangements. Let the no-merge rule make sense
  before it becomes ironic.

- **250–350 words in qatar:** dwell on what repeated two-parent integration means, let the single
  author and modal hour register, and use the displayed conflicts to make labor concrete without
  diagnosing obsession.

- **120–180 words in the scar:** stage the narrator’s `--follow` surprise and parent inspection
  as a discovery instead of delivering the conclusion immediately.

- **100–150 words across transitions and the close:** trace the movement from separate names, to
  repeated integrations, to a path inheriting from both trees, to an office no longer present.
  This connective tissue will make the five objects feel cumulative rather than anthological.

Do not spend the new words on more fork history, more contributor rankings, or an explanation of
who ultimately prevailed. The absence of such a verdict is the chapter’s point.

## Top five changes, ranked by impact

1. **Remove diagnosed motives and factional pronouns, especially in qatar.** Replace “He would
   not join them,” “He absorbed them,” “nothing left worth sitting up for,” and “their … our”
   with descriptions of objects and actions; give both governance models an intelligible
   engineering principle.

2. **Reorder the five sections to January / string / qatar / scar / office.** This restores
   chronology, centers the 1,151 merges, turns the scar into a consequence instead of an
   appendix, and lets the empty office provide the one true ending.

3. **Expand the qatar room while refusing to name the feeling.** Let the count, sole authorship,
   modal 02 hour, cadence, and displayed conflicts accumulate; correct “mostly at 2 a.m.” to what
   the histogram actually shows and let readers call the pattern devotion, obsession, duty, or
   competition for themselves.

4. **Make “As discussed” flip and replace “Believe the record” with epistemic restraint.** Git
   cannot recover the argument or private motives; it can recover the long material exchange that
   followed. Bring that distinction back in the final line.

5. **Use the missing words for narrator-led discovery and principled rooms.** Add the engineer’s
   expectations around pickaxe, merge work, and the `--follow` amputation; cut repeated war
   metaphors and verdicts rather than padding the historical summary.

The single most important change is to rebuild qatar so that the 1,151 merges and the 02-hour peak
make the reader feel the sustained human commitment before the narrator supplies any meaning—and
then have the narrator decline to decide which meaning is the only one.
