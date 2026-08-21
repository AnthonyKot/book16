I'll read the chapter drafts and the voice/beats rules first, then give a craft review with concrete, ranked notes.I’ll compare this draft against Dual EC and a couple of strong published chapters so the notes match the book’s actual voice.I’ll check first-person usage, Dual EC’s Henson treatment, and a prior review so I don’t repeat notes or cross the ownership line.The chapter has the right objects in the right order and then spends every one of them a paragraph too early. The 39-second twin, the author-field swap, and the two-`if` fix are all real turns. The draft keeps telling the reader they are turns.

---

1. **GATE — Stop naming both reveals before they happen.**

The cold open burns the chapter. Both forms dump the Heartbleed Wikipedia card (missing check, two years, half a million servers, private keys), then announce the punchline, then show the evidence.

Reader, before any question is asked:

> The commit is famous. The trouble is that it never shipped.

Then it spoils the next section too:

> And the commit that *did* ship is sitting thirty-nine seconds away.

Full dig is closer — the `is-ancestor` command lands, then `NOT in the release` — and then the next sentence spends it:

> The commit everyone blames for Heartbleed is not in the software that had Heartbleed. It never shipped. […] the real one is thirty-nine seconds away.

Kill the census in the open (it belongs in **What it cost** / **Two years**). Kill “never shipped” until the command has said so. Kill “thirty-nine seconds away” entirely from the open. The twin section cannot earn a reveal the open already priced.

Full dig, extra wound: the first receipt prints `author=Dr. Stephen Henson  committer=Dr. Stephen Henson`. **Who wrote it** then has to pretend the second substitution is hiding in plain sight. It is not hiding. You printed it in paragraph two. Open that block on hash and timestamp only:

```
$ git -C repos/openssl show -s --format='%H %aI' 4817504d069b4c5082161b02a22116ad75f822b1
```

Save `%an` / `%cn` for **Who wrote it**.

Reader open, target shape:

> Everybody who knows the story of Heartbleed knows the commit. New Year's Eve, 2011, just before eleven: a heartbeat for TLS. I asked whether that commit is in the release that bled. It isn't.

Then stop. Go to **The twin**.

---

2. **GATE — Title announces the thesis. Change it.**

`The commit the internet blames` is the chapter's argument, printed above the first sentence. This book titles objects (`error: no signature found`, `Remove Dual EC DRBG again...`, `THIS IS A HACK TO GET V4 OUT THE DOOR`). This one titles a claim, and it is the on-the-nose version of the series title.

Use the command output that is the first turn: **NOT in the release**.

Runner-up, if you want the second turn on the cover: **Reviewed by: steve**. That one makes the chapter seem to be about the author field. It is not, primarily. Do not keep the current title.

---

3. **GATE — Lead The twin with the two clocks, not a branching tutorial.**

Both forms open the section by teaching git. Full:

> The reason takes one more command. OpenSSL, like most long-lived projects, does not develop on a single line.

Reader:

> Here's why. Big projects don't develop in a single line.

Then a 2009 merge-base whose subject is `Stop warnings.` Then, finally, 22:59:57 and 23:00:36. That is the turn. It is currently the fourth beat of its own section, and the open already named it.

Full: put the two-line `show` of `4817504d` / `bd6941cf` first. Let the times sit. Then, in as few sentences as will carry it, why two hashes exist (stable vs master; last shared commit March 2009). The 2009 command can stay as a one-line receipt; it cannot stay as the door.

Reader: same order. Two times, then the branch sentence. Cut “Here's why.”

After the timestamps, isolate the record as a beat. This is one of the two `~` lines the draft is missing:

> ~ 22:59:57 and 23:00:36.

Then one sentence: the internet points at the first; the second is the one in the release. Do not explain why the mix-up is “worth stopping on.” The times did that.

---

4. **GATE — Who wrote it earns the receipt and then delivers a sermon. Cut the sermon. Stop giving Henson an evening.**

The grep is the section. Eight lines, done:

```
author    = Dr. Stephen Henson <steve@openssl.org>
committer = Dr. Stephen Henson <steve@openssl.org>
Submitted by: Robin Seggelmann <seggelmann@fh-muenster.de>
Reviewed by: steve
```

Everything after `Reviewed by: steve` explains the point the reader already has. Full 87–96 and reader 48–55 are the same lecture: responsible, villain, headlines vs metadata, narrower/truer verdict, applied-not-authored. That is thesis-first, and it picks a winner in a blame contest, which is the ethic this book refuses.

It also drifts Henson from fields into a life:

| Line | Problem |
|---|---|
| Full: “on his holiday evening” | The timestamp is New Year's Eve. “Holiday evening” is a mood. |
| Full: “typed `Reviewed by: steve` and moved on” | “Moved on” is interior. Dual EC would not let you have it. |
| Reader: “on his night off” | Worse. That is a man with leisure. The field is a clock. |
| Both: “who is responsible for the most famous bug” | “Responsible” is the folklore. The fields answer *author* and *committer*. |

