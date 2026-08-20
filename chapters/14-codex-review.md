# Editorial review — Chapter 14, “Remove Dual EC DRBG again...”

The artifact is excellent: six subjects make a miniature institutional drama, `not accepted for
2.0.7` / `now accepted for 2.0.8 onwards` is genuinely strange language to find in a source-code
history, and Henson’s disappearance gives the chapter a quiet last image. The draft is not ready,
though, because its central interpretation is repeatedly stated as something the git proves. The
existing hedge is accurate but ineffective: the sentences on both sides of it fill the evidentiary
hole it has just acknowledged.

The title should stay. The crypto primer is already short and legible. The revision needs to spend
its new room on the acceptance mystery, the exact state of the code, and Henson’s documented work—not
on more Dual EC mathematics or imagined bureaucracy.

## 1. Rebuild the causal spine around what “accepted” proves—and no more

This is the gate issue. The log proves a narrower, cleaner, and in some ways more unsettling story:
Henson disabled Dual EC, removed it from the FIPS module, reverted that removal because it “was not
accepted for 2.0.7,” then removed it again when removal was “now accepted for 2.0.8 onwards.” The log
names an acceptance decision and two versions. It does **not** name the accepting party, a lab, a
certification requirement, the grounds for non-acceptance, or Henson’s private wishes. General facts
about FIPS validation make certification relevant context; they do not identify the cause of this
particular non-acceptance.

The draft’s good sentence—“Whether the non-acceptance was substantive, procedural, or a matter of
timing, the git does not say”—is immediately canceled by “What it records, unmistakably, is the
direction of authority: the deletion needed approval, the approval had not come, and so the code
followed the certificate rather than the maintainer.” That second sentence claims precisely the
causal chain the first says is absent.

Every causal leak that needs recasting:

- “As though removing a piece of code from your own project were something you had to get permission
  for. **In this one case, it was**.” “Not accepted” does not establish permission, who possessed it,
  or why acceptance failed.

- “a three-year argument between **what he wanted to delete and what he was allowed to**.” The
  sequence shows what Henson did, not what he wanted or what an authority allowed. The later claim
  that he had “already decided [the lines] should not exist” makes the same unsupported move.

- Dual EC arrives “**because it was in the government standard, and OpenSSL implements the
  standard**.” The subject connects the implementation to SP800-90, but the motive and the broad
  statement of project policy are not established by this log.

- “**days after the backdoor stories broke**” and “in the months after the world learned what it
  probably was” create a plausible causal reading of the disable and removal. The chronology may be
  externally true, but git alone does not say “because of.” Keep the dates; mark the connection as
  context or inference.

- “**Not because he changed his mind about the algorithm**” claims access to Henson’s mind. The body
  supplies a stated reason for the revert; it cannot exclude other reasons.

- “the deletion **needed approval**, the approval **had not come**, and so the code **followed the
  certificate rather than the maintainer**” turns an unnamed non-acceptance into a proven
  certification veto.

- “A validated artifact cannot be repaired, only re-approved—which means, for a while, **the
  certificate outranks the fix**.” This is a strong chapter thesis, but not a conclusion R5 can bear.
  It also calls the removal a “fix,” although the reader has only been shown that the generator was
  already disabled by default.

- “**the process caught up**,” “un-deleted it **under a compliance process**,” and “once **the
  paperwork allowed**” each supplies the missing mechanism. “Paperwork” also introduces a faint
  sneer where the exact institutional uncertainty is more interesting.

- “the **forced revert**”; “the git records both **what he wanted and what he was overruled by**”; and
  “an outside process reached into the code and **overrode** the people who write it” all promote the
  interpretation to fact.

- “The argument between **security and compliance** ran through” Henson’s history and the at-home
  summary “is an **entire institutional fight**” both name a conflict the sequence suggests but does
  not, by itself, prove. Keep them as the narrator’s hypothesis or use the narrower “acceptance”
  language.

- “Those reverts ... record a decision **the author disagreed with** and made anyway” is too broad
  even as an at-home rule. A revert can record a constraint without recording disagreement.

- “do not read the vanishing as unrelated,” “one **exhausted** maintainer,” and “Someone carried that
  argument alone” imply that this fight caused Henson’s departure. The log proves cessation, not
  exhaustion, solitude, or cause.

The durable formulation is already latent in the evidence: *the source history records an
acceptance boundary, but not the institution or reason behind it*. A first-person narrator can make
that limitation gripping: “I know who typed the revert. I know which removal was not accepted. The
commit does not tell me who did the accepting.” That is opinionated archaeology without false
omniscience. If later external evidence can establish that this specific decision came from FIPS
validation, it can support a stronger claim; within the record presented here, “a certificate
outranked the fix” must remain an explicitly labeled inference, not the reveal.

## 2. Let the title acquire its ellipsis instead of explaining it on page one

“Remove Dual EC DRBG again...” is a very good title. It contains repetition, mood, and a missing
event. But it does not currently flip, because the opening tells us at once that the ellipsis is “the
tired trailing dots,” that Henson “had it undone,” and that removal required “permission.” The reader
is instructed what to feel before seeing the sequence.

Keep the raw subject and body as the cold open, with little or no gloss. Then show the six-line log.
The reader will reach `Revert "Remove Dual EC DRBG"` one beat before the prose says why that is odd.
After the minimal Dual EC setup and the disable/remove receipts, reveal R5 in full. The hinge can be
the one word the narrator cannot get past: *accepted*. Only then return to the opening subject. At
that point `again...` has changed from mildly weary punctuation into the visible scar of remove /
restore / remove.

