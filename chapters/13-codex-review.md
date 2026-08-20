# Craft review — “Remove promises”

## Overall

The chapter has a first-rate discovery and the right mirror, but it currently tells the discovery faster than it dramatizes it. The Promises deletion is the chapter: it overturns the origin story and establishes the governing idea that a tree preserves the winner, not the argument. The `sys` episode is valuable because it acts as a controlled second case: same founder, same deleting instinct, different distribution of authority, opposite outcome. That makes it a mirror rather than a second chapter—but only if the Promises scene is enlarged and the `sys` section is explicitly framed as a test of what makes deletion stick.

At present, the hierarchy is reversed in dramatic terms. Promises gets a log, a stat, and a conclusion. `sys` gets a succession story, a character who answers Ryan, a memorable verb (“Un-break”), a later policy judgment, survival in HEAD, and Ryan’s exit. The nominal spine is Promises; the felt story is Isaac inheriting Node. Add room around the Saturday-night deletion, then let Isaac’s un-break echo it more briefly and concretely.

The chapter also needs more narrator. Its voice is confident and intelligent, but it sounds like a prosecutor presenting a solved case. The book’s engineer should be caught believing the folklore too. A few first-person turns—“I believed this,” “I searched the obvious path,” “the zero looked like confirmation”—would replace triumph with implicated curiosity without softening the conclusion.

## Structure and pacing

The opening announces the verdict before the repository can spring it:

> “It is the origin story you have heard. It is also wrong, and the repository has known it was wrong the whole time.”

“It is also wrong” spends the reveal; “the repository has known” gives the repository a smug omniscience that belongs to the narrator. Start instead with the misleading absence now buried under “Why you can’t find it.” The expected-path search returns `0`. Let that zero seem to confirm the callback origin story. Then change search methods and show the six early Promise commits. The reader will see “Add Promise class” and “Implement Promises for file i/o” a beat before the narrator says, simply, “Node had Promises.” That is the reveal shape the chapter wants:

1. I believed the familiar story.
2. The obvious path appears to confirm it: zero history.
3. A content search produces the early Promise sequence.
4. The reader understands what that sequence means.
5. The narrator names it: Node had Promises.
6. The Saturday commit explains why the tree lies by omission.

This ordering also makes “The tree is the current state of an argument. It is not the argument” arrive as a finding rather than a thesis placed on top of the evidence.

The missing 650–1,600 words should not become general Node history. They belong in two rooms and one hinge.

First, slow down at 7:45 p.m. on Saturday, February 20. The draft jumps from the commit header to the stat and then immediately to a decade of consequences. Stay with the object being removed: eight months of accumulated class, file-I/O integration, documentation, and tests; a Promise strange enough to inherit from `EventEmitter`; `.wait()` capable of blocking the event loop; four files; 306 deletions; a blank body. The blank body sets an important limit: history proves the act but does not supply the motive. That uncertainty is not a hole to paper over with speculation. It is the human tension of the scene. The narrator can reconstruct what sat in front of Ryan without pretending to know what was in his head.

Second, give Isaac’s un-break one clean scene. Put the one-line throw and the one-line shim close together. Then let “Fix #3577 Un-break require('sys')” arrive before the interpretation of *un-break*. The current paragraph has the right insight, but it races through the physical action and enlarges it into a contest of authority. A few beats of concrete code will make less rhetoric necessary.

The hinge between the cases should state their relationship once: the Promises removal shows how a deletion becomes an origin myth; `sys` tests what happens when the person deleting no longer has uncontested custody of the tree. That sentence will keep the second half subordinate to the first.

Be especially careful not to turn the `sys` sequence into a “revert war.” This passage currently leans that way:

> “It went further than a single reversal. In 2015, the governing committee took it up formally and settled the question against the founder for good.”

There was one break, one un-break, then a later policy decision. “It went further” and “against the founder” imply a sustained fight and a personal rebuke. A cleaner transition would be:

> “That was the whole code exchange: one break, one un-break. Nearly three years later, the committee made the maintenance policy explicit: deprecate, don’t remove.”

That restraint makes the contrast stronger. The record does not need a war to show a transfer of authority.

## The `~` beat

Move it, rewrite it, and keep only one.

> “This project never had X” almost always means someone deleted X, and the deletion is the thing worth reading.

Where it sits, it arrives after one example and before the chapter has demonstrated why a deletion sticks or fails. “Almost always” is also much larger than the evidence and contributes to the narrator’s caught-you tone. The thought becomes earned after the HEAD version of `lib/sys.js`, when the reader has seen both outcomes. A more exact version:

> ~ In a tree, “never existed” and “was deleted long ago” look exactly alike.

That line generalizes the method, not Ryan’s motives, and prepares the move home. Do not add a second `~` beat. The `sys` episode is the second beat in dramatic form; another aphorism would explain the echo the reader has already felt.

## Narrator and stance

The narrator is presently opinionated but almost wholly absent. “Everyone knows,” “It is also wrong,” “Ask,” and “the repository has known” position the voice above the mistaken crowd. The better stance is: *I knew the same clean story, because the current tree makes it look true.* That gives the folklore an honest mechanism and obeys the book’s no-sneering rule.

The most prosecutorial phrases are:

- “one person deleted them”
- “the founder deciding an old thing is over”
- “settled the question against the founder for good”
- “the rename Ryan ordered never happened”
- “the thing outlived the person who condemned it”

