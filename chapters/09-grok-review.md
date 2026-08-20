# Craft review: “add flat map”

Chapter 09, the npm sabotage pair — event-stream 2018 and colors 2022. 2,404 words of body
against a 2,200–3,200 band. This is a craft review, not a fact check. Hashes, dates, commands,
and quoted output are locked. I am not touching them.

The bones are the right bones, and they are almost in the right order. A two-line `require`
that is the victim’s own 2012 sentence; a name that arrives with keys and no introduction; a
Sunday `3.3.6` that never gets a tag; four minutes that wash `master` while npm keeps serving
the poison; then, three years later, an owner who comes back for three and a half minutes, and
a `master` that is still the payload. The through-line is already a sentence the book has
earned: the repository is not the shipment, and the two ledgers can lie in opposite
directions. Three sentences in this draft are keepers for the series, and a fourth will be
once the wink in front of it dies. I will name them.

The problem is not that there are two repositories. Two sabotages is the chapter: a stranger
who inherited the house and spoke its dialect, an owner who had always had the keys, the same
gap underneath both. The problem is that the first half is currently wearing chapter 04’s
coat — helpful week, trust as the operation, weapon not in the tree — and that the doorway
names the incident the way every supply-chain talk names it, so the title never gets to flip.
Sprawl is not the failure here. Restatement is. 2,404 is mid-band, honest. Do not chase 3,200.
Do not add faker.js. The cuts fund two rooms the captions currently skip: Dominic’s 2012
Tuesday, and seventy-eight seconds in which a living person treated his own protest as a
syntax error. That is the whole job.

---

## Does it earn its place next to xz?

**Yes, as archaeology. Not yet as a chapter.**

Chapter 04 is a patience story. A stranger spends two and a half years becoming the
co-maintainer; the weapon is a file git was taught not to see; the tell is one character
inside a security improvement; the crime scene is the tarball. The reader who has lived that
will arrive here primed to watch another helpful stranger. If this chapter spends its first
three thousand words confirming that priming, it is xz-lite, and it should not ship. If it
spends them on the three things xz did not have, it is the reason the book gets a second
sabotage chapter.

Those three things are already in the draft.

**The house-style camouflage.** Not “he was helpful.” The 2018 payload is three lines —

```
+  , flatmap = require('flatmap-stream')
+es.flatmap = flatmap
```

— and they are the 2012 extraction of `map-stream`, typed by the victim, six years earlier.
Jia Tan wrote in the language of a careful C maintainer. 北川 wrote a sentence in *this
file’s* native language. That is a different photograph. It is this chapter’s unique git
find. Protect it. Do not let the fortnight steal its job.

**The registry/repo gap, run twice, in opposite directions.** Xz’s gap is one-way: git looks
clean because the payload was never a tracked object. Event-stream’s gap is a wash: git
*becomes* clean, on purpose, eight weeks before anyone looks, while npm goes on serving
`3.3.6`. Colors is the same gap backwards: npm is unpublished, and `master` — the branch you
get when you clone it today — *is* the payload. Xz could not have done this pairing. Xz had
one ledger that hid and one tarball that didn’t. This chapter has two ledgers that take
turns lying. That is the through-line. It is not “another supply-chain incident.”

**The owner-versus-stranger symmetry.** Xz is a stranger who *earned* commit rights in the
log. Event-stream is a stranger who *inherited* them off-git: eleven months of silence, then
a new name pushing directly, no merge, no `AUTHORS`, Outlook, `+0000`. Colors is the owner
who never gave the keys away, while David Hyde did the work. The draft already has the
discontinuity —

> It does not appear as a contributor. It appears as an owner, pushing directly to a
> repository it already has the keys to.

That is not Jia Tan. Jia is in `AUTHORS` because Lasse wrote him there. 北川 is a seam. Keep
the seam. Stop writing the week after it as if the keys still had to be earned.

What does *not* earn its place is this, which is chapter 04’s thesis, in chapter 04’s cadence,
applied to a story whose git record says the opposite:

> The trust is not preamble to the operation. The trust is the operation.

In xz, that sentence is true: two and a half years of genuine help *were* the attack, because
the backdoor could not have been committed by a stranger. Here the keys are already on the
ring on day one. The week is not trust-building. The week is fluency — a dialect rehearsal,
a README-only `3.3.5` to test that npm still accepts a build from this account, a collect
alias fifty-two minutes before the sentence that completes the set. Recast it that way and
the fortnight stops being a compressed welcome and becomes the house-style chapter, which is
the chapter you are actually writing. Leave the sentence in and a reader coming from “One
character” will think: I have seen this heist. I have not seen this *gap*. Do not spend the
gap on the heist they already have.

Do not name the rhyme. Do not write “unlike xz,” “the last sabotage,” “Jia had years; this
one had days.” The reader has a memory. The discontinuity, the matching three lines, the wash,
and `branch --contains` will do the distinguishing if you let them be photographs instead of
a briefing on how this is different.

---

## 1. Structure and pacing

### The order is right. Do not reshuffle.

Event-stream first, colors second.

You cannot invert a wash before a wash. You cannot pay `master` still holding the knife
before the reader has cloned a tree that was cleaned on purpose. You cannot put colors first
without making this the Marak chapter, and then event-stream becomes the helpful-stranger
backstory — which is to say, xz-lite with a party trick glued on. House style, discontinuity,
untagged `3.3.6`, four-minute wash, then the same gap backwards. That is the argument. Keep
the order.

