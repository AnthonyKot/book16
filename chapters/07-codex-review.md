# Craft review: “The current maintainer”

This is the right story, in the right broad order, with a strong title and a cold open that earns its turn. The draft is most moving when the repository is allowed to remain bureaucratic: two timestamps, a changed address, a counter incremented once more. It becomes less moving when the narrator names those objects as grief, soul, monument, or mortality. The central revision is therefore not to make the chapter less emotional; it is to move the emotion back into the ledger.

## Top five changes, ranked by impact

1. **Strip the interpretive pressure from the announcement and succession.** The paragraph beginning “What the successors did next is, to me, the most Vim-shaped grief imaginable” is the weakest in the chapter. It tells us how to classify the successors’ actions, attributes grief and monument-making to living maintainers, and culminates in “a dead man’s format” and “the man’s actual monument.” Those phrases make the narrator perform the mourning that the counter, commit grammar, and signatures already embody. Report the continuities and the newly plural author column; stop before explaining what they mean emotionally.

2. **Make the July 13/August 8 bridge the chapter’s full dramatic center.** It is the best evidence in the piece, but the section is only one compact paragraph and begins by announcing the desired response: “the object I find most affecting.” Let the reader discover that response. Slow down at the two dates, bring the two Git clocks into the narrative here rather than mainly in “At home,” and give the sequence 9.0.1678 → 9.0.1679 room. This is where the chapter can add necessary length without padding.

3. **Cut the aphoristic throat-clearing around the first reveal.** “That is the last thing Bram Moolenaar ever did to Vim” lands because the reader has just crossed an empty Saturday and watched one small Sunday task get processed. The lines immediately after it keep insisting on the effect: “The last commit is never a speech” and “This chapter is about…” The first is polished but universalizes a particular death; the second explains a chapter whose question is already clear. Cut both. Consider also cutting “the thirty-year authorship … closes”; the five-item list already does that work.

4. **Expand the social and procedural “room,” not the elegiac commentary.** At 1,688 words, the draft is roughly 500 words below the stated floor. Add 300–400 words around how authorship and committership function in this history and 150–250 around what visibly changes after August 3: the PR grammar returns, the counter continues, the Problem/Solution form remains, and the author column pluralizes. Keep every addition attached to an existing receipt. The chapter does not need more biographical tribute or more claims about what the successors felt.

5. **Simplify the close to one homeward habit and one flat terminal image.** The current ending offers three investigations (`--author`/`--committer`, merge gaps, shortlog windows), restates the license promise, revisits the flowers, and returns to the bridge. It diffuses the last note. Build “At home” around comparing author and committer dates—the habit this chapter uniquely teaches—and end on the patch counter or the two dates. “It changed. It was announced.” is also a clean possible stop. Do not spend both “flowers found a new address” and “authored before the world it landed in”; each asks to be the ending.

## Structure and pacing

The opening withholds the ending fairly. Calling Bram only “the maintainer” does not feel coy because the scene has immediate business: E418, the alphabetization, the valgrind timeout, the buffer rename. “Saturday passes without a commit” is the crucial negative beat. Then the Sunday typo arrives quietly enough that the reader feels the shape of a final entry before the draft says, “That is the last thing.” The turn lands.

One small pacing adjustment would sharpen it further: give “That is the last thing Bram Moolenaar ever did to Vim” its own paragraph, and do not follow it with an epigram. The clean sequence is mundane work, blank day, one last act of maintenance, white space, sentence. The death date can follow, but the sentence “the date is in the repository, and we will come to how it got there” slightly converts grief into a narrative coupon. A flatter version—“The repository gives the date as 3 August 2023.”—would preserve the closed evidence system without promising a later trick.

The macro-order—weekend / one name / constitution / bridge / announcement / at home—is correct. “One name” establishes why succession is a structural problem. “The constitution” establishes both the old boundary and the clause that will later change. Only then can the two dates in “The bridge” carry their full meaning. The announcement properly follows the first post-death commits: practice changes before policy catches up. Moving the announcement earlier would make the succession feel administered rather than lived.

The main pacing sag is inside “The constitution.” It contains two distinct revelations: the six-hour PR boundary and the LICENSE promise. Both are strong, but several verdict sentences overdetermine them: “Permissions were not the constitution,” “The gap *is* the constitution,” “it expired with its author,” and “a clause about mortality … waiting.” Keep perhaps the first two. The latter two apply retrospective tragedy to evidence that is already eerie. Cutting them will make the section move faster and leave emotional capacity for the bridge.

## The bridge

Yes, this should be the emotional center; no, it is not yet weighted as one. The raw object is extraordinary precisely because it is ordinary Git metadata:

> author    Christian Brabandt 2023-07-13T11:45:54+02:00  
> committer Christian Brabandt 2023-08-08T20:39:55+02:00

The section currently front-loads interpretation—“the object I find most affecting”—then compresses all of the consequence into one paragraph. Reverse that ratio. Start with the patch and the dates. Explain, in the narrator’s daily-`blame` voice, why those are two clocks and why most engineers glance past one of them. Then walk the reader across them: authored in the old arrangement, committed in the new; work prepared for one gate and admitted by another; the patch number continuing through the change. The reader should reach the gap before the narrator calls it a bridge, if the narrator calls it that at all.

The strongest sentence in the section is:

> “It is unfinished business from the old maintainer’s last week, carried across the gap with its original date still on it.”

Keep the physical idea of the original date being carried. It is concrete and native to Git. Be wary of “The work then waits where all his work had waited for twenty years: in the queue, for Bram.” It is rhythmically strong, but “all,” “twenty years,” and “for Bram” give it the swelling cadence of a summary verdict. In a section whose power comes from exact timestamps, “The patch retained its 13 July author date until Christian committed it on 8 August” is flatter and, in this elegy, more painful.

