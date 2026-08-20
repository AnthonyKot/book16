# Craft review: “Fix typo”

Chapter 12, the php-src backdoor of 28 March 2021. 1,634 words of body against a
2,200–3,200 band. This is a craft review, not a fact check. Hashes, dates, commands,
and quoted output are locked. I am not touching them.

The bones are the right bones, and they are in the right order. A subject that says
*typo*; a `Signed-off-by` that exists once in twenty-two years; a `+0200` dawn in a
log of American afternoons; a revert that comes back that afternoon wearing the
revoker's name, same tree hash to the byte; two malicious commits still ancestors of
HEAD; a README that strikes `git.php.net`. The through-line is already a sentence
the book has earned: the `Author` field is a claim, a revert is a new object, and
the graph will not do you the courtesy of forgetting. Three sentences in this draft
are keepers for the series, and two more will be if the courtroom around them dies.
I will name them.

The problem is not a third sabotage. Impersonation, the permanence of revert, and
the paperwork that convicts a name are not xz and not npm, and they are this
chapter's reason to exist. The problem is that the doorway stacks the charges
before any object has been allowed to work, the one Sunday the receipts contain is
a caption, and the narrator is enjoying the catch. 1,634 is under the floor. That
is permission to sit in 11:16, when a maintainer names a compromised account, and
in 18:15, when his own name puts the payload back. It is not permission to add a
sixth exhibit, and it is not a mandate to prosecute.

That is the whole job.

---

## Does it earn its place next to xz and npm?

**Yes, as archaeology. Not yet as a chapter.**

The prompt asked this first, so I will not bury it. Chapter 04 is a patience story:
a stranger spends two and a half years becoming the co-maintainer; the weapon is a
file git was taught not to see; the tell is one character inside a security
improvement; the crime scene is the tarball. Chapter 09 is a ledgers story: a
stranger who inherited the keys and spoke the house dialect; an owner who had
always had them; the registry and the repo taking turns lying. A reader who has
lived both will arrive here primed to watch another backdoor in a costume. If this
chapter spends 1,600 words confirming that priming — founder, skip-ci, eleven
lines of eval, *gotcha* — it is xz-plus-npm with a PHP accent, and it should not
ship. If it spends them on the three things neither chapter had, it is the reason
the book gets a security-incident chapter that is not a third betrayal.

Those three things are already in the draft.

**The name is a string.** Xz's attacker *earned* commit rights in the log; Lasse
wrote Jia into `AUTHORS`. Event-stream's attacker *inherited* them off-git: eleven
months of silence, then a new name pushing directly. Colors is the owner using
keys that were always his. Nobody in those chapters wears someone else's face.
Here the `Author` is `Rasmus Lerdorf <rasmus@lerdorf.com>` and it is a lie the
object will print forever, because git will store whatever string you type. That
is not a heist. That is this narrator's daily tool — `blame`, which reports a name
— becoming newly untrustworthy. Protect it. Do not spend it on a courtroom.

**The paperwork is the find.** Not "the commit was malicious." The only
`Signed-off-by` "Rasmus Lerdorf" ever made; a `+0200` Sunday at 05:57 in a log of
`-04:00` and `-07:00`. Chapter 08 taught that a planted date leaks the wall clock
of the machine that typed it. Chapter 03 taught that `--author=` is a string you
can set on purpose, as respect. This chapter is the other side of both: a forger
who over-performed a habit the original never had, and a clock from a continent
the real man does not commit from. That pairing is unique in the corpus. It is
also currently two verdicts with maxims attached.

**A revert is not a deletion.** Colors never reverted; `master` *is* the payload.
Genesis carries a scratch README as an accidental second ancestor; nobody decided
that. PHP reverted twice, on purpose, and then chose *not* to rewrite, so both
malicious commits are ancestors of every 8.1+ checkout, inert and permanent. That
is not "the crime is still in git," which a reader of 09 already knows. That is:
cleaning is a new commit, honesty looks like a scar, and `merge-base --is-ancestor`
will tell you so on a clone you already have. The README that strikes `git.php.net`
is the other half of the same fact — what they *did* remove was the door, not the
history. Two photographs of one ethics. Keep both. Stop lecturing them.

What does *not* earn its place is the sabotage register, applied to a story whose
git record is a forged name, not a long game:

> This is a remote-code-execution backdoor into the language that ran most of the
> web, committed to its main development branch under the name of its founder,
> wearing a subject line that says *typo* and a tag that says *don't test this*.

That sentence could open a conference talk about any of the three incidents. It
is jacket copy. It names the genre, the blast radius, the costume, and the
founder before the Signed-off-by has been allowed to exist once. The unique
archaeology is not that PHP was backdoored. Everyone who has heard of PHP in 2021
has heard that. The unique archaeology is *I do not need the news.* That sentence
is already in the draft. It is currently a promise in the doorway, issued before
any tell has told. Recast the first screen so the paperwork does the convicting,
and the reader coming from "One character" and "add flat map" will think: I have
seen a backdoor. I have not seen a name come off a person.

Do not name the rhyme. Do not write "unlike xz," "the last sabotage," "Jia had
years; this one had a Sunday." Do not write *costume* — chapter 08 owns that
word, and "The metadata is a costume, and the costume does not fit" is a
series-wink dressed as a landing. The reader has a memory. The once-only
sign-off, the timezone list, the identical trees, and `merge-base --is-ancestor`
will do the distinguishing if you let them be photographs instead of a briefing
on how this is different.