The emotional reading should remain a reading: “I hear weariness in those dots” is fair first-person
interpretation; “It is the sound of a maintainer ... once the paperwork allowed” asserts both an
emotion and a mechanism. The former gives this book its narrator. The latter invents a room the
repository does not show.

## 3. Make the distinction from xz and PHP exact: restored source is not a demonstrated live backdoor

The chapter earns its place beside the two backdoor chapters only if the new pressure is unmistakable.
It is not another story about how a backdoor entered or survived review. It is a story about a
security-sensitive deletion crossing an acceptance/version boundary and being reversed. That is a
fresh kind of repository evidence.

But “a compliance checkbox beats a security fix” is stronger than the receipts. Worse, it can make a
reader believe the revert re-enabled a working backdoor. The draft itself establishes the opposite
operational baseline before deletion: Dual EC “refuses to start ... unless you compile with”
`OPENSSL_ALLOW_DUAL_EC_DRBG`. From the material shown, the safely described reversal is the return of
2,265 lines of suspect implementation, not proof that the suspect generator became active, exposed
users, or was required by a lab.

State that distinction at the revert. It does not weaken the chapter; it identifies the actual
absurdity without borrowing a blast radius. The concrete cost currently supported is that a
disabled-by-default implementation was removed, restored five months later, and removed again about
two months after that, all by the same maintainer. Do not inflate those restored lines into a period
of demonstrated compromise. The “blast radius” here may be duplicated maintenance, delayed deletion,
and a security-sensitive source tree made to follow an unexplained versioned acceptance decision.
Anything stronger needs evidence outside this log and must be labeled accordingly.

## 4. Separate the three external layers; add room around the process, not more math

The crypto explanation is accessible and brief enough for an expert. “If someone can predict your
generator’s output, they can predict your keys” does the necessary work. The likely general-reader
confusion is institutional, not mathematical: the draft moves quickly among Dual EC the algorithm,
SP800-90 the standard, and FIPS validation of a module as if they were one government mechanism.
Give each one a clean noun and keep them distinct.

The CHECK audit:

- The marker after “standardized by the US government’s standards body in the mid-2000s” is genuinely
  external. The commit subject says SP800-90; the standardization history and date are not proved by
  the displayed git.

- The marker covering the suspected NSA backdoor and NIST withdrawal is genuinely external and
  commendably says “not provable from this repo.” The prose initially preserves that boundary with
  “You do not need to trust any of that to feel the story in the git.” However, “days after the
  backdoor stories broke” and “after the world learned” repeat that external chronology later; they
  should remain visibly contextual rather than become a git-proven motive.

- The FIPS-program marker is genuinely external. The trouble is what follows it: “a specific, frozen
  artifact,” “changing it ... produces a version that is no longer the thing that was approved,” and
  therefore this removal “needed accepting.” Those may be useful general explanation, but the prose
  fuses them to R5 as the proven explanation of *this* non-acceptance. Keep the general rule external,
  then reopen the evidentiary gap before interpreting the commit.

Two other sentences need the same discipline. “He ... told you exactly how much he trusted it” reads
an implementation-status warning—“untested, probably not working, incomplete”—as Henson’s judgment
of the DRBG family. Say what the commit actually reveals: the condition of the early implementation.
And “OpenSSL would not carry a validated module again for years” reaches beyond R8 as summarized,
which only establishes removal of the FIPS apparatus from master at that commit; either mark the
longer historical claim as external or narrow it to the shown event.

## 5. Use the missing 547 words for a real room and a cleaner disappearance

At 1,653 body words, the chapter is not merely short; it skips the beats that would make its distinct
claim felt. Add roughly 550–700 words, while trimming some repeated declarations of coercion.

The best rooms are already in the receipts:

- Spend 150–200 words walking the two visible tempos: disable in September, delete in December,
  restore in May, remove again in July. Describe state changes and elapsed time without inventing why.

- Spend 200–250 words close-reading the two bodies as an engineer would. “Accepted” is passive: no
  subject. “For 2.0.7” binds the decision to a version. “Now” marks a changed state. “Onwards” turns
  one exception into a boundary. This is where the narrator can show daily-blame habits and where the
  reader can feel the absent institution before it is named as absent.

- Spend 100–150 words on the precise consequence: removed source returned; activation has not been
  shown; the reason for acceptance has not been shown. The limitation is part of the drama.

- Use the remaining space to make Henson’s scale concrete from the existing first/last and one-third
  evidence, not to speculate about his emotional state.

The vanishing is powerful enough without a causal moral. “After that, nothing” lands; “do not read
the vanishing as unrelated” does not. Fold the at-home habit into this ending: use
`git log --grep='<feature>' --reverse` to find the institutional sequence, use the commit body to see
which words came from the author, and use `git log --author=` to establish presence and absence—then
say plainly that absence does not disclose its cause. The final `0`, or “After that, nothing,” can
then truly end the chapter on Henson vanishing instead of being followed by a paragraph that claims
to know why.

**Single most important change:** replace the proven-sounding claim that certification forced Henson
to keep a backdoor with the exact mystery the commits support: his removal was “not accepted for
2.0.7,” later “accepted for 2.0.8 onwards,” and git never names who refused it or why.