The bridge can absorb much of the missing 500 words, but it should do so through inspection, not repetition: distinguish author from committer; connect the final crypt rename to the cleanup without turning coincidence into providence; place 9.0.1678 and 9.0.1679 visibly beside each other; notice that the original author date survives the act of succession. This is the chapter’s unique technical lesson and its elegiac form at once.

## Prose: strongest work, weakest work, clunkiest sentence

The hardest-working paragraph is the one beginning:

> “Which would look like a project with no community, except for where the community actually is.”

It corrects the naive reading of the shortlog, explains Vim’s actual contribution practice, introduces Christian before succession makes his name consequential, and states the chapter’s governing distinction: “The author field says Bram; the *paragraph* says everyone.” That last sentence is excellent—brief, technical, humane. The paragraph earns its interpretation from a visible discrepancy rather than importing emotion.

The weakest paragraph is:

> “What the successors did next is, to me, the most Vim-shaped grief imaginable: they changed almost nothing.”

Nearly every sentence after that presses: “grief imaginable,” “dead man’s format,” “actual monument,” and “because” twice. The paragraph moves from the visible persistence of a format into an emotional interpretation of the living maintainers and a general theory of survivable one-maintainer projects. A restrained replacement might be:

> The counter did not reset. Christian’s first numbered patch kept the `patch 9.0.NNNN:` subject and the Problem/Solution form, adding `Signed-off-by:` lines and a pull-request number. After 3 August the shortlog becomes plural, but the commits remain legible in the old grammar.

Then stop. “One human becomes an org URL” has already expressed the change in governance; this paragraph only needs to show continuity.

The clunkiest sentence is in the opening:

> “The maintainer of one of the world’s most-used programs, on a Friday night, implementing a 1998 April Fools’ RFC in his text editor, because the error number was free and the joke was right there.”

The fragment is intentionally conversational, but four modifying phrases hang from a subject already burdened by “one of the world’s most-used programs,” and “editor” repeats the prior sentence. Rewrite:

> On a Friday night, the maintainer of one of the world’s most-used programs implemented a 1998 April Fools’ RFC. The number was free, and the joke was right there.

The sentence “The gap *is* the constitution” is the draft’s best aphoristic compression. It grows directly from three printed log lines. By contrast, “constitutions live in reverts and silences, not in documents” repeats it later as a lesson and weakens the first occurrence. Keep the discovery; cut the sloganized reprise.

## Taste and restraint

Nothing in the draft sneers, and the named successor is treated as a maintainer rather than a supporting character in Bram’s legend. The taste risk lies in assigning interior emotion or converting the death into a source of writerly images.

The line most likely to read as exploiting the death is:

> “every one of them files patches in a dead man’s format”

“Dead man” is needlessly reducing, and “every one” marshals living contributors into the elegy. Say whose format it is, or simply name the retained format. The line where the narrator most clearly cries so the reader does not have to is:

> “What the successors did next is, to me, the most Vim-shaped grief imaginable”

Cut it outright. It labels maintenance practice as grief and tells the reader the superlative emotional response before presenting the evidence.

Other lines to temper are “the place Vim actually keeps its soul,” “a clause about mortality, filed under licensing, waiting,” and “the machine was the man’s actual monument.” Any one might survive in a more austere chapter; together they create a narrator leaning over every artifact to explain that it is sad. The dedication’s “while still working full-time on Vim,” the changed LICENSE line, and the two dates already carry that knowledge.

The flowers motif is delicate. The diff itself is devastating because “flowers” was ordinary project language before it became charged by context. “Now the flowers go to a mailing list” is just restrained enough if it appears once. Repeating it as “The flowers found a new address” at the close turns the repository’s wording into the narrator’s funerary metaphor. Choose one; the first, beside the diff, is stronger.

## Expansion, opening, closing, and title

Do not expand toward the 2,200-word floor by adding tribute. Expand by making the technical reading experience more legible. The likely allocation is:

- 250–350 words in “The bridge” on Git’s two dates and the visible passage from 1678 to 1679.
- 150–200 words in “One name” or “The constitution” clarifying the distinction between credited contributor, author, committer, and merge permission.
- 100–150 words after the announcement showing, without interpreting motive, what changes and what remains.

That reaches the band while strengthening both narrator and revelation. The engineer who runs `blame` daily is present in opinions such as “The author field says Bram; the paragraph says everyone,” but could be more specifically present in the bridge: this narrator knows which timestamp people overlook and why that overlooked field matters here.

The open is excellent in conception and mostly excellent in execution. It starts on a clock and a joke, does not announce an elegy, and makes exacting maintenance lovable without canonizing the maintainer. Preserve its leisurely weekend chronology. Cut only the explanatory pressure after the reveal.

The close has the right material but too much of it. Let the at-home command arise from the bridge: compare `%aI` and `%cI`, especially around a project’s discontinuities. The merge-history and decade-shortlog habits have already been demonstrated and need not both be reissued. For the final line, prefer the ledger’s flatness. One possible cadence is: “Patch 9.0.1678 was followed by patch 9.0.1679. Authored 13 July. Committed 8 August.” It does not tell the reader what to feel, and it returns to the evidence that only became an elegy when the two dates separated.

“The current maintainer” is the right title. It is the LICENSE’s exact bureaucratic phrase, it initially names Bram, and by the end both “current” and the singular “maintainer” have changed under the reader. Do not make it more elegiac or more explicit.

**Single most important change: remove the narrator’s declarations of grief and monument from the announcement/succession passage, then spend that space slowing down over the July 13/August 8 timestamp pair until the ledger itself delivers the loss.**