What the order is not doing is *volume*. Event-stream is three acts (style, week, wash) plus
a doorway that dumps the ending. Colors is a founding, an ownership lecture, four commits,
and a leftover that At home then spends as an exam. Two sabotages. One naming of the gap.
You currently name the attack in sentence one, name the gap at the wash, name the inversion
in the pivot, name it again at `--contains`, and name it a third time as a proverb. Three
namings and a jacket. One photograph per ledger is the job.

### The open is the right object. It dumps the ending.

The two-line `require` is the right cold open for this book and this chapter. Consecutive
chapters may not open on the same kind of object: 08 opened on twin seconds, 07 on a Friday
teapot, 04 on a shortlog. A grep of a tiny diff is a new object. Keep it. It is also the
title’s object, which is a gift if the title is allowed to sit as a helper before it is an
attack.

What you do with it is the same doorway disease as 01, 04, and 05:

> Here is the entire attack. Two lines:

Then the hunk. Then:

> This is the commit that put a bitcoin-wallet stealer into the dependency tree of millions
> of installs — the 2018 `event-stream` incident, the one every supply-chain talk since has
> used as its opening slide.

Then, having named the incident, the payload, the blast radius, and the genre:

> And there is nothing to see.

There is nothing to see because you have already said what to see. CONTEXT.md exists because
the earlier shelf had no surprise. A reader who already knows event-stream settles in for a
well-written recap of 北川. A reader who doesn’t has nothing left to feel a beat before it is
named, because you have named the malice, the talk-circuit fame, and the paradox (the hunk
is boring). Then you show 2012 as the *explanation* of a paradox you announced.

The reveal this open is supposed to earn is not “this was an attack.” Everyone who has heard
of npm has heard of event-stream. The reveal is *it is the 2012 sentence.* Show the two
lines without the word attack. Import, assign, depend. Then 2012, the same three lines, the
founding function extracted by the man whose name is still on the box. *Then* 2018 completes
the set. The reader who types JavaScript will feel the rhyme forming a beat before you say
`flatmap-stream` never lived here. The wallet can wait until the blast: the caret, `3.3.6`,
millions of installs. Famousness can wait forever. “Opening slide” is book-consciousness. It
is “now the famous part” from the xz draft, in a new suit.

**Move:** keep the hunk. Cut “Here is the entire attack.” Cut the incident-name sentence,
including Copay-as-headline (the CHECK already parks the wallet; the open does not need it).
Cut “And there is nothing to see” as a paradox you are proud of. After the two lines, one
plain gloss: import a package, assign it to a property, add it to the dependency list.
Subject line `add flat map`. Then the house style, which is the room. The empty `-S bitcoin`
is a later beat — the proof that git holds the hand, not the weapon — not a trailer in
paragraph two.

### The house style is the right room. It almost sits. Then it names the victim.

The 2012 hunk next to the 2018 hunk is the chapter’s unique archaeology. Do not move it. Do
not put it after the fortnight; the week only *means* dialect if we have heard the language.
The landing you already have is a keeper:

> The attacker did not smuggle a foreign object into the codebase. He wrote a sentence in
> the codebase's native language.

Isolate it. What steals the sitting is the sentence before it:

> That is the house style, established six years before the attack, by the victim.

*The attack. The victim.* We have not yet been allowed to watch Dominic extract his own
founding function as a reasonable decision about what the library *was* — “not a body of
code, but a façade.” That decision is the Tuesday. Sit in it until `es.map = require
('map-stream')` is what you would have done if you believed in tiny modules. Then 2018 does
not need the word victim. The reader will feel the hand that placed it, and the proof that
the shape was the project’s own — which you already wrote, in the open, as a trailer. It
belongs here, after the rhyme, as a landing.

### The seam is the difference from xz. Do not spend it on a newspaper.

> The handover is the part the newspapers get roughly right and git records exactly.

Docent. The book’s method is true of every chapter and does not need a special pleading
before the two `git log` lines. Run the commands. Dominic’s last act is a merge in October
2017. Eleven months of nothing. Then 北川, Outlook, `+0000`, a timezone Dominic never used,
already pushing. No merge, no `Co-authored-by`, no `AUTHORS`. Then the sentence you have,
which is the sentence:

> That is what a handoff of trust looks like from the inside. It looks like nothing.

Keep that. It is how this inheritance is not a welcome. Jia’s handover looks like a name
written into `AUTHORS`. This one looks like a clock that skips. The discontinuity *is* the
room. Do not also tell us the newspapers were approximately right.

### The fortnight is the right craft. It is framed as xz’s week.

Keep the log. Eight commits, five days, documentation, a Gulp note, a README-only `3.3.5`,
the collect alias fifty-two minutes before. Keep the pin-down inside `upgrade dependencies`.
Keep “that is what the name is for.” These are photographs this book has not run.

What to recast is the moral you hang on them.

> If `add flat map` had never been typed, this is the log of a bored, competent volunteer
> rescuing an abandoned package, and the whole world would have thanked him.

