# Craft review: “error: no signature found”

Body is ~2,040 words (CHECK comments stripped, Receipts excluded; ~2,100 with comments). That sits on the CONTEXT default ceiling (≤2,000, extra only if it raises the score) and under the TEMPLATE 2,200 floor. Do not pad. The SDE reader who just killed Costume for “messy, no plot” will score this as a tour unless the spine is one argument.

The spine that works is already on the page: an unsigned ceremonial tag that saved the world, then a PGP-bearing ceremonial tag that named a clean tree while the weapon rode in the tarball. Everything after that is a second chapter.

---

## Gate list (must-fix)

### 1. “true” / “flawless” / “not forged” overclaim cryptographic validity

Receipts prove PGP *armor is embedded*. The**Verdict:** the first two scenes are one chapter. Everything after them is a second chapter, and that is the Costume failure mode. “true” / “flawless” overclaims what the receipts prove. Body is ~2,040 words — at the default ceiling, under the 2,200 floor. Do not pad; cut.

---

## Gate list (must-fix)

### 1. “true” / “flawless” / “not forged” overclaims cryptographic validity

Receipts prove PGP *armor is embedded*. They do not prove the signature verifies, that the key is trusted, or that the block was not copied. The receipts file says this out loud. The xz scene spends it.

> The attacker signed his work.

> The signature was not forged. The signature was *true*. It faithfully attested a clean tree

> the other carried a flawless attestation and attacked the world.

Fix — keep the inversion, drop the verdict:

> The attacker put a PGP block on his work.

> The block is there. Whether any keyring would accept it, this clone cannot say. What the tag *names* is a commit whose tree does not contain `m4/build-to-host.m4`. The weapon rode in the part of the shipment the tag never named.

> One release protected the world and carried no attestation; the other wore the full ceremony and attacked the world.

Same family, same fix (armor, not validity):

- “cut both poisoned release tags with full cryptographic ceremony” — keep “ceremony” only if the chapter has already defined it as *the block being present*.
- Bitcoin: “cut a signed tag” / “the one with the signature on it” / “a signed critical release” → “a tag carrying a PGP block.”
- Log4j2 closer: “three signatures, eight days” → “three PGP-bearing tags, eight days.”
- Linux: “a maintainer's signed tag” / “the attestation survives” → “a mergetag that embeds a PGP block” / “the block survives.”
- At-home: “the signature covers a tree” is the lesson, but only after the prose has stopped treating `-----BEGIN PGP SIGNATURE-----` as verified.

### 2. “the tag follows minutes later” is false

> The release prep lands the evening of April 7th; the tag follows minutes later [R1, R2].

R2: release-prep commit `b2d951e4…` is `2014-04-07T17:55:44+01:00`. R1: tagger date `1396889744 +0100` is the same second. Delta is 0.

Fix:

> The release-prep commit and the tag carry the same timestamp, to the second: 17:55 on April 7th.

That is a better room, not a worse one. He tagged as he shipped.

### 3. `noversion` is not Andresen

> Seven years later the same maintainer signed a tag named `noversion`

R7 tagger is Wladimir J. van der Laan, 2018-03-07, on a 2014-03-03 commit. Andresen tagged `v0.3.20.2`. Different human.

Fix: cut the paragraph (it is a second exhibit inside the third scene — see gate 12), or:

> Seven years later a later maintainer, Wladimir J. van der Laan, cut a tag named `noversion` on a 2014 commit…

“to trick `git describe`” is also a shade sneering. The receipt is “dummy tag so that `git describe` no longer shows everything relative to v0.9.0rc2.” Use the quote.

### 4. Linux: this clone cannot prove the tag was deleted, and it is not a “standard clone”

> so the attestation survives even though, in a standard clone, the tag ref no longer exists at all [R9].

R9 proves: this clone has `tag_refs=0`, and the merge commit embeds a mergetag with a PGP block. It does not prove deletion. It does not prove a standard clone. The linux working copy in this project is a `git fetch origin master` with the working tree left empty; zero tag refs is overdetermined by how the clone was fetched. A normal `git clone` of torvalds/linux advertises thousands of `v*` tags. Even on a full clone, absence of `powerpc-7.3-1` would mean “this ref is not on torvalds/linux,” not “the tag was deleted.”

Fix:

> The merge commit keeps the tag’s PGP block in a `mergetag` header. In this clone there are no tag refs at all — so the only copy of that block we can read is the one Linus filed into the merge.

Do not say “no longer exists.” Do not say “standard clone.” Do not say “deleted.”

