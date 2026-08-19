# Craft review: “One character”

Chapter 04, xz / Jia Tan / CVE-2024-3094. 1,507 words of body against a 2,200–3,200 band. This is a craft review, not a fact check. Hashes, dates, commands, and quoted output are locked. I am not touching them.

The bones are the right bones, and they are in the right order. Five acts, chronological, which is the only honest shape for a heist whose weapon *is* the calendar: a welcome, a name that donates a hook and vanishes, a file git was taught not to see, one character inside a security improvement, an exit you can only read backward. The voice, when it is looking at a hunk, is already the book’s voice. Three sentences in this draft are keepers for the series. I will name them.

The problem is the doorway, and it is the same problem the last two review rounds made policy. You tell the reader there is a villain, that everything was on purpose, that the instructive part is how ordinary the commits look, and that the weapon is barely in the repository — and then you spend 1,500 words confirming the jacket copy. The January NULL-check, the burnout that looks like a handover, the empty log, the period, Lasse cherry-picking the tidy forward: those are the book. They are currently fighting their way out of a plot summary they never asked for.

This is also not a chapter 03 situation. 1,507 words is not lean-and-right. It is five photographs with the rooms left out. The story is two and a half years and a library that ships everywhere. The band is permission to sit down. It is not a mandate to add a sixth act.

---

## The cross-reference does not earn its place

The prompt asks this first, so I will not bury it.

> The last chapter had no villain. This one has nothing else.

It violates the no-announcing rule, and it is also the wrong sentence even if the rule did not exist.

**It announces.** Chapter 01, sentence two, named the guessable keys. Chapter 02, paragraph one, named the absent villain and the five deposits. Chapter 03 called itself the smallest story in the book. Every one of those was flagged. This is the same gesture in a better coat: a contrast-hinge that tells the reader how to feel about the next 2,000 words before they have seen a patch. CONTEXT.md exists because the earlier shelf had no surprise. A reader who already knows CVE-2024-3094 settles in for a well-written recap of Jia Tan. A reader who doesn’t has nothing left to feel a beat before it is named, because you have named the moral (purpose), the structure (patience, one name, trust), and the unique archaeology (the weapon is not in the tree). Then you clone.

**It points at the wrong neighbor.** In the book as bound, the last chapter is 03, Bitcoin, Gavin’s `--author=` flag. That chapter also has no villain. It is a quoting mistake made in the course of being respectful. The phrase “no villain,” though, is chapter 02’s thesis language — Log4j, competent people, compounding. So the sentence is either sloppy about sequence (you mean 02, Bitcoin is sitting between you) or it is borrowing 02’s slogan to describe 03. Either way the reader is doing table-of-contents math in the doorway. The 02/03 review already said: do not name the rhyme. Do not write “as we just saw with Log4j.” This is that sentence, one chapter later, aimed at a chapter that is not even adjacent.

**It spends the only structural gift this chapter has.** After a thesis chapter about approving reasonable deposits, and a palate-cleanser about a janitor’s honest move, the reader is *primed* to approve another small defensive patch. January 2022, NULL checks, Lasse applies it: that is the same muscle chapter 02 trained. The ground is supposed to give way later. If sentence one says “this one has nothing else,” they never approve the patch. They wait for the other shoe. The welcome cannot do its job if you have already said there is a villain. That is not a style note. That is the chapter’s mechanism, broken in the first eight words.

**The contrast is real. It belongs to the reader.** The person who just lived Ralph saving CPU, and then Gavin preserving a name, will feel the temperature change when a two-year co-maintainer turns out to have been the attack. You do not have to introduce the temperature. If you are genuinely afraid the hinge will be missed — I am not — the place for one clause is the last paragraph of At home, after the period has landed, and even then you name an *object* (“the commit whose subject said performance”), never a chapter. “The last chapter” is book-consciousness. It is “this is the smallest story in the book” in a new suit.

**Move:** delete the two sentences. Delete the rest of paragraph one with them (see Open). Enter on the patch Lasse applied. Let the reader who is still wearing chapter 02’s glasses approve it. The contrast will happen to them. That is the assignment.

---

## 1. Structure and pacing

### The five acts are in the right order

Welcome → Hans → `.gitignore` → the period → the exit. Do not reshuffle.

This is a patience story. Chronology *is* the plot. Hans between the welcome and the weapons is the right unease: the trusted name is in `AUTHORS`, and then a second name appears, donates a loader, and is never heard from again. Moving Hans after the period would turn him into a footnote on a hook we already understand. Moving the period before the empty log would pay the title early and make the tarball gap feel like appendix. The current order is: plant the hook, hide the weapon, disable the cage, turn out the lights. That is the heist. Keep it.