That is Lasse looking at a useful inbox. It is the sentence that turns five days into a
compressed two-and-a-half years. The world would not have thanked him, because the world
does not thank README work on an abandoned streaming utility; and more to the point, he did
not need to be thanked. He already had the keys. The week is not a résumé. The week is:
does this account still publish; does the dialect still take a new helper; does anyone read
a commit called `upgrade dependencies`. `3.3.5` is a channel test. The collect alias is the
same three-line shape, one more time, before the one that counts. Write that, and the
fortnight is this chapter. Write “the trust is the operation,” and it is chapter 04 with a
caret.

The pin-down is a tell, and it is currently a parenthetical in the trust sermon. Give it a
breath after the log, not as proof that the week was a con, as the one commit in the week
that is quietly not what it says. The reader can hold a channel test and a pin-down at the
same time. They cannot if you have already said the week was the heist.

Then Sunday, `add flat map`, nine minutes, `3.3.6`, no tag. The caret. This is the blast,
and it is in the right place, and this sentence is a keeper:

> The blast radius is not the twenty-six lines of the diff. It is the word `^`.

Isolate it. “Git tags and npm versions are different ledgers” can wait one clause; it is
the through-line, and it will be paid in full at the wash. Do not pay it here as a lecture
and again as a wash and again as a proverb.

### The wash is the turn the first half exists for. It is in the right place.

Four minutes, not a revert, major bump so `^3.3.4` will not follow, tag hung on the README,
clone it today, `package.json` is clean, npm served `3.3.6` for two more months. Then the
leftover: last commit is a CI tidy, `author` still reads `Dominic Tarr`. Do not move this.
Do not put it before `3.3.6`; a wash with nothing to wash is hygiene.

This is the photograph of the through-line. Protect it. The heading **The wash** is the
right object-name. The ranking in front of it is not:

> Then the most instructive four minutes in the repository.

Cut “most instructive.” Show 11:14, 11:16, 11:18. Let “this is not a revert” land after the
hunk, where you already have it. The face-was-washed sentence is a keeper (see Prose). The
Dominic-Tarr leftover is the right last taste of event-stream: the box is clean, the name
on the box is the wrong name, the shipment was the other ledger. Stop. Colors can start
without a tour guide.

### The pivot paragraph does not carry the weight. It announces the inversion.

> Which is the thing to hold onto, because three years later almost the same evening plays
> out in another repository, run the opposite way, and the lesson is the same read
> backwards.

This is the three-company contract from chapter 08, in the hinge instead of the doorway.
“The thing to hold onto” is a wrist. “The lesson is the same read backwards” is the
narrator grading the chapter. “Almost the same evening” overclaims a calendar rhyme the
clocks do not pay: the payload is a Sunday morning UTC; colors is 23:19 −0500 on 7 January.
Do not invent a Friday-to-Friday. The heading **The other Friday** is a private joke with
the 2010 founding (“a Friday night in 2010”) and with a wash that is not a Friday. Cute. A
cute hinge is a thesis-hinge in a hat.

**Colors does not deserve the cold open.** Opening on `Fix bug` would dump the human moment,
rhyme the title with xz’s one-character sabotage (a semicolon that does not parse is a
period that does not compile), and make event-stream the backstory. Opening on the four-commit
log would be a clock after chapter 08’s clocks. Opening on `branch --contains` would dump
the leftover. The two-line `require` is the open. Colors is the inversion. Inversions go
second.

What the pivot needs to be is a door. Start on the object: `"hello".red`, a README that
said `colors are awesome yo`, or — better — the four commits, 23:19 to 23:22, and let 2010
and `.zalgo` be the room *inside* colors, not a second cold open. Do not say “exactly as in
`event-stream`.” The reader who just watched `"author": "Dominic Tarr"` survive 322 commits
will feel `"author": "Marak Squires"` without a caption. Do not say “fully armed.” The keys
are the photograph; a living person is not a weapon.

### Colors is the right second photograph. It is paced as a founding plus a lecture plus a punchline.

Keep this order inside the section: the party library (so `.zalgo` exists), who ships versus
who owns, the four commits, `Fix bug`, then — at home, as leftover — `master` still contains
it. Do not reshuffle. Do not put `--contains` before the loop; the leftover has to be a
leftover.

Starve the founding. We need 2010 so the library is a joke that mutated `String.prototype`.
We need 2011 so 2022 can call the joke. We do not need a second origin-story with a brag
commit as its own movie. One hunk, `Snuck in demonic entity`, `// please no`, left in the
box. Then 2022, six and a half years, David Hyde 74 to Marak’s zero, `package.json` still
his. Then the owner came back. Four commits. The loop. Then the human moment, without a
drumroll.

> And then the tell — the human moment the whole chapter is here for:

The chapter is here for two ledgers. This moment is how colors stays *Blame* and does not
become a clip of a man who cannot type a `for` loop. You do not have to announce that it is
the human moment. Show `Fix bug`. Show `i++;` → `i++`. Sit in the seventy-eight seconds. The
reader will get there a beat before “a man treating his own sabotage as a bug to be fixed,”
which is the landing, and which you already wrote.

### Headings: two objects, one irony, one private joke

**The house style** — right. The object is a dialect.