The "I might have done this" of this chapter is not the attacker. The attacker is
anonymous; sitting in 05:57 as a heist is thriller, and this book does not get a
third. It is not Rasmus; he was not there, and reconstructing a victim's Sunday
is sneering-adjacent even when the sneer is aimed at the forger. It is Nikita at
11:16, looking at `[skip-ci] Fix typo` from the founder, writing *compromised
git account*, revoking access — and it is anyone who runs `blame` and believes
the name it prints. That second person is the narrator. Put him in the doorway
of the tells, not in the jury box.

---

## The code explainer

**A non-C reader can follow it. A security-literate reader is not bored by the C.
Both are bored by the indictment that follows.**

The prompt asked this plainly, so I will be exact.

The walkthrough is four jobs, and three of them are done:

> When a web request arrives, PHP checks whether it carried a header called
> `User-Agentt` — the doubled T is not the typo, it is camouflage, a name close
> enough to the real `User-Agent` to survive a glance. If that header's value
> begins with the word `zerodium`, PHP takes everything after that word — `+8`,
> the eight letters of `zerodium` — and runs it through `zend_eval_string`: it
> executes it, as PHP code, on the server.

Header, doubled T, `+8`, eval-as-PHP. A general-technical reader can hold
"camouflage" and "executes it." A security-literate reader is not being taught
RCE; they are being pointed at the extra T, which is this chapter's joke against
its own title, and at a comment that says `sold to zerodium, mid 2017`. Nobody
is bored *yet*, because the next object is supposed to be the name on the
commit. Keep the translation. Do not add HTTP, `zlib.c`, or a primer on
`zend_try`. Do not expand it. The doubled T is the literary load: the title said
typo, and the one character that looks like a typo is the disguise. That is
enough C.

Two things then break the explainer, and neither is the C.

**The hunk is tidied.** CONTEXT.md: grep transcripts belong in `console` with the
pipe visible; do not typeset a pedagogical diff. The fence is `console` and the
pipe is visible, which is correct. The *output* is not the receipt. R2 prints
`zval *enc;`, a full `if` condition, `zend_is_auto_global_str`, the whole
`zend_hash_str_find` call. The fable prints ellipses and drops the first added
line:

```
+	if ((Z_TYPE(PG(http_globals)[TRACK_VARS_SERVER]) == IS_ARRAY || ...
+		(enc = zend_hash_str_find(..., "HTTP_USER_AGENTT", sizeof("HTTP_USER_AGENTT") - 1))) {
```

The locked receipt is readable enough. The ellipses are a scout's tidy, and this
pipeline exists because scouts silently tidy transcripts. Print R2. Let the
prose do the translating. A non-C reader is not helped by a C line that trails
off; they are helped by the sentence that says what it does. A security reader
wants the real eleven lines, including `REMOVETHIS`, which the fable *does* keep
in the prose and should also keep in the object.

**The paragraph will not stop.** After the translation, in the same breath:

> This is a remote-code-execution backdoor into the language that ran most of
> the web, committed to its main development branch under the name of its
> founder, wearing a subject line that says *typo* and a tag that says *don't
> test this*. The string `sold to zerodium, mid 2017` is the author signing the
> work with a taunt.

Genre, market share, founder, subject, skip-ci as malice, taunt. That is the
blast radius, the identity crime, and a reading of the attacker's joke, stacked
on the translation that had just done the job. "The language that ran most of
the web" is Wikipedia, and it is the same fame-ranking chapter 11 was told to
cut ("most famous schism"). Skip-ci in the open was the ordinary reading — don't
bother testing a one-character change — which is where the reader is supposed to
sit. Winking it as *don't test this* is hindsight on the same tag. The Zerodium
CHECK is correctly marked and can stay; "signing the work with a taunt" is the
narrator enjoying a villain. Cut the stack. Keep:

> Eleven lines. Read what they do.

Then the four-sentence translation. Then stop. The comment `REMOVETHIS: sold to
zerodium, mid 2017` is already in the hunk. The reader can feel a taunt without
being told it is a taunt. `zend_eval_string` has already said what the change
is. "Remote-code-execution backdoor" can wait until Nikita's revert names a
compromised account, or it can wait forever: the eval is on the page.

The security-literate reader gets bored here, not at `+8`. They already know
what those eleven lines are. They came for the paperwork. Every sentence after
"it executes it, as PHP code, on the server" is a sentence that is not the
Signed-off-by existing once.

---

## The narrator is not sneering at a person. He is triumphant about a catch.

**Prosecutorial, not personal. Cut the courtroom. Keep the engineer.**

The attacker is anonymous, so the sneering-at-a-person risk the book usually
runs is not the one in this draft. Rasmus is not mocked. Nikita is not mocked.
Levi is a clause. The living men are treated as objects in a log, which is
correct. What is not correct is the register around the forensics: convict,
forger, flourish, mask, weapon, plant/replant, *the part that surprises even
people who know this story*. That is a prosecutor who has already won, walking
the jury through exhibits. The compact is an engineer who runs `blame` daily and
is walking you through an obsession. Opinion is allowed. Glee at the catch is
not an opinion. It is a side, and the side is *I am better at reading git than
the person who typed this.*