What the order is not doing is *pacing*. Each act is currently a label, one receipt, and a verdict. Five verdicts in a row is a briefing. The reader never lives in a Tuesday.

### The welcome is the right room. It does not spend the six months.

You have one beautiful object — Lasse applying a NULL-check patch — and then you skip to August and `AUTHORS` in a sentence. The six months between them are a list:

> Over the next six months "jiat75" sends more — test cleanups, coverage scripts, CMake work —

That is a CV. TEMPLATE.md: reconstruct what the actor knew when they typed. The actor in this room is Lasse. What he knew in January 2022 is: I have been maintaining this alone; someone sent the kind of patch I want; I applied it. What he knew in August is: they stayed. You say the nicest-thing sentence, and it is a keeper, and then you spend it on a summary of 2023 (“Jia is doing more of the work than Lasse”) that the reader has to take on faith. Nobody in this room has stood next to a burned-out maintainer looking at a useful inbox.

The heist/burnout pair is the best turn *inside* the welcome, and it is currently the hinge of a paragraph that immediately explains itself:

> Nobody in the room is watching a heist. They are watching a burnout end. That is the point of the two and a half years — not the code, the *trust*. The backdoor could not have been committed by a stranger. It had to be committed by the co-maintainer, and the way you become the co-maintainer is to be genuinely helpful for a very long time.

First two sentences: the book. Isolate them. Everything after the period is the narrator grabbing the reader’s wrist. If the welcome has been a room, the reader is already thinking *I would have written that name into AUTHORS*. You do not need to tell them that was the point.

### Hans is the right interruption. He is introduced as a trailer.

> In June 2023 a second name appears, and this one is worth watching because it does exactly one thing and then vanishes:

“Worth watching because” is “here is the pivot” in a new suit. The heading has already said “A name that only adds one thing.” Then the empty-ish `git log` line, then the ifunc explanation, and then, before the reader has been allowed to wonder:

> It is also the exact hook the eventual payload needs

That is hindsight-flattering. In June 2023 ifunc is a legitimate optimization. The payload does not exist yet, on the page. Let Hans land the groundwork. Let him vanish. Let “exact hook” wait until we have seen a resolver used, or let it not be said at all — the later acts will do the pointing. The git history’s proof, which you correctly refuse to overclaim, is a name that appears, donates a loading mechanism, and disappears. That sentence is already in the draft. It should be the landing, not the apology that follows the landing.

Then this, which is the wrong first person in the book:

> I am not going to tell you who Hans was; the git history cannot, and this book only tells you what the git history can prove.

The second clause is the truth. The first implies you *know* and are withholding, which is a mystery-novel wink and a small sneer at the reader’s curiosity. The manifesto about the book’s method is true of every chapter and does not need a special pleading here. Cut the sentence. “What it proves is a name that appears, donates a loading mechanism, and disappears — six months before that mechanism is used.” That is enough, and it is clean.

### The empty log is the chapter’s unique archaeology. It is in the right place. It is announced.

> Now the famous part, and the first surprise is that you cannot `git show` it.

“Now the famous part” is a docent. “The first surprise is” is a spoiler of a surprise. Cut the wind-up. Run the command. Empty. *Then* name what that means.

The substance of this act is the strongest git-shaped find in the chapter: the payload travelled in a file that was never a tracked object; the only trace is its name in a `.gitignore`; Lasse himself cherry-picked the tidy forward, twice, because read in isolation it is exactly what it claims to be. That last fact is the “I might have done this” of the sabotage chapter — not Jia’s Tuesday, Lasse’s — and it is currently one clause at the end of a long paragraph about crime scenes and tarballs. Give it a breath. It is how this chapter stays *Blame* and does not become a thriller recap.

The heading “The weapon that is not here” is a little cinematic and a little thesis. The object is `build-to-host.m4`, or the commit subject you already quote: `Update m4/.gitignore.` Either would be this story’s object. “The weapon that is not here” is the narrator pointing at the hole instead of letting the empty log be the hole.

### The one-character reveal does not land. The mechanism does.

This is the question the title asks, so I will be exact.

What works: the room (a Landlock check, a security *improvement*), the hunk with the lone `.`, the compile-fails-so-the-sandbox-never-exists chain, the later minus-dot-plus photograph, Lasse’s subject line saying “sabotaged” out loud. That sequence is correct. Do not move it. Do not put it before the empty log.

What steals the landing, in order, before the reader is allowed to see a period:

1. The chapter title, “One character.”
2. Paragraph one, “by one person” — which spends the title’s pun as *villain-count* rather than *glyph*.
3. The heading, “The period.”
4. The first sentence of the section: “The second surprise is a single character, and it is the most audacious thing in the whole affair because it is hiding in a commit whose message says it is a security *improvement*.”
5. “Look at line two.”

By the time we reach the hunk, we are not discovering a period. We are confirming a period we have been told to look for. Chapter 01’s rule, already applied twice: isolate the beat; do not wind up. The fact is the wind-up.

The reveal the reader should feel a beat before it is named is not “there is a character.” It is *what the character does*. Show the Landlock commit as a responsible maintainer adding a sandbox check. Show the hunk. Let the `.` sit there looking like a typo, or like line-noise, for one beat — the reader who types C will feel the syntax error forming. *Then* the never-compiles chain. Isolate the sentence you already have, which is the real landing:

> Someone sat in front of that file and added one character.

That line is a keeper. It is currently the fifth time we have been told about a single character, so it lands as restatement.

The minus-dot-plus block, and the paragraph that follows it, is the hardest-working page in the draft (see Prose). Protect it. It is the photograph of the title. It cannot also be the place you introduce Andres Freund and March 29 and “everything before that date is written in the language of maintenance” in the same breath as the word “Sabotaged.” Freund is the right amount of outside-the-repo — one clause — but he is currently stuffed into the landing of the character. Let the character finish. Freund can open the exit, or sit at the end of this act as a one-sentence date-stamp, not as the clause that explains why the word “sabotaged” did not exist yet.

### The exit is the right last act. It psychologizes in front of the evidence.

Jia’s 01:50 trim of `SECURITY.md` is a perfect exit object: a clock (different from chapter 01’s Tuesday afternoon — consecutive-open is fine; 03 opened on a shortlog), a docs commit, a last authored-and-committed hash, then dark. “A tell you can only read backward” is poker-speak and a trailer. Start on the clock.

Lasse’s return is where the ethical register will be won or lost, and you almost win it, and then you overdraw:

> The final word is Lasse’s, returning to a house that turned out not to be his alone. His removal commit reverts the backdoor and reads like an inventory of grief:

Then the quotation says: “The maintainer who added the backdoor has disappeared. Backdoors are bad for security.” That is not an inventory of grief. That is dry, almost bureaucratic, and much better than grief. The metaphor is fighting the receipt. Sit with *his* words. They are stranger and more decent than the eulogy you wrote in front of them.

The `AUTHORS` beat — second name out of the header, reappearing lower down, labelled, dated, sealed — is the leftover, and it is the right leftover. “The way you edit a headstone” is one metaphor too far next to “table of contents for the attack” in the same sentence, and “headstone” is a death the man did not die. The years 2022 to 2024 become a marked interval. That sentence can carry the close of the story proper without a funeral.

### First person is almost missing, and the one “I” you have is the wrong one

Chapter 01: “I go looking for it in the Debian *packaging* repository.” This chapter has the clone in the imperative, and “I am not going to tell you who Hans was.” That is the teacher’s I, not the engineer who runs `blame` daily. One pair of hands, two places: at the clone, and at the empty log (“I run the log for the file everyone is looking for. Git has never heard of it.”). Then get out of the way. Do not add memoir. Do not add a manifesto about what the book will and will not prove.

---

## 2. Prose

Three keepers, already, for the series. Do not sand them.

> Nobody in the room is watching a heist. They are watching a burnout end.

> Someone sat in front of that file and added one character.

> A minus, a dot, a plus, a blank line.

And a fourth that is almost a keeper and should be the last line, once the seminar in front of it is gone:

> Blame, here, is not a question of who to punish. It is a question of which line to read twice.

### Hardest-working paragraph

The minus-dot-plus landing, from the word through the date:

> “Sabotaged.” A minus, a dot, a plus, a blank line. The word did not exist in this tree until a security researcher named Andres Freund, chasing a half-second of extra latency in SSH logins, found the backdoor and went public on March 29. Everything before that date is written in the language of maintenance. The sabotage and the fix are the same one character, pointing opposite directions.

The first two sentences, and the last, are the chapter in miniature. The Freund clause is doing too much traffic in the middle of a photograph; move him and this becomes the paragraph you put on the jacket of the *book*, not just the chapter. Even as it stands, it is the only place the draft stops performing and lets an object sit.

Honorable mention, and the sentence that proves the ethical register is available to you:

> It is the nicest thing that can happen to a one-maintainer project: someone reliable showed up and stayed.

That is Lasse’s Tuesday. It has no sneer in it. Build the welcome out from there.

### Weakest paragraph

Paragraph one, entire.