**The helpful fortnight** — the xz word. *Helpful* is the irony announced. The log is eight
commits and a channel test. **3.3.5**, or **The first week**, or **upgrade dependencies**.
Anything that is a thing in the tree, not a verdict on a résumé.

**The wash** — right. Keep.

**The other Friday** — drop or replace. If colors needs a heading, **Fix bug** is the object
(and a risk: it will read as the title’s rival; see Title). **1.4.44-liberty** is the slogan
in the tree. **Adds new American flag module** is the first of the four, dry, a little
insane, his words. I would take the flag before I took “the other Friday.”

**At home** — template. Fine.

### First person is almost missing, and the one “I” you have is 北川’s

Chapter 01: “I go looking for it in the Debian *packaging* repository.” This chapter’s only
*I* is inside a gloss of the collect alias: *I have read this code and I am improving it* —
the attacker’s implied voice, in italics, which is the right use of that I. The engineer who
runs `blame` daily never enters.

One pair of hands, two places, then get out: at the empty `-S bitcoin` (“I run the log for
the words the incident is famous for. Git has never heard of them”), and at `branch
--contains` (“I clone it today”). Do not add memoir. Do not add “this chapter.” Do not add
“I want to be fair to Marak.” Fairness is the seventy-eight seconds, sat in.

---

## 2. Prose

Three keepers, already, for the series. Do not sand them.

> The attacker did not smuggle a foreign object into the codebase. He wrote a sentence in
> the codebase's native language.

> The blast radius is not the twenty-six lines of the diff. It is the word `^`.

> The repository's face was washed eight weeks before anyone knew the face was dirty.

And a fourth that is the colors landing, and will be a keeper once the drumroll and the
italics wink in front of it are gone:

> What git recorded is smaller and stranger than the legend: a man treating his own
> sabotage as a bug to be fixed.

A fifth, the seam, which is how this is not xz:

> That is what a handoff of trust looks like from the inside. It looks like nothing.

### The clunkiest sentence

The pivot, which has to do three jobs in one breath and does none of them as a photograph:

> Which is the thing to hold onto, because three years later almost the same evening plays
> out in another repository, run the opposite way, and the lesson is the same read
> backwards.

“Which is the thing to hold onto” is a throat-clear. “Because” hangs a second chapter on a
subordinate clause. “Almost the same evening” is a rhyme the timestamps do not support.
“Run the opposite way” is the inversion as jacket copy. “The lesson is the same read
backwards” is the narrator, at the hinge, grading the homework.

Rewrite: do not rewrite it. Delete it. Colors starts.

If you must have one crossing sentence, make it an object, no lesson:

> Three years later the other ledger is the one that gets washed.

Then `"hello".red`. Even that is a caption. The `--contains` leftover will say it without a
hinge if the wash has been allowed to finish.

Runner-up, and the sentence that spends `Fix bug` as a joke the narrator is in on:

> Seventy-eight seconds after the first version bump, he noticed his infinite loop did not
> parse, and he fixed it, the way you fix any bug, and bumped the version again so the
> *working* loop would be the one people installed.

Three *and*s, a duration, a diagnosis, a method, and a wink. The italics on *working* are
the sneer. Rewrite, sitting in the room, no italics:

> Seventy-eight seconds after the bump, the loop did not parse. He took the extra semicolon
> out of the header. Then he bumped the version again.

The reader who has ever saved a file, seen a `SyntaxError`, and saved it again will feel
“so the one people installed would run” without being elbowed. “The way you fix any bug”
can stay if it is his Tuesday, not our punchline. It cannot stay next to *working*.

### The paragraph doing the most work

The wash, from “This is not a revert” through the dirty face:

> This is not a revert. `git log --diff-filter=R` will never find it; there is no "Revert"
> in any message. The dependency is dissolved in-place, the major version is bumped so that
> `^3.3.4` will *not* follow into `4.x`, and the release tag `4.0.0` is hung not on the
> dependency-removal commit but on the README commit two minutes later. Clone this
> repository today, check out `master`, read `package.json`: it is clean. No
> `flatmap-stream`, no trace. Meanwhile npm went on serving `3.3.6` to every unpinned
> installer for two more months, until a stranger opened the dependency in November and
> found the wallet stealer. The repository's face was washed eight weeks before anyone
> knew the face was dirty.

This is the chapter in miniature, and it does not say “two ledgers.” It shows a clean tree
and a dirty shipment in the same breath, and then a sentence that could go on the jacket of
the *book* if you isolate it. The November stranger is the right amount of outside-the-repo
— one clause, the CHECK already on it — and it does not steal the photograph the way Freund
stole the period in the xz draft. Protect this. Do not also explain it at the pivot, at
At home, and as ~3.

Honorable mention: the house-style landing, from `es.flatmap = require('flatmap-stream')`
through “native language.” If the open stops dumping, this becomes the turn of the first
half, not the explanation of a paradox.

### The paragraph pulling its weight least

The pivot, already. After that, the ownership lecture in colors, which announces the rhyme
the wash just earned:

> By 2022 Marak had not touched the shipping branch in six and a half years; a developer
> named David Hyde had quietly become the project, 74 commits to Marak's zero, tagging
> every release. But — exactly as in `event-stream` — the person who *ships* and the person
> who *owns* were two different people. `package.json` still said `"author": "Marak
> Squires"`, and the keys never moved: the proof is the next four commits, pushed straight
> to `master` by a name that hadn't used them in years. The repository looked abandoned.
> It was, in the only sense that mattered, fully armed.

