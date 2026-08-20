# Craft review: “Fix typo”

## Verdict

This earns its place after xz and npm, but only if the revision makes the incident's distinctive object unmistakable: not a malicious maintainer, not a poisoned registry, but an `Author` field that can be worn by anyone, followed by a revert that removes code while preserving history. The new material is strong:

- xz is about trust patiently earned by a contributor whose identity becomes authority.
- npm is about authority changing hands, and about the registry and repository keeping different ledgers.
- PHP is about identity as editable metadata. The attacker does not inherit Rasmus's reputation; the attacker types it. Then, after Nikita revokes access and reverts the payload, Nikita's own name brings the identical tree back. At that point the name field ceases to be evidence at all.
- The second original idea is that cleanup can preserve the object it cleans. Both bad commits remain ancestors of every later checkout because a revert is an addition to history, not an erasure of it.

Those are not minor variations on sabotage. They change how the reader reads a repository. The trouble is that the draft currently states both ideas before it lets the receipts disclose them. “Rasmus Lerdorf did not write it” precedes the signature and clock evidence; “a revert in git is not a deletion” precedes the ancestry test. The reader is repeatedly given the answer and then shown the experiment. Reverse that relation in both places.

The chapter also needs a human room. At 1,634 words, it is not merely short; it is missing the interval in which a reasonable maintainer thinks the emergency has been contained. The right room is Nikita's Sunday, not an invented interior for an anonymous attacker. Git cannot tell us what woke him, what screen he saw, or what he said, so do not supply coffee, alerts, or dialogue. It can tell us what confronted him and what he did next: a commit claiming to be from PHP's founder, eleven unmistakable lines, a revoked account, a revert—and, hours later, his own name on the restoration of the same tree. That is enough for a scene.

## Structure and pacing

The overall order is sound: ordinary commit, malicious hunk, identity tests, revert war, content search, surviving ancestry, infrastructure change. Keep that spine. The revision should change where the conclusions land.

The cold open gives away one turn well and one turn too early. The commit header is exactly the right object: founder's name, tiny maintenance subject, `[skip-ci]`, anomalous sign-off and time zone all sitting in view before the reader knows which details matter. The next sentence, however, declares it “the most ordinary object it is possible to find” as if the narrator believes the metadata. Qualify the point of view: *If you stop at the header, this is the most ordinary object in the repository.* That lets ordinariness be the commit's claim rather than the narrator's mistake.

The malicious hunk should still come immediately. It flips *Fix typo* fast, and that speed is useful. But the explanatory paragraph tries to make every consequence land at once: doubled T, `+8`, `zend_eval_string`, RCE, PHP's reach, founder's name, subject, CI tag, and the Zerodium taunt. Stage it in three movements:

1. The doubled T creates a private header name that normal requests will not send.
2. `zerodium` acts as the eight-character gate; `+8` skips it.
3. `zend_eval_string` executes whatever follows.

Then stop. A non-C reader will understand the mechanism, and a security-literate reader will not be detained by a primer. The draft's excellent hinge is “the doubled T is not the typo.” Preserve it. The explainer does not need more technical detail; it needs white space and fewer simultaneous claims.

After that, do not write:

> Rasmus Lerdorf did not write it. And here is the thing this chapter exists for: I do not need the news to tell me that.

That is the verdict before the case, and “the thing this chapter exists for” is scaffolding. Go straight to the anomalous `Signed-off-by` search. Let the result—one occurrence in twenty-two years—make the reader uneasy. Then show the clock. Only after `+0200` sits among `-04:00` and `-07:00` should the narration say that the claimed identity does not survive comparison with the person's own history. The reader will have arrived there one sentence earlier.

The revert war is the chapter's dramatic center and is currently compressed into reportorial summary. Expand the space after Nikita's first revert. His message says access “has already been revoked”; for a moment, that sounds like an outcome. Let it. The first revert has removed the code and the account has been dealt with. Then drop the second commit header without announcing “the attacker comes back.” The reader should first see:

> Nikita Popov &lt;nikita.ppv@gmail.com&gt; Revert "Revert "[skip-ci] Fix typo""

Give the name a beat. Then compare the tree hashes. The identity twist and the identical-tree proof belong together: the attacker is not merely persistent but able to make the restoration appear to come from the person who stopped it. This is the point at which the security incident becomes an epistemic failure inside the log. A name has become only a string.

The chronology afterward is good and wonderfully compact:

> Four commits, one Sunday: plant, revert, replant, revert.

Keep that line. The `-S zerodium` search then gives the narrator's daily engineering practice a job: subjects produce a tower of quotation marks and “typo”; content history produces the incident. This is more valuable than the present explanation “the attacker chose precisely because it says nothing,” which presumes motive. The contrast in the two searches is sufficient.

The ancestry reveal is the other place where the draft spends its surprise before showing it:

> But a revert in git is not a deletion — it is a *new* commit that undoes an old one, and both stay in the graph forever. So the malicious commits were never removed.