> The last chapter had no villain. This one has nothing else. Everything you are about to read was done on purpose, by one person, patiently, over two and a half years, and `git` recorded all of it under a name that a project full of careful people had learned to trust. The instructive part is not that it happened. It is how ordinary each commit looks in isolation — how much the sabotage resembles maintenance — and how little of the actual weapon is in the repository at all.

It is jacket copy, table of contents, and last page. It spends the title’s pun (“one person”). It overclaims “a project full of careful people” (this project is Lasse). It uses “the instructive part is not X, it is Y” — the same template sentence as “The dig here isn’t the CVE.” It tells us the commits look like maintenance *so that we will never have the experience of watching them look like maintenance*. Cut it. Do not replace it with a softer version of the same argument.

Second-weakest, because it is the same paragraph in a different room: At home’s “First: / Second:” lesson list. The leftover is already the lesson. See Close.

### Sentences to rewrite

**1.** (open — contrast, villain, thesis, unique find)

> The last chapter had no villain. This one has nothing else.

Rewrite: delete. Enter on the object.

> In January 2022 a new contributor sends a patch. It is exactly the kind you want: defensive, small, unglamorous.

You already wrote the replacement. It is currently the start of act one. Promote it. Clone in one sentence after the first receipt — “I clone the compression library that ships in effectively every Linux distribution, maintained for years, essentially alone, by Lasse Collin” — and go to the room. Do not say purpose. Do not say two and a half years. Do not say sabotage. Let `AUTHORS` be the first time the reader understands the stakes are a person, not a patch. Let the empty log be the second. Let the period be the third.

**2.** (welcome — wrist-grab after the keeper)

> That is the point of the two and a half years — not the code, the *trust*. The backdoor could not have been committed by a stranger. It had to be committed by the co-maintainer, and the way you become the co-maintainer is to be genuinely helpful for a very long time.

Rewrite: period after “end.” If you need one more sentence in this room, make it Lasse’s, not the narrator’s verdict:

> By August the name is in `AUTHORS`. By 2023 the new name is doing more of the work. Nobody in the room is watching a heist. They are watching a burnout end.

Stop. The backdoor-could-not sentence is true and it is a closing thought, not a welcome thought. If it survives, it survives in At home, once, after we have seen why.

**3.** (Hans — trailer plus wink)

> In June 2023 a second name appears, and this one is worth watching because it does exactly one thing and then vanishes:

Rewrite:

> In June 2023 a second name appears.

Then the log. Then what the work is, as a legitimate optimization, without “exact hook.” Then he is gone. Then, if you must:

> Six months later that mechanism is used. The git history cannot tell you who Hans was. It can tell you a name that donated a loader and disappeared.

Do not write “I am not going to tell you.”

**4.** (empty log — docent)

> Now the famous part, and the first surprise is that you cannot `git show` it.

Rewrite:

> The payload that made CVE-2024-3094 travelled in a file called `build-to-host.m4`. If you go looking for it, you find nothing:

Then the empty command. Then “Empty. The file was never committed.” You already have this. You prefaced it with a drumroll.

**5.** (period — wind-up)

> The second surprise is a single character, and it is the most audacious thing in the whole affair because it is hiding in a commit whose message says it is a security *improvement*.

Rewrite: delete the sentence. Start on the room.

> February 2024. Jia adds a build check for Linux Landlock — a kernel sandbox that would confine the `xz` process, limiting what a compromised binary could do. Improving sandboxing is precisely what a responsible maintainer does.

Then the hunk. Do not say “Look at line two.” If the hunk is quoted honestly, line two is a `.` sitting on its own. Trust the reader for one beat. Then:

> A single `.` is a syntax error.

From there your chain is clean. Keep it. Keep “Someone sat in front of that file and added one character.” Give that line whitespace on both sides.

**6.** (exit — metaphor fighting the receipt)

> The final word is Lasse’s, returning to a house that turned out not to be his alone. His removal commit reverts the backdoor and reads like an inventory of grief:

Rewrite:

> The final word is Lasse’s.

Then the commit. Then, after “Backdoors are bad for security,” one sentence of what that dryness *is*, not what you wish it were:

> He lists the reverted commits. Then he edits `AUTHORS`: the second name comes out of the header and reappears lower down, labelled, dated, sealed off. The years 2022 to 2024 become a marked interval. The project is one person’s again.

The house metaphor can survive if you love it, as one clause, not as a thesis that then requires the quotation to perform grief it does not contain. I would let it go. Lasse’s sentences are better than yours here, and that is a compliment to him and a note to you.

**7.** (At home — sidebar voice)

> If you take one habit from this chapter, it is this: diff what you *ship* against what you *commit*.

and later:

> But two habits would have narrowed it, and they cost nothing. First: … Second: …

Rewrite: one habit, woven off the leftover. You have two objects (the tidy, the period) and you are turning them into a numbered list. Pick the sentence you already wrote and let both objects feed it:

> The two that matter most are a `.gitignore` tidy and a whitespace-shaped `.`. `git archive` a tag and diff it against what you publish; read the negative path of every improvement. The dangerous commit almost never says danger. Here it said hygiene, and then it said security. Blame, here, is not a question of who to punish. It is a question of which line to read twice.

That is still a little list-y. Better: close the story on the marked interval in `AUTHORS`, then one paragraph that walks from “Lasse cherry-picked the tidy because it was a tidy” to `git archive`, and lands on “which line to read twice.” Cut “If you take one habit.” Cut “First / Second.” Cut “You cannot grep your way to catching this” as a lecture; you have just *shown* they cannot.

### Other prose notes, shorter

- `[R1]` through `[R9]` on the reading surface: same note as 01 and 02. Quiet them. Paragraph ends, or the trailing list only. A reader must be able to see the moment without holding locators in their head.
- Headings: story objects, not posters. “The welcome” can stay (it is this story’s room). “A name that only adds one thing” announces; call the heading **Hans Jansen** and let the prose do the one-thing. “The weapon that is not here” → **`build-to-host.m4`** or **Update m4/.gitignore**. “The period” names the reveal before the hunk; **Linux Landlock** or **A security improvement** is the room. “The exit” is slightly template; **01:50** or **Simplify SECURITY.md** is the object. “At home” stays. It is the book’s convention.
- “the most audacious thing in the whole affair”: superlative, thriller. Cut.
- “The crime scene is the *tarball*”: TV-procedural. You can say the tarball. You do not need a crime scene.
- “Jia’s last commits are a tell you can only read backward”: cut “a tell.” Start at 1:50.
- “the account goes dark”: one noir shade past the fact. “Then the account stops” is enough.
- Italics as elbow: *trust*, *tarball*, *improvement*, *ship* / *commit*, *negative*. You have earned about two of those in a chapter. The rest are the narrator squeezing the reader’s arm.
- “a project full of careful people had learned to trust”: this project is one careful person. Say that. The later sentence already does: “maintained for years, essentially alone, by Lasse Collin.”
- Clone then `git -C repos/xz`: the implied working directory slips. Pick one convention and hold it, the way 01 does.

---

## 3. The ethical register

A sabotage chapter about living people, one of them a victim, one of them a git name whose body we do not have. This is the easiest chapter in the book to get cheap on, and you mostly do not. That is worth saying before the notes.

**What is right.** Lasse is never the punchline and never the fool. “The nicest thing that can happen to a one-maintainer project.” The cherry-pick-forward of the `.gitignore`, twice, after the breach: that is the opposite of sneering. It is “I might have done this,” aimed at the *victim*, which is a harder and more useful ethical move than aiming it at Jia. Jia is handled as a name in the log and a sequence of commits, not as a psychology and not as a nation. You do not unmask Hans. You do not write “evil genius.” You do not write “the Chinese.” The close — blame is not who to punish, it is which line to read twice — is the book’s ethics in one sentence, and it is aimed at the record. Keep that aim.

**What overclaims, and should be cut or aimed at the tree.**

> Everything you are about to read was done on purpose, by one person

“Everything” includes Hans, and two pages later you correctly say the git history cannot prove who Hans was. “One person” is also the thing we do not know. What the tree holds is one *name* that became co-maintainer, and a second name that donated a hook. Lasse’s own commit says “the maintainer who added the backdoor has disappeared.” That is as far as this book can go. “Done on purpose” is fair for the period, the `.gitignore`, the `SECURITY.md` trim, the tarball. It is the open’s “everything / one person” that overreaches, and it is the same overreach that spends the title.

> The uncomfortable lesson of xz is that none of the usual defenses were asleep. The code was reviewed. The maintainer was diligent.

The second sentence is true. The first and third are the lesson you want, and they are softer than the tree. The attack *is* the second pair of eyes. Once Jia is co-maintainer, “the code was reviewed” means the attacker reviewed the attacker. “Usual defenses” in a one-maintainer project that just got its first relief are not a second reviewer and a release-diff ritual; they are a tired person who finally has help. You can say that without sneering at Lasse. You cannot say the defenses were awake without making the chapter slightly false in the direction of consolation.

Rewrite the lesson off the objects:

> The commits that matter are indistinguishable, one at a time, from the commits you want. Lasse cherry-picked one of them forward after the breach, because it was a `.gitignore` tidy. The usual defenses read subjects. They do not read a lone `.` inside a feature test, and they do not diff the tarball against the tag.