### 5. The tag’s first line names a commit, not a tree

> A signed tag attests to one thing: a tree — a specific snapshot of files, named by hash in the tag’s first line.

R3: `object 2d7d862e…` / `type commit`. The tree is R4’s `tree=5c8015c7712a…`, reached by peeling `v5.6.0^{tree}`. The PGP block, if it verified, would attest the tag object, which names a commit, which has a tree.

Fix:

> A signed tag attests to one thing: the object in its first line — here a commit, and therefore that commit’s tree.

The lesson “the tarball is outside that attestation” survives. The mechanics must be right; this is the method chapter.

### 6. One 2016 pre-release tag is not “the project’s release tags”

> two years later, the project's release tags carry signature blocks [R2]. The habit arrived.

R2 shows `OpenSSL_1_1_0-pre6` (tagger Matt Caswell, August 2016) carrying a PGP block. One pre-release tag. Not “release tags.” Not a demonstrated habit.

Fix:

> Two years later a pre-release tag, `OpenSSL_1_1_0-pre6`, carries a PGP block. Tagger Matt Caswell.

### 7. Console line does not match the command above it

```
$ git -C repos/xz cat-file -e 'v5.6.0^{tree}:m4/build-to-host.m4' || echo absent
v5.6.0 m4/build-to-host.m4=absent
```

That command prints `absent`. The line shown is the receipts-script echo.

Fix: show the receipts command (the `if cat-file -e … then present else absent` loop) and its line, or show `|| echo absent` and the word `absent`. Do not mix them.

### 8. Log4j2 console is a reconstructed transcript

```
$ ... rel/2.15.0  tagger Ralph Goers  2021-12-10T23:20:33-07:00
```

No such command exists in the receipts. Dates and names are in R8; this fence is invented.

Fix: a real `for-each-ref` / `cat-file` excerpt matching R8, or no fence — three tagger lines as prose.

### 9. Go “by policy” is not in the git record

> An entire ecosystem's trust placed deliberately outside git — no ceremony at all, by policy.

R10: 71,792 commits all `%G?=N`; 491 tags, all lightweight; `git tag -v go1.27rc3` → `cannot verify a non-tag object of type commit.` That is absence. “Deliberately” and “by policy” are a story about the Go checksum database that this clone does not tell.

Fix:

> Go — 71,792 commits, none signed; 491 tags, all lightweight. Ask `git tag -v` and it refuses: “cannot verify a non-tag object.”

If you want “outside git,” mark a CHECK and name the source.

### 10. The orphaned Bitcoin commit is not the fix vanishing

> Delete that tag and the critical fix of March 2011 vanishes from the project's reachable history entirely.

The next paragraph says today’s HEAD contains a patch-id-identical twin. The signed *commit* becomes unreachable if you delete the tag. The fix does not vanish.

Also: “`git patch-id` proves the diffs are byte-for-byte-equivalent” overclaims. R6 shows equal `--stable` patch-ids. That is not a byte compare.

Fix:

> Delete that tag and the *signed commit* of March 2011 is reachable from nothing. The fix itself survived: same author, same date, same subject, same `patch-id`, under a different hash.

### 11. “hundreds of miles” is not in the receipts

> Author and tagger on the same release: two different people, hundreds of miles and one exhausted night apart.

R8: Goers authored `2.17.0`’s target at `2021-12-17T18:56:20-07:00`; Gregory tagged at `2021-12-18T09:14:13-05:00`. Two names, two offsets, ~12 hours. Timezone offset is not a map.

Fix:

> Author and tagger on the same release: two different people, two different offsets, one exhausted night apart.

“Volunteer,” “whose name is all over the crisis commits,” and “Nothing in any changelog records this” are also un-CHECKed. Cut them or mark them.

### 12. Plot: four scenes plus a field survey is Costume

The SDE reader already voted on this failure mode. Costume was three companies, three choices, no plot. This is OpenSSL, xz, Bitcoin, Log4j2, then Go/Linux/CPython as a postcard rack.

The first two scenes are one argument, and it is a good one: ceremony and safety are not the same axis. Bitcoin is a second argument (a tag is a ref that can outlive the branch). Log4j2 is a third (tagger as staffing chart) and it spends Log4Shell, which the book already demoted as folklore. “The field, briefly” is a fourth.

**Would cutting “The field, briefly” strengthen it?** Yes. It is 195 words of institutional character that do not turn, and they are where the linux overclaim lives. Cut the whole section. If Go’s zero-ceremony is load-bearing, one sentence in the anatomy: “Some projects never even make the object — Go has 491 tags, all lightweight, and 71,792 commits with no signature.” CPython’s 2017-on-2011 museum label can die; it is a softer Bitcoin.