Move the `merge-base --is-ancestor` transcript ahead of that explanation. Frame it as the narrator checking a claim that ought to fail: the payload was reverted twice, the server changed, five years passed—so are the two bad commits ancestors of today's checkout? Let the two `ANCESTOR of HEAD` lines answer. Then explain tree state versus graph ancestry in two plain sentences. This is the chapter's best “I thought I knew git” turn; at present it reads as a lesson followed by a demonstration.

The final movement should be: ancestry surprise, a brief at-home turn, README removal, last line about changing the locks. The current explicit `## At home` section comes after the intended ending and therefore makes the chapter end twice.

## Where the missing room goes

Add roughly 650–850 words, while cutting 100–200 words of repeated verdict and maxim. The useful new space is not more backdoor history.

First, give 250–350 words to the interval around Nikita's first revert. Stay rigorously inside the visible record: five hours have elapsed; the supposed typo contains executable request data; the account is revoked; the revert is made. The “moment before the outcome” is the reasonable belief that revoking access plus reverting the change has contained an account compromise.

Second, give 200–300 words to the return under Nikita's name. Let the commit header arrive before interpretation, and let the identical tree hash settle the question of what code returned. This is the chapter's unique room: a maintainer's own identity has become part of the attack surface while he is responding to the incident.

Third, give 150–200 words to the narrator's present-tense ancestry check. Distinguish clearly between the current tree, where the payload is absent, and the graph, where the commits remain reachable. That distinction deserves room because it is the durable conceptual surprise, not an appendix fact.

Finally, give the README edit another 100 words of close reading. The deletions do more than update a link: “home,” “mirror,” and the path by which contributions enter the project are being reassigned. Keep this grounded in the removed language rather than adding a general history of forge security.

Do not add a Zerodium sidebar, a general PHP history, an RCE explainer beyond the existing three operations, or a survey of supply-chain attacks. All would make this feel more like the third sabotage chapter the draft needs to avoid becoming.

## Prose and tone

The narrator is strongest when acting like an engineer: comparing histories, searching changed contents, checking tree equality, asking ancestry questions. The narrator is weakest when acting like a prosecutor delivering universal rules. The most tonally risky cluster is:

> The repository convicts the impersonation by itself, and it does it several times over.

> the tell is always the one thing the forger does that the original never did.

> by someone whose own machine clock gave them away.

> The impersonator's mistake is never the code; the code they got right. It is the paperwork

“Convicts,” “always,” “gave them away,” and “never” create a victory-lap rhythm. They also make circumstantial metadata sound magical. The chapter will be more authoritative if it shows accumulating mismatches and respects what each proves. A sign-off habit and a time zone make the attribution fail its own historical pattern; the revert record supplies the incident's contemporaneous judgment. The pleasure should be in the method, not in beating the culprit.

Likewise, “simply put on a second mask” is too jaunty for the escalation. Nothing is simple at the moment a revoked identity returns under the responder's name. Prefer physical exactness: *The same tree returned under Nikita's name.* That is colder and more disturbing.

The first person needs redistribution, not enlargement. At present it arrives in boast-shaped declarations—“I do not need the news” and “something I have never seen anywhere else in this book.” Let the “I” instead narrate choices: why inspect the trailer, why compare a person's time zones, why search the diff rather than the subject, why ask the ancestry question after the code is gone. That restores the book's daily-blame narrator without making the chapter about the narrator's cleverness.

### Clunkiest sentence

> This is a remote-code-execution backdoor into the language that ran most of the web, committed to its main development branch under the name of its founder, wearing a subject line that says *typo* and a tag that says *don't test this*.

It carries mechanism, scale, branch, false identity, title irony, CI behavior, and a costume metaphor in one breath. “A tag that says *don't test this*” also gives the attacker a voice the literal tag does not contain.

Rewrite:

> Those eleven lines are a remote-code-execution backdoor. They entered PHP's main development branch under its founder's name, beneath *Fix typo* and `[skip-ci]`.

The short first sentence lets the fact land; the second returns us to the metadata, the chapter's actual subject.

### Hardest-working paragraph

The paragraph beginning:

> The same afternoon, a commit reverting Nikita's revert — reinstating the backdoor — authored, this time, as *Nikita himself*...

does the most essential work. It turns an account compromise into impersonation, makes the responder's identity the attacker's second costume, and sets up the exact-tree receipt. Protect the information and give it more space. Right now the paragraph is hardest-working partly because the chapter makes it do too much too quickly.

The sentence “Four commits, one Sunday: plant, revert, replant, revert” is the best compression in the draft. It should close the expanded Sunday scene, not substitute for it.

### Weakest paragraph

The final `At home` paragraph is the weakest:

> The habit from this dig is to stop trusting the `Author` field, because it is a string anyone can type, and start reading the metadata *around* it...