Not all need to go, but together they cast Ryan as a ruler whose decrees are being overturned. The repository supports a subtler and more interesting account: a young project could make a founder’s unexplained deletion durable; a mature project with a different maintainer and compatibility burden could absorb, reverse, and later formalize policy around a second attempted removal. Let the change in project structure carry the judgment.

There is also a precision snag in “The rename Ryan ordered never happened.” The preceding paragraph says `sys` had already been renamed to `util`; what never happened was the promised deletion of the old alias. Rewrite it as:

> “The deletion Ryan promised never happened.”

That keeps the chapter clear of the v0.9 trap as well: the claim is only that the promised deletion did not arrive, not that a v0.9 release line did not exist.

## Title

Keep “Remove promises,” but make its flip audible. It begins as the exact subject of the decisive commit: remove the Promise API. The `sys` mirror supplies the second sense: “To be removed” is itself a promise, and a successor can decline to keep it. Right now the text touches that meaning—“a promise to delete it entirely”—but never cashes it, so the title mainly reads as a quoted commit subject.

One restrained echo near the turn into `sys` or near the close is enough: one removal happened; the later promise of removal did not. Avoid building a wordplay paragraph around it. The double meaning should click half a beat after the reader encounters “To be removed in v0.9.”

## Prose

The clunkiest sentence is in “At home”:

> “And when you read a deprecation — *this will be removed in the next version* — remember that it is only as real as the next maintainer's willingness to enforce it. `git log --follow` on the deprecated file will tell you whether the removal ever came or whether, like `require('sys')`, the thing outlived the person who condemned it, kept alive by a successor who decided the founder was wrong.”

It carries the lesson, command, result, analogy, succession, and moral judgment in one long exhale. Rewrite:

> “When a deprecation says *to be removed*, follow the file’s history. You may find the removal. You may find a later maintainer quietly declining it.”

Then let the existing `sys` evidence supply the rest.

The strongest, hardest-working paragraph begins:

> “A Promise was a kind of EventEmitter — that is how early it was…”

It does four jobs cleanly: makes the artifact feel historically strange, shows why a modern filename search fails, teaches content pickaxe, and earns the distinction between tree and history. Preserve it, but move most of this material into the reveal staircase near the opening rather than leaving it as an explanation after the verdict.

The weakest paragraph is the one beginning:

> “Everything that came after, the entire callback identity of Node, is downstream of this commit.”

Its causal claim is too total, “first year” and “most of a year” blur the sharper eight-month fact, and the paragraph repeats the conclusion several ways before the scene has had time to register. A tighter version:

> “The callback-only origin story cannot survive this sequence. Node shipped Promises, documented and tested them, and removed them eight months later in one silent commit. What looks in the tree like an original choice was a later deletion.”

That names the turn without crowing over it.

## Open, close, and “At home”

The best open is the `0` from the expected path, narrated in first person. It is concrete, method-driven, and thematically exact: absence masquerading as proof. It also avoids another expository “Everyone knows” opening and gives the reader somewhere to stand before the history changes shape.

The Ryan fade is emotionally strong:

> “The man who wrote `Remove promises` and set the shape of a platform left it not with a statement but with a version bump to somebody else’s build system, and then he was simply gone from the log.”

That image should be very near the end. “The least authorial commit imaginable” risks a small sneer; the version bump already supplies the irony without that verdict. The deeper point is not that the last commit was beneath him, but that git records succession without ceremony.

The current “At home” section is useful but over-complete. It restates the thesis three times and teaches two commands, so the chapter lands as documentation after reaching an elegiac close. Compress it to the single transferable habit: when the tree says *never*, search content across history with `git log -S … --all`. The `--follow` advice is defensible, but it dilutes this chapter’s distinct lesson and can be saved for another dig or made a subordinate clause.

Braid that habit into the fade rather than attaching a manual afterward. A possible closing movement is: Ryan’s last GYP bump; the narrator’s changed reflex when a tree reports an absence; the one content-pickaxe command; then the surviving alias. The final sentence can be as plain as:

> “The founder disappeared from the log. `require('sys')` did not.”

That ending preserves the human fade, completes the mirror, and leaves the reader with survival rather than an abstract summary.

## Top five changes, ranked by impact

1. **Rebuild the first act as an absence-to-discovery-to-deletion reveal.** Open on the zero-path search, let the early Promise commits contradict it, and withhold “Node had Promises” until the reader has just realized it.
2. **Give the Promises deletion the chapter’s largest room.** Slow down on Ryan’s Saturday night, the 306 removed lines, the four kinds of project material, and the empty commit body; preserve the boundary between what git proves and what it cannot tell us.
3. **Make `sys` an explicit mirror, not a second contest narrative.** Put throw beside shim, name the changed custody of the tree, and describe the record accurately as one break, one un-break, and one later policy vote.
4. **Implicate the first-person narrator and lower the prosecutorial temperature.** Replace “everyone was wrong” energy with the engineer admitting why the present tree made the folklore believable.
5. **Move and narrow the `~` beat, then compress “At home.”** Generalize only after both cases, teach one distinctive command, and return to the fade for the final emotional note.

**Single most important change: rebuild and enlarge the Promises deletion as the dramatic spine, so the reader experiences the absence, discovery, and silent 306-line removal before `sys` arrives to prove why some deletions become folklore and others do not.**