The facts are the room: six and a half years, 74 to zero, the author field, four commits
straight to `master`. “Exactly as in `event-stream`” is the caption. “Fully armed” is
thriller, and it is the sentence that turns a living person into a loaded gun. Cut those
two. Keep Hyde, keep the author field, keep “the owner came back.” The four commits are the
proof; you do not need to tell us the proof is next.

### Other prose notes, shorter

- “If you want to see the actual craft, don't read the commit the newspaper names.” Wrist.
  Show the week.
- “a test that publishing still works, that npm still accepts a build from this account.”
  Keep. This is the fortnight as channel, not as trust.
- “Nobody reviewing a commit called `upgrade dependencies` reads it closely; that is what
  the name is for.” Keep. The book’s voice, not a sneer at a living reviewer.
- “the most-installed streaming utility in the ecosystem” — stake-inflation unless a
  receipt supports the superlative; you do not need it. “A streaming utility the ecosystem
  had already installed” is enough.
- “And it stays washed.” Good hinge into the leftover. Keep.
- “He did not write a weapon; he called the joke he shipped in 2011, in a `for` loop with
  no end.” Keep. Isolate. This is the anti-sneer and the anti-xz in one sentence. Jia wrote
  a weapon. Marak called a party trick. Do not sand *called*.
- “There is no manifesto in this commit, no speech.” Keep. Then the empty `-S 'no more'`.
  The folklore lives on Twitter; git has a semicolon. That is the method. Do not then
  summarize the protest in order to refuse it — you already refused it by running the log.
- “a default branch still holding the knife.” Thriller, last page. The leftover is
  `--contains`. A knife is a caption on `--contains`.
- Quiet `[R1]`…`[R18]` on the reading surface the way the later shipped chapters learned to.
  The receipts list is the right home.

---

## 3. Marak: check every colors paragraph

The prompt asked this specifically, so I will be exact. Marak Squires is alive. The protest
was about unpaid labor, whether or not it was a good protest. `Fix bug` must read as a
person in a room, not as a clip. The draft is closer than the risk suggests. It is not
clean.

**Clean, or clean enough:**

- The 2010 founding. “24-line toy” is slightly diminutive; it is also 24 lines. His README
  is `colors are awesome yo`. That is his voice, not yours. Keep the README; *toy* can
  become *library* or just the line count.
- `.zalgo` as a party trick, `// please no`, eleven years in the box. Accurate. Not a
  character judgment. We need it so 2022 has something to call.
- David Hyde’s 74 commits. Ledger. Not a moral about neglect, unless you let “quietly
  become the project” curdle — it is one adverb from a sigh. “Had become the project” is
  enough.
- “On the night of 7 January 2022, the owner came back. Four commits, three and a half
  minutes.” The room. Keep.
- The loop hunk, including 666 and Infinity. They are his. Do not gloss 666 as demonic; you
  don’t. Good.
- “He did not write a weapon; he called the joke he shipped in 2011.” The ethical sentence
  of the second half. Keep.
- The empty protest-grep. The method. Keep. Do not add Twitter, faker.js, or “no more free
  work” as biography you then disown. Fairness is *not* putting the speech back into a tree
  that does not have it.
- “smaller and stranger than the legend.” Keep.

**Not clean:**

- “fully armed.” A person is not a magazine. The keys were still his. Write the keys.
- “And then the tell — the human moment the whole chapter is here for.” Poker, and a
  laugh-track. Cut the whole sentence. The hunk is the tell.
- *working* in italics. That is the narrator enjoying a man who debugs his own sabotage.
  The debugging is the humanity. The enjoyment is the sneer.
- “so the *working* loop would be the one people installed.” Even without italics, this is
  hindsight-flattering: we are in on a plan that, in the seventy-eight seconds, may have
  been a man staring at a parse error. TEMPLATE.md: reconstruct what the actor knew when
  they typed. What he knew is: this file does not parse. What he typed is `Fix bug`. Sit
  there. Do not sit in November’s newspaper.

**The `Fix bug` landing, as it should read:**

Show the hunk. One sentence of mechanism: a stray semicolon in the loop header, a
`SyntaxError` on load, the loop never runs. Then seventy-eight seconds, the extra semicolon
out, a second bump. Then:

> There is no manifesto in this commit, no speech. What git recorded is smaller and
> stranger than the legend: a man treating his own sabotage as a bug to be fixed.

That is human. It is also strange, which is better than mockery and better than a speech
about unpaid labor you would have to import from Twitter to be “fair.” Do not make him
tragic. Do not make him a clown. Do not make him Jia Tan with a flag. Make him a programmer
who came back to a package that still had his name on it, and who fixed a semicolon.

---

## 4. Title

**Keep “add flat map” only if the open stops dumping the attack.**

It is the right kind of title for the book: his words, not folklore, not “The event-stream
incident,” not “Two ledgers.” Innocent words. A helper. The chapter is the proof that a
helper can be a shipment. Chapter 02 did this with “to improve performance.” Chapter 05 with
“Magically fixes all errors.” Same deal here, with a harder job, because the talk circuit
has already spent this title as a famous payload. The body has to let it sit as a flat-map
*first*, or the contents page is a recap.

