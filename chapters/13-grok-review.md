# Craft review: “Remove promises”

Chapter 13, nodejs/node — the deletion that became folklore, and the one
that did not. 1,554 words of body against a 2,200–3,200 band. This is a
craft review, not a fact check. Hashes, dates, commands, and quoted
output are locked. I am not touching them.

The bones are the right bones, and they are almost in the right order. A
log that says `Add Promise class` in a repository famous for not having
them; two words on a Saturday night and 306 lines gone; a path that
returns zero; a throw the next lead named *breakage*; a committee minute
that says *don't remove*; a `lib/sys.js` at HEAD that still exports the
old spelling; a last object that is a GYP bump. The through-line is
already a sentence the book has earned: the tree is the current state of
an argument, not the argument, and a deletion leaves no trace in the
tree. Three sentences in this draft are keepers for the series, and two
more will be if the captions around them die. I will name them.

The problem is not two deletions. Two photographs of one thought is the
chapter: a deletion that won so completely it became "never existed," and
a deletion that lost so completely the note says *we do not plan to
remove it*. The problem is that the doorway issues the folklore as a
quiz the narrator has already passed, the Saturday is a caption of an
empty body, and Isaac's Tuesday is a shortlog inversion with a moral
attached. 1,554 is under the floor. That is permission to sit in the two
rooms the prompt already named. It is not permission to add a third
deletion, and it is not a mandate to catch the culture out.

That is the whole job.

---

## 1. Spine and mirror

**They cohere. Promises is primary. Sys is the proof that deletion is an
argument. They become two chapters when the hinge is succession.**

The prompt asked this first, so I will not bury it.

The Promises story is the spine, and it is this chapter's reason to
exist. Chapter 06 taught that a famous first commit can be a title card.
Chapter 11 taught that a deletion can be the opening move of a fork.
Chapter 12 taught that a revert is a new object, still an ancestor.
None of those is: a shipped API, lived-with, tested, then deleted in two
words, after which the tree itself testifies that the thing never
existed. That is unique in the corpus. The folklore is not a rumor the
narrator heard. It is what `git log -- lib/promise.js` prints. Protect
that. It is not "Node is more interesting than people think." It is:
the current tree is a won argument, and won arguments look like nature.

The sys story is the mirror, and it belongs, *if* it is the same thought
run the other way. Promises: deletion holds, the tree forgets, folklore
is the forgetting. Sys: deletion does not hold, the tree remembers, the
note at HEAD is the remembering. One tool, two outcomes. That is not a
second chapter. That is why the register sentence — "The tree is the
current state of an argument. It is not the argument." — is the chapter
and not a caption on Promises alone. After a successful deletion, the
tree looks like fact. After a failed one, the tree still has the fight
in it (`module.exports = require('util')`, `we do not plan to remove
it`). You need both photographs for the sentence to mean what it says.

They stop cohering in this paragraph:

> Ryan deleted Promises and it stuck — because he was still the founder,
> still the final word, and the removal simply became the way things
> were. But watch what happens two years later, when he tries the same
> move on something smaller and the timing is just slightly off.

That is a rematch. "The same move." "Watch what happens." "Just slightly
off." The narrator knows the ending and has invited us to watch a
founder lose his grip. From here the chapter is secretly about
succession: 815 to 10, then 861 to 32; the founder owned the vision, the
maintainer owned the tree; Ryan fades; Isaac un-breaks. That chapter
already shipped. It is 07. Bram's last object is a stranger's spelling
fix; Ryan's last object is a build-tool bump; both men leave without a
speech. If sys is here to prove that the next lead can overrule the
founder, you are writing the vim chapter again with a JavaScript accent,
and you should not.

Primary, then: Promises, the folklore, the hole, the pickaxe. Mirror:
sys, one throw, one un-break, one vote, HEAD 2026. The rhyme is not
power. The rhyme is what the tree still contains. Do not write "the
same move." Do not write "watch what happens." Start sys on the object
(`require('sys') now throws`, body `To be removed in v0.9`) and let the
reader feel the smaller deletion before anyone ranks it. The shortlog
inversion can sit, as a photograph of who was landing patches — not as
the reason the deletion failed. Isaac's subject line, *Un-break*, is
the reason, and it is already in the draft.

