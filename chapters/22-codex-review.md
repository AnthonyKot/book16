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
session id: 01a02632-6d8a-7f42-9b87-04fe433a5300
--------
user
You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
is an engineer who runs git blame daily; first person, opinionated, no sneering; the reader should
feel a reveal a beat before it's named.

READ: chapters/22-curl.fable.md, chapters/22-curl.receipts.md, plus CONTEXT.md and TEMPLATE.md.
Context: NEW P.S.-candidate chapter (source 22): curl's root commit as a disk-crash recovery,
opening a quarter-century of one maintainer. The published book runs xz / debian-openssl / t2t /
dual-ec / postgres / php / npm / vim. Adjacent registers to stay distinct from: the vim chapter
(one-maintainer elegy/succession) and the P.S. genesis chapter (what first commits really are).
This chapter's distinct claim: the first commit as a SURVIVAL artifact, and succession-without-
ceremony. Calibration: a professional-SDE reader scores concision and real-world consequence
hardest.

Spine (verified, LOCKED to receipts): sole root ae1912cb 1999-12-29 Daniel Stenberg "Initial
revision," 144 files / 37,273 insertions; the root tree contains config.cache/log/status, four
.patch files, prior tarball curl-6.3.1.tar.gz (242,680 bytes), and built executable src/curl
(100755, 1,830,293 bytes); root CHANGES opens at Version 6.4 (Dec 1999) and contains the
1999-11-23 entry "I've had this major disk crash… backed up elsewhere or stored in this CVS
server!"; CHANGES bottoms out at HttpGet 1.0 by Rafael Sagula ("which started all this!") with
Stenberg entering at 1.1; tip HISTORY.md dates HttpGet 0.1 to 1996-11-11 and Stenberg's
maintainership from December 1996; 067a75e8 2000-01-10 "removed junk files" deletes 9 files /
3,046 deletions (tarball, patches, config droppings — NOT src/curl; the draft must not claim the
binary was deleted then); at pin 695aa157 (2026-08-18): 39,474 commits, 1,507 mailmapped
authors, Stenberg 20,578; his first commit is the root and his latest is the pinned tip
("urldata: remove the aptr struct"); he leads every decade; six years led by others — Yang Tse
2008/2009, Steve Holme 2013/2014, Viktor Szakats 2025/2026.