Three risks.

**The open spends the flip.** Right now the title cannot turn. Sentence one is “Here is the
entire attack.” A reader who sees `add flat map` on the contents page, then is told it is
the wallet-stealer, is confirming a label. Innocent-words only work if the first page still
believes them. Cut the dump, walk through 2012, and the title flips at `flatmap-stream`,
where it should — a beat before you say the malice is the other package.

**Wrong center.** The event of the first half is the matching three lines, then the wash.
The event of the second half is `Fix bug`. The title sits on the payload commit. That is
acceptable for a two-repo chapter if event-stream is the A-story (it is) and colors is the
inversion (it is). It is not acceptable if you also drumroll `Fix bug` as “the human moment
the whole chapter is here for,” because then the title picked the wrong half and the
narrator is telling you so. Pay both: house style as the turn, `Fix bug` as the human
leftover of the inversion, title sitting on the helper without denying the semicolon.

**xz echo, if you switch.** The alternative candidate is **Fix bug**. I would not. It is a
better *moment* than it is a title. As a title it does three bad things: it centers Marak;
it invites the sneer (contents page: look, he could not type a loop); and it rhymes with
“One character,” another tiny syntactic sabotage, two sabotage chapters in a row named
after a one-glyph mistake. 北川’s commit is not a mistake. It is a fluent sentence. The
title should be fluent.

I would keep it. I would not use the alternatives unless the doorway stays a recap of a
famous incident, in which case the title cannot, because innocent-words-plus-jacket is the
same sag as “Magically fixes all errors” on top of a bronze night.

Alternatives, in order, if you change it:

1. **Fix bug** — the human moment, the inversion’s object, too much of a clip as a contents
   page, wrong center, sneer risk, xz rhyme. Only if you decide colors is the chapter
   (structurally it is not).
2. **upgrade dependencies** — the pin-down, the name that is for not being read, dry, a
   little interior. Loses the matching three lines.
3. **3.3.6** — the untagged shipment, the caret’s target, a version as title. Caption.

I would not use “The wash” (the turn of the first half, not the object). I would not use
“Two ledgers” (thesis as title). I would not use “The other Friday” (cute, and a heading you
should already drop). I would not use “flatmap-stream” (the other package, the weapon, a
CVE-shaped name). I would not use “Here is the entire attack” (the dump).

Keep “add flat map.” Let 2012 believe it. Let 2018 complete the set.

---

## 5. The three ~ lines

**Keep the first. Keep the second. Cut the third off the last page.**

> ~ The safest place to hide a malicious change is inside the project's own idea of a
> normal one.

Earned. Local to the house-style photograph. The 2018 three lines *are* the 2012 three
lines. This is what pull-quotes in this book have been when they work: the law of the
photograph we just watched, not a moral for the tour. Keep. Do not move it to At home; At
home is both ledgers, not only the dialect. Give it whitespace after “native language.”

> ~ A repository can be spotless and a lie at the same time; `master` shows you the face,
> not the shipment.

Earned. Local to the wash. This is the through-line, as a proverb, in the right place —
after we have cloned a clean tree that shipped poison. Keep. It is also the sentence colors
will invert, which is why it must stay *here*, on the washed face, and not be saved for the
last page. Colors does not need its own ~ to say the opposite; `--contains` is the opposite.

> ~ The registry ships the tarball; git keeps the fingerprints. Read the one that can hurt
> you, and then read the one that can tell you who.

This is the thesis as a proverb, after At home has already said it in commands, and it
delays a close you have not quite written. *Tarball* is xz’s word. Chapter 04’s habit was
already “diff what you *ship* against what you *commit*.” A second sabotage chapter does
not get to end on a restatement of the first sabotage chapter’s close with `registry`
swapped in. The new habit is the inversion: a clean `master` is not a clean npm, and a
clean npm is not a clean `master`. ~2 already said the first half. `--contains` is the
second. ~3 is a seminar.

**Keep / cut / move:**

- ~1: **keep**, where it is.
- ~2: **keep**, where it is. Do not also say it at the pivot.
- ~3: **cut** on the last page. If the sentence survives, it survives as *prose* inside a
  short At home, and it cannot say *tarball*. “The registry ships what you install; git
  keeps the face.” Even then I would rather the last line be an object: `master` still
  contains `074a0f8`, or Dominic Tarr still in the author field, or a man who typed `Fix
  bug`. Do not add a fourth ~. Three is already a chorus, and one of them should go.

---

## 6. Word count, cuts, rooms

2,404. Mid-band. This is not chapter 04 (under the floor, rooms left out). This is not
chapter 08 (a tour contract and a sequel). The band is permission to sit in two Tuesdays
the captions currently skip, funded by the dump, the xz-thesis, the pivot, and the
worksheet. It is not permission to add `faker`, `peacenotwar`, `ua-parser-js`, or a third
registry. Landing around 2,300–2,600 is this draft, honest, after the axe is out. Do not
chase 3,200. A two-repo chapter that fills the cap becomes the tour you are trying not to
write.

### Cut, in order of what they buy

1. The doorway dump: “Here is the entire attack”; the incident-name / opening-slide
   sentence; “And there is nothing to see” as a proud paradox.