That cut is necessary and not sufficient. After xz, the chapter needs a coda, not two more specimens with their own morals. Keep Bitcoin’s unreachable commit (it teaches what a tag *is*). Cut `noversion`. Halve Log4j2 to the three tagger lines and the baton; drop “When people say the open-source infrastructure of the world runs on a handful of tired humans” — that is the xz chapter’s ending, restated.

### 13. The xz scene repeats the book’s opening chapter

The book opens with xz. This scene retells: manufactured persona, two-year con, payload never in git, tarball gap, ignore-list nine days before, “worst supply-chain attack ever shipped.” Those are chapter 01’s fingerprints. The *new* archaeology is the PGP block on `v5.6.0`/`v5.6.1` and the peeled tree omitting `m4/build-to-host.m4`.

Cut the two-year friendship and the ignore-list mechanism to a pointer:

> Ten years later the xz-utils tags for 5.6.0 and 5.6.1 — the poisoned releases — carry the block OpenSSL lacked.

Then the cat-file, then `^{tree}:m4/build-to-host.m4` absent, then the lesson. One sentence may nod at the opening chapter (“the payload, as that chapter showed, never lived in git”). Do not re-teach `.gitignore`. The at-home already tries to re-teach `git archive` vs tarball, which is also chapter 01’s habit.

### 14. At-home is a second lesson, not a closing habit

223 words, a console fence, three checks, then `git archive` / diff-the-tarball. Published at-homes are one paragraph, no fence, one habit. The tarball comparison is the opening chapter’s takeaway.

Fix to one command and one warning:

> Next time you rely on a release tag, read the object: `git cat-file -p refs/tags/v1.2.3`. Four lines, a message, maybe a PGP block. The block, if it is there, attests the object those four lines name. It does not attest the tarball you will actually install.

Drop `merge-base --is-ancestor` from the close (Bitcoin already taught it). Drop `git archive`.

---

## CHECK markers

**CHECK 1** (open): Heartbleed = CVE-2014-0160, disclosed 2014-04-07; 1.0.1g the fix release.

Necessary: without the name, the unsigned tag is a curiosity. Scope is too narrow for the prose it sits in. It covers the name and the disclosure date. It does not cover “half the internet's servers stood bleeding,” “the most anxiously awaited release in its history,” or “the worst cryptographic emergency it would ever have.” Convert to `VERIFIED` with the OpenSSL security advisory, and either source the superlatives or cut them. The git facts (unsigned annotated tag, Henson, 00:51 April 6, same-second April 7 tag) stand without the CHECK.

**CHECK 2** (xz): 5.6.0/5.6.1 carried CVE-2024-3094 via the tarball’s `build-to-host.m4`.

Necessary for “poisoned” / “weapon.” Already `VERIFIED` in `04-xz.reader.md` with URLs. Reuse those. Does not cover “manufactured persona,” “spent two years becoming this project's co-maintainer,” or “the most notorious poisoned releases in the history of open source.” Those are either a pointer to chapter 01 or a new CHECK. Prefer the pointer, per gate 13.

**CHECK 3** (log4j2): Log4Shell = CVE-2021-44228, disclosed 2021-12-09/10; 2.15.0/2.16.0/2.17.0 the emergency releases.

Necessary only if this scene stays (gate 12). The three taggers in eight days are in R8 without the CVE; the “relay team / burning project” reading needs the emergency. Does not cover “Nothing in any changelog records this,” “volunteer,” or “hundreds of miles.” If the scene survives as a short coda, verify against the demoted Log4j2 chapter’s sources. If it does not, the CHECK dies with the scene.

Unmarked externals that need a CHECK or a cut: Bitcoin “minting real money”; Go “Google's language, with corporate release engineering”; CPython “when the museum was reorganized.”

CPython is *not* called backdated. “created in 2017 — by a tagger whose header honestly says so — pointing back at a branch closed in 2011” is the correct sentence. Leave it. Do not “fix” it into backdating.

---

## Craft questions, answered

**(1) Plot vs catalog.** Two scenes, one argument, then a tour. See gate 12. Cutting the field helps; it does not fix Bitcoin-plus-noversion-plus-Log4j2-plus-field as four extra plots. Empty-commit (the successful cross-repo method chapter) taxonomized: one doorbell, then “three things they tend to say.” This chapter names four specimens. Follow empty, or follow OpenSSL→xz and stop.