That is harder, and it does not require “the code was reviewed” to do work it cannot do.

**Where the tone leans thriller, and should lean archive.**

Audacious, crime scene, tell, goes dark, inventory of grief, headstone, heist (the heist/burnout pair earns its one use; do not spend “heist” again). The register for a real victim is the register you already found for Kurt and for Gavin: Tuesday, inbox, the honest reading of the subject line. Jia’s Tuesday is not available to us — we cannot reconstruct what that name knew without inventing a mind — so the temptation is to write Jia from the outside as a patient villain. Resist by staying inside *Lasse’s* available Tuesday, and inside the hunks. The period does not need “most audacious.” It needs to be visible.

**Jia unknown.** You do not speculate, which is correct. You also write “Jia” as a person who sits in front of a file and who trims `SECURITY.md` at 1:50. That is acceptable as the name the tree uses; it becomes overclaim only when the open says “one person” as an identity conclusion. Prefer the name as a name. “Someone sat in front of that file” is already the better sentence, because *someone* is what we have.

**Lasse’s words versus your eulogy.** I said this above and I am saying it here because it is ethical, not just prose. “Backdoors are bad for security” is a man writing the flattest true sentence he has. Calling that grief puts a feeling on him he did not put on the page. He is a victim. He is also a maintainer closing a ticket. Let him be both. Do not write his interior.

**No sneering.** I do not hear sneering at Lasse. I hear a faint wink at the reader on Hans (“I am not going to tell you”), and a faint thriller-pleasure on “audacious” / “crime scene” / “tell.” Those are the places a sabotage chapter starts to enjoy itself. Cut them and the chapter will be colder, which is the respect.

---

## 4. Expansion

1,507 words. The floor is 2,200. You have ~700 words of honest headroom before anyone should mention the cap, and about 1,700 before you are padding. This is not chapter 03. Chapter 03 was a quoting boundary and eight commits; staying short *was* the craft. This is two and a half years, five acts, a library in every distribution, a victim who came back and labelled the years. Lean-and-right would mean the rooms were inhabited and the leftover was the last image. Right now the rooms are captions.

Add in four places. Not more. Do not add a history of xz. Do not add the Andres Freund detective story (you have the right one clause; do not grow it). Do not add nation-state speculation. Do not add an ifunc tutorial. Do not add a supply-chain sermon. Do not add a sixth act.

### A. Sit in Lasse’s January (welcome, after the NULL-check receipt, before `AUTHORS`)

Right now: patch, Lasse applies it, six months of CV, August, the name is in the file.

Add a short paragraph that is only what a one-maintainer inbox feels like when the patch is good. Defensive. Small. Unglamorous. The kind you want. He applies it — you have the receipt: committer is Lasse Collin. Ten days later, if the receipts already show the author/committer lag, that lag is a room (someone else’s patch, sitting, then taken). Stop before you say it was a heist. Then the six months can remain one sentence, but make it *his* six months: the patches keep being the kind you want. Then August, one line in `AUTHORS`, and isolate “someone reliable showed up and stayed.”

This is the non-negotiable from CONTEXT.md (“I might have done this”) and it is the only way the deleted contrast-hinge still happens — not as a sentence about chapter 02, as a feeling in the reader who just approved five Log4j deposits.

### B. Show the year the work flips, or stop asserting it

> By 2023 Jia is doing more of the work than Lasse.

That is the trust beat, and it is currently a narrator’s summary. If a yearly shortlog (or a count already sitting in the receipts file) can be put on the page, put it on the page — two rows, one year, the names swap. If it cannot be put on the page without minting a new command, do not invent the feeling of a table. Write only what a single receipt can stand next to. The book’s rule is never-false, including atmosphere.

Either way, this is where “they are watching a burnout end” earns its keep. Give that line the air the seeding line was supposed to get in chapter 01.

### C. Inhabit the Landlock Tuesday (the period, after the subject line, before the chain)

Right now: security improvement, hunk, “Look at line two,” mechanism.

Add four to eight sentences that are *only* what the check looks like to a person reading a CMake feature test. A sandbox you would want on a compressor that ends up next to SSH. Two build systems; the Autotools side is clean. The CMake side has a `.` where a blank line, or the next include, was supposed to be. Do not say sabotage yet. Do not say audacious. The reader who writes C should feel the compile fail a sentence before you say “syntax error.” Then your existing chain. Then isolate “Someone sat in front of that file and added one character.”

This is how the title stops being a caption and becomes a duration: one keystroke, one file, one build half.