2. “The trust is not preamble to the operation. The trust is the operation.” Recast the
   fortnight as dialect and a channel test, not as xz’s welcome.
3. The pivot paragraph, “exactly as in `event-stream`,” “fully armed,” “the tell,” “the
   human moment the whole chapter is here for,” *working*.
4. At home’s examiner encyclopedia (see Close). ~3 on the last page.
5. Rankings and wrists: “most instructive four minutes,” “don’t read the commit the
   newspaper names,” “the thing to hold onto,” “most-installed.”

That is a few hundred words. Spend them in two places, not five.

### A. Sit in the façade (The house style, after the 2012 hunk, before 2018)

Right now: founding `map`, a decision that the library is a façade, the hunk, then
immediately “six years before the attack, by the victim,” then the 2018 three lines as a
matched set.

Add four to eight sentences that are only the decision. Tiny modules, a thin file that
re-exports, the founding function leaving the building. This is what the project *is*. I
might have done this. Stop before camouflage. Stop before attack. The 2018 sentence is the
camouflage, and it cannot land as a rhyme if 2012 was already a caption of a heist.

This is the non-negotiable from CONTEXT.md (“I might have done this”) and it is how
event-stream stops being xz with a `require`.

### B. Sit in the seventy-eight seconds (colors, after the `Fix bug` hunk, before the legend)

Right now: drumroll, hunk, SyntaxError gloss, seventy-eight seconds, *working* loop, second
bump, then the empty protest-grep.

Replace the drumroll with the parse error as a room. The file does not parse. The loop
never ran. He takes the semicolon out. `Fix bug`. The second bump. Then the legend-grep,
then “a man treating his own sabotage as a bug to be fixed.” This is substitution, not a
new exhibit. It is how colors is human instead of a clip, and it is how the inversion stays
*Blame*.

### What not to add

- A third npm incident, a “what about `node-ipc`,” a tour of every registry sabotage in
  `scout/`.
- faker.js, the Twitter thread, “no more free work” as a speech you then refuse. The empty
  log is the refusal. Importing the speech to be fair is how fairness becomes a sneer.
- 北川’s identity, nation-state guessing, a name behind the Outlook address. The git
  history cannot. This book only tells you what the git history can prove. You already
  know this from Hans Jansen; do not re-litigate it.
- Marak’s interior beyond the four commits and the semicolon. Alive. Named. The
  seventy-eight seconds are the room; a portrait of unpaid labor is not.
- A primer on caret ranges beyond what `3.3.6` already taught. At home can point; it
  cannot reteach the blast.
- `--format='%aI %cI'` as a habit. That is chapter 07 and chapter 08. You may have a
  clause of a new name with keys. You may not have a second clocks assignment.
- Any sentence that begins “this chapter,” “exactly as in event-stream,” “the lesson is
  the same,” “the human moment the whole chapter is here for,” “unlike xz,” or “the last
  sabotage.”
- A contrast-hinge with chapter 04. The reader has a memory. Do not write “the last
  chapter had a stranger too.”

If the chapter comes out at 2,350 because the dump died and the pivot died and the
worksheet died, and 2012 was a short paragraph, that is closer to honest than padding to
2,900 with faker. The band is a band, not a dare. Consecutive chapters should not all be
the same length; a mid-length pair after a mid-length costume is the craft, *if the second
repo is an inversion and not a sequel*.

---

## 7. Open and close

### Cold open — the right object, then a talk-circuit recap

What works: the two-line hunk, import / assign / depend, the subject line sitting there
looking like a helper. What fails: “Here is the entire attack”; the wallet, the millions,
the opening slide; “And there is nothing to see”; “the shape of the hand” as a trailer for
a section that is about to do that job.

Stronger version, same object:

```console
$ git -C repos/event-stream show e3163361fe -- index.js package.json | grep -E '^[+-]' | grep -vE '^[+-]{3}'
```

Then:

> Import a package; assign it to a property; add it to the dependency list.

Then `add flat map`, and that is exactly what it does. Then 2012. Stop. No incident name.
No talk circuit. No paradox. The house style can start on Dominic, 2011, a single `map`
function, a decision about a façade. Colors can wait thirty pages. Consecutive-open is
already a diff after a clock; protect its temperature by not also being a keynote.

Do not open on `Fix bug` (pays colors; xz rhyme; sneer). Do not open on the four-commit
liberty log (pays colors; a clock after 08). Do not open on `branch --contains` (pays the
leftover). Do not open on the 2012 hunk (pays the room; the 2018 two lines are the object
the title names). The title is a helper. The open is the helper. Let them meet at
`flatmap-stream`, not in paragraph one.

### At home — the right leftover, then a worksheet, then xz’s close

The leftover is right, and it is the inversion the pivot was trying to announce:

```console
$ git -C repos/colors branch -a --contains 074a0f8ed0
* master
$ git -C repos/colors tag --contains 074a0f8ed0   # (empty)
```

> It is still there. `master` — the branch you get when you clone it today — *is* the
> payload.

That is the photograph. TEMPLATE.md wants the habit woven, not boxed. You have not boxed
it. You have listed four:

> So when you audit a dependency, audit the shipment, not the face. `git log --author`
> and `--format='%aI %cI'` on the last year… `git tag --contains` the version you actually
> installed… Read the `upgrade` commit that pins one thing down. And when the news tells
> you a repository was cleaned, run `--contains` yourself… a default branch still holding
> the knife.

