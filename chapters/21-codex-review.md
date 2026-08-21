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
session id: 01a02632-64b9-7ec2-ae88-353905cdb292
--------
user
You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
is an engineer who runs git blame daily; first person, opinionated, no sneering; the reader should
feel a reveal a beat before it's named.

READ: chapters/21-iojs.fable.md, chapters/21-iojs.receipts.md, plus CONTEXT.md and TEMPLATE.md.
Context: NEW P.S.-candidate chapter (source 21), the Node/io.js fork war told from repository
evidence. The published book runs xz / debian-openssl / t2t / dual-ec / postgres / php / npm /
vim; the DEMOTED "Remove promises" chapter used this same repo — this chapter must share nothing
with it beyond the clone. The book also has an ffmpeg fork-war chapter in P.S. — judge whether
this one is distinct (governance rupture + reunification-by-document vs ffmpeg's hostile-merge
war). Calibration: a professional-SDE reader scores concision and real-world consequence hardest;
one plot, no catalog.

Spine (verified, LOCKED to receipts): origin/archived-io.js-v0.10 holds 16 commits reachable from
no other ref; f60abb0c 2014-10-01 Mikeal Rogers (committed by isaacs, node-forward/node PR #1)
drafts governance — TC roster, "No more than 30% of the TC membership can be affiliated with the
same employer," invitations not accepted incl. TJ Fontaine; e7dec60a 2014-10-29 "Said public when
I meant private." fixes one word in doc/tc-meetings/2014-10-29.md whose text includes "four
weeks" up November 8th, "remind Joyent," and "'soft' fork and not a 'hard' fork"; 51514c8e
2014-12-01 README becomes "io.js … began as a GitHub fork of joyent/node … open governance
model"; f17f473a 2015-01-08 Ben Noordhuis renames the binary node→iojs; a69ab27a 2015-08-13
cjihrig renames back "based on the recent convergence" (96 files, 2162+/2187-, adds iojs→node
symlink); 8a9a3bf7 Rod Vagg imports the io.js v3.3.0 changelog ("cherry-picked from v3.x @
1a6e52db30"), ancestor of v4.0.0; v3.3.0 is NOT an ancestor of v4.0.0 (divergence 151 vs 209
from base a020d9a5); v4.0.0's CHANGELOG declares itself "relative to the last io.js v3.x branch
release, v3.3.0."

FACTUAL GATE (one flag gates): every hash, date, name, quote, count, and console line in prose
must appear in chapters/21-iojs.receipts.md — console fences must be reproduce-true (verify every
sed range against the receipts' outputs; the draft uses some custom format strings — a reader
running the printed command must get exactly the printed lines). CRITICAL: the draft must NOT
claim v4.0.0 is git-parented on or descended from v3.3.0 — the receipts prove the opposite; the
supported claim is changelog-baseline continuity ("declared, not merged"). Verify the draft keeps
that distinction everywhere, including the receipts list. List every <!-- CHECK: --> marker
(Joyent/TJ Fontaine context; io.js 1.x-3.x release timeline; convergence/Foundation outcome) and
judge necessity and scope.

Craft risks to judge hard: (1) does the war hold as ONE plot (rehearsal → four weeks → io.js →
homecoming → seam), or does the middle read as a tour? (2) the seam section is the chapter's
thesis ("continuity is editorial, not ancestral") — is it earned and legible to a reader who has
never heard of io.js? (3) no-sneering: is Joyent treated fairly (the record only shows the
rebels' side — does the prose acknowledge that)? (4) title "Said public when I meant private" —
flips? (5) distinctness from the ffmpeg fork chapter and the demoted node chapter. (6) body word
count vs the 2,200-3,200 band — where to cut or grow?

Output: a numbered gate list (must-fix), then optional suggestions. Be specific — quote the
line, say the fix.
warning: Codex could not find bubblewrap on PATH. Install bubblewrap with your OS package manager. See the sandbox prerequisites: https://developers.openai.com/codex/concepts/sandboxing#prerequisites. Codex will use the bundled bubblewrap in the meantime.
codex
I’ll audit the chapter against the receipts line by line, including reproducibility of every console fence. I’ll also read the book context/template before judging structure, voice, and distinctness.
exec
/bin/bash -lc "wc -l -w CONTEXT.md TEMPLATE.md chapters/21-iojs.fable.md chapters/21-iojs.receipts.md && sed -n '1,240p' CONTEXT.md && sed -n '1,260p' TEMPLATE.md" in /home/diablo/book16
 succeeded in 207ms:
   94  1000 CONTEXT.md
   22   225 TEMPLATE.md
  256  2511 chapters/21-iojs.fable.md
  485  2634 chapters/21-iojs.receipts.md
  857  6370 total
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

exec
/bin/bash -lc "nl -ba chapters/21-iojs.fable.md && sed -n '1,260p' chapters/21-iojs.receipts.md" in /home/diablo/book16
 succeeded in 218ms:
     1	# Said public when I meant private
     2	
     3	*This is the full dig — every command, every receipt. The plain-English telling of the same story
     4	is here: [Said public when I meant private](21-iojs.html).*
     5	
     6	Every repository you clone carries branches you never look at, and most of them are noise —
     7	abandoned experiments, stale release lines. But in the official Node.js repository there is a
     8	remote branch called `archived-io.js-v0.10`, and it holds sixteen commits that are reachable from
     9	nowhere else in the project [R1]. Not from `main`, not from any release. Sixteen commits, stranded
    10	on a shelf, and the last of them — October 29th, 2014, by a developer named Mikeal Rogers — has
    11	this subject line [R3]:
    12	
    13	```console
    14	$ git -C repos/node show -s --no-mailmap --format='%H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' e7dec60a63b9171465fd4037a04aeb709198aea2
    15	e7dec60a63b9171465fd4037a04aeb709198aea2
    16	parents 2c7847b3228b40aab8ea4902109639725eb0d8c3
    17	Author: 2014-10-29T17:30:17-07:00 Mikeal Rogers <mikeal.rogers@gmail.com>
    18	Committer: 2014-10-29T17:30:17-07:00 Mikeal Rogers <mikeal.rogers@gmail.com>
    19	
    20	Said public when I meant private.
    21	```
    22	
    23	The change itself is one word, in a set of meeting minutes [R3]:
    24	
    25	```console
    26	$ git -C repos/node show --format='' --no-ext-diff e7dec60a63b9171465fd4037a04aeb709198aea2 -- doc/tc-meetings/2014-10-29.md
    27	diff --git a/doc/tc-meetings/2014-10-29.md b/doc/tc-meetings/2014-10-29.md
    28	index 0fa77502743..ce64c62ddb0 100644
    29	--- a/doc/tc-meetings/2014-10-29.md
    30	+++ b/doc/tc-meetings/2014-10-29.md
    31	@@ -13,7 +13,7 @@
    32	 * Update on "release buckets"
    33	  * doesn't make sense while we're private, we'll wait until it is public again
    34	 * `node-forward/node` going public
    35	- * when we made the repo public it was messaged as only being for "four weeks"
    36	+ * when we made the repo private it was messaged as only being for "four weeks"
    37	```
    38	
    39	A typo fix. *Public* should have read *private*. It is the most mundane commit imaginable — and it
    40	is also a confession, because the sentence being corrected is about a secret. In the autumn of
    41	2014, the future of Node.js was being planned in a **private repository**, on a clock, by people
    42	rehearsing a revolution. The stranded branch is the war room, accidentally preserved, and the
    43	typo-fix is my favorite kind of receipt: nobody writing "Said public when I meant private" thinks
    44	they are writing history. This chapter is that war, told entirely from what the ledger kept.
    45	
    46	## The rehearsal
    47	
    48	Node.js in 2014 was the most important young platform on the server, and it did not belong to its
    49	contributors — the project was stewarded by a company, Joyent, and the frustration of the people
    50	doing the daily work had been building for years. <!-- CHECK: Node.js was corporately stewarded by
    51	Joyent in 2014; TJ Fontaine was Joyent's Node.js project lead at the time; community frustration
    52	over release cadence and governance drove the fork; needs external source. --> You do not need the
    53	press coverage, though, because the first commit on the stranded branch *is* the plan. October
    54	1st, 2014: Mikeal Rogers drafts "a new contribution policy" — not for `joyent/node`, but for a
    55	repository called `node-forward/node` [R2]. The diff methodically rewrites the contributing
    56	guide's pointers away from `joyent/node` to `node-forward/node`, and then adds a whole section
    57	that had never existed in Node before, titled **Governance** [R2]:
    58	
    59	```console
    60	$ git -C repos/node show --format='' --no-ext-diff f60abb0ced54f5ba08d324e62ad3fbb306ba37f7 -- CONTRIBUTING.md | sed -n '5,11p'
    61	@@ -6,13 +6,13 @@ through the process.
    62	 
    63	 ### FORK
    64	 
    65	-Fork the project [on GitHub](https://github.com/joyent/node) and check out
    66	+Fork the project [on GitHub](https://github.com/node-forward/node) and check out
    67	 your copy.
    68	```
    69	
    70	The new governance text names a technical committee — Fedor Indutny, Trevor Norris, Ben
    71	Noordhuis, Isaac Z. Schlueter, Nathan Rajlich, Bert Belder — the core of Node's actual working
    72	contributors [R2]. It records, with careful diplomacy, that invitations were also extended to two
    73	people "who have not accepted but are still invited to participate": one of them TJ Fontaine, the
    74	man running the official project at Joyent [R2]. And it writes down one rule that tells you
    75	exactly what wound this document was written around: *"No more than 30% of the TC membership can
    76	be affiliated with the same employer."* [R2] Nobody writes that sentence in the abstract. You
    77	write it about a specific employer.
    78	
    79	So: a parallel repository, a constitution, a committee of the people with their hands on the
    80	code, and an empty chair left for the official lead. That is not a fork yet. That is a rehearsal
    81	for one.
    82	
    83	## Four weeks
    84	
    85	The minutes on the stranded branch — yes, they committed their meeting minutes, which is why any
    86	of this is knowable — put a clock on it. Here is the section Mikeal's typo-fix was correcting,
    87	read in full from the fixed file [R3]:
    88	
    89	```console
    90	$ git -C repos/node show e7dec60a63b9171465fd4037a04aeb709198aea2:doc/tc-meetings/2014-10-29.md | sed -n '13,24p'
    91	* Update on "release buckets"
    92	 * doesn't make sense while we're private, we'll wait until it is public again
    93	* `node-forward/node` going public
    94	 * when we made the repo private it was messaged as only being for "four weeks"
    95	 * "four weeks" is up on November 8th
    96	 * someone on the Advisory Board needs to remind Joyent of this in the
    97	   next advisory board meeting so they aren't suprised by it even though
    98	   it was communicated to them when it was first made public.
    99	 * @mikeal will work on the messaging in the README to make it clear this is
   100	   a "soft" fork and not a "hard" fork.
   101	 * ramifications of going public will be discussed in next week's TC meeting as
   102	   well
   103	```
   104	
   105	Read it slowly, because every line is load-bearing. The repo is private, but only "for four
   106	weeks," and the four weeks are up on November 8th. Someone needs to *remind Joyent* — the company
   107	that owns the project — so the company isn't surprised by its own community going public. And the
   108	last worry is about *messaging*: make clear this is a "soft" fork, not a "hard" fork. They are
   109	holding a loaded fork and drafting the press release that says it isn't one. There is no sneering
   110	available here; read the room. These are people who built the platform, trying to change how it is
   111	governed with the least possible violence, and keeping minutes of it — in the project's own file
   112	format, committed like code, because committing things like code was the only way they knew how
   113	to be.
   114	
   115	## io.js
   116	
   117	The soft fork went public with a new name. On December 1st, 2014, Mikeal rewrites the README's
   118	first lines; the file that had opened with Node's original one-line description now opens [R4]:
   119	
   120	```console
   121	$ git -C repos/node show 51514c8e8cbd98be7f29c3f1508b625d16e91b5d:README.md | sed -n '1,9p'
   122	io.js
   123	===
   124	
   125	This repository began as a GitHub fork of
   126	[joyent/node](https://github.com/joyent/node) where contributions,
   127	releases, and contributorship are under an
   128	[open governance model](./CONTRIBUTING.md#governance).
   129	
   130	We intend to release, with increasing regularity, releases which are
   131	```
   132	
   133	*This repository began as a GitHub fork of joyent/node.* An origin story in the first sentence,
   134	and a manifesto in the second: *open governance model*, the phrase the whole war was about. Five
   135	weeks later the split reaches the deepest place a fork can reach — the name of the executable
   136	itself. January 8th, 2015, Ben Noordhuis, one of the TC names from the rehearsal [R5]:
   137	
   138	```console
   139	$ git -C repos/node show -s --no-mailmap --format='%aI %an <%ae>%n%s' f17f473af5e28f4ec00a518f97a84b69c426309e
   140	2015-01-08T14:00:43+01:00 Ben Noordhuis <info@bnoordhuis.nl>
   141	build: rename binary from node to iojs
   142	```
   143	
   144	The diff walks through the build system changing `'target_name': 'node'` to `'target_name':
   145	'iojs'`, and the installer from `bin/node` to `bin/iojs` [R5]. When a fork renames its *binary*,
   146	it has stopped being a pressure campaign and become a product. Through the spring of 2015, io.js
   147	shipped that product on its own schedule, under its own version numbers — 1.x, 2.x, 3.x — while
   148	official Node stood at 0.12. <!-- CHECK: io.js shipped independent releases v1.0.0 (Jan 2015)
   149	through v3.3.0 (Sep 2015), on a rapid cadence, while joyent/node remained on 0.10/0.12; needs
   150	external source for the release timeline. -->
   151	
   152	## The homecoming
   153	
   154	And then the war ends the way the minutes always hoped it would — softly. August 13th, 2015, a
   155	commit by cjihrig [R6]:
   156	
   157	```console
   158	$ git -C repos/node show -s --no-mailmap --format='%aI %an <%ae>%n%s%n%n%b' a69ab27ab458385d24676792b75ad1c25b8c30e5 | sed -n '1,5p'
   159	2015-08-13T12:14:34-04:00 cjihrig <cjihrig@gmail.com>
   160	node: rename from io.js to node
   161	
   162	This commit replaces instances of io.js with Node.js, based on the
   163	recent convergence. There are some remaining instances of io.js,
   164	```
   165	
   166	"Based on the recent convergence" — four quiet words for the settlement of the whole conflict:
   167	Joyent ceded the project to a neutral foundation with open governance, and the fork agreed to come
   168	home. <!-- CHECK: the io.js/Node.js convergence of mid-2015 produced the Node.js Foundation, with
   169	Joyent transferring stewardship and io.js merging back; needs external source. --> The diff is the
   170	January rename played backwards — `'target_name': 'iojs'` becomes `'node'` again, `bin/iojs`
   171	becomes `bin/node` — 96 files, 2,162 insertions, 2,187 deletions [R6]. The build system even
   172	gains, in the same file, an `iojs -> node` compatibility symlink [R6]: the fork's name reduced, in
   173	the end, to an alias for the thing it forked.
   174	
   175	## The seam
   176	
   177	So who won? Look at the first release of the reunified project, because the answer is written in
   178	two places that disagree. The release was called Node.js **v4.0.0** — not 0.13, not 1.0. Its
   179	changelog opens like this [R10]:
   180	
   181	```console
   182	$ git -C repos/node show 'v4.0.0^{}:CHANGELOG.md' | sed -n '1,7p'
   183	# Node.js ChangeLog
   184	
   185	## 2015-09-08, Version 4.0.0 (Stable), @rvagg
   186	
   187	### Notable changes
   188	
   189	This list of changes is relative to the last io.js v3.x branch release, v3.3.0. Please see the list of notable changes in the v3.x, v2.x and v1.x releases for a more complete list of changes from 0.12.x. Note, that some changes in the v3.x series as well as major breaking changes in this release constitute changes required for full convergence of the Node.js and io.js projects.
   190	```
   191	
   192	*Relative to the last io.js v3.x branch release.* The written record declares its parent: Node 4
   193	is io.js 3.3, continued. Even the version number concedes it — 4 comes after 3 because io.js had
   194	spent 1, 2, and 3. The rebels' release line became the official one, and the reunified project
   195	counts from the fork's numbers to this day.
   196	
   197	But now ask *git* the same question, and hold on [R9]:
   198	
   199	```console
   200	$ git -C repos/node merge-base --is-ancestor 'v3.3.0^{}' 'v4.0.0^{}'; echo $?
   201	1
   202	$ git -C repos/node rev-list --left-right --count 'v3.3.0^{}...v4.0.0^{}'
   203	151	209
   204	```
   205	
   206	io.js v3.3.0 is *not* an ancestor of Node v4.0.0. The two tagged commits sit on lines that had
   207	already diverged — 151 commits on one side, 209 on the other, from a common base [R9]. The v4
   208	line did not grow out of the v3.3.0 release commit; it grew beside it, and the connection was
   209	stitched with documents: Rod Vagg cherry-picked the io.js v3.3.0 changelog entry onto the v4
   210	line as its own commit — "cherry-picked from v3.x @ 1a6e52db30," says the message [R7] — so that
   211	the new project's release record would *read* as continuous even where the graph is not.
   212	
   213	That seam is the true shape of the reunification, and it is the reveal I want you to carry out of
   214	this chapter. The continuity of a project is a story told in its documents — its changelogs,
   215	its version numbers, its READMEs — and the story can be true in every fact while the commit graph
   216	underneath it says: here, two histories ran side by side, and were declared one. Declared, not
   217	merged. The declaration held, which is why nobody has needed to look underneath it for a decade.
   218	
   219	## What it cost, and what it left
   220	
   221	The io.js war is the rare fork story with no body count: no code lost, no community split that
   222	lasted longer than nine months, and the thing the rebels actually wanted — open governance, a
   223	neutral foundation, releases on the contributors' cadence — became the permanent constitution of
   224	one of the most-used platforms on earth. The evidence of the whole episode now lives in exactly
   225	the artifacts this book is about. A version number that starts at 4 because someone else spent 1
   226	through 3. A changelog whose continuity is editorial, not ancestral. A compatibility symlink
   227	named after a project that no longer exists. And sixteen stranded commits on an archived branch,
   228	where the revolution kept its minutes — including the one where a tired organizer, correcting a
   229	single word, accidentally wrote the whole story's title: *said public when I meant private.*
   230	
   231	## At home
   232	
   233	Two habits, both cheap. First: your repository's remote branches are an archive of every argument
   234	the project survived. Run `git branch -r`, find the ones that look stranded, and ask what they
   235	hold that the main line doesn't: `git rev-list --count <branch> --not origin/main`, then read
   236	those commits. A branch nobody merged and nobody deleted is usually a branch somebody couldn't
   237	bring themselves to do either to — which makes it exactly where the interesting history lives.
   238	Second: when a project claims lineage — "version 4 continues version 3" — check whether the claim
   239	is ancestral or editorial: `git merge-base --is-ancestor v3 v4`. Both kinds of continuity are
   240	legitimate. But they are different claims, and the day you are bisecting across the seam, or
   241	trusting a changelog to enumerate every change, the difference is suddenly yours to discover. The
   242	documents tell you the story the project agreed on. The graph tells you what happened. Read both,
   243	and mind the seam.
   244	
   245	## Receipts
   246	
   247	- **R1** `git -C repos/node branch -r --list '*archived-io.js*'` + `rev-list --count origin/archived-io.js-v0.10 --not origin/main` — the stale branch holds 16 commits reachable from no other ref.
   248	- **R2** `git -C repos/node show ... f60abb0ced54... -- CONTRIBUTING.md` — 2014-10-01, Mikeal Rogers (committed by isaacs, `PR-URL: .../node-forward/node/pull/1`): the governance draft — TC roster, the 30%-same-employer rule, the unaccepted invitations incl. TJ Fontaine.
   249	- **R3** `git -C repos/node show ... e7dec60a63b9...` — 2014-10-29, "Said public when I meant private.": one word, public→private, in `doc/tc-meetings/2014-10-29.md`; the minutes: private "for four weeks," up November 8th, remind Joyent, "'soft' fork and not a 'hard' fork."
   250	- **R4** `git -C repos/node show ... 51514c8e8cbd... -- README.md` — 2014-12-01, Mikeal Rogers (committed by Fedor Indutny): README becomes "io.js … This repository began as a GitHub fork of joyent/node … open governance model."
   251	- **R5** `git -C repos/node show ... f17f473af5e2...` — 2015-01-08, Ben Noordhuis, "build: rename binary from node to iojs": `target_name` and installed binary change to `iojs`.
   252	- **R6** `git -C repos/node show --shortstat ... a69ab27ab458...` — 2015-08-13, cjihrig, "node: rename from io.js to node … based on the recent convergence": 96 files, 2,162 insertions, 2,187 deletions; installer restores `bin/node` and adds the `iojs -> node` symlink.
   253	- **R7** `git -C repos/node show -s ... 8a9a3bf798a3...` — Rod Vagg, "doc: update changelog for io.js v3.3.0," "cherry-picked from v3.x @ 1a6e52db30"; an ancestor of v4.0.0.
   254	- **R8** `for-each-ref` + `show -s` on `v3.3.0` and `v4.0.0` — both annotated tags by Rod Vagg, targets `1a6e52db...` and `f9f83788...`.
   255	- **R9** `merge-base --is-ancestor 'v3.3.0^{}' 'v4.0.0^{}'` (no) + `rev-list --left-right --count` — v3.3.0 is not an ancestor of v4.0.0; the lines diverge 151 vs 209 commits from base `a020d9a5...`.
   256	- **R10** `git -C repos/node show 'v4.0.0^{}:CHANGELOG.md'` — "# Node.js ChangeLog … This list of changes is relative to the last io.js v3.x branch release, v3.3.0 … full convergence of the Node.js and io.js projects."
# Receipts — ch. 21 Node.js / io.js (fork, rename, convergence)

Verbatim outputs against the full nodejs/node clone in `repos/node`.
Regenerate with `scripts/receipts-21.sh`. Outputs are pinned to explicit objects or refs; long outputs are truncated editorially with `sed` or `head`.

## R1 — a stale remote ref alone retains sixteen commits from the private rehearsal
```
$ git -C repos/node branch -r --list '*archived-io.js*'; git -C repos/node for-each-ref refs/remotes/origin/archived-io.js-v0.10 --format='%(objectname) %(refname)'; git -C repos/node branch -r --contains e7dec60a63b9171465fd4037a04aeb709198aea2; printf 'unique_to_archived '; git -C repos/node rev-list --count origin/archived-io.js-v0.10 --not origin/main
  origin/archived-io.js-v0.10
  origin/archived-io.js-v0.12
e7dec60a63b9171465fd4037a04aeb709198aea2 refs/remotes/origin/archived-io.js-v0.10
  origin/archived-io.js-v0.10
unique_to_archived 16
```

```
$ git -C repos/node log --reverse --no-mailmap --format='%H %aI %an <%ae> | %s' origin/archived-io.js-v0.10 --not origin/main -- CONTRIBUTING.md doc/tc-meetings
f60abb0ced54f5ba08d324e62ad3fbb306ba37f7 2014-10-01T13:40:32-07:00 Mikeal Rogers <mikeal.rogers@gmail.com> | First draft of a new contribution policy.
051dc546d6c155de047cbbc07c44e8f905a7a332 2014-10-09T22:17:42-04:00 cjihrig <cjihrig@gmail.com> | node: update links in CONTRIBUTING.md
8c60aaad1442149b639c18b0eec716a7e6cbab7d 2014-10-10T19:29:06-04:00 Jeremiah Senkpiel <fishrock123@rocketmail.com> | node: add aliases to names in CONTRIBUTING.md
7ee5c4efbf07717c37413a26b8bd12605427dc5f 2014-10-09T12:12:20-07:00 Mikeal Rogers <mikeal.rogers@gmail.com> | node: outline invited persons and representatives
cafac11a5033ebe19c4fd44a4f3b108628cfa2d2 2014-10-10T19:34:36-04:00 Jeremiah Senkpiel <fishrock123@rocketmail.com> | node: refine TC percentage rules - CONTRIBUTING.md
3cb5f3db0faccc0caa5c6633aeb91654f2e49f6a 2014-10-09T16:16:49-07:00 Mikeal Rogers <mikeal.rogers@gmail.com> | doc: meeting notes from oct 9th TC meeting
2c7847b3228b40aab8ea4902109639725eb0d8c3 2014-10-29T15:17:56-07:00 Mikeal Rogers <mikeal.rogers@gmail.com> | doc: add TC notes from october 29th
e7dec60a63b9171465fd4037a04aeb709198aea2 2014-10-29T17:30:17-07:00 Mikeal Rogers <mikeal.rogers@gmail.com> | Said public when I meant private.
```

## R2 — 2014-10-01: the stranded branch drafts governance for node-forward/node
```
$ git -C repos/node show -s --no-mailmap --format='%H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' f60abb0ced54f5ba08d324e62ad3fbb306ba37f7
f60abb0ced54f5ba08d324e62ad3fbb306ba37f7
parents 25702abc5638bbecffa92e8349d2a871a5f592c9
Author: 2014-10-01T13:40:32-07:00 Mikeal Rogers <mikeal.rogers@gmail.com>
Committer: 2014-10-08T14:30:12-07:00 isaacs <i@izs.me>

First draft of a new contribution policy.

PR-URL: https://github.com/node-forward/node/pull/1
Signed-off-by: isaacs <i@izs.me>

```

```
$ git -C repos/node show --format='' --no-ext-diff f60abb0ced54f5ba08d324e62ad3fbb306ba37f7 -- CONTRIBUTING.md | sed -n '1,90p'
diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 4c3a86b00f3..62af881fae8 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -6,13 +6,13 @@ through the process.
 
 ### FORK
 
-Fork the project [on GitHub](https://github.com/joyent/node) and check out
+Fork the project [on GitHub](https://github.com/node-forward/node) and check out
 your copy.
 
 ```sh
 $ git clone git@github.com:username/node.git
 $ cd node
-$ git remote add upstream git://github.com/joyent/node.git
+$ git remote add upstream git://github.com/node-forward/node.git
 ```
 
 Now decide if you want your feature or bug fix to go into the master branch
@@ -148,7 +148,134 @@ not send out notifications when you add commits.
 
 
 [stability index page]: https://github.com/joyent/node/blob/master/doc/api/documentation.markdown
-[issue tracker]: https://github.com/joyent/node/issues
+[issue tracker]: https://github.com/node-forward/node/issues
 [node.js mailing list]: http://groups.google.com/group/nodejs
 [IRC]: http://webchat.freenode.net/?channels=node.js
-[project maintainers]: https://github.com/joyent/node/wiki/Project-Organization
+
+### COMMITTER GUIDE
+
+Committers who are merging their work and the work of others have a few other
+rules to follow.
+
+  - Always include the `Reviewed-by: You Name <your-email>` in the commit
+  message.
+  - In commit messages also include `Fixes:` that either includes the
+  **full url** (e.g. `https://github.com/joyent/node/issues/...`), and/or
+  the hash and commit message if the commit fixes a bug in a previous commit.
+  - PR's should include their full `PR-URL:` so it's easy to trace a commit
+  back to the conversation that lead up to that change.
+  - Double check PR's to make sure the persons **full name** and email
+  address are correct before merging.
+  - Except when updating dependencies, all commits should be self contained.
+  Meaning, every commit should pass all tests. Makes it much easier when
+  bisecting to find a breaking change.
+
+# Governance
+
+This repository (node-forward/node) is jointly governed by a technical
+committee, commonly referred to as the "TC."
+
+Initial membership invitations to the TC were given to individuals who had
+been active contributors to Node. Current membership is:
+
+```
+Fedor Indutny
+Trevor Norris
+Ben Noordhuis
+Isaac Z. Schlueter
+Nathan Rajlich
+Bert Belder
+```
+
+Invitations were also given to `TJ Fontaine` and `Alexis Campailla` who have
+not accepted but are still invited to participate without accepting a role or
+officially endorsing this effort.
+
+The TC has final authority over this project including:
+
+* Project governance and process
+* Contribution policy
+* GitHub repository hosting
+
+The TC can change its governance model if they deem it necessary. The current
+governance rules are:
+
+* [Consensus Seeking](http://en.wikipedia.org/wiki/Consensus-seeking_decision-making)
+* Motions with voting when consensus cannot be reached.
+* Quorum of 60%, simple majority wins.
+* No more than 30% of the TC membership can be affiliated with the same
+employer.
+
+## TC Meetings
+
+The TC meets weekly on a Google hangout. The meeting is run by a designated
+moderator, currently @mikeal. Each meeting should be published to Youtube.
+
+## Contributor Policy
```

## R3 — 2014-10-29: private minutes put a date and the words soft fork on the plan
```
$ git -C repos/node show -s --no-mailmap --format='%H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' e7dec60a63b9171465fd4037a04aeb709198aea2
e7dec60a63b9171465fd4037a04aeb709198aea2
parents 2c7847b3228b40aab8ea4902109639725eb0d8c3
Author: 2014-10-29T17:30:17-07:00 Mikeal Rogers <mikeal.rogers@gmail.com>
Committer: 2014-10-29T17:30:17-07:00 Mikeal Rogers <mikeal.rogers@gmail.com>

Said public when I meant private.
```

```
$ git -C repos/node show --format='' --no-ext-diff e7dec60a63b9171465fd4037a04aeb709198aea2 -- doc/tc-meetings/2014-10-29.md
diff --git a/doc/tc-meetings/2014-10-29.md b/doc/tc-meetings/2014-10-29.md
index 0fa77502743..ce64c62ddb0 100644
--- a/doc/tc-meetings/2014-10-29.md
+++ b/doc/tc-meetings/2014-10-29.md
@@ -13,7 +13,7 @@
 * Update on "release buckets"
  * doesn't make sense while we're private, we'll wait until it is public again
 * `node-forward/node` going public
- * when we made the repo public it was messaged as only being for "four weeks"
+ * when we made the repo private it was messaged as only being for "four weeks"
  * "four weeks" is up on November 8th
  * someone on the Advisory Board needs to remind Joyent of this in the
    next advisory board meeting so they aren't suprised by it even though
```

```
$ git -C repos/node show e7dec60a63b9171465fd4037a04aeb709198aea2:doc/tc-meetings/2014-10-29.md | sed -n '13,24p'
* Update on "release buckets"
 * doesn't make sense while we're private, we'll wait until it is public again
* `node-forward/node` going public
 * when we made the repo private it was messaged as only being for "four weeks"
 * "four weeks" is up on November 8th
 * someone on the Advisory Board needs to remind Joyent of this in the
   next advisory board meeting so they aren't suprised by it even though
   it was communicated to them when it was first made public.
 * @mikeal will work on the messaging in the README to make it clear this is
   a "soft" fork and not a "hard" fork.
 * ramifications of going public will be discussed in next week's TC meeting as
   well
```

## R4 — 2014-12-01: the public README says exactly what this repository became
```
$ git -C repos/node show --no-mailmap --no-ext-diff --format='commit %H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' 51514c8e8cbd98be7f29c3f1508b625d16e91b5d -- README.md
commit 51514c8e8cbd98be7f29c3f1508b625d16e91b5d
parents a647c39acfac136acdd841b5a2faaae46b67425d
Author: 2014-12-01T18:06:21-08:00 Mikeal Rogers <mikeal.rogers@gmail.com>
Committer: 2014-12-02T20:21:46+03:00 Fedor Indutny <fedor@indutny.com>

docs: simple project messaging.

Reviewed-By: Fedor Indutny <fedor@indutny.com>
PR-URL: https://github.com/iojs/io.js/pull/24


diff --git a/README.md b/README.md
index b157ddd3f2a..b7860dcc06c 100644
--- a/README.md
+++ b/README.md
@@ -1,6 +1,14 @@
-Evented I/O for V8 javascript.
+io.js
 ===
 
+This repository began as a GitHub fork of
+[joyent/node](https://github.com/joyent/node) where contributions,
+releases, and contributorship are under an
+[open governance model](./CONTRIBUTING.md#governance).
+
+We intend to release, with increasing regularity, releases which are
+compatible with npm ecosystem that has been built to date for node.js.
+
 ### To build:
 
 Prerequisites (Unix only):
```

## R5 — 2015-01-08: the build target and installed executable change from node to iojs
```
$ git -C repos/node show -s --no-mailmap --format='%H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' f17f473af5e28f4ec00a518f97a84b69c426309e
f17f473af5e28f4ec00a518f97a84b69c426309e
parents 3e7a25dd95194269fd112aa5677fc5e6d4156135
Author: 2015-01-08T14:00:43+01:00 Ben Noordhuis <info@bnoordhuis.nl>
Committer: 2015-01-08T23:21:20+01:00 Ben Noordhuis <info@bnoordhuis.nl>

build: rename binary from node to iojs

* rename the build targets

* update the test runner to use `out/{Debug,Release}/iojs`

* update the installer to install the iojs binary

* update one test that explicitly checks for the binary name

PR-URL: https://github.com/iojs/io.js/pull/262
Reviewed-By: Bert Belder <bertbelder@gmail.com>

```

```
$ git -C repos/node diff --no-ext-diff f17f473af5e28f4ec00a518f97a84b69c426309e^ f17f473af5e28f4ec00a518f97a84b69c426309e -- node.gyp tools/install.py | sed -n '1,60p'
diff --git a/node.gyp b/node.gyp
index 30a1bdf7ebc..43622958ec8 100644
--- a/node.gyp
+++ b/node.gyp
@@ -73,7 +73,7 @@
 
   'targets': [
     {
-      'target_name': 'node',
+      'target_name': 'iojs',
       'type': 'executable',
 
       'dependencies': [
diff --git a/tools/install.py b/tools/install.py
index 77e6d0cbd10..affce2265ce 100755
--- a/tools/install.py
+++ b/tools/install.py
@@ -108,12 +108,12 @@ def npm_files(action):
     if os.environ.get('PORTABLE'):

exec
/bin/bash -lc "sed -n '261,560p' chapters/21-iojs.receipts.md" in /home/diablo/book16
 succeeded in 211ms:
       # This crazy hack is necessary to make the shebang execute the copy
       # of node relative to the same directory as the npm script. The precompiled
-      # binary tarballs use a prefix of "/" which gets translated to "/bin/node"
+      # binary tarballs use a prefix of "/" which gets translated to "/bin/iojs"
       # in the regular shebang modifying logic, which is incorrect since the
       # precompiled bundle should be able to be extracted anywhere and "just work"
-      shebang = '/bin/sh\n// 2>/dev/null; exec "`dirname "$0"`/node" "$0" "$@"'
+      shebang = '/bin/sh\n// 2>/dev/null; exec "`dirname "$0"`/iojs" "$0" "$@"'
     else:
-      shebang = os.path.join(node_prefix or '/', 'bin/node')
+      shebang = os.path.join(node_prefix or '/', 'bin/iojs')
     update_shebang(link_path, shebang)
   else:
     assert(0) # unhandled action type
@@ -128,7 +128,7 @@ def subdir_files(path, dest, action):
 
 def files(action):
   exeext = '.exe' if sys.platform == 'win32' else ''
-  action(['out/Release/node' + exeext], 'bin/node' + exeext)
+  action(['out/Release/iojs' + exeext], 'bin/iojs' + exeext)
 
   if 'true' == variables.get('node_use_dtrace'):
     action(['out/Release/node.d'], 'lib/dtrace/node.d')
```

## R6 — 2015-08-13: convergence renames the target and installed executable back to node
```
$ git -C repos/node show --no-mailmap --shortstat --format='%H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' a69ab27ab458385d24676792b75ad1c25b8c30e5
a69ab27ab458385d24676792b75ad1c25b8c30e5
parents ae8d436623109f315229ca9cc05715af362257b0
Author: 2015-08-13T12:14:34-04:00 cjihrig <cjihrig@gmail.com>
Committer: 2015-08-23T17:59:43-04:00 cjihrig <cjihrig@gmail.com>

node: rename from io.js to node

This commit replaces instances of io.js with Node.js, based on the
recent convergence. There are some remaining instances of io.js,
related to build and the installer.

Fixes: https://github.com/nodejs/node/issues/2361
PR-URL: https://github.com/nodejs/node/pull/2367
Reviewed-By: James M Snell <jasnell@gmail.com>
Reviewed-By: João Reis <reis@janeasystems.com>


 96 files changed, 2162 insertions(+), 2187 deletions(-)
```

```
$ git -C repos/node diff --no-ext-diff a69ab27ab458385d24676792b75ad1c25b8c30e5^ a69ab27ab458385d24676792b75ad1c25b8c30e5 -- node.gyp tools/install.py | sed -n '1,76p'
diff --git a/node.gyp b/node.gyp
index 7b2d0a54f7c..d86cd1ce9ab 100644
--- a/node.gyp
+++ b/node.gyp
@@ -78,7 +78,7 @@
 
   'targets': [
     {
-      'target_name': 'iojs',
+      'target_name': 'node',
       'type': '<(node_target_type)',
 
       'dependencies': [
@@ -531,10 +531,10 @@
             {
               'action_name': 'node_dtrace_provider_o',
               'inputs': [
-                '<(OBJ_DIR)/iojs/src/node_dtrace.o',
+                '<(OBJ_DIR)/node/src/node_dtrace.o',
               ],
               'outputs': [
-                '<(OBJ_DIR)/iojs/src/node_dtrace_provider.o'
+                '<(OBJ_DIR)/node/src/node_dtrace_provider.o'
               ],
               'action': [ 'dtrace', '-G', '-xnolibs', '-s', 'src/node_provider.d',
                 '<@(_inputs)', '-o', '<@(_outputs)' ]
@@ -584,7 +584,7 @@
                 '<(SHARED_INTERMEDIATE_DIR)/v8constants.h'
               ],
               'outputs': [
-                '<(OBJ_DIR)/iojs/src/node_dtrace_ustack.o'
+                '<(OBJ_DIR)/node/src/node_dtrace_ustack.o'
               ],
               'conditions': [
                 [ 'target_arch=="ia32"', {
diff --git a/tools/install.py b/tools/install.py
index 3254eba17e5..dda11a14931 100755
--- a/tools/install.py
+++ b/tools/install.py
@@ -108,12 +108,12 @@ def npm_files(action):
     if os.environ.get('PORTABLE'):
       # This crazy hack is necessary to make the shebang execute the copy
       # of node relative to the same directory as the npm script. The precompiled
-      # binary tarballs use a prefix of "/" which gets translated to "/bin/iojs"
+      # binary tarballs use a prefix of "/" which gets translated to "/bin/node"
       # in the regular shebang modifying logic, which is incorrect since the
       # precompiled bundle should be able to be extracted anywhere and "just work"
-      shebang = '/bin/sh\n// 2>/dev/null; exec "`dirname "$0"`/iojs" "$0" "$@"'
+      shebang = '/bin/sh\n// 2>/dev/null; exec "`dirname "$0"`/node" "$0" "$@"'
     else:
-      shebang = os.path.join(node_prefix or '/', 'bin/iojs')
+      shebang = os.path.join(node_prefix or '/', 'bin/node')
     update_shebang(link_path, shebang)
   else:
     assert(0) # unhandled action type
@@ -130,7 +130,7 @@ def files(action):
   is_windows = sys.platform == 'win32'
 
   exeext = '.exe' if is_windows else ''
-  action(['out/Release/iojs' + exeext], 'bin/iojs' + exeext)
+  action(['out/Release/node' + exeext], 'bin/node' + exeext)
 
   if not is_windows:
     # Install iojs -> node compatibility symlink.
@@ -152,9 +152,9 @@ def files(action):
   action(['deps/v8/tools/gdbinit'], 'share/doc/node/')
 
   if 'freebsd' in sys.platform or 'openbsd' in sys.platform:
-    action(['doc/iojs.1'], 'man/man1/')
+    action(['doc/node.1'], 'man/man1/')
   else:
-    action(['doc/iojs.1'], 'share/man/man1/')
+    action(['doc/node.1'], 'share/man/man1/')
 
   if 'true' == variables.get('node_install_npm'): npm_files(action)
 
```

## R7 — the v4 line imports the v3.3.0 release record as a separate commit
```
$ git -C repos/node show -s --no-mailmap --format='%H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' 8a9a3bf798a3d6dda5a852a01820422c53eea765 | sed -n '1,28p'
8a9a3bf798a3d6dda5a852a01820422c53eea765
parents f6b093343da915832c20bfbc040c7d6bef26f08c
Author: 2015-09-02T15:39:16+10:00 Rod Vagg <rod@vagg.org>
Committer: 2015-09-03T17:46:24-04:00 Jeremiah Senkpiel <fishrock123@rocketmail.com>

doc: update changelog for io.js v3.3.0

Notable changes:

* build: Add a --link-module option to configure that can be used to
  bundle additional JavaScript modules into a built binary
  (Bradley Meck) #2497
* docs: Merge outstanding doc updates from joyent/node
  (James M Snell) #2378
* http_parser: Significant performance improvement by having
  http.Server consume all initial data from its net.Socket and parsing
  directly without having to enter JavaScript. Any 'data' listeners on
  the net.Socket will result in the data being "unconsumed" into
  JavaScript, thereby undoing any performance gains.
  (Fedor Indutny) #2355
* libuv: Upgrade to 1.7.3 (from 1.6.1), see
  https://github.com/libuv/libuv/blob/v1.x/ChangeLog for details
  (Saúl Ibarra Corretgé) #2310
* V8: Upgrade to 4.4.63.30 (from 4.4.63.26) (Michaël Zasso) #2482

cherry-picked from v3.x @ 1a6e52db30

PR-URL: https://github.com/nodejs/node/pull/2653
```

```
$ git -C repos/node merge-base --is-ancestor 8a9a3bf798a3d6dda5a852a01820422c53eea765 'v4.0.0^{}' && echo 'v3.3.0_changelog_import_ancestor_of_v4.0.0=yes'
v3.3.0_changelog_import_ancestor_of_v4.0.0=yes
```

## R8 — annotated tags identify the two releases and their distinct commit parents
```
$ for tag in v3.3.0 v4.0.0; do git -C repos/node for-each-ref --format='%(refname:short) tag-object=%(objectname) target=%(*objectname) | %(taggerdate:iso8601-strict) %(taggername) <%(taggeremail:trim)> | %(subject)' "refs/tags/$tag"; git -C repos/node show -s --no-mailmap --format='commit %H%nparent %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%s' "$tag^{}"; done
v3.3.0 tag-object=6077335ececf9037a27f5fec27de3bb1ac1949fe target=1a6e52db307f0da605a6f15426727834cfc522d8 | 2015-09-02T22:29:58+10:00 Rod Vagg <rod@vagg.org> | 2015-09-02 io.js v3.3.0 Release
commit 1a6e52db307f0da605a6f15426727834cfc522d8
parent d2f314c190ddc21492dcea36d9394863ff4e7eb3
Author: 2015-09-02T15:39:16+10:00 Rod Vagg <rod@vagg.org>
Committer: 2015-09-02T20:12:36+10:00 Rod Vagg <rod@vagg.org>
2015-09-02 io.js v3.3.0 Release
v4.0.0 tag-object=67b4fb359b36a850e38a1469efef705b37be4bad target=f9f837885343a2a3f5ba2b8c510eaac395c8c865 | 2015-09-09T05:03:37+10:00 Rod Vagg <rod@vagg.org> | 2015-09-08 Node.js v4.0.0 Release
commit f9f837885343a2a3f5ba2b8c510eaac395c8c865
parent 0cb0f4a6e499a2a8e8186a8915f0e0af5a03c121
Author: 2015-09-07T13:54:43+10:00 Rod Vagg <rod@vagg.org>
Committer: 2015-09-08T23:29:00+10:00 Rod Vagg <rod@vagg.org>
2015-09-08, Version 4.0.0 (Stable) Release
```

## R9 — v3.3.0 is the written baseline, not a Git parent or ancestor of v4.0.0
```
$ printf 'v3.3.0_tagged_commit '; git -C repos/node rev-parse 'v3.3.0^{}'; printf 'v4.0.0_tagged_commit '; git -C repos/node rev-parse 'v4.0.0^{}'; printf 'v4.0.0_direct_parent '; git -C repos/node rev-parse 'v4.0.0^'; printf 'merge_base '; git -C repos/node merge-base 'v3.3.0^{}' 'v4.0.0^{}'; printf 'v3_only v4_only '; git -C repos/node rev-list --left-right --count 'v3.3.0^{}...v4.0.0^{}'; if git -C repos/node merge-base --is-ancestor 'v3.3.0^{}' 'v4.0.0^{}'; then echo 'v3.3.0_ancestor_of_v4.0.0=yes'; else echo 'v3.3.0_ancestor_of_v4.0.0=no'; fi
v3.3.0_tagged_commit 1a6e52db307f0da605a6f15426727834cfc522d8
v4.0.0_tagged_commit f9f837885343a2a3f5ba2b8c510eaac395c8c865
v4.0.0_direct_parent 0cb0f4a6e499a2a8e8186a8915f0e0af5a03c121
merge_base a020d9a5c9b79a1630a6a1aae3c480fa578e99e2
v3_only v4_only 151	209
v3.3.0_ancestor_of_v4.0.0=no
```

## R10 — the files at the tags change title from io.js to Node.js and name v3.3.0 as v4's baseline
```
$ git -C repos/node show 'v3.3.0^{}:CHANGELOG.md' | sed -n '1,8p'
# io.js ChangeLog

## 2015-09-02, Version 3.3.0, @rvagg

### Notable changes

* **build**: Add a `--link-module` option to `configure` that can be used to bundle additional JavaScript modules into a built binary (Bradley Meck) [#2497](https://github.com/nodejs/node/pull/2497)
* **docs**: Merge outstanding doc updates from joyent/node (James M Snell) [#2378](https://github.com/nodejs/node/pull/2378)
```

```
$ git -C repos/node show 'v4.0.0^{}:CHANGELOG.md' | sed -n '1,14p'
# Node.js ChangeLog

## 2015-09-08, Version 4.0.0 (Stable), @rvagg

### Notable changes

This list of changes is relative to the last io.js v3.x branch release, v3.3.0. Please see the list of notable changes in the v3.x, v2.x and v1.x releases for a more complete list of changes from 0.12.x. Note, that some changes in the v3.x series as well as major breaking changes in this release constitute changes required for full convergence of the Node.js and io.js projects.

* **child_process**: `ChildProcess.prototype.send()` and `process.send()` operate asynchronously across all platforms so an optional callback parameter has been introduced that will be invoked once the message has been sent, i.e. `.send(message[, sendHandle][, callback])` (Ben Noordhuis) [#2620](https://github.com/nodejs/node/pull/2620).
* **node**: Rename "io.js" code to "Node.js" (cjihrig) [#2367](https://github.com/nodejs/node/pull/2367).
* **node-gyp**: This release bundles an updated version of node-gyp that works with all versions of Node.js and io.js including nightly and release candidate builds. From io.js v3 and Node.js v4 onward, it will only download a headers tarball when building addons rather than the entire source. (Rod Vagg) [#2700](https://github.com/nodejs/node/pull/2700)
* **npm**: Upgrade to version 2.14.2 from 2.13.3, includes a security update, see https://github.com/npm/npm/releases/tag/v2.14.2 for more details, (Kat Marchán) [#2696](https://github.com/nodejs/node/pull/2696).
* **timers**: Improved timer performance from porting the 0.12 implementation, plus minor fixes (Jeremiah Senkpiel) [#2540](https://github.com/nodejs/node/pull/2540), (Julien Gilli) [nodejs/node-v0.x-archive#8751](https://github.com/nodejs/node-v0.x-archive/pull/8751) [nodejs/node-v0.x-archive#8905](https://github.com/nodejs/node-v0.x-archive/pull/8905)
* **util**: The `util.is*()` functions have been deprecated, beginning with deprecation warnings in the documentation for this release, users are encouraged to seek more robust alternatives in the npm registry, (Sakthipriyan Vairamani) [#2447](https://github.com/nodejs/node/pull/2447).
```


codex
The factual spine is mostly disciplined, but I’m checking two vulnerable layers now: whether the printed commands truly emit the shown text, and whether claims surrounding those receipts quietly outrun what the receipts establish. I’m also locating the ffmpeg and demoted Node drafts for a direct overlap test.
exec
/bin/bash -lc "rg -n --glob '*.md' -i \"remove promises|ffmpeg|hostile.merge|fork war|fork-war\" . | head -160 && rg -n '"'^```console|''^'"\\"'$ git|''^```$|<!-- CHECK:'"' chapters/21-iojs.fable.md" in /home/diablo/book16
 succeeded in 218ms:
./scout/node.md:276:- **message:** `Remove promises`
./scout/node.md:291:    Remove promises
./scout/node.md:451:2. **#7 Remove promises** — Node shipped Promises for eight months in 2009–2010; Ryan deleted 306 lines and the folklore became "Node chose callbacks." Type 8, surprise 5.
./chapters/12-review-prompt.md:7:(genesis), elegy (vim), corporate costume, two-ledgers (npm), research-code (t2t), fork-war (ffmpeg).
./chapters/13-node.reader.md:1:# Remove promises
./chapters/13-node.reader.md:39:creator — made a commit titled, in full, *Remove promises*. No further explanation; the space
./chapters/13-node.reader.md:103:who wrote *Remove promises* and set the shape of a platform left it not with a speech but with
./chapters/13-node.reader.md:124:[Remove promises — the full dig](13-node.full.html).*
./scout/ffmpeg.md:1:# Scout: FFmpeg/FFmpeg
./scout/ffmpeg.md:3:- **repo:** https://github.com/FFmpeg/FFmpeg
./scout/ffmpeg.md:4:- **clone:** `~/book16/repos/ffmpeg` (already present; not re-cloned)
./scout/ffmpeg.md:12:git -C ~/book16/repos/ffmpeg log --reverse --format='%H %aI %an %s' | head -5
./scout/ffmpeg.md:19:git -C ~/book16/repos/ffmpeg log -1 --format='%H %aI %cI %an %s'
./scout/ffmpeg.md:22:git -C ~/book16/repos/ffmpeg log --max-parents=0 --pretty='format:%H %aI %an %s'
./scout/ffmpeg.md:40:git -C ~/book16/repos/ffmpeg log -1 --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aD%n%n%B' 77bb6835ba752bb9335d208963a53227bbb1bc63
./scout/ffmpeg.md:41:git -C ~/book16/repos/ffmpeg diff-tree --root --shortstat 9aeeeb63f7e1ab7b0b7bb839a5f258667a2d2d78
./scout/ffmpeg.md:42:git -C ~/book16/repos/ffmpeg show 9aeeeb63f7e1ab7b0b7bb839a5f258667a2d2d78:README | head -3
./scout/ffmpeg.md:49:    Originally committed as revision 1 to svn://svn.ffmpeg.org/ffmpeg/trunk
./scout/ffmpeg.md:52:FFmpeg version 0.9 - (c) 2000 Gerard Lantau.
./scout/ffmpeg.md:55:The UUID `9553f0bf-9b14-0410-a0b8-cfaf0461ba5b` is the Subversion repository. Both objects share the same second. The 13,216-line tree — `ffmpeg.c`, `ffserver.c`, `libav/mpegvideo.c`, a Video4Linux grabber — is signed in git as Fabrice Bellard and inside every source file as **Gerard Lantau** (`glantau@users.sourceforge.net`). The README ends "they really ARE THE SAME except for the encoding huffman codes." Then seven months of silence.
./scout/ffmpeg.md:74:git -C ~/book16/repos/ffmpeg show --stat --format='commit %h%nAuthorDate: %aD%n%s' 1b58d58ddaf8a8c766a0353885ff504babed0453 | tail -8
./scout/ffmpeg.md:80:git -C ~/book16/repos/ffmpeg show --shortstat --format='%aI %s' de6d9b6404bfd1c589799142da5a95428f146edd
./scout/ffmpeg.md:85:r3 is `test` (delete `jpegenc.c`). Six minutes later r4 erases the December tree — 13,114 deletions, every Lantau file. Sunday he lands another `Initial revision` (the real FFmpeg: `configure`, `libavformat` ancestors, `libavcodec/`) and a `merge` that puts `ffmpeg.c` / `ffserver.c` back. The 2000 README is gone. The 2001 README still says Gerard Lantau, and now also "generic audio and video file converter."
./scout/ffmpeg.md:87:**Why it is a story.** For seven months the only object in version control is the 0.9 dump. Then in one evening he treats that dump as a prototype and throws it away. Anyone who bisects past July 2001 falls out of the product and into a discarded encoder. The phrase "Initial revision" happens twice; only the second one is an ancestor of `ffmpeg.c` as the project became.
./scout/ffmpeg.md:104:git -C ~/book16/repos/ffmpeg log -1 --format='commit %H%nAuthorDate: %aD%nCommitDate: %cD%nParent: %P%n%s' 22f7942fe7d7349e3562ac68fa101d9efec522df
./scout/ffmpeg.md:105:git -C ~/book16/repos/ffmpeg log --reverse --format='%ci %h %s' | head -5
./scout/ffmpeg.md:118:This is the only commit in the entire history whose committer date is 2001-01-01 (`git log --format='%ci' | grep -c '^2001-01-01'` → 1). `--reverse` shows parents before children. Because Luca's committer clock says January 2001, git is obliged to emit his parent first — Janne Grunau's 25 Oct 2012 `pcmdec` change, a perfectly ordinary Libav-era commit with honest dates. The third object you meet in FFmpeg's chronology is therefore from the fork year, twelve years late, for a six-line range-coder fix.
./scout/ffmpeg.md:134:- **messages:** `Initial MAINTAINERS update` / `Update git-howto with ffmpeg.org URLs` / `Revert "Initial MAINTAINERS update"`
./scout/ffmpeg.md:137:git -C ~/book16/repos/ffmpeg show f4f5cab94e0881cd30965b28f3d78d9c63d6918e -- MAINTAINERS
./scout/ffmpeg.md:139:    Per http://lists.mplayerhq.hu/pipermail/ffmpeg-devel/2011-January/103440.html.
./scout/ffmpeg.md:146:git -C ~/book16/repos/ffmpeg log -1 --format='%aD%n%B' 111ccca602e96f18d4fab1117b2b768ae51814f7
./scout/ffmpeg.md:153:Same afternoon Dark Shikari also deprecates `CREDITS` ("It's useless now that we've switched to git," `a5da3b040c`). Mans has already pointed `git-howto.txt` at `git://git.ffmpeg.org` instead of VideoLAN. Janne has rewritten the howto for a **no-merge policy** (`ffe9fd253f`, 17 Jan: "The master tree will reject pushes with merge commits"). Twenty-four hours later Niedermayer puts the seven lines back and reverts the URLs. The commit messages say "mistakely commited as discussed." They do not say *coup*.
./scout/ffmpeg.md:155:**Why it is a story.** The moment before the outcome: a group of active maintainers still have push, the mailing-list thread is the constitution, and the Project Leader heading is just a file. Deleting seven lines is how you try to take a project. Restoring them, with a spelling error in "mistakely," is how the person those lines named keeps it. Libav is announced about eight weeks later. The revert is the last moment FFmpeg is still one tree.
./scout/ffmpeg.md:172:git -C ~/book16/repos/ffmpeg log --grep=qatar --format='%H %aI %s' --reverse | head -3
./scout/ffmpeg.md:177:git -C ~/book16/repos/ffmpeg log --grep=qatar --oneline | wc -l
./scout/ffmpeg.md:180:git -C ~/book16/repos/ffmpeg log --grep=qatar --format='%ad' --date=format:'%H' --author=Niedermayer | sort | uniq -c | sort -k2 | head -5
./scout/ffmpeg.md:191:git -C ~/book16/repos/ffmpeg log -1 --format='%B' 4899ccd29572f139b0da648212595d3affc9bf5d
./scout/ffmpeg.md:215:- **authors:** Janne Grunau (author email still `janne-ffmpeg@`, committer `janne-libav@`); Michael Niedermayer; Mans Rullgard
./scout/ffmpeg.md:216:- **messages:** `partially rename FFmpeg to Libav` / `Revert "partially rename FFmpeg to Libav"` / `Replace FFmpeg with Libav in licence headers`
./scout/ffmpeg.md:219:git -C ~/book16/repos/ffmpeg show --shortstat --format=fuller 2912e87a6c9264d556734e2bf94a99c64cf9b102 | head -16
./scout/ffmpeg.md:223:    Replace FFmpeg with Libav in licence headers
./scout/ffmpeg.md:226:git -C ~/book16/repos/ffmpeg log -1 --format='%aI %s' c0b1bc8d1797355c4f65ae4c488705b98cf9c8e9
./scout/ffmpeg.md:227:2011-03-17T17:02:14+01:00 Revert "partially rename FFmpeg to Libav"
./scout/ffmpeg.md:229:git -C ~/book16/repos/ffmpeg grep -l 'This file is part of Libav' HEAD | wc -l
./scout/ffmpeg.md:231:git -C ~/book16/repos/ffmpeg grep -l 'This file is part of FFmpeg' HEAD | wc -l
./scout/ffmpeg.md:235:Janne's rename of `configure` / `README` / `LICENSE` is committed with a Libav address onto a patch authored from an FFmpeg address. Niedermayer reverts it the next afternoon, then that evening merges `newdev/master` — which contains Mans's 1,335-file, one-word licence-header rewrite. For years Diego Biurrun (Libav) will land follow-up "Replace more FFmpeg by Libav" commits via qatar, and Niedermayer will change individual headers back "with the authors permission." HEAD has zero `part of Libav` files.
./scout/ffmpeg.md:251:- **messages:** `List of people maintaining different parts of FFmpeg.` / `MAINTAINERS: Remove myself as leader` / `MAINTAINERS: remove the project leader section`
./scout/ffmpeg.md:254:git -C ~/book16/repos/ffmpeg log -S 'Project Leader' --format='%h %ai %an %s' -- MAINTAINERS
./scout/ffmpeg.md:258:7f2a97537c 2006-02-08 11:32:03 +0000 Diego Biurrun List of people maintaining different parts of FFmpeg.
./scout/ffmpeg.md:260:git -C ~/book16/repos/ffmpeg show f2c58931e629343f7d68258cc2b2d62c5f501ba5
./scout/ffmpeg.md:265:git -C ~/book16/repos/ffmpeg show 07d930014d839dc1c10f3a539e78cc7f8b9d7a4a
./scout/ffmpeg.md:288:- **messages:** `license/copyright change` / `support for adding new components…` / `Use the ffmpeg mdct function, patch by Fabrice Bellard.` / `avcodec/hevc: reduce memory for SAO`
./scout/ffmpeg.md:291:git -C ~/book16/repos/ffmpeg show 17048ca88fc100c6a19cfd5248ea5b87469fb2c3 -- README | tail -12
./scout/ffmpeg.md:292:-* See the file COPYING. ffmpeg and the associated library are licensed
./scout/ffmpeg.md:296:+* See the file COPYING. ffmpeg and the associated library EXCEPT
./scout/ffmpeg.md:302:git -C ~/book16/repos/ffmpeg log --author=Bellard --format='%ai %s' --since=2005-01-01
./scout/ffmpeg.md:304:2007-11-03 14:34:25 +0000 Use the ffmpeg mdct function, patch by Fabrice Bellard. ...
./scout/ffmpeg.md:326:git -C ~/book16/repos/ffmpeg shortlog -sn HEAD | head -8
./scout/ffmpeg.md:336:git -C ~/book16/repos/ffmpeg log --format='%ad %an' --date=format:%Y \
./scout/ffmpeg.md:349:His first object is not even FFmpeg: `Originally committed as revision 2169 to svn://svn.mplayerhq.hu/mplayer/trunk/postproc`. He arrives via MPlayer's deblocker, converts it from C++ to C, and by 2004 is two-thirds of the commit stream. 2009 is the trough (9%) — other people have shown up. 2011–2015 the share explodes again because qatar merges are *his* commits. 2020 Andreas Rheinhardt takes the yearly crown (1,202 vs 490). 2022, the year Anton removes the leader heading, Niedermayer is 6.8%. He is still third in 2025.
./scout/ffmpeg.md:369:git -C ~/book16/repos/ffmpeg grep -n 'POST protocol is not' de6d9b6404bfd1c589799142da5a95428f146edd -- libav/http.c
./scout/ffmpeg.md:370:de6d9b6404bfd1c589799142da5a95428f146edd:libav/http.c:33:/* XXX: POST protocol is not completly implemented because ffmpeg use
./scout/ffmpeg.md:372:git -C ~/book16/repos/ffmpeg blame -L 52,53 HEAD -- libavformat/http.c
./scout/ffmpeg.md:373:e42dba481f6 (Diego Biurrun  2007-04-07 14:09:20 +0000 52) /* XXX: POST protocol is not completely implemented because ffmpeg uses
./scout/ffmpeg.md:396:git -C ~/book16/repos/ffmpeg log --max-parents=0 --pretty='format:%H %aI %an %s'
./scout/ffmpeg.md:400:git -C ~/book16/repos/ffmpeg show --shortstat --format='%s' 66eaaa644a957da53da484b3af3c2d0a8ad2bb4a
./scout/ffmpeg.md:405:`git-subtree-dir: tests/checkasm/ext`. A squash of an external checkasm tree becomes parent-zero and is merged with `--allow-unrelated-histories` (the subtree equivalent). From this day, `git log --max-parents=0` can never again say FFmpeg began once.
./scout/ffmpeg.codex.md:1:# Independent scout: FFmpeg/FFmpeg
./scout/ffmpeg.codex.md:5:I reran the report's literal commands against the existing clone at `/home/diablo/book16/repos/ffmpeg`, then used supplementary read-only commands where the printed recipe did not expose author identity, parent count, or diff content. A PASS means the claim, not merely the hash, survives that check.
./scout/ffmpeg.codex.md:9:| #5 | The first three `qatar` grep hits are `4defa68f`, `f3543969`, `2cae9809`, on 2–4 Apr 2011 with the quoted merge subjects. | `git -C /home/diablo/book16/repos/ffmpeg log --grep=qatar --format='%H %aI %s' --reverse \| head -3` | PASS | Hashes, author dates, and subjects match exactly. Supplementary `show -s --format=...` confirms Michael Niedermayer authored and committed the first one. |
./scout/ffmpeg.codex.md:10:| #5 | `git log --grep=qatar` produces 1,194 hits. | `git -C /home/diablo/book16/repos/ffmpeg log --grep=qatar --oneline \| wc -l` | PASS | Literal output is `1194`. |
./scout/ffmpeg.codex.md:11:| #5 | Those 1,194 hits are 1,194 qatar **merges**. | Above, plus `git -C /home/diablo/book16/repos/ffmpeg rev-list --count --min-parents=2 --grep=qatar HEAD` | **FAIL** | Only **1,151** have two parents. The other 43 are ordinary commits whose subject/body mentions qatar, including cosmetics, fixes, and a revert. The title and yearly totals conflate grep hits with merges. |
./scout/ffmpeg.codex.md:12:| #5 | The printed hour-histogram command yields `66, 90, 103, 52, 56` for hours 00–04. | `git -C /home/diablo/book16/repos/ffmpeg log --grep=qatar --format='%ad' --date=format:'%H' --author=Niedermayer \| sort \| uniq -c \| sort -k2 \| head -5` | **FAIL** | It actually yields `69, 91, 105, 56, 59`. The report's numbers are the result after adding the unprinted `--min-parents=2`; its prose silently switches from 1,194 grep hits to 1,151 merges. |
./scout/ffmpeg.codex.md:13:| #5 | Every actual qatar merge is by Michael Niedermayer; the last is `4899ccd2`, with the quoted DNxHD conflict message. | `git -C /home/diablo/book16/repos/ffmpeg log --grep=qatar --min-parents=2 --format='%an' \| sort \| uniq -c`; `git -C /home/diablo/book16/repos/ffmpeg log -1 --format='%B' 4899ccd29572f139b0da648212595d3affc9bf5d` | PASS | The author count is `1151 Michael Niedermayer`. The last hash, 2014-04-11 date, subject, two parents, two conflicted paths, `See:` hash, and `Merged-by:` line all match. |
./scout/ffmpeg.codex.md:14:| #5 | `ffe9fd25` imposed the no-merge rule and Michael authored 6,625 merges overall. | `git -C /home/diablo/book16/repos/ffmpeg show --format= ffe9fd253f21db43ccc52a4043af94b7b9044f53 -- doc/git-howto.txt`; `git -C /home/diablo/book16/repos/ffmpeg rev-list --count --min-parents=2 --author='Michael Niedermayer' HEAD` | PASS | The diff literally adds “merge commits are forbidden” and “master tree will reject pushes with merge commits”; the count is `6625`. |
./scout/ffmpeg.codex.md:15:| #5 | In the ranked summary, “the no-merge policy is two days old” when the qatar merging begins. | `git -C /home/diablo/book16/repos/ffmpeg show -s --format='%H %aI %s' ffe9fd253f21db43ccc52a4043af94b7b9044f53 4defa68fe25eae4d7c27341e3b35811c047dcd3f` | **FAIL** | The rule is 2011-01-17; the first qatar merge is 2011-04-02, about 75 days later. “Two days” correctly describes the rule's distance from the Jan 18–19 leadership fight, not from qatar's Apr 2 start. |
./scout/ffmpeg.codex.md:16:| #7 | Pickaxe finds the Project Leader section's 2006 birth, 2011 deletion/revert, and 2022 deletion under the claimed hashes, dates, authors, and messages. | `git -C /home/diablo/book16/repos/ffmpeg log -S 'Project Leader' --format='%h %ai %an %s' -- MAINTAINERS` | PASS | All four commits match. The full subject of `f4f5cab9` also contains the mailing-list URL in its first paragraph, which `%s` includes; the report merely shortened it. |
./scout/ffmpeg.codex.md:17:| #7 | `f4f5cab9` removes the seven-line leader block and `111ccca6` restores it the next day with “mistakely commited as discussed.” | `git -C /home/diablo/book16/repos/ffmpeg show f4f5cab94e0881cd30965b28f3d78d9c63d6918e -- MAINTAINERS`; `git -C /home/diablo/book16/repos/ffmpeg log -1 --format='%aD%n%B' 111ccca602e96f18d4fab1117b2b768ae51814f7` | PASS | Author, date, message, exact removed lines, revert target, and spelling all match. |
./scout/ffmpeg.codex.md:18:| #7 | `f2c58931` removes only Michael's name in 2015, leaving the office and “final design decisions.” | `git -C /home/diablo/book16/repos/ffmpeg show f2c58931e629343f7d68258cc2b2d62c5f501ba5` | PASS | The one-line deletion and metadata match exactly. Committer time is 42 seconds after author time, a harmless detail omitted by the report. |
./scout/ffmpeg.codex.md:19:| #7 | `07d93001` removes the empty section in 2022 with “The position does not exist anymore.” | `git -C /home/diablo/book16/repos/ffmpeg show 07d930014d839dc1c10f3a539e78cc7f8b9d7a4a` | PASS | Hash, Anton Khirnov authorship, author date, message, and six-line deletion match. Its commit date is 2022-09-23, three days after the reported author date; the report consistently labels the latter. |
./scout/ffmpeg.codex.md:20:| #3 | `22f7942f` has author date 2012-10-25, committer date 2001-01-01, parent `dcdfb8ed`, Luca Barbato identity, and the quoted ffv1 subject. | `git -C /home/diablo/book16/repos/ffmpeg log -1 --format='commit %H%nAuthorDate: %aD%nCommitDate: %cD%nParent: %P%n%s' 22f7942fe7d7349e3562ac68fa101d9efec522df` | PASS | Exact match. Supplementary `show --format=fuller --stat` confirms Luca as both author and committer. |
./scout/ffmpeg.codex.md:21:| #3 | The quoted five-line `git log --reverse` anomaly is reproducible. | `git -C /home/diablo/book16/repos/ffmpeg log --reverse --format='%ci %h %s' \| head -5` | PASS | Exact five hashes, committer timestamps, and subjects match. |
./scout/ffmpeg.codex.md:22:| #3 | It is the only reachable commit with a committer date beginning `2001-01-01`. | `git -C /home/diablo/book16/repos/ffmpeg log --format='%ci' \| grep -c '^2001-01-01'` | PASS | Output is `1`; repeating with `--all` is also `1`. |
./scout/ffmpeg.codex.md:23:| #3 | The patch is a six-line range-state fix. | `git -C /home/diablo/book16/repos/ffmpeg show --format= 22f7942fe7d7349e3562ac68fa101d9efec522df -- libavcodec/ffv1dec.c` | PASS | It is exactly 6 insertions and 1 deletion in `libavcodec/ffv1dec.c`, replacing an assertion with population of `one_state` and `zero_state`. |
./scout/ffmpeg.codex.md:25:| #9 (doubted) | The Måns/Mans split is a consequence of running `shortlog` “without `.mailmap`.” | `git -C /home/diablo/book16/repos/ffmpeg shortlog -sn HEAD \| head -8`; `git -C /home/diablo/book16/repos/ffmpeg shortlog -sne HEAD \| rg 'Mans Rullgard\|Måns Rullgård'`; `rg -n 'Rullgard\|Rullgård\|mans@mansr' /home/diablo/book16/repos/ffmpeg/.mailmap` | **FAIL** | The repo has a `.mailmap`, normal `shortlog` applies it, and it still emits 1,706 + 1,088 identities; `.mailmap` has no matching entry. The split is real, but the report misdiagnoses it as absence of mailmap rather than absence of the necessary mapping. |
./scout/ffmpeg.codex.md:29:## New dig 1 — A merge invents `fftools/ffmpeg.c`; neither parent has that path
./scout/ffmpeg.codex.md:32:- **hashes:** merge `fd5f4ac0813c27c34c387f00044905a859e29e37`; FFmpeg parent `2f7ca0b94e49c2bfce8bda3f883766101ebd7a9b`; Libav commit/second parent `c95169f0ec68bdeeabc5fde8aa4076f406242524`
./scout/ffmpeg.codex.md:40:git -C /home/diablo/book16/repos/ffmpeg show -s --format='%H %aI %an <%ae> | %s' fd5f4ac0813c27c34c387f00044905a859e29e37
./scout/ffmpeg.codex.md:41:for spec in 'fd5f4ac^1 ffmpeg.c' 'fd5f4ac^2 avtools/avconv.c' 'fd5f4ac fftools/ffmpeg.c'; do set -- $spec; printf '%-30s ' "$1:$2"; git -C /home/diablo/book16/repos/ffmpeg ls-tree "$1" "$2"; done
./scout/ffmpeg.codex.md:42:git -C /home/diablo/book16/repos/ffmpeg log --reverse --follow --format='%h %aI %s' -- fftools/ffmpeg.c | head -3
./scout/ffmpeg.codex.md:44:fd5f4ac^1:ffmpeg.c             100644 blob 1d248bc269d80526c02abac2cf2fcaaae74b717b ffmpeg.c
./scout/ffmpeg.codex.md:46:fd5f4ac:fftools/ffmpeg.c       100644 blob 1d248bc269d80526c02abac2cf2fcaaae74b717b fftools/ffmpeg.c
./scout/ffmpeg.codex.md:47:41569bbc66 2017-10-06T21:49:09+02:00 ffmpeg: always use single threaded decoding for attached pictures
./scout/ffmpeg.codex.md:48:2b006ccf83 2017-10-10T10:36:58-07:00 ffmpeg.c: Fallback to duration_dts, when duration_pts can't be determined.
./scout/ffmpeg.codex.md:49:f4090940bd 2017-10-04T00:43:30+02:00 ffmpeg: always init output stream before reaping filters
./scout/ffmpeg.codex.md:52:**Why it is a story.** The moment before the merge, FFmpeg still has `ffmpeg.c` at the root while the incoming Libav side has moved its differently named program to `avtools/avconv.c`. Almer merges Libav's “Move cli tool sources” decision but resolves it in FFmpeg's vocabulary: the result creates `fftools/ffmpeg.c`, a path present in neither parent, while preserving FFmpeg's blob byte-for-byte. A merge did not merely choose side A or side B; it coined a third name. The scar is that `git log --follow` now begins just after the merge in October 2017 instead of following the famous file back to 2000.
./scout/ffmpeg.codex.md:69:git -C /home/diablo/book16/repos/ffmpeg for-each-ref refs/remotes/origin/oldabi --format='%(objectname) %(authordate:iso8601-strict) %(authorname) | %(subject)'
./scout/ffmpeg.codex.md:70:printf 'unique commits outside master: '; git -C /home/diablo/book16/repos/ffmpeg rev-list --count master..origin/oldabi
./scout/ffmpeg.codex.md:71:git -C /home/diablo/book16/repos/ffmpeg show --format= ea4e8e642acc8c192a129470cb58c45beb62940b -- configure | sed -n '/^+if ! enabled building/,+5p'
./scout/ffmpeg.codex.md:95:- **author:** Zhao Zhili `<zhilizhao@tencent.com>`; committer Zhao Zhili `<quink@noreply.code.ffmpeg.org>`
./scout/ffmpeg.codex.md:101:git -C /home/diablo/book16/repos/ffmpeg show -s --format='%H author=%aI commit=%cI%nAuthor: %an <%ae>%nCommitter: %cn <%ce>%n%s' 7df9a56f0d2bdbf45e7868f7b4e1f06a6fc01be1
./scout/ffmpeg.codex.md:102:printf 'parent tree  '; git -C /home/diablo/book16/repos/ffmpeg show -s --format='%T' 7df9a56f0d2bdbf45e7868f7b4e1f06a6fc01be1^
./scout/ffmpeg.codex.md:103:printf 'commit tree  '; git -C /home/diablo/book16/repos/ffmpeg show -s --format='%T' 7df9a56f0d2bdbf45e7868f7b4e1f06a6fc01be1
./scout/ffmpeg.codex.md:104:git -C /home/diablo/book16/repos/ffmpeg show -s --format='%B' 7df9a56f0d2bdbf45e7868f7b4e1f06a6fc01be1 | rg 'cherry picked from'
./scout/ffmpeg.codex.md:105:git -C /home/diablo/book16/repos/ffmpeg log -1 --format='already in parent: %H %s' 7df9a56f0d2bdbf45e7868f7b4e1f06a6fc01be1^ -- libavformat/rtmpproto.c
./scout/ffmpeg.codex.md:108:Committer: Zhao Zhili <quink@noreply.code.ffmpeg.org>
./scout/ffmpeg.codex.md:133:git -C /home/diablo/book16/repos/ffmpeg show --format='%H %aI%n%an <%ae>%n%s' --unified=0 f53c590f3d18799bfb85a383d0738b28fe2fd08e -- .mailmap | sed -n '1,10p'
./scout/ffmpeg.codex.md:158:- **messages:** `FFmpeg 5.1 release` / `FFmpeg 5.1.1 release`
./scout/ffmpeg.codex.md:163:git -C /home/diablo/book16/repos/ffmpeg for-each-ref refs/tags/n5.1 refs/tags/n5.1.1 --format='%(refname:short) %(objectname) %(*objectname) %(taggerdate:iso8601-strict) %(taggername) | %(contents:subject)'
./scout/ffmpeg.codex.md:164:for t in n5.1 n5.1.1; do if git -C /home/diablo/book16/repos/ffmpeg cat-file -p "$t" | rg -q '^-----BEGIN PGP SIGNATURE-----'; then echo "$t: PGP signature present"; else echo "$t: no signature"; fi; done
./scout/ffmpeg.codex.md:165:printf 'earliest signed: '; git -C /home/diablo/book16/repos/ffmpeg for-each-ref refs/tags --format='%(refname:short) %(objectname) %(taggerdate:iso8601-strict)' | while read tag obj date; do git -C /home/diablo/book16/repos/ffmpeg cat-file -p "$obj" 2>/dev/null | rg -q '^-----BEGIN (PGP|SSH) SIGNATURE-----' && echo "$date $tag"; done | sort | head -1
./scout/ffmpeg.codex.md:166:printf 'signed / annotated: '; signed=$(git -C /home/diablo/book16/repos/ffmpeg for-each-ref refs/tags --format='%(objectname)' | while read obj; do git -C /home/diablo/book16/repos/ffmpeg cat-file -p "$obj" 2>/dev/null | rg -q '^-----BEGIN (PGP|SSH) SIGNATURE-----' && echo signed; done | wc -l); annotated=$(git -C /home/diablo/book16/repos/ffmpeg for-each-ref refs/tags --format='%(objecttype)' | rg -c '^tag$'); echo "$signed / $annotated"
./scout/ffmpeg.codex.md:167:n5.1 4f3c925bd5e8f253c1dbf57eb9552b92ce0b12d5 e0723b7e4e22492275d476fcd30d759e1198bc5b 2022-07-22T20:07:33+02:00 Michael Niedermayer | FFmpeg 5.1 release
./scout/ffmpeg.codex.md:168:n5.1.1 8536e629f0c35c0e8a2b67e65d3bc60a088fe413 1bad30dbe34f2d100b43e8f773d3fe0b5eb23523 2022-08-31T20:35:54+02:00 Michael Niedermayer | FFmpeg 5.1.1 release
./chapters/16-empty.md:80:The last kind is the strangest, because it wears the clothes of real work. In FFmpeg, in 2026:
./chapters/16-empty.md:83:$ git -C repos/ffmpeg show -s --format='%h %ai %an%n%s' 7df9a56f0d
./chapters/16-empty.md:91:$ git -C repos/ffmpeg rev-parse '7df9a56f0d^{tree}' '7df9a56f0d^^{tree}'
./chapters/16-empty.md:125:seeing. FFmpeg's empty commit was a speech act, meant. Node's may have been an accident. Git
./chapters/16-empty.md:150:- **R4** `git -C repos/ffmpeg show -s 7df9a56f0d` + `rev-parse` (equal) + `%b | grep 'cherry picked'` — 2026-03-11, Zhao Zhili, a real-looking backport whose tree is empty because the fix was already present; keeps the cherry-pick trailer.
./chapters/16-empty.receipts.md:3:Verbatim outputs against full clones of php-src, swiftlang/swift, openssl, ffmpeg, nodejs/node.
./chapters/16-empty.receipts.md:53:## R4 — ffmpeg: an empty commit that is a receipt — the fix was already present
./chapters/16-empty.receipts.md:55:$ git -C repos/ffmpeg show -s --format='%h %ai %an%n%s' 7df9a56f0d
./chapters/16-empty.receipts.md:61:$ git -C repos/ffmpeg rev-parse '7df9a56f0d^{tree}' '7df9a56f0d^^{tree}'   # equal: nothing to apply
./chapters/16-empty.receipts.md:67:$ git -C repos/ffmpeg show -s --format='%b' 7df9a56f0d | grep -i 'cherry picked'
./chapters/21-codex-review.md:19:Context: NEW P.S.-candidate chapter (source 21), the Node/io.js fork war told from repository
./chapters/21-codex-review.md:21:vim; the DEMOTED "Remove promises" chapter used this same repo — this chapter must share nothing
./chapters/21-codex-review.md:22:with it beyond the clone. The book also has an ffmpeg fork-war chapter in P.S. — judge whether
./chapters/21-codex-review.md:23:this one is distinct (governance rupture + reunification-by-document vs ffmpeg's hostile-merge
./chapters/21-codex-review.md:56:flips? (5) distinctness from the ffmpeg fork chapter and the demoted node chapter. (6) body word
./chapters/21-codex-review.md:939:The factual spine is mostly disciplined, but I’m checking two vulnerable layers now: whether the printed commands truly emit the shown text, and whether claims surrounding those receipts quietly outrun what the receipts establish. I’m also locating the ffmpeg and demoted Node drafts for a direct overlap test.
./chapters/21-codex-review.md:941:/bin/bash -lc "rg -n --glob '*.md' -i \"remove promises|ffmpeg|hostile.merge|fork war|fork-war\" . | head -160 && rg -n '"'^```console|''^'"\\"'$ git|''^```$|<!-- CHECK:'"' chapters/21-iojs.fable.md" in /home/diablo/book16
./scout/SELECTION-v2.md:29:| ffmpeg qatar (#5) | "1,194 merges", "two days old" | 1,151 two-parent merges; 75 days | no |
./scout/SELECTION-v2.md:76:15. **ffmpeg qatar / vim last-hours** — two strong standalone Round-2 anchors (fork war absorbed as
./scout/SELECTION-v2.md:86:  renames (node server→node, redis redis.c→server.c, postgres pg_xlog→pg_wal, ffmpeg invented
./scout/SELECTION-v2.md:87:  fftools/ffmpeg.c) · mailmap as editorial layer (curl "not my old Microsoft email", ffmpeg "stop
./chapters/21-review-prompt.md:6:Context: NEW P.S.-candidate chapter (source 21), the Node/io.js fork war told from repository
./chapters/21-review-prompt.md:8:vim; the DEMOTED "Remove promises" chapter used this same repo — this chapter must share nothing
./chapters/21-review-prompt.md:9:with it beyond the clone. The book also has an ffmpeg fork-war chapter in P.S. — judge whether
./chapters/21-review-prompt.md:10:this one is distinct (governance rupture + reunification-by-document vs ffmpeg's hostile-merge
./chapters/21-review-prompt.md:43:flips? (5) distinctness from the ffmpeg fork chapter and the demoted node chapter. (6) body word
./chapters/11-ffmpeg.md:4:is here: [As discussed](11-ffmpeg.html).*
./chapters/11-ffmpeg.md:7:$ git -C repos/ffmpeg log -1 --format='%aD%n%an%n%B' 111ccca602
./chapters/11-ffmpeg.md:22:$ git -C repos/ffmpeg show --format='%aD %an <%ae>%n%s' f4f5cab94e -- MAINTAINERS
./chapters/11-ffmpeg.md:24:Initial MAINTAINERS update Per http://lists.mplayerhq.hu/pipermail/ffmpeg-devel/2011-January/103440.html.
./chapters/11-ffmpeg.md:40:FFmpeg in the winter of 2011 is ten years old and inside half the video software on earth,
./chapters/11-ffmpeg.md:53:$ git -C repos/ffmpeg show --format= ffe9fd253f -- doc/git-howto.txt | grep -E '^\+.*[Mm]erge' | head -1
./chapters/11-ffmpeg.md:74:configure in the shared tree, which the FFmpeg side reverted the next afternoon [R7], and
./chapters/11-ffmpeg.md:78:$ git -C repos/ffmpeg show --shortstat --format='%aD %an %s' 2912e87a6c | tail -1
./chapters/11-ffmpeg.md:82:[R7] `Replace FFmpeg with Libav in licence headers` — one word, exchanged 5,388 times in a
./chapters/11-ffmpeg.md:85:can answer one narrow question — which sentence stands at FFmpeg's HEAD:
./chapters/11-ffmpeg.md:88:$ git -C repos/ffmpeg grep -l 'This file is part of Libav' HEAD | wc -l
./chapters/11-ffmpeg.md:90:$ git -C repos/ffmpeg grep -l 'This file is part of FFmpeg' HEAD | wc -l
./chapters/11-ffmpeg.md:101:FFmpeg how-to, this object was minted:
./chapters/11-ffmpeg.md:104:$ git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%H %aI %an %s' --reverse | head -1
./chapters/11-ffmpeg.md:112:$ git -C repos/ffmpeg rev-list --count --min-parents=2 --grep=qatar HEAD
./chapters/11-ffmpeg.md:114:$ git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%an' | sort | uniq -c
./chapters/11-ffmpeg.md:130:$ git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%ad' --date=format:%H | sort | uniq -c | sort -rn | head -3
./chapters/11-ffmpeg.md:143:$ git -C repos/ffmpeg log -1 --format='%aI%n%B' 4899ccd295
./chapters/11-ffmpeg.md:159:## fftools/ffmpeg.c
./chapters/11-ffmpeg.md:163:fftools/ffmpeg.c` says the file's history begins in October 2017. [R13] Seventeen years of
13:```console
14:$ git -C repos/node show -s --no-mailmap --format='%H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' e7dec60a63b9171465fd4037a04aeb709198aea2
21:```
25:```console
26:$ git -C repos/node show --format='' --no-ext-diff e7dec60a63b9171465fd4037a04aeb709198aea2 -- doc/tc-meetings/2014-10-29.md
37:```
50:doing the daily work had been building for years. <!-- CHECK: Node.js was corporately stewarded by
59:```console
60:$ git -C repos/node show --format='' --no-ext-diff f60abb0ced54f5ba08d324e62ad3fbb306ba37f7 -- CONTRIBUTING.md | sed -n '5,11p'
68:```
89:```console
90:$ git -C repos/node show e7dec60a63b9171465fd4037a04aeb709198aea2:doc/tc-meetings/2014-10-29.md | sed -n '13,24p'
103:```
120:```console
121:$ git -C repos/node show 51514c8e8cbd98be7f29c3f1508b625d16e91b5d:README.md | sed -n '1,9p'
131:```
138:```console
139:$ git -C repos/node show -s --no-mailmap --format='%aI %an <%ae>%n%s' f17f473af5e28f4ec00a518f97a84b69c426309e
142:```
148:official Node stood at 0.12. <!-- CHECK: io.js shipped independent releases v1.0.0 (Jan 2015)
157:```console
158:$ git -C repos/node show -s --no-mailmap --format='%aI %an <%ae>%n%s%n%n%b' a69ab27ab458385d24676792b75ad1c25b8c30e5 | sed -n '1,5p'
164:```
168:home. <!-- CHECK: the io.js/Node.js convergence of mid-2015 produced the Node.js Foundation, with
181:```console
182:$ git -C repos/node show 'v4.0.0^{}:CHANGELOG.md' | sed -n '1,7p'
190:```
199:```console
200:$ git -C repos/node merge-base --is-ancestor 'v3.3.0^{}' 'v4.0.0^{}'; echo $?
202:$ git -C repos/node rev-list --left-right --count 'v3.3.0^{}...v4.0.0^{}'
204:```

exec
/bin/bash -lc "nl -ba chapters/11-ffmpeg.md | sed -n '1,280p'; nl -ba chapters/13-node.reader.md | sed -n '1,180p'; awk '/"'^## Receipts/{exit} {print}'"' chapters/21-iojs.fable.md | wc -w; grep -v '"'^<!--'"' chapters/21-iojs.fable.md | wc -w" in /home/diablo/book16
 succeeded in 216ms:
     1	# As discussed
     2	
     3	*This is the full dig — every command, every receipt. The plain-English telling of the same story
     4	is here: [As discussed](11-ffmpeg.html).*
     5	
     6	```console
     7	$ git -C repos/ffmpeg log -1 --format='%aD%n%an%n%B' 111ccca602
     8	Wed, 19 Jan 2011 18:53:53 +0100
     9	Michael Niedermayer
    10	Revert "Initial MAINTAINERS update"
    11	
    12	This reverts commit f4f5cab94e0881cd30965b28f3d78d9c63d6918e.
    13	
    14	Reason is that this has been mistakely commited as discussed.
    15	```
    16	
    17	One sentence of explanation, two spelling mistakes, and a phrase — *as discussed* — pointing
    18	at a conversation that is not in the repository. [R1] What had been committed, mistakenly or
    19	otherwise, the afternoon before? A deletion. Seven lines out of a file called `MAINTAINERS`:
    20	
    21	```console
    22	$ git -C repos/ffmpeg show --format='%aD %an <%ae>%n%s' f4f5cab94e -- MAINTAINERS
    23	Tue, 18 Jan 2011 11:05:51 -0800 Jason Garrett-Glaser <jason@x264.com>
    24	Initial MAINTAINERS update Per http://lists.mplayerhq.hu/pipermail/ffmpeg-devel/2011-January/103440.html.
    25	
    26	-Project Leader
    27	-==============
    28	-
    29	-Michael Niedermayer
    30	-  final design decisions
    31	```
    32	
    33	[R2] A heading, a name, and a three-word job description. The man reverting the deletion is
    34	the man the deleted lines name. Both commits cite a discussion — one links a mailing-list
    35	thread, the other says *as discussed* — and git holds neither conversation. It holds what
    36	people did afterward, for eleven years, and that turns out to be the better record.
    37	
    38	## January
    39	
    40	FFmpeg in the winter of 2011 is ten years old and inside half the video software on earth,
    41	and it is governed the way many projects of that age are: the founder long gone, and one
    42	successor holding "final design decisions." That arrangement is not absurd — a codebase this
    43	dense benefits from one coherent technical will, and someone has to be able to say no. The
    44	alternative the senior maintainers wanted is not absurd either — authority attached to the
    45	subsystems people actually maintain, decisions by review instead of by office. Serious
    46	engineers choose each of these structures every day, and the argument between them was real
    47	on both sides. Git did not record the argument. It recorded the chores the argument
    48	produced.
    49	
    50	January 17: the project's git how-to is rewritten [R3]:
    51	
    52	```console
    53	$ git -C repos/ffmpeg show --format= ffe9fd253f -- doc/git-howto.txt | grep -E '^\+.*[Mm]erge' | head -1
    54	+  Caveat: Since merge commits are forbidden at least for the initial
    55	```
    56	
    57	*Merge commits are forbidden. The master tree will reject pushes with merge commits.* On its
    58	own, a defensible engineering rule — linear history, controlled integration; I have approved
    59	that same paragraph in other projects. Remember it anyway. January 18: the MAINTAINERS edit
    60	removes the leader section, citing the thread. January 19: the revert restores it, *as
    61	discussed*.
    62	
    63	~ The revert is the last commit in which this project is one project.
    64	
    65	Within weeks, the group behind the edit left to found Libav — the same code and the same
    66	history, continued under a different name and different governance — and for the next
    67	several years the two trees developed side by side.
    68	
    69	
    70	## The string
    71	
    72	The first thing the split made visible in the objects was a word. A new project needs its
    73	own name in the code it ships, so in March 2011 Libav began renaming — first the docs and
    74	configure in the shared tree, which the FFmpeg side reverted the next afternoon [R7], and
    75	then, in the fork, this:
    76	
    77	```console
    78	$ git -C repos/ffmpeg show --shortstat --format='%aD %an %s' 2912e87a6c | tail -1
    79	 1335 files changed, 5388 insertions(+), 5388 deletions(-)
    80	```
    81	
    82	[R7] `Replace FFmpeg with Libav in licence headers` — one word, exchanged 5,388 times in a
    83	single commit. And because the trees kept trading history, the word became tidal: each
    84	integration re-imported one name, each cleanup re-exported the other, for years. Today git
    85	can answer one narrow question — which sentence stands at FFmpeg's HEAD:
    86	
    87	```console
    88	$ git -C repos/ffmpeg grep -l 'This file is part of Libav' HEAD | wc -l
    89	0
    90	$ git -C repos/ffmpeg grep -l 'This file is part of FFmpeg' HEAD | wc -l
    91	5042
    92	```
    93	
    94	[R8] Zero and five thousand and forty-two. One part of a fork's long outcome, reduced to a
    95	grep.
    96	
    97	## qatar
    98	
    99	How did the trees trade history, exactly? Here is the strangest sustained pattern I know of
   100	in any repository. Seventy-five days after "merge commits are forbidden" entered the
   101	FFmpeg how-to, this object was minted:
   102	
   103	```console
   104	$ git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%H %aI %an %s' --reverse | head -1
   105	4defa68fe25eae4d7c27341e3b35811c047dcd3f 2011-04-02T01:51:44+02:00 Michael Niedermayer Merge remote branch 'qatar/master'
   106	```
   107	
   108	[R4] A merge — the forbidden object — of the other project's entire tree, from a remote
   109	named `qatar`, at 01:51 in the morning. Then again the next night. Then:
   110	
   111	```console
   112	$ git -C repos/ffmpeg rev-list --count --min-parents=2 --grep=qatar HEAD
   113	1151
   114	$ git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%an' | sort | uniq -c
   115	   1151 Michael Niedermayer
   116	```
   117	
   118	[R4] One thousand one hundred fifty-one qatar merges across three years — roughly one a day
   119	— and every single one authored by the same person. Stop on what one of those objects *is*,
   120	because I think you have to have done this work to feel the number. A merge of a rival tree
   121	is not a click. It is reading what changed over there since yesterday; it is carrying both
   122	lines of descent forward so the histories stay joined; and when the two sides have touched
   123	the same file — which happens constantly between trees that share everything — it is
   124	resolving the collision by hand, line by line, and owning the result. Some days that is
   125	five minutes. Some days it is the whole evening. I have postponed a single such merge for a
   126	week. This history contains eleven hundred and fifty-one of them, one author, and the hours
   127	they were made:
   128	
   129	```console
   130	$ git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%ad' --date=format:%H | sort | uniq -c | sort -rn | head -3
   131	    103 02
   132	     94 14
   133	     90 01
   134	```
   135	
   136	[R5] The most common hour is two in the morning; the second is two in the afternoon. The
   137	objects say when. They do not say why, and I am not going to guess on a living man's
   138	behalf. Read the histogram yourself and decide what to call it.
   139	
   140	And then it stops:
   141	
   142	```console
   143	$ git -C repos/ffmpeg log -1 --format='%aI%n%B' 4899ccd295
   144	2014-04-11T14:41:42+02:00
   145	Merge remote-tracking branch 'qatar/master'
   146	
   147	* qatar/master:
   148	  DNxHD: convert inline asm to yasm
   149	
   150	Conflicts:
   151		libavcodec/x86/Makefile
   152		libavcodec/x86/dnxhdenc.asm
   153	```
   154	
   155	[R6] The last qatar merge is an assembler port with two conflicted Makefiles. There is no
   156	farewell in it, no line drawn. The remote simply never appears again. Git cannot say why
   157	the cadence ended; the habit ended the way habits end.
   158	
   159	## fftools/ffmpeg.c
   160	
   161	Years later, doing the ordinary thing — asking for the biography of the project's most
   162	famous file — I hit the strangest object in this dig. `git log --follow --
   163	fftools/ffmpeg.c` says the file's history begins in October 2017. [R13] Seventeen years of
   164	`ffmpeg.c` missing. So I opened the commit where the path first appears. It is a merge of a
   165	Libav commit — Libav had reorganized its command-line tools under `avtools/`, with its tool
   166	named `avconv.c`; FFmpeg's tool was `ffmpeg.c` at the root. Look at the three trees:
   167	
   168	```console
   169	$ git -C repos/ffmpeg ls-tree 'fd5f4ac081^1' ffmpeg.c | head -1
   170	100644 blob 1d248bc269d8...	ffmpeg.c
   171	$ git -C repos/ffmpeg ls-tree 'fd5f4ac081^2' avtools/avconv.c | head -1
   172	100644 blob 5c36761c1d14...	avtools/avconv.c
   173	$ git -C repos/ffmpeg ls-tree fd5f4ac081 fftools/ffmpeg.c | head -1
   174	100644 blob 1d248bc269d8...	fftools/ffmpeg.c
   175	```
   176	
   177	[R13] The merged tree contains `fftools/ffmpeg.c` — a path that exists in *neither parent*.
   178	The blob is byte-for-byte FFmpeg's old `ffmpeg.c`; the directory idea is Libav's; the
   179	combination was coined inside the merge resolution itself. Six years into the split, the
   180	two inheritances are still being spliced, path by path — and the splice left a trap:
   181	`--follow` chases renames by comparing ordinary diffs, and a path born inside a merge
   182	resolution is invisible to it. The most famous file in the project has a git biography
   183	seventeen years shorter than its life.
   184	
   185	## The office
   186	
   187	Which leaves the seven lines from January. I expected the pickaxe to print a war. It
   188	printed four commits, sixteen years apart:
   189	
   190	```console
   191	$ git -C repos/ffmpeg log -S 'Project Leader' --format='%h %ai %an %s' -- MAINTAINERS
   192	07d930014d 2022-09-20 10:42:38 +0200 Anton Khirnov MAINTAINERS: remove the project leader section
   193	111ccca602 2011-01-19 18:53:53 +0100 Michael Niedermayer Revert "Initial MAINTAINERS update"
   194	f4f5cab94e 2011-01-18 11:05:51 -0800 Jason Garrett-Glaser Initial MAINTAINERS update
   195	7f2a97537c 2006-02-08 11:32:03 +0000 Diego Biurrun List of people maintaining different parts of FFmpeg.
   196	```
   197	
   198	[R9] Created in 2006. Deleted and restored in the twenty-four January hours. And then two
   199	entries from after everything, which between them say more than the whole 2011 archive.
   200	
   201	July 2015: Niedermayer edits the section himself — and removes only his own name. [R10]
   202	`MAINTAINERS: Remove myself as leader`. The heading stays. The phrase *final design
   203	decisions* stays. What remains in the file, for the next seven years, is an office with no
   204	one in it — a heading, a rule, and a blank where a person used to be. He does not stop
   205	working; a decade later he is still among the most active names in the tree. He takes his
   206	name off the door and leaves the office standing.
   207	
   208	September 2022: the empty office is taken down. The commit is signed by Anton Khirnov —
   209	third-most-prolific author in this repository's history [R12], and one of the developers
   210	who worked on Libav after the 2011 split.
   211	
   212	The forks had wound down; people had, one by one, come back to the shared tree. [R11]
   213	
   214	```console
   215	$ git -C repos/ffmpeg show -s --format='%B' 07d930014d | head -3
   216	MAINTAINERS: remove the project leader section
   217	
   218	The position does not exist anymore.
   219	```
   220	
   221	Not *he lost*. Not *we won*. A fact, four words, recorded eleven years late by someone who
   222	had once left over it. The 2011 commits each cited a discussion git never held. This one
   223	cites nothing. There was nothing left to discuss.
   224	
   225	## At home
   226	
   227	Two habits from this dig. First: pickaxe the headings, not just the names — `git log -S
   228	'Some Heading' -- MAINTAINERS` (or OWNERS, or CODEOWNERS) prints a role's biography on one
   229	screen, and the two commits worth reading closely are the one that deletes a *name* but
   230	leaves the *section*, and the one, maybe years later, that deletes the empty section. Ask
   231	what each meant in your project; here, one was a resignation and the other was the four
   232	words above. Second: `git log --follow` your own most famous file before you trust its age
   233	— a rename that happened inside a merge resolution will amputate its history without a
   234	trace. And if your project ever survived a fork, find what the other tree's remote was
   235	actually called, then count: `git log --grep=<name> --min-parents=2`. The written rule here
   236	said merge commits are forbidden. The record says 1,151, all by one man, with two in the
   237	morning as its most common hour. Believe the record.
   238	
   239	## Receipts
   240	
   241	- **R1** `git -C repos/ffmpeg log -1 --format='%aD%n%an%n%B' 111ccca602` — the restore, 2011-01-19: "Reason is that this has been mistakely commited as discussed."
   242	- **R2** `git -C repos/ffmpeg show f4f5cab94e -- MAINTAINERS` — 2011-01-18, Jason Garrett-Glaser: the seven deleted lines (Project Leader / Michael Niedermayer / final design decisions), citing the mailing-list thread.
   243	- **R3** `git -C repos/ffmpeg show ffe9fd253f -- doc/git-howto.txt` — 2011-01-17: "merge commits are forbidden… The master tree will reject pushes with merge commits."
   244	- **R4** `git -C repos/ffmpeg log --grep=qatar --min-parents=2 --reverse | head -1` + `rev-list --count` + author uniq — first qatar merge 2011-04-02 01:51; 1,151 qatar merges, all authored by Michael Niedermayer.
   245	- **R5** `git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%ad' --date=format:%H | sort | uniq -c | sort -rn` — hours: 103 at 02, 94 at 14, 90 at 01.
   246	- **R6** `git -C repos/ffmpeg log -1 --format='%aI%n%B' 4899ccd295` — the last qatar merge, 2014-04-11: DNxHD yasm conversion, two conflicted paths, no farewell.
   247	- **R7** `git -C repos/ffmpeg show --shortstat 2912e87a6c` + `log -1 c0b1bc8d17` — "Replace FFmpeg with Libav in licence headers," 1,335 files, 5,388 in / 5,388 out; the earlier partial rename reverted next day.
   248	- **R8** `git -C repos/ffmpeg grep -l 'This file is part of Libav' HEAD | wc -l` (0) vs `'part of FFmpeg'` (5,042) — which sentence stands at HEAD.
   249	- **R9** `git -C repos/ffmpeg log -S 'Project Leader' -- MAINTAINERS` — the section's four-commit biography, 2006–2022.
   250	- **R10** `git -C repos/ffmpeg show f2c58931e6` — 2015-07-31, "MAINTAINERS: Remove myself as leader": only the name line deleted; heading and "final design decisions" remain.
   251	- **R11** `git -C repos/ffmpeg show 07d930014d` — 2022-09-20, Anton Khirnov: "remove the project leader section / The position does not exist anymore."
   252	- **R12** `git -C repos/ffmpeg shortlog -sn HEAD | head -5` + `rev-list --count --min-parents=2 --author='Michael Niedermayer'` — Niedermayer 30,170 commits (6,625 merges); Khirnov third all-time at 5,833.
   253	- **R13** `git -C repos/ffmpeg ls-tree` on `fd5f4ac081^1`, `^2`, and the merge + `log --reverse --follow -- fftools/ffmpeg.c | head -1` — `fftools/ffmpeg.c` exists in neither parent, carries FFmpeg's exact blob, and `--follow` history starts 2017-10.
   254	
   255	*Full transcripts: `chapters/11-ffmpeg.receipts.md` (regenerate with `scripts/receipts-11.sh`).*
     1	# Remove promises
     2	
     3	Every programmer who has touched Node.js knows its origin story. Node — the software that runs
     4	much of the internet's plumbing, the thing that made JavaScript a serious server language —
     5	was built on *callbacks*. Instead of a clean way to say "do this, then do that with the
     6	result," you handed the system a function to phone back when it finished, and those
     7	phone-back functions nested inside each other until code drifted rightward across the screen
     8	in a shape programmers named, with feeling, "the pyramid of doom" and "callback hell." An
     9	entire decade of libraries existed just to make it bearable. And it was all traced back to a
    10	founding decision: Node's creator chose callbacks over the cleaner alternative the JavaScript
    11	world would eventually standardize, a thing called Promises.
    12	
    13	That is the story everyone repeats. It is also, in a specific and provable way, false — and
    14	the proof has been sitting in Node's own history the whole time, in a spot almost nobody
    15	thinks to look.
    16	
    17	## The zero
    18	
    19	Suppose you go looking. If Node had ever had a Promise system, its code would live in an
    20	obvious file — call it `promise.js`. Ask the project's history how many times that file was
    21	ever touched, across its entire seventeen-year life, and the answer is: zero. Never created,
    22	never edited. Which seems to settle it: no Promise code, no Promise history, callbacks from
    23	day one.
    24	
    25	But a filename is the wrong thing to search. Ask the history a different way — not "what
    26	happened to this file" but "when did the *word* Promise ever appear in the early years" — and
    27	the zero turns into a list. In June 2009, four months into the project, there are commits
    28	titled *Add Promise class*, *Implement Promises for file i/o*, *Improve Promise
    29	documentation*. Contributors building on them through the summer.
    30	
    31	Node had Promises. Not as a rejected proposal in a discussion somewhere — as real, shipped,
    32	documented code, with its own tests, that lived in the project for the better part of a year.
    33	The platform whose whole identity rests on *not* having had Promises spent its first year
    34	having them.
    35	
    36	## Saturday night
    37	
    38	Here is where they went. On the evening of Saturday, February 20, 2010, Ryan Dahl — Node's
    39	creator — made a commit titled, in full, *Remove promises*. No further explanation; the space
    40	where a reason would go is blank. The change deleted 306 lines and added nothing: the class,
    41	the file-integration, the documentation, the test file, all gone in one stroke.
    42	
    43	It's worth sitting with what he was looking at that night, because the real story is more
    44	reasonable than "he picked the wrong architecture." Node's Promises in 2010 were young and
    45	odd. And their headline feature was a method called `.wait()` that did something startling:
    46	it *froze the whole system* until the promised result arrived. Node's single great idea is
    47	that you must never freeze the system that way — that's the entire point of the platform. So
    48	the marquee convenience of its Promise experiment directly contradicted the reason Node
    49	existed. From where Ryan sat that Saturday, that wasn't a promising foundation to build the
    50	future on. It was a false start with a dangerous tool welded into it. So he cut it.
    51	
    52	What the history cannot tell us is what he meant by it — *never again*, or *not like this, not
    53	yet*. It only records what he did. Node then spent roughly five years without built-in
    54	Promises, becoming the callback platform and growing its whole callback-taming culture.
    55	Promises returned through the JavaScript language itself; `async`/`await` followed, but callback
    56	culture shaped the rest of the decade. The famous "founding choice" was made on
    57	a Saturday night, against one blocking method, and then hardened — through nothing but the
    58	passage of time and the difficulty of ever finding the deletion — into a legend that says the
    59	choice was there from the very beginning.
    60	
    61	The unsettling lesson underneath: in the current state of any codebase, "this never existed"
    62	and "this was deleted years ago" look *exactly the same*. The only difference lives in the
    63	history, and only if you know how to ask.
    64	
    65	## The one that didn't take
    66	
    67	Ryan's deletion of Promises stuck. It stuck because in 2010 the project was entirely his —
    68	what he removed stayed removed, because he was the only person whose hands were on the code.
    69	Two years later he tried the same kind of move on something smaller, and by then that was no
    70	longer true — and the difference is the whole point.
    71	
    72	Node had renamed a module from `sys` to `util`. In January 2012, Ryan decided the old name
    73	should stop working entirely: he made `require('sys')` crash on purpose, with a commit note
    74	saying it would be deleted for good in a future version. Same founder instinct — *this is
    75	over, I've decided.*
    76	
    77	But by 2012, look at whose hands were actually on the project. In 2009 it had been Ryan's, by a
    78	landslide: 815 changes to the next person's 10. By 2012 that had almost exactly flipped — a
    79	developer named Isaac Schlueter now making 861 changes to Ryan's 32. Ryan still held the
    80	project's *vision*. Someone else now held its *keys*.
    81	
    82	And five months after Ryan made `require('sys')` crash, Isaac reversed him. His commit is
    83	titled *Un-break require('sys')* — and that word, *un-break*, quietly takes a side: to Isaac,
    84	Ryan's deletion wasn't a decision, it was breakage, the kind users file bug reports about. In
    85	its place he restored a tiny bridge so that every old program using the old name would keep
    86	working. Three years after that, the project's governing committee settled the matter in
    87	writing, in a meeting note preserved in the history: *deprecate, don't remove.*
    88	
    89	So today, in 2026 — fourteen years later — `require('sys')` still works in Node, marked with a
    90	gentle "please use the new name" warning and a maintainer's comment stating plainly: *we do
    91	not plan to remove it.* The founder ordered it deleted. It's still here. The exact same
    92	instinct that erased Promises in 2010 tried to erase this in 2012 and simply couldn't — and
    93	the only thing that had changed in between was who was doing the daily work.
    94	
    95	A deletion, it turns out, only holds if the next person is willing to keep it deleted.
    96	
    97	## The fade
    98	
    99	Where was Ryan while his deletion was being undone? On his way out, in the quietest way a
   100	project's history can record someone leaving. There was no farewell, no handoff. His very last
   101	change to Node, ever, was a routine upgrade of a Google build tool — thousands of lines of
   102	somebody else's configuration files — after which his name simply stops appearing. The person
   103	who wrote *Remove promises* and set the shape of a platform left it not with a speech but with
   104	a version bump to a build system, because by then he was one voice among many, and the project
   105	belonged to the people who kept showing up to maintain it.
   106	
   107	## At home
   108	
   109	If you take one habit from this, take a healthy suspicion of the word "never." When someone
   110	tells you a project *never* did something — never had this feature, always worked that way —
   111	remember that the current code is not a list of facts about the software. It is the running
   112	scoreboard of every argument the software ever had, and the arguments that were settled by
   113	*deletion* leave no mark on the scoreboard at all. They live only in the history, and usually
   114	not under the name you'd guess. Go dig for the removal. And when a project announces that
   115	something will be deleted "in the next version," check whether it ever actually was —
   116	because, like `require('sys')`, the condemned thing often outlives the person who condemned
   117	it, kept alive by whoever inherits the keys.
   118	
   119	---
   120	
   121	*The vanished `promise.js`, the June 2009 Promise commits, the 306-line Saturday-night
   122	deletion, the `require('sys')` throw and its un-break, and the founder's build-tool farewell
   123	are all real and public, reproducible with a git command each. The full technical dig is here:
   124	[Remove promises — the full dig](13-node.full.html).*
2196
2511

exec
/bin/bash -lc "git -C repos/node show -s --no-mailmap --format='%H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' e7dec60a63b9171465fd4037a04aeb709198aea2
git -C repos/node show --format='' --no-ext-diff e7dec60a63b9171465fd4037a04aeb709198aea2 -- doc/tc-meetings/2014-10-29.md
git -C repos/node show --format='' --no-ext-diff f60abb0ced54f5ba08d324e62ad3fbb306ba37f7 -- CONTRIBUTING.md | sed -n '5,11p'
git -C repos/node show e7dec60a63b9171465fd4037a04aeb709198aea2:doc/tc-meetings/2014-10-29.md | sed -n '13,24p'
git -C repos/node show 51514c8e8cbd98be7f29c3f1508b625d16e91b5d:README.md | sed -n '1,9p'
git -C repos/node show -s --no-mailmap --format='%aI %an <%ae>%n%s' f17f473af5e28f4ec00a518f97a84b69c426309e
git -C repos/node show -s --no-mailmap --format='%aI %an <%ae>%n%s%n%n%b' a69ab27ab458385d24676792b75ad1c25b8c30e5 | sed -n '1,5p'
git -C repos/node show 'v4.0.0"'^{}:CHANGELOG.md'"' | sed -n '1,7p'
git -C repos/node merge-base --is-ancestor 'v3.3.0"'^{}'"' 'v4.0.0"'^{}'"'; echo "'$?
git -C repos/node rev-list --left-right --count '"'v3.3.0"'^{}...v4.0.0''^{}'"'" in /home/diablo/book16
 succeeded in 289ms:
e7dec60a63b9171465fd4037a04aeb709198aea2
parents 2c7847b3228b40aab8ea4902109639725eb0d8c3
Author: 2014-10-29T17:30:17-07:00 Mikeal Rogers <mikeal.rogers@gmail.com>
Committer: 2014-10-29T17:30:17-07:00 Mikeal Rogers <mikeal.rogers@gmail.com>

Said public when I meant private.
diff --git a/doc/tc-meetings/2014-10-29.md b/doc/tc-meetings/2014-10-29.md
index 0fa77502743..ce64c62ddb0 100644
--- a/doc/tc-meetings/2014-10-29.md
+++ b/doc/tc-meetings/2014-10-29.md
@@ -13,7 +13,7 @@
 * Update on "release buckets"
  * doesn't make sense while we're private, we'll wait until it is public again
 * `node-forward/node` going public
- * when we made the repo public it was messaged as only being for "four weeks"
+ * when we made the repo private it was messaged as only being for "four weeks"
  * "four weeks" is up on November 8th
  * someone on the Advisory Board needs to remind Joyent of this in the
    next advisory board meeting so they aren't suprised by it even though
@@ -6,13 +6,13 @@ through the process.
 
 ### FORK
 
-Fork the project [on GitHub](https://github.com/joyent/node) and check out
+Fork the project [on GitHub](https://github.com/node-forward/node) and check out
 your copy.
* Update on "release buckets"
 * doesn't make sense while we're private, we'll wait until it is public again
* `node-forward/node` going public
 * when we made the repo private it was messaged as only being for "four weeks"
 * "four weeks" is up on November 8th
 * someone on the Advisory Board needs to remind Joyent of this in the
   next advisory board meeting so they aren't suprised by it even though
   it was communicated to them when it was first made public.
 * @mikeal will work on the messaging in the README to make it clear this is
   a "soft" fork and not a "hard" fork.
 * ramifications of going public will be discussed in next week's TC meeting as
   well
io.js
===

This repository began as a GitHub fork of
[joyent/node](https://github.com/joyent/node) where contributions,
releases, and contributorship are under an
[open governance model](./CONTRIBUTING.md#governance).

We intend to release, with increasing regularity, releases which are
2015-01-08T14:00:43+01:00 Ben Noordhuis <info@bnoordhuis.nl>
build: rename binary from node to iojs
2015-08-13T12:14:34-04:00 cjihrig <cjihrig@gmail.com>
node: rename from io.js to node

This commit replaces instances of io.js with Node.js, based on the
recent convergence. There are some remaining instances of io.js,
# Node.js ChangeLog

## 2015-09-08, Version 4.0.0 (Stable), @rvagg

### Notable changes

This list of changes is relative to the last io.js v3.x branch release, v3.3.0. Please see the list of notable changes in the v3.x, v2.x and v1.x releases for a more complete list of changes from 0.12.x. Note, that some changes in the v3.x series as well as major breaking changes in this release constitute changes required for full convergence of the Node.js and io.js projects.
1
151	209

exec
/bin/bash -lc "git -C repos/node log --reverse --no-mailmap --format='%H %aI %an <%ae> | %s' origin/archived-io.js-v0.10 --not origin/main; git -C repos/node branch -r --contains e7dec60a63b9171465fd4037a04aeb709198aea2; git -C repos/node tag --contains e7dec60a63b9171465fd4037a04aeb709198aea2 | head" in /home/diablo/book16
 succeeded in 3934ms:
92598e8f2b50ee434fe2ffb7e02a97290cae1d31 2014-08-07T12:43:42-07:00 Timothy J Fontaine <tjfontaine@gmail.com> | node: Now working on v0.13.0
912b5e05811fd24f09f9d65200a1561a4482f166 2014-08-07T16:34:07-07:00 Timothy J Fontaine <tjfontaine@gmail.com> | Merge remote-tracking branch 'upstream/v0.12'
7c0419730b237dbfa0ec4e6fb33a99ff01825a8f 2014-09-17T08:26:44-07:00 Timothy J Fontaine <tjfontaine@gmail.com> | Merge remote-tracking branch 'upstream/v0.12'
25702abc5638bbecffa92e8349d2a871a5f592c9 2014-09-23T23:08:35-04:00 cjihrig <cjihrig@gmail.com> | net: remove use of arguments in Server constructor
f60abb0ced54f5ba08d324e62ad3fbb306ba37f7 2014-10-01T13:40:32-07:00 Mikeal Rogers <mikeal.rogers@gmail.com> | First draft of a new contribution policy.
cfcb1de130867197cbc9c6012b7e84e08e53d032 2014-10-03T00:00:40+08:00 Yazhong Liu <yorkiefixer@gmail.com> | stream: remove duplicated expression
051dc546d6c155de047cbbc07c44e8f905a7a332 2014-10-09T22:17:42-04:00 cjihrig <cjihrig@gmail.com> | node: update links in CONTRIBUTING.md
8c60aaad1442149b639c18b0eec716a7e6cbab7d 2014-10-10T19:29:06-04:00 Jeremiah Senkpiel <fishrock123@rocketmail.com> | node: add aliases to names in CONTRIBUTING.md
7ee5c4efbf07717c37413a26b8bd12605427dc5f 2014-10-09T12:12:20-07:00 Mikeal Rogers <mikeal.rogers@gmail.com> | node: outline invited persons and representatives
cafac11a5033ebe19c4fd44a4f3b108628cfa2d2 2014-10-10T19:34:36-04:00 Jeremiah Senkpiel <fishrock123@rocketmail.com> | node: refine TC percentage rules - CONTRIBUTING.md
9116fcda40697590ee4b251fd223de1b9784d0ca 2014-10-16T15:40:52+11:00 Rod Vagg <rod@vagg.org> | build: use %PYTHON% instead of python
6e997424177156001e1484f62bb1bbce4ea85046 2014-10-29T16:23:05+01:00 Ben Noordhuis <info@bnoordhuis.nl> | Merge remote-tracking branch 'joyent/master'
0d8cbdff51eab1fbaca06c26c12558fbd0bb8fe9 2014-10-29T16:24:12+01:00 Ben Noordhuis <info@bnoordhuis.nl> | Merge remote-tracking branch 'forward/v0.12'
3cb5f3db0faccc0caa5c6633aeb91654f2e49f6a 2014-10-09T16:16:49-07:00 Mikeal Rogers <mikeal.rogers@gmail.com> | doc: meeting notes from oct 9th TC meeting
2c7847b3228b40aab8ea4902109639725eb0d8c3 2014-10-29T15:17:56-07:00 Mikeal Rogers <mikeal.rogers@gmail.com> | doc: add TC notes from october 29th
e7dec60a63b9171465fd4037a04aeb709198aea2 2014-10-29T17:30:17-07:00 Mikeal Rogers <mikeal.rogers@gmail.com> | Said public when I meant private.
  origin/archived-io.js-v0.10

exec
/bin/bash -lc 'target_ref=refs/remotes/origin/archived-io.js-v0.10
other_refs=$(git -C repos/node for-each-ref --format='"'%(refname)' | grep -Fvx \""'$target_ref")
git -C repos/node rev-list --count "$target_ref" --not $other_refs
printf '"'branches_containing_tip\\n'
git -C repos/node branch -a --contains e7dec60a63b9171465fd4037a04aeb709198aea2
printf 'tags_containing_tip '
git -C repos/node tag --contains e7dec60a63b9171465fd4037a04aeb709198aea2 | wc -l" in /home/diablo/book16
 succeeded in 4057ms:
16
branches_containing_tip
  remotes/origin/archived-io.js-v0.10
tags_containing_tip 0

codex
All nine console fences reproduce exactly, including the custom formats and every `sed` boundary. The gating problems are in surrounding claims: one false chronology statement, one miscount, the seam’s use of “parent,” and an unsupported “no cost” conclusion. I’m doing the final visible-prose count now because the inline CHECK comments distort the template’s simple counter.
exec
/bin/bash -lc "awk '/"'^## Receipts/{exit} {print}'"' chapters/21-iojs.fable.md | perl -0777 -pe 's/<"'!--.*?-->//gs'"' | wc -w
awk '/"'^## Receipts/{exit} {print}'"' chapters/21-iojs.fable.md | wc -w
perl -0777 -ne 'while (/<"'!--'"\\s*CHECK:\\s*(.*?)-->/gs) { "'$x=$1; $x=~s/'"\\s+/ /g; print \""'$x'"\\n\" }' chapters/21-iojs.fable.md" in /home/diablo/book16
 succeeded in 305ms:
2109
2196
Node.js was corporately stewarded by Joyent in 2014; TJ Fontaine was Joyent's Node.js project lead at the time; community frustration over release cadence and governance drove the fork; needs external source. 
io.js shipped independent releases v1.0.0 (Jan 2015) through v3.3.0 (Sep 2015), on a rapid cadence, while joyent/node remained on 0.10/0.12; needs external source for the release timeline. 
the io.js/Node.js convergence of mid-2015 produced the Node.js Foundation, with Joyent transferring stewardship and io.js merging back; needs external source. 

codex
Factual gate: **FAIL**. All nine console fences reproduce exactly, including every custom format and `sed` range. The failures are in the surrounding prose, not the transcripts.

## Must-fix gates

1. **Correct the chronology and unsupported counts.**

   At [line 53](/home/diablo/book16/chapters/21-iojs.fable.md:53), “the first commit on the stranded branch *is* the plan” is false. The full unique history contains four earlier commits; R1 appears to support the sentence only because its log is path-filtered.

   Fix: “the first governance commit on the stranded branch is the plan” or “On October 1, the branch acquires its plan.”

   Also:

   - [Line 135](/home/diablo/book16/chapters/21-iojs.fable.md:135): “Five weeks later” compresses 38 days and violates the unusually strict count gate. Use “By January 8.”
   - [Line 166](/home/diablo/book16/chapters/21-iojs.fable.md:166): “four quiet words” is simply wrong; “Based on the recent convergence” is five words.
   - [Line 217](/home/diablo/book16/chapters/21-iojs.fable.md:217): “for a decade” accompanies an unsupported claim about nobody looking underneath. Cut the whole causal claim.
   - [Line 222](/home/diablo/book16/chapters/21-iojs.fable.md:222): “nine months” is unsupported and depends on where the split is declared to begin.

2. **Make R1 actually prove the locked “no other ref” claim.**

   R1 currently counts commits absent from `origin/main`; it does not exclude every other branch and tag. `branch -r --contains` only tests the tip against remote branches. Therefore [lines 8–10](/home/diablo/book16/chapters/21-iojs.fable.md:8) and the R1 receipt bullet overstate the printed evidence.

   Because the spine is locked, strengthen the receipt rather than weaken the prose: enumerate every ref except `refs/remotes/origin/archived-io.js-v0.10`, then count commits excluded from all of them. Also show that no tag contains the tip. The stronger check does return 16 in this clone; it simply is not in the receipts yet.

3. **Remove the forbidden ancestry implication from the seam.**

   The dangerous sentence is [lines 192–195](/home/diablo/book16/chapters/21-iojs.fable.md:192):

   > “The written record declares its parent: Node 4 is io.js 3.3, continued… The rebels’ release line became the official one.”

   “Parent” is precisely the Git relationship R9 disproves, while “release line became the official one” can be read as branch ancestry. Replace it with:

   > “The changelog declares its comparison baseline: v4’s list is relative to io.js v3.3.0. The release record preserves the fork’s numbering—v1, v2, v3, then Node v4.”

   In the receipts list, clarify R7 as: “the separate `8a9a3bf7` changelog-import commit on the v4 line is an ancestor of v4.0.0.” The present wording is technically correct but needlessly easy to misread as referring to the v3.3.0 tag.

4. **Scope “declared, not merged” to the two release tags.**

   [Lines 213–217](/home/diablo/book16/chapters/21-iojs.fable.md:213) call the non-ancestry “the true shape of the reunification.” That is broader than the evidence: R9 proves that the v3.3.0 tag is not an ancestor of v4.0.0; it does not prove that code and history were never merged during convergence.

   Fix explicitly:

   > “The continuity asserted between these two releases is editorial, not ancestral. That does not mean convergence contained no merges; it means the v3.3.0 release commit is not in v4.0.0’s parent chain. This particular continuity was declared, not merged.”

   Also change “two places that disagree” to “two layers that answer different questions.” The changelog and graph are not contradicting each other once “relative to” is read accurately.

5. **Replace the unsupported zero-cost ending with a concrete consequence.**

   [Lines 221–224](/home/diablo/book16/chapters/21-iojs.fable.md:221) are the weakest passage:

   > “no body count: no code lost, no community split that lasted longer than nine months…”

   “No code lost” is not established and is especially hazardous immediately after showing 151 commits unique to the v3 side. “No community split” is neither defined nor receipted. “One of the most-used platforms on earth” and “permanent constitution” are also unsourced superlatives.

   Delete those assertions. Build the consequence around evidence already in the plot:

   - The rename-back required an `iojs -> node` compatibility symlink.
   - The release record adopted io.js v3.3.0 as v4’s baseline despite non-ancestry.
   - After external verification, the governance settlement moved the project into the Foundation.

   This gives an SDE reader an operational consequence—compatibility and release lineage—rather than a victory summary.

6. **Clear and tighten all three CHECK markers.**

   All three are necessary in some form:

   1. **Joyent/TJ Fontaine context**, [lines 50–52](/home/diablo/book16/chapters/21-iojs.fable.md:50): Joyent stewardship and Fontaine’s role are necessary to interpret the empty invitation and 30% rule. “Community frustration … drove the fork” is broader and partisan; source it to contemporaneous statements or cut it. “Most important young platform” is outside the marker and should also be sourced or removed.

   2. **io.js 1.x–3.x timeline**, [lines 148–150](/home/diablo/book16/chapters/21-iojs.fable.md:148): necessary because the v4 numbering reveal depends on it. This is repository-verifiable; preferably add tag dates/releases to the receipts rather than relying on external history.

   3. **Convergence/Foundation outcome**, [lines 168–169](/home/diablo/book16/chapters/21-iojs.fable.md:168): indispensable, but “Joyent ceded” and “agreed to come home” narrate winners and losers. Verify the transfer, Foundation formation, governance terms, and io.js convergence separately using primary sources, then use neutral language such as “stewardship moved into the Node.js Foundation, and the projects converged.”

7. **Acknowledge that the repository evidence presents the organizers’ side.**

   The chapter currently says [lines 76–77](/home/diablo/book16/chapters/21-iojs.fable.md:76), “Nobody writes that sentence in the abstract. You write it about a specific employer,” then describes the group as [line 109](/home/diablo/book16/chapters/21-iojs.fable.md:109) “drafting the press release that says it isn’t” a fork. That edges into prosecutorial wit while Joyent has no voice in the evidence presented.

   Keep the inference but mark its limit:

   > “The rule makes employer concentration the problem this group chose to name. These minutes preserve the organizers’ diagnosis, not Joyent’s answer.”

   Replace the “loaded fork/press release” sentence with something closer to the record: they were deciding whether a pressure campaign had become a split and trying to warn Joyent before going public.

8. **Repair the at-home commands and claims.**

   At [lines 233–243](/home/diablo/book16/chapters/21-iojs.fable.md:233):

   - `rev-list --count <branch> --not origin/main` finds commits absent from main, not commits unique among every ref. Say exactly that.
   - `merge-base --is-ancestor v3 v4` prints nothing; the lesson depends on its exit status. Include `; echo $?` or an `if …; then …; else …; fi`.
   - Cut “A branch nobody merged … is usually a branch somebody couldn’t bring themselves…” It is attractive speculation, not archaeology.
   - Replace “The graph tells you what happened” with “The graph tells you how the commits relate.” The present wording creates the same false documents-versus-truth opposition the seam otherwise avoids.

9. **Restore the engineer-narrator while reallocating words.**

   The template command reports 2,196 words, four below the 2,200 floor—but that includes the inline CHECK text. Removing HTML comments gives approximately **2,109 reader-visible words**, 91 below the band.

   Do not pad. Cut roughly 150–200 words of exhibit translation—the six-name TC roster, “Read it slowly,” and the README paraphrase are the obvious places—then add 250–350 words of sourced consequence, fairness, and one first-person engineering beat at the seam. At present the narrator is an intelligent curator; the chapter needs one moment showing why an engineer cares about this distinction when bisecting, backporting, or auditing release notes.

## Optional suggestions

- The title works. The diff lets the reader see `public` become `private` one beat before the prose names the secret room, and the closing return lands without forcing a second pun.
- The main plot is coherent rather than a catalog: rehearsal → deadline → public product → rename-back → release seam. The seam currently feels appended because “who won?” introduces a new question. Bridge it with: “Renaming the executable settled the product’s name; importing the changelog settled which release history the reunited project would publish.”
- It is distinct from “Remove promises” at the receipt and plot level, but cut “did not belong to its contributors” and “people with their hands on the code”; those repeat that chapter’s daily-workers-inherit-the-project thesis.
- It is sufficiently distinct from ffmpeg only if the seam remains central. FFmpeg is authority contested through hostile, repeated merges; this is governance drafted privately and reunification made legible through a document. The generic rename/homecoming material should stay brief so that distinction arrives before the chapter feels like a second fork-war tour.
tokens used
75,957
Factual gate: **FAIL**. All nine console fences reproduce exactly, including every custom format and `sed` range. The failures are in the surrounding prose, not the transcripts.

## Must-fix gates

1. **Correct the chronology and unsupported counts.**

   At [line 53](/home/diablo/book16/chapters/21-iojs.fable.md:53), “the first commit on the stranded branch *is* the plan” is false. The full unique history contains four earlier commits; R1 appears to support the sentence only because its log is path-filtered.

   Fix: “the first governance commit on the stranded branch is the plan” or “On October 1, the branch acquires its plan.”

   Also:

   - [Line 135](/home/diablo/book16/chapters/21-iojs.fable.md:135): “Five weeks later” compresses 38 days and violates the unusually strict count gate. Use “By January 8.”
   - [Line 166](/home/diablo/book16/chapters/21-iojs.fable.md:166): “four quiet words” is simply wrong; “Based on the recent convergence” is five words.
   - [Line 217](/home/diablo/book16/chapters/21-iojs.fable.md:217): “for a decade” accompanies an unsupported claim about nobody looking underneath. Cut the whole causal claim.
   - [Line 222](/home/diablo/book16/chapters/21-iojs.fable.md:222): “nine months” is unsupported and depends on where the split is declared to begin.

2. **Make R1 actually prove the locked “no other ref” claim.**

   R1 currently counts commits absent from `origin/main`; it does not exclude every other branch and tag. `branch -r --contains` only tests the tip against remote branches. Therefore [lines 8–10](/home/diablo/book16/chapters/21-iojs.fable.md:8) and the R1 receipt bullet overstate the printed evidence.

   Because the spine is locked, strengthen the receipt rather than weaken the prose: enumerate every ref except `refs/remotes/origin/archived-io.js-v0.10`, then count commits excluded from all of them. Also show that no tag contains the tip. The stronger check does return 16 in this clone; it simply is not in the receipts yet.

3. **Remove the forbidden ancestry implication from the seam.**

   The dangerous sentence is [lines 192–195](/home/diablo/book16/chapters/21-iojs.fable.md:192):

   > “The written record declares its parent: Node 4 is io.js 3.3, continued… The rebels’ release line became the official one.”

   “Parent” is precisely the Git relationship R9 disproves, while “release line became the official one” can be read as branch ancestry. Replace it with:

   > “The changelog declares its comparison baseline: v4’s list is relative to io.js v3.3.0. The release record preserves the fork’s numbering—v1, v2, v3, then Node v4.”

   In the receipts list, clarify R7 as: “the separate `8a9a3bf7` changelog-import commit on the v4 line is an ancestor of v4.0.0.” The present wording is technically correct but needlessly easy to misread as referring to the v3.3.0 tag.

4. **Scope “declared, not merged” to the two release tags.**

   [Lines 213–217](/home/diablo/book16/chapters/21-iojs.fable.md:213) call the non-ancestry “the true shape of the reunification.” That is broader than the evidence: R9 proves that the v3.3.0 tag is not an ancestor of v4.0.0; it does not prove that code and history were never merged during convergence.

   Fix explicitly:

   > “The continuity asserted between these two releases is editorial, not ancestral. That does not mean convergence contained no merges; it means the v3.3.0 release commit is not in v4.0.0’s parent chain. This particular continuity was declared, not merged.”

   Also change “two places that disagree” to “two layers that answer different questions.” The changelog and graph are not contradicting each other once “relative to” is read accurately.

5. **Replace the unsupported zero-cost ending with a concrete consequence.**

   [Lines 221–224](/home/diablo/book16/chapters/21-iojs.fable.md:221) are the weakest passage:

   > “no body count: no code lost, no community split that lasted longer than nine months…”

   “No code lost” is not established and is especially hazardous immediately after showing 151 commits unique to the v3 side. “No community split” is neither defined nor receipted. “One of the most-used platforms on earth” and “permanent constitution” are also unsourced superlatives.

   Delete those assertions. Build the consequence around evidence already in the plot:

   - The rename-back required an `iojs -> node` compatibility symlink.
   - The release record adopted io.js v3.3.0 as v4’s baseline despite non-ancestry.
   - After external verification, the governance settlement moved the project into the Foundation.

   This gives an SDE reader an operational consequence—compatibility and release lineage—rather than a victory summary.

6. **Clear and tighten all three CHECK markers.**

   All three are necessary in some form:

   1. **Joyent/TJ Fontaine context**, [lines 50–52](/home/diablo/book16/chapters/21-iojs.fable.md:50): Joyent stewardship and Fontaine’s role are necessary to interpret the empty invitation and 30% rule. “Community frustration … drove the fork” is broader and partisan; source it to contemporaneous statements or cut it. “Most important young platform” is outside the marker and should also be sourced or removed.

   2. **io.js 1.x–3.x timeline**, [lines 148–150](/home/diablo/book16/chapters/21-iojs.fable.md:148): necessary because the v4 numbering reveal depends on it. This is repository-verifiable; preferably add tag dates/releases to the receipts rather than relying on external history.

   3. **Convergence/Foundation outcome**, [lines 168–169](/home/diablo/book16/chapters/21-iojs.fable.md:168): indispensable, but “Joyent ceded” and “agreed to come home” narrate winners and losers. Verify the transfer, Foundation formation, governance terms, and io.js convergence separately using primary sources, then use neutral language such as “stewardship moved into the Node.js Foundation, and the projects converged.”

7. **Acknowledge that the repository evidence presents the organizers’ side.**

   The chapter currently says [lines 76–77](/home/diablo/book16/chapters/21-iojs.fable.md:76), “Nobody writes that sentence in the abstract. You write it about a specific employer,” then describes the group as [line 109](/home/diablo/book16/chapters/21-iojs.fable.md:109) “drafting the press release that says it isn’t” a fork. That edges into prosecutorial wit while Joyent has no voice in the evidence presented.

   Keep the inference but mark its limit:

   > “The rule makes employer concentration the problem this group chose to name. These minutes preserve the organizers’ diagnosis, not Joyent’s answer.”

   Replace the “loaded fork/press release” sentence with something closer to the record: they were deciding whether a pressure campaign had become a split and trying to warn Joyent before going public.

8. **Repair the at-home commands and claims.**

   At [lines 233–243](/home/diablo/book16/chapters/21-iojs.fable.md:233):

   - `rev-list --count <branch> --not origin/main` finds commits absent from main, not commits unique among every ref. Say exactly that.
   - `merge-base --is-ancestor v3 v4` prints nothing; the lesson depends on its exit status. Include `; echo $?` or an `if …; then …; else …; fi`.
   - Cut “A branch nobody merged … is usually a branch somebody couldn’t bring themselves…” It is attractive speculation, not archaeology.
   - Replace “The graph tells you what happened” with “The graph tells you how the commits relate.” The present wording creates the same false documents-versus-truth opposition the seam otherwise avoids.

9. **Restore the engineer-narrator while reallocating words.**

   The template command reports 2,196 words, four below the 2,200 floor—but that includes the inline CHECK text. Removing HTML comments gives approximately **2,109 reader-visible words**, 91 below the band.

   Do not pad. Cut roughly 150–200 words of exhibit translation—the six-name TC roster, “Read it slowly,” and the README paraphrase are the obvious places—then add 250–350 words of sourced consequence, fairness, and one first-person engineering beat at the seam. At present the narrator is an intelligent curator; the chapter needs one moment showing why an engineer cares about this distinction when bisecting, backporting, or auditing release notes.

## Optional suggestions

- The title works. The diff lets the reader see `public` become `private` one beat before the prose names the secret room, and the closing return lands without forcing a second pun.
- The main plot is coherent rather than a catalog: rehearsal → deadline → public product → rename-back → release seam. The seam currently feels appended because “who won?” introduces a new question. Bridge it with: “Renaming the executable settled the product’s name; importing the changelog settled which release history the reunited project would publish.”
- It is distinct from “Remove promises” at the receipt and plot level, but cut “did not belong to its contributors” and “people with their hands on the code”; those repeat that chapter’s daily-workers-inherit-the-project thesis.
- It is sufficiently distinct from ffmpeg only if the seam remains central. FFmpeg is authority contested through hostile, repeated merges; this is governance drafted privately and reunification made legible through a document. The generic rename/homecoming material should stay brief so that distinction arrives before the chapter feels like a second fork-war tour.