The charges, in the order they arrive:

**"The repository convicts the impersonation by itself, and it does it several
times over."** The thesis, and it is the right thesis, and it is currently a
gavel in paragraph four, before any tell has told. "Convicts" is a courtroom.
"Several times over" is a preview of the floor plan. Move the thought to after
the timezone list, or let the timezone list be the thought and never say
*convicts*. "I do not need the news to tell me that. I do not need a confession,
a security advisory, or anyone's word." That I is this narrator's actual job.
Protect it. It is currently sponsoring a verdict the paperwork has not yet
delivered. Earned, it is the landing of **The tells**. Unearned, it is jacket
copy with a first person in it.

**"the tell is always the one thing the forger does that the original never
did."** A maxim. CSI. The object is: one row. Twenty-two years, hundreds of
commits, one `Signed-off-by`, and it is this one. That sentence is already in
the draft ("Once. In twenty-two years…"). Isolate it. Everything after the
dash is the narrator grabbing the reader's wrist. The reader who has just seen
a log of one line does not need a theory of forgery.

**"The metadata is a costume, and the costume does not fit."** Beautiful, and
it spends chapter 08's title on a landing chapter 08 already taught (a clock
that wasn't asked). After a planted 1982 that leaked 2018, a `+0200` dawn in a
`-07:00` log does not need to be called a costume. Print the four rows. "One
line in that list was typed from a different continent than all the others" is
the sentence. Cut "by someone whose own machine clock gave them away" — we do
not know whose machine, and "gave them away" is the catch again.

**"the story does something I have never seen anywhere else in this book."**
Book-consciousness, a ranking, and a drumroll on the one photograph that did
not need one. Chapter 04's "the last chapter had no villain." Chapter 11's
"doing more work than any sentence in this book." Cut it. The attacker coming
back as Nikita, identical tree, is the thing you have not seen. The I that
ranks chapters is not. If you need the I, put it on `blame` reporting Rasmus,
which is this narrator's daily tool failing, not on a contest of incidents.

**"simply put on a second mask — the maintainer's — and shipped the payload
again."** Thriller. "Mask," "shipped the payload," "locked out under Rasmus's
identity." The object is a subject line, `Nikita Popov <nikita.ppv@gmail.com>`,
and two `rev-parse` lines that print the same hash. "Same tree hash means same
code, exactly" is the book. The mask is a caption of the hash.

**"Four commits, one Sunday: plant, revert, replant, revert."** Too pleased
with its own cadence. It is also accurate, and it is also the war named as a
heist diagram. The pickaxe is about to print the four rows. Let the four rows
be the diagram. If the cadence stays, it stays *after* the log, as a count, not
as a trailer.

**"Now the part that surprises even people who know this story."** A docent.
"Even you." Chapter 04's "Now the famous part, and the first surprise is." Cut
the wind-up. Run `merge-base --is-ancestor`. Ancestor. *Then* name what that
means. The people who know this story are not in the room. The command is.

**"It is more honest, and it is stranger."** Telling us how to feel about the
scar. The choice not to rewrite is the ethics, and it can be a fact: rewriting
would have changed every hash downstream. "A kind of lie — pretending the
attack never touched the tree" is close to the book, and it is one clause too
fond of itself. Keep the hashes. Keep "They let the scar stay" only if you will
not also ~ a proverb about crime in the next breath.

**At home: "The impersonator's mistake is never the code; the code they got
right. It is the paperwork."** The CSI maxim, assigned as homework. See At
home. The leftover of the *story* can be the locks. The leftover of the
*habit* is that `Author` is a string. Neither needs a theory of the
impersonator's mistake.

What is already the right temperature, and should be protected:

> I do not need the news to tell me that.

> Once. In twenty-two years and hundreds of commits, the only time "Rasmus
> Lerdorf" ever signed off on anything is the backdoor.

> Same tree hash means same code, exactly.

> The subjects are all quotation marks and the word "typo." The evidence is one
> layer down.

> The most important commit after a break-in is rarely the fix. It is the one
> that changes the locks.

That last one is a proverb, and it is a keeper, and it is currently the close
of the story, which is the right slot. It does not need "wound" and "door" as
a matching pair of metaphors in the sentence before it; the README hunk is the
pair.

First person is almost only the prosecutor. Two I's to keep, one to cut, one to
add. Keep "I do not need the news" (moved). Keep "the way I just did" on the
pickaxe, which is method. Cut "I have never seen anywhere else in this book."
Add one I on the name: *blame says Rasmus; I would have believed it.* Not "I
keep rereading." Not "I caught this." The compact is obsession, not triumph.
Chapter 09 sat in a merge the narrator would have approved. This chapter should
sit in a name the narrator would have trusted. That is the same muscle. It is
currently unused.

---

## The title does not flip. It is irony from line one.

**"Fix typo" is the subject, the camouflage, the war's only noun, and the
thing a revert does not do to a graph. You spend it as a joke in the first
forty lines, then never turn to look at it.**

The open does this:

> A commit from him fixing a typo in the language he invented is the most
> ordinary object it is possible to find in this repository — right down to
> the `[skip-ci]` tag that tells the build servers not to bother testing a
> one-character change. Here is the one character:

Then the eleven lines. Then they are an RCE backdoor wearing *typo*. The title
has inverted before the reader has been allowed to believe it. A title that is
already a lie in paragraph two cannot invert at the pickaxe, where every
subject is quotation marks around the word *typo*, and it cannot invert at
`merge-base --is-ancestor`, where the "fix" is a new commit and the typo is
still in the graph.

The title has three payments available, and they are the chapter:

1. The doubled T is not the typo. The eleven lines are. Let "Fix typo" sit as
   a typo until the extra T has been seen doing camouflage work. Chapter 09
   was told to let `add flat map` sit as a helper. This is that note.
2. The subjects of the war are all that word, nested in quotation marks, and
   `git log --grep=zerodium` finds nothing. The title is the camouflage of the
   *log*, not only of the hunk. That paragraph is already the hardest-working
   in the draft. It cannot flip a title the doorway has already called a
   costume.
3. A revert does not fix a typo in the ancestry. The "fix" is still an
   ancestor. That is the title earning its keep at the ~, if the ~ is allowed
   to be an object and not a proverb about crime.

Right now (1) is spent as irony, (2) is a good paragraph fighting a spent
title, (3) is a lecture that does not say *typo* at all. The word never comes
back as the narrator's word after the open, except inside quoted subjects.
That is actually a gift: the log is still saying *typo* after you have stopped.
You get the inversion for free if the open does not already tell me the
subject is a lie.

"The most ordinary object it is possible to find" is the right bet. Stay there.
Do not say "one character" and then print eleven lines as a gotcha; that is
the title winking. The skip-ci tag as ordinary housekeeping is the right bet.
Do not later translate it as *don't test this*. Ordinary, then the hunk, then
the doubled T, then stop. The founder can be named as the `Author` string the
object prints. "Rasmus Lerdorf created PHP" is establishing-shot Wikipedia; the
email on many real commits, which you already have in **The tells**, is the
better proof he is real.

---

## 1. Structure and pacing

### The order is right. Do not reshuffle.

Open → tells (sign-off, clock) → revert war → still here (ancestor, then
locks) → At home.

You cannot feel a second face before you have seen the first. You cannot feel
ancestor-after-revert before the revert has happened twice. You cannot feel
the README as changing the locks before the scar has been allowed to stay.
Do not open on the eleven lines (chapter 09 opened on a payload hunk; this
open is identity, which is the new object). Do not open on `merge-base` (that
is the landing). Do not open on the timezone list (that is a tell, and tells
need a name they are telling *against*). Do not put the locks before the
ancestor (what they removed only matters once you know what they kept).

What the order is not doing is *volume*, and it is not doing *rooms*. Each
act is currently a label, one receipt, and a verdict. Four verdicts in a row
is a briefing. The reader never lives in a Sunday.

Consecutive-open with chapter 11 is adjacent, not identical. 11 opened on the
body of a revert (`as discussed`). This opens on `show -s --format=fuller` of
a commit's identity. Both are `show -s`. The objects differ if the prose
treats them differently: 11 is a discussion git does not contain; 12 is a
name git will print whether or not it is true. Stay with the header. Do not
"improve" it by opening on a clock (01 has a Tuesday afternoon; 07 has a
Friday evening; 08 has twin seconds). Do not open on a shortlog (03 and 04
did). This open is a name, a dawn, and a subject that says *typo*. Keep the
name. Starve the incident.

### The open is the right object. It then issues the chapter.

TEMPLATE.md: one concrete moment, the thing that will turn out to matter,
shown before we know it matters. You did. `c730aa26bd`, a Sunday at 05:57,
`[skip-ci] Fix typo`, `Signed-off-by: Rasmus Lerdorf`. The title's object,
the tells' object, the war's noun. Keep it.

Then the next forty lines spend it: ordinary, one character, eleven lines,
RCE, founder, skip-ci as malice, taunt, "Rasmus Lerdorf did not write it,"
the repository convicts, several times over. That is the floor plan, the
genre, the verdict, and the method, before **The tells** has started. Chapter
06 put "this chapter is that ritual" in this slot and was told to cut it.
Chapter 09 put "the 2018 event-stream incident, the one every supply-chain
talk since has used as its opening slide" here and was told to cut it.
Chapter 11 put "the most famous schism" here and was told to cut it. This is
that sentence, with a backdoor in it.

**Move:** the fuller header. The name, the dawn, the subject, the sign-off,
sitting as ordinary. The hunk, printed from R2, not tidied. The four-sentence
translation, ending on `zend_eval_string`. Stop. Do not say RCE. Do not say
"Rasmus did not write it." Do not say convicts. The sign-off in the header is
already the thing that will turn out to matter. **The tells** can ask how
often he uses it. The reader who types git will feel the name become a
question a beat before you say it is a question. That is the assignment. The
doorway is the assignment failed on the first screen.

### The tells are two photographs. They are wearing two maxims.

Sign-off, then clock. That is the right pair and the right order: the flourish
first (a habit he never had), the continent second (a clock he never used).
Do not reshuffle. Do not add a third tell; two is the book's number, and
skip-ci has already been asked to be a tell in the doorway.

Each photograph currently lands, then explains itself. The sign-off log is
one row. Then "the tell is always the one thing the forger does." The
timezone log is four rows, and the backdoor is the only `+0200`. Then
"different continent… machine clock gave them away… costume does not fit."
Isolate the objects. "Once." Isolate it. "One line in that list was typed
from a different continent than all the others." Isolate it. The I that does
not need the news belongs here, *after* those two sentences, as the landing
of the section, not as its trailer in the doorway. That is where "the
repository convicts" was trying to live. Let the two logs convict. You do
not have to say the word.