Keep: Seggelmann is the name in the story; he is a `Submitted by:` line; author and committer are Henson; `Reviewed by: steve` is his own handle; old OpenSSL applied contributors' patches under the maintainer's name. Stop.

Second `~`, after the grep (full) / after the quoted `Reviewed by: steve` (reader):

> ~ Reviewed by: steve.

Then two sentences, max. Suggested close of the section:

> That was the old OpenSSL way: a maintainer applied a contributor's patch under his own name and recorded the source in the message. The name the newspapers used is a sentence in the body. The name in the author field is the person who applied it.

Do not write “neither is a villain.” If you have to say it, you already sneered. Do not write “the truer verdict.” Git is not a court. Do not write “this was applied, not authored, by the person who signed for it” — the author field says the opposite; the interesting fact is that the field and the body disagree, not that you overruled the field.

“The same hand” on the fix (full 143, reader 71) is legal: it is `%an` on another commit. Once is enough. Do not braid it into a character arc. Dual EC already owns his fade.

---

5. **GATE — There is no narrator.**

CONTEXT's diagnosis was exhibits without a narrator. Chapter 18, same repository, same week of OpenSSL, opens `I run git tag -v about as often as I run git blame`. Dual EC uses `I` to refuse motive. This chapter has zero first person in the full dig; the reader cut's only “me” is the heartbeat talking.

This is an essay about Heartbleed. It needs to be a dig. Two placements, not a sprinkling:

- Open: the engineer asking `merge-base --is-ancestor` of a famous hash. That *is* the cold open. Match 18's “here is the moment that taught me to run it.”
- One refusal, Dual EC-shaped, if you need it near the fields: the record does not say who “wrote” the bug. It says who is in `%an`. I will not pretend those are the same question.

Do not put `I` inside New Year's Eve. Do not imagine the reviewer. The narrator is the person at the prompt, tonight.

---

6. **GATE — At home is a synopsis of the chapter you just read.**

Both forms recap the ancestor test, recap the twins, recap the fields, then recap the entire night in one sentence, then land the only line that was worth writing:

> The story you inherited is a place to start looking. It is not the receipt.

That last couplet earns its keep. Everything above it is the chapter again, in a tired voice:

> The habit this chapter wants is aimed at the moment you go looking for where something came from.

Kill that construction. Postgres/Dual EC reader: “If you take one habit from this, take this one.” Use that.

Starve it to the transferable habit, which is not the command chapter 18 already named in passing. It is: a famous origin commit is folklore until it is an ancestor of the thing that broke; `%an` is not the newspaper. Keep the twins list (branches / rebase / cherry-pick) — that is the thing a tired reader can take to their own repo. Cut the New Year's Eve recap sentence. End on the couplet you already have.

Reader At home is 170 words of recap after a 1,238-word chapter. It is the paragraph pulling the least weight in that form.

---

7. **GATE — These sentences explain the point before, or instead of, letting the record land it. Rewrite or cut.**

**Full 64–67 / reader 31–35** (after the times, currently):

> They are, for every purpose that matters to the reader of the code, identical — which is exactly why the mix-up is harmless folklore and also exactly why it is worth stopping on.

This sentence cannot decide whether the mix-up matters. It also announces why we stopped. The distinction, if you need one sentence:

> For anyone reading the code, they are the same missing line. For anyone reading the history, only one of them is in the release. Only that one is evidence.

**Full 17 / the carnival bark:**

> Now watch it fall apart.

Cut. Ask the ancestor question.

**Full 71 / reader 39:**

> Look again at those lines, because there is a second substitution hiding in plain sight

Announces the turn. Look at the fields. Do not preview a substitution.

**Reader 59:**

> The bug itself is almost nothing, which is the point.

Cut “which is the point.” Start at “A heartbeat message says…”

**Full 87–90 / reader 48–51**, the “who is responsible… reviewer, twice/three times over” sentence. Cut. The grep already counted.

**Full 126:**

> The bug is not a wrong line. It is an absent one.

This one is allowed — it sits *after* the code. Keep it. It is the only thesis-shaped line that has earned its place.

**Full 121:** “A few lines further down (not shown, but in the same function)” — parenthetical apology. Either name the copy in one clean clause or stop pointing at the wings. Rewrite:

> `n2s(p, payload)` reads a two-byte number off the wire and calls it the length. `pl = p` points at the sender's data. Then the function copies `payload` bytes from there back to the sender.

---

8. **GATE — Heading `The missing check` prints the section's punchline. Rename it.**

Book headings are labels for objects, not captions of the turn (`01:10`, `payload` would fit; `The constitution` does not say what the constitution did). `The missing check` is the verdict. Call the section **payload** (the number they trusted) or **n2s**. Reader can take **payload**.

`Who wrote it` is a question, which is a mild spoiler that authorship is in doubt. Optional rename: **The fields** or **Submitted by**. `The twin` is fine. `Two years` is fine. `What it cost` is fine.

---

9. **Prose — hardest-working and weakest paragraphs, plus the sentences that are too long.**

**Full, doing the most work:** 166–169, the two `if`s and “The knowledge was never missing; only the line was.” That is the chapter's unique object. Protect it. Do not explain it again in At home.