The fade is a postcard, not a third act. Keep the GYP bump. Cut the
elegy that currently uses it as a wreath. Chapter 07 owns "the last
commit is never a speech." You do not owe a callback. You do owe not to
bronze a version bump as a departure. One object, starved: 4,065 lines
of somebody else's build tool, then he is not in the log. The vision/tree
moral is already in At home, and At home should not have it either. One
landing.

Do not name the rhymes. Do not write "unlike vim," "unlike genesis,"
"unlike the PHP revert." The hole and the pickaxe will distinguish this
from 06 and 12 if you let them be a path that returns zero and a content
search, not a briefing on how deletion differs from revert. The reader
has a memory.

---

## 2. The ~ beat

**Keep the thought. Starve "almost always." Move it onto the hole. A
second is earned after HEAD, and it is already in the draft as ordinary
prose.**

Present placement:

> Three hundred and six lines removed, nothing added. Eight months of
> API — the class, the file-I/O integration, the documentation, the
> tests — gone in a single object on a Saturday night. Everything that
> came after, the entire callback identity of Node, is downstream of
> this commit. Node did not *choose* callbacks over Promises at its
> founding. It tried Promises, shipped them, lived with them for a year,
> and then one person deleted them, and the deletion is what hardened
> into a decade of folklore that says the choice was made at the
> beginning and never reconsidered.
>
> ~ "This project never had X" almost always means someone deleted X,
> and the deletion is the thing worth reading.

The ~ is the right thought in the wrong place, wearing the wrong coat.

**Too early.** The reader has been told, in paragraph one, that the
origin story is wrong. Then shown a log. Then told they had Promises.
Then shown the deletion. Then told the folklore is this deletion,
misremembered. *Then* the maxim. The beat that should have been felt
from `lib/promise.js` returning 0 has been issued as a proverb before
the hole has been allowed to exist. Same disease as chapter 11 putting
the ~ after the founding of Libav had already been named, and as
chapter 12 putting "a revert is not a deletion" in a lecture before
`merge-base --is-ancestor` printed yes.

**Too general.** "Almost always" is the narrator as folklorist of
folklore. The book does not get to claim a law of repositories from one
Saturday. Compare keepers: "The last commit is never a speech." "The
planted date is precise about everything except the thing it plants."
"The revert is the last commit in which this project is one project."
Those are objects. This ~ is a hunting tip with a statistic in it.

**Spent twice more.** The hole then says it in better English — "The
absence in today's tree reads as 'never existed.' Only the history says
'removed, deliberately, on this date, by this hand.'" At home says it a
third time as homework. Three landings of one thought, none of them
after the command that would have made the reader think it.

**Move:** after `wc -l` prints 0. After the class is shown living inside
`src/node.js`, next to EventEmitter, not at a path you would search.
Then, starved:

> ~ The absence reads as never. The history reads as removed.

Or, if you want the hunting tip in the book's voice, without the
census:

> ~ "Never had" is usually a deletion.

Do not say almost always. Do not say the deletion is the thing worth
reading — that is the chapter, announcing itself. The 0 has just
printed. Let it.

**A second ~, after sys at HEAD, not before.** The register sentence is
currently spent at the end of **Why you can't find it**, before the
mirror has run:

> The tree is the current state of an argument. It is not the argument.

That is the chapter's sentence. After a successful deletion it is only
half-true: the tree looks like fact, which is the folklore's whole
trick. After `show HEAD:lib/sys.js` prints *we do not plan to remove
it*, the sentence is exact, because the argument is still in the file.
Promote it. Put the tildes on it. Cut it from the hole section, where
it is a thesis the second photograph has not yet earned.