It becomes a worksheet, repeats nearly every finding, makes broad promises—“a supply-chain question you will face”—and returns to the triumphant “forger's mistake” formulation. It also displaces the much better ending about `git.php.net`. Reduce it to two linked checks: when identity matters, compare the commit's habits with that person's history; when cleanup matters, ask whether the bad commit remains an ancestor. Then move those checks before the README close.

Other line notes:

- “The string `sold to zerodium, mid 2017` is the author signing the work with a taunt” is a little pleased with the villain's flourish. “The payload also leaves a taunt in its diagnostic string” is sufficient.
- “The metadata is a costume, and the costume does not fit” is neat but close to the book's existing corporate-costume language. This chapter has a more exact vocabulary available: habit, clock, field, claim.
- “present, permanently, a reachable object” is the right precision. Keep “Not active” prominent so permanence cannot be misread as continuing vulnerability.
- “a fossil you can hold” is vivid, but it repeats the ancestry section after the close has already moved to the locks. If the README is the ending, the fossil belongs earlier.

## The `~` beat

Keep one beat, move it, and revise it. The current line is conceptually central:

> ~ A revert does not remove the crime. It records it, and files it under the graph, forever.

But it arrives after the paragraph has already explained the whole idea, so it is an echo. “Crime” contributes to the prosecutorial register, and “files it under the graph” strains the filing metaphor.

Place the beat immediately after the two `ANCESTOR of HEAD` results, before the explanation. Something as spare as this would work:

> ~ A revert removes the change from the tree. It does not remove the changing of it from history.

No second `~` beat is needed. The temptation would be to give impersonation its own maxim, but the Nikita-name reveal is stronger as a cold fact than as an aphorism. Two displayed morals would make the chapter advertise its two theses instead of letting them rhyme.

## Open, title, and close

The opening object is excellent. It differs from chapter 11's fork-war opening and puts every later clue on the first screen. Preserve the complete header, especially the anomalous `Signed-off-by` and `+0200`; the reader can look back and realize the evidence was exposed from line one.

The title works. *Fix typo* flips when “User-Agentt” turns out not to be an error, and it acquires a second life in the quotation-mark tower of the revert war. By the fourth commit, the supposedly trivial subject has become the incident's entire visible vocabulary. That is a better payoff than merely revealing a malicious diff. Do not rename it, and do not force a final sentence that explains the title.

The close is already present, but it is not currently the close. This is the right destination:

> The most important commit after a break-in is rarely the fix. It is the one that changes the locks.

Put the at-home habit before the README receipt and end on the removal of `git.php.net`. Also remove the mixed metaphor in “The revert closed the wound; this README edit closed the door.” A cleaner approach would be: *The reverts removed the payload. The README edit changed where the keys worked.* Then the existing locks sentence can finish the chapter.

The `GitHub`-as-newest-committer detail is less powerful than the README edit and risks turning a precise next-day action into a claim about the entire later platform. It can stay as a brief coda within the paragraph, but it should not stand between the README deletion and the locks line. The visible change in canonical home is enough.

## At home

Delete the `## At home` heading. The template explicitly asks for the habit to be woven into the close, and the separate section currently feels like a lab exercise after the story has ended.

Use one compact paragraph after the ancestry explanation and before “What PHP did remove was the door.” It can pair the two habits without replaying every command:

- Treat `Author` as a claim and compare the surrounding habits—trailer, email, time zone—with the claimed author's history.
- Treat “reverted” as a tree-state claim and use `merge-base --is-ancestor` when you need to know whether the bad object still travels with the repository.

That pairing is coherent: verify who the history says acted; verify what the history says disappeared. Then return to PHP and let the project perform the larger answer by changing the canonical source home.

## Top five changes by impact

1. **Build the Sunday-morning containment scene and let Nikita's own name break it.** Expand the first revert, pause on “access has already been revoked,” then reveal the identical tree returning under Nikita. This is what makes the chapter about impersonation rather than another planted payload.

2. **Stop announcing both reveals before their receipts.** Move “Rasmus did not write it” after the sign-off and clock comparison; move the explanation of revert permanence after the two ancestry results. The reader should reach each conclusion a beat before the narrator names it.

3. **Move the at-home habit before the README and end, literally, on changed locks.** Delete the `## At home` heading, compress its commands into identity-check and ancestry-check, and let the `git.php.net` deletion supply the final action and image.

4. **Cool the courtroom register.** Cut or soften “convicts,” “always,” “gave them away,” “simply put on a second mask,” and “the forger's mistake is never the code.” Replace triumph with comparison, sequence, and exact outputs.

5. **Break the C explainer into three short operations.** Keep `User-Agentt`, `+8`, and `zend_eval_string`; remove the pileup of scale, irony, and costume language around them. This will make the mechanism easier for newcomers and faster for security readers.

## The single most important change

Recenter the chapter on the interval between Nikita's two apparent acts: first his real revert says access is revoked, then his name restores the identical malicious tree. Give that reversal a room, a pause, and the later verdict. It is the moment that makes “Fix typo” indispensable to *Blame*: the reader watches authorship stop being identity.