### D. Spend the cherry-pick (empty-log act, after “tidying a `.gitignore`”)

You have: Lasse himself cherry-picked it forward, twice, because read in isolation it is exactly what it claims to be.

That is the ethical center of the chapter and it is a clause. Give it a short paragraph. Not of blame. Of reading. A `.gitignore` line named for a file the autotools machinery generates is *correct hygiene*. The subject says update. The diff is one name. After the breach, in a tree you no longer trust, you still cannot see it, so you take it with you. Twice. The habit At home wants — diff what you ship against what you commit — is born here, in a victim doing a reasonable thing. Fuse this paragraph toward At home the way `valgrind.patch` was supposed to fuse in chapter 01. Do not lecture between them.

### What not to add

- Freund’s half-second of SSH latency as a subplot. One clause is the right amount of world. This book is the tree.
- Jia’s full shortlog as a parade of seeming-innocent subjects. One or two, inside A, is texture. A tour is a recap.
- A primer on tarball-versus-git for people who have never shipped. The empty log *is* the primer. `git archive` belongs in At home as a command, not as a workshop.
- More of Lasse’s revert as inventory. Quote him. Do not annotate his feelings.
- Any sentence that begins “the last chapter” or “unlike Log4j.”

If the chapter comes out around 2,200–2,400, that is the floor used honestly. If someone waves the 3,200 cap, the answer is the same as 03’s answer in reverse: consecutive chapters should not all be the same length. A short Bitcoin chapter and a mid-length xz chapter, after two longer security digs, is the craft. Chasing the cap would mean a sixth exhibit, and a sixth exhibit would be folklore.

---

## 5. Open and close

### Cold open — not yet the strongest entry, and the contrast-hinge is why

TEMPLATE.md: drop the reader into one concrete moment. A diff hunk, a clock, a name, an absence. Not “This is the story of…”. Not “The last chapter…”.

What the current open does: names the relationship to the thesis chapter, names purpose, names the span, names the unique find (weapon not in the repo), then clones, then mentions every Linux distribution (blast radius, early), then starts the welcome.

Chapter 01 opened on a clock. Chapter 03 opened on a shortlog. Consecutive-open is not the problem — 03 is a name-in-a-table, and you are allowed a different object. Chapter 01’s review reserved the *absence* open for a later chapter. You have an absence (the empty log). I would still not open on it. The empty log is the middle shock, and it only shocks once the reader knows there should have been a file. Opening on nothing, then working backward, is a trick, and it would steal the act you already placed correctly.

**Open on the welcome’s object.** Same object you already wrote, promoted:

> In January 2022 a new contributor sends a patch. It is exactly the kind you want: defensive, small, unglamorous.

Then the `git log --author='jiat75' --reverse` receipt, one line, Lasse as committer. Then, in one sentence, who you are standing in: I clone xz, the compressor in effectively every Linux distribution, maintained for years, essentially alone, by Lasse Collin. Then the room.

Do not say villain. Do not say purpose. Do not say two and a half years. Do not say the last chapter. Do not say the weapon is missing. Let *ssleay_rand_add*’s equivalent here — the name in `AUTHORS`, then the empty log, then the period — arrive as turns.

This also does the contrast work the deleted hinge was trying to do. The reader coming off 02 and 03 is looking at another small, good patch. You have not told them to take their glasses off. That is the beat.

If you want a different object: the `AUTHORS` line alone (“and Jia Tan”), before we know why the second name matters. That is a name-open, and 03 already opened on names; I would not. The 01:50 clock is an exit object, not an entry. The period hunk as open pays the title in sentence one and turns the rest into confirmation. Don’t.

### At home — two habits at equal volume, after the leftover has already said them

The habits are right. Tarball is not tree. Read the negative path of an “improvement.” TEMPLATE.md wants them woven, not boxed, and “First / Second” plus “If you take one habit from this chapter” is a boxed sidebar that forgot the box.

What does not earn: restating “the malicious commits are indistinguishable from good ones” after five acts of that. What does not earn: “You cannot grep your way to catching this” as a prohibition; show the command that would have narrowed it and stop. What does not earn: a moral that restates paragraph one (“none of the usual defenses were asleep”).

Stronger close:

1. Last story image: `AUTHORS`, the second name sealed off, the years a marked interval. The project is one person’s again.
2. One woven paragraph, off the cherry-pick: the tidy that Lasse took with him is why you `git archive` a tag and diff it against what you ship. The Landlock subject is why you read the path that says *not available*. Two commands, not two lessons.
3. Last line, keep: “Blame, here, is not a question of who to punish. It is a question of which line to read twice.”

