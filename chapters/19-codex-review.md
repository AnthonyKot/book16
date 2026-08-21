Reading additional input from stdin...
OpenAI Codex v0.148.0
--------
workdir: /home/diablo/book16
model: gpt-5.6-sol
provider: openai
approval: never
sandbox: read-only
reasoning effort: high
reasoning summaries: none
session id: 01a0253d-67cd-7203-aac9-fa5068803ec8
--------
user
You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
is an engineer who runs git blame daily; first person, opinionated, no sneering; the reader should
feel a reveal a beat before it's named.

READ: chapters/19-openttd.fable.md, chapters/19-openttd.receipts.md, plus CONTEXT.md and
TEMPLATE.md. Context: NEW P.S.-candidate chapter (source 19), the "range" candidate — community/
creed material, not security. The published book runs xz / debian-openssl / t2t / dual-ec /
postgres / php / npm / vim. Two calibration facts: (a) a professional-SDE reader scores concision
and real-world consequence hardest, and stakes-free archaeology rates LOW with that reader — this
chapter's biggest exposure; (b) postgres (numbered 05) is already the restraint/load-bearing-hack
chapter — this one must be distinct (its distinctness claim: the "typo" fix was wrong ON THE
MERITS — the value only looked wrong; and the revert manufactured documentation at the point of
temptation).

Spine (verified, LOCKED to receipts): maedhros 2007-04-12 (61fe3568) introduces the town-growth
table with "The default rate is TTD's original rate" and the `if (n == 0 && !CHANCE16(1, 12))
return;` gate; Yourself <kyle.smith314@gmail.com> 2019-11-18 (7e22f243, committed by Ingo von
Borstel, the identity's only commit) changes one cell 320->420 titled "Fix: typo in town growth
rates (#7837)"; frosch 2019-11-20T01:00 (61dba850, committed by Charles Pigott) reverts with
"OpenTTD tries to replicate the original game mechanics. Making numbers look nice and correlate
is no goal, and in this case they actually did not correlate." and adds the five-line note
naming the malus in UpdateTownGrowth(); net diff pre-fix vs post-revert is the comment alone
(R8); the 2023 uint16->uint16_t migration leaves values and note untouched (eaae0bb5); at the
2026 tip the note and row still blame to frosch (R10).

FACTUAL GATE (one flag gates): every hash, date, name, quote, and code line in prose must appear
in chapters/19-openttd.receipts.md. Specific items: the draft must NOT claim 320 is "the original
binary speaking" or that frosch personally lived with the values since 2007 (both failed scout
verification — only "TTD's original rate" from the 2007 message is supported); the CHANCE16(1,12)
"one in twelve" reading is code interpretation from R3 — judge whether the prose presents it as
reading, not receipt; the "eleven times out of twelve sent home without progress" arithmetic —
supportable from the receipt's code? The draft says the malus "had migrated to a different
function in the file" by 2019 — is that supported by the receipts (frosch's comment names
UpdateTownGrowth()), or does it need softening? List the one <!-- CHECK: --> marker (game
identity) and judge scope.

Craft risks to judge hard: (1) the consequence problem — the chapter argues its low stakes ARE
the point ("the successful version of every disaster chapter"); does that landing convince a
consequence-scoring reader, or does it read as special pleading? (2) distinctness from postgres —
same-y or genuinely different register? (3) the "Yourself" name material — delightful or
sneering? The chapter promises no-fool framing; hold it to that. (4) is the hidden-clause section
(the toll-gate explanation) legible to someone who's never seen the game? (5) title "Making
numbers look nice" (chosen over the commit title to avoid colliding with the numbered chapter
"Fix typo") — does it flip? (6) word count 2,235, low end of the 2,200-3,200 band — does anything
need room, or is lean right for this reader?

Output: a numbered gate list (must-fix), then optional suggestions. Be specific — quote the
line, say the fix.
warning: Codex could not find bubblewrap on PATH. Install bubblewrap with your OS package manager. See the sandbox prerequisites: https://developers.openai.com/codex/concepts/sandboxing#prerequisites. Codex will use the bundled bubblewrap in the meantime.
codex
I’m using the learning-experience design skill only as a structured lens for reader journey, reveal timing, and comprehension; the actual verdict will stay a literary/factual edit grounded in the four files.
exec
/bin/bash -lc "sed -n '1,240p' /home/diablo/.codex/skills/design-learning-experience/SKILL.md && printf '\\n---FILES---\\n' && wc -l CONTEXT.md TEMPLATE.md chapters/19-openttd.fable.md chapters/19-openttd.receipts.md" in /home/diablo/book16
 succeeded in 138ms:
---
name: design-learning-experience
description: Design or redesign evidence-backed learning products and educational workflows. Use for learner journeys, curriculum and practice UX, coding-interview or LeetCode products, lesson discovery, guided-to-independent practice, feedback and debrief flows, review systems, product information architecture, route consolidation, learner-facing navigation, and implementation-ready UX plans grounded in repository evidence rather than invented personas or generic dashboard conventions.
---

# Design Learning Experience

Design the product around learner progress, not around a feature inventory. Inspect the real repository before proposing screens.

## Start from evidence

1. Read the repository instructions and the smallest set of product, research, content, route, state, and test files that explain the current experience.
2. Inspect the implemented surfaces when the task depends on current behavior. Prefer actual routes, screenshots, or browser checks over filenames alone.
3. Classify consequential claims as **observed**, **research-backed**, **inferred**, or **hypothesis**. Never silently promote a hypothesis to a fact.
4. Preserve the user's requested action mode: report for review requests; edit for redesign or implementation requests.

Read [references/evidence-and-jtbd.md](references/evidence-and-jtbd.md) when personas, research, audience assumptions, jobs, or priorities are part of the task.

## Define learner progress

1. State the primary learner and their situation in behavioral terms.
2. Express the main job without feature names: `When ..., I want ..., so I can ...`.
3. Identify the related jobs needed to reach that outcome, including confidence or interview-performance jobs only when supported.
4. Identify the observable evidence that means the learner made progress. Do not equate visiting a page with learning.

## Model the learning domain

1. Inventory only the entities that current data or required learner jobs justify.
2. Record each entity's important fields, relationships, lifecycle states, source file, and supporting job.
3. Mark unsupported entities or fields as hypotheses instead of designing around them.
4. Distinguish an entity, a page, an action, and a state. Empty, loading, incorrect, blocked, and overdue are usually states, not separate destinations.

Read [references/learning-domain.md](references/learning-domain.md) for the reusable learning loop, coding-practice entities, and state vocabulary. Adapt it to the product; do not force every product into the complete loop.

## Map the current journey

1. Trace the primary journey from entry to meaningful outcome.
2. For every current surface, record its learner job, unique action or state, entry paths, exits, and overlap with other surfaces.
3. Expose hidden teaching content, duplicated presentation routes, unclear next actions, and places where the learner can stall.
4. Preserve useful engines and data models when the presentation is the problem. Remove or merge a route only after moving its unique actions.

## Design the target journey

1. Put one clear recommended next action at the learner's decision point.
2. Connect orientation, instruction, guided practice, independent practice, feedback, debrief, mastery evidence, and later review where the domain supports them.
3. Attach guidance to the task at hand. Translate scheduler or scoring internals into human language and next actions.
4. Define recovery from no result, wrong answer, exhausted hint, interrupted attempt, missing prerequisite, and stale or unavailable data as applicable.
5. Make completion explicit. A passing test, an opened lesson, and demonstrated mastery are different events.

## Derive surfaces and navigation

1. Derive surfaces from jobs and entities, not from competitor menus or generic SaaS patterns.
2. Keep global navigation limited to durable job clusters. Use contextual actions inside the learning flow and deep navigation for rare management tasks.
3. Treat three interactions to the main job as a diagnostic heuristic, not an absolute law. Optimize for clarity, continuity, and decision cost.
4. Prefer one workspace containing the next recommendation over separate planner, catalog, and progress pages that repeat the same evidence.

Read [references/ia-and-flows.md](references/ia-and-flows.md) when producing a sitemap, navigation model, flow diagram, coverage matrix, or IA critique.

## Make the proposal implementation-ready

1. Trace each proposed surface to a job, entity or content source, learner action, required states, and success evidence.
2. Identify screen orphans, job orphans, dead ends, missing states, duplicated workflows, and unsupported assumptions.
3. Prioritize the smallest coherent learner loop before secondary catalogs, analytics, or decorative dashboards.
4. Specify acceptance criteria in observable language, including the next action and recovery behavior.
5. If implementation is requested, edit the existing architecture and visual system instead of stopping at an artifact. Verify the real gates afterward.

## Report the outcome

Lead with the recommended learner journey and the highest-impact changes. Separate confirmed facts from hypotheses, list unresolved product decisions, and name the files or routes that support the conclusion.

---FILES---
   94 CONTEXT.md
   22 TEMPLATE.md
  223 chapters/19-openttd.fable.md
  233 chapters/19-openttd.receipts.md
  572 total

codex
The review is read-only. I’m separating receipt-backed facts from code readings and then testing the chapter as a compact reader journey: temptation, hidden clause, reversal, consequence.
exec
/bin/bash -lc "sed -n '1,240p' /home/diablo/.codex/skills/design-learning-experience/references/evidence-and-jtbd.md && printf '\\n---CONTEXT---\\n' && sed -n '1,180p' CONTEXT.md && printf '\\n---TEMPLATE---\\n' && sed -n '1,160p' TEMPLATE.md && printf '\\n---FABLE 1---\\n' && sed -n '1,260p' chapters/19-openttd.fable.md && printf '\\n---RECEIPTS 1---\\n' && sed -n '1,280p' chapters/19-openttd.receipts.md" in /home/diablo/book16
 succeeded in 204ms:
# Evidence and JTBD

Use this reference to prevent polished but invented product reasoning.

## Evidence labels

Use one label for every consequential claim:

- **Observed**: visible in current code, content, state, tests, or a directly inspected interface.
- **Research-backed**: supported by a named interview, study, analytics source, review, or user-provided evidence.
- **Inferred**: a reasoned conclusion from observed facts; state the facts and inference.
- **Hypothesis**: plausible but currently unsupported; state how to test it.

Do not treat competitor behavior as user evidence. Do not remove a hypothesis marker without new evidence.

## Extract behavioral evidence

Capture:

- the situation that brings the learner to the product;
- the progress they are trying to make;
- the decisions they struggle with;
- where they become stuck, abandon, or seek help;
- what earns or breaks trust;
- what counts as success outside the interface.

List unknowns separately. Rank unknowns by how much they could change the design rather than by how easy they are to research.

## Build lean personas

Create a persona only when a behaviorally distinct group changes the workflow, content, feedback, or trust requirements. Describe:

- situation and prior knowledge;
- goal and motivation;
- recurring obstacles;
- decision behavior and help-seeking behavior;
- evidence source;
- uncertain assumptions.

Merge personas that differ only by demographics. Choose a primary persona by product intent and evidence, not by narrative appeal.

## Formulate jobs

Use:

`When [situation], I want [motivation or progress], so I can [meaningful outcome].`

Reject a job when its middle clause names a proposed feature such as dashboard, streak, planner, hints panel, or progress page. Rephrase it around progress.

Learning examples:

- `When I face an unfamiliar array problem, I want to recognize the governing pattern, so I can choose an approach before coding.`
- `When my solution fails, I want feedback tied to my reasoning, so I can correct the misconception instead of memorizing an answer.`
- `Before an interview, I want to practise explaining tradeoffs under time pressure, so I can communicate a defensible solution.`

## Prioritize jobs

For each job, record:

- importance to the primary learner;
- current support in the product;
- evidence strength;
- competing alternatives;
- consequence if unsupported;
- product or content capability that could support it.

