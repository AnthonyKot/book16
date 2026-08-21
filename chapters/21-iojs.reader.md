# Said public when I meant private

Every repository you clone carries branches you never look at, and most of them are noise. But in
the official Node.js repository there is an archived branch holding sixteen commits that are
reachable from nothing else — not from the main line, not from any other branch, not from a single
one of the project's tags. Sixteen commits stranded on a shelf. The last of them, October 29th,
2014, carries this subject line:

> Said public when I meant private.

The change is one word, in a set of meeting minutes. A line that read *when we made the repo
public it was messaged as only being for "four weeks"* should have read *private*.

A typo fix — the most mundane commit imaginable. It is also a confession, because the sentence
being corrected is about a secret. In the autumn of 2014, the future of Node.js — the platform
running an enormous share of the internet's servers — was being planned in a private repository,
on a clock, by people rehearsing a governance revolution. The stranded branch is the war room,
accidentally preserved. And the typo fix is my favourite kind of receipt: nobody writing "Said
public when I meant private" thinks they are writing history.

One caution before we go in. These minutes are the organizers' record. Joyent, the company that
stewarded Node at the time, kept no diary on this shelf. What survives here is one side's
diagnosis, not the other side's answer.

## The rehearsal

On October 1st, 2014, the branch acquires its plan: a draft "contribution policy" written not for
Joyent's repository but for a new one, `node-forward/node`. The diff quietly redirects every
pointer away from the company's repo — and adds a section that had never existed in Node before,
titled **Governance**.

It names a technical committee drawn from the project's active contributors. It records that
invitations went to two more people who "have not accepted but are still invited to participate."
And it writes down one rule that tells you exactly what wound the document was built around:

> No more than 30% of the TC membership can be affiliated with the same employer.

Nobody writes that sentence in the abstract. It names employer concentration as the problem this
group chose to write down — which is their diagnosis, not proof of what the company was doing.

## Four weeks

They committed their meeting minutes, which is why any of this is knowable. The section being
corrected by that typo fix reads, in full:

> `node-forward/node` going public — when we made the repo private it was messaged as only being
> for "four weeks" — "four weeks" is up on November 8th — someone on the Advisory Board needs to
> remind Joyent of this in the next advisory board meeting so they aren't suprised by it — @mikeal
> will work on the messaging in the README to make it clear this is a "soft" fork and not a "hard"
> fork.

Every line is load-bearing. The repository is private, but only for four weeks, and the clock runs
out on November 8th. Someone has to *remind Joyent* before the deadline, so the company isn't
surprised. And the last worry is about wording: make clear this is a soft fork, not a hard one.
These are people working out whether a pressure campaign has become a split, trying to warn the
other side before going public — and keeping minutes of it, committed like code, because
committing things like code was the only way they knew how to be.

## io.js

The soft fork went public with a new name. On December 1st the README's opening line — Node's old
one-sentence description — is replaced with:

> io.js … This repository began as a GitHub fork of joyent/node where contributions, releases, and
> contributorship are under an open governance model.

An origin story in the first sentence and the manifesto in the second: *open governance*, the
phrase the whole war was about. Five weeks later the split reaches the deepest place a fork can
reach — the name of the program itself. A commit titled "build: rename binary from node to iojs"
walks the build system and installer from `node` to `iojs`. When a fork renames its binary, it has
stopped being a pressure campaign and become a product.

And it shipped like one. The repository's own tags record the pace: io.js v1.0.0 in January 2015,
v2.0.0 in May, v3.0.0 in August, v3.3.0 in September. Three major versions in eight months. Hold
those numbers — they matter more than anything else here.

## The homecoming

Then the war ends the way the minutes always hoped it would. In August 2015 a commit titled "node:
rename from io.js to node" explains itself in five words: *based on the recent convergence.* That
June, the two communities had agreed to merge their codebases under a neutral body — the Node.js
Foundation, hosted by the Linux Foundation — with stewardship of the company's repositories
transferring there.
<!-- VERIFIED: On 2015-06-16 the Node.js and io.js communities announced they would merge codebases under the Node.js Foundation, hosted by the Linux Foundation; ownership of the joyent/* repositories transferred to the Foundation; v4.0.0 (Sept 2015) combined both codebases. https://nodejs.org/en/blog/announcements/foundation-v4-announce and https://sdtimes.com/io-js/node-js-and-io-js-to-merge-under-node-js-foundation/ -->
The diff is January's rename played backwards: 96 files, `iojs` becoming `node` again.

Renaming the executable settled the product's name. The first reunified release is where you find
out what the *history* settled.

## The seam

That release was called Node.js **v4.0.0** — not 0.13, not 1.0. Its changelog opens by announcing
its own baseline: *"This list of changes is relative to the last io.js v3.x branch release,
v3.3.0."* The published numbering keeps the fork's counting — v1, v2, v3, then Node v4. The
rebels' release record became the official one.

Now ask git the same question. Is io.js v3.3.0 an ancestor of Node v4.0.0?

It is not. The two tagged releases sit on lines that had already diverged — 151 commits on one
side, 209 on the other, from a common base. The connection was made with a document instead:
someone cherry-picked the io.js v3.3.0 changelog entry onto the v4 line as its own commit, so the
new project's release record would *read* continuous where the graph is not.

These are two layers answering different questions, and both answers are honest. The continuity
asserted between those two releases is editorial, not ancestral. It doesn't mean the projects
never merged during convergence — it means the v3.3.0 release commit is not in v4.0.0's parent
chain. This particular continuity was declared, not merged.

## What it cost

The bill for that seam is small, specific, and still sitting there. Node's public version numbers
start at 4 because somebody else spent 1, 2, and 3 — the fork's counting is permanent. And the
v4.0.0 changelog enumerates its changes relative to a release it does not descend from, which is a
live hazard for the two things engineers actually do with release history: ask for every commit
between two releases, or bisect across them. Do either across that boundary and you are walking a
graph the changelog does not describe. I have been burned by smaller seams: the moment you read a
"relative to" line as an ancestry claim, your tooling and your document disagree — and the
document is the one that sounds authoritative.

What the fork actually won isn't in the diff at all: the governance model named in that December
README, carried into a foundation the following summer. What it left in the repository is a
version number, a changelog baseline, and sixteen commits on a shelf.

## At home

Two habits, both cheap. First: your repository's remote branches are an archive of the arguments
the project survived. List them, find the stranded ones, and ask what they hold that the main line
doesn't. A branch nobody merged and nobody deleted is often where the interesting history is.

Second: when a project claims lineage — "version 4 continues version 3" — check whether the claim
is ancestral or editorial. `git merge-base --is-ancestor v3 v4; echo $?` answers in one character:
`0` means the graph agrees, `1` means the continuity lives in a document. Both kinds are
legitimate, and neither is a lie. But they are different claims, and the day you're bisecting
across the seam or trusting a changelog to list every change, the difference becomes yours to
discover. The documents tell you the story the project agreed on. The graph tells you how the
commits relate. Read both, and mind the seam.

---

*The stranded branch and its sixteen commits, the "four weeks" minutes, the governance draft with
its 30% rule, the binary renamed out and back, and the changelog that claims a baseline git will
not confirm are all real and public, reproducible with a git command each. The full technical dig
is here: [Said public when I meant private — the full dig](21-iojs.full.html).*