**Full, pulling least:** 32–38, the branching tutorial that delays the clocks. After the open is starved, this paragraph is the new drag.

**Reader, doing the most work:** 59–69, the heartbeat as a conversation. This is why the reader cut exists. It is clean. Keep the ask-forever / nothing-in-the-logs beat here; do not also put it in **Two years**.

**Reader, pulling least:** 93–106, At home (see 6). Runner-up: 48–55, the villain paragraph.

**Clunk, full 190–201** (At home's 80-word night recap). Replace the whole paragraph with the starved habit in 6.

**Clunk, reader 49–55**, same sermon. Replace as in 4.

**Clunk, full 62–63**, after you add the `~`:

Current:

> 22:59:57 and 23:00:36. One man, the same New Year's Eve, applying the same patch to two branches in the space of a held breath.

After the `~`, you need almost nothing. If a sentence remains:

> Same patch, two branches, one New Year's Eve.

Not “one man… held breath.” That is a character with lungs.

**“a spoonful at a time”** (full) is better than **“a little at a time”** (reader). If the census moves to blast radius, take the spoonful with it.

**“small, well-meant feature”** (full 7): “well-meant” is motive. Cut it with the rest of the open's dump.

Align the count: reader says “three times over,” full says “twice over” then lists three acts. After you cut the sentence, the contradiction dies with it.

---

10. **OPTIONAL — Full dig: glue the fix to the bug; stop explaining the attack twice.**

The reader already does this better. Full shows the shipped `n2s` / `pl = p`, then leaves the code to run a version-tag loop under **Two years**, then returns for the two `if`s. The RFC cite is the quietest best fact in the chapter and it currently sits in a section named after a duration.

Attach `96db9023` and the two `if`s to **payload** (bug, then the line that was missing). Leave **Two years** as 1.0.1 → 1.0.1f, twenty-seven months, “the line simply looked complete.” **What it cost** is the census, the keys, the silent logs.

Right now **What it cost** 173–181 re-explains the heartbeat attack the previous code section just walked through, then adds the half million. Cut the mechanism reprise. You already wrote it. SDE-reader rule: impact at the end, once.

The 1.0.1f / 1.0.1g loop is a good small receipt. Keep it. Do not build more release-day timing around 1.0.1g — that is chapter 18's surface. The date on the fix (April 6th) can stay as a date. Do not sit in that night.

---

11. **OPTIONAL — Sit in RFC 6520 section 4, not in anyone's head. Do not pad to the cap.**

Full is 2,065 against 3,200; reader is 1,238 against 2,000. After the gates you will be shorter. Do not fill the hole with more git tutorial or more Henson. One expansion earns its words:

The spec already required the check. The fix's own comment cites `RFC 6520 sec. 4`. That is the room — a document, not a mood. Two sentences, after the two `if`s, both forms. Reader currently: “One of them even cited the paragraph of the specification…” Soft. Quote the fragment that is already on the screen: `silently discard per RFC 6520 sec. 4`. Then: the knowledge was in the spec the patch claimed to implement. Only the line was missing.

That is also a legal `~` if you refuse `Reviewed by: steve` and only take one beat. Prefer the clocks (item 3) plus `Reviewed by: steve` (item 4). Do not add a third.

What a tired reader will skip, already: the 2009 `Stop warnings.` block (keep the fact, the command is a souvenir); the identical/harmless paragraph; the villain disclaimer; At home's night recap; the open's CVE card.

Do not add: unsigned tags, tag-object mechanics, 00:51 as a scene, why Henson left, whether Seggelmann meant it, a diagram of master vs stable. Chapter 18 and Dual EC already spent those.

---

12. **OPTIONAL — First code block is doing two jobs; the rest of the console is fine.**

Seven blocks in the full dig is the right density for this book. Two problems only:

- Block 1 must lose `author=` / `committer=` (item 1).
- The heartbeat snippet ending at `pl = p` is the correct sed. Do not reach for a memcpy that is not in the receipts. The narration of the copy is already VERIFIED. Keep it in prose.

The two-`if` block is the centerpiece. Do not trim it. Do not add a `diff` fence around grep-shaped output — you didn't; stay that way.

Reader cut has no code, correctly. After you stop spoiling the open, it needs one physical object the way 18's reader puts `error: no signature found` in a box. Give it the two times, isolated, or `Reviewed by: steve`, isolated. Right now the reader cut is all gloss.

---

**Do not touch.** The ancestor test as the first command. The two hashes 39 seconds apart. Seggelmann only as a `Submitted by:` line. The `n2s` / `pl = p` snippet. The two `if`s and the RFC cite. “The knowledge was never missing; only the line was.” “The line simply looked complete… there is nothing on the screen to notice.” The closing couplet of At home. Every `<!-- VERIFIED -->` comment, exactly where it is.

**Single most important change:** starve the open until the famous commit is an object, not a summary of the chapter, and do not say “thirty-nine seconds” until the two clocks are on the page. Every later section is currently explaining a turn the first page already sold.