Use unknown rather than a convenient middle score. Prioritize jobs that are important, weakly supported, and central to the main outcome.

## Target research gaps

Ask the smallest question capable of changing a design decision. Specify the evidence needed and where it could be found. Update only the claims affected by the answer.

---CONTEXT---
# Blame — authoring context

Working title: **Blame**. Git archaeology: each chapter is one dig in a public repository,
reproducible by the reader. Receipts are commit hashes; `verify.sh` (to be written after the
pilot settles the receipt format) clones and re-checks them.

## Why this book exists (the quality diagnosis — do not lose this)

Born 2026-08-18 from a diagnosis of why the earlier shelf reads as boring:
1. **Exhibits without a narrator.** Fix: the narrator is an engineer who runs `blame` daily and
   is walking you through *their* obsession. First person allowed. Opinions allowed.
2. **No surprise.** Fix: every chapter is built around a reveal the reader should feel a beat
   before it is stated. Cut digs that only confirm folklore (surprise ≤2).
3. **Uniform template.** Fix: TEMPLATE.md defines *beats*, not sections. Chapters may open on a
   diff, a timestamp, a name, or a hole. No two consecutive chapters open the same way.

Second reader lesson (book14, 2026-08-18): rigor lives in the receipts file; the reading
surface stays plain and entertaining. A reader must be able to *see the moment* without holding
locators in their head.

## Non-negotiables

- **Never false.** Every hash, date, author, message and diff quoted in prose must exist in the
  receipts file, which is generated by `scripts/receipts-NN.sh` running real commands against a
  real clone. Never quote command output from memory or from a scout report — the two-model
  audit (2026-08-19) showed scouts silently tidy transcripts.
- **Moment before the outcome.** Reconstruct what the actor knew when they typed. No sneering,
  no hindsight-flattering. The reader should think "I might have done this."
- **Chapter changes how the reader reads their own repo.** Each chapter ends with what to run
  at home — woven in, not a boxed sidebar.
- **Reader cut ≤ 2,000 words by default; up to 3,000 when the story earns it** (user, 2026-08-21:
  "if story is good, it could be up to 3,000"). The default is still the target — the extra
  thousand is for material that raises the score, never a license to skip the trim pass; the SDE
  reader's #1 note was concision. The counter is prose-only:
  `grep -v '^<!--' NN-x.reader.md | wc -w` (authoring comments excluded; the italic footer and
  code panels count). Settled 2026-08-21 after two sessions counted the same file differently.
- External (non-git) facts carry `<!-- CHECK: -->` markers until an adversarial review pass
  clears them, then `<!-- VERIFIED: evidence + source URL -->` comments preserve the invisible
  audit trail (book14 pipeline: draft → grok/agy/codex reviews → canonical).
- **Never put grep-filtered diff output inside a ```diff fence.** Grep strips hunk boundaries and
  can stitch lines from different functions into a "diff" that exists nowhere in the tree (this
  bit ch.05's centerpiece on 2026-08-19 — caught by a blind reader test). Grep transcripts belong
  in ```console with the pipe visible; real hunks are shown verbatim via sed line-ranges.

## Pipeline per chapter

1. Scout report (grok) + second-opinion verification (codex) — done for 23 repos, `scout/`.
2. `scripts/receipts-NN.sh` → `chapters/NN-x.receipts.md` (verbatim, regenerable).
3. `chapters/NN-x.fable.md` draft with CHECK markers, body ≤3,200 words.
4. Adversarial reviews from a shared prompt; apply gate items; 0 CHECKs → `chapters/NN-x.md`.
5. Human reader test (score 1–10) before the chapter counts as done.

## State

- `scout/` — 23 grok reports + 23 codex verify/extend reports + SELECTION.md (Round 1 ranking;
  v2 with Round 2 + codex digs pending).