That is the seam, chapter 08’s clocks, the caret, the pin-down, and the leftover, as an
exam. Chapter 06’s At home was the tour as a worksheet. Chapter 08’s was too. This is the
same shape. `--format='%aI %cI'` is also 07 and 08. You may have `--contains` (this
chapter’s portable find, born from a washed face and an unwashed `master`). You may have
one clause of a new name that arrived with keys. You may not have a fourth assignment and
a knife.

Then ~3, which restates xz. Then no last line — the proverb is the last line. Chapter 08
had Lattner. Chapter 04 had “which line to read twice.” This draft ends on a seminar.

Stronger close:

1. Last story image: `master` still contains the loop, or the author field still reading
   `Dominic Tarr` after a clean tree — the face and the shipment, disagreeing, in opposite
   directions from each other. I would pick `--contains` if colors has been allowed to be
   the inversion, because the close then pays the through-line *and* the second photograph
   without a proverb. Dominic Tarr is event-stream’s leftover and already landed at the
   wash.
2. One woven paragraph, one command not four: `git tag --contains` the version you
   actually installed. A caret does not resolve to `master`. A clean clone is not a clean
   install, and an unpublished npm is not a clean clone. Two clauses, off the wash and the
   liberty commits, not a manual. A new name with keys can be a third clause, not a
   `git log --author` tutorial.
3. Last line, keep and isolate: “It is still there.” Or, if you want the human close
   instead of the ledger close: “a man treating his own sabotage as a bug to be fixed.” I
   would not keep both stacked on ~3. I would keep `--contains` as the last photograph,
   one habit, and let “still there” be the last line, with whitespace between them. The
   man-and-the-semicolon sentence belongs at `Fix bug`, not as a moral on the way out.

The worksheet question, asked directly: **yes, too much of a worksheet.** Four commands, a
force-push you expected and did not find, a knife. The habit this chapter teaches is one
command. `--contains` the thing you installed. Everything else is a recap of the first
half, graded.

---

## Top 5 changes, by impact

1. **Stop writing event-stream as xz.** Cut “The trust is not preamble to the operation.
   The trust is the operation.” Recast the fortnight as dialect and a channel test: the
   keys are already on the ring; `3.3.5` asks whether npm still accepts a build; the
   collect alias is the same three-line shape, one more time. Keep the discontinuity
   (“it looks like nothing”). Keep the matching 2012 / 2018 hunks. Keep the wash. This is
   the change that makes a second sabotage chapter a chapter, and not a compressed welcome.

2. **Do not dump the attack in the doorway, and do not announce the inversion at the
   pivot.** Cut “Here is the entire attack,” the opening-slide sentence, “And there is
   nothing to see.” Stay with the two lines through Dominic’s façade until 2018 completes
   the set. Cut the pivot paragraph (“the thing to hold onto… read backwards”). Cut
   “exactly as in `event-stream`.” Start colors on an object. Let `--contains` be the
   inversion, named never. This is the change that lets the title flip, and the change
   that turns two documentaries into one chapter.

3. **Let `Fix bug` be a room, not a clip.** Cut “the tell,” “the human moment the whole
   chapter is here for,” *working*, “fully armed.” Sit in the seventy-eight seconds as a
   parse error a person fixed (expansion B). Keep “he called the joke he shipped in 2011.”
   Keep “a man treating his own sabotage as a bug to be fixed.” Keep the empty protest
   log; do not import Twitter to refuse it. This is the ethical change and the colors
   change; they are the same change. Still-live actor. The ledger is enough.

4. **Sit in the 2012 Tuesday; starve the rest.** The façade as a reasonable decision
   (expansion A), so the 2018 sentence can be mistaken for his. Do not add acts. Do not
   add faker. Do not chase 3,200. Rename **The helpful fortnight**; drop **The other
   Friday**. Quiet the receipts on the page. Two rooms, not a third incident.

5. **Photographs before verdicts; proverb three off the last page; one last line.** Keep
   ~1 and ~2 where they are. Cut ~3, or at least cut *tarball*. Fuse At home into
   `--contains` the version you installed, one clause of a new name with keys, not four
   commands and a knife. Isolate “It is still there.” Last line an object, not a seminar.
   Consecutive-open is already a diff; do not also keynote.

---

## The single most important change

**Stop writing the helpful stranger. Write the matching sentence, then the two ledgers.**

Cut the doorway that names the incident. Cut the sentence that says the trust is the
operation. Cut the pivot that says the lesson is the same read backwards. Keep the 2012
hunk next to the 2018 hunk until a reader would have approved the `require`. Keep the
seam where a new name already has the keys. Keep the four minutes that wash `master`
while npm serves `3.3.6`. Then a man who comes back to his own package, takes a semicolon
out of a loop, and leaves the loop on `master` for anyone who clones it today.

The book already has a heist that takes two and a half years. What it does not have — and
what this draft is already holding, under a coat that belongs to chapter 04 — is a helper
that is a dialect, a clean tree that is a lie, and a dirty tree that is the truth the
registry erased. Let those three photographs be the chapter. The reader will feel the gap
a beat before anyone says the word *shipment*.