Do not add a third. Candidates that should not get tildes: the empty
body (let two words sit), *Un-break* (the word already chooses a side),
the GYP bump (a postcard; a ~ there is chapter 07's wreath). Two
thoughts, two photographs. That is the band.

---

## 3. The narrator is enjoying the catch

**Yes. Paragraph one is a quiz. The empty body is being prosecuted for
not apologizing. There is no I, so the opinions come out as
omniscience.**

The prompt asked this plainly.

> Everyone knows that Node.js is the platform that chose callbacks. Its
> whole culture — the error-first `function(err, data)`, callback hell,
> the pyramid of doom, the decade of libraries that existed only to tame
> it — grew from a founding decision to build asynchronous I/O on
> callbacks instead of the alternative the JavaScript world would later
> standardize: Promises. It is the origin story you have heard. It is
> also wrong, and the repository has known it was wrong the whole time.
> Ask:

TEMPLATE.md: not "This is the story of…". That is this paragraph. It
names the folklore, names the alternative, names that the folklore is
wrong, and names that the repository has always known, *then* offers
the log as a test. "Ask:" is a game-show host. "Everyone knows" is a
crowd the narrator is smarter than. "The repository has known it was
wrong the whole time" is the catch, issued before a single hash.

The reader who has written Node, or who has only heard the folklore,
should feel `Add Promise class` in June 2009 a beat before anyone says
the origin story is wrong. Right now they are told it is wrong, then
asked to confirm. That is the opposite of the book's method, and it is
the same doorway-conviction chapter 12 was told to cut.

The catch continues after the deletion, as a recap that restates the
title in italics:

> Node did not *choose* callbacks over Promises at its founding.

The title already said `Remove promises`. The 306 already printed. The
italic is a finger. Cut it.

And here, the empty body is charged with three absences:

> Two words in the subject, and the body of the commit is empty — no
> rationale, no link to a discussion, no apology. Just the deletion:

No rationale is a fact; the format string asked for `%b` and got
nothing. No link to a discussion is the same fact, twice. *No apology*
is a demand the book does not get to make. CONTEXT.md: reconstruct what
the actor knew when they typed; no sneering; the reader should think "I
might have done this." An empty body on a Saturday night, from the man
who still is the project, is confidence, not a cover-up. Two words were
enough *for him*. Sit in that. Do not send the commit to ethics
committee for a missing sorry.

First person is allowed and this chapter has none. That is why the
opinions read as a docent. "It is also wrong" is an I wearing
omniscience. One I belongs in the hole, which is this narrator's actual
job — an engineer who runs `blame` daily, looking in the place a
Promise would live:

> I went looking in `lib/promise.js`. Zero.

That is not a personality. That is the tool. At home can borrow it if
the hole didn't use it. One landing, not a memoir.

The blast-radius sentence is the catch in a different coat:

> Everything that came after, the entire callback identity of Node, is
> downstream of this commit.

Maybe. The receipts do not contain the decade of libraries, and they do
not contain the later, different Promises Node grew after ES6. You do
not need to add those objects — that would be a sixth exhibit, and the
return of Promises is a different chapter. You do need not to claim
"the entire callback identity" from 306 lines and an empty body. The
deletion is what the folklore is made of. That is enough blast. Starve
the downstream.

---

## 4. Title

**It flips. Paragraph one spends the flip. Protect it.**

`Remove promises` is the Saturday-night subject, two words, empty body.
After this chapter it is also the founding of the callback culture: the
choice the folklore places at the beginning was a deletion, in February,
by one person. That is a flip in the same family as `Fix typo` (it was
not a typo) and `add flat map` (the helper was the crime) and `The
current maintainer` (a LICENSE line that becomes true). It is quieter
than those. It does not ironize the subject. It *is* the subject. The
irony is in the folklore the title erases.

The title only gets to do that work if the first screen does not
explain "Node chose callbacks" and then announce that this is false.
Right now a reader sees `Remove promises`, then is told the origin
story, then is told the origin story is wrong, then is shown the
commit whose subject is the title. The title has been used as a
caption on itself.

Let it sit as the event. Open on the 2009 log, or on the hole, without
the folklore paragraph. The reader who arrives with "Node chose
callbacks" sees `Add Promise class` and feels the skip. Then Saturday,
`Remove promises`, 306 lines. Then — and only then — the origin story
you have heard is this object, misremembered as a founding. The title
has flipped in the reader's head, which is the only place a title can.

Do not add a question mark. Do not retitle to `To be removed in v0.9`
(that is the mirror, and it would make sys primary). Do not retitle to
the register sentence. The commit subject is the chapter. Keep it.

---

## 5. Structure and pacing

**The order of objects is right. Do not reshuffle the photographs. Reseat
the folklore, sit in the two Tuesdays, starve the hinge and the elegy.**

Current shape:

1. Folklore as jacket copy; six-line log; "Node had Promises."
2. Saturday: `Remove promises`, empty body, 306, recap, ~.
3. The hole: `lib/promise.js` = 0; class inside `src/node.js`; pickaxe;
   register sentence.
4. Sys: rematch intro; throw; shortlog inversion; *Un-break*; TC vote;
   HEAD 2026.
5. Fade: GYP; vision/tree moral.
6. At home: both theses, plus the founder/maintainer moral, as homework.

The photographs want to be in that order. The folklore wants to move
*after* Saturday, not before the log. The ~ wants to move onto the 0.
The register sentence wants to move onto HEAD. The rematch intro wants
to die. The two rooms that would fill the band are currently captions.

Consecutive-open with 12 is already satisfied if this does not open on
`git show` of a single commit header. 12 is a `fuller` identity block.
A six-line `log --reverse` is a different object. A `wc -l` of 0 is a
different object. Either will do. A `git show -s` of `0485cc41d5` as
the first screen would be the same doorway as 12, and TEMPLATE.md would
like you not to.

Headings: **Why you can't find it** is a method promise, slightly
docent, usable if it stays a path. **The deletion that didn't take** is
a spoiler. It names the verdict of the mirror before `throw` has
printed. Call the section `require('sys')` or `To be removed in v0.9` or
`Un-break` — a label, like **The fade**, which is the right kind of
heading and should stay, if the elegy under it dies.

Duration, as prose hygiene, not a fact dispute: the log is June 2009 to
February 2010, which the receipts call eight months, and the prose says
"most of a year," "its first year having them," and "lived with them
for a year" in the same opening. Pick eight months. The year is a
swell.

v0.9 is carefully handled and should stay carefully handled. The body
says `To be removed in v0.9`. The chapter never claims the series did
not exist. Do not add a lecture that the tags are there. That would be
arguing with a mistake this draft did not make. The promised *deletion*
never came: that is the line, and HEAD is the proof.

Do not inflate the sys objects. One throw, one un-break, one 2015 vote
that minutes *deprecate, don't remove*. That is already three
photographs and it is not a war. This sentence is the inflation:

> It went further than a single reversal.

Cut it. The TC meeting is a new kind of object (a committee, a minute in
a commit body), not a campaign continuing. "Settled the question against
the founder for good" is the courtroom. The minute already settled it:
*don't remove*. Let the minute.

One more precision, because the caption is slightly stronger than the
tree: "The rename Ryan ordered never happened." The module *was*
renamed to `util`. What never happened is the deletion of the old name.
`require('sys')` still works; that is the photograph. Starve "the rename
never happened" to "the old name still works." The throw is gone. The
shim is here. That is enough.

Ryan in June 2012: the fade currently asks "Where was Ryan while his
`sys` deletion was being reversed?" as if he had already left. The
un-break is 28 June. His last object is 22 August. He is in the 2012
shortlog for 32 commits. He had the bits. He did not put the throw
back. That is sharper than absence, and it is what the log actually
contains. Do not write him out of the summer to make the GYP bump
lonelier. Do not invent his feelings about the un-break either. The
object is: the founder was still landing patches, and the next patches
were not a re-throw.

---

## 6. Prose

### Clunkiest sentence

> Node did not *choose* callbacks over Promises at its founding. It
> tried Promises, shipped them, lived with them for a year, and then one
> person deleted them, and the deletion is what hardened into a decade
> of folklore that says the choice was made at the beginning and never
> reconsidered.

The whole chapter, after the chapter has already been told, in one pile,
with the title italicized as a scold, and a year where the log said
eight months. The 306 has just printed. The empty body has just
printed. They do not need a voice-over.

Rewrite, after the stat, before anyone explains folklore:

> Eight months of API, two words, nothing in the body.

If you need a second sentence so the folklore can arrive *earned*, after
the hole, not here:

> The origin story you have heard is this Saturday, remembered as a
> founding choice.

That is the inversion. It does not need *choose*, or "one person," or
"hardened," or "never reconsidered." The hole will do "never."

### Hardest-working paragraph

The hole, from the four deleted lines through the register:

> A Promise was a kind of EventEmitter — that is how early it was,
> before the pattern had settled into anything the modern JavaScript
> programmer would recognize. To find the deletion at all, you cannot
> search for a filename; you have to pickaxe the *content*, `git log -S
> Promise`, and know to look before March 2010. The absence in today's
> tree reads as "never existed." Only the history says "removed,
> deliberately, on this date, by this hand." The tree is the current
> state of an argument. It is not the argument.

The four deleted lines above it are the photograph this paragraph
captions, and they are perfect: `exports.Promise`, inherits
`EventEmitter`, `process.Promise`, `.timeout`. Keep the lines. Keep
"A Promise was a kind of EventEmitter." Cut "that is how early it was,
before the pattern had settled into anything the modern JavaScript
programmer would recognize" — that is ranking 2009 from 2026, and it is
a little sneer at the object you need the reader to take seriously.
Keep the pickaxe. Keep "The absence in today's tree reads as 'never
existed.' Only the history says 'removed…'" That is the ~, in better
English than the ~. Move the register couplet to after HEAD, as
discussed. What remains is the chapter's unique archaeology: the thing
never lived at the path you would search, so the tree's silence is not
evidence.

Honorable mention, because it is already the right volume:

> *Un-break.* The word chooses a side: Ryan's throw was not a decision
> to Isaac, it was breakage. In its place he restored a shim —
> `module.exports = require('util')` — so that every old program calling
> `require('sys')` would keep working.

Keep *Un-break.* Keep "the word chooses a side." Keep the shim. The
sentence that follows — "The founder said this is over; the maintainer
said the ecosystem gets to keep its old spelling, and the maintainer was
the one merging the patches." — is the succession moral, one clause
early. The next sentence then says it again ("A deletion only holds if
the next person is willing to keep it deleted"). Two morals on one
subject line. Let the word choose the side, and sit in the Tuesday
(below) instead of explaining the org chart.

### Weakest paragraph

The rematch hinge, already quoted. It is the paragraph that turns one
chapter into two, announces the ending of the second, and ranks the
sys deletion as "something smaller" before we have seen it. Cut the
whole of it. **The deletion that didn't take** can start on 9 January
2012, `require('sys') now throws`, body `To be removed in v0.9`. No
preface. The reader of the Promises Saturday will feel the smaller
deletion without being told to watch.

The opening paragraph is the weakest *screen*. See §3. It is jacket
copy. It cannot be rewritten in place; it has to move or die. If a
crowd-sentence survives at all, it is after Saturday and the hole, as
the folklore finally named.

### Other prose that should go, or go quiet

- "Ask:" — quiz. Cut.
- "Everyone knows" — crowd. Cut, or earn it after the 0.
- "no apology" — sneer. Cut. Empty is empty.
- "Just the deletion" — keep, if the list of missing morals dies.
- "the entire callback identity of Node is downstream of this commit" —
  swell. Starve; see §3.
- "lived with them for a year" / "first year having them" / "most of a
  year" — eight months. Once.
- "But watch what happens two years later" — host. Cut.
- "the timing is just slightly off" — narrator knows. Cut.
- "It went further than a single reversal" — inflates a vote into a
  campaign. Cut.
- "settled the question against the founder for good" — courtroom. The
  minute is `deprecate, don't remove`. Keep the minute.
- "The rename Ryan ordered never happened" — the alias is what never
  died; the rename to `util` did happen. Starve.
- "the least authorial commit imaginable" — ranking ordinary, the same
  disease as chapter 12's "most ordinary object it is possible to find."
  The stat is 24 files, 4,065 insertions of vendored Emacs testdata.
  Print the stat. Do not rank it.
- "and then he was simply gone from the log" — elegy. The log ending
  is the fact. "Simply gone" is the wreath.
- "The vision was his. The tree, by then, was already someone else's,
  and it had started quietly overruling him while he was still nominally
  in charge." — succession moral, and "overruling" inflates one un-break
  and one later vote. Cut here. Do not move it to At home.
- "Where was Ryan while…" — he was in the shortlog. See §5.
- "a promise to delete it entirely. This is the same instinct as the
  Promises deletion: the founder deciding an old thing is over." —
  names the rhyme. The two subject lines will rhyme if you let them
  print. Cut "same instinct."
- "I might have done this" is not currently available, because Saturday
  is a caption of 306 lines and an empty body. The room (below) is what
  makes it available.

---

## 7. Open, close, At home

### Open

Right objects behind the wrong first paragraph. Consecutive-open with
12 is fine so long as this is not another single-commit `show`. Two
options, both better than folklore-as-thesis:

**A. The six-line log, no preamble.** `Add Promise class`, file I/O,
`Promise.block()` → `.wait()`, documentation. The reader who "knows"
Node chose callbacks feels the skip before the narrator says Node had
Promises. Then one starved sentence: four months in, a shipped API, a
test file. Then Saturday. This is the spine-first open. It is the
stronger reveal.

**B. The hole.** `git log --all --oneline -- lib/promise.js | wc -l` →
0. The reader nods: of course. Then the pickaxe. Then Saturday. This
is the register-first open. It uses the folklore instead of announcing
it. Risk, named in CONTEXT.md: a first screen that only confirms
folklore (surprise ≤2) until the next screen. It works if the pickaxe
is the second object, not the fourth.

I would take A. The skip is `Add Promise class` in this repository. The
hole is why you didn't know, and "why you didn't know" is a later
movement. B makes the method the star and the Saturday a flashback.
The Saturday is the chapter.

Do not open on `0485cc41d5`. That is 12's doorway, a header, a clock, a
name. Do not open on "Everyone knows." That is a TED talk.

After whichever open: do not say "It is also wrong." Let the log be
wrong *for the folklore*, in the reader's head, for one screen.

### Close of the story, before At home

The GYP bump is the right last object. Keep it last. It is currently
wearing a departure:

> The man who wrote `Remove promises` and set the shape of a platform
> left it not with a statement but with a version bump to somebody
> else's build system, and then he was simply gone from the log. The
> vision was his. The tree, by then, was already someone else's…

The first sentence is almost a keeper if "left it not with a statement
but" and "simply gone" die. The contrast is already in the two subject
lines the chapter has printed: `Remove promises` against `Upgrade GYP to
r1477`. You do not need to call the second un-authorial. You do not
need to say he set the shape of a platform; Saturday did. Print the
subject, print the stat (4,065 insertions, Emacs testdata, 24 files),
stop. Whitespace. Then At home.

If you want one human sentence after the stat, make it the fact of the
summer, not an elegy:

> June's un-break stood. August is a version bump. Then the author
> `ry@tinyclouds.org` is not in the log.

No vision. No "nominally in charge." No wreath. The second ~, if you
take it, has already landed on HEAD, one screen up. Do not also land
it here.

### At home

**Two habits is the book's number. These two restating the chapter as a
seminar, plus a third moral about founders, is not.**

Present At home:

1. Distrust "this project never did X." Pickaxe content, not
   `git log -- the/expected/path`.
2. A deprecation is only as real as the next maintainer. `git log
   --follow` on the condemned file.
3. "The founder writes the vision. The people who land the patches write
   what actually ships, and sometimes those are two different stories,
   and git keeps both."

(1) is the Promises leftover and the book's actual new command: `-S` on
the content, because the path never existed. (2) is the sys leftover,
and `--follow` is the right tool if the file survived; it is the wrong
tool for Promises, which is the point of having two habits. (3) is
chapter 07's leftover, and vim already taught the reader to look at who
lands the patches. Cut (3). It is the succession chapter waving from
inside this one.

Starve to two, in this order, as commands, not recap:

- When someone says a codebase "never had" a thing, `git log -S
  SomeFeature --all` on the content, not `git log -- path/you/would/guess`.
  The thing was likely deleted before it reached the path it would have
  today. Do not also reprise Promises, EventEmitter, or Saturday. The
  hole already photographed the 0.
- When a file says *to be removed in the next version*, `git log
  --follow -- that/file` and see whether the removal came. Do not also
  reprise Isaac, the TC, or Node 26. HEAD already printed *we do not
  plan to remove it*.

Last line an object, not a founder. The leftover of the *story* is the
note in `lib/sys.js`. The leftover of the *habit* is that `log -- path`
cannot see a deletion that never had that path.

One clause of I can live here if it did not live in the hole: *I have
stopped trusting a clean tree for a "never."* If the hole already has
"I went looking," At home does not also need an I. One landing.

---

## Where the missing words go

1,554 against a floor of 2,200. About six hundred and fifty words short,
which is two inhabited hours, not a third deletion. Shipped neighbors
sit in this undershoot on purpose (12 is 1,634; 07 is 1,668; 11 is
1,762) and were still told to sit in the Tuesday the captions skipped.
This draft's captions skip the only Saturday the Promises receipts
contain, and the only morning the sys receipts contain.

**Not:** Deno (off-repo, hindsight, a sequel). A primer on Promises or
on the event loop. The later, ES6 Promises Node grew — a sixth exhibit,
a different folklore. A tour of v0.9 tags (the chapter did not make
that mistake). A revert-war inflation. Ryan's feelings. Isaac's
feelings. A third ~. Chasing 3,200. "Unlike vim." "Unlike genesis."
"Unlike the PHP revert."

**Yes:**

1. **Saturday, 20 February 2010, 19:45 −0800.** Ryan's deletion as a
   room. What he knew: a `Promise` that is a kind of EventEmitter; a
   `.wait()` that had been `.block()` four months earlier, that could
   stop the event loop on purpose, in a platform whose point is the
   event loop; a test file, `test/mjsunit/test-promise.js`, 79 lines,
   about to go; four files, 306 deletions, nothing added. What he typed:
   `Remove promises`. What he did not type: a body. Sit in the decision
   while it is still two words, before it is a decade of folklore. This
   is the "I might have done this" — I have a blocking wait on my
   non-blocking platform, I am the project, I delete the class on a
   Saturday night and I do not explain myself because to me it is
   obvious. Do not send him to a design review. Do not apologize for
   him either. Reconstruct the API he was looking at. The receipts
   already have `.block()` → `.wait()`, the EventEmitter inherit, the
   test file in the stat. Use them. This is not a third exhibit. It is
   the first exhibit, inhabited.

2. **Thursday, 28 June 2012, 10:13 −0700.** Isaac's un-break as a room.
   What he knew: `require('sys')` throws; the body of the throw said
   *To be removed in v0.9*; five months have passed; old programs call
   the old name; the ticket is `#3577`. What he typed: *Un-break
   require('sys')*. What he restored: `module.exports = require('util')`.
   Sit in the shim while it is still a compatibility fix, before it is
   a parable about founders. The word *Un-break* will do the side. You
   do not need the shortlog to explain why he could land it; you may
   keep the shortlog as a photograph of 2012, after the shim, undiagnosed.
   Do not make him a hero of the ecosystem. Do not make Ryan a man who
   lost. One throw, one un-break. Then the 2015 minute, as a postcard,
   then HEAD.

(1) and (2) are the rooms. Starving the doorway, the rematch hinge, the
recap after 306, the vision/tree moral, and the At-home seminar is what
makes room for them. The open stays a log (or a hole). The hole stays a
0 plus a pickaxe. The ~ stays a starved line after the 0. The register
stays a starved line after HEAD. The fade stays a GYP stat. Two
inhabited hours, postcards for the rest. That is the chapter 10 shape,
and it is the right one.

The band is permission to sit. It is not permission to catch the
folklore more eloquently.

---

## Top 5 changes, by impact

1. **Stop catching the folklore in the doorway. Open on the 2009 log.
   Name the origin story after Saturday, not before the first hash.**
   Cut "Everyone knows," the culture-list, "It is also wrong," "the
   repository has known," and "Ask:". Six lines: `Add Promise class`
   through `.wait()`. One starved sentence of shipped API. Then
   Saturday. The title sits as the event. The reader feels "Node had
   Promises" a beat before anyone says the callback founding is a
   misremembered deletion. This is the change that lets the reveal be a
   reveal.

2. **Sit in Saturday night.** 19:45 −0800, `Remove promises`, empty
   body as confidence not as scandal. Cut "no apology." Cut the italic
   *choose*. Cut the one-sentence recap of the decade. Reconstruct
   `.wait()` / `.block()` against the event loop, and the 79-line test
   file in the stat, as what he knew. This is the missing room, and it
   is the thing genesis, vim, and the PHP revert do not have: a founder
   deleting a shipped API in two words because the API he could see
   that night included a blocking wait. "I might have done this" lives
   here or nowhere.

3. **Keep sys as mirror, not as rematch. Sit in Isaac's Un-break.** Cut
   "watch what happens," "the same move," "just slightly off," "the
   deletion that didn't take" as a heading, "went further than a single
   reversal," "against the founder for good," and "the rename never
   happened." Start on the throw and `To be removed in v0.9`. Keep
   *Un-break*; keep "the word chooses a side"; keep the shim. Inhabit
   `#3577` and the old programs. Keep the shortlog as a photograph, not
   as the reason. Keep the TC minute. Keep HEAD 2026 and *we do not
   plan to remove it*. One throw, one un-break, one vote. Do not write
   a war. Do not write vim.

4. **Give the first ~ to the hole; give the register sentence to HEAD;
   starve both.** After `wc -l` prints 0, after the class inside
   `src/node.js`: "~ The absence reads as never. The history reads as
   removed." Cut "almost always." Cut the current ~ from after the 306.
   After `show HEAD:lib/sys.js`: "~ The tree is the current state of an
   argument. It is not the argument." Cut that couplet from the hole
   section. No third ~. Cut "A Promise was… anything the modern
   JavaScript programmer would recognize."

5. **At home is two commands. The fade is a GYP stat. Put the missing
   words in (2) and (3), not into Deno, not toward 3,200.** Pickaxe
   content, then `--follow` on a condemned file. Cut the
   founder-writes-the-vision moral. Cut "least authorial," "simply
   gone," "overruling him," and "Where was Ryan while." He was in the
   2012 log; he did not re-throw; August is a version bump. One I, once,
   at the hole or in At home. Eight months, not a year. Do not write
   *unlike*. Do not write *apology*. Let the title flip later than
   paragraph one.

---

## The single most important change

**Stop passing the quiz. Sit in Saturday night.**

The objects are already the chapter, and they will land if the narrator
stops announcing that the origin story is wrong and enjoying that the
repository knew. Right now paragraph one has already said *everyone
knows*, *chose callbacks*, *it is also wrong*, and *Ask:*, the deletion
paragraph has already said *no apology* and *did not choose*, the ~
has already issued the hunting-tip law, and `lib/promise.js` is left to
confirm an absence the docent announced as a catch. That is folklore in
a lecture coat: the reader is told Node's founding myth is false, told
to look at a log, told they had Promises for a year, told one man
deleted them, told that this is what "never had" always means, and then
shown the path that returns zero.

The path was the chapter. The Saturday was the chapter.

Cut the quiz. Print June 2009 as a log. Print `Remove promises` as two
words with nothing underneath them. Then — and this is the room 1,554
words skipped — sit in the night the receipts actually contain: 19:45
−0800, a `Promise` that inherits `EventEmitter`, a `.wait()` that can
block the loop the whole platform is for, 79 lines of tests, 306
deletions, no body. Do not tell us the folklore is wrong. He writes two
words. Then `git log -- lib/promise.js` prints 0, and the reader who
would have sworn Node never had Promises has just watched the tree
testify to a deletion, which is not a gotcha. It is a working tree.

Then one line, after the 0, not before it:

> ~ The absence reads as never. The history reads as removed.

Then the throw, *Un-break* as a morning not as a rematch, the minute
that says *don't remove*, and HEAD that says *we do not plan to remove
it*. Then one line, after that file, not after the hole:

> ~ The tree is the current state of an argument. It is not the argument.

Then `Upgrade GYP to r1477`, 4,065 insertions, and the author is not in
the log. You only need to say that Node had Promises once, and only
after `Add Promise class` has been a row, and a Saturday has been two
words, and a path has returned zero, and a shim the founder tried to
kill still exports at HEAD, which is not a catch. It is a tree. Leave
it.

That is the book. The quiz is in the doorway, the empty body is being
asked to apologize, the mirror is wearing a rematch, the fade is wearing
a wreath, and the book is in the other room: six subjects that say
Promise in 2009, two words on a Saturday night, a path that cannot see
the class because the class never lived there, a subject that says
*Un-break*, a minute that says *don't remove*, a file at HEAD that still
does the old spelling, and a last object that is somebody else's build
tool. The tree is the current state of an argument. It is not the
argument. Nobody in this chapter needs you to add that everyone knows,
and that they were wrong.