- Final public sequence, second edition (source IDs remain stable for receipts): 04 xz → ch.01;
  01 Debian OpenSSL → ch.02; 10 t2t → ch.03; 14 Dual EC → ch.04; 15 Postgres → ch.05;
  12 PHP → ch.06; 09 npm → ch.07; 07 Vim → ch.08. (2026-08-21, from the SDE reader test,
  user's constraint: exactly 4 out / 4 in, order and rework delegated to the working sessions.
  OUT: Git — readers "didn't get it"; Costume — "messy, no plot", scored 4; Node — weak plot,
  "I'd replace right away"; Log4j2 — scored 6 with a rewrite-level concision complaint, and it
  is the corpus's most-retold folklore, so its surprise budget is lowest. IN: PHP, npm, t2t,
  Dual EC — Dual EC matches the formula the reader rewarded (one person, one artifact,
  restraint, real stakes). Order logic: xz opens (user's pick); xz→Debian OpenSSL is a
  deliberate contrast (attack, then honest mistake); t2t and Postgres are breathers between
  the security chapters; PHP→npm pairs repo forgery with registry sabotage; Vim keeps the
  elegy close.)
- The other eight completed investigations remain accessible under `P.S. Drafts` on the contents
  page, but are not part of the numbered book.

## SDE reader test (2026-08-21, in progress)

Full scoreboard from a professional-engineer reader: **Postgres and Vim best** ("more or less
well written" — the writing carried them); **xz 7**; **Log4j2 6**; **Debian OpenSSL and Node
"kind of ok"** — entertaining but not high-quality writing/story (OpenSSL misses the
significance of the bug; Node has a weak plot → demoted); **Costume 4 → demoted**; **Git
worst** — readers "didn't get it". Calibration: this reader scores PROSE QUALITY first
(the two most-restrained chapters won), then real-world consequence; clever-meta and
whimsy registers (Costume, Git) rate low even when model reviewers and blind sims rate them
high. Recurring note: write more concisely, and end with the real post-factum impact (for
xz: how far the payload actually got, the sshd/libsystemd target, the Jia Tan working-hours
research; for Debian OpenSSL: the two years of guessable keys). Open follow-ups: impact
endings for xz and Debian OpenSSL (sourced, VERIFIED-marked); concision trims on flagged
chapters; soft sim defects on t2t/npm. (The 4-out/4-in swap itself landed — see the sequence
note above.)

## Fix backlog (blind reader-test pass, 2026-08-19)

**All cleared 2026-08-20.** Ch.01/04 applied 2026-08-19; ch.02 (fifth beat restored as "2021 —
this feature is not used", full-dig aphorism corrected to "default is off", Goers/Kozak named),
ch.03 (mailmap/indifference reframe both forms + R6 no-.mailmap receipt, verbatim shortlog open
in reader, annoyance line cut), ch.06 reader (Bitcoin paragraph rebuilt on twin roots + sirius-m),
ch.07 reader (mailbox-vs-serving-hatch physical beat) applied 2026-08-20.

---TEMPLATE---
# Chapter beats (not sections)

A chapter is 2,200–3,200 words of body. It hits these beats in whatever order the story wants;
the ONLY rule is that no two consecutive chapters open on the same kind of object.

- **COLD OPEN** — drop the reader into one concrete moment: a diff hunk, a clock, a name, an
  absence. Not "This is the story of…". Ideally the thing that will turn out to matter, shown
  before we know it matters.
- **THE ROOM** — reconstruct what the actor knew and wanted right then. Their tools, their
  ticket, their Tuesday. This is where "no sneering" lives.
- **THE TURN** — the reveal. The reader should feel it a sentence before it is named. Put the
  receipt (hash + command) at the turn, inline, small.
- **THE BLAST RADIUS** — what it cost and for how long, told concretely (who, how many, how
  long it stayed dark).
- **AT HOME** — the command the reader should run on their own repo, woven into the closing,
  never a boxed sidebar. The habit is the takeaway.

Receipts: prose may quote only what appears in `chapters/NN-x.receipts.md`. Reference receipts
by their R-number in a trailing `## Receipts` list (R1, R4, …) with the one-line locator.

Word count method (body only, excludes the Receipts list):
`awk '/^## Receipts/{exit} {print}' chapters/NN-x.md | wc -w`

---FABLE 1---
# Making numbers look nice

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [Making numbers look nice](19-openttd.html).*

Here is an entire contribution to a twenty-year-old open-source project, complete. One cell of
one table. Ten becomes eleven characters wide, if you count generously:

```console
$ git -C repos/openttd show --format='' --no-ext-diff 7e22f243ed3b324df3da9dba5594c14b4e6794a0 -- src/town_cmd.cpp
 	static const uint16 _grow_count_values[2][6] = {
 		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
-		{ 320, 420, 300, 220, 160, 100 }  // Normal values
+		{ 420, 420, 300, 220, 160, 100 }  // Normal values
 	};
```

[R5] The commit title is `Fix: typo in town growth rates (#7837)`. The date is November 18th,
2019. And the author field — I promise I am not making this up — reads `Yourself
<kyle.smith314@gmail.com>` [R4]. Git records whatever name you configured, and this contributor's
machine was configured, presumably years earlier and long forgotten, to attribute their work to
*Yourself*. Ask the project's entire history how many commits that identity ever made and the
answer is exactly one [R4]. This one. A drive-by fix from a stranger the ledger can only call
*you*.

Two days later it was reverted, and the revert message is one of my favorite pieces of writing in
any repository — a project constitution, stated in two sentences, over a one-cell diff. We will
get there. But first you need to see what *Yourself* saw, because the fix is the most honest kind
of wrong there is. I would have typed it too.

## The table

OpenTTD is an open-source recreation of a beloved 1990s business-simulation game about building
transport empires. <!-- CHECK: OpenTTD is an open-source reimplementation of Transport Tycoon
Deluxe (Chris Sawyer, 1995); needs external source for the game name/year. --> Towns in the game
grow, and the code that decides how fast lives in a file called `town_cmd.cpp`, in a small table
that arrived in April 2007, in a commit by a developer named maedhros [R2]:

```console
$ git -C repos/openttd show --format='' --no-ext-diff 61fe35688046b7ef36305ebd92b79bfcc535783f -- src/town_cmd.cpp | sed -n '44,51p'
+	/** Towns are processed every TOWN_GROWTH_FREQUENCY ticks, and this is the
+	 * number of times towns are processed before a new building is built. */
+	static const uint16 _grow_count_values[2][6] = {
+		{ 120, 120, 120, 100,  80,  60 }, ///< Fund new buildings has been activated
+		{ 320, 420, 300, 220, 160, 100 }  ///< Normal values
+	};
```

[R3] Read the comment above the table, because it is the key that decodes everything: the numbers
are *how many processing rounds pass before a town gains a building*. A countdown. Which means
smaller is faster. And the columns are indexed by how many transport stations are actively
serving the town — column zero for a town nobody serves, column one for a town with one active
station, and so on [R3, R10].

Now read the second row the way a fresh pair of eyes would, in 2019. A town with *no* service:
320. A town with *one* station: 420. Then 300, 220, 160, 100 — falling, falling, falling, the way
you would expect: the better you serve a town, the faster it grows. Every column obeys that logic
except the first pair. According to this table, connecting your very first station to a town makes
it grow *slower* than if you had left it alone.

That is not a judgment call. That is a *shape*. Any programmer who has ever scanned a lookup
table knows the feeling: five values marching in one direction and one value out of line, like a
fence with a leaning post. The eye snags on it. The diagnosis writes itself — someone transposed
digits, 320 for 420, a typo fossilized since 2007 — and the fix is one keystroke. So on a Monday
in November 2019, a stranger with a fresh eye did the public-spirited thing: filed the fix,
titled it a typo fix, and a project maintainer — Ingo von Borstel, whose name sits in the
committer field — agreed with the diagnosis and merged it the same day [R4].

Everything about that transaction is healthy. An outsider read the code closely enough to spot an
anomaly. A maintainer reviewed a plausible correction and accepted it. If your project's ledger
is full of tiny commits like #7837, you are doing something right. Hold on to that, because this
chapter is not about a fool and I will not let it become that. It is about the one question
nobody asked, and the two days it took for someone to arrive who didn't need to ask it.

## The revert

November 20th, 2019, one o'clock in the morning, a developer named frosch — at that point more
than a decade into working on this codebase [R6]:

```console
$ git -C repos/openttd show -s --format='%B' 61dba850af737cd49d1bb344dafd7a91a18895bf
Revert #7837, 7e22f243e: OpenTTD tries to replicate the original game mechanics.
Making numbers look nice and correlate is no goal, and in this case they actually did not correlate.
```

[R6] Sit with the first sentence, because it is a constitution. *OpenTTD tries to replicate the
original game mechanics.* This project is a recreation of a specific 1990s game, and that
sentence declares what that means as an engineering discipline: the specification is not
elegance, not intuition, not what a table *ought* to look like. The specification is what the
original game actually did. maedhros had said as much back in 2007, in the very commit that
introduced the table — the default growth rate, his message says, is "TTD's original rate" [R2].
The ugly row is not a draft to be polished. It is a *measurement*. You do not fix a measurement
because it looks lopsided; the lopsidedness is the data.

And then the second sentence, which is the part I keep coming back to: *making numbers look nice
and correlate is no goal — and in this case they actually did not correlate.* Read that
carefully. He is saying the typo-diagnosis was wrong twice over. Wrong in principle, because even
a genuinely lopsided table would be sacred if the original game's table was lopsided. And wrong
in fact — because the 320 and the 420 were never comparable numbers in the first place.

## The hidden clause

Here is what the fresh eye could not see, and it was sitting in the 2007 commit all along. Look
back at the original hunk, a few lines below the table [R3]:

```console
$ git -C repos/openttd show --format='' --no-ext-diff 61fe35688046b7ef36305ebd92b79bfcc535783f -- src/town_cmd.cpp | sed -n '69,70p'
+		m = _grow_count_values[1][min(n, 5)];
+		if (n == 0 && !CHANCE16(1, 12)) return;
```

That second line is a toll gate, and it applies to exactly one column: the unserviced town.
`CHANCE16(1, 12)` is the game's coin-flip helper — pass roughly one time in twelve — so a town
with no stations doesn't just count down from 320. It counts down from 320 *and then, eleven
times out of twelve, is sent home without progress*. The zero-station town's real growth rate is
not 320. It is 320 dragged through a twelvefold penalty — slower, by a wide margin, than the
one-station town's honest 420. The table was never out of order. Its first column is simply
quoted in a different currency, and the exchange rate lives thirty lines away.

That is what frosch meant by *they actually did not correlate*. The two numbers a tidy-minded
reader wants to compare are not on the same axis. A value's meaning does not live in the value.
It lives in the code that consumes it — and the consumer is never printed in the diff where the
value looks wrong.

By 2019 the penalty had migrated to a different function in the file, even further from the
table than in 2007, which is why a close reader of the table alone had no chance. The
information needed to *not* make this mistake existed, but it lived somewhere the mistake would
never take you.

## The five-line monument

So frosch reverted the cell. But look at what the revert actually shipped, because this is the
move that elevates the whole episode. Diff the tree from just before the stranger's fix against
the tree just after the revert — the net effect of the entire affair, typo report and merge and
revert together [R8]:

```console
$ git -C repos/openttd diff --no-ext-diff 7e22f243ed3b324df3da9dba5594c14b4e6794a0^ 61dba850af737cd49d1bb344dafd7a91a18895bf -- src/town_cmd.cpp
+	/**
+	 * Note:
+	 * Unserviced+unfunded towns get an additional malus in UpdateTownGrowth(),
+	 * so the "320" is actually not better than the "420".
+	 */
 	static const uint16 _grow_count_values[2][6] = {
 		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
 		{ 320, 420, 300, 220, 160, 100 }  // Normal values
```

Five lines of comment. That is everything the episode left behind. The code went back to exactly
what it was; the *knowledge* did not. frosch took the fact that had lived thirty lines away —
the fact whose distance from the table caused the whole affair — and moved a copy of it to the
one place the next tidy-minded stranger is guaranteed to be looking: directly above the number
that looks wrong. He didn't just undo the mistake. He patched the *conditions* that produced the
mistake. The comment names the trap ("an additional malus"), names where the trap lives
(`UpdateTownGrowth()`), and states the conclusion outright, in quotation marks, like a proverb:
*the "320" is actually not better than the "420".*

There is a genre of comment that only a revert can write. Ordinary comments explain what the
author was thinking. This kind explains what *someone else* was thinking when they got it wrong —
it is documentation with a failure mode already attached, the code's own antibodies. You cannot
write it in advance, because you cannot know in advance which of your correct lines looks
incorrect. You find out the day somebody fixes one.

## Still standing

The episode cost the project almost nothing — the wrong value sat on the main branch for
two days, in a video game's town-growth table, and the record shows no further casualties. On the
scale of this book's disasters it is a rounding error. That is precisely why I am showing it to
you: this is what the *successful* version of every other chapter's story looks like, and the
ledger lets us watch each component of the defense actually work.

Watch the comment survive. In 2023, a project-wide migration modernized the codebase's integer
types — a thousand mechanical touches, the kind of pass that flattens local character out of a
file. It rewrote the table's declaration from `uint16` to `uint16_t`, brushing directly against
the monument. The five lines came through untouched [R9]. Run blame on the tip of the repository
today, August 2026, and the note and the restored row still answer to frosch, 2019, while the
lines around them have changed hands [R10]:

```console
$ git -C repos/openttd blame -l -L 3862,3869 4d4f8bff38d200fbcfda11789bd69259ebbefd17 -- src/town_cmd.cpp
61dba850af737cd49d1bb344dafd7a91a18895bf (frosch          2019-11-20 ...) 	 * so the "320" is actually not better than the "420".
...
61dba850af737cd49d1bb344dafd7a91a18895bf (frosch          2019-11-20 ...) 		{ 320, 420, 300, 220, 160, 100 }  // Normal values
```

Seven years, one type migration, and nobody has "fixed" the typo again. Either no fresh eye has
snagged on the leaning fence post since — or, more likely, fresh eyes snag on it constantly, read
the five lines, and quietly close the tab. A comment's success is measured in commits that never
happened, which is why nobody ever gets credit for one. The blame output above is as close as the
record comes to a receipt for prevented mistakes.

## At home

The habit this chapter wants to leave in your hands fires at a very specific moment: the moment
a value in someone else's code looks obviously, fixably wrong. A lopsided table. A constant that
breaks the pattern of its neighbors. Your eye snags, your diagnosis writes itself, and the fix is
one keystroke. That moment. Before you type, go find the consumer. Trace where the value is
actually *read*, because that is where its meaning lives — and check whether some `if` thirty
lines away, or one function over, quotes your ugly number in a currency you haven't seen. Run
`git log -S` with the constant and read what its authors said when it arrived; if the value was
ever "fixed" before, the revert message will tell you exactly which trap you are currently
standing in. The whole investigation costs five minutes.

And if you are ever on the other side — the one doing the reverting — steal frosch's move whole.
Don't just put the right value back. Write down, at the exact coordinates where the next person's
eye will snag, why the wrong-looking thing is right. State your project's creed in the commit
message if you have one; two sentences will do. Then let the ledger do what ledgers do. Somewhere
in a repository you maintain, there is a correct line that looks like a typo, and its comment
hasn't been written yet. The stranger who will someday fix it — carefully, publicly, with the
best of intentions, under a name like *Yourself* — is the reader you are writing for.

## Receipts

- **R1** `git -C repos/openttd log --reverse -S '{ 320, 420, 300' --format=... -- src/town_cmd.cpp` — the complete lineage of the table: three commits ever touched that row — 2007 arrival, 2019 "typo" fix, 2019 revert.
- **R2** `git -C repos/openttd show -s --format=... 61fe35688046b7ef36305ebd92b79bfcc535783f` — maedhros, 2007-04-12: town growth control added; "The default rate is TTD's original rate."
- **R3** `git -C repos/openttd show ... 61fe356880... -- src/town_cmd.cpp | sed -n '28,59p'` — the original hunk: the table with its countdown comment, and `if (n == 0 && !CHANCE16(1, 12)) return;` — the one-in-twelve gate on the unserviced column.
- **R4** `git -C repos/openttd log --author='kyle\.smith314@gmail\.com' ...` + `rev-list --count` — `Yourself <kyle.smith314@gmail.com>`, authored 2019-11-18, committed same day by Ingo von Borstel; the identity's only commit in the history.
- **R5** `git -C repos/openttd show ... 7e22f243ed3b... -- src/town_cmd.cpp` — the fix itself: one cell, `320` → `420`, titled "Fix: typo in town growth rates (#7837)".
- **R6** `git -C repos/openttd show -s --format=... 61dba850af73...` — frosch, 2019-11-20T01:00: "OpenTTD tries to replicate the original game mechanics. Making numbers look nice and correlate is no goal, and in this case they actually did not correlate."
- **R7** `git -C repos/openttd show ... 61dba850af73... -- src/town_cmd.cpp` — the revert restores `320` and adds the five-line note naming the malus in `UpdateTownGrowth()`.
- **R8** `git -C repos/openttd diff 7e22f243ed3b...^ 61dba850af73... -- src/town_cmd.cpp` — pre-fix tree vs post-revert tree: the net effect of the entire episode is the comment alone.
- **R9** `git -C repos/openttd show eaae0bb5e717... -- src/town_cmd.cpp` — 2023 integer-type migration (`uint16` → `uint16_t`) touches the declaration; values and note unchanged.
- **R10** `git -C repos/openttd blame -l -L 3862,3869 4d4f8bff38d2... -- src/town_cmd.cpp` — at the 2026 tip, the note and the restored row still blame to frosch's revert.

---RECEIPTS 1---
# Receipts — ch. 19 OpenTTD (the `320` creed-revert)

Verbatim outputs against a full clone of OpenTTD/OpenTTD.
Regenerate with `scripts/receipts-19.sh`. Outputs are pinned to explicit commits; long outputs are truncated editorially with `sed` or `head`.

## R1 — the complete lineage of the asymmetric town-growth table
```
$ git -C repos/openttd log --reverse -S '{ 320, 420, 300' --format='%H%n%aI %an <%ae>%n%s' 4d4f8bff38d200fbcfda11789bd69259ebbefd17 -- src/town_cmd.cpp
61fe35688046b7ef36305ebd92b79bfcc535783f
2007-04-12T17:24:34+00:00 maedhros <maedhros@openttd.org>
(svn r9613) -Feature: Make it possible to have some control over the town growth. The default rate is TTD's original rate, and to approximate OpenTTD's previous behaviour the rate should be set to "Fast" or "Very Fast". Town growth can be switched off entirely, and if so, buildings will not be rebuilt. It is also possible to specify a proportion of towns that grow twice as fast as the others.
7e22f243ed3b324df3da9dba5594c14b4e6794a0
2019-11-18T07:20:47-08:00 Yourself <kyle.smith314@gmail.com>
Fix: typo in town growth rates (#7837)
61dba850af737cd49d1bb344dafd7a91a18895bf
2019-11-20T01:00:07+01:00 frosch <frosch@openttd.org>
Revert #7837, 7e22f243e: OpenTTD tries to replicate the original game mechanics. Making numbers look nice and correlate is no goal, and in this case they actually did not correlate.
```

## R2 — 2007: maedhros labels the default as TTD's original rate
```
$ git -C repos/openttd show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' 61fe35688046b7ef36305ebd92b79bfcc535783f
61fe35688046b7ef36305ebd92b79bfcc535783f
Author: 2007-04-12T17:24:34+00:00 maedhros <maedhros@openttd.org>
Committer: 2007-04-12T17:24:34+00:00 maedhros <maedhros@openttd.org>

(svn r9613) -Feature: Make it possible to have some control over the town growth. The
default rate is TTD's original rate, and to approximate OpenTTD's previous
behaviour the rate should be set to "Fast" or "Very Fast". Town growth can be
switched off entirely, and if so, buildings will not be rebuilt. It is also
possible to specify a proportion of towns that grow twice as fast as the
others.


```

## R3 — the original hunk: `320` arrives beside the one-in-twelve malus
```
$ git -C repos/openttd show --format='' --no-ext-diff 61fe35688046b7ef36305ebd92b79bfcc535783f -- src/town_cmd.cpp | sed -n '28,59p'
@@ -1687,22 +1687,21 @@ static void UpdateTownGrowRate(Town *t)
 	}
 
 	CLRBIT(t->flags12, TOWN_IS_FUNDED);
+	if (_patches.town_growth_rate == 0) return;
+
+	/** Towns are processed every TOWN_GROWTH_FREQUENCY ticks, and this is the
+	 * number of times towns are processed before a new building is built. */
+	static const uint16 _grow_count_values[2][6] = {
+		{ 120, 120, 120, 100,  80,  60 }, ///< Fund new buildings has been activated
+		{ 320, 420, 300, 220, 160, 100 }  ///< Normal values
+	};
 
 	if (t->fund_buildings_months != 0) {
-		static const byte _grow_count_values[6] = {
-			60, 60, 60, 50, 40, 30
-		};
-		m = _grow_count_values[min(n, 5)];
+		m = _grow_count_values[0][min(n, 5)];
 		t->fund_buildings_months--;
-	} else if (n == 0) {
-		m = 160;
-		if (!CHANCE16(1, 12))
-			return;
 	} else {
-		static const byte _grow_count_values[5] = {
-			210, 150, 110, 80, 50
-		};
-		m = _grow_count_values[min(n, 5) - 1];
+		m = _grow_count_values[1][min(n, 5)];
+		if (n == 0 && !CHANCE16(1, 12)) return;
 	}
```

## R4 — 2019: the clone records one commit by the author identity `Yourself`
```
$ git -C repos/openttd log 4d4f8bff38d200fbcfda11789bd69259ebbefd17 --author='kyle\.smith314@gmail\.com' --reverse --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%s'
7e22f243ed3b324df3da9dba5594c14b4e6794a0
Author: 2019-11-18T07:20:47-08:00 Yourself <kyle.smith314@gmail.com>
Committer: 2019-11-18T16:20:47+01:00 Ingo von Borstel <planetmaker@openttd.org>
Fix: typo in town growth rates (#7837)
```

```
$ git -C repos/openttd rev-list 4d4f8bff38d200fbcfda11789bd69259ebbefd17 --count --author='kyle\.smith314@gmail\.com'
1
```

## R5 — the proposed fix: one cell, from `320` to `420`
```
$ git -C repos/openttd show --format='' --no-ext-diff 7e22f243ed3b324df3da9dba5594c14b4e6794a0 -- src/town_cmd.cpp
diff --git a/src/town_cmd.cpp b/src/town_cmd.cpp
index 8071f43f39..b982ca5621 100644
--- a/src/town_cmd.cpp
+++ b/src/town_cmd.cpp
@@ -3362,7 +3362,7 @@ static uint GetNormalGrowthRate(Town *t)
 {
 	static const uint16 _grow_count_values[2][6] = {
 		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
-		{ 320, 420, 300, 220, 160, 100 }  // Normal values
+		{ 420, 420, 300, 220, 160, 100 }  // Normal values
 	};
 
 	int n = CountActiveStations(t);
```

## R6 — 2019-11-20: frosch states the replication creed and the non-correlation reason
```
$ git -C repos/openttd show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' 61dba850af737cd49d1bb344dafd7a91a18895bf
61dba850af737cd49d1bb344dafd7a91a18895bf
Author: 2019-11-20T01:00:07+01:00 frosch <frosch@openttd.org>
Committer: 2019-11-20T08:01:37+00:00 Charles Pigott <charlespigott@googlemail.com>

Revert #7837, 7e22f243e: OpenTTD tries to replicate the original game mechanics.
Making numbers look nice and correlate is no goal, and in this case they actually did not correlate.

```

## R7 — the revert restores `320` and writes the hidden rule beside it
```
$ git -C repos/openttd show --format='' --no-ext-diff 61dba850af737cd49d1bb344dafd7a91a18895bf -- src/town_cmd.cpp
diff --git a/src/town_cmd.cpp b/src/town_cmd.cpp
index b982ca5621..139e0217d8 100644
--- a/src/town_cmd.cpp
+++ b/src/town_cmd.cpp
@@ -3360,9 +3360,14 @@ static int CountActiveStations(Town *t)
  */
 static uint GetNormalGrowthRate(Town *t)
 {
+	/**
+	 * Note:
+	 * Unserviced+unfunded towns get an additional malus in UpdateTownGrowth(),
+	 * so the "320" is actually not better than the "420".
+	 */
 	static const uint16 _grow_count_values[2][6] = {
 		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
-		{ 420, 420, 300, 220, 160, 100 }  // Normal values
+		{ 320, 420, 300, 220, 160, 100 }  // Normal values
 	};
 
 	int n = CountActiveStations(t);
```

## R8 — immediate aftermath: against the pre-fix tree, only the explanation remains
```
$ git -C repos/openttd diff --no-ext-diff 7e22f243ed3b324df3da9dba5594c14b4e6794a0^ 61dba850af737cd49d1bb344dafd7a91a18895bf -- src/town_cmd.cpp
diff --git a/src/town_cmd.cpp b/src/town_cmd.cpp
index 8071f43f39..139e0217d8 100644
--- a/src/town_cmd.cpp
+++ b/src/town_cmd.cpp
@@ -3360,6 +3360,11 @@ static int CountActiveStations(Town *t)
  */
 static uint GetNormalGrowthRate(Town *t)
 {
+	/**
+	 * Note:
+	 * Unserviced+unfunded towns get an additional malus in UpdateTownGrowth(),
+	 * so the "320" is actually not better than the "420".
+	 */
 	static const uint16 _grow_count_values[2][6] = {
 		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
 		{ 320, 420, 300, 220, 160, 100 }  // Normal values
```

## R9 — 2023: a mechanical integer-type migration changes the table's type, not its values or note
```
$ git -C repos/openttd show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%s' eaae0bb5e71b237cc1fe1388ab74e6bd3aa0c69e
eaae0bb5e71b237cc1fe1388ab74e6bd3aa0c69e
Author: 2023-05-08T19:01:06+02:00 Rubidium <rubidium@openttd.org>
Committer: 2023-07-19T19:30:14+02:00 rubidium42 <rubidium42@users.noreply.github.com>

Codechange: automatic adding of _t to (u)int types, and WChar to char32_t
```

```
$ git -C repos/openttd show --format='' --no-ext-diff eaae0bb5e71b237cc1fe1388ab74e6bd3aa0c69e -- src/town_cmd.cpp | sed -n '326,340p'
@@ -3479,13 +3479,13 @@ static uint GetNormalGrowthRate(Town *t)
 	 * Unserviced+unfunded towns get an additional malus in UpdateTownGrowth(),
 	 * so the "320" is actually not better than the "420".
 	 */
-	static const uint16 _grow_count_values[2][6] = {
+	static const uint16_t _grow_count_values[2][6] = {
 		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
 		{ 320, 420, 300, 220, 160, 100 }  // Normal values
 	};
 
 	int n = CountActiveStations(t);
-	uint16 m = _grow_count_values[t->fund_buildings_months != 0 ? 0 : 1][std::min(n, 5)];
+	uint16_t m = _grow_count_values[t->fund_buildings_months != 0 ? 0 : 1][std::min(n, 5)];
 
 	uint growth_multiplier = _settings_game.economy.town_growth_rate != 0 ? _settings_game.economy.town_growth_rate - 1 : 1;
```

## R10 — at the audited 2026 tip, the explanation and `320` still belong to the revert
```
$ git -C repos/openttd show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%s' 4d4f8bff38d200fbcfda11789bd69259ebbefd17
4d4f8bff38d200fbcfda11789bd69259ebbefd17
Author: 2026-08-17T23:36:20+01:00 Peter Nelson <peter1138@openttd.org>
Committer: 2026-08-18T21:13:28+01:00 Peter Nelson <peter@fuzzle.org>
Codechange: [NewGRF] Remove unneeded check for valid mapped entity IDs
```

```
$ git -C repos/openttd show 4d4f8bff38d200fbcfda11789bd69259ebbefd17:src/town_cmd.cpp | sed -n '3860,3875p'
static uint GetNormalGrowthRate(Town *t)
{
	/**
	 * Note:
	 * Unserviced+unfunded towns get an additional malus in UpdateTownGrowth(),
	 * so the "320" is actually not better than the "420".
	 */
	static const uint16_t _grow_count_values[2][6] = {
		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
		{ 320, 420, 300, 220, 160, 100 }  // Normal values
	};

	int n = CountActiveStations(t);
	uint16_t m = _grow_count_values[t->fund_buildings_months != 0 ? 0 : 1][std::min(n, 5)];

	uint growth_multiplier = _settings_game.economy.town_growth_rate != 0 ? _settings_game.economy.town_growth_rate - 1 : 1;
```

```
$ git -C repos/openttd blame -l --date=iso-strict -L 3862,3869 4d4f8bff38d200fbcfda11789bd69259ebbefd17 -- src/town_cmd.cpp
61dba850af737cd49d1bb344dafd7a91a18895bf (frosch          2019-11-20T01:00:07+01:00 3862) 	/**
61dba850af737cd49d1bb344dafd7a91a18895bf (frosch          2019-11-20T01:00:07+01:00 3863) 	 * Note:
61dba850af737cd49d1bb344dafd7a91a18895bf (frosch          2019-11-20T01:00:07+01:00 3864) 	 * Unserviced+unfunded towns get an additional malus in UpdateTownGrowth(),
61dba850af737cd49d1bb344dafd7a91a18895bf (frosch          2019-11-20T01:00:07+01:00 3865) 	 * so the "320" is actually not better than the "420".
61dba850af737cd49d1bb344dafd7a91a18895bf (frosch          2019-11-20T01:00:07+01:00 3866) 	 */
eaae0bb5e71b237cc1fe1388ab74e6bd3aa0c69e (Rubidium        2023-05-08T19:01:06+02:00 3867) 	static const uint16_t _grow_count_values[2][6] = {
9fc32126790e6e8a558c95f403cde759a5c2cd8b (Pavel Stupnikov 2018-06-24T21:55:48+03:00 3868) 		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
61dba850af737cd49d1bb344dafd7a91a18895bf (frosch          2019-11-20T01:00:07+01:00 3869) 		{ 320, 420, 300, 220, 160, 100 }  // Normal values
```


codex
The factual gate has several live issues already: one unsupported tenure claim, an overstrong “measurement” formulation, and a location/migration claim that outruns the excerpt. I’m checking the Postgres chapter now so the distinctness verdict is based on its actual register, not the supplied summary.
exec
/bin/bash -lc "rg --files chapters | sort | rg '("'^|/)(05-|15-)|postgres'"' && printf '\\n---NUMBERED HEADINGS---\\n' && for f in chapters/*postgres*.md; do echo \""'$f"; rg -n '"'"'^#|restraint|hack|comment|revert|wrong|right|load-bearing|blame|At home|## Receipts'"' \""'$f" | head -100; done && printf '"'\\n---FABLE NUMBERED---\\n' && nl -ba chapters/19-openttd.fable.md | sed -n '1,260p' && printf '\\n---COUNTS/CHECKS---\\n' && awk '/"'^## Receipts/{exit} {print}'"' chapters/19-openttd.fable.md | wc -w && rg -n '<"'!-- CHECK:|<!-- VERIFIED:'"' chapters/19-openttd.fable.md" in /home/diablo/book16
 succeeded in 199ms:
chapters/05-agy-review.md
chapters/05-agy-review.stdout.md
chapters/05-codex-review.md
chapters/05-git.fable.md
chapters/05-git.full.html
chapters/05-git.html
chapters/05-git.md
chapters/05-git.reader.md
chapters/05-git.receipts.md
chapters/05-grok-review.md
chapters/05-review-prompt.md
chapters/15-agy-review.stdout.md
chapters/15-codex-review.md
chapters/15-grok-review.md
chapters/15-grok-review.stdout.md
chapters/15-postgres.fable.md
chapters/15-postgres.full.html
chapters/15-postgres.html
chapters/15-postgres.md
chapters/15-postgres.reader.md
chapters/15-postgres.receipts.md
chapters/15-review-prompt.md

---NUMBERED HEADINGS---
chapters/15-postgres.fable.md
1:# THIS IS A HACK TO GET V4 OUT THE DOOR
18:is wrong, replace it*. The estimate is older than this repository, which was imported in 1996
32:having no time to compute the right one, typing `0.3333333` and then shouting into the comment,
33:in capitals, that this was a hack and someone should really do it properly before it mattered.
37:## 2015: the fix he doesn't make
43:words, built the beginnings of the very thing the 1992 comment cried out for — a true
44:selectivity function — for the cases he can prove. The bare `0.3333333` fallback, sitting right
46:routes through a number a Berkeley grad student admitted was a hack. Delete it, pick something
47:defensible — 0.5, say — and finish the job the comment has been begging to have finished for
63:wrong, and it is also the thing an entire ecosystem has quietly grown to fit.
65:~ A number that has been wrong for long enough is not a mistake. It is a contract.
67:## 2023: the feature he won't ship
71:easy. It is a trap, and rather than build it wrong or wait for someone else to, Tom Lane landed
105:## 2025: the fix he undoes
107:Now the decision that turns restraint into law. Ten years after 2015, a well-meaning refactor had
112:$ git -C repos/postgres blame -L 1606,1612 HEAD -- src/backend/utils/adt/selfuncs.c
120:[R4] Read the 1992 comment and this one together, because between them the instruction has
125:called a hack in 1992, and left a warning for whoever next feels the urge to be clever about it.
126:On HEAD today the estimate is still one third [R5], now defended not despite its wrongness but
127:because of how long the wrongness has held.
129:## The hand
143:enormous body of work is not what he added but what he judged safe to leave alone. The 1992 hack
146:trustworthy is the commit that adds a warning where a feature was demanded, or restores a wrong
149:## At home
153:attempt*. Pickaxe the ugly constant — `git log -S` — or `git blame` the embarrassing comment, and
156:become load-bearing in ways the diff can't show. The tell is a *second* comment layered over the
161:## Receipts
166:- **R4** `git -C repos/postgres blame -L 1606,1612 HEAD -- src/backend/utils/adt/selfuncs.c` — 2025-09-20, Tom Lane restores the estimate: "unprincipled choice, but Postgres has been using that estimate … since 1992. The hoariness of this behavior suggests that we should not be in too much hurry to use another value."
chapters/15-postgres.md
1:# THIS IS A HACK TO GET V4 OUT THE DOOR
21:is wrong, replace it*. The estimate is older than this repository, which was imported in 1996
35:having no time to compute the right one, typing `0.3333333` and then shouting into the comment,
36:in capitals, that this was a hack and someone should really do it properly before it mattered.
40:## 2015: the fix he doesn't make
46:words, built the beginnings of the very thing the 1992 comment cried out for — a true
47:selectivity function — for the cases he can prove. The bare `0.3333333` fallback, sitting right
49:routes through a number a Berkeley grad student admitted was a hack. Delete it, pick something
50:defensible — 0.5, say — and finish the job the comment has been begging to have finished for
66:wrong, and it is also the thing an entire ecosystem has quietly grown to fit.
68:~ A number that has been wrong for long enough is not a mistake. It is a contract.
70:## 2023: the feature he won't ship
74:easy. It is a trap, and rather than build it wrong or wait for someone else to, Tom Lane landed
108:## 2025: the fix he undoes
110:Now the decision that turns restraint into law. Ten years after 2015, a well-meaning refactor had
115:$ git -C repos/postgres blame -L 1606,1612 HEAD -- src/backend/utils/adt/selfuncs.c
123:[R4] Read the 1992 comment and this one together, because between them the instruction has
128:called a hack in 1992, and left a warning for whoever next feels the urge to be clever about it.
129:On HEAD today the estimate is still one third [R5], now defended not despite its wrongness but
130:because of how long the wrongness has held.
132:## The hand
146:enormous body of work is not what he added but what he judged safe to leave alone. The 1992 hack
149:trustworthy is the commit that adds a warning where a feature was demanded, or restores a wrong
152:## At home
156:attempt*. Pickaxe the ugly constant — `git log -S` — or `git blame` the embarrassing comment, and
159:become load-bearing in ways the diff can't show. The tell is a *second* comment layered over the
164:## Receipts
169:- **R4** `git -C repos/postgres blame -L 1606,1612 HEAD -- src/backend/utils/adt/selfuncs.c` — 2025-09-20, Tom Lane restores the estimate: "unprincipled choice, but Postgres has been using that estimate … since 1992. The hoariness of this behavior suggests that we should not be in too much hurry to use another value."
chapters/15-postgres.reader.md
1:# THIS IS A HACK TO GET V4 OUT THE DOOR
22:So he types `0.3333333`, shouts into the comment that this is a hack and somebody should really
23:do it properly, and ships. This is the story of what happened to that hack over the next
24:thirty-three years — three decisions across ten years, all about a hack already decades old —
25:and the surprising truth that the right move, every time, was to leave it alone.
27:## 2015: the fix he doesn't make
36:Which means the old placeholder is right there, and the perfect moment to finally delete it has
44:Read that carefully, because it isn't laziness — it's the opposite. The number is wrong. But it
45:has been wrong, *in exactly the same way,* for twenty-three years. Which means every database
47:specific wrong number. Change it, and you'd instantly re-plan millions of live queries — some
48:faster, some catastrophically slower — with no way to know in advance which. A wrong answer that
52:## 2023: the feature he won't build
69:planted right at the door.
71:## 2025: the fix he undoes
75:sensible grounds that the database had better tools now. Tom Lane put it back. And the comment he
83:said: *this is a hack, replace it.* This one admits the choice is unprincipled — and then argues
85:not fix me.* He restored a number a graduate student called a hack, and left a warning for the
88:## The hand
96:what *not* to disturb. The 1992 hack he guards. The enum feature he refuses to build and
99:where a feature was demanded, or that puts a wrong number back on purpose and explains why you
102:## At home
105:an ugly constant or an embarrassing `HACK` comment in code you've inherited, before you fix it,
109:thing in an old codebase is frequently not its elegant machinery but its load-bearing hacks: the
110:ugly bits that have been wrong for so long that everything else has quietly grown to depend on
111:them. The tell is a second comment stacked on the first — not "fix this," but "here is why fixing
117:*The 1992 hack comment, the 0.3333333 guess, Tom Lane's 2015 refusal and 2025 restoration, the
chapters/15-postgres.receipts.md
1:# Receipts — ch. 15 postgres (the refusals of Tom Lane)
6:## R1 — day one, 1996: the magic number and the XXX that promised to replace it
15:## R2 — the confession the estimate came wrapped in, dated in the source itself
24:## R3 — 2015: Tom Lane has a better estimator, and declines to use it
37:## R4 — 2025: a later patch dropped the estimate; Tom puts it back and warns the next person
45:$ git -C repos/postgres blame -L 1606,1612 HEAD -- src/backend/utils/adt/selfuncs.c
55:## R5 — the estimate is still on HEAD, thirty-three years on
61:## R6 — 2023: the feature Tom would not write, landed as a warning
74:## R7 — the diff: a grammar rule whose only job is to refuse, and list why
91:## R8 — the scale of the hand: first commit, count, and it is not a feature

---FABLE NUMBERED---
     1	# Making numbers look nice
     2	
     3	*This is the full dig — every command, every receipt. The plain-English telling of the same story
     4	is here: [Making numbers look nice](19-openttd.html).*
     5	
     6	Here is an entire contribution to a twenty-year-old open-source project, complete. One cell of
     7	one table. Ten becomes eleven characters wide, if you count generously:
     8	
     9	```console
    10	$ git -C repos/openttd show --format='' --no-ext-diff 7e22f243ed3b324df3da9dba5594c14b4e6794a0 -- src/town_cmd.cpp
    11	 	static const uint16 _grow_count_values[2][6] = {
    12	 		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
    13	-		{ 320, 420, 300, 220, 160, 100 }  // Normal values
    14	+		{ 420, 420, 300, 220, 160, 100 }  // Normal values
    15	 	};
    16	```
    17	
    18	[R5] The commit title is `Fix: typo in town growth rates (#7837)`. The date is November 18th,
    19	2019. And the author field — I promise I am not making this up — reads `Yourself
    20	<kyle.smith314@gmail.com>` [R4]. Git records whatever name you configured, and this contributor's
    21	machine was configured, presumably years earlier and long forgotten, to attribute their work to
    22	*Yourself*. Ask the project's entire history how many commits that identity ever made and the
    23	answer is exactly one [R4]. This one. A drive-by fix from a stranger the ledger can only call
    24	*you*.
    25	
    26	Two days later it was reverted, and the revert message is one of my favorite pieces of writing in
    27	any repository — a project constitution, stated in two sentences, over a one-cell diff. We will
    28	get there. But first you need to see what *Yourself* saw, because the fix is the most honest kind
    29	of wrong there is. I would have typed it too.
    30	
    31	## The table
    32	
    33	OpenTTD is an open-source recreation of a beloved 1990s business-simulation game about building
    34	transport empires. <!-- CHECK: OpenTTD is an open-source reimplementation of Transport Tycoon
    35	Deluxe (Chris Sawyer, 1995); needs external source for the game name/year. --> Towns in the game
    36	grow, and the code that decides how fast lives in a file called `town_cmd.cpp`, in a small table
    37	that arrived in April 2007, in a commit by a developer named maedhros [R2]:
    38	
    39	```console
    40	$ git -C repos/openttd show --format='' --no-ext-diff 61fe35688046b7ef36305ebd92b79bfcc535783f -- src/town_cmd.cpp | sed -n '44,51p'
    41	+	/** Towns are processed every TOWN_GROWTH_FREQUENCY ticks, and this is the
    42	+	 * number of times towns are processed before a new building is built. */
    43	+	static const uint16 _grow_count_values[2][6] = {
    44	+		{ 120, 120, 120, 100,  80,  60 }, ///< Fund new buildings has been activated
    45	+		{ 320, 420, 300, 220, 160, 100 }  ///< Normal values
    46	+	};
    47	```
    48	
    49	[R3] Read the comment above the table, because it is the key that decodes everything: the numbers
    50	are *how many processing rounds pass before a town gains a building*. A countdown. Which means
    51	smaller is faster. And the columns are indexed by how many transport stations are actively
    52	serving the town — column zero for a town nobody serves, column one for a town with one active
    53	station, and so on [R3, R10].
    54	
    55	Now read the second row the way a fresh pair of eyes would, in 2019. A town with *no* service:
    56	320. A town with *one* station: 420. Then 300, 220, 160, 100 — falling, falling, falling, the way
    57	you would expect: the better you serve a town, the faster it grows. Every column obeys that logic
    58	except the first pair. According to this table, connecting your very first station to a town makes
    59	it grow *slower* than if you had left it alone.
    60	
    61	That is not a judgment call. That is a *shape*. Any programmer who has ever scanned a lookup
    62	table knows the feeling: five values marching in one direction and one value out of line, like a
    63	fence with a leaning post. The eye snags on it. The diagnosis writes itself — someone transposed
    64	digits, 320 for 420, a typo fossilized since 2007 — and the fix is one keystroke. So on a Monday
    65	in November 2019, a stranger with a fresh eye did the public-spirited thing: filed the fix,
    66	titled it a typo fix, and a project maintainer — Ingo von Borstel, whose name sits in the
    67	committer field — agreed with the diagnosis and merged it the same day [R4].
    68	
    69	Everything about that transaction is healthy. An outsider read the code closely enough to spot an
    70	anomaly. A maintainer reviewed a plausible correction and accepted it. If your project's ledger
    71	is full of tiny commits like #7837, you are doing something right. Hold on to that, because this
    72	chapter is not about a fool and I will not let it become that. It is about the one question
    73	nobody asked, and the two days it took for someone to arrive who didn't need to ask it.
    74	
    75	## The revert
    76	
    77	November 20th, 2019, one o'clock in the morning, a developer named frosch — at that point more
    78	than a decade into working on this codebase [R6]:
    79	
    80	```console
    81	$ git -C repos/openttd show -s --format='%B' 61dba850af737cd49d1bb344dafd7a91a18895bf
    82	Revert #7837, 7e22f243e: OpenTTD tries to replicate the original game mechanics.
    83	Making numbers look nice and correlate is no goal, and in this case they actually did not correlate.
    84	```
    85	
    86	[R6] Sit with the first sentence, because it is a constitution. *OpenTTD tries to replicate the
    87	original game mechanics.* This project is a recreation of a specific 1990s game, and that
    88	sentence declares what that means as an engineering discipline: the specification is not
    89	elegance, not intuition, not what a table *ought* to look like. The specification is what the
    90	original game actually did. maedhros had said as much back in 2007, in the very commit that
    91	introduced the table — the default growth rate, his message says, is "TTD's original rate" [R2].
    92	The ugly row is not a draft to be polished. It is a *measurement*. You do not fix a measurement
    93	because it looks lopsided; the lopsidedness is the data.
    94	
    95	And then the second sentence, which is the part I keep coming back to: *making numbers look nice
    96	and correlate is no goal — and in this case they actually did not correlate.* Read that
    97	carefully. He is saying the typo-diagnosis was wrong twice over. Wrong in principle, because even
    98	a genuinely lopsided table would be sacred if the original game's table was lopsided. And wrong
    99	in fact — because the 320 and the 420 were never comparable numbers in the first place.
   100	
   101	## The hidden clause
   102	
   103	Here is what the fresh eye could not see, and it was sitting in the 2007 commit all along. Look
   104	back at the original hunk, a few lines below the table [R3]:
   105	
   106	```console
   107	$ git -C repos/openttd show --format='' --no-ext-diff 61fe35688046b7ef36305ebd92b79bfcc535783f -- src/town_cmd.cpp | sed -n '69,70p'
   108	+		m = _grow_count_values[1][min(n, 5)];
   109	+		if (n == 0 && !CHANCE16(1, 12)) return;
   110	```
   111	
   112	That second line is a toll gate, and it applies to exactly one column: the unserviced town.
   113	`CHANCE16(1, 12)` is the game's coin-flip helper — pass roughly one time in twelve — so a town
   114	with no stations doesn't just count down from 320. It counts down from 320 *and then, eleven
   115	times out of twelve, is sent home without progress*. The zero-station town's real growth rate is
   116	not 320. It is 320 dragged through a twelvefold penalty — slower, by a wide margin, than the
   117	one-station town's honest 420. The table was never out of order. Its first column is simply
   118	quoted in a different currency, and the exchange rate lives thirty lines away.
   119	
   120	That is what frosch meant by *they actually did not correlate*. The two numbers a tidy-minded
   121	reader wants to compare are not on the same axis. A value's meaning does not live in the value.
   122	It lives in the code that consumes it — and the consumer is never printed in the diff where the
   123	value looks wrong.
   124	
   125	By 2019 the penalty had migrated to a different function in the file, even further from the
   126	table than in 2007, which is why a close reader of the table alone had no chance. The
   127	information needed to *not* make this mistake existed, but it lived somewhere the mistake would
   128	never take you.
   129	
   130	## The five-line monument
   131	
   132	So frosch reverted the cell. But look at what the revert actually shipped, because this is the
   133	move that elevates the whole episode. Diff the tree from just before the stranger's fix against
   134	the tree just after the revert — the net effect of the entire affair, typo report and merge and
   135	revert together [R8]:
   136	
   137	```console
   138	$ git -C repos/openttd diff --no-ext-diff 7e22f243ed3b324df3da9dba5594c14b4e6794a0^ 61dba850af737cd49d1bb344dafd7a91a18895bf -- src/town_cmd.cpp
   139	+	/**
   140	+	 * Note:
   141	+	 * Unserviced+unfunded towns get an additional malus in UpdateTownGrowth(),
   142	+	 * so the "320" is actually not better than the "420".
   143	+	 */
   144	 	static const uint16 _grow_count_values[2][6] = {
   145	 		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
   146	 		{ 320, 420, 300, 220, 160, 100 }  // Normal values
   147	```
   148	
   149	Five lines of comment. That is everything the episode left behind. The code went back to exactly
   150	what it was; the *knowledge* did not. frosch took the fact that had lived thirty lines away —
   151	the fact whose distance from the table caused the whole affair — and moved a copy of it to the
   152	one place the next tidy-minded stranger is guaranteed to be looking: directly above the number
   153	that looks wrong. He didn't just undo the mistake. He patched the *conditions* that produced the
   154	mistake. The comment names the trap ("an additional malus"), names where the trap lives
   155	(`UpdateTownGrowth()`), and states the conclusion outright, in quotation marks, like a proverb:
   156	*the "320" is actually not better than the "420".*
   157	
   158	There is a genre of comment that only a revert can write. Ordinary comments explain what the
   159	author was thinking. This kind explains what *someone else* was thinking when they got it wrong —
   160	it is documentation with a failure mode already attached, the code's own antibodies. You cannot
   161	write it in advance, because you cannot know in advance which of your correct lines looks
   162	incorrect. You find out the day somebody fixes one.
   163	
   164	## Still standing
   165	
   166	The episode cost the project almost nothing — the wrong value sat on the main branch for
   167	two days, in a video game's town-growth table, and the record shows no further casualties. On the
   168	scale of this book's disasters it is a rounding error. That is precisely why I am showing it to
   169	you: this is what the *successful* version of every other chapter's story looks like, and the
   170	ledger lets us watch each component of the defense actually work.
   171	
   172	Watch the comment survive. In 2023, a project-wide migration modernized the codebase's integer
   173	types — a thousand mechanical touches, the kind of pass that flattens local character out of a
   174	file. It rewrote the table's declaration from `uint16` to `uint16_t`, brushing directly against
   175	the monument. The five lines came through untouched [R9]. Run blame on the tip of the repository
   176	today, August 2026, and the note and the restored row still answer to frosch, 2019, while the
   177	lines around them have changed hands [R10]:
   178	
   179	```console
   180	$ git -C repos/openttd blame -l -L 3862,3869 4d4f8bff38d200fbcfda11789bd69259ebbefd17 -- src/town_cmd.cpp
   181	61dba850af737cd49d1bb344dafd7a91a18895bf (frosch          2019-11-20 ...) 	 * so the "320" is actually not better than the "420".
   182	...
   183	61dba850af737cd49d1bb344dafd7a91a18895bf (frosch          2019-11-20 ...) 		{ 320, 420, 300, 220, 160, 100 }  // Normal values
   184	```
   185	
   186	Seven years, one type migration, and nobody has "fixed" the typo again. Either no fresh eye has
   187	snagged on the leaning fence post since — or, more likely, fresh eyes snag on it constantly, read
   188	the five lines, and quietly close the tab. A comment's success is measured in commits that never
   189	happened, which is why nobody ever gets credit for one. The blame output above is as close as the
   190	record comes to a receipt for prevented mistakes.
   191	
   192	## At home
   193	
   194	The habit this chapter wants to leave in your hands fires at a very specific moment: the moment
   195	a value in someone else's code looks obviously, fixably wrong. A lopsided table. A constant that
   196	breaks the pattern of its neighbors. Your eye snags, your diagnosis writes itself, and the fix is
   197	one keystroke. That moment. Before you type, go find the consumer. Trace where the value is
   198	actually *read*, because that is where its meaning lives — and check whether some `if` thirty
   199	lines away, or one function over, quotes your ugly number in a currency you haven't seen. Run
   200	`git log -S` with the constant and read what its authors said when it arrived; if the value was
   201	ever "fixed" before, the revert message will tell you exactly which trap you are currently
   202	standing in. The whole investigation costs five minutes.
   203	
   204	And if you are ever on the other side — the one doing the reverting — steal frosch's move whole.
   205	Don't just put the right value back. Write down, at the exact coordinates where the next person's
   206	eye will snag, why the wrong-looking thing is right. State your project's creed in the commit
   207	message if you have one; two sentences will do. Then let the ledger do what ledgers do. Somewhere
   208	in a repository you maintain, there is a correct line that looks like a typo, and its comment
   209	hasn't been written yet. The stranger who will someday fix it — carefully, publicly, with the
   210	best of intentions, under a name like *Yourself* — is the reader you are writing for.
   211	
   212	## Receipts
   213	
   214	- **R1** `git -C repos/openttd log --reverse -S '{ 320, 420, 300' --format=... -- src/town_cmd.cpp` — the complete lineage of the table: three commits ever touched that row — 2007 arrival, 2019 "typo" fix, 2019 revert.
   215	- **R2** `git -C repos/openttd show -s --format=... 61fe35688046b7ef36305ebd92b79bfcc535783f` — maedhros, 2007-04-12: town growth control added; "The default rate is TTD's original rate."
   216	- **R3** `git -C repos/openttd show ... 61fe356880... -- src/town_cmd.cpp | sed -n '28,59p'` — the original hunk: the table with its countdown comment, and `if (n == 0 && !CHANCE16(1, 12)) return;` — the one-in-twelve gate on the unserviced column.
   217	- **R4** `git -C repos/openttd log --author='kyle\.smith314@gmail\.com' ...` + `rev-list --count` — `Yourself <kyle.smith314@gmail.com>`, authored 2019-11-18, committed same day by Ingo von Borstel; the identity's only commit in the history.
   218	- **R5** `git -C repos/openttd show ... 7e22f243ed3b... -- src/town_cmd.cpp` — the fix itself: one cell, `320` → `420`, titled "Fix: typo in town growth rates (#7837)".
   219	- **R6** `git -C repos/openttd show -s --format=... 61dba850af73...` — frosch, 2019-11-20T01:00: "OpenTTD tries to replicate the original game mechanics. Making numbers look nice and correlate is no goal, and in this case they actually did not correlate."
   220	- **R7** `git -C repos/openttd show ... 61dba850af73... -- src/town_cmd.cpp` — the revert restores `320` and adds the five-line note naming the malus in `UpdateTownGrowth()`.
   221	- **R8** `git -C repos/openttd diff 7e22f243ed3b...^ 61dba850af73... -- src/town_cmd.cpp` — pre-fix tree vs post-revert tree: the net effect of the entire episode is the comment alone.
   222	- **R9** `git -C repos/openttd show eaae0bb5e717... -- src/town_cmd.cpp` — 2023 integer-type migration (`uint16` → `uint16_t`) touches the declaration; values and note unchanged.
   223	- **R10** `git -C repos/openttd blame -l -L 3862,3869 4d4f8bff38d2... -- src/town_cmd.cpp` — at the 2026 tip, the note and the restored row still blame to frosch's revert.

---COUNTS/CHECKS---
2235
34:transport empires. <!-- CHECK: OpenTTD is an open-source reimplementation of Transport Tycoon

exec
/bin/bash -lc "sed -n '1,190p' chapters/15-postgres.reader.md && printf '\\n---OPENING ORDER CONTEXT---\\n' && rg -n '"'^# '"' chapters/{04-xz,01-debian-openssl,10-t2t,14-dual-ec,15-postgres,12-php,09-npm,07-vim}*.md 2>/dev/null | head -80 && printf '\\n---GIT STATUS---\\n' && git status --short" in /home/diablo/book16
 succeeded in 218ms:
# THIS IS A HACK TO GET V4 OUT THE DOOR

Buried inside PostgreSQL — the database quietly running underneath a huge share of the world's
software — there is a number, and the number is one third.

Here is what it does. When the database receives a query, it has to *plan* how to run it, and to
plan well it needs to estimate how many rows each condition will match. Usually it has
statistics to work from. But when a condition is something it can't measure — a function call in
a `WHERE` clause, say — it has to fall back on a pure guess, and its guess is: one third of the
rows will match. That single number then shapes how the entire query gets executed.

Why one third? No reason at all. It's a placeholder. And we know it's a placeholder because the
person who wrote it left a note. The note is from 1992 — the code predates the modern project,
having been inherited from a decade of academic work at Berkeley — and it is written, in
capital letters, like a man in a hurry:

> THIS IS A HACK TO GET V4 OUT THE DOOR. FUNCS SHOULD BE ABLE TO HAVE SELECTIVITIES THEMSELVES.
> -- JMH 7/9/92

Picture that afternoon. July 1992, a deadline to ship version 4 of the academic Postgres, a
programmer who needs the planner to produce *some* answer, no time to work out the correct one.
So he types `0.3333333`, shouts into the comment that this is a hack and somebody should really
do it properly, and ships. This is the story of what happened to that hack over the next
thirty-three years — three decisions across ten years, all about a hack already decades old —
and the surprising truth that the right move, every time, was to leave it alone.

## 2015: the fix he doesn't make

Fast-forward to 2015. The one-third guess has by now silently shaped the behavior of every
PostgreSQL database on earth for twenty-three years. And Tom Lane — who has worked on this
project since 1998 and is, as we'll see, very nearly its single most prolific contributor — is
working in exactly the file where that guess lives. In fact he's building real improvements to
it: for certain function calls, he adds the ability to use actual statistics instead of the
blind guess.

Which means the old placeholder is right there, and the perfect moment to finally delete it has
arrived. He's already replacing the guess with something real wherever he can. Why not clean up
the leftover — swap that unprincipled one-third for something more defensible — and finish the
job the 1992 note literally asked for?

He refuses, and writes down why: *changing a default estimate that's survived for twenty-three
years seems like something not to do without a lot more testing than I care to put into it.*

Read that carefully, because it isn't laziness — it's the opposite. The number is wrong. But it
has been wrong, *in exactly the same way,* for twenty-three years. Which means every database
index, every tuned query, every application that runs acceptably today does so on top of that
specific wrong number. Change it, and you'd instantly re-plan millions of live queries — some
faster, some catastrophically slower — with no way to know in advance which. A wrong answer that
the entire world has quietly adapted to is no longer simply a bug. It has become a kind of
promise.

## 2023: the feature he won't build

The same instinct shows up again, in a sharper form. For years, users had asked for a specific
feature: the ability to delete a single value from a list-of-allowed-values type (an "enum"). It
sounds simple. It is, in fact, a minefield — that value might be sitting inside existing data,
inside saved queries, inside the internal structure of indexes.

Rather than build it badly, or wait for someone else to try, in 2023 Tom Lane did something
unusual. He added the feature's *syntax* to the database — so you can now type the command — and
wired it up to do exactly one thing: refuse, and print a checklist of the hard problems that
would have to be solved first. He even said so in his own note: *this is really just a docs
patch.*

Why go to the trouble of building a command that only rejects itself? Because he put the warning
in the one place the next person to attempt the feature is guaranteed to look: the exact syntax
they'd have to start from. A wiki page, a mailing list — those are places people skip before
diving in. The code is not. So he shipped, in effect, the reasons *not* to ship the thing,
planted right at the door.

## 2025: the fix he undoes

And then the decision that ties it all together. In 2025 — ten years after he declined to touch
it — a well-intentioned cleanup finally removed that one-third fallback for some cases, on the
sensible grounds that the database had better tools now. Tom Lane put it back. And the comment he
attached is the whole chapter in miniature:

> This seems a pretty unprincipled choice, but Postgres has been using that estimate for function
> calls since 1992. The hoariness of this behavior suggests that we should not be in too much
> hurry to use another value.

Set that beside the original 1992 note and watch the instruction completely flip. The first one
said: *this is a hack, replace it.* This one admits the choice is unprincipled — and then argues
that its very *age* is the reason to keep it. *Fix me* has become, over thirty-three years, *do
not fix me.* He restored a number a graduate student called a hack, and left a warning for the
next person tempted to be clever about removing it. It is still there today.

## The hand

You keep meeting the same name in this story because it is, remarkably, mostly one person. Tom
Lane's very first contribution to PostgreSQL, back in 1998, wasn't a grand feature — it was a
small fix to some compiler settings. In the twenty-seven years since, he has made **16,863**
changes to the project, more than any other human being in its history.

And the thread running through all of it is not the features he added. It's his judgment about
what *not* to disturb. The 1992 hack he guards. The enum feature he refuses to build and
documents instead. Anyone can admire the commit that adds something new. The work that actually
keeps a thirty-year-old database trustworthy is the quieter kind: the commit that adds a warning
where a feature was demanded, or that puts a wrong number back on purpose and explains why you
shouldn't touch it.

## At home

If you take one habit from this, take a healthy suspicion of your own urge to tidy. When you find
an ugly constant or an embarrassing `HACK` comment in code you've inherited, before you fix it,
go look at its history — search for who touched it and read what they said. Very often you'll
discover that someone with far more context already stood exactly where you're standing, felt the
same urge to clean it up, and deliberately chose not to — and wrote down why. The most valuable
thing in an old codebase is frequently not its elegant machinery but its load-bearing hacks: the
ugly bits that have been wrong for so long that everything else has quietly grown to depend on
them. The tell is a second comment stacked on the first — not "fix this," but "here is why fixing
this is the dangerous move." When you find that, you've found someone being careful on your
behalf across the years. Read it before you reach for the delete key.

---

*The 1992 hack comment, the 0.3333333 guess, Tom Lane's 2015 refusal and 2025 restoration, the
enum feature that ships as a warning, and his 16,863-commit record are all real and public,
reproducible with a git command each. The full technical dig is here:
[THIS IS A HACK TO GET V4 OUT THE DOOR — the full dig](15-postgres.full.html).*

---OPENING ORDER CONTEXT---
chapters/04-xz.receipts.md:1:# Receipts — ch. 04 xz (Jia Tan, CVE-2024-3094)
chapters/15-postgres.receipts.md:1:# Receipts — ch. 15 postgres (the refusals of Tom Lane)
chapters/07-vim.receipts.md:1:# Receipts — ch. 07 vim (the last 32 hours and the succession)
chapters/04-xz.reader.md:1:# One character
chapters/07-vim.reader.md:1:# The current maintainer
chapters/15-postgres.reader.md:1:# THIS IS A HACK TO GET V4 OUT THE DOOR
chapters/07-vim.md:1:# The current maintainer
chapters/15-postgres.md:1:# THIS IS A HACK TO GET V4 OUT THE DOOR
chapters/04-xz.md:1:# One character
chapters/09-npm.receipts.md:1:# Receipts — ch. 09 the npm sabotage pair (event-stream + colors)
chapters/10-t2t.receipts.md:1:# Receipts — ch. 10 tensor2tensor (the Transformer's repository)
chapters/07-vim.fable.md:1:# The current maintainer
chapters/09-npm.reader.md:1:# add flat map
chapters/10-t2t.reader.md:1:# Giving 0 losses
chapters/15-postgres.fable.md:1:# THIS IS A HACK TO GET V4 OUT THE DOOR
chapters/09-npm.md:1:# add flat map
chapters/10-t2t.md:1:# Giving 0 losses
chapters/10-t2t.fable.md:1:# Giving 0 losses
chapters/12-php.reader.md:1:# Fix typo
chapters/09-npm.fable.md:1:# add flat map
chapters/12-php.receipts.md:1:# Receipts — ch. 12 php-src (the zerodium backdoor)
chapters/01-debian-openssl.receipts.md:1:# Receipts — ch. 01 Debian OpenSSL (CVE-2008-0166)
chapters/01-debian-openssl.md:1:# The nine minutes
chapters/01-debian-openssl.reader.md:1:# The nine minutes
chapters/12-php.md:1:# Fix typo
chapters/12-php.fable.md:1:# Fix typo
chapters/01-debian-openssl.fable.md:1:# The nine minutes

---GIT STATUS---
?? chapters/17-agy-review.md
?? chapters/17-codex-review.md
?? chapters/17-dirtycow.fable.md
?? chapters/17-dirtycow.receipts.md
?? chapters/17-grok-review.md
?? chapters/17-review-prompt.md
?? chapters/18-agy-review.md
?? chapters/18-codex-review.md
?? chapters/18-grok-review.md
?? chapters/18-review-prompt.md
?? chapters/18-signatures.fable.md
?? chapters/18-signatures.receipts.md
?? chapters/19-agy-review.md
?? chapters/19-codex-review.md
?? chapters/19-grok-review.md
?? chapters/19-openttd.fable.md
?? chapters/19-openttd.receipts.md
?? chapters/19-review-prompt.md
?? scripts/receipts-17.sh
?? scripts/receipts-18.sh
?? scripts/receipts-19.sh

codex
Verdict: not through the factual gate yet, but the chapter’s core is strong and genuinely distinct from Postgres.

## Must-fix gates

1. **Factual gate fails on unsupported biography, review intent, and scale claims.**

   These statements outrun the receipts:

   - “this contributor’s machine was configured, presumably years earlier and long forgotten” — delete the speculation.
   - “a project maintainer … agreed with the diagnosis and merged it” and “reviewed … and accepted it” — R4 proves only that Ingo von Borstel committed it the same day. Use: “The committer field names Ingo von Borstel; the change landed the same day.”
   - “frosch — at that point more than a decade into working on this codebase [R6]” — R6 establishes no tenure. Replace with: “frosch authored the revert; Charles Pigott committed it [R6].”
   - “a thousand mechanical touches” — R9 gives no count. Use “an automatic integer-type migration.”
   - “twenty-year-old open-source project” is external and currently unmarked. Remove or verify.

2. **“The ugly row … is a measurement” crosses the expressly forbidden boundary.**

   At [lines 90–99](/home/diablo/book16/chapters/19-openttd.fable.md:90), the prose moves from the supported “TTD’s original rate” to implying that this exact row was measured from or copied out of the original game. The receipts do not establish that.

   Replace:

   > “The ugly row is not a draft to be polished. It is a *measurement*.”

   With something that also sharpens the Postgres distinction:

   > “This is not a wrong value preserved because other code learned to depend on it. The value was right on the merits; the comparison was incomplete. OpenTTD’s stated constraint was fidelity to the original mechanics, not a visually regular table.”

3. **The toll-gate explanation needs to distinguish receipt from interpretation.**

   At [lines 112–118](/home/diablo/book16/chapters/19-openttd.fable.md:112):

   - R3 does not define `CHANCE16`; “the game’s coin-flip helper” and its probability are code readings.
   - “Eleven times out of twelve” is valid arithmetic only after making that reading explicit.
   - The condition is specifically for an **unserviced, unfunded** town; the current paragraph drops “unfunded.”
   - “twelvefold penalty” and “real growth rate” sound more exact than the excerpt supports.

   Suggested replacement:

   > “Within the normal, unfunded row, that guard applies only when `n == 0`. I read `CHANCE16(1, 12)` as a one-in-twelve test; with the `!` in front, roughly eleven calls in twelve return here. The later revert supplies the safe conclusion: this is an ‘additional malus,’ so 320 is ‘not better than’ 420.”

   That is understandable without game knowledge and cleanly labels the inference.

   Likewise, soften:

   > “By 2019 the penalty had migrated to a different function … even further from the table”

   R7 supports only this:

   > “By 2019 the table sat in `GetNormalGrowthRate()`, while the revert’s new comment located the additional malus in `UpdateTownGrowth()`.”

   It does not prove the migration path, physical distance, or that distance caused the mistake. Replace every “thirty lines away” with “elsewhere in the file.”

4. **The consequence landing is presently special pleading—and partly unsupported.**

   At [lines 166–190](/home/diablo/book16/chapters/19-openttd.fable.md:166):

   - “sat on the main branch” is not established by these receipts.
   - “the record shows no further casualties” is an absence Git cannot prove.
   - “successful version of every other chapter’s story” claims more than this episode demonstrates.
   - “Seven years” should be “nearly seven years.”
   - R1/R10 support no repeat change through the audited tip; they do not prove that readers repeatedly saw the comment and closed their tabs.

   Replace the opening paragraph with the narrow, concrete consequence:

   > “The receipts establish a small but durable result. Between November 18 and November 20, the changed value entered and left the repository’s history. The net diff was five lines of explanation, and through the audited 2026 tip the same correction was never attempted again. The record cannot tell us whether the comment prevented another commit; it can show that the project preserved the reason beside the temptation.”

   This will still score lower on real-world consequence than the numbered chapters. That is unavoidable. As a P.S. range chapter, the honest smallness works; calling it every disaster’s successful counterpart does not.

5. **The “Yourself” treatment currently edges toward making the contributor a curiosity.**

   The no-fool paragraph is excellent, but [lines 18–24](/home/diablo/book16/chapters/19-openttd.fable.md:18) first spends too long inviting a laugh: “I promise I am not making this up,” invented machine history, “drive-by,” “stranger.” The closing “under a name like *Yourself*” adds one flourish too many.

   Condense to:

   > “The author field reads `Yourself <kyle.smith314@gmail.com>` [R4]. That email appears as an author exactly once in the audited history. The ledger’s accidental second person is apt: this is exactly the change I might have made.”

   Whether the name was accidental is itself uncertain, so safest is “The ledger’s second person is apt.” Cut the closing name callback. The empathy then lands without turning the person into the joke.

6. **The cold-open sentence is opaque and appears wrong.**

   > “Ten becomes eleven characters wide, if you count generously”

   Neither `320` nor `420` changes width, and “ten becomes eleven” has no recoverable meaning. Replace it with:

   > “One digit in one cell: `320` becomes `420`.”

## Optional suggestions

- **Distinctness:** The core is genuinely different from Postgres. Postgres preserves a known-wrong estimate because it became a compatibility contract; OpenTTD restores a value that was right on the merits because a hidden condition made the visible comparison false. The overlap is rhetorical: ugly constant, urge to tidy, senior correction, warning placed at the temptation. The replacement proposed in gate 2 should make the distinction explicit enough.

- **Metaphor load:** “constitution,” “measurement,” “different currency,” “monument,” “antibodies,” and “rounding error” arrive in quick succession. Keep “constitution” for the creed and “different currency” for the technical explanation; cut at least two of the others. That will better suit the concision-first SDE reader.

- **Reveal timing:** It works. The reader is told that the fix was reverted, but not why; then the raw `CHANCE16` line appears one beat before the toll-gate explanation. Preserve that order.

- **Title:** “Making numbers look nice” flips successfully. It first reads like a description of the tempting edit, then becomes part of the project’s rebuke and creed. Keep it.

- **Length:** The prescribed count is exactly 2,235 words. Lean is right. The toll-gate paragraph needs greater precision, not more room; pay for it by cutting the unsupported biography and repeated “next tidy-minded stranger” language.

- **CHECK marker:** There is exactly one, at [lines 33–35](/home/diablo/book16/chapters/19-openttd.fable.md:33), for the game identity/year. Its scope is insufficient: the visible sentence also claims “beloved,” “business-simulation,” and “about building transport empires,” while “twenty-year-old” appears elsewhere without a marker. Either expand and verify the full contextual claim or trim to the externally verified minimum.
tokens used
40,578
Verdict: not through the factual gate yet, but the chapter’s core is strong and genuinely distinct from Postgres.

## Must-fix gates

1. **Factual gate fails on unsupported biography, review intent, and scale claims.**

   These statements outrun the receipts:

   - “this contributor’s machine was configured, presumably years earlier and long forgotten” — delete the speculation.
   - “a project maintainer … agreed with the diagnosis and merged it” and “reviewed … and accepted it” — R4 proves only that Ingo von Borstel committed it the same day. Use: “The committer field names Ingo von Borstel; the change landed the same day.”
   - “frosch — at that point more than a decade into working on this codebase [R6]” — R6 establishes no tenure. Replace with: “frosch authored the revert; Charles Pigott committed it [R6].”
   - “a thousand mechanical touches” — R9 gives no count. Use “an automatic integer-type migration.”
   - “twenty-year-old open-source project” is external and currently unmarked. Remove or verify.

2. **“The ugly row … is a measurement” crosses the expressly forbidden boundary.**

   At [lines 90–99](/home/diablo/book16/chapters/19-openttd.fable.md:90), the prose moves from the supported “TTD’s original rate” to implying that this exact row was measured from or copied out of the original game. The receipts do not establish that.

   Replace:

   > “The ugly row is not a draft to be polished. It is a *measurement*.”

   With something that also sharpens the Postgres distinction:

   > “This is not a wrong value preserved because other code learned to depend on it. The value was right on the merits; the comparison was incomplete. OpenTTD’s stated constraint was fidelity to the original mechanics, not a visually regular table.”

3. **The toll-gate explanation needs to distinguish receipt from interpretation.**

   At [lines 112–118](/home/diablo/book16/chapters/19-openttd.fable.md:112):

   - R3 does not define `CHANCE16`; “the game’s coin-flip helper” and its probability are code readings.
   - “Eleven times out of twelve” is valid arithmetic only after making that reading explicit.
   - The condition is specifically for an **unserviced, unfunded** town; the current paragraph drops “unfunded.”
   - “twelvefold penalty” and “real growth rate” sound more exact than the excerpt supports.

   Suggested replacement:

   > “Within the normal, unfunded row, that guard applies only when `n == 0`. I read `CHANCE16(1, 12)` as a one-in-twelve test; with the `!` in front, roughly eleven calls in twelve return here. The later revert supplies the safe conclusion: this is an ‘additional malus,’ so 320 is ‘not better than’ 420.”

   That is understandable without game knowledge and cleanly labels the inference.

   Likewise, soften:

   > “By 2019 the penalty had migrated to a different function … even further from the table”

   R7 supports only this:

   > “By 2019 the table sat in `GetNormalGrowthRate()`, while the revert’s new comment located the additional malus in `UpdateTownGrowth()`.”

   It does not prove the migration path, physical distance, or that distance caused the mistake. Replace every “thirty lines away” with “elsewhere in the file.”

4. **The consequence landing is presently special pleading—and partly unsupported.**

   At [lines 166–190](/home/diablo/book16/chapters/19-openttd.fable.md:166):

   - “sat on the main branch” is not established by these receipts.
   - “the record shows no further casualties” is an absence Git cannot prove.
   - “successful version of every other chapter’s story” claims more than this episode demonstrates.
   - “Seven years” should be “nearly seven years.”
   - R1/R10 support no repeat change through the audited tip; they do not prove that readers repeatedly saw the comment and closed their tabs.

   Replace the opening paragraph with the narrow, concrete consequence:

   > “The receipts establish a small but durable result. Between November 18 and November 20, the changed value entered and left the repository’s history. The net diff was five lines of explanation, and through the audited 2026 tip the same correction was never attempted again. The record cannot tell us whether the comment prevented another commit; it can show that the project preserved the reason beside the temptation.”

   This will still score lower on real-world consequence than the numbered chapters. That is unavoidable. As a P.S. range chapter, the honest smallness works; calling it every disaster’s successful counterpart does not.

5. **The “Yourself” treatment currently edges toward making the contributor a curiosity.**

   The no-fool paragraph is excellent, but [lines 18–24](/home/diablo/book16/chapters/19-openttd.fable.md:18) first spends too long inviting a laugh: “I promise I am not making this up,” invented machine history, “drive-by,” “stranger.” The closing “under a name like *Yourself*” adds one flourish too many.

   Condense to:

   > “The author field reads `Yourself <kyle.smith314@gmail.com>` [R4]. That email appears as an author exactly once in the audited history. The ledger’s accidental second person is apt: this is exactly the change I might have made.”

   Whether the name was accidental is itself uncertain, so safest is “The ledger’s second person is apt.” Cut the closing name callback. The empathy then lands without turning the person into the joke.

6. **The cold-open sentence is opaque and appears wrong.**

   > “Ten becomes eleven characters wide, if you count generously”

   Neither `320` nor `420` changes width, and “ten becomes eleven” has no recoverable meaning. Replace it with:

   > “One digit in one cell: `320` becomes `420`.”

## Optional suggestions

- **Distinctness:** The core is genuinely different from Postgres. Postgres preserves a known-wrong estimate because it became a compatibility contract; OpenTTD restores a value that was right on the merits because a hidden condition made the visible comparison false. The overlap is rhetorical: ugly constant, urge to tidy, senior correction, warning placed at the temptation. The replacement proposed in gate 2 should make the distinction explicit enough.

- **Metaphor load:** “constitution,” “measurement,” “different currency,” “monument,” “antibodies,” and “rounding error” arrive in quick succession. Keep “constitution” for the creed and “different currency” for the technical explanation; cut at least two of the others. That will better suit the concision-first SDE reader.

- **Reveal timing:** It works. The reader is told that the fix was reverted, but not why; then the raw `CHANCE16` line appears one beat before the toll-gate explanation. Preserve that order.

- **Title:** “Making numbers look nice” flips successfully. It first reads like a description of the tempting edit, then becomes part of the project’s rebuke and creed. Keep it.

- **Length:** The prescribed count is exactly 2,235 words. Lean is right. The toll-gate paragraph needs greater precision, not more room; pay for it by cutting the unsupported biography and repeated “next tidy-minded stranger” language.

- **CHECK marker:** There is exactly one, at [lines 33–35](/home/diablo/book16/chapters/19-openttd.fable.md:33), for the game identity/year. Its scope is insufficient: the visible sentence also claims “beloved,” “business-simulation,” and “about building transport empires,” while “twenty-year-old” appears elsewhere without a marker. Either expand and verify the full contextual claim or trim to the externally verified minimum.