Heading: **The tells** is CSI. Object-name the section, or let the first
command be the heading. The book names rooms after objects (`01:10`,
`qatar`, `fftools/ffmpeg.c`). A detective heading on the forensics chapter
is the triumphant register in a label.

### The revert war is the unique photograph. It is a caption of a thriller.

This is the thing xz did not have and npm did not have: the attacker comes
back as the person who just revoked them, and the tree hash proves the
payload without anyone trusting a subject line. It is the center. It is
currently:

- "Five hours later, a real maintainer catches it" — hindsight caption. He
  does not "catch it" in the prose; we are told he did, then shown the
  revert as an official statement.
- Nikita's body, which is the room, used as a quote in a briefing.
- "the story does something I have never seen anywhere else in this book.
  The attacker comes back."
- The second commit, then "simply put on a second mask."
- The identical hashes, which are the photograph, explained in the next
  sentence ("Same tree hash means same code, exactly") — that sentence is
  a keeper; it should have whitespace on both sides.
- Levi in a clause, nested-revert subject as a count ("Four commits, one
  Sunday: plant, revert, replant, revert").
- The pickaxe, which is the right command, after the war has been diagrammed.
- The quotation-marks paragraph, which is the hardest-working in the draft,
  arriving as a method note after the thriller.

The missing room is 11:16. TEMPLATE.md: reconstruct what the actor knew when
they typed. Nikita's revert is 11:16 +0200, Sunday. What he knew: a skip-ci
typo from the founder, eleven lines that eval a header. What he typed: *This
looks like the result of a compromised git account. Commit access has already
been revoked.* Sit there. He has already decided, already revoked, already
put the official statement into a commit message. That is a room. It is not
a catch montage. Do not mind-read the attacker. Do not mind-read Rasmus. The
receipts contain one Sunday morning that belongs to a person who is in the
log as himself.

Then 18:15, same offset, `Revert "Revert "[skip-ci] Fix typo""`, authored as
Nikita. Do not say "second mask" first. Print the subject. Print the name.
Then the two `rev-parse` lines. Same hash. The reader who has just sat in
11:16, access revoked, will feel the face come off a beat before you name a
mask. Levi's `Revert "Revert "Revert…"` at 11:53 −0600 can stay a postcard:
the nested quotes *are* the war, and the pickaxe will print all four. Give
Levi a timezone and a name, which you already do. Do not give him a biography.

Heading: **The revert that could not** pays **Still here** early. This
section is the war, not the permanence. The revert *could* — it undoes the
code; the second one undoes it again. What it could not do is delete, and
that is the next room. Name this one for the object: the identical tree, the
second name, Sunday. Not for a thesis the next heading owns.

### Still here is two endings. Give the ancestor the ~. Give the locks the
last human sentence.

The ancestor commands are the surprise the docent is currently announcing.
Run them. Both ancestors. Then the fact: every clone since March 2021 carries
them; not active; present. Then the choice: they did not rewrite, because
rewriting would have changed every hash downstream. Then the ~. Then stop.
"The receipt for this chapter is in your own `vendor` directory right now" is
At home, and it is also not true of most readers' vendor directories — they
do not have php-src vendored; they have a PHP runtime. Do not send people
hunting a clone they do not have. `merge-base --is-ancestor` on a reverted
commit in *their* repo is the habit.

The README is the other ending, and it is the right other ending. Revert
closed the code; this closed the door. R9 is a hunk with `git.php.net`
struck. R10 is the newest commit, committed by `GitHub`. That last image is
a photograph of the migration, and it is currently a clause. Let it be the
last image before At home: the tip of the repository, `committer=GitHub`,
two-factor, the lock changed. "The most important commit after a break-in
is rarely the fix. It is the one that changes the locks." Keep that. It is
the title of the ending. It should follow the hunk, not preview it.

Do not blur the two into one paragraph of wound/door. The ~ owns the scar.
The locks own the last sentence. Two photographs of one ethics, sequentially,
not mixed.

---

## 2. Prose

### Keepers, named.

1. > The subjects are all quotation marks and the word "typo." The evidence
   > is one layer down.

   The title, the log, the pickaxe, in two sentences. This is the book. It
   is currently a method note at the end of a thriller. Protect it. Let it
   follow the pickaxe with whitespace on both sides. Do not also diagram
   plant/replant in front of it.

2. > Same tree hash means same code, exactly.

   The object, then the translation a non-git reader needs, and not one
   word more. It is currently followed by the mask. Isolate it.

3. > The most important commit after a break-in is rarely the fix. It is
   > the one that changes the locks.

   The close. Keep it last among the human sentences, after the README
   hunk and the GitHub committer, not as a caption of them.

Two more will be, if the courtroom dies:

> Once. In twenty-two years and hundreds of commits, the only time "Rasmus
> Lerdorf" ever signed off on anything is the backdoor.

> One line in that list was typed from a different continent than all the
> others.

And this one is a keeper on the condition that it moves to after those two,
and drops *convicts*:

> I do not need the news to tell me that. I do not need a confession, a
> security advisory, or anyone's word.

Keep the I. Cut "And here is the thing this chapter exists for." Chapter 11
was told to cut "this is the dig." Same wrist.

### Hardest-working paragraph.

The quotation-marks paragraph, already quoted, through "The evidence is one
layer down." It does not tell us what to feel. It does not prosecute. It
lets a pickaxe be a method, and it lets the title sit in the log as
camouflage. Everything the doorway is trying to do with *typo*, this one
does by looking at subjects.

Runner-up, if 18:15 is allowed to arrive without "second mask": the two
`rev-parse` lines plus "Same tree hash means same code, exactly." That is
the center as a photograph. It is currently a sentence in a briefing.

### Weakest paragraph.

The doorway stack, already quoted ("This is a remote-code-execution
backdoor…"). It is the chapter failing at the assignment in the room where
the assignment always fails: the second paragraph. It names the genre, the
fame, the founder, the costume, and the taunt, and it leaves **The tells**
with nothing to reveal except confirmation.

The convicts paragraph is the other candidate — same disease, one screen
later, as a thesis. Cut both, or starve both to the I-without-news landing
*after* the timezone list, and the first half of the chapter starts working.

Honorable mention, because it is the unique photograph talking over itself:

> The attacker, locked out under Rasmus's identity, simply put on a second
> mask — the maintainer's — and shipped the payload again.

That is the absorption paragraph of this chapter: a strategy, a mask, a
power verb, where two hashes were about to do the whole job.

### Clunkiest sentence, and a rewrite.

> This is a remote-code-execution backdoor into the language that ran most
> of the web, committed to its main development branch under the name of
> its founder, wearing a subject line that says *typo* and a tag that says
> *don't test this*.

Fifty-odd words, a colon's worth of charges without a colon, market share,
a founder, a subject, a tag, and "wearing," which is the costume again.
The eleven lines are already on the page.

Rewrite:

> Eleven lines. A header with an extra T. If its value starts with
> `zerodium`, PHP executes the rest of it. That is the whole change.

Then go to the name as a question, not as a verdict. Do not say
remote-code-execution. Do not say most of the web. Do not say don't-test.
The hunk has `zend_eval_string`. The header has `[skip-ci]`. The reader
has both.

Honorable mention, because it is the same disease in the tells:

> The impersonator added a flourish of authenticity the real man never
> bothered with — the tell is always the one thing the forger does that
> the original never did.

Rewrite, using only what the command printed:

> Once. In twenty-two years, the only `Signed-off-by: Rasmus Lerdorf` in
> this repository is this one.

The flourish is in the fact of the one row. You do not need a theory of
flourishes.

### Other prose that should go, or go quiet.

- "the most ordinary object it is possible to find" — keep the bet; cut
  "it is possible to find," which is ranking ordinary. "A typo from him is
  the most ordinary object in this repository" is enough.
- "And here is the thing this chapter exists for." Wrist. Cut.
- "the repository convicts… several times over." Courtroom plus floor plan.
  Cut.
- "the tell is always…" Maxim. Cut.
- "The metadata is a costume, and the costume does not fit." Series-wink.
  Cut. Keep the continent sentence.
- "by someone whose own machine clock gave them away." Catch. Cut.
- "I have never seen anywhere else in this book." Ranking. Cut.
- "second mask," "shipped the payload," "weapon." Sabotage register. The
  hashes are the weapon; they do not need the word.
- "Four commits, one Sunday: plant, revert, replant, revert." Cadence as
  trailer. If it stays, after the pickaxe, as a count.
- "Now the part that surprises even people who know this story." Docent.
  Cut.
- "It is more honest, and it is stranger." Feeling. Cut, or leave
  "stranger" only after the ~ has landed without it.
- "in your own `vendor` directory right now." Wrong homework, and At home
  preview. Cut here.
- "The impersonator's mistake is never the code." CSI homework. Cut.
- "a fossil you can hold, from the Sunday morning someone tried to put a
  back door into the web." Swell. Chapter 07 put a bouquet in At home and
  was told to stop. End on a command, not a relic.

The CHECK on Zerodium stays until the fact pass. Do not expand it into a
firm's biography to fund the band. "The attacker's joke, not a factual
sale" is already the right caution; the prose does not also need "taunt."

---

## 3. The ~ beat

**Keep the thought. Cut the crime. Move it onto the command. Do not add a
second.**

> ~ A revert does not remove the crime. It records it, and files it under
> the graph, forever.

That is the right slot and the wrong sentence. Compare keepers: "The last
commit is never a speech." "The planted date is precise about everything
except the thing it plants." "The revert is the last commit in which this
project is one project." Those are objects. This ~ is a proverb about
crime, with "files it under the graph" as a little joke about filesystems.
"The crime" is the prosecutorial register in the one line the book
italicizes.

The thought is: a revert is a new commit; both stay; these two are
ancestors of HEAD. That is already what R8 printed. The ~ currently
follows a paragraph that said all of it — "The backdoor was reverted. But
a revert in git is not a deletion — it is a *new* commit that undoes an
old one, and both stay in the graph forever. So the malicious commits
were never removed. They are still there." — and then the commands, and
then the lecture about 8.1 and honesty and vendor, and *then* the ~.
Named, demonstrated, lectured, then felt as a caption. Same disease as
chapter 11's ~ after the founding of Libav.

**Move:** run the two `merge-base --is-ancestor` commands. Both ancestors.
Then the ~, starved:

> ~ A revert does not remove the commit. It is still an ancestor.

Or, if you want the title in the inversion:

> ~ The typo is still in the graph.

Do not say crime. Do not say forever (the command already did). Do not say
"files it under." Then one paragraph, not two: not active; they did not
rewrite, because the hashes downstream would have changed. Then the README,
new movement, locks. The ~ is the scar. It is not also the locks, and it
is not also a theory of honesty.

Do not add a second ~. The candidates would be "Once" (let the one-row log
sit unpunctuated; a ~ there is the maxim again) and the identical hashes
(they are already a turn; wrapping them is a wreath). Chapter 10 had two
~ beats and had to kill their sponsors. This chapter has one thought worth
the tildes. Give it the room the lecture is currently occupying. That is
enough.

The timezone list should *function* as a ~ without the tildes: four rows,
one `+0200`. If you also ~ it, you have named the continent you were asked
to let the reader notice.

---

## 4. Open and close

### Open.

Right object, wrong paragraphs two through four. Header, ordinary typo,
hunk from R2, four-sentence translation. Stop. See above. Consecutive-open
with 11 is already satisfied if this stays an identity header and not a
revert body. Do not issue RCE, convicts, or "Rasmus did not write it." The
sign-off in the header is the cold open's gift to **The tells**. Leave it
sitting.

### Close of the story, before At home.

The last human sentence in the draft is already the right one:

> The most important commit after a break-in is rarely the fix. It is the
> one that changes the locks.

Keep it last. It currently follows a wound/door summary that previews it.
README hunk, GitHub as committer of the tip, then that sentence.
Whitespace after. Then At home. Do not let the ancestor lecture share the
landing; the ~ has already landed the scar, one screen up, if you take the
~ note.

---

## 5. At home

**Two habits is the book's number. These two restating the chapter as a
seminar is not.**

Present At home:

1. Stop trusting `Author`; check timezone against that person's other
   commits; check whether a `Signed-off-by` is a habit or a one-off.
2. Run `merge-base --is-ancestor` on a "cleaned" commit. Reverted means
   still in there.

Those are the right two habits. They are this dig's actual leftovers:
`Author` is a string; revert is not delete. TEMPLATE.md: the habit changes
how the reader reads *their own* repo. Both of these do, if they are
commands, not a recap.

What they are doing now is restating every verdict in order, then swelling:

> The impersonator's mistake is never the code; the code they got right.
> It is the paperwork — a sign-off the real person never used, a clock
> from the wrong continent, a formal trailer on an informal contributor.
> … a fossil you can hold, from the Sunday morning someone tried to put a
> back door into the web and signed it with the founder's name.

That is the chapter again, as homework, with a relic at the end. Chapter
11 was told not to assign the histogram as homework. Chapter 10 was told
to fuse three habits to two. This At home has two habits wearing a third
thing, which is a summation.

**Starve to two, in this order:**

- `git log --format='%aI %ae'` on a name you trust. Does the timezone
  match their other commits? Then `git log --author=<name>
  --grep='Signed-off-by'`. Does this trailer appear in their history, or
  once? Do not also diagnose "the impersonator's mistake." The tells
  already photographed the one row and the continent.
- Then `merge-base --is-ancestor` on a commit a changelog says was
  reverted. "Cleaned" usually means still in the graph. Do not also
  reprise 8.1, vendor, or the founder's name. The ancestor room already
  did that.

Last line an object, not a fossil. The locks sentence stays in **Still
here**. Do not import it into At home as a moral. Do not send the Sunday
flowers. The leftover of the *story* is the README. The leftover of the
*habit* is that blame reports a string.

One clause of first person can live here if it did not live in the tells:
*blame printed Rasmus; I would have believed it.* If the tells already
have "I do not need the news," At home does not also need an I. One
landing.

---

## Where the missing words go

1,634 against a floor of 2,200. About six hundred words short, which is
two inhabited hours on one Sunday, not a sixth photograph. Shipped
neighbors sit in this undershoot on purpose (11 is 1,857; 10 is 1,789; 07
is 1,668) and were still told to sit in the Tuesday the captions skipped.
This draft's captions skip the only Sunday the receipts contain.

**Not:** Zerodium as a firm (CHECK stays; do not fund the band with a
market). How `git.php.net` was compromised (off-repo). Rasmus's feelings
(he was not there). The attacker's 05:57 as a heist (anonymous, thriller,
third sabotage). A primer on DCO. PHP market share. A second ~. Chasing
3,200. "Unlike xz."

**Yes:**

1. **11:16 +0200.** Nikita's revert body as a room. What he knew: a typo
   from the founder, eleven lines, skip-ci. What he typed: compromised
   account; access revoked. Sit in the decision while it is still a
   revert message, before it is an official statement in a briefing. This
   is the "I might have done this" — I would have reverted this, I would
   have revoked, I would have thought the door was shut.
2. **18:15 +0200.** The same name, `Revert "Revert…"`, then the two tree
   hashes, undiagnosed. No mask. No "I have never seen." The reader who
   sat in (1) feels the face. Levi stays a postcard: nested quotes, −0600,
   last row of the pickaxe.
3. **The two logs in The tells, without maxims.** One row of Signed-off-by.
   Four rows of clocks. "Once." "One line… different continent." Then "I
   do not need the news." That is the volume the tells are missing; it is
   not more evidence, it is air around the evidence you have.

(1) and (2) are the rooms. (3) is starving the captions so the rooms can
breathe. The open stays a header. The hunk stays a translation. The
ancestor stays a command plus a ~. The locks stay a README plus a
committer. Two inhabited hours, postcards for the rest. That is the
chapter 10 shape, and it is the right one.

The band is permission to sit. It is not permission to prosecute more
eloquently.

---

## Top 5 changes, by impact

1. **Stop convicting in the doorway. Let the eleven lines be a translation,
   not an indictment.** Cut the RCE stack, "Rasmus Lerdorf did not write
   it," "the repository convicts," "several times over," and "the thing
   this chapter exists for." Stay with the header as an ordinary typo,
   print R2 untidied, walk User-Agentt / +8 / eval, and stop. The doubled
   T is the title's first chance to sit. The sign-off in the header is
   **The tells**'s object. This is the change that lets the reader feel
   "that is not a typo" and then "that is not him" a beat before either
   is named.

2. **Sit in Nikita's Sunday.** 11:16, the revert body, what he knew, access
   already revoked. Then 18:15, his name, the identical trees, no "second
   mask," no "never seen in this book." Cut "a real maintainer catches
   it." Cut plant/replant as a trailer. Keep the pickaxe. Keep "Same tree
   hash means same code, exactly." Keep the quotation-marks paragraph;
   give it whitespace. This is the missing room, and it is the thing xz
   and npm do not have.

3. **Starve the courtroom.** Cut convict/forger/flourish/costume/weapon/
   mask/taunt/"machine clock gave them away"/"surprises even people who
   know"/"more honest, and it is stranger." Keep "Once." Keep the
   continent sentence. Keep "I do not need the news," moved to after the
   two logs. One new I: blame would have said Rasmus. Heading off **The
   tells**. Heading off **The revert that could not** (it pays the next
   room early).

4. **Give the ~ to the ancestor command; give the locks the last sentence.**
   Cut the proverb about crime. Run `merge-base --is-ancestor`, then "~ A
   revert does not remove the commit. It is still an ancestor." (Or the
   typo, still in the graph.) Then they did not rewrite, because the
   hashes would have changed. Then the README hunk, GitHub as committer of
   the tip, "The most important commit after a break-in is rarely the
   fix. It is the one that changes the locks." Two endings, sequential,
   not mixed. Cut vendor-directory. Cut the fossil in At home.