FACTUAL GATE (one flag gates): every hash, date, name, quote, count, and console line in prose
must appear in chapters/22-curl.receipts.md — console fences must be reproduce-true (verify every
panel byte-for-byte against the receipts, including the long awk one-liners; flag any dropped or
altered output line). The crash was 36 days before the root, NOT "twelve days" (the scout got
this wrong; twelve days is the JUNK CLEANUP delay) — check the prose keeps these separate. "More
than the other 1,506 combined" — verify the arithmetic against 20,578 of 39,474. List the one
<!-- CHECK: --> marker (curl's billions-of-installations ubiquity) and judge scope; flag any
OTHER external claims lacking a marker (e.g., "everything with a network plug," "cars,
televisions").

Craft risks to judge hard: (1) the cold open "The first commit of curl contains a copy of curl"
— earned by the ls-tree panel, or too cute? (2) does the chapter hold one plot (recovery →
pre-history → endpoints → succession-without-ceremony → near-loss), or sag into a stats tour in
"The other endpoint"? (3) the explicit contrast with vim ("succession… doesn't look like Vim's
held breath") — does referencing another chapter work in P.S., or should it stand alone? (4) the
Szakats 2025/2026 beat — presented with receipt-true modesty (the receipts show only annual
leaders, not a handover)? (5) title "This major disk crash" — flips? (6) body word count vs the
2,200-3,200 band — where to cut or grow?

Output: a numbered gate list (must-fix), then optional suggestions. Be specific — quote the
line, say the fix.
warning: Codex could not find bubblewrap on PATH. Install bubblewrap with your OS package manager. See the sandbox prerequisites: https://developers.openai.com/codex/concepts/sandboxing#prerequisites. Codex will use the bundled bubblewrap in the meantime.
codex
I’m using the learning-UX audit skill only as a structured evidence-audit framework: this is a read-only review with a hard receipts gate. I’ll first read its instructions, then the four requested files and verify every factual and console claim.
exec
/bin/bash -lc "sed -n '1,240p' /home/diablo/.codex/skills/audit-learning-ux/SKILL.md" in /home/diablo/book16
 succeeded in 245ms:
---
name: audit-learning-ux
description: Audit an implemented learning product or educational interface by exercising real learner journeys and reporting evidence-backed UX problems. Use for heuristic or flow reviews, LeetCode and coding-interview apps, curriculum and practice pages, interactive lessons and labs, route or navigation audits, responsive and keyboard checks, feedback and recovery analysis, accessibility review, duplicated-screen detection, and prioritization of learner blockers. Keep reviews read-only unless the user explicitly requests fixes.
---

# Audit Learning UX

Evaluate whether a learner can reach a meaningful outcome, understand what happened, and know what to do next. Measure the implemented product instead of reviewing screenshots or filenames in isolation when live inspection is practical.

## Preserve the requested scope

1. Keep an audit or review read-only unless the user explicitly asks to fix or redesign.
2. Identify the target route, learner, task, supported devices, and relevant repository state.
3. Separate product findings from environment failures and unavailable integrations.
4. Do not create external issues, messages, or artifacts unless requested.

## Establish the journey

1. Read repository instructions, product claims, routes, content and state models, and relevant tests.
2. State the primary learner job and the observable outcome that completes it.
3. Map the shortest expected path and the important alternative, failure, and recovery paths.
4. Identify which teaching content, evidence, recommendation, or review mechanism should appear in that journey.

## Exercise the product

1. Start from the real entry point instead of deep-linking past discovery unless deep linking is itself under review.
2. Complete the primary path using the rendered interface where possible.
3. Exercise representative states: first use, no data, wrong answer, hint use, interruption, unavailable content, persistence or reload, and review due as applicable.
4. Inspect supported desktop and narrow widths. Use the product's documented breakpoints; use a phone-sized and wide viewport when none are documented.
5. Check keyboard operation, focus, control names, dynamic feedback, reduced motion, and color-independent meaning where relevant.
6. Compare behavior with the repository's content and state model to find hidden capabilities or UI claims the data cannot support.

Read [references/audit-rubric.md](references/audit-rubric.md) while evaluating the journey.

## Record defensible findings

For every finding, capture:

- severity;
- affected learner job and route or component;
- reproduction path or triggering state;
- observed evidence;
- learner consequence;
- likely cause, clearly marked as inference when unconfirmed;
- smallest credible recommendation;
- verification criterion.

Use file and line references, route names, screenshots, DOM evidence, or test output. Do not cite generic best practices as proof that this product is broken.

## Prioritize

1. Put blockers, dead ends, misleading feedback, inaccessible primary actions, and data-loss risks first.
2. Put hidden teaching value, fragmented journeys, duplicate routes, and unclear next actions ahead of visual polish.
3. Distinguish a defect from a product hypothesis or optional enhancement.
4. Prefer a few high-confidence findings over an exhaustive list of weak observations.

Read [references/report-format.md](references/report-format.md) before writing the final audit.

## Handle requested fixes

If fixes are explicitly requested:

1. Preserve the finding and acceptance criterion before editing.
2. Implement the smallest coherent correction in the existing architecture and design system.
3. Add or update focused tests where the repository supports them.
4. Run the real gates and re-exercise the affected journey.
5. Report residual risk and any state that could not be tested.

## Report the outcome

Lead with the overall learner outcome and severity-ordered findings. Keep confirmed observations separate from inferences and untested concerns. Include relevant strengths only when they change prioritization or show a reusable pattern.

exec
/bin/bash -lc "sed -n '1,260p' /home/diablo/.codex/skills/audit-learning-ux/references/audit-rubric.md && sed -n '1,220p' /home/diablo/.codex/skills/audit-learning-ux/references/report-format.md && printf '\\nFILES\\n' && wc -l -w chapters/22-curl.fable.md chapters/22-curl.receipts.md CONTEXT.md TEMPLATE.md && printf '\\nCONTEXT\\n' && sed -n '1,260p' CONTEXT.md && printf '\\nTEMPLATE\\n' && sed -n '1,280p' TEMPLATE.md" in /home/diablo/book16
 succeeded in 212ms:
# Learning UX Audit Rubric

Apply only relevant checks. Use observed product evidence for every defect.

## 1. Job and next-action clarity

- Does the entry point make the primary learner action obvious?
- Does each durable surface support a distinct job or state?
- Can the learner explain why a recommendation appears?
- After every meaningful outcome, is the next action clear?
- Are management actions visually secondary to learning actions?

## 2. Learning-loop integrity

- Can the learner discover the lesson or explanation before assessment when needed?
- Are recognition cues and decision rules visible where they are applied?
- Is guided practice distinguishable from independent practice?
- Are hints progressive rather than an immediate answer reveal?
- Does feedback explain the learner's result or reasoning?
- Does debrief happen after meaningful effort and support transfer?
- Is completion distinct from correctness, independence, explanation, and retention?

## 3. Flow and recovery

- Exercise success, incorrect, empty, loading, unavailable, interrupted, and blocked states that the product supports.
- Look for branches without a useful exit.
- Check whether retry destroys useful work or creates duplicate state.
- Check refresh, back navigation, deep links, and restored sessions when persistence exists.
- Confirm that errors explain both what happened and the available recovery.

## 4. Information architecture

- Identify routes that repeat evidence or actions owned elsewhere.
- Identify important content unreachable from the primary journey.
- Distinguish a screen from a state, filter, or modal action.
- Check decision cost and continuity, not only click count.
- Preserve a separate surface only when it owns a unique workflow or durable state.

## 5. Feedback and trust

- Keep feedback close to the triggering action.
- Distinguish wrong answer, execution failure, incomplete work, and system failure.
- Label simulations, estimates, and inferred mastery honestly.
- Avoid claiming mastery from visits, clicks, or a single shallow success.
- Explain scheduler urgency and scoring in human language.

## 6. Accessibility and input

- Reach and operate the primary journey by keyboard.
- Check visible focus and logical order.
- Check accessible names, group labels, status announcements, and error association.
- Ensure color is not the only carrier of meaning.
- Respect reduced motion and avoid essential auto-play.
- Check target size, zoom behavior, and reading order where practical.

## 7. Responsive and visual hierarchy

- Keep the primary action and current task prominent at narrow widths.
- Check overflow in code, diagrams, tables, editors, and traces.
- Prevent sticky navigation or overlays from covering content or controls.
- Check that labels remain associated with values and controls.
- Treat density, contrast, spacing, and typography as defects only when they impede the learner job.

## 8. State, persistence, and evidence

- Verify that saved state matches the interface after reload.
- Check stale, partial, imported, and conflicting state when supported.
- Confirm that mastery evidence records the conditions under which it was earned.
- Ensure recommendations update after completion and do not keep serving finished work without a reason.
- Check that review state uses the source of truth rather than duplicated UI-only counters.

## Severity

- **Blocker**: prevents the primary outcome, loses work, or makes the main action inaccessible to a supported user.
- **High**: creates a common dead end, teaches the wrong model, hides essential content, or produces seriously misleading feedback.
- **Medium**: adds material friction, ambiguity, duplication, or recovery cost but has a workable path.
- **Low**: localized polish or consistency issue with limited effect on the learner outcome.

## Evidence status

- **Observed**: reproduced or directly inspected.
- **Inferred**: likely cause derived from observed facts.
- **Hypothesis**: plausible learner impact requiring research or analytics.
- **Not assessed**: relevant but unavailable in the current environment.
# Audit Report Format

Keep the report compact and decision-ready.

## Outcome

State whether the primary learner can complete the target job, understand the result, recover from common failure, and identify the next action. Name the tested routes, viewport or input coverage, and major limitations.

## Findings

Order by severity and impact. Use this structure:

### Severity: finding title

- **Where:** route, component, and state
- **Job:** affected learner progress
- **Reproduce:** minimal path
- **Evidence:** observed UI behavior, file and line, screenshot, DOM fact, or test output
- **Impact:** concrete learner consequence
- **Cause:** confirmed fact or labeled inference
- **Recommendation:** smallest coherent correction
- **Verify:** observable acceptance criterion

Combine findings only when they share one cause and one fix. Do not bury multiple independent blockers under a broad title.

## Product hypotheses

List unverified opportunities separately from defects. State what evidence would validate or reject each one.

## Reusable strengths

Mention only patterns worth preserving or reusing in the proposed fix, such as a strong interaction, clear recovery, or trustworthy feedback model.

## Verification coverage

List:

- routes and journeys exercised;
- states exercised;
- viewport and input methods;
- automated gates run and results;
- integrations, browsers, devices, or assistive technology not assessed.

Never imply full accessibility, usability, or production readiness from partial checks.

FILES
  212  2093 chapters/22-curl.fable.md
  198  1115 chapters/22-curl.receipts.md
   94  1000 CONTEXT.md
   22   225 TEMPLATE.md
  526  4433 total

CONTEXT
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

TEMPLATE
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

codex
The draft is 2,093 words by whole-file count; the template’s body-only method may be lower. I’m now matching prose facts and each fenced transcript directly against the receipts, while separately judging the narrative spine and the one CHECK marker.
exec
/bin/bash -lc "printf '%s\\n' 'DRAFT' && nl -ba chapters/22-curl.fable.md && printf '%s\\n' 'RECEIPTS' && nl -ba chapters/22-curl.receipts.md" in /home/diablo/book16
 succeeded in 232ms:
DRAFT
     1	# This major disk crash
     2	
     3	*This is the full dig — every command, every receipt. The plain-English telling of the same story
     4	is here: [This major disk crash](22-curl.html).*
     5	
     6	The first commit of curl contains a copy of curl.
     7	
     8	I want to show you that before I explain it, because the ledger's own listing is better than any
     9	paraphrase. Here is a selection from the tree of curl's root commit — the very first thing in the
    10	history of the tool that now moves data for practically everything with a network plug — dated
    11	December 29th, 1999, titled `Initial revision`, 144 files, 37,273 lines [R1, R2]:
    12	
    13	```console
    14	$ git -C repos/curl ls-tree -r --long ae1912cb0d494b48d514d937826c9fe83ec96c4d | awk '$5=="CHANGES" || $5=="Makefile" || $5=="config.cache" || $5=="config.log" || $5=="config.status" || $5=="curl-6.3.1.tar.gz" || $5=="src/curl" || $5 ~ /^curl.*patch$/'
    15	100644 blob 34cc7bf83ce0739690cee6e5fab993d7acb685d9   72928	CHANGES
    16	100644 blob 0eaf99620d26bd02992030c4382f71e16af72b7d   12983	Makefile
    17	100644 blob ba8353a0d1c15691912bff0769341cc08866f2a8    4548	config.cache
    18	100644 blob ac13614e42bc5ec48a804e41635c876ba4969e1c    3858	config.log
    19	100755 blob 8c3de4b68fa32c94f7c8a4ea91fe9f000eb20b0d   20162	config.status
    20	100644 blob 38bba51aa8910f0d41d755f44a007753df656eb0  242680	curl-6.3.1.tar.gz
    21	100644 blob 25a1b3b60c7861ca33acca5ec01c72a6358c7185   19010	curl.beos-patch
    22	100644 blob 242e308f9f25c6b3e7d2de4521e69ec2d70446cc   36246	curl_631_general.patch
    23	100644 blob 03738dbc037c1ff723ef4fe469e402bda88c70a7    2328	curl_63_form.patch
    24	100644 blob 9df65e232bb489e07de21815f07975d429441eb0    3051	curl_63_partialdl.patch
    25	100755 blob cba40a4c0c9a3d5d2992840616c9f4f7d8af9340 1830293	src/curl
    26	```
    27	
    28	Look at what is *in* there. `config.cache`, `config.log`, `config.status` — the droppings a build
    29	leaves behind, the files every tutorial tells you never to commit. A stack of `.patch` files. A
    30	release tarball of the *previous* version, `curl-6.3.1.tar.gz`, a quarter megabyte of compressed
    31	history sitting inside the history. And — my favorite object in this entire book — `src/curl`,
    32	mode `100755`, 1.8 million bytes: a compiled, executable *binary* of curl, checked in as file
    33	number one-hundred-and-something of the project's first commit.
    34	
    35	No one composes a first commit like this. A first commit like this is not composed at all. It is
    36	a *shovel-load* — a working directory picked up whole, dirt and all, and set down inside a
    37	version-control system. The question a first commit like this asks is: what happened right before
    38	this? And for once, the repository answers in plain words.
    39	
    40	## Five weeks earlier
    41	
    42	Among the 144 files is `CHANGES`, the project's hand-kept log — 72,928 bytes of it, years of
    43	dated entries, already ancient at the moment of the "first" commit. Scroll down a page from its
    44	top and you reach late November 1999, five weeks before the root, and this entry [R4]:
    45	
    46	```console
    47	$ git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | sed -n '43,52p'
    48	   different directories than the sources.
    49	
    50	Version 6.3.1
    51	
    52	Daniel (23 November 1999):
    53	 - I've had this major disk crash. My good old trust-worthy source disk died
    54	   along with the machine that hosted it. Thank goodness most of all the
    55	   things I've done are either backed up elsewhere or stored in this CVS
    56	   server!
    57	```
    58	
    59	*I've had this major disk crash. My good old trust-worthy source disk died along with the machine
    60	that hosted it.* There it is — the event standing just outside the frame of the root commit,
    61	recorded by the survivor himself, inside the very tree that survived. The disk died in November.
    62	The repository begins in December. Curl's "Initial revision" is not an initiation. It is a
    63	*recovery* — a man gathering everything that was "backed up elsewhere or stored in this CVS
    64	server," tarball, binary, build droppings and all, and getting it under version control before
    65	the universe could take another swing at it. You do not curate a shovel-load like that when you
    66	have just watched a disk die with your source on it. You commit first and tidy later.
    67	
    68	And tidy he did. Twelve days into the new year, the ballast goes back over the side [R6]:
    69	
    70	```console
    71	$ git -C repos/curl show --format='%H%n%aI%n%an <%ae>%n%s' --stat 067a75e8957a91fb3407d1112931991998ae9219
    72	067a75e8957a91fb3407d1112931991998ae9219
    73	2000-01-10T23:29:47+00:00
    74	Daniel Stenberg <daniel@haxx.se>
    75	removed junk files
    76	
    77	 config.cache            |   86 ----
    78	 config.h                |  220 ---------
    79	 config.log              |   90 ----
    80	 config.status           |  492 ------------------
    81	 curl-6.3.1.tar.gz       |  Bin 242680 -> 0 bytes
    82	 curl.beos-patch         |  695 --------------------------
    83	 curl_631_general.patch  | 1265 -----------------------------------------------
    84	 curl_63_form.patch      |   92 ----
    85	 curl_63_partialdl.patch |  106 ----
    86	 9 files changed, 3046 deletions(-)
    87	```
    88	
    89	"Removed junk files." The tarball, the patches, the config droppings — 3,046 lines of recovery
    90	scaffolding, deleted the moment the project was safely breathing again. But deleted from the
    91	*tip*, not from history: the shovel-load is still right there in the root, permanently, which is
    92	the only reason this chapter can show it to you. The emergency was cleaned up. The evidence of
    93	the emergency is forever.
    94	
    95	## Before the beginning
    96	
    97	The `CHANGES` file has one more thing to say, and it is about how far back a project can reach
    98	past its own first commit. Read the file's *bottom* — the oldest entries in the log [R5]:
    99	
   100	```console
   101	$ git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | tail -12
   102	 - Implemented URLs (and skipped the old syntax).
   103	 - Output is written to stdout, so to achieve the above example, do:
   104	   httpget http://143.54.10.6/info_logo.gif > test.gif
   105	
   106	Version 1.1
   107	 Daniel Stenberg <Daniel.Stenberg@sth.frontec.se>
   108	 - Adjusted it slightly to accept named hosts on the command line. We
   109	   wouldn't wanna use IP numbers for the rest of our lifes, would we?
   110	
   111	Version 1.0
   112	  Rafael Sagula <sagula@inf.ufrgs.br>
   113	  - Wrote the initial httpget, which started all this!
   114	```
   115	
   116	The log does not begin with curl, and it does not begin with Daniel Stenberg. It bottoms out at a
   117	tool called **HttpGet**, version 1.0, by Rafael Sagula — *"which started all this!"* — with
   118	Stenberg entering at version 1.1 as the guy who "adjusted it slightly." The project's own history
   119	file, kept at the repository's tip, fills in the dates: Sagula, a Brazilian developer, released
   120	HttpGet 0.1 on November 11th, 1996; Stenberg's first release as the new maintainer followed
   121	within weeks [R5]. So the true stack of beginnings runs: someone else's tool, 1996; Stenberg
   122	takes it over, 1996; it becomes curl; a disk dies, November 1999; and only *then*, December 1999,
   123	does the git-visible "Initial revision" happen — a recovery snapshot of an already three-year-old
   124	project originally written by somebody else. Every layer of that is invisible if you read the
   125	root commit's subject line and stop.
   126	
   127	## The other endpoint
   128	
   129	Now run the camera forward, because the man shoveling his surviving files into CVS at the end of
   130	1999 is still there. Ask the pinned clone for Stenberg's first and latest commits [R8]:
   131	
   132	```console
   133	$ git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp --reverse --format='%H %aI %cI %an <%ae> %s' 695aa15743685a9d46c4c41bb9c95221d4659541 | head -1
   134	ae1912cb0d494b48d514d937826c9fe83ec96c4d 1999-12-29T14:20:26+00:00 1999-12-29T14:20:26+00:00 Daniel Stenberg <daniel@haxx.se> Initial revision
   135	```
   136	
   137	```console
   138	$ git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp --format='%H %aI %cI %an <%ae> %s' 695aa15743685a9d46c4c41bb9c95221d4659541 | head -1
   139	695aa15743685a9d46c4c41bb9c95221d4659541 2026-08-18T23:58:16+02:00 2026-08-19T07:49:55+02:00 Daniel Stenberg <daniel@haxx.se> urldata: remove the aptr struct
   140	```
   141	
   142	His first commit is the repository's root. His latest, as of this dig, is the repository's *tip*
   143	— August 18th, 2026, at two minutes to midnight, still refactoring internals. The same email
   144	address on both. Twenty-six and a half years separate those two lines, and the ledger between
   145	them holds 39,474 commits by 1,507 different people, of which Stenberg wrote **20,578** — more
   146	than fifty-two percent, more than the other 1,506 combined [R7]. Group the years into decades
   147	and he leads every one of them: the 2000s, the 2010s, the 2020s [R9].
   148	
   149	But the record is more honest than a monopoly, and the exceptions are the part I'd frame [R10]:
   150	
   151	```console
   152	$ git -C repos/curl log --use-mailmap --format='%ad%x09%aN' --date=format:'%Y' 695aa15743685a9d46c4c41bb9c95221d4659541 | awk -F '\t' '{count[$1 SUBSEP $2]++; years[$1]=1} END {for (year in years) {max=0; leader=""; for (key in count) {split(key, part, SUBSEP); if (part[1]==year && (count[key]>max || (count[key]==max && part[2]<leader))) {max=count[key]; leader=part[2]}} if (leader != "Daniel Stenberg") print year, max, leader}}' | sort -n
   153	2008 649 Yang Tse
   154	2009 492 Yang Tse
   155	2013 664 Steve Holme
   156	2014 664 Steve Holme
   157	2025 1352 Viktor Szakats
   158	2026 888 Viktor Szakats
   159	```
   160	
   161	Six calendar years, out of twenty-eight, when somebody else out-committed the founder: Yang Tse
   162	in the late 2000s, Steve Holme in the mid-2010s, and — look at the dates — Viktor Szakats *right
   163	now*, in 2025 and 2026. The one-person project has never been only one person, and at the tip of
   164	the history the annual lead has, quietly, changed hands. The founder's name is on the newest
   165	commit; the year's volume belongs to someone else. Nothing in the repository marks this as a
   166	moment. That is exactly why it is worth noticing: succession in a healthy project doesn't look
   167	like Vim's held breath. It looks like a shortlog, gradually rebalancing, while everyone is busy
   168	working.
   169	
   170	## What was almost lost
   171	
   172	Here is the consequence that makes the 1999 shovel-load more than a curiosity. The tool whose
   173	source sat on that dying disk is now, by its own project's accounting, among the most widely
   174	deployed pieces of software in existence — it ships inside operating systems, cars, televisions,
   175	and phones, in billions of installations. <!-- CHECK: curl is installed in the tens of billions
   176	of devices/instances per the project's own estimates (curl.se); ships by default in Windows,
   177	macOS, iOS, Android, cars, TVs; needs external source. --> Practically all of it is maintained,
   178	to this day, with one person writing half the commits. In November 1999 the physical home of that
   179	future was one "good old trust-worthy source disk," and the disk died. What stood between curl
   180	and oblivion was the boring redundancy of a CVS server and some scattered backups — and the
   181	founder's instinct, five weeks later, to commit *everything he still had*, junk and binaries
   182	included, before sorting any of it. The ugliest first commit in this book is ugly for the best
   183	reason there is: it was made by someone who had just learned, the hard way, that the tidy version
   184	of your project is worth nothing if it exists in one place.
   185	
   186	## At home
   187	
   188	Go look at your project's actual beginning — not the README's story, the root: `git rev-list
   189	--max-parents=0 HEAD`, then `git ls-tree -r --long <root>` and sort your eye by size. Read what
   190	is really in there. A tarball inside the tree, build droppings, a compiled binary, a `CHANGES`
   191	file already years long — every one of those is a fossil of the day someone moved, rescued, or
   192	recovered the project, and the subject line will almost never say so. Then read the oldest log
   193	file *as it existed at the root* (`git show <root>:CHANGES | tail`), because the pre-history of a
   194	project — the other tool it used to be, the other person who started it — survives, when it
   195	survives at all, in the files, not in the commits. And when you find your own root is a
   196	shovel-load: before you judge it, check the dates against the nearest disaster. Somewhere five
   197	weeks before the ugliest first commit you will ever inherit, there is usually a sentence like
   198	*I've had this major disk crash* — written by the person who saved everything you now get to
   199	read.
   200	
   201	## Receipts
   202	
   203	- **R1** `git -C repos/curl rev-list --max-parents=0 ...` + `show --shortstat ... ae1912cb0d49...` — the sole root: 1999-12-29, Daniel Stenberg, "Initial revision," 144 files, 37,273 insertions.
   204	- **R2** `git -C repos/curl ls-tree -r --long ae1912cb0d49... | awk ...` — the root tree holds `config.cache`/`config.log`/`config.status`, four `.patch` files, the prior release tarball `curl-6.3.1.tar.gz` (242,680 bytes), and the built executable `src/curl` (mode 100755, 1,830,293 bytes).
   205	- **R3** `git -C repos/curl show ae1912cb0d49...:CHANGES | sed -n '1,25p'` — the root CHANGES opens at Version 6.4, dated entries from late December 1999.
   206	- **R4** `... | sed -n '43,52p'` — the 1999-11-23 entry: "I've had this major disk crash. My good old trust-worthy source disk died along with the machine that hosted it… backed up elsewhere or stored in this CVS server!"
   207	- **R5** `... :CHANGES | tail -12` + `show 695aa157...:docs/HISTORY.md | sed -n '15,24p'` — the log bottoms out at HttpGet 1.0 by Rafael Sagula ("which started all this!"), Stenberg entering at 1.1; HISTORY.md dates HttpGet 0.1 to 1996-11-11 and Stenberg's maintainership to December 1996.
   208	- **R6** `git -C repos/curl show --stat ... 067a75e8957a...` — 2000-01-10, "removed junk files": the tarball, patches, and config droppings deleted; 9 files, 3,046 deletions.
   209	- **R7** `rev-list --count` + `shortlog -sn` at pin `695aa157...` — 39,474 commits, 1,507 mailmapped authors; Daniel Stenberg 20,578.
   210	- **R8** `git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp` (reverse head / head) — his first commit is the root (1999-12-29); his latest is the pinned tip (2026-08-18, "urldata: remove the aptr struct").
   211	- **R9** decade aggregation of `log --use-mailmap --format='%ad%x09%aN'` — Stenberg leads the 1990s/2000s/2010s/2020s in the clone.
   212	- **R10** year-leader aggregation — the six years led by others: Yang Tse 2008–09, Steve Holme 2013–14, Viktor Szakats 2025–26.
RECEIPTS
     1	# Receipts — source 22 curl (a recovery, then one maintainer across decades)
     2	
     3	Verbatim outputs against the curl/curl clone, pinned at `695aa15743685a9d46c4c41bb9c95221d4659541`.
     4	Regenerate with `scripts/receipts-22.sh`. Long outputs are selected or truncated by the commands shown.
     5	
     6	## R1 — the Git root: 29 December 1999, "Initial revision", and already 37,273 lines
     7	```
     8	$ git -C repos/curl rev-list --max-parents=0 695aa15743685a9d46c4c41bb9c95221d4659541
     9	ae1912cb0d494b48d514d937826c9fe83ec96c4d
    10	```
    11	
    12	```
    13	$ git -C repos/curl show --shortstat --format='%H%nAuthorDate: %aI%nCommitDate: %cI%nAuthor: %an <%ae>%nSubject: %s' ae1912cb0d494b48d514d937826c9fe83ec96c4d
    14	ae1912cb0d494b48d514d937826c9fe83ec96c4d
    15	AuthorDate: 1999-12-29T14:20:26+00:00
    16	CommitDate: 1999-12-29T14:20:26+00:00
    17	Author: Daniel Stenberg <daniel@haxx.se>
    18	Subject: Initial revision
    19	
    20	 144 files changed, 37273 insertions(+)
    21	```
    22	
    23	## R2 — the root is a working recovery tree: cache, logs, patches, a prior tarball, and a built executable
    24	```
    25	$ git -C repos/curl ls-tree -r --long ae1912cb0d494b48d514d937826c9fe83ec96c4d | awk '$5=="CHANGES" || $5=="Makefile" || $5=="config.cache" || $5=="config.log" || $5=="config.status" || $5=="curl-6.3.1.tar.gz" || $5=="src/curl" || $5 ~ /^curl.*patch$/'
    26	100644 blob 34cc7bf83ce0739690cee6e5fab993d7acb685d9   72928	CHANGES
    27	100644 blob 0eaf99620d26bd02992030c4382f71e16af72b7d   12983	Makefile
    28	100644 blob ba8353a0d1c15691912bff0769341cc08866f2a8    4548	config.cache
    29	100644 blob ac13614e42bc5ec48a804e41635c876ba4969e1c    3858	config.log
    30	100755 blob 8c3de4b68fa32c94f7c8a4ea91fe9f000eb20b0d   20162	config.status
    31	100644 blob 38bba51aa8910f0d41d755f44a007753df656eb0  242680	curl-6.3.1.tar.gz
    32	100644 blob 25a1b3b60c7861ca33acca5ec01c72a6358c7185   19010	curl.beos-patch
    33	100644 blob 242e308f9f25c6b3e7d2de4521e69ec2d70446cc   36246	curl_631_general.patch
    34	100644 blob 03738dbc037c1ff723ef4fe469e402bda88c70a7    2328	curl_63_form.patch
    35	100644 blob 9df65e232bb489e07de21815f07975d429441eb0    3051	curl_63_partialdl.patch
    36	100755 blob cba40a4c0c9a3d5d2992840616c9f4f7d8af9340 1830293	src/curl
    37	```
    38	
    39	## R3 — what the root CHANGES literally opens with: curl 6.4 in December 1999
    40	```
    41	$ git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | sed -n '1,25p'
    42	                                  _   _ ____  _     
    43	                              ___| | | |  _ \| |    
    44	                             / __| | | | |_) | |    
    45	                            | (__| |_| |  _ <| |___ 
    46	                             \___|\___/|_| \_\_____|
    47	
    48	                               History of Changes
    49	
    50	
    51	Version 6.4
    52	
    53	Daniel (28 December 1999):
    54	 - Tim Verhoeven <dj@walhalla.sin.khk.be> correctly identified that curl
    55	   doesn't support URL formatted file names when getting ftp. Now, there's a
    56	   problem with getting very weird file names off FTP servers. RFC 959 defines
    57	   that the file name syntax to use should be the same as in the native OS of
    58	   the server. Since we don't know the peer server system we currently just
    59	   translate the URL syntax into plain letters. It is still better and with
    60	   the solaris 2.6-supplied ftp server it works with spaces in the file names.
    61	
    62	Daniel (27 December 1999):
    63	 - When curl parsed cookies straight off a remote site, it corrupted the input
    64	   data, which, if the downloaded headers were stored made very odd characters
    65	   in the saved data. Correctfully identified and reported by Paul Harrington
    66	   <paul@pizza.org>.
    67	```
    68	
    69	## R4 — five weeks before the root: the crash and the CVS copy, in the root's own CHANGES
    70	```
    71	$ git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | sed -n '43,52p'
    72	   different directories than the sources.
    73	
    74	Version 6.3.1
    75	
    76	Daniel (23 November 1999):
    77	 - I've had this major disk crash. My good old trust-worthy source disk died
    78	   along with the machine that hosted it. Thank goodness most of all the
    79	   things I've done are either backed up elsewhere or stored in this CVS
    80	   server!
    81	
    82	```
    83	
    84	## R5 — behind the DAG: the root CHANGES ends at HttpGet 1.0; repository history dates it to 1996
    85	```
    86	$ git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | tail -12
    87	 - Implemented URLs (and skipped the old syntax).
    88	 - Output is written to stdout, so to achieve the above example, do:
    89	   httpget http://143.54.10.6/info_logo.gif > test.gif
    90	
    91	Version 1.1
    92	 Daniel Stenberg <Daniel.Stenberg@sth.frontec.se>
    93	 - Adjusted it slightly to accept named hosts on the command line. We
    94	   wouldn't wanna use IP numbers for the rest of our lifes, would we?
    95	
    96	Version 1.0
    97	  Rafael Sagula <sagula@inf.ufrgs.br>
    98	  - Wrote the initial httpget, which started all this!
    99	```
   100	
   101	```
   102	$ git -C repos/curl show 695aa15743685a9d46c4c41bb9c95221d4659541:docs/HISTORY.md | sed -n '15,24p'
   103	## 1996
   104	
   105	On November 11, 1996 the Brazilian developer Rafael Sagula wrote and released
   106	HttpGet version 0.1.
   107	
   108	Daniel extended this existing command-line open-source tool. After a few minor
   109	adjustments, it did what he needed. The first release with Daniel's additions
   110	was 0.2, released on December 17, 1996. Daniel quickly became the new
   111	maintainer of the project.
   112	
   113	```
   114	
   115	## R6 — twelve days later, the recovery ballast is deleted as "junk files"
   116	```
   117	$ git -C repos/curl show --format='%H%n%aI%n%an <%ae>%n%s' --stat 067a75e8957a91fb3407d1112931991998ae9219
   118	067a75e8957a91fb3407d1112931991998ae9219
   119	2000-01-10T23:29:47+00:00
   120	Daniel Stenberg <daniel@haxx.se>
   121	removed junk files
   122	
   123	 config.cache            |   86 ----
   124	 config.h                |  220 ---------
   125	 config.log              |   90 ----
   126	 config.status           |  492 ------------------
   127	 curl-6.3.1.tar.gz       |  Bin 242680 -> 0 bytes
   128	 curl.beos-patch         |  695 --------------------------
   129	 curl_631_general.patch  | 1265 -----------------------------------------------
   130	 curl_63_form.patch      |   92 ----
   131	 curl_63_partialdl.patch |  106 ----
   132	 9 files changed, 3046 deletions(-)
   133	```
   134	
   135	## R7 — lifetime scale at the pinned tip: 39,474 commits, 1,507 mailmapped authors, Daniel first
   136	```
   137	$ printf 'commits '; git -C repos/curl rev-list --count 695aa15743685a9d46c4c41bb9c95221d4659541; printf 'mailmapped authors '; git -C repos/curl shortlog -sn 695aa15743685a9d46c4c41bb9c95221d4659541 | wc -l
   138	commits 39474
   139	mailmapped authors 1507
   140	```
   141	
   142	```
   143	$ git -C repos/curl shortlog -sn 695aa15743685a9d46c4c41bb9c95221d4659541 | head -10
   144	 20578	Daniel Stenberg
   145	  3311	Viktor Szakats
   146	  2587	Yang Tse
   147	  1916	Steve Holme
   148	  1463	Dan Fandrich
   149	  1145	Stefan Eissing
   150	   784	Jay Satiro
   151	   662	Guenter Knauf
   152	   498	Gisle Vanem
   153	   461	Marc Hoersken
   154	```
   155	
   156	## R8 — Daniel Stenberg's authored endpoints: the root in 1999 and the pinned tip in 2026
   157	```
   158	$ git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp --reverse --format='%H %aI %cI %an <%ae> %s' 695aa15743685a9d46c4c41bb9c95221d4659541 | head -1
   159	ae1912cb0d494b48d514d937826c9fe83ec96c4d 1999-12-29T14:20:26+00:00 1999-12-29T14:20:26+00:00 Daniel Stenberg <daniel@haxx.se> Initial revision
   160	```
   161	
   162	```
   163	$ git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp --format='%H %aI %cI %an <%ae> %s' 695aa15743685a9d46c4c41bb9c95221d4659541 | head -1
   164	695aa15743685a9d46c4c41bb9c95221d4659541 2026-08-18T23:58:16+02:00 2026-08-19T07:49:55+02:00 Daniel Stenberg <daniel@haxx.se> urldata: remove the aptr struct
   165	```
   166	
   167	## R9 — top five authors by author-date decade: Daniel leads each decade in the clone
   168	```
   169	$ git -C repos/curl log --use-mailmap --format='%ad%x09%aN' --date=format:'%Y' 695aa15743685a9d46c4c41bb9c95221d4659541 | awk -F '\t' '$1 ~ /^[0-9][0-9][0-9][0-9]$/ { decade=int($1/10)*10; count[decade SUBSEP $2]++ } END { for (key in count) { split(key, part, SUBSEP); print part[1], count[key], part[2] } }' | sort -k1,1n -k2,2nr -k3,3 | awk '$1 != decade {decade=$1; rank=0} rank++ < 5 {print}'
   170	1990 1 Daniel Stenberg
   171	2000 9055 Daniel Stenberg
   172	2000 1679 Yang Tse
   173	2000 657 Dan Fandrich
   174	2000 415 Gisle Vanem
   175	2000 409 Guenter Knauf
   176	2010 5289 Daniel Stenberg
   177	2010 1865 Steve Holme
   178	2010 908 Yang Tse
   179	2010 435 Dan Fandrich
   180	2010 393 Jay Satiro
   181	2020 6233 Daniel Stenberg
   182	2020 3228 Viktor Szakats
   183	2020 1145 Stefan Eissing
   184	2020 391 Jay Satiro
   185	2020 371 Dan Fandrich
   186	```
   187	
   188	## R10 — not a monopoly: the six author-date years when another contributor led
   189	```
   190	$ git -C repos/curl log --use-mailmap --format='%ad%x09%aN' --date=format:'%Y' 695aa15743685a9d46c4c41bb9c95221d4659541 | awk -F '\t' '{count[$1 SUBSEP $2]++; years[$1]=1} END {for (year in years) {max=0; leader=""; for (key in count) {split(key, part, SUBSEP); if (part[1]==year && (count[key]>max || (count[key]==max && part[2]<leader))) {max=count[key]; leader=part[2]}} if (leader != "Daniel Stenberg") print year, max, leader}}' | sort -n
   191	2008 649 Yang Tse
   192	2009 492 Yang Tse
   193	2013 664 Steve Holme
   194	2014 664 Steve Holme
   195	2025 1352 Viktor Szakats
   196	2026 888 Viktor Szakats
   197	```
   198	

codex
The factual pass has found one clear date-language error: “Twelve days into the new year” must be “Twelve days later.” The 23 November crash to 29 December root interval is correctly kept at five weeks/36 days. I’m checking the remaining derived arithmetic, unsupported generalizations, and whether the annual-leader evidence is being asked to prove succession.
exec
/bin/bash -lc "printf '%s\\n' 'BODY WORD COUNT' && awk '/"'^## Receipts/{exit} {print}'"' chapters/22-curl.fable.md | wc -w && printf '%s\\n' 'CHECK MARKERS' && rg -n '<"'!-- (CHECK|VERIFIED):'"' chapters/22-curl.fable.md && printf '%s\\n' 'NUMBERS DATES NAMES HASHES QUOTES CANDIDATES' && rg -n '[0-9]|Daniel|Stenberg|Sagula|Tse|Holme|Szakats|\"|“|”' chapters/22-curl.fable.md" in /home/diablo/book16
 succeeded in 201ms:
BODY WORD COUNT
1804
CHECK MARKERS
175:and phones, in billions of installations. <!-- CHECK: curl is installed in the tens of billions
NUMBERS DATES NAMES HASHES QUOTES CANDIDATES
4:is here: [This major disk crash](22-curl.html).*
11:December 29th, 1999, titled `Initial revision`, 144 files, 37,273 lines [R1, R2]:
14:$ git -C repos/curl ls-tree -r --long ae1912cb0d494b48d514d937826c9fe83ec96c4d | awk '$5=="CHANGES" || $5=="Makefile" || $5=="config.cache" || $5=="config.log" || $5=="config.status" || $5=="curl-6.3.1.tar.gz" || $5=="src/curl" || $5 ~ /^curl.*patch$/'
15:100644 blob 34cc7bf83ce0739690cee6e5fab993d7acb685d9   72928	CHANGES
16:100644 blob 0eaf99620d26bd02992030c4382f71e16af72b7d   12983	Makefile
17:100644 blob ba8353a0d1c15691912bff0769341cc08866f2a8    4548	config.cache
18:100644 blob ac13614e42bc5ec48a804e41635c876ba4969e1c    3858	config.log
19:100755 blob 8c3de4b68fa32c94f7c8a4ea91fe9f000eb20b0d   20162	config.status
20:100644 blob 38bba51aa8910f0d41d755f44a007753df656eb0  242680	curl-6.3.1.tar.gz
21:100644 blob 25a1b3b60c7861ca33acca5ec01c72a6358c7185   19010	curl.beos-patch
22:100644 blob 242e308f9f25c6b3e7d2de4521e69ec2d70446cc   36246	curl_631_general.patch
23:100644 blob 03738dbc037c1ff723ef4fe469e402bda88c70a7    2328	curl_63_form.patch
24:100644 blob 9df65e232bb489e07de21815f07975d429441eb0    3051	curl_63_partialdl.patch
25:100755 blob cba40a4c0c9a3d5d2992840616c9f4f7d8af9340 1830293	src/curl
30:release tarball of the *previous* version, `curl-6.3.1.tar.gz`, a quarter megabyte of compressed
32:mode `100755`, 1.8 million bytes: a compiled, executable *binary* of curl, checked in as file
42:Among the 144 files is `CHANGES`, the project's hand-kept log — 72,928 bytes of it, years of
43:dated entries, already ancient at the moment of the "first" commit. Scroll down a page from its
44:top and you reach late November 1999, five weeks before the root, and this entry [R4]:
47:$ git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | sed -n '43,52p'
50:Version 6.3.1
52:Daniel (23 November 1999):
62:The repository begins in December. Curl's "Initial revision" is not an initiation. It is a
63:*recovery* — a man gathering everything that was "backed up elsewhere or stored in this CVS
64:server," tarball, binary, build droppings and all, and getting it under version control before
68:And tidy he did. Twelve days into the new year, the ballast goes back over the side [R6]:
71:$ git -C repos/curl show --format='%H%n%aI%n%an <%ae>%n%s' --stat 067a75e8957a91fb3407d1112931991998ae9219
72:067a75e8957a91fb3407d1112931991998ae9219
73:2000-01-10T23:29:47+00:00
74:Daniel Stenberg <daniel@haxx.se>
77: config.cache            |   86 ----
78: config.h                |  220 ---------
79: config.log              |   90 ----
80: config.status           |  492 ------------------
81: curl-6.3.1.tar.gz       |  Bin 242680 -> 0 bytes
82: curl.beos-patch         |  695 --------------------------
83: curl_631_general.patch  | 1265 -----------------------------------------------
84: curl_63_form.patch      |   92 ----
85: curl_63_partialdl.patch |  106 ----
86: 9 files changed, 3046 deletions(-)
89:"Removed junk files." The tarball, the patches, the config droppings — 3,046 lines of recovery
98:past its own first commit. Read the file's *bottom* — the oldest entries in the log [R5]:
101:$ git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | tail -12
104:   httpget http://143.54.10.6/info_logo.gif > test.gif
106:Version 1.1
107: Daniel Stenberg <Daniel.Stenberg@sth.frontec.se>
111:Version 1.0
112:  Rafael Sagula <sagula@inf.ufrgs.br>
116:The log does not begin with curl, and it does not begin with Daniel Stenberg. It bottoms out at a
117:tool called **HttpGet**, version 1.0, by Rafael Sagula — *"which started all this!"* — with
118:Stenberg entering at version 1.1 as the guy who "adjusted it slightly." The project's own history
119:file, kept at the repository's tip, fills in the dates: Sagula, a Brazilian developer, released
120:HttpGet 0.1 on November 11th, 1996; Stenberg's first release as the new maintainer followed
121:within weeks [R5]. So the true stack of beginnings runs: someone else's tool, 1996; Stenberg
122:takes it over, 1996; it becomes curl; a disk dies, November 1999; and only *then*, December 1999,
123:does the git-visible "Initial revision" happen — a recovery snapshot of an already three-year-old
130:1999 is still there. Ask the pinned clone for Stenberg's first and latest commits [R8]:
133:$ git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp --reverse --format='%H %aI %cI %an <%ae> %s' 695aa15743685a9d46c4c41bb9c95221d4659541 | head -1
134:ae1912cb0d494b48d514d937826c9fe83ec96c4d 1999-12-29T14:20:26+00:00 1999-12-29T14:20:26+00:00 Daniel Stenberg <daniel@haxx.se> Initial revision
138:$ git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp --format='%H %aI %cI %an <%ae> %s' 695aa15743685a9d46c4c41bb9c95221d4659541 | head -1
139:695aa15743685a9d46c4c41bb9c95221d4659541 2026-08-18T23:58:16+02:00 2026-08-19T07:49:55+02:00 Daniel Stenberg <daniel@haxx.se> urldata: remove the aptr struct
143:— August 18th, 2026, at two minutes to midnight, still refactoring internals. The same email
145:them holds 39,474 commits by 1,507 different people, of which Stenberg wrote **20,578** — more
146:than fifty-two percent, more than the other 1,506 combined [R7]. Group the years into decades
147:and he leads every one of them: the 2000s, the 2010s, the 2020s [R9].
149:But the record is more honest than a monopoly, and the exceptions are the part I'd frame [R10]:
152:$ git -C repos/curl log --use-mailmap --format='%ad%x09%aN' --date=format:'%Y' 695aa15743685a9d46c4c41bb9c95221d4659541 | awk -F '\t' '{count[$1 SUBSEP $2]++; years[$1]=1} END {for (year in years) {max=0; leader=""; for (key in count) {split(key, part, SUBSEP); if (part[1]==year && (count[key]>max || (count[key]==max && part[2]<leader))) {max=count[key]; leader=part[2]}} if (leader != "Daniel Stenberg") print year, max, leader}}' | sort -n
153:2008 649 Yang Tse
154:2009 492 Yang Tse
155:2013 664 Steve Holme
156:2014 664 Steve Holme
157:2025 1352 Viktor Szakats
158:2026 888 Viktor Szakats
161:Six calendar years, out of twenty-eight, when somebody else out-committed the founder: Yang Tse
162:in the late 2000s, Steve Holme in the mid-2010s, and — look at the dates — Viktor Szakats *right
163:now*, in 2025 and 2026. The one-person project has never been only one person, and at the tip of
172:Here is the consequence that makes the 1999 shovel-load more than a curiosity. The tool whose
178:to this day, with one person writing half the commits. In November 1999 the physical home of that
179:future was one "good old trust-worthy source disk," and the disk died. What stood between curl
189:--max-parents=0 HEAD`, then `git ls-tree -r --long <root>` and sort your eye by size. Read what
203:- **R1** `git -C repos/curl rev-list --max-parents=0 ...` + `show --shortstat ... ae1912cb0d49...` — the sole root: 1999-12-29, Daniel Stenberg, "Initial revision," 144 files, 37,273 insertions.
204:- **R2** `git -C repos/curl ls-tree -r --long ae1912cb0d49... | awk ...` — the root tree holds `config.cache`/`config.log`/`config.status`, four `.patch` files, the prior release tarball `curl-6.3.1.tar.gz` (242,680 bytes), and the built executable `src/curl` (mode 100755, 1,830,293 bytes).
205:- **R3** `git -C repos/curl show ae1912cb0d49...:CHANGES | sed -n '1,25p'` — the root CHANGES opens at Version 6.4, dated entries from late December 1999.
206:- **R4** `... | sed -n '43,52p'` — the 1999-11-23 entry: "I've had this major disk crash. My good old trust-worthy source disk died along with the machine that hosted it… backed up elsewhere or stored in this CVS server!"
207:- **R5** `... :CHANGES | tail -12` + `show 695aa157...:docs/HISTORY.md | sed -n '15,24p'` — the log bottoms out at HttpGet 1.0 by Rafael Sagula ("which started all this!"), Stenberg entering at 1.1; HISTORY.md dates HttpGet 0.1 to 1996-11-11 and Stenberg's maintainership to December 1996.
208:- **R6** `git -C repos/curl show --stat ... 067a75e8957a...` — 2000-01-10, "removed junk files": the tarball, patches, and config droppings deleted; 9 files, 3,046 deletions.
209:- **R7** `rev-list --count` + `shortlog -sn` at pin `695aa157...` — 39,474 commits, 1,507 mailmapped authors; Daniel Stenberg 20,578.
210:- **R8** `git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp` (reverse head / head) — his first commit is the root (1999-12-29); his latest is the pinned tip (2026-08-18, "urldata: remove the aptr struct").
211:- **R9** decade aggregation of `log --use-mailmap --format='%ad%x09%aN'` — Stenberg leads the 1990s/2000s/2010s/2020s in the clone.
212:- **R10** year-leader aggregation — the six years led by others: Yang Tse 2008–09, Steve Holme 2013–14, Viktor Szakats 2025–26.

exec
/bin/bash -lc "for spans in '14,25 25,36 R2' '47,56 71,80 R4' '71,86 117,132 R6' '133,134 158,159 R8a' '138,139 163,164 R8b' '152,158 190,196 R10'; do set -- "'$spans; if cmp -s <(sed -n "$1p" chapters/22-curl.fable.md) <(sed -n "$2p" chapters/22-curl.receipts.md); then echo "$3 byte-exact"; else echo "$3 MISMATCH"; diff -u <(sed -n "$2p" chapters/22-curl.receipts.md) <(sed -n "$1p" chapters/22-curl.fable.md); fi; done
awk '"'BEGIN {total=39474; ds=20578; others=total-ds; printf \"others=%d margin=%d share=%.4f%%\\n\", others, ds-others, 100*ds/total}'" in /home/diablo/book16
 succeeded in 251ms:
R2 byte-exact
R4 byte-exact
R6 byte-exact
R8a byte-exact
R8b byte-exact
R10 byte-exact
others=18896 margin=1682 share=52.1305%

exec
/bin/bash -lc "rg --files chapters | sort | sed -n '1,240p'" in /home/diablo/book16
 succeeded in 208ms:
chapters/01-agy-review.md
chapters/01-agy-review.stdout.md
chapters/01-codex-review.md
chapters/01-debian-openssl.fable.md
chapters/01-debian-openssl.full.html
chapters/01-debian-openssl.html
chapters/01-debian-openssl.md
chapters/01-debian-openssl.reader.md
chapters/01-debian-openssl.receipts.md
chapters/01-grok-review.md
chapters/01-review-prompt.md
chapters/01-review-synthesis.md
chapters/02-log4j2.full.html
chapters/02-log4j2.html
chapters/02-log4j2.md
chapters/02-log4j2.reader.md
chapters/02-log4j2.receipts.md
chapters/0203-agy-review.md
chapters/0203-agy-review.stdout.md
chapters/0203-codex-review.md
chapters/0203-grok-review.md
chapters/0203-review-prompt.md
chapters/03-bitcoin.full.html
chapters/03-bitcoin.html
chapters/03-bitcoin.md
chapters/03-bitcoin.reader.md
chapters/03-bitcoin.receipts.md
chapters/04-agy-review.md
chapters/04-agy-review.stdout.md
chapters/04-codex-review.md
chapters/04-grok-review.md
chapters/04-review-prompt.md
chapters/04-xz.full.html
chapters/04-xz.html
chapters/04-xz.md
chapters/04-xz.reader.md
chapters/04-xz.receipts.md
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
chapters/06-agy-review.md
chapters/06-agy-review.stdout.md
chapters/06-codex-review.md
chapters/06-genesis.fable.md
chapters/06-genesis.full.html
chapters/06-genesis.html
chapters/06-genesis.md
chapters/06-genesis.reader.md
chapters/06-genesis.receipts.md
chapters/06-grok-review.md
chapters/06-review-prompt.md
chapters/0607-craft-review.md
chapters/07-agy-review.md
chapters/07-agy-review.stdout.md
chapters/07-codex-review.md
chapters/07-grok-review.md
chapters/07-review-prompt.md
chapters/07-vim.fable.md
chapters/07-vim.full.html
chapters/07-vim.html
chapters/07-vim.md
chapters/07-vim.reader.md
chapters/07-vim.receipts.md
chapters/08-agy-review.stdout.md
chapters/08-codex-review.md
chapters/08-costume.fable.md
chapters/08-costume.full.html
chapters/08-costume.html
chapters/08-costume.md
chapters/08-costume.reader.md
chapters/08-costume.receipts.md
chapters/08-grok-review.md
chapters/08-grok-review.stdout.md
chapters/08-review-prompt.md
chapters/09-agy-review.stdout.md
chapters/09-codex-review.md
chapters/09-grok-review.md
chapters/09-grok-review.stdout.md
chapters/09-npm.fable.md
chapters/09-npm.full.html
chapters/09-npm.html
chapters/09-npm.md
chapters/09-npm.reader.md
chapters/09-npm.receipts.md
chapters/09-review-prompt.md
chapters/10-agy-review.stdout.md
chapters/10-codex-review.md
chapters/10-grok-review.md
chapters/10-grok-review.stdout.md
chapters/10-review-prompt.md
chapters/10-t2t.fable.md
chapters/10-t2t.full.html
chapters/10-t2t.html
chapters/10-t2t.md
chapters/10-t2t.reader.md
chapters/10-t2t.receipts.md
chapters/11-agy-review.stdout.md
chapters/11-codex-review.md
chapters/11-ffmpeg.fable.md
chapters/11-ffmpeg.full.html
chapters/11-ffmpeg.html
chapters/11-ffmpeg.md
chapters/11-ffmpeg.reader.md
chapters/11-ffmpeg.receipts.md
chapters/11-grok-review.md
chapters/11-grok-review.stdout.md
chapters/11-review-prompt.md
chapters/12-agy-review.stdout.md
chapters/12-codex-review.md
chapters/12-grok-review.md
chapters/12-grok-review.stdout.md
chapters/12-php.fable.md
chapters/12-php.full.html
chapters/12-php.html
chapters/12-php.md
chapters/12-php.reader.md
chapters/12-php.receipts.md
chapters/12-review-prompt.md
chapters/13-agy-review.stdout.md
chapters/13-codex-review.md
chapters/13-grok-review.md
chapters/13-grok-review.stdout.md
chapters/13-node.fable.md
chapters/13-node.full.html
chapters/13-node.html
chapters/13-node.md
chapters/13-node.reader.md
chapters/13-node.receipts.md
chapters/13-review-prompt.md
chapters/14-agy-review.stdout.md
chapters/14-codex-review.md
chapters/14-grok-review.md
chapters/14-grok-review.stdout.md
chapters/14-openssl.fable.md
chapters/14-openssl.full.html
chapters/14-openssl.html
chapters/14-openssl.md
chapters/14-openssl.reader.md
chapters/14-openssl.receipts.md
chapters/14-review-prompt.md
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
chapters/16-agy-review.stdout.md
chapters/16-codex-review.md
chapters/16-empty.fable.md
chapters/16-empty.full.html
chapters/16-empty.html
chapters/16-empty.md
chapters/16-empty.reader.md
chapters/16-empty.receipts.md
chapters/16-grok-review.md
chapters/16-grok-review.stdout.md
chapters/16-review-prompt.md
chapters/17-agy-review.md
chapters/17-codex-review.md
chapters/17-dirtycow.fable.md
chapters/17-dirtycow.md
chapters/17-dirtycow.reader.md
chapters/17-dirtycow.receipts.md
chapters/17-grok-review.md
chapters/17-review-prompt.md
chapters/18-agy-review.md
chapters/18-codex-review.md
chapters/18-grok-review.md
chapters/18-review-prompt.md
chapters/18-signatures.fable.md
chapters/18-signatures.md
chapters/18-signatures.reader.md
chapters/18-signatures.receipts.md
chapters/19-agy-review.md
chapters/19-codex-review.md
chapters/19-grok-review.md
chapters/19-openttd.fable.md
chapters/19-openttd.md
chapters/19-openttd.reader.md
chapters/19-openttd.receipts.md
chapters/19-review-prompt.md
chapters/20-codex-review.md
chapters/20-grok-review.md
chapters/20-redis.fable.md
chapters/20-redis.receipts.md
chapters/20-review-prompt.md
chapters/21-codex-review.md
chapters/21-grok-review.md
chapters/21-iojs.fable.md
chapters/21-iojs.receipts.md
chapters/21-review-prompt.md
chapters/22-codex-review.md
chapters/22-curl.fable.md
chapters/22-curl.receipts.md
chapters/22-grok-review.md
chapters/22-review-prompt.md
chapters/23-agy-review.md
chapters/23-grok-review.md
chapters/23-heartbleed.md
chapters/23-heartbleed.reader.md
chapters/23-heartbleed.receipts.md
chapters/23-review-prompt.md

exec
/bin/bash -lc "printf '%s\\n' 'VIM RELEVANT PASSAGES' && rg -n -C 3 'succession|maintain|held breath|Bram|Buschmann|one.person|one person|death|future' chapters/07-vim.md | sed -n '1,260p' && printf '%s\\n' 'GENESIS RELEVANT PASSAGES' && rg -n -C 3 'first commit|root|begin|beginning|initial|Genesis|history' chapters/06-genesis.md | sed -n '1,280p'" in /home/diablo/book16
 succeeded in 224ms:
VIM RELEVANT PASSAGES
1:# The current maintainer
2-
3-*This is the full dig — every command, every receipt. The plain-English telling of the same story
4:is here: [The current maintainer](07-vim.html).*
5-
6:On the evening of Friday, 7 July 2023, at 18:57, the maintainer of Vim closed a gap in his
7-editor's error numbering. The numbers E418 and E503 were unused, and he had found a use:
8-
9-```console
--
14-```
15-
16-`E418: I'm a teapot`, says the new function, and — if you ask it nicely — `E503: Coffee is
17:currently not available`. [R2] A maintainer, on a Friday night, implementing a 1998 April Fools'
18-RFC in his text editor, because the error number was free and the joke was right there. Four and
19-a half hours later, at 23:19, he files the next patch: the new `err_teapot` entry has made a
20-help-file list unalphabetical, and that will not stand. [R3] He works past midnight — a test
--
26-file. He applies it — the stranger's name on the author line, his own on the committer line —
27-and ticks the version counter, patch 9.0.1677. [R5]
28-
29:~ That is the last thing Bram Moolenaar ever did to Vim.
30-
31:The repository gives the date of his death as 3 August 2023.
32-
33-## One name
34-
--
37-
38-```console
39-$ git shortlog -sn HEAD --since=2004-01-01T00:00:00Z --until=2011-01-01T00:00:00Z
40:  2649	Bram Moolenaar
41-$ git shortlog -sn HEAD --since=2011-01-01T00:00:00Z --until=2019-01-01T00:00:00Z
42:  6517	Bram Moolenaar
43-```
44-
45-Not the top row. The *only* row. [R6] From the day this repository begins — a 2004 import of an
--
48-nine thousand one hundred and sixty-six.
49-
50-Which would look like a project with no community, except for where the community actually is.
51:Vim's social contract was: you mail a patch; Bram reviews it, commits it as himself, and writes
52:your name into the message body. The author field says Bram; the *paragraph* says everyone. Here
53-is what fifteen years of contributing to Vim looked like from the contributor's side:
54-
55-```console
56:$ git log --author='Bram Moolenaar' --grep='(Christian Brabandt)' --reverse --format='%h %aI %s' | head -1
57-12682fda7 2010-03-10 updated for version 7.2.389
58-    Problem:    synIDattr() cannot return the font.
59-    Solution:   Support the "font" argument. (Christian Brabandt)
60-```
61-
62-March 2010: Christian Brabandt's work enters Vim for the first time — as a parenthesis at the end
63:of Bram's sentence. It happens again. It happens, in total, four hundred and four times:
64-
65-```console
66:$ git log --author='Bram Moolenaar' --grep='(Christian Brabandt)' --format='%h' | wc -l
67-404
68-```
69-
70:[R7] Four hundred and four commits authored by Bram whose Solution line credits the same man,
71-across thirteen years. The git author field, read naively, says Vim's bus factor was 1. The
72-bodies say there was a crowd — but a crowd on the other side of a mailbox, with one man deciding,
73-one man typing, one man ticking the counter in `src/version.c`.
74-
75-Hold the two mechanics side by side. A merged pull request is a door: the contributor's finished
76-commit walks into the tree under the contributor's own name, placed there by the contributor's
77:own hands. Bram's mailbox was a serving hatch: the patch arrived as text, and whatever happened
78-next happened at his keyboard. In his last years the hatch's paperwork grew more generous — from
79-April 2021 the patches he applied kept their sender's name on the author line, which is how a
80:stranger named THARAK HEGDE can be the author of a commit only Bram ever touched — and by the
81-end, 223 names had entered the author column that way, 1,420 commits. [R16] So the author field
82-is the wrong place to look for the constitution. Look at the other column. Committer, whole
83:history, while he lived: Bram Moolenaar, 17,981. GitHub's robot signature, left by web-button
84-actions, four. Another human being: once. [R16]
85-
86-## The constitution
87-
88-That once is an evening in November. On 27 November 2019, at 15:45, Christian Brabandt commits
89-nine lines of CI configuration with his own hands and merges them through a GitHub pull request —
90:the only commit of Bram's lifetime whose committer field names another human, and also, as it
91-happens, the first in the whole history with anyone else's name in the author field. [R6, R8]
92:At 21:57 the same evening, Bram reverts it. [R8] Six hours. The revert's message body is empty —
93-nine lines of YAML removed without one word of explanation. [R15] Christian had the *permissions*
94-to merge a PR. Permissions were not the constitution.
95-
--
98-```console
99-$ git log --reverse --grep='Merge pull request' --format='%ai %an %s' | head -3
100-2019-11-27  Christian Brabandt  Merge pull request #5273 from chrisbra/cirrus_ci
101:2019-11-27  Bram Moolenaar      Merge pull request #5275 from vim/revert-5273-cirrus_ci
102-2023-08-07  Christian Brabandt  Merge pull request #12740 from k-takata/import-9.0.1678
103-```
104-
105-Three and a half years of silence between the second line and the third. [R8] The first PR ever
106:merged is the 2019 experiment; the second is the revert; the third is four days after his death.
107-The gap *is* the constitution.
108-
109-It was also, once, written down — in the most bureaucratic corner of the tree. In January 2020
110:Bram added a LICENSE file, for the least romantic reason imaginable: `Problem: Vim license not
111-easy to find on github.` The license had lived in the help system for decades — `:help uganda` —
112-but GitHub's crawler does not run help commands, so he copied it into a root file the website
113-could see. [R9] And in it, this sentence:
114-
115-```console
116-$ git show c838626fea:LICENSE | sed -n '24,25p'
117:          The current maintainer is Bram Moolenaar <Bram@vim.org>.  If this
118-          changes it will be announced in appropriate places (most likely
119-```
120-
--
135-committer Christian Brabandt 2023-08-08T20:39:55+02:00
136-```
137-
138:[R10] Author date, 13 July. Bram is alive, five days past the teapot. Christian is debugging
139:leftover test files — files whose names trace to the crypt rename in Bram's final authored patch.
140-He finishes the work and it goes where his work had always gone: into the queue, to wait for
141:Bram.
142-
143-Now put the whole month on one screen. Every commit in the repository between 8 July and
144-9 August:
145-
146-```console
147-$ git log --format='%ci %an | committer=%cn | %s' --since=2023-07-08 --until=2023-08-09 --reverse
148:2023-07-09 02:38  THARAK HEGDE       | committer=Bram Moolenaar     | patch 9.0.1677: typo in syntax test input file
149-2023-08-07 03:24  ObserverOfTime     | committer=K.Takata           | patch 9.0.1678: blade files are not recognized
150-2023-08-07 17:00  Christian Brabandt | committer=GitHub             | Merge pull request #12740
151-2023-08-08 20:39  Christian Brabandt | committer=Christian Brabandt | patch 9.0.1679: Cleanup Tests from leftover files
--
161-## The announcement
162-
163-The license had promised an announcement, and on 13 August 2023 it arrives — as commit
164:`e978b4534a`, `Farewell to Bram and dedicate upcoming Vim 9.1 to him`, merged as a GitHub pull
165-request. [R11] Three files.
166-
167-The LICENSE keeps its promise:
168-
169-```diff
170:-          The current maintainer is Bram Moolenaar <Bram@vim.org>.  If this
171:+          The current maintainers are listed here: https://github.com/orgs/vim/people.
172-```
173-
174-One human becomes an org URL. The README edits the gentlest line in the project:
175-
176-```diff
177--Send any other comments, patches, flowers and suggestions to:
178:-	Bram Moolenaar <Bram@vim.org>
179-+Send any other comments, patches, flowers and suggestions to the vim-dev mailing list:
180-+	<vim-dev@vim.org>
181-```
182-
183-For thirteen years this file had carried a standing instruction to send one man flowers. [R13]
184-Now the flowers go to a mailing list. [R11] And the help system gains the sentence that puts his
185:death date into the permanent record:
186-
187-```console
188-$ git show e978b4534a:runtime/doc/version9.txt | sed -n '47,48p'
189:Vim version 9.1 is dedicated to Bram Moolenaar, who passed away on August 3rd 2023
190-while still working full-time on Vim.
191-```
192-
--
209-governance file. Ask `git log --reverse --grep='Merge pull request'` and read the gaps.
210-Constitutions live in reverts and silences.
211-
212:Vim's answer to the question every one-maintainer project will eventually be asked was one
213-sentence long, filed under licensing, three years early: *if this changes it will be announced in
214-appropriate places.* It changed. It was announced.
215-
--
217-
218-## Receipts
219-
220:- **R1** `git log --committer='Bram' --format='%ci %an | %s' | head -5` — the final five: teapot (18:57 Fri), sorted help (23:19), valgrind (00:25), crypt rename (00:54), a stranger's typo (02:38 Sun).
221-- **R2** `git show 80adaa8ae8` — 2023-07-07 18:57, patch 9.0.1673, `err_teapot()`: E418 / E503.
222-- **R3** `git show 416bd916b4` — 23:19, patch 9.0.1674, the help list re-alphabetized.
223:- **R4** `git show -s --format=fuller 16abd997c9` — 00:54, patch 9.0.1676: the last commit Bram authored.
224:- **R5** `git show 4c0089d696` — 02:38, patch 9.0.1677: author THARAK HEGDE, committer Bram; "arguements" → "arguments".
225:- **R6** `git shortlog -sn HEAD --since/--until` decade windows — 2,649/2,649 and 6,517/6,517 Bram; first non-Bram author 2019-11-27 (Christian Brabandt, Cirrus CI).
226:- **R7** `git log --author='Bram Moolenaar' --grep='(Christian Brabandt)'` — 404 commits; the first, `12682fda7`, 2010-03-10.
227-- **R8** `git log --reverse --grep='Merge pull request' | head -3` — 2019-11-27 add, 2019-11-27 revert (six hours), then nothing until 2023-08-07; revert stat: 2 files, 10 deletions.
228:- **R9** `git show c838626fea` + `:LICENSE` lines 24–25 — 2020-01-08, "Vim license not easy to find on github"; "The current maintainer is Bram Moolenaar… If this changes it will be announced."
229-- **R10** `git show -s 84bc00e9b5` — patch 9.0.1679: authored 2023-07-13, committed 2023-08-08.
230:- **R11** `git show e978b4534a` — 2023-08-13, "Farewell to Bram": LICENSE maintainer line, README flowers line, version9.txt dedication ("passed away on August 3rd 2023 while still working full-time on Vim").
231-- **R12** `git log --reverse --committer='Christian Brabandt' --since=2023-08-03 | head -2` + `shortlog -sn --since=2023-08-03` — same grammar, counter unreset; the author column becomes a crowd (1,164 / 544 / 314 …).
232-- **R13** `git log --reverse -S 'flowers' -- README.txt | head -1` — the flowers line enters README.txt 2010-08-07.
233-- **R14** `git log --since=2023-07-08 --until=2023-08-09 --reverse` — four commits in thirty-two days: the typo fix, then twenty-nine days of nothing, then 9.0.1678, the merge, and 9.0.1679.
234-- **R15** `git show -s --format='%b' d52986e7be` — the revert's message body: empty.
235:- **R16** `git log --until=2023-08-03 --format='%an'` (non-Bram: count + unique) + `--format='%cn' | sort | uniq -c` — while he lived: 1,420 non-Bram-authored commits across 223 names, the first `bb01a1ef3` (Yegappan Lakshmanan, 2021-04-26); committer column 17,981 Bram / 4 GitHub / 1 Christian Brabandt.
236-- **R17** `git log --since=2023-08-03 --format='%cn' | sort | uniq -c | sort -rn` — the hands after: Christian Brabandt 5,881, GitHub 434, then trivia.
237-
238-*Full transcripts: `chapters/07-vim.receipts.md` (regenerate with `scripts/receipts-07.sh`).*
GENESIS RELEVANT PASSAGES
13-tree 4b825dc642cb6eb9a060e54bf8d69288fbee4904
14-author SVN Migration <svn@php.net> 923508610 +0000
15-
16:    Standard project directories initialized by cvs2svn.
17-```
18-
19-The author is a robot. The message is a robot's. And that tree — `4b825dc642...` — is a famous
20-object: it is the hash of the empty tree, the name git gives to nothing at all. You can mint it
21:yourself from `/dev/null`. [R1] The first commit of PHP contains zero bytes of PHP. A conversion
22-tool, marching CVS into Subversion years after the fact, needed a place to hang "standard project
23-directories," and git — which does not store empty directories — faithfully preserved the result:
24-a genesis with no world in it.
25-
26-## The robot's title card
27-
28:The rest of PHP's first morning has the same handwriting. The robot's empty root is timestamped
29-18:10:10 on 7 April 1999. The next commit — Andi Gutmans importing the entire Zend engine,
30-thousands of lines — is timestamped 18:10:10. The same second. [R1] No human commits a world in
31-the same second as an empty directory; a converter's clock does. Eight minutes later, the
32:inventor of PHP makes his first appearance in his own language's history. Rasmus Lerdorf's first
33-recorded act, in full:
34-
35-```console
--
44-record adding whitespace, under a message the tooling wrote for him because he didn't leave one.
45-PHP itself was years old by then — none of that life is here.
46-
47:The founding is one repository over, or in a tarball, or gone. What this git remembers begins the
48-morning two people imported a rewrite.
49-
50:Python's is subtler, and I like it more, because it looks so plausible. Every history of the
51-language repeats the date: Guido van Rossum, 9 August 1990, `Initial revision`. And there it is
52-at the top of the log, exactly as advertised. [R3] Now look one commit down. The second commit,
53-a month later, with a different message — `Warning about incompleteness.` — has the *identical
--
67-confesses the whole journey in one line — `HG:extra convert_revision:svn%3A...` — a git commit
68-carrying a Mercurial header that quotes a Subversion path. [R5] Three version control systems
69-deep, and at the bottom of the shaft, a title card. The repository contains 178 commits whose
70:subject is exactly `Initial revision`. [R4] They are not initial. They are not revisions. They
71-are the stamp a machine put on paperwork it could not read.
72-
73:~ The date on a famous first commit is a title card, typed by whoever did the last conversion.
74-
75-## The cut
76-
77-The other way a genesis goes missing is that a human decides it should, and the largest software
78:project on earth has its decision in writing. The Linux kernel's first commit is folklore —
79-`1da177e4c3f4` — but almost nobody reads past the version number in its subject. The message:
80-
81-```console
82-$ git log -1 --format='%B' 1da177e4c3f4
83-Linux-2.6.12-rc2
84-
85:Initial git repository build. I'm not bothering with the full history,
86-even though we have it. ...
87-Let it rip!
88-```
89-
90-[R6] Sit in his April for a second, because the decision is more reasonable than it reads.
91-It is 2005. BitKeeper is gone; git is nine days old, a hand tool with no porcelain — we watched
92:it being built one chapter ago. He has fourteen years of Linux history, 1991 to 2005, sitting
93-right there — *even though we have it* — and importing it means asking his newborn, unproven tool
94-to swallow 3.2GB before anyone has written the infrastructure that would make that bearable. So
95-he weighs the whole recorded past of the world's most important open project against the next
96-Saturday afternoon of usable tooling, cuts, and says so in the commit. The first object in what
97:is now a 1.4-million-commit history is 17,291 files arriving from nowhere, 6.7 million lines with
98:no past. It is the most honest first commit in this chapter: a cut that tells you it is a cut,
99-and then — *Let it rip!* — drives off.
100-
101-Most cuts don't announce themselves; you have to read for the seams. Redis's day one is
102-timestamped 10:30:00, on a Sunday — zero seconds, the first seam. The tree it delivers says the
103-rest: the license reads `Copyright (c) 2006-2009` — three years older than the repository — and
104-the source declares `REDIS_VERSION "0.07"`. [R11] Version 0.07 of a thing does not appear in a
105:first commit; it appears when a private project is carried into the light, its adolescence edited
106-out. The author, it turns out, is a connoisseur of the form: sixteen years later, starting a new
107:phase of his life with the project, antirez minted himself *another* root, a 2025 parentless
108:commit titled `First internal release.` [R12] Genesis, for him, is not an event. It is a genre.
109-
110-Bitcoin's cut is a postcard with the wrong signature. Day one is 30 August 2009 — the network it
111-implements had been mining since January —
--
113-and the hand that types `First commit` belongs to a handle, `sirius-m`, that matches nothing in
114-the tree it imports: the readme inside announces `BitCoin v0.1.5 ALPHA / Copyright (c) 2009
115-Satoshi Nakamoto`. [R9, R10] Eight months of the founder's shipped work arrive as somebody
116:else's day one — and they arrive twice. The import ran two ways, and the history keeps twin
117:roots: same subject, identical trees, two different hashes, sitting side by side like a document
118-notarized by two clerks. [R9] Satoshi's January keystrokes are in neither.
119-
120-~ Day one of a clone is wherever the importer happened to be standing.
--
138-tree that lands in "r1" is already a shipping game: 129,220 lines, fourteen languages, a readme
139-declaring `Release version: 0.3.3`, a keyword timestamp frozen two weeks before the crash. [R13]
140-Everything this book would most want to watch happened in a repository that no longer exists.
141:The first commit is a funeral, and the funeral is the founding.
142-
143-## The accident
144-
145-Back to the kernel, because the cut Linus made in 2005 turns out not to be the strangest thing
146-about its origins. Ask the honest question — not `log --reverse`, but *how many parentless
147:commits does this history contain*:
148-
149-```console
150-$ git log --max-parents=0 --format='%aI %an %s' origin/master
--
169-Picture his Tuesday. He needs his work based on the GPIO maintainer's latest tree, so, standing
170-on his scratch branch, he merges that tree into it — unrelated histories, sure, but the merge
171-does what he needs and the patches get where they are going. Then the GPIO work is integrated
172:upstream, and the scratch root rides along into the mainline kernel. The README file itself is
173-long gone from the tip. The commit is not, and can never be: it is an ancestor of `master`,
174-permanently. [R7, R8]
175-
--
178-
179-Nobody decided that. No one would. A merge of unrelated histories doesn't feel like an act of
180-cosmology when you run it — it feels like Tuesday — but `--max-parents=0` does not forget, and
181:now the kernel's book of Genesis has four first pages, one of which is a note a man left for
182-himself.
183-
184-## The control case
185-
186-There is one repository left to ask, and it is the one none of these tricks could reach: the tool
187:itself could not have a history before it existed. Git's repository begins with git's own birth —
188-eleven files, written in an afternoon we have already sat through, committed with the two-hour-old
189-tool they implement, by the man who typed them. [R14] Its subject line:
190-
--
202-Ask your own repository the honest question: `git log --max-parents=0 --all`. You may believe you
203-know the answer. If a subtree was ever squashed in, a fork absorbed, a scratch repo merged on
204-some forgotten Tuesday, you have more geneses than you think, and each one is a story. And when
205:you meet a famous "first commit," read it the way an archivist reads a document — not "what does
206-it say" but "who made this copy, and what did they leave out." The seams are always the same:
207-a clock too round, an author too robotic, a copyright older than the repository, a version number
208:north of 0.1, a file that contradicts its own date. None of this makes the history worthless. It
209-makes it a document with a provenance.
210-
211-~ Day one of the clone is day one of the container.
--
215-
216-## Receipts
217-
218:- **R1** `git -C repos/php log --reverse | head -4` + `cat-file -p f70a4db647` + `hash-object -t tree /dev/null` — robot root at the empty tree `4b825dc642...`; Andi Gutmans's Zend import at the identical second 18:10:10.
219-- **R2** `git -C repos/php show a6043d3e1e` — Rasmus Lerdorf's first mark: one blank line, "*** empty log message ***".
220-- **R3** `git -C repos/cpython log --reverse | head -3` + `rev-parse 7f777ed95a^{tree} 3310257195^{tree}` — first two commits, different dates, identical tree.
221-- **R4** `git -C repos/cpython show 7f777ed95a:Doc/README | tail -2` — "--Guido (last modified 10 Sep 90)" inside the 9 Aug commit; 178 subjects exactly `Initial revision`.
222-- **R5** `git -C repos/cpython cat-file -p 7f777ed95a | head -6` — `HG:extra convert_revision:svn%3A...`: an hg header quoting an svn path inside a git object.
223:- **R6** `git -C repos/linux log -1 --format='%B' 1da177e4c3f4` + `diff-tree --root --shortstat` — "I'm not bothering with the full history, even though we have it. ... Let it rip!"; 17,291 files, 6,718,755 insertions.
224:- **R7** `git -C repos/linux log --max-parents=0 origin/master` + `show a101ad9451:README.md` — four roots; the 2016 root is "# linux-upstream / This is for sharing upstreaming activities" (ldewangan@nvidia.com).
225-- **R8** `merge-base --is-ancestor a101ad9451 origin/master` (yes) + `cat-file -e origin/master:README.md` (gone) — the genesis is permanent; the file is not.
226-- **R9** `git -C repos/bitcoin show -s 4405b78d60 e071a3f6c0` + `rev-parse ...^{tree}` — "First commit" twice: same tree, two hashes, one with a `git-svn-id` trailer; author `sirius-m`.
227-- **R10** `git -C repos/bitcoin show 4405b78d60:readme.txt | head -3` — "BitCoin v0.1.5 ALPHA / Copyright (c) 2009 Satoshi Nakamoto".
228-- **R11** `git -C repos/redis log --reverse | head -1` + `show ed9b544e10:COPYING | head -1` + `grep REDIS_VERSION` — 10:30:00 sharp; "Copyright (c) 2006-2009"; `REDIS_VERSION "0.07"`.
229:- **R12** `git -C repos/redis log --max-parents=0 --all` — four roots, including antirez's 2025 `First internal release.`
230:- **R13** `git -C repos/openttd log --reverse | head -1` + `diff-tree --root --shortstat efaeb275f7` + `show efaeb275f7:readme.txt | head -3` — "(svn r1) Import of revision 975 of old (crashed) SVN"; 129,220 lines; "Release version: 0.3.3".
231-- **R14** `git -C repos/git log --reverse | head -1` — `e83c516331`, "Initial revision of 'git', the information manager from hell": the control case.
232-
233-*Full transcripts: `chapters/06-genesis.receipts.md` (regenerate with `scripts/receipts-06.sh`).*

exec
/bin/bash -lc "awk '/"'^## Receipts/{exit} {print}'"' chapters/22-curl.fable.md | perl -0777 -pe 's/<"'!--.*?-->//sg'"' | wc -w
awk '/"'^## Receipts/{exit} {print}'"' chapters/22-curl.fable.md | grep -v '"'^<!--'"' | wc -w" in /home/diablo/book16
 succeeded in 222ms:
1772
1804

codex
Factual gate: **fail, but narrowly fixable**. All six console panels match the receipts byte-for-byte, including both long `awk` commands; no output lines were dropped or altered. The arithmetic also passes: the other 1,506 authors account for 18,896 commits, so Stenberg’s 20,578 exceeds them by 1,682 and equals 52.1305%.

## Must-fix gates

1. **Correct the cleanup interval.**

   [Line 68](/home/diablo/book16/chapters/22-curl.fable.md:68): “Twelve days into the new year” is false for January 10. Twelve days is the delay after the December 29 root.

   Fix: “Twelve days later, the ballast goes back over the side.”

   The crash interval elsewhere is correct: November 23 to December 29 is 36 days, reasonably rendered as “five weeks.”

2. **Make quoted text literal.**

   Several quotation marks contain capitalization or punctuation absent from the receipts:

   - [Line 63](/home/diablo/book16/chapters/22-curl.fable.md:63): move the comma outside `"this CVS server"`.
   - [Line 89](/home/diablo/book16/chapters/22-curl.fable.md:89): `"Removed junk files."` should be the exact subject, preferably: “The subject is blunt: `removed junk files`.”
   - [Line 118](/home/diablo/book16/chapters/22-curl.fable.md:118): use `"Adjusted it slightly"`, preserving the receipt’s capital A and omitting the invented full stop.
   - [Line 179](/home/diablo/book16/chapters/22-curl.fable.md:179): move the comma outside `"good old trust-worthy source disk"`.

3. **Use the receipt’s attribution vocabulary; stop calling Stenberg the founder.**

   The receipts establish Rafael Sagula as the person who “started all this” and Stenberg as the new maintainer. They do not establish the narrower external claim that Stenberg founded curl proper.

   Change all three:

   - [Line 161](/home/diablo/book16/chapters/22-curl.fable.md:161): “out-committed the founder” → “out-authored Stenberg”
   - [Line 165](/home/diablo/book16/chapters/22-curl.fable.md:165): “The founder’s name” → “Stenberg’s name”
   - [Line 181](/home/diablo/book16/chapters/22-curl.fable.md:181): “the founder’s instinct” → “his instinct” or “the maintainer’s instinct”

   Also change [lines 145–146](/home/diablo/book16/chapters/22-curl.fable.md:145): “1,507 different people, of which Stenberg wrote” → “1,507 mailmapped authors; Stenberg authored.” That is exactly what `shortlog` measures.

4. **Do not present annual contribution leadership as a handover.**

   [Lines 161–168](/home/diablo/book16/chapters/22-curl.fable.md:161) exceed R10. It proves six annual author-count leaders, not a change of maintainer, project health, or succession. The 2026 figure is also only through the August 18 pin.

   Replace the conclusion with something like:

   > These rows do not show a handover. They show that Stenberg did not lead the author count in those years. At the August 18 pin, Szakats leads 2025 and the partial 2026 count, while Stenberg authored the tip. That is evidence of work distributing—and room for succession—not succession itself.

   Remove “succession in a healthy project” and the Vim comparison. The latter makes a P.S. chapter depend on another chapter while pulling curl into Vim’s elegy/succession register.

5. **Fix or cut the decade claim.**

   [Line 147](/home/diablo/book16/chapters/22-curl.fable.md:147) says “every one” and then lists only the 2000s, 2010s, and 2020s. R9 also contains the 1990s.

   Either add “the 1990s” or, preferably for concision, cut the decade sentence entirely. The lifetime total and six exception years already establish the pattern.

6. **Clear the external-claim gate.**

   There is exactly one CHECK marker, at [lines 175–177](/home/diablo/book16/chapters/22-curl.fable.md:175). Its scope is adequate for the adjacent claims about operating systems, cars, televisions, phones, and billions of installations. It still needs a precise source and `VERIFIED` replacement before publication.

   Other unsupported external generalizations lack markers:

   - [Line 10](/home/diablo/book16/chapters/22-curl.fable.md:10): “practically everything with a network plug” — cut it; the sourced consequence arrives later.
   - [Line 29](/home/diablo/book16/chapters/22-curl.fable.md:29): “files every tutorial tells you never to commit” → “files I would normally keep out of a repository.”
   - [Lines 191–198](/home/diablo/book16/chapters/22-curl.fable.md:191): “every one … almost never … usually” makes unreceipted universal claims. Use “can be,” “may not,” and “look for a nearby sentence.”

   Put the CHECK comment on its own single line; its present inline, multiline form defeats the documented comment-excluding word counter.

7. **Separate evidence from reconstruction at the near-loss beat.**

   [Lines 178–182](/home/diablo/book16/chapters/22-curl.fable.md:178) say curl’s physical home “was one” disk and that Stenberg committed “everything he still had.” Neither is established; the quoted entry expressly identifies other copies.

   Fix toward:

   > One physical home of that future was the “good old trust-worthy source disk,” and it died. The CVS server and scattered backups are why the project survived. Thirty-six days later, the root preserved a working tree whole enough to include its tarball, patches, build residue, and executable.

   Likewise, in [lines 62–66](/home/diablo/book16/chapters/22-curl.fable.md:62), “the sequence makes the root read as a recovery snapshot” is more defensible than omnisciently narrating him “gathering everything.”

8. **Resolve the word-count rule.**

   The TEMPLATE command gives **1,804 words**; stripping the CHECK comment gives **1,772 reader-visible words**. That is 428 below the stated 2,200 minimum, although it satisfies CONTEXT’s conflicting ≤2,000 default.

   Do not pad the statistics. If 2,200 is hard, grow in two places:

   - Use R3 to show that `CHANGES` opens with December 27–28 work and the root follows on December 29: this was an active working tree, not a cold archive.
   - After verifying the CHECK, make the real-world consequence concrete rather than merely saying “billions.”

   If concision governs P.S. chapters, explicitly waive the lower bound; this draft is not intrinsically too short.

## Optional suggestions

- Keep the cold open. “The first commit of curl contains a copy of curl” is cute, but the `src/curl` executable earns it immediately. It also produces the right pre-reveal sensation: the reader sees the shovel-load before the crash names it.

- Keep the title. “This major disk crash” initially sounds like the disaster and ends up naming the survival mechanism. It flips.

- “The other endpoint” currently becomes a statistics tour. Drop the first R8 panel—the root has already been shown—and probably R9. Keep the pinned tip, lifetime split, and carefully qualified R10 exceptions.

- The strongest plot is already present: anomalous root → crash sentence → pre-Git ancestry → same maintainer at the tip → work spreading without a declared handover → what redundancy preserved. The prose is opinionated without sneering, and the crash reveal lands at the right beat.
tokens used
78,220
Factual gate: **fail, but narrowly fixable**. All six console panels match the receipts byte-for-byte, including both long `awk` commands; no output lines were dropped or altered. The arithmetic also passes: the other 1,506 authors account for 18,896 commits, so Stenberg’s 20,578 exceeds them by 1,682 and equals 52.1305%.

## Must-fix gates

1. **Correct the cleanup interval.**

   [Line 68](/home/diablo/book16/chapters/22-curl.fable.md:68): “Twelve days into the new year” is false for January 10. Twelve days is the delay after the December 29 root.

   Fix: “Twelve days later, the ballast goes back over the side.”

   The crash interval elsewhere is correct: November 23 to December 29 is 36 days, reasonably rendered as “five weeks.”

2. **Make quoted text literal.**

   Several quotation marks contain capitalization or punctuation absent from the receipts:

   - [Line 63](/home/diablo/book16/chapters/22-curl.fable.md:63): move the comma outside `"this CVS server"`.
   - [Line 89](/home/diablo/book16/chapters/22-curl.fable.md:89): `"Removed junk files."` should be the exact subject, preferably: “The subject is blunt: `removed junk files`.”
   - [Line 118](/home/diablo/book16/chapters/22-curl.fable.md:118): use `"Adjusted it slightly"`, preserving the receipt’s capital A and omitting the invented full stop.
   - [Line 179](/home/diablo/book16/chapters/22-curl.fable.md:179): move the comma outside `"good old trust-worthy source disk"`.

3. **Use the receipt’s attribution vocabulary; stop calling Stenberg the founder.**

   The receipts establish Rafael Sagula as the person who “started all this” and Stenberg as the new maintainer. They do not establish the narrower external claim that Stenberg founded curl proper.

   Change all three:

   - [Line 161](/home/diablo/book16/chapters/22-curl.fable.md:161): “out-committed the founder” → “out-authored Stenberg”
   - [Line 165](/home/diablo/book16/chapters/22-curl.fable.md:165): “The founder’s name” → “Stenberg’s name”
   - [Line 181](/home/diablo/book16/chapters/22-curl.fable.md:181): “the founder’s instinct” → “his instinct” or “the maintainer’s instinct”

   Also change [lines 145–146](/home/diablo/book16/chapters/22-curl.fable.md:145): “1,507 different people, of which Stenberg wrote” → “1,507 mailmapped authors; Stenberg authored.” That is exactly what `shortlog` measures.

4. **Do not present annual contribution leadership as a handover.**

   [Lines 161–168](/home/diablo/book16/chapters/22-curl.fable.md:161) exceed R10. It proves six annual author-count leaders, not a change of maintainer, project health, or succession. The 2026 figure is also only through the August 18 pin.

   Replace the conclusion with something like:

   > These rows do not show a handover. They show that Stenberg did not lead the author count in those years. At the August 18 pin, Szakats leads 2025 and the partial 2026 count, while Stenberg authored the tip. That is evidence of work distributing—and room for succession—not succession itself.

   Remove “succession in a healthy project” and the Vim comparison. The latter makes a P.S. chapter depend on another chapter while pulling curl into Vim’s elegy/succession register.

5. **Fix or cut the decade claim.**

   [Line 147](/home/diablo/book16/chapters/22-curl.fable.md:147) says “every one” and then lists only the 2000s, 2010s, and 2020s. R9 also contains the 1990s.

   Either add “the 1990s” or, preferably for concision, cut the decade sentence entirely. The lifetime total and six exception years already establish the pattern.

6. **Clear the external-claim gate.**

   There is exactly one CHECK marker, at [lines 175–177](/home/diablo/book16/chapters/22-curl.fable.md:175). Its scope is adequate for the adjacent claims about operating systems, cars, televisions, phones, and billions of installations. It still needs a precise source and `VERIFIED` replacement before publication.

   Other unsupported external generalizations lack markers:

   - [Line 10](/home/diablo/book16/chapters/22-curl.fable.md:10): “practically everything with a network plug” — cut it; the sourced consequence arrives later.
   - [Line 29](/home/diablo/book16/chapters/22-curl.fable.md:29): “files every tutorial tells you never to commit” → “files I would normally keep out of a repository.”
   - [Lines 191–198](/home/diablo/book16/chapters/22-curl.fable.md:191): “every one … almost never … usually” makes unreceipted universal claims. Use “can be,” “may not,” and “look for a nearby sentence.”

   Put the CHECK comment on its own single line; its present inline, multiline form defeats the documented comment-excluding word counter.

7. **Separate evidence from reconstruction at the near-loss beat.**

   [Lines 178–182](/home/diablo/book16/chapters/22-curl.fable.md:178) say curl’s physical home “was one” disk and that Stenberg committed “everything he still had.” Neither is established; the quoted entry expressly identifies other copies.

   Fix toward:

   > One physical home of that future was the “good old trust-worthy source disk,” and it died. The CVS server and scattered backups are why the project survived. Thirty-six days later, the root preserved a working tree whole enough to include its tarball, patches, build residue, and executable.

   Likewise, in [lines 62–66](/home/diablo/book16/chapters/22-curl.fable.md:62), “the sequence makes the root read as a recovery snapshot” is more defensible than omnisciently narrating him “gathering everything.”

8. **Resolve the word-count rule.**

   The TEMPLATE command gives **1,804 words**; stripping the CHECK comment gives **1,772 reader-visible words**. That is 428 below the stated 2,200 minimum, although it satisfies CONTEXT’s conflicting ≤2,000 default.

   Do not pad the statistics. If 2,200 is hard, grow in two places:

   - Use R3 to show that `CHANGES` opens with December 27–28 work and the root follows on December 29: this was an active working tree, not a cold archive.
   - After verifying the CHECK, make the real-world consequence concrete rather than merely saying “billions.”

   If concision governs P.S. chapters, explicitly waive the lower bound; this draft is not intrinsically too short.

## Optional suggestions

- Keep the cold open. “The first commit of curl contains a copy of curl” is cute, but the `src/curl` executable earns it immediately. It also produces the right pre-reveal sensation: the reader sees the shovel-load before the crash names it.

- Keep the title. “This major disk crash” initially sounds like the disaster and ends up naming the survival mechanism. It flips.

- “The other endpoint” currently becomes a statistics tour. Drop the first R8 panel—the root has already been shown—and probably R9. Keep the pinned tip, lifetime split, and carefully qualified R10 exceptions.

- The strongest plot is already present: anomalous root → crash sentence → pre-Git ancestry → same maintainer at the tip → work spreading without a declared handover → what redundancy preserved. The prose is opinionated without sneering, and the crash reveal lands at the right beat.