**(2) Anatomy lesson.** Right spot, right length. It sits after the unsigned tag, which is where the reader needs the distinction, and it returns to Henson instead of becoming a man page. Do not move it before the open. Optional trim: “Here is the trap hiding in plain sight: **annotated is not signed.**” names the trap; the OpenSSL output already *is* the trap. Let the four-line description end on “nothing in daily git usage ever shows you the bottom,” then go back to the timestamps.

**(3) xz vs chapter 01.** Additive if it is the tag object and the peeled tree. Repetitive as drafted. See gate 13.

**(4) At-home.** Yes, too long, too many commands. See gate 14.

**(5) Title.** Works on a contents page. The book’s titles are found language (commit subjects, a HACK comment, “empty commit to trigger a github mirror”). A git error sits next to those without apology, especially in P.S. Caveat: it titles the OpenSSL half, while the chapter says xz is “the reason this chapter exists.” That is acceptable — the error is the cold open, and this book likes titles that were sitting in plain sight. Do not rename to a thesis (“Ceremony is not safety”).

**(6) Word count.** ~2,040 body. Not over the 2,200–3,200 band; at the CONTEXT default. Cuts are for plot, not arithmetic:

| Cut | Why | ~words |
|---|---|---|
| “The field, briefly” | Costume postcard; linux overclaim | 195 |
| xz persona + ignore-list recap | chapter 01 already did this | ~120 |
| `noversion` paragraph | wrong maintainer; second exhibit | ~80 |
| At-home archive/tarball + merge-base | chapter 01 habit; Bitcoin already taught ancestor | ~100 |
| Log4j2 “handful of tired humans” closer | xz’s moral | ~40 |

That lands ~1,500–1,600, which is the right length for a P.S. method chapter with one turn. Do not write back up to 2,200.

---

## Optional suggestions

- **First person is absent.** Zero `I`. One `we`. The book’s narrator is an engineer who runs blame daily. This reads as a lecture with exhibits. One occupancy would help: “I run `git tag -v` the way I run blame — almost never, until I do.” Then the OpenSSL output. Not a gate.
- **“pennants flying” / “dress uniform.”** A little Costume. The SDE reader punished whimsy. The argument is sharp enough to dress down.
- **Command switch.** The open correctly uses `git tag -v` (no signature found). Later you switch to `cat-file` for xz, correctly, because `tag -v` on a PGP-bearing tag without the key would produce a different failure. A half-sentence of why the command changes would earn trust: “`tag -v` is the question; `cat-file -p` is how you look at the object when you cannot check the key.”
- **“11:20 on a Friday night.”** 23:20-07:00 on 2021-12-10 is Friday. Allowed as calendar arithmetic on a receipt timestamp. Keep if the scene stays.
- **Henson room is the book’s best page here.** “the record is gentle with the man who cut it” is the no-sneering contract, kept. After gate 2 (same-second tag), sit there. Do not rush to “ceremony always yields to urgency,” which is an aphorism the record already showed.
- **Reveal timing is good** in the two spine scenes: the console is the reveal, the caption follows. Do not add more drumroll before the OpenSSL fence.

---

## Do not “fix”

- CPython is not called backdated. Keep the 2017-tagger / 2011-target sentence if CPython survives.
- The cold open on `error: no signature found` is the right object. Do not open on xz.
- Anatomy after the open, not before.
- Naming Jia Tan as tagger is in R3. Naming him as attacker is the opening chapter plus CHECK 2. A pointer is enough.
- “None of these is a scandal” is the right ethical register *if* the field stays. Prefer cutting the field to rewriting it.
the caption follows. Do not add a preview sentence before the OpenSSL fence (“and here is the complete answer” is already a drumroll; the fence can be the answer).
- **Italic fable header** (“This is the full dig… plain-English telling… 18-signatures.html”) points at a reader page that does not exist yet. Pipeline leftover, not a prose gate.

---

## Do not “fix”

- CPython is not called backdated. “created in 2017 — by a tagger whose header honestly says so — pointing back at a branch closed in 2011” is the correct sentence. Keep it if CPython survives; do not replace it with “backdated.”
- The cold open on `error: no signature found` is the right object. Do not open on xz.
- Anatomy after the open, not before.
- Naming Jia Tan as tagger is in R3. Naming him as attacker is the opening chapter plus CHECK 2. A pointer is enough.
- “None of these is a scandal” (field) is the right ethical register *if* the field stays. Prefer cutting the field to rewriting it.