Cut “the uncomfortable lesson.” Cut “First / Second.” Cut any sentence that begins “the last chapter” or “unlike the deposits in Log4j.” If the hinge is still itching, this is the only legal place for a clause, and the clause names an object, not a chapter. I would still not. The reader has a memory. Use it.

---

## 6. Title

**Keep “One character” only if you stop spending the pun in paragraph one.**

It is the right title for the book. It is not folklore (not “The xz backdoor,” not the CVE). It is an object. It is a double: a glyph, and a name in the log. The double is the chapter. Paragraph one collapses it to villain-count — “by one person” — before we have seen a `.`. If that sentence dies, the title becomes honest again: we think person, we are shown a period, and the last line (“which line to read twice”) is how a character is also a character.

The body has to pay the title the way chapter 01 had to spend the nine minutes. Right now the period is an act, not a duration. Expansion C is how the title stops being a caption.

If you keep the “one person” open, change the title, because the pun is dead and the remaining meaning is “this chapter has a villain,” which is jacket copy.

Alternatives, in order, if you change it:

1. **It never enabled it** — Lasse’s words, the period, the minus-dot-plus photograph, no wink. Best if you decide the Landlock Tuesday is the event (the title currently thinks it is).
2. **Update m4/.gitignore** — the other photograph, the one Lasse cherry-picked, the unique archaeology. Best if you want the book’s brand (git shape, not sabotage folklore) on the chapter label.
3. **And Jia Tan** — the `AUTHORS` line, the welcome, the headstone-that-should-not-be-a-headstone. Tender toward Lasse. Drier about Jia. Risks reading as a true-crime nameplate.

I would not use “The period” as the chapter title (it is already a heading, and it is a spoiler of the glyph). I would not use “The welcome” (wrong center). I would not use “Sabotaged” (Lasse’s word, too late, too loud on a contents page). I would not use “Two and a half years” (span as title is 02’s mistake in a different coat).

Keep “One character.” Kill the sentence that spends it.

---

## Top 5 changes, by impact

1. **Delete the contrast-hinge and the rest of paragraph one.** “The last chapter had no villain. This one has nothing else” violates the no-announcing rule, points at the wrong neighbor, and spends the title. Enter on the January patch. Clone in one sentence. Walk into Lasse’s inbox. This is the change that turns a well-written recap of Jia Tan into a chapter with a turn — and it is the only way the welcome can still work on a reader who just lived chapter 02.

2. **Stop announcing the period. Isolate it.** Cut “the second surprise is a single character,” “Look at line two,” “most audacious,” and the heading that names the glyph before the hunk. Start on Landlock as a security improvement. Let the `.` sit. Then the chain. Whitespace around “Someone sat in front of that file and added one character.” The title depends on this.

3. **Inhabit two Tuesdays, not five captions.** Lasse applying the NULL-check and staying grateful (expansion A + the burnout line isolated). The Landlock feature test as something you would want (expansion C). Optional but high-value: the cherry-pick of the tidy (expansion D), which is the ethical center and the At home in embryo. Do not add acts. Do not add Freund. Do not chase 3,200.

4. **Correct the ethical overclaims.** “Everything / one person” vs Hans-cannot-be-proved. “The code was reviewed / defenses were asleep” vs a one-maintainer project whose second pair of eyes *was* the attack. Lasse’s revert is not an inventory of grief; “Backdoors are bad for security” is better than eulogy. Cut the Hans wink. Cut thriller diction (crime scene, tell, audacious, goes dark, headstone). Stay in the tree.

5. **Take the posters off the reading surface, and close on the leftover.** Headings named for this story’s objects (`Hans Jansen`, `Update m4/.gitignore`, `A security improvement`, `01:50`), not for the verdict on those objects. No `[R4]` in the line of sight. Fuse `AUTHORS` sealed-off → cherry-pick / `git archive` → “which line to read twice.” Cut “If you take one habit” and “First / Second.” Cut “I am not going to tell you who Hans was.”

---

## The single most important change

**Do not tell the reader this chapter has a villain, and do not tell them what the last chapter was for.**

Delete the hinge. Delete the jacket copy that follows it. Open on the patch Lasse applied.

Everything else — Hans vanishing, the empty log, the period, the 01:50 trim, the name coming out of `AUTHORS` — will land if the reader has first stood next to a tired maintainer looking at a NULL-check from someone who might stay, and felt the urge to write the second name into the file. That is the book. The CVE is the folklore. The contrast with chapter 02 is real, and it is the reader’s to have. Right now the folklore is in the doorway, the contrast is a stage direction, and the book is in the other room: a `.` on its own line, a tidy Lasse took with him, a minus, a dot, a plus, a blank line.