5. **At home is two commands, not a recap. Print R2. Let the title flip
   later than line forty.** Timezone and sign-off habits, then
   `merge-base --is-ancestor` on a reverted commit in the reader's own
   repo. No impersonator's-mistake maxim. No Sunday relic. Missing words
   into 11:16 and 18:15, not into Zerodium, not into a sixth act, not
   toward 3,200. Do not write *costume*. Do not write *unlike xz*.

---

## The single most important change

**Stop prosecuting. Sit in 11:16.**

The objects are already the chapter, and they will land if the narrator
stops stacking charges in the doorway and enjoying the catch. Right now
paragraph two has already said *remote-code-execution backdoor*, paragraph
four has already said *Rasmus did not write it* and *convicts*, the tells
have already said *forger* and *costume*, the war has already said *I have
never seen anywhere else in this book*, and `merge-base --is-ancestor` is
left to confirm a permanence the docent announced as "the part that
surprises even people who know." That is folklore in a courtroom coat: the
reader is told there was a famous backdoor, told the founder didn't write
it, told the paperwork proves it, told the attacker came back in a mask,
told a revert does not delete, and then shown the commands.

The commands were the chapter.

Cut the indictment. Print the header as a typo. Print the eleven lines as
eleven lines. Ask how often that man signs off. Print the clocks. Then —
and this is the room 1,634 words skipped — sit in the Sunday the receipts
actually contain: 11:16, a maintainer looking at `[skip-ci] Fix typo`,
typing *compromised git account*, revoking access. Do not tell us he
caught it. He writes a revert. Then 18:15 prints his name, and two tree
hashes match, and the reader who would have trusted `Author: Rasmus
Lerdorf` has now also watched `Author: Nikita Popov` fail, which is not a
third betrayal. It is the same string, twice.

Then one line, after the ancestor command, not before it:

> ~ A revert does not remove the commit. It is still an ancestor.

Then the README strikes `git.php.net`, the tip is committed by GitHub, and
the locks change. You only need to say that the repository does not need
the news once, and only after a `Signed-off-by` that exists once has been
a row, and a `+0200` dawn has been the only dawn in a log of American
afternoons, and a man who revoked access has had his name put back on the
payload, and both commits are still ancestors of HEAD, which is not a
conviction. It is a graph. Leave it.

That is the book. The press release is in the doorway, the tells are
wearing maxims, the war is wearing a mask, and the book is in the other
room: a subject that says *typo*, a sign-off that exists once, four clocks
and one continent, a revert body at 11:16, two hashes that match, a
pickaxe that cannot grep a message for `zerodium`, two ancestors of HEAD,
and a README that stops calling GitHub a mirror. The most important
commit after a break-in is rarely the fix. It is the one that changes the
locks. Nobody in this chapter needs you to add that the repository
convicts.
