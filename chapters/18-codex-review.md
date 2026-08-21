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
session id: 01a0253d-60cd-7cb1-a3ab-82c59523ff2e
--------
user
You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
is an engineer who runs git blame daily; first person, opinionated, no sneering; the reader should
feel a reveal a beat before it's named.

READ: chapters/18-signatures.fable.md, chapters/18-signatures.receipts.md, plus CONTEXT.md and
TEMPLATE.md. Context: NEW P.S.-candidate chapter (source 18), cross-repo method chapter
(find-type: signature & tag-object archaeology). The published book runs xz / debian-openssl /
t2t / dual-ec / postgres / php / npm / vim — note the book OPENS with the xz chapter, so this
chapter's xz scene must add, not repeat. Recent reader-test calibration: a professional-SDE
reader scores concision and real-world consequence hardest; a multi-story chapter (Costume) was
just demoted for "messy, no plot" — this chapter's four-scene structure is the biggest risk.

Spine (verified, LOCKED to receipts): openssl 1.0.1g Heartbleed-fix release tag annotated but
unsigned ("error: no signature found", tagger Henson 2014-04-07; fix authored 04-06T00:51; 2016
pre6 tag carries PGP, Caswell); xz v5.6.0/v5.6.1 tags carry PGP blocks (tagger Jia Tan), signed
trees OMIT m4/build-to-host.m4 while m4/.gitignore names it, path has zero commits across all
refs; bitcoin v0.3.20.2 signed "critical bug-fix release" (Andresen 2011) whose target commit is
outside HEAD's history, reachable only via the tag, with a patch-identical twin on HEAD
(patch-id equal); noversion signed 2018 policy tag on a 2014 commit; log4j2 rel/2.15.0/2.16.0/
2.17.0 — three PGP-bearing tags in eight days, taggers Goers/Sicker/Gregory, 2.17.0 authored by
Goers but tagged by Gregory; go 71,792 commits all %G?=N, 491 tags all lightweight; linux
mergetag embedded in a 2026 merge while the clone has zero tag refs; cpython tag object "2.0"
made 2017 targeting a 2011 branch-close commit.

FACTUAL GATE (one flag gates): every hash, date, name, quote, count, and console line in prose
must appear in chapters/18-signatures.receipts.md. CRITICAL precision item: the receipts prove
PGP signature MATERIAL is embedded in tag objects; they do NOT prove cryptographic validity or
key trust (keys unavailable). Flag any prose that says or implies "validly signed" where only
"carries a signature block" is supported — the xz scene calls the signature "true"/"flawless";
judge whether that overclaims, and propose exact wording if so. Also flag: the linux clone
cannot prove the tag was deleted (only that its ref is absent); "backdated" for cpython means a
2017 tag pointing at 2011, not a falsified tagger date. List every <!-- CHECK: --> marker and
judge scope.

Craft risks to judge hard: (1) plot vs catalog — do the four scenes build one argument with an
emotional spine, or does it read as a tour (the Costume failure mode)? Would cutting "The field,
briefly" strengthen it? (2) the anatomy lesson placement — right spot, right length? (3) the xz
scene vs the book's opening xz chapter — additive or repetitive? (4) is the at-home section too
long/multi-command for the concision-scoring reader? (5) title "error: no signature found" —
does it work on a contents page next to the other titles? (6) word count vs the 2,200-3,200
band — where would you cut?

Output: a numbered gate list (must-fix), then optional suggestions. Be specific — quote the
line, say the fix.
warning: Codex could not find bubblewrap on PATH. Install bubblewrap with your OS package manager. See the sandbox prerequisites: https://developers.openai.com/codex/concepts/sandboxing#prerequisites. Codex will use the bundled bubblewrap in the meantime.
codex
I’ll use the chapter-review workflow implied by the manuscript template: first establish the receipts gate, then judge structure and reader-facing craft against the book context.
exec
/bin/bash -lc "wc -w chapters/18-signatures.fable.md chapters/18-signatures.receipts.md CONTEXT.md TEMPLATE.md && sed -n '1,260p' chapters/18-signatures.fable.md && sed -n '1,320p' chapters/18-signatures.receipts.md && sed -n '1,240p' CONTEXT.md && sed -n '1,260p' TEMPLATE.md" in /home/diablo/book16
 succeeded in 170ms:
 2452 chapters/18-signatures.fable.md
 1429 chapters/18-signatures.receipts.md
 1000 CONTEXT.md
  225 TEMPLATE.md
 5106 total
# error: no signature found

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [error: no signature found](18-signatures.html).*

In April 2014, the OpenSSL project shipped the most anxiously awaited release in its history —
version 1.0.1g, the one that closed the Heartbleed hole while half the internet's servers stood
bleeding. <!-- CHECK: Heartbleed = CVE-2014-0160, disclosed 2014-04-07; OpenSSL 1.0.1g was the
fix release; needs external source for the name and disclosure date. --> Ask git today to verify
the cryptographic signature on that release's tag — the tag cut by the cryptography project, at
the height of the worst cryptographic emergency it would ever have — and here is the complete
answer [R1]:

```console
$ git -C repos/openssl tag -v OpenSSL_1_0_1g
object b2d951e4232d2f90168f9a3dd0b7df9ecf2d81a8
type commit
tag OpenSSL_1_0_1g
tagger Dr. Stephen Henson <steve@openssl.org> 1396889744 +0100

OpenSSL 1.0.1g release tag
error: no signature found
```

The release that repaired the internet's encryption is not signed. Not badly signed, not signed
with an expired key — *not signed*. And almost nobody has ever noticed, because almost nobody
ever asks. This chapter is about the asking: one small command, `git cat-file -p` pointed at a
tag, and the strange, human things it turns up in the places software is supposed to be at its
most ceremonial. Releases are where projects put on their dress uniform. The tag object is where
you find out what the uniform actually covers.

## Four lines and a promise

First, the anatomy, because the entire chapter lives inside one distinction most working
engineers have never had a reason to make.

A tag most people meet is just a bookmark — a name pointing at a commit. But git also has the
*annotated* tag: a real object in the database, with its own four-line header — what it points
at, its name, who made it, when — plus a message. And optionally, at the bottom, a block of PGP
armor: a cryptographic signature over everything above it. Here is the trap hiding in plain
sight: **annotated is not signed.** The four lines and the ceremony are present either way. The
tagger's name is right there, official-looking, in both cases. The only difference between "a
release solemnly attested by its maintainer" and "a note anyone could have typed" is whether the
signature block exists at the bottom — and nothing in daily git usage ever shows you the bottom.
`git tag -v` is the question; the OpenSSL answer above is what asking sounds like when the
answer is no.

Look at the timestamps around that unsigned tag, because the record is gentle with the man who
cut it. The bounds-check fix that closed Heartbleed is authored by the same Stephen Henson at
00:51 in the morning of April 6th [R2]. The release prep lands the evening of April 7th; the tag
follows minutes later [R1, R2]. This is a man in the middle of the worst week of his professional
life, shipping the fix the entire world is refreshing its browser for. The signature is the step
that protects against an adversary nobody was thinking about that day, and it is precisely the
kind of step that evaporates under pressure — ceremony always yields to urgency. The record
even shows the lesson landing, eventually: two years later, the project's release tags carry
signature blocks [R2]. The habit arrived. It arrived *after* the emergency that most needed it,
which is the way habits usually arrive.

## The signature that told the truth

Now the inversion, and it is the reason this chapter exists. Ten years later, in the spring of
2024, the xz-utils compression library shipped the most notorious poisoned releases in the
history of open source — versions 5.6.0 and 5.6.1, carrying a backdoor aimed at the servers of
the world. <!-- CHECK: xz 5.6.0/5.6.1 carried the CVE-2024-3094 backdoor, delivered via the
release tarball's build-to-host.m4; needs external source. --> Read those release tags the way we
just read OpenSSL's [R3]:

```console
$ git -C repos/xz cat-file -p refs/tags/v5.6.0
object 2d7d862e3ffa8cec4fd3fdffcd84e984a17aa429
type commit
tag v5.6.0
tagger Jia Tan <jiat0218@gmail.com> 1708762926 +0800

XZ Utils 5.6.0
-----BEGIN PGP SIGNATURE-----
```

There it is — the block the crisis-stricken OpenSSL release lacked. The attacker signed his
work. Jia Tan, the manufactured persona who spent two years becoming this project's
co-maintainer, cut both poisoned release tags with full cryptographic ceremony [R3]. If your
threat model was "an unsigned release is suspicious, a signed release is safe," the most
dangerous release of the decade sails straight through, pennants flying.

Because here is what the signature actually covers, and the receipts let us say it with
precision. A signed tag attests to one thing: a tree — a specific snapshot of files, named by
hash in the tag's first line. Ask git whether the backdoor's delivery vehicle, a build file
called `m4/build-to-host.m4`, is *in* the tree that signature names [R4]:

```console
$ git -C repos/xz cat-file -e 'v5.6.0^{tree}:m4/build-to-host.m4' || echo absent
v5.6.0 m4/build-to-host.m4=absent
```

Absent. Across the entire repository, every branch, all of history: that file has been modified
in exactly zero commits [R4]. It never existed in git. It existed only in the release *tarball*
— the bundled download that installers actually consume, which is built from the tree and then,
in the gap between tree and bundle, had the poisoned file added. The signature was not forged.
The signature was *true*. It faithfully attested a clean tree, and the weapon rode along in the
part of the shipment no signature named. Nine days before the first poisoned release, the same
hands had added one line to the repository — `build-to-host.m4` in git's ignore file [R4] — so
that if the weapon's carrier ever appeared on a developer's disk, git would decline to mention
it.

Say the lesson plainly, because it is the sharpest one in this chapter: *a signature is an answer
to exactly one question — was this tree the one attested? It says nothing about what got shipped
under the tree's name.* The OpenSSL story and the xz story are the same lesson from opposite
directions. One release protected the world and carried no attestation; the other carried a
flawless attestation and attacked the world. The ceremony and the safety are simply not the same
axis, and every intuition that treats them as one axis is exploitable.

## The fix only a tag remembers

The third specimen looks like trivia and turns out to be about what "history" means. In March
2011, Bitcoin's then-lead maintainer Gavin Andresen cut a signed tag whose message does not
bother with ceremony [R5]:

```console
$ git -C repos/bitcoin cat-file -p refs/tags/v0.3.20.2
object 52248a757b25581339ca6e00cc0da05bfdb04dc8
type commit
tag v0.3.20.2
tagger Gavin Andresen <gavinandresen@gmail.com> 1299250125 -0500

critical bug-fix release (block download failures due to too-small sendbuffer)
-----BEGIN PGP SIGNATURE-----
```

A critical fix, for software that was, by then, minting real money. Now ask the obvious
follow-up: is that commit an ancestor of today's Bitcoin? No [R6]. The commit the tag signs is
reachable from exactly one ref in the entire repository — the tag itself [R6]. Delete that tag
and the critical fix of March 2011 vanishes from the project's reachable history entirely.

It gets stranger. Today's main history *does* contain that fix — same author, same date, same
subject line, and `git patch-id` proves the diffs are byte-for-byte-equivalent — under a
completely different commit hash [R6]. Somewhere in the project's early, chaotic era of
conversions and reshuffles, the line of history was rebuilt, and the rebuilt twin went forward
while the original — the one with the signature on it — was left standing off to the side like a
demolished building's doorway. The tag is not decoration on history. The tag is the only
*witness* to a version of history the branches abandoned. If you have ever assumed "everything
important is reachable from main," here is a signed critical release, in one of the most scrutinized
repositories on earth, telling you otherwise.

And tags carry the mundane too, which is its own calibration. Seven years later the same
maintainer signed a tag named `noversion`, planted on a 2014 commit, whose message explains in
plain words that it exists to trick `git describe` into producing sensible output [R7] — a
signed, ceremonial object whose entire purpose is plumbing. Tag objects are not a sacred
registry. They are a workbench, and reading them tells you which kind of object you are holding.

## Three hands in eight days

The last specimen turns tag headers into a staffing chart. December 2021: the Log4Shell
emergency, the logging library on fire, and three patch releases in eight days.
<!-- CHECK: Log4Shell = CVE-2021-44228, disclosed 2021-12-09/10; 2.15.0/2.16.0/2.17.0 were the
emergency response releases; needs external source. --> Read the three release tags in a row —
just the tagger lines [R8]:

```console
$ ... rel/2.15.0  tagger Ralph Goers  2021-12-10T23:20:33-07:00
$ ... rel/2.16.0  tagger Matt Sicker  2021-12-13T10:58:39-06:00
$ ... rel/2.17.0  tagger Gary Gregory 2021-12-18T09:14:13-05:00
```

Three releases, three different human beings, three different time zones. The first tag is cut
at 11:20 on a Friday night by Ralph Goers — the volunteer maintainer whose name is all over the
crisis commits. The second, three days later, is cut by someone else. The third, five days after
that, by a third person — and the release-prep commit it points to was authored by *Goers*, the
night before, in a different time zone than the tag that shipped it [R8]. Author and tagger on
the same release: two different people, hundreds of miles and one exhausted night apart.

Nothing in any changelog records this, but the tag objects do: a relay team. The emergency ran
longer than any one volunteer could, and the releases were handed from hand to hand — you can
watch the baton pass in the `tagger` field. When people say the open-source infrastructure of
the world runs on a handful of tired humans, this is what the claim looks like in primary
sources: three signatures, eight days, three names for one burning project.

## The field, briefly

Once you start reading tag objects you find the whole spectrum of institutional character. Go —
Google's language, with corporate release engineering — has *zero* git signatures across all
71,792 commits, and every one of its 491 tags is lightweight: ask `git tag -v` and it refuses,
"cannot verify a non-tag object" [R10]. An entire ecosystem's trust placed deliberately outside
git — no ceremony at all, by policy. The Linux kernel keeps signatures in a place almost nobody
looks: when Linus merges a maintainer's signed tag, the tag's full signature is embalmed inside
the merge commit itself — a `mergetag` block — so the attestation survives even though, in a
standard clone, the tag ref no longer exists at all [R9]. And CPython's tag `2.0` was created in
2017 — by a tagger whose header honestly says so — pointing back at a branch closed in 2011
[R11]: a museum label, added when the museum was reorganized, its target no longer on the main
line at all. None of these is a scandal. Each is a project's character, printed in a place
nobody thinks to look because everybody assumes it is boring.

## At home

The habit costs ten seconds. Next time you rely on a release tag — before you build from it,
before you cite it, before you trust it — read the object instead of the ref:

```console
$ git cat-file -p $(git rev-parse v1.2.3)
```

Four lines and maybe a signature block. Check three things against your assumptions. Who is the
tagger, and is that who you thought stood behind this release? Is there a `-----BEGIN PGP
SIGNATURE-----` at the bottom — and remember the tag can be annotated, official, and ceremonial
with nothing at the bottom at all? And is the object it names actually an ancestor of what you
are running (`git merge-base --is-ancestor <tag>^{commit} HEAD`)? Then, if the answer matters —
if this tag is how you decide what to install — take the xz lesson all the way: the signature
covers a tree, so compare the tree against the artifact you actually consume. `git archive` the
tag, diff it against the tarball, and stare hard at anything the tarball has that the tree does
not. That gap is boring scaffolding in ten thousand projects, and in one project it was the
worst supply-chain attack ever shipped. The signature will not look there for you. Nothing looks
there for you. That is why it is the place to look.

## Receipts

- **R1** `git -C repos/openssl cat-file -p refs/tags/OpenSSL_1_0_1g` + `git tag -v` — annotated tag, tagger Dr. Stephen Henson, 2014-04-07; `error: no signature found`.
- **R2** `git -C repos/openssl show -s ... 96db9023b881...` + `merge-base --is-ancestor` + `cat-file -p refs/tags/OpenSSL_1_1_0-pre6` — the bounds-check fix (authored 2014-04-06T00:51) is an ancestor of the 1.0.1g release commit; the 2016 pre6 tag carries a PGP block (tagger Matt Caswell).
- **R3** `git -C repos/xz cat-file -p refs/tags/v5.6.0` and `v5.6.1` — both poisoned-release tags carry PGP signature blocks, tagger Jia Tan, 2024-02/03.
- **R4** `git -C repos/xz cat-file -e 'v5.6.0^{tree}:m4/build-to-host.m4'` (absent, both tags) + `log --all -- m4/build-to-host.m4` (zero commits) + `log -S 'build-to-host.m4' -- m4/.gitignore` — the signed trees omit the payload path; the ignore-list line is Jia Tan's, 2024-02-15.
- **R5** `git -C repos/bitcoin cat-file -p refs/tags/v0.3.20.2` — signed tag, tagger Gavin Andresen, 2011-03: "critical bug-fix release"; target `52248a757b...`.
- **R6** `merge-base --is-ancestor` (no) + `for-each-ref --contains` (only the tag) + `git patch-id --stable` — the signed commit is outside HEAD's history; HEAD carries a patch-identical twin `f36b494aeb...` under a different hash.
- **R7** `git -C repos/bitcoin cat-file -p refs/tags/noversion` — signed 2018 tag by Wladimir J. van der Laan on a 2014 commit: "dummy tag ... so that git describe no longer shows everything relative to v0.9.0rc2."
- **R8** `for-each-ref` + `cat-file -p` on `rel/2.15.0`, `rel/2.16.0`, `rel/2.17.0` — three PGP-bearing tags in eight days of December 2021; taggers Ralph Goers, Matt Sicker, Gary Gregory; 2.17.0's target commit authored by Goers, tagged by Gregory.
- **R9** `git -C repos/linux cat-file commit 1200d84f4c0a...` — a 2026 Linus merge embeds a signed `mergetag` (powerpc-7.3-1, tagger Madhavan Srinivasan) while the clone has zero tag refs.
- **R10** `git -C repos/go rev-list --all --count` + `log --all --format='%G?'` + `for-each-ref refs/tags` — 71,792 commits, all unsigned (`N`); 491 tags, all lightweight; `git tag -v go1.27rc3` refuses: "cannot verify a non-tag object."
- **R11** `git -C repos/cpython cat-file -p 1f73a4e13792...` — tag `2.0`, tagger Ned Deily 2017-06-18, target Georg Brandl's 2011 "Close 2.0 branch" commit; target not an ancestor of main; tag ref absent in this clone, object retained.
# Receipts — ch. 18 signature and tag-object archaeology (cross-repo)

Verbatim outputs against full clones of openssl, xz, bitcoin, log4j2, linux, go, and cpython.
A PGP armor line proves signature material is embedded in an object; it does not establish key trust.
Regenerate with `scripts/receipts-18.sh`. Long outputs are truncated editorially (head or sed).

## R1 — openssl: the annotated Heartbleed-fix release tag is unsigned
```
$ git -C repos/openssl rev-parse refs/tags/OpenSSL_1_0_1g 'refs/tags/OpenSSL_1_0_1g^{}'
7434fe25b14aa036f6b9e12358abeaebdb7b250a
b2d951e4232d2f90168f9a3dd0b7df9ecf2d81a8
```

```
$ git -C repos/openssl cat-file -p refs/tags/OpenSSL_1_0_1g
object b2d951e4232d2f90168f9a3dd0b7df9ecf2d81a8
type commit
tag OpenSSL_1_0_1g
tagger Dr. Stephen Henson <steve@openssl.org> 1396889744 +0100

OpenSSL 1.0.1g release tag
```

```
$ git -C repos/openssl tag -v OpenSSL_1_0_1g
object b2d951e4232d2f90168f9a3dd0b7df9ecf2d81a8
type commit
tag OpenSSL_1_0_1g
tagger Dr. Stephen Henson <steve@openssl.org> 1396889744 +0100

OpenSSL 1.0.1g release tag
error: no signature found
```

## R2 — openssl: the bounds-check fix is in 1.0.1g; a later tag object contains PGP armor
```
$ git -C repos/openssl show -s --format='%H%n%aI%n%an <%ae>%n%s' 96db9023b881d7cd9f379b0c154650d6c108e9a3 'OpenSSL_1_0_1g^{}'
96db9023b881d7cd9f379b0c154650d6c108e9a3
2014-04-06T00:51:06+01:00
Dr. Stephen Henson <steve@openssl.org>
Add heartbeat extension bounds check.
b2d951e4232d2f90168f9a3dd0b7df9ecf2d81a8
2014-04-07T17:55:44+01:00
Dr. Stephen Henson <steve@openssl.org>
Prepare for 1.0.1g release
```

```
$ git -C repos/openssl merge-base --is-ancestor 96db9023b881d7cd9f379b0c154650d6c108e9a3 'OpenSSL_1_0_1g^{}' && echo 'heartbleed_fix_ancestor_of_release=yes'
heartbleed_fix_ancestor_of_release=yes
```

```
$ git -C repos/openssl rev-parse refs/tags/OpenSSL_1_1_0-pre6 'refs/tags/OpenSSL_1_1_0-pre6^{}'; git -C repos/openssl cat-file -p refs/tags/OpenSSL_1_1_0-pre6 | sed -n '1,6p;/^-----BEGIN PGP SIGNATURE-----$/p'
04a54629c2bb904e9bd9a1d98381b1259147cc0d
2f554efe20d1fe05b242f41f593362965ae89912
object 2f554efe20d1fe05b242f41f593362965ae89912
type commit
tag OpenSSL_1_1_0-pre6
tagger Matt Caswell <matt@openssl.org> 1470319244 +0100

OpenSSL 1.1.0-pre6 release tag
-----BEGIN PGP SIGNATURE-----
```

## R3 — xz: both compromised-release tag objects contain PGP signatures
```
$ for tag in v5.6.0 v5.6.1; do git -C repos/xz rev-parse "refs/tags/$tag" "refs/tags/$tag^{}"; git -C repos/xz cat-file -p "refs/tags/$tag" | sed -n '1,6p;/^-----BEGIN PGP SIGNATURE-----$/p'; done
ea6bc696fe047eb031b1ecc4bdbaeb6d5b01a711
2d7d862e3ffa8cec4fd3fdffcd84e984a17aa429
object 2d7d862e3ffa8cec4fd3fdffcd84e984a17aa429
type commit
tag v5.6.0
tagger Jia Tan <jiat0218@gmail.com> 1708762926 +0800

XZ Utils 5.6.0
-----BEGIN PGP SIGNATURE-----
1b7a78738112e2ccecf9dcef68a79ffac8a0c738
fd1b975b7851e081ed6e5cf63df946cd5cbdbb94
object fd1b975b7851e081ed6e5cf63df946cd5cbdbb94
type commit
tag v5.6.1
tagger Jia Tan <jiat0218@gmail.com> 1709972160 +0800

XZ Utils 5.6.1
-----BEGIN PGP SIGNATURE-----
```

## R4 — xz: those signatures name Git trees that omit the tarball payload path but ignore it
```
$ for tag in v5.6.0 v5.6.1; do git -C repos/xz show -s --format="$tag commit=%H tree=%T%n%aI %an <%ae>%n%s" "$tag^{}"; if git -C repos/xz cat-file -e "$tag^{tree}:m4/build-to-host.m4" 2>/dev/null; then echo "$tag m4/build-to-host.m4=present"; else echo "$tag m4/build-to-host.m4=absent"; fi; git -C repos/xz show "$tag^{commit}:m4/.gitignore" | rg '^build-to-host\.m4$'; done
v5.6.0 commit=2d7d862e3ffa8cec4fd3fdffcd84e984a17aa429 tree=5c8015c7712a44f2a035448121f83aa16e73a041
2024-02-24T15:55:08+08:00 Jia Tan <jiat0218@gmail.com>
Bump version and soname for 5.6.0.
v5.6.0 m4/build-to-host.m4=absent
build-to-host.m4
v5.6.1 commit=fd1b975b7851e081ed6e5cf63df946cd5cbdbb94 tree=c61040fb8c1972d6da4568969d695ea73bd0a804
2024-03-09T11:42:50+08:00 Jia Tan <jiat0218@gmail.com>
Bump version and soname for 5.6.1.
v5.6.1 m4/build-to-host.m4=absent
build-to-host.m4
```

```
$ git -C repos/xz log --all --format='%H' -- m4/build-to-host.m4 | wc -l; git -C repos/xz log --all --format='%H %aI %an <%ae> %s' -S 'build-to-host.m4' -- m4/.gitignore
0
2c024f60c2e51224981ecc7d1426ec821355f9b4 2024-02-15T22:26:43+08:00 Jia Tan <jiat0218@gmail.com> Update m4/.gitignore.
e164211b09d65f7f8663c46b1f74f12ac1c54d48 2024-02-15T22:26:43+08:00 Jia Tan <jiat0218@gmail.com> Update m4/.gitignore.
4323bc3e0c1e1d2037d5e670a3bf6633e8a3031e 2024-02-15T22:26:43+08:00 Jia Tan <jiat0218@gmail.com> Update m4/.gitignore.
```

## R5 — bitcoin: the signed v0.3.20.2 object calls itself a critical bug-fix release
```
$ git -C repos/bitcoin rev-parse refs/tags/v0.3.20.2 'refs/tags/v0.3.20.2^{}'; git -C repos/bitcoin cat-file -p refs/tags/v0.3.20.2 | sed -n '1,6p;/^-----BEGIN PGP SIGNATURE-----$/p'
90b4ed72f86e1d7f6196f9f9be0911a79f9cbb09
52248a757b25581339ca6e00cc0da05bfdb04dc8
object 52248a757b25581339ca6e00cc0da05bfdb04dc8
type commit
tag v0.3.20.2
tagger Gavin Andresen <gavinandresen@gmail.com> 1299250125 -0500

critical bug-fix release (block download failures due to too-small sendbuffer)
-----BEGIN PGP SIGNATURE-----
```

```
$ git -C repos/bitcoin show -s --format='%H%n%aI%n%an <%ae>%n%s' 52248a757b25581339ca6e00cc0da05bfdb04dc8
52248a757b25581339ca6e00cc0da05bfdb04dc8
2011-03-03T16:25:05-05:00
Gavin Andresen <gavinandresen@gmail.com>
Make send/receive limits bigger (10MB each)
```

## R6 — bitcoin: that exact fix is outside HEAD; an identical patch survives under another hash
```
$ git -C repos/bitcoin rev-parse HEAD; if git -C repos/bitcoin merge-base --is-ancestor 52248a757b25581339ca6e00cc0da05bfdb04dc8 HEAD; then echo release_commit_ancestor_of_HEAD=yes; else echo release_commit_ancestor_of_HEAD=no; fi; git -C repos/bitcoin for-each-ref --contains 52248a757b25581339ca6e00cc0da05bfdb04dc8 --format='%(refname) %(objecttype) %(objectname)'
b88bffe550a3a017440aff6a189cdb5f79f9b060
release_commit_ancestor_of_HEAD=no
refs/tags/v0.3.20.2 tag 90b4ed72f86e1d7f6196f9f9be0911a79f9cbb09
```

```
$ git -C repos/bitcoin log HEAD -1 --format='%H %aI %an <%ae> %s' --grep='^Make send/receive limits bigger'; for oid in 52248a757b25581339ca6e00cc0da05bfdb04dc8 f36b494aebcfe4cc6a45003520ee7d15eeaba8df; do git -C repos/bitcoin show "$oid" | git patch-id --stable; done
f36b494aebcfe4cc6a45003520ee7d15eeaba8df 2011-03-03T16:25:05-05:00 Gavin Andresen <gavinandresen@gmail.com> Make send/receive limits bigger (10MB each)
7c1460fdc434ba2240ad13a495979de13ae9670e 52248a757b25581339ca6e00cc0da05bfdb04dc8
7c1460fdc434ba2240ad13a495979de13ae9670e f36b494aebcfe4cc6a45003520ee7d15eeaba8df
```

```
$ git -C repos/bitcoin show --format= --unified=2 52248a757b25581339ca6e00cc0da05bfdb04dc8 -- net.cpp
diff --git a/net.cpp b/net.cpp
index 0ba147bf75..d18b63eb5f 100644
--- a/net.cpp
+++ b/net.cpp
@@ -742,5 +742,5 @@ void ThreadSocketHandler2(void* parg)
                     unsigned int nPos = vRecv.size();
 
-                    if (nPos > 1000*GetArg("-maxreceivebuffer", 2*1000)) {
+                    if (nPos > 1000*GetArg("-maxreceivebuffer", 10*1000)) {
                         if (!pnode->fDisconnect)
                             printf("socket recv flood control disconnect (%d bytes)\n", vRecv.size());
@@ -807,5 +807,5 @@ void ThreadSocketHandler2(void* parg)
                             }
                         }
-                        if (vSend.size() > 1000*GetArg("-maxsendbuffer", 256)) {
+                        if (vSend.size() > 1000*GetArg("-maxsendbuffer", 10*1000)) {
                             if (!pnode->fDisconnect)
                                 printf("socket send flood control disconnect (%d bytes)\n", vSend.size());
```

## R7 — bitcoin: noversion is a signed 2018 policy marker planted on a 2014 commit
```
$ git -C repos/bitcoin rev-parse refs/tags/noversion 'refs/tags/noversion^{}'; git -C repos/bitcoin cat-file -p refs/tags/noversion | sed -n '1,10p;/^-----BEGIN PGP SIGNATURE-----$/p'
8a5c4f445d1588c0a7c30cec929ecf75648b4589
aefbf6e30cadaf77ebee44284c74cc5449dc173f
object aefbf6e30cadaf77ebee44284c74cc5449dc173f
type commit
tag noversion
tagger Wladimir J. van der Laan <laanwj@gmail.com> 1520434590 +0100

dummy tag for commits on master

This is a dummy tag so that `git describe` no longer shows everything
relative to v0.9.0rc2 just because that was the last version to be tagged
on master instead of on a branch.
-----BEGIN PGP SIGNATURE-----
```

```
$ git -C repos/bitcoin show -s --format='%H%n%aI%n%an <%ae>%n%s' aefbf6e30cadaf77ebee44284c74cc5449dc173f; git -C repos/bitcoin describe --tags 'aefbf6e30cadaf77ebee44284c74cc5449dc173f^'; git -C repos/bitcoin describe --tags aefbf6e30cadaf77ebee44284c74cc5449dc173f
aefbf6e30cadaf77ebee44284c74cc5449dc173f
2014-03-03T09:41:18+01:00
Wladimir J. van der Laan <laanwj@gmail.com>
doc: Empty release notes for next release
v0.9.0rc2
noversion
```

## R8 — log4j2: three emergency release tag objects, three taggers in eight days
```
$ for tag in rel/2.15.0 rel/2.16.0 rel/2.17.0; do git -C repos/log4j2 for-each-ref --format='%(refname:short) tag=%(objectname) target=%(*objectname) %(taggerdate:iso-strict) %(taggername) %(taggeremail) | %(subject)' "refs/tags/$tag"; git -C repos/log4j2 cat-file -p "refs/tags/$tag" | sed -n '1,6p;/^-----BEGIN PGP SIGNATURE-----$/p'; git -C repos/log4j2 show -s --format='target %H%n%aI %an <%ae>%n%s' "$tag^{}"; done
rel/2.15.0 tag=636ce10d676202b2ea4aa2bab9924a5a8c6dd401 target=c30a1398a6697fb832c650870c44284d0052103e 2021-12-10T23:20:33-07:00 Ralph Goers <rgoers@apache.org> | Release 2.15.0 of Log4j
object c30a1398a6697fb832c650870c44284d0052103e
type commit
tag rel/2.15.0
tagger Ralph Goers <rgoers@apache.org> 1639203633 -0700

Release 2.15.0 of Log4j
-----BEGIN PGP SIGNATURE-----
target c30a1398a6697fb832c650870c44284d0052103e
2021-12-09T11:24:32-07:00 Ralph Goers <rgoers@apache.org>
[maven-release-plugin] prepare release log4j-2.15.0-rc2
rel/2.16.0 tag=70638718e0db900552c062b98956a05409d70058 target=cffe58f6a433ea1ab60ceb129d4c9b3377acda1d 2021-12-13T10:58:39-06:00 Matt Sicker <boards@gmail.com> | Release 2.16.0 of Log4j
object cffe58f6a433ea1ab60ceb129d4c9b3377acda1d
type commit
tag rel/2.16.0
tagger Matt Sicker <boards@gmail.com> 1639414719 -0600

Release 2.16.0 of Log4j
-----BEGIN PGP SIGNATURE-----
target cffe58f6a433ea1ab60ceb129d4c9b3377acda1d
2021-12-12T23:40:13-06:00 Matt Sicker <boards@gmail.com>
[maven-release-plugin] prepare release log4j-2.16.0-rc1
rel/2.17.0 tag=8285c82d998164dccfb2e57889b9dfb73dc27533 target=a19ef9bceeaad862cfc0b50394a7f791d5e17b8c 2021-12-18T09:14:13-05:00 Gary Gregory <garydgregory@gmail.com> | Release tag for 2.17.0
object a19ef9bceeaad862cfc0b50394a7f791d5e17b8c
type commit
tag rel/2.17.0
tagger Gary Gregory <garydgregory@gmail.com> 1639836853 -0500

Release tag for 2.17.0
-----BEGIN PGP SIGNATURE-----
target a19ef9bceeaad862cfc0b50394a7f791d5e17b8c
2021-12-17T18:56:20-07:00 Ralph Goers <rgoers@apache.org>
[maven-release-plugin] prepare release log4j-2.17.0-rc1
```

## R9 — linux: a merge commit retains a signed mergetag although this clone has no tag refs
```
$ git -C repos/linux show -s --format='%H%n%P%n%aI%n%an <%ae>%n%s' 1200d84f4c0a929a0780180d25063d93773be79c
1200d84f4c0a929a0780180d25063d93773be79c
85cdaca6970028bf6f544c355c90035586836ddf 1304643a1c20badbb91b86a5084dd76cb7620c05
2026-08-18T12:08:13-07:00
Linus Torvalds <torvalds@linux-foundation.org>
Merge tag 'powerpc-7.3-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
```

```
$ git -C repos/linux cat-file commit 1200d84f4c0a929a0780180d25063d93773be79c | awk '/^(mergetag| object | type | tag | tagger | -----BEGIN PGP SIGNATURE-----)/ {print}'; git -C repos/linux rev-parse '1200d84f4c0a929a0780180d25063d93773be79c^2'
mergetag object 1304643a1c20badbb91b86a5084dd76cb7620c05
 type commit
 tag powerpc-7.3-1
 tagger Madhavan Srinivasan <maddy@linux.ibm.com> 1786941438 +0530
 -----BEGIN PGP SIGNATURE-----
1304643a1c20badbb91b86a5084dd76cb7620c05
```

```
$ printf 'tag_refs='; git -C repos/linux for-each-ref refs/tags --format='%(refname)' | wc -l; git -C repos/linux for-each-ref --format='%(refname) %(objecttype) %(objectname)'
tag_refs=0
refs/remotes/origin/master commit 1200d84f4c0a929a0780180d25063d93773be79c
```

## R10 — go: 71,792 reachable commits have no Git signature, and all 491 tags are lightweight
```
$ printf 'all_commits='; git -C repos/go rev-list --all --count; git -C repos/go log --all --format='%G?' | sort | uniq -c; git -C repos/go for-each-ref refs/tags --format='%(objecttype)' | sort | uniq -c; printf 'tag_refs='; git -C repos/go for-each-ref refs/tags --format='%(refname)' | wc -l
all_commits=71792
  71792 N
    491 commit
tag_refs=491
```

```
$ git -C repos/go for-each-ref refs/tags/weekly.2009-11-06 refs/tags/go1.27rc3 --format='%(refname:short) %(objecttype) %(objectname) %(creatordate:iso-strict) %(authorname) %(authoremail) | %(subject)'; git -C repos/go tag -v go1.27rc3; echo verify_exit=$?
go1.27rc3 commit 90cf2c38605cf6514cc395c9d94688c1154ffcda 2026-08-13T10:38:53-07:00 Gopher Robot <gobot@golang.org> | [release-branch.go1.27] go1.27rc3
weekly.2009-11-06 commit 9ad14c94db182dd3326e4c80053e0311f47700ce 2009-11-06T10:33:46-08:00 Russ Cox <rsc@golang.org> | expand "this is not just mercurial" section
error: go1.27rc3: cannot verify a non-tag object of type commit.
verify_exit=1
```

## R11 — cpython: tag object 2.0 was made in 2017 for a branch closed in 2011
```
$ git -C repos/cpython cat-file -t 1f73a4e1379223ff2e9a8fbed0a62222b6d0eda5; git -C repos/cpython cat-file -p 1f73a4e1379223ff2e9a8fbed0a62222b6d0eda5 | sed -n '1,6p;/^-----BEGIN PGP SIGNATURE-----$/p'; TZ=Etc/GMT+4 date --date=@1497830728 '+tagger_time=%Y-%m-%dT%H:%M:%S%z'
tag
object 2a9b0a93091b9ef7350a94bb3d3f1c43725b7a8c
type commit
tag 2.0
tagger Ned Deily <nad@python.org> 1497830728 -0400

Final head of the former 2.0 branch
-----BEGIN PGP SIGNATURE-----
tagger_time=2017-06-18T20:05:28-0400
```

```
$ git -C repos/cpython show -s --format='%H%n%aI%n%an <%ae>%n%s' 2a9b0a93091b9ef7350a94bb3d3f1c43725b7a8c; if git -C repos/cpython merge-base --is-ancestor 2a9b0a93091b9ef7350a94bb3d3f1c43725b7a8c af49df919dafc3767ae956767dce0482f9cd6d4e; then echo tag_target_ancestor_of_main=yes; else echo tag_target_ancestor_of_main=no; fi; if git -C repos/cpython show-ref --verify --quiet refs/tags/2.0; then echo 'refs/tags/2.0=present'; else echo 'refs/tags/2.0=absent (tag object retained by object ID)'; fi
2a9b0a93091b9ef7350a94bb3d3f1c43725b7a8c
2011-03-05T14:54:19+01:00
Georg Brandl <georg@python.org>
Close 2.0 branch.
tag_target_ancestor_of_main=no
refs/tags/2.0=absent (tag object retained by object ID)
```

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

codex
The receipts gate is catching more than the two warned phrases. The draft repeatedly upgrades “PGP material exists” into verified identity or cryptographic success; I’m separating those from ordinary craft cuts so the must-fix list stays a true gate.
exec
/bin/bash -lc "nl -ba chapters/18-signatures.fable.md | sed -n '1,260p'; awk '/"'^## Receipts/{exit} {print}'"' chapters/18-signatures.fable.md | wc -w; rg -n '<"'!-- CHECK:|signed|signature|forged|true|flawless|Delete that tag|byte-for-byte|hundreds of miles|standard clone|deliberately|worst|entire|exactly|every|zero|491|71,792|201[0-9]|202[0-9]'"' chapters/18-signatures.fable.md" in /home/diablo/book16
 succeeded in 196ms:
     1	# error: no signature found
     2	
     3	*This is the full dig — every command, every receipt. The plain-English telling of the same story
     4	is here: [error: no signature found](18-signatures.html).*
     5	
     6	In April 2014, the OpenSSL project shipped the most anxiously awaited release in its history —
     7	version 1.0.1g, the one that closed the Heartbleed hole while half the internet's servers stood
     8	bleeding. <!-- CHECK: Heartbleed = CVE-2014-0160, disclosed 2014-04-07; OpenSSL 1.0.1g was the
     9	fix release; needs external source for the name and disclosure date. --> Ask git today to verify
    10	the cryptographic signature on that release's tag — the tag cut by the cryptography project, at
    11	the height of the worst cryptographic emergency it would ever have — and here is the complete
    12	answer [R1]:
    13	
    14	```console
    15	$ git -C repos/openssl tag -v OpenSSL_1_0_1g
    16	object b2d951e4232d2f90168f9a3dd0b7df9ecf2d81a8
    17	type commit
    18	tag OpenSSL_1_0_1g
    19	tagger Dr. Stephen Henson <steve@openssl.org> 1396889744 +0100
    20	
    21	OpenSSL 1.0.1g release tag
    22	error: no signature found
    23	```
    24	
    25	The release that repaired the internet's encryption is not signed. Not badly signed, not signed
    26	with an expired key — *not signed*. And almost nobody has ever noticed, because almost nobody
    27	ever asks. This chapter is about the asking: one small command, `git cat-file -p` pointed at a
    28	tag, and the strange, human things it turns up in the places software is supposed to be at its
    29	most ceremonial. Releases are where projects put on their dress uniform. The tag object is where
    30	you find out what the uniform actually covers.
    31	
    32	## Four lines and a promise
    33	
    34	First, the anatomy, because the entire chapter lives inside one distinction most working
    35	engineers have never had a reason to make.
    36	
    37	A tag most people meet is just a bookmark — a name pointing at a commit. But git also has the
    38	*annotated* tag: a real object in the database, with its own four-line header — what it points
    39	at, its name, who made it, when — plus a message. And optionally, at the bottom, a block of PGP
    40	armor: a cryptographic signature over everything above it. Here is the trap hiding in plain
    41	sight: **annotated is not signed.** The four lines and the ceremony are present either way. The
    42	tagger's name is right there, official-looking, in both cases. The only difference between "a
    43	release solemnly attested by its maintainer" and "a note anyone could have typed" is whether the
    44	signature block exists at the bottom — and nothing in daily git usage ever shows you the bottom.
    45	`git tag -v` is the question; the OpenSSL answer above is what asking sounds like when the
    46	answer is no.
    47	
    48	Look at the timestamps around that unsigned tag, because the record is gentle with the man who
    49	cut it. The bounds-check fix that closed Heartbleed is authored by the same Stephen Henson at
    50	00:51 in the morning of April 6th [R2]. The release prep lands the evening of April 7th; the tag
    51	follows minutes later [R1, R2]. This is a man in the middle of the worst week of his professional
    52	life, shipping the fix the entire world is refreshing its browser for. The signature is the step
    53	that protects against an adversary nobody was thinking about that day, and it is precisely the
    54	kind of step that evaporates under pressure — ceremony always yields to urgency. The record
    55	even shows the lesson landing, eventually: two years later, the project's release tags carry
    56	signature blocks [R2]. The habit arrived. It arrived *after* the emergency that most needed it,
    57	which is the way habits usually arrive.
    58	
    59	## The signature that told the truth
    60	
    61	Now the inversion, and it is the reason this chapter exists. Ten years later, in the spring of
    62	2024, the xz-utils compression library shipped the most notorious poisoned releases in the
    63	history of open source — versions 5.6.0 and 5.6.1, carrying a backdoor aimed at the servers of
    64	the world. <!-- CHECK: xz 5.6.0/5.6.1 carried the CVE-2024-3094 backdoor, delivered via the
    65	release tarball's build-to-host.m4; needs external source. --> Read those release tags the way we
    66	just read OpenSSL's [R3]:
    67	
    68	```console
    69	$ git -C repos/xz cat-file -p refs/tags/v5.6.0
    70	object 2d7d862e3ffa8cec4fd3fdffcd84e984a17aa429
    71	type commit
    72	tag v5.6.0
    73	tagger Jia Tan <jiat0218@gmail.com> 1708762926 +0800
    74	
    75	XZ Utils 5.6.0
    76	-----BEGIN PGP SIGNATURE-----
    77	```
    78	
    79	There it is — the block the crisis-stricken OpenSSL release lacked. The attacker signed his
    80	work. Jia Tan, the manufactured persona who spent two years becoming this project's
    81	co-maintainer, cut both poisoned release tags with full cryptographic ceremony [R3]. If your
    82	threat model was "an unsigned release is suspicious, a signed release is safe," the most
    83	dangerous release of the decade sails straight through, pennants flying.
    84	
    85	Because here is what the signature actually covers, and the receipts let us say it with
    86	precision. A signed tag attests to one thing: a tree — a specific snapshot of files, named by
    87	hash in the tag's first line. Ask git whether the backdoor's delivery vehicle, a build file
    88	called `m4/build-to-host.m4`, is *in* the tree that signature names [R4]:
    89	
    90	```console
    91	$ git -C repos/xz cat-file -e 'v5.6.0^{tree}:m4/build-to-host.m4' || echo absent
    92	v5.6.0 m4/build-to-host.m4=absent
    93	```
    94	
    95	Absent. Across the entire repository, every branch, all of history: that file has been modified
    96	in exactly zero commits [R4]. It never existed in git. It existed only in the release *tarball*
    97	— the bundled download that installers actually consume, which is built from the tree and then,
    98	in the gap between tree and bundle, had the poisoned file added. The signature was not forged.
    99	The signature was *true*. It faithfully attested a clean tree, and the weapon rode along in the
   100	part of the shipment no signature named. Nine days before the first poisoned release, the same
   101	hands had added one line to the repository — `build-to-host.m4` in git's ignore file [R4] — so
   102	that if the weapon's carrier ever appeared on a developer's disk, git would decline to mention
   103	it.
   104	
   105	Say the lesson plainly, because it is the sharpest one in this chapter: *a signature is an answer
   106	to exactly one question — was this tree the one attested? It says nothing about what got shipped
   107	under the tree's name.* The OpenSSL story and the xz story are the same lesson from opposite
   108	directions. One release protected the world and carried no attestation; the other carried a
   109	flawless attestation and attacked the world. The ceremony and the safety are simply not the same
   110	axis, and every intuition that treats them as one axis is exploitable.
   111	
   112	## The fix only a tag remembers
   113	
   114	The third specimen looks like trivia and turns out to be about what "history" means. In March
   115	2011, Bitcoin's then-lead maintainer Gavin Andresen cut a signed tag whose message does not
   116	bother with ceremony [R5]:
   117	
   118	```console
   119	$ git -C repos/bitcoin cat-file -p refs/tags/v0.3.20.2
   120	object 52248a757b25581339ca6e00cc0da05bfdb04dc8
   121	type commit
   122	tag v0.3.20.2
   123	tagger Gavin Andresen <gavinandresen@gmail.com> 1299250125 -0500
   124	
   125	critical bug-fix release (block download failures due to too-small sendbuffer)
   126	-----BEGIN PGP SIGNATURE-----
   127	```
   128	
   129	A critical fix, for software that was, by then, minting real money. Now ask the obvious
   130	follow-up: is that commit an ancestor of today's Bitcoin? No [R6]. The commit the tag signs is
   131	reachable from exactly one ref in the entire repository — the tag itself [R6]. Delete that tag
   132	and the critical fix of March 2011 vanishes from the project's reachable history entirely.
   133	
   134	It gets stranger. Today's main history *does* contain that fix — same author, same date, same
   135	subject line, and `git patch-id` proves the diffs are byte-for-byte-equivalent — under a
   136	completely different commit hash [R6]. Somewhere in the project's early, chaotic era of
   137	conversions and reshuffles, the line of history was rebuilt, and the rebuilt twin went forward
   138	while the original — the one with the signature on it — was left standing off to the side like a
   139	demolished building's doorway. The tag is not decoration on history. The tag is the only
   140	*witness* to a version of history the branches abandoned. If you have ever assumed "everything
   141	important is reachable from main," here is a signed critical release, in one of the most scrutinized
   142	repositories on earth, telling you otherwise.
   143	
   144	And tags carry the mundane too, which is its own calibration. Seven years later the same
   145	maintainer signed a tag named `noversion`, planted on a 2014 commit, whose message explains in
   146	plain words that it exists to trick `git describe` into producing sensible output [R7] — a
   147	signed, ceremonial object whose entire purpose is plumbing. Tag objects are not a sacred
   148	registry. They are a workbench, and reading them tells you which kind of object you are holding.
   149	
   150	## Three hands in eight days
   151	
   152	The last specimen turns tag headers into a staffing chart. December 2021: the Log4Shell
   153	emergency, the logging library on fire, and three patch releases in eight days.
   154	<!-- CHECK: Log4Shell = CVE-2021-44228, disclosed 2021-12-09/10; 2.15.0/2.16.0/2.17.0 were the
   155	emergency response releases; needs external source. --> Read the three release tags in a row —
   156	just the tagger lines [R8]:
   157	
   158	```console
   159	$ ... rel/2.15.0  tagger Ralph Goers  2021-12-10T23:20:33-07:00
   160	$ ... rel/2.16.0  tagger Matt Sicker  2021-12-13T10:58:39-06:00
   161	$ ... rel/2.17.0  tagger Gary Gregory 2021-12-18T09:14:13-05:00
   162	```
   163	
   164	Three releases, three different human beings, three different time zones. The first tag is cut
   165	at 11:20 on a Friday night by Ralph Goers — the volunteer maintainer whose name is all over the
   166	crisis commits. The second, three days later, is cut by someone else. The third, five days after
   167	that, by a third person — and the release-prep commit it points to was authored by *Goers*, the
   168	night before, in a different time zone than the tag that shipped it [R8]. Author and tagger on
   169	the same release: two different people, hundreds of miles and one exhausted night apart.
   170	
   171	Nothing in any changelog records this, but the tag objects do: a relay team. The emergency ran
   172	longer than any one volunteer could, and the releases were handed from hand to hand — you can
   173	watch the baton pass in the `tagger` field. When people say the open-source infrastructure of
   174	the world runs on a handful of tired humans, this is what the claim looks like in primary
   175	sources: three signatures, eight days, three names for one burning project.
   176	
   177	## The field, briefly
   178	
   179	Once you start reading tag objects you find the whole spectrum of institutional character. Go —
   180	Google's language, with corporate release engineering — has *zero* git signatures across all
   181	71,792 commits, and every one of its 491 tags is lightweight: ask `git tag -v` and it refuses,
   182	"cannot verify a non-tag object" [R10]. An entire ecosystem's trust placed deliberately outside
   183	git — no ceremony at all, by policy. The Linux kernel keeps signatures in a place almost nobody
   184	looks: when Linus merges a maintainer's signed tag, the tag's full signature is embalmed inside
   185	the merge commit itself — a `mergetag` block — so the attestation survives even though, in a
   186	standard clone, the tag ref no longer exists at all [R9]. And CPython's tag `2.0` was created in
   187	2017 — by a tagger whose header honestly says so — pointing back at a branch closed in 2011
   188	[R11]: a museum label, added when the museum was reorganized, its target no longer on the main
   189	line at all. None of these is a scandal. Each is a project's character, printed in a place
   190	nobody thinks to look because everybody assumes it is boring.
   191	
   192	## At home
   193	
   194	The habit costs ten seconds. Next time you rely on a release tag — before you build from it,
   195	before you cite it, before you trust it — read the object instead of the ref:
   196	
   197	```console
   198	$ git cat-file -p $(git rev-parse v1.2.3)
   199	```
   200	
   201	Four lines and maybe a signature block. Check three things against your assumptions. Who is the
   202	tagger, and is that who you thought stood behind this release? Is there a `-----BEGIN PGP
   203	SIGNATURE-----` at the bottom — and remember the tag can be annotated, official, and ceremonial
   204	with nothing at the bottom at all? And is the object it names actually an ancestor of what you
   205	are running (`git merge-base --is-ancestor <tag>^{commit} HEAD`)? Then, if the answer matters —
   206	if this tag is how you decide what to install — take the xz lesson all the way: the signature
   207	covers a tree, so compare the tree against the artifact you actually consume. `git archive` the
   208	tag, diff it against the tarball, and stare hard at anything the tarball has that the tree does
   209	not. That gap is boring scaffolding in ten thousand projects, and in one project it was the
   210	worst supply-chain attack ever shipped. The signature will not look there for you. Nothing looks
   211	there for you. That is why it is the place to look.
   212	
   213	## Receipts
   214	
   215	- **R1** `git -C repos/openssl cat-file -p refs/tags/OpenSSL_1_0_1g` + `git tag -v` — annotated tag, tagger Dr. Stephen Henson, 2014-04-07; `error: no signature found`.
   216	- **R2** `git -C repos/openssl show -s ... 96db9023b881...` + `merge-base --is-ancestor` + `cat-file -p refs/tags/OpenSSL_1_1_0-pre6` — the bounds-check fix (authored 2014-04-06T00:51) is an ancestor of the 1.0.1g release commit; the 2016 pre6 tag carries a PGP block (tagger Matt Caswell).
   217	- **R3** `git -C repos/xz cat-file -p refs/tags/v5.6.0` and `v5.6.1` — both poisoned-release tags carry PGP signature blocks, tagger Jia Tan, 2024-02/03.
   218	- **R4** `git -C repos/xz cat-file -e 'v5.6.0^{tree}:m4/build-to-host.m4'` (absent, both tags) + `log --all -- m4/build-to-host.m4` (zero commits) + `log -S 'build-to-host.m4' -- m4/.gitignore` — the signed trees omit the payload path; the ignore-list line is Jia Tan's, 2024-02-15.
   219	- **R5** `git -C repos/bitcoin cat-file -p refs/tags/v0.3.20.2` — signed tag, tagger Gavin Andresen, 2011-03: "critical bug-fix release"; target `52248a757b...`.
   220	- **R6** `merge-base --is-ancestor` (no) + `for-each-ref --contains` (only the tag) + `git patch-id --stable` — the signed commit is outside HEAD's history; HEAD carries a patch-identical twin `f36b494aeb...` under a different hash.
   221	- **R7** `git -C repos/bitcoin cat-file -p refs/tags/noversion` — signed 2018 tag by Wladimir J. van der Laan on a 2014 commit: "dummy tag ... so that git describe no longer shows everything relative to v0.9.0rc2."
   222	- **R8** `for-each-ref` + `cat-file -p` on `rel/2.15.0`, `rel/2.16.0`, `rel/2.17.0` — three PGP-bearing tags in eight days of December 2021; taggers Ralph Goers, Matt Sicker, Gary Gregory; 2.17.0's target commit authored by Goers, tagged by Gregory.
   223	- **R9** `git -C repos/linux cat-file commit 1200d84f4c0a...` — a 2026 Linus merge embeds a signed `mergetag` (powerpc-7.3-1, tagger Madhavan Srinivasan) while the clone has zero tag refs.
   224	- **R10** `git -C repos/go rev-list --all --count` + `log --all --format='%G?'` + `for-each-ref refs/tags` — 71,792 commits, all unsigned (`N`); 491 tags, all lightweight; `git tag -v go1.27rc3` refuses: "cannot verify a non-tag object."
   225	- **R11** `git -C repos/cpython cat-file -p 1f73a4e13792...` — tag `2.0`, tagger Ned Deily 2017-06-18, target Georg Brandl's 2011 "Close 2.0 branch" commit; target not an ancestor of main; tag ref absent in this clone, object retained.
2099
1:# error: no signature found
3:*This is the full dig — every command, every receipt. The plain-English telling of the same story
4:is here: [error: no signature found](18-signatures.html).*
6:In April 2014, the OpenSSL project shipped the most anxiously awaited release in its history —
8:bleeding. <!-- CHECK: Heartbleed = CVE-2014-0160, disclosed 2014-04-07; OpenSSL 1.0.1g was the
10:the cryptographic signature on that release's tag — the tag cut by the cryptography project, at
11:the height of the worst cryptographic emergency it would ever have — and here is the complete
22:error: no signature found
25:The release that repaired the internet's encryption is not signed. Not badly signed, not signed
26:with an expired key — *not signed*. And almost nobody has ever noticed, because almost nobody
34:First, the anatomy, because the entire chapter lives inside one distinction most working
40:armor: a cryptographic signature over everything above it. Here is the trap hiding in plain
41:sight: **annotated is not signed.** The four lines and the ceremony are present either way. The
44:signature block exists at the bottom — and nothing in daily git usage ever shows you the bottom.
48:Look at the timestamps around that unsigned tag, because the record is gentle with the man who
51:follows minutes later [R1, R2]. This is a man in the middle of the worst week of his professional
52:life, shipping the fix the entire world is refreshing its browser for. The signature is the step
56:signature blocks [R2]. The habit arrived. It arrived *after* the emergency that most needed it,
59:## The signature that told the truth
62:2024, the xz-utils compression library shipped the most notorious poisoned releases in the
64:the world. <!-- CHECK: xz 5.6.0/5.6.1 carried the CVE-2024-3094 backdoor, delivered via the
79:There it is — the block the crisis-stricken OpenSSL release lacked. The attacker signed his
82:threat model was "an unsigned release is suspicious, a signed release is safe," the most
85:Because here is what the signature actually covers, and the receipts let us say it with
86:precision. A signed tag attests to one thing: a tree — a specific snapshot of files, named by
88:called `m4/build-to-host.m4`, is *in* the tree that signature names [R4]:
95:Absent. Across the entire repository, every branch, all of history: that file has been modified
96:in exactly zero commits [R4]. It never existed in git. It existed only in the release *tarball*
98:in the gap between tree and bundle, had the poisoned file added. The signature was not forged.
99:The signature was *true*. It faithfully attested a clean tree, and the weapon rode along in the
100:part of the shipment no signature named. Nine days before the first poisoned release, the same
105:Say the lesson plainly, because it is the sharpest one in this chapter: *a signature is an answer
106:to exactly one question — was this tree the one attested? It says nothing about what got shipped
109:flawless attestation and attacked the world. The ceremony and the safety are simply not the same
110:axis, and every intuition that treats them as one axis is exploitable.
115:2011, Bitcoin's then-lead maintainer Gavin Andresen cut a signed tag whose message does not
131:reachable from exactly one ref in the entire repository — the tag itself [R6]. Delete that tag
132:and the critical fix of March 2011 vanishes from the project's reachable history entirely.
135:subject line, and `git patch-id` proves the diffs are byte-for-byte-equivalent — under a
138:while the original — the one with the signature on it — was left standing off to the side like a
140:*witness* to a version of history the branches abandoned. If you have ever assumed "everything
141:important is reachable from main," here is a signed critical release, in one of the most scrutinized
145:maintainer signed a tag named `noversion`, planted on a 2014 commit, whose message explains in
147:signed, ceremonial object whose entire purpose is plumbing. Tag objects are not a sacred
152:The last specimen turns tag headers into a staffing chart. December 2021: the Log4Shell
154:<!-- CHECK: Log4Shell = CVE-2021-44228, disclosed 2021-12-09/10; 2.15.0/2.16.0/2.17.0 were the
159:$ ... rel/2.15.0  tagger Ralph Goers  2021-12-10T23:20:33-07:00
160:$ ... rel/2.16.0  tagger Matt Sicker  2021-12-13T10:58:39-06:00
161:$ ... rel/2.17.0  tagger Gary Gregory 2021-12-18T09:14:13-05:00
169:the same release: two different people, hundreds of miles and one exhausted night apart.
175:sources: three signatures, eight days, three names for one burning project.
180:Google's language, with corporate release engineering — has *zero* git signatures across all
181:71,792 commits, and every one of its 491 tags is lightweight: ask `git tag -v` and it refuses,
182:"cannot verify a non-tag object" [R10]. An entire ecosystem's trust placed deliberately outside
183:git — no ceremony at all, by policy. The Linux kernel keeps signatures in a place almost nobody
184:looks: when Linus merges a maintainer's signed tag, the tag's full signature is embalmed inside
186:standard clone, the tag ref no longer exists at all [R9]. And CPython's tag `2.0` was created in
187:2017 — by a tagger whose header honestly says so — pointing back at a branch closed in 2011
190:nobody thinks to look because everybody assumes it is boring.
201:Four lines and maybe a signature block. Check three things against your assumptions. Who is the
206:if this tag is how you decide what to install — take the xz lesson all the way: the signature
210:worst supply-chain attack ever shipped. The signature will not look there for you. Nothing looks
215:- **R1** `git -C repos/openssl cat-file -p refs/tags/OpenSSL_1_0_1g` + `git tag -v` — annotated tag, tagger Dr. Stephen Henson, 2014-04-07; `error: no signature found`.
216:- **R2** `git -C repos/openssl show -s ... 96db9023b881...` + `merge-base --is-ancestor` + `cat-file -p refs/tags/OpenSSL_1_1_0-pre6` — the bounds-check fix (authored 2014-04-06T00:51) is an ancestor of the 1.0.1g release commit; the 2016 pre6 tag carries a PGP block (tagger Matt Caswell).
217:- **R3** `git -C repos/xz cat-file -p refs/tags/v5.6.0` and `v5.6.1` — both poisoned-release tags carry PGP signature blocks, tagger Jia Tan, 2024-02/03.
218:- **R4** `git -C repos/xz cat-file -e 'v5.6.0^{tree}:m4/build-to-host.m4'` (absent, both tags) + `log --all -- m4/build-to-host.m4` (zero commits) + `log -S 'build-to-host.m4' -- m4/.gitignore` — the signed trees omit the payload path; the ignore-list line is Jia Tan's, 2024-02-15.
219:- **R5** `git -C repos/bitcoin cat-file -p refs/tags/v0.3.20.2` — signed tag, tagger Gavin Andresen, 2011-03: "critical bug-fix release"; target `52248a757b...`.
220:- **R6** `merge-base --is-ancestor` (no) + `for-each-ref --contains` (only the tag) + `git patch-id --stable` — the signed commit is outside HEAD's history; HEAD carries a patch-identical twin `f36b494aeb...` under a different hash.
221:- **R7** `git -C repos/bitcoin cat-file -p refs/tags/noversion` — signed 2018 tag by Wladimir J. van der Laan on a 2014 commit: "dummy tag ... so that git describe no longer shows everything relative to v0.9.0rc2."
222:- **R8** `for-each-ref` + `cat-file -p` on `rel/2.15.0`, `rel/2.16.0`, `rel/2.17.0` — three PGP-bearing tags in eight days of December 2021; taggers Ralph Goers, Matt Sicker, Gary Gregory; 2.17.0's target commit authored by Goers, tagged by Gregory.
223:- **R9** `git -C repos/linux cat-file commit 1200d84f4c0a...` — a 2026 Linus merge embeds a signed `mergetag` (powerpc-7.3-1, tagger Madhavan Srinivasan) while the clone has zero tag refs.
224:- **R10** `git -C repos/go rev-list --all --count` + `log --all --format='%G?'` + `for-each-ref refs/tags` — 71,792 commits, all unsigned (`N`); 491 tags, all lightweight; `git tag -v go1.27rc3` refuses: "cannot verify a non-tag object."
225:- **R11** `git -C repos/cpython cat-file -p 1f73a4e13792...` — tag `2.0`, tagger Ned Deily 2017-06-18, target Georg Brandl's 2011 "Close 2.0 branch" commit; target not an ancestor of main; tag ref absent in this clone, object retained.

exec
/bin/bash -lc 'for f in chapters/*.md; do head -n 1 "$f"; done | sort -u; rg -n "xz|build-to-host|Jia Tan|signature|tarball" chapters/04-* chapters/01-* 2>/dev/null | head -n 120' in /home/diablo/book16
 succeeded in 467ms:
# A flag with 8 commits
# As discussed
# Ch.01 craft-review synthesis (grok + agy + codex)
# Craft Review: Blame, Chapter 12 (php.fable)
# Craft Review: Chapter 01 - Debian OpenSSL
# Craft Review: Chapter 04 (xz)
# Craft Review: Chapters 02 and 03
# Craft review — Chapter 15, “THIS IS A HACK TO GET V4 OUT THE DOOR”
# Craft review — ch. 06 (Initial revision) and ch. 07 (The current maintainer)
# Craft review — “Remove promises”
# Craft review: Chapter 4, “One character”
# Craft review: Chapters 2 and 3
# Craft review: “As discussed”
# Craft review: “Fix typo”
# Craft review: “Giving 0 losses”
# Craft review: “Initial revision”
# Craft review: “Magically fixes all errors”
# Craft review: “Nothing much to see here”
# Craft review: “One character”
# Craft review: “Remove Dual EC DRBG again...”
# Craft review: “Remove promises”
# Craft review: “THIS IS A HACK TO GET V4 OUT THE DOOR”
# Craft review: “The current maintainer”
# Craft review: “The nine minutes”
# Craft review: “The verb that arrived late” and “A flag with 8 commits”
# Craft review: “add flat map”
# Craft review: “empty commit to trigger a github mirror”
# Editorial review — Chapter 14, “Remove Dual EC DRBG again...”
# Fix typo
# Fixed once (badly) by me eleven years ago
# Giving 0 losses
# Initial revision
# Magically fixes all errors
# Nothing much to see here
# One character
# Receipts — ch. 01 Debian OpenSSL (CVE-2008-0166)
# Receipts — ch. 02 log4j2 (Log4Shell, CVE-2021-44228)
# Receipts — ch. 03 bitcoin (the contributor named --author=Satoshi)
# Receipts — ch. 04 xz (Jia Tan, CVE-2024-3094)
# Receipts — ch. 05 git (the 01:10 hash flip)
# Receipts — ch. 06 the genesis lie (cross-repo)
# Receipts — ch. 07 vim (the last 32 hours and the succession)
# Receipts — ch. 08 the corporate costume (cross-repo)
# Receipts — ch. 09 the npm sabotage pair (event-stream + colors)
# Receipts — ch. 10 tensor2tensor (the Transformer's repository)
# Receipts — ch. 11 ffmpeg (the fork war)
# Receipts — ch. 12 php-src (the zerodium backdoor)
# Receipts — ch. 13 nodejs/node (the deletions the history unmade)
# Receipts — ch. 14 openssl (the Dual EC remove/revert/remove)
# Receipts — ch. 15 postgres (the refusals of Tom Lane)
# Receipts — ch. 16 the empty commit (cross-repo)
# Receipts — ch. 18 signature and tag-object archaeology (cross-repo)
# Receipts — ch. 19 OpenTTD (the `320` creed-revert)
# Receipts — source 17 Dirty COW (the eleven-year COW race)
# Remove Dual EC DRBG again...
# Remove promises
# THIS IS A HACK TO GET V4 OUT THE DOOR
# The current maintainer
# The nine minutes
# To improve performance
# add flat map
# empty commit to trigger a github mirror
# error: no signature found
**CRAFT REVIEW: 13-node.fable.md**
**Structure & Pacing**
**Title:**
Error: permission check failed for read_file "/home/diablo/book16/chapters/19-openttd.fable.md": user denied permission for read_file(/home/diablo/book16/chapters/19-openttd.fable.md)
Here is my craft review of "Blame", Chapter 16. 
Here is my craft review of Chapter 11, strictly judging the narrative machinery, structure, and prose.
Here is my craft review.
Here is the craft review for chapter 15, "Postgres." 
Here is the craft review of the `14-openssl.fable.md` draft.
Here is the craft review of your two draft chapters. I’ve written this to `chapters/0203-agy-review.md` and also printed it below for you.
I have read the draft and the rules, and I've written a detailed craft review focusing on structure, prose, and pacing. The review has been saved to [01-agy-review.md](file:///home/diablo/book16/chapters/01-agy-review.md). 
I have read the draft and the surrounding materials. I've written the full craft review to [04-agy-review.md](file:///home/diablo/book16/chapters/04-agy-review.md) as requested. Here is the review:
I'll read the chapter draft, receipts, CONTEXT, and TEMPLATE first so the review is grounded in the locked facts and book conventions.The code-review skill doesn't apply here — this is a literary gate. Next I’ll load the chapter, receipts, and book conventions.I'll pull the receipts, the published xz chapter, and nearby reviews so every claim and overlap can be checked against the locked spine.Existing reviews and the contents page are next — I want the house style for gates, plus how this title would sit next to the others.I'll finish the receipts walk and sample a prior chapter review so the gate list matches the house format.You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
I'll read the chapter, CONTEXT, and TEMPLATE first so the review can judge craft against the book's actual spine.I’ll read prior chapter openings, existing reviews, and the template’s beats so the craft notes sit against the book’s actual voice, not a generic essay.I’ll match this review to the book’s existing grok-review voice, then read the prompt, chapter 12’s close, and a couple of shipped At homes.I have the spine, the consecutive-open constraint, and the rooms the word count is missing. Writing the craft review to disk now.Craft review is in `chapters/13-grok-review.md`. Facts and hashes were left alone.
I'll read the draft chapter plus CONTEXT.md and TEMPLATE.md so the review stays inside the book's voice, constraints, and the Dual EC causal boundary.I'll read the shipped chapters' openings and any prior reviews so this one is judged in sequence, not in isolation.I'll read the review prompt, adjacent chapters, and a few prior grok reviews so the write-up matches house style.I'll pull the rest of the recent grok reviews and how the book uses the `~` beat, so this review matches the series.I have the hedge, the overclaims, and the consecutive-open picture. Next I’ll write the ranked craft review to disk.Craft review is in `chapters/14-grok-review.md`. The bones are right; the chapter still spends them as a backdoor compliance put back, which is the headline the scout already failed.
I'll read the draft chapter, book context, and template first so the craft review is grounded in the series, not just this file.I have the draft. Next I’ll read the neighboring chapters and any existing review format so this one stays in the book’s register.I’ll sit with the adjacent chapters, a full house-style review, and the draft’s openings and rooms so the notes can be specific.I have the diagnosis: the objects are new; the doorway and the scale-fade spend them as a maintainer biography. Writing the craft review next.Craft review is in `chapters/15-grok-review.md`. Facts, hashes, and commands were left locked.
I'll read the draft, receipts, and book context first, then check every hash, quote, and claim against the factual gate.I'll pull the postgres chapter and scout notes next so I can judge distinctness and check every claim against receipts.I'll check the review prompt, postgres chapter, scout reports, and the CHANCE16 / migration claims next.I have the prompt and spine; next I’ll verify word count, CHANCE16, the function-migration claim, and the remaining factual edges.# Making numbers look nice
I'll read the draft, receipts, and book context first, then gate every hash, date, quote, and craft risk against the locked spine.Next I’ll read the draft and receipts side by side so every quoted hash, date, and line can be gated.You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
I'll start by reading the chapter, CONTEXT, and TEMPLATE so the review is grounded in the book's house style rather than a generic edit.The chapter is in. Next I’ll read the shipped sabotage chapter and prior reviews so this one can be judged against the book, not against a generic essay.I have the house-style reviews and xz. Next I’ll check openings, first person, At home, and the three pull-quotes against the rest of the book.I have the diagnosis: the bones earn a second sabotage chapter, but the first half is still wearing xz’s sentences. I’ll write the craft review to `chapters/09-grok-review.md`.Craft review is in `chapters/09-grok-review.md`.
I'll start by reading the chapter, CONTEXT, and TEMPLATE so the review is grounded in the draft's actual beats rather than a generic edit.The review skill is for code PRs; this is a literary craft pass. Next I’ll read the chapter and the existing reviews so the notes match the book’s voice.I’ll match the book’s review format and check consecutive chapter openings so the notes sit in the actual sequence.I have the review template. Next I’ll count the body, check consecutive openings, and walk every Twitter paragraph for sneer.I have the beats, the section weights, and the Twitter tone problems. Next I’ll write the craft review to the chapter file.The craft review is in `chapters/08-grok-review.md`. Facts, hashes, and commands were left alone.
I'll start by reading the chapter, CONTEXT.md, and TEMPLATE.md so the review is grounded in the book's voice and the locked facts.I’ll pull shipped chapters and earlier reviews next so the voice, beats, and neutrality bar match the rest of the book.I’ll count the body, check the chapter-10 open so consecutive openings don’t collide, and sit with the shipped voice before judging neutrality.I have the diagnosis: the objects are the chapter, and the captions keep taking a side. I’ll write the craft review to the chapter file.Craft review is in `chapters/11-grok-review.md`. Facts, hashes, and commands were left untouched.
I'll start by reading the chapter, house context, and template, then look at the two earlier cross-repo chapters so the review judges this one against the book's actual standard.The review skill is for code; this is a craft pass. I'll pull prior chapter reviews and the two earlier cross-repo chapters so the judgment is against the book's own bar.I'll read the review prompt, house-style grok reviews, and the two earlier cross-repo chapters so this judgment sits in the series rather than in isolation.I have the house-review shape. Next I’ll sit with the two earlier cross-repo chapters, consecutive openings, the receipts file, and the draft’s rooms so the notes land on what’s actually new.I have the diagnosis: the taxonomy is real, the doorway spends it, and the Tuesdays are still captions. I’ll write the craft review to disk.The diagnosis is in: the three-way cut is real, the doorway spends it, and the Tuesdays are still captions. Writing the review now.Craft review is in `chapters/16-grok-review.md`. Facts, hashes, and commands were left locked.
I'll start by reading the draft chapter, CONTEXT, and TEMPLATE so the review is grounded in the book's voice and this chapter's spine.I’ll read the shipped chapters and any earlier reviews so this one is judged against the book’s actual voice, not in isolation.The review prompt and a couple of shipped chapters will tell me the house style this draft is being measured against.The chapter-09 review is the house style I should match. Next I’ll read chapter 08 and a couple of openings so the cold-open and fade don’t collide with what’s already shipped.I have the house-review shape. Next I’ll check how chapter 08 handled a multi-story structure, then sit with the draft’s rooms and word count.I have the through-line, the five rooms, and the house-review shape. Writing the craft review next.Craft review is in `chapters/10-grok-review.md`. Facts, hashes, and commands were left untouched.
I'll start by reading the draft chapter, CONTEXT, and TEMPLATE so the review is grounded in this book's voice rather than generic notes.The review skill is for code PRs; this is a literary craft pass. I'll read the draft, the shipped chapters' openings/closes, and any existing review format so the notes match the book.I’ll pull the review prompt, the two sabotage chapters, recent grok reviews, and consecutive openings so the notes sit in the book rather than in isolation.I have the house-review shape. Next I’ll sit with the two sabotage chapters, consecutive openings, and this draft’s rooms so the notes land on what’s actually new.I have the diagnosis: the objects are new; the doorway prosecutes them. I’ll write the craft review to the chapter file.Craft review is in `chapters/12-grok-review.md`. Facts, hashes, and commands were left untouched.
Reading additional input from stdin...
This chapter hits the "joyful" register perfectly. It reads like a heist movie where the bank vault is just the author's own bad code, and there are no victims—just the exhilaration of watching a foundational piece of modern software being duct-taped together at one in the morning. 
This is a sharp, beautifully observed piece of archaeology. The through-line—that the repository is just a projection, and the *real* specification is the weights—is one of the strongest thematic spines in the book. The juxtaposition of the 2017 ruling (correctness wins because it's cheap) against the 2019 ruling (compatibility wins because the weights have cemented the bug) is the philosophical core. 
This is a strong, tightly controlled chapter. Handling three separate repositories could easily spiral into a listicle, but the conceptual through-line—the contents of the history versus the wrapping on the box—holds them together perfectly. The order of escalation works: MS-DOS introduces the mechanics of forged metadata, Twitter raises the stakes to a corporate cover-up, and Swift resolves the tension as a case of genuine, redemptive history (that still bears the fingerprints of lawyers). 
You are a sharp literary editor reviewing TWO draft chapters of a nonfiction book called "Blame" —
You are a sharp literary editor reviewing one draft chapter of "Blame" — git archaeology; narrator
You are a sharp literary editor reviewing one draft chapter of a nonfiction book called
jetski: no output produced — a tool required the "command" permission that headless mode cannot prompt for, so it was auto-denied. Add an allow-rule under permissions.allow in settings.json (e.g. command(<target>)). Alternatively, re-run with --dangerously-skip-permissions to auto-approve all tools.
jetski: no output produced — a tool required the "read_file" permission that headless mode cannot prompt for, so it was auto-denied. Add an allow-rule under permissions.allow in settings.json (e.g. read_file(<target>)). Alternatively, re-run with --dangerously-skip-permissions to auto-approve all tools.
chapters/04-xz.receipts.md:1:# Receipts — ch. 04 xz (Jia Tan, CVE-2024-3094)
chapters/04-xz.receipts.md:3:Verbatim outputs against a full clone of https://github.com/tukaani-project/xz.
chapters/04-xz.receipts.md:8:$ git -C repos/xz shortlog -sn --until=2022-01-01 HEAD
chapters/04-xz.receipts.md:16:$ git -C repos/xz log --all --author=jiat75 --reverse --format=%h\ %aI\ %cI\ %an\ \<%ae\>\ \|\ committer=%cn\ \|\ %s
chapters/04-xz.receipts.md:19:0354d6cc 2022-06-13T20:27:03+08:00 2022-06-14T22:03:55+03:00 Jia Tan <jiat75@gmail.com> | committer=Lasse Collin | Added vli tests to .gitignore
chapters/04-xz.receipts.md:24:$ git -C repos/xz show 692de534fa -- AUTHORS
chapters/04-xz.receipts.md:29:    Add Jia Tan to AUTHORS.
chapters/04-xz.receipts.md:40:+    <lasse.collin@tukaani.org> and Jia Tan <jiat0218@gmail.com>.
chapters/04-xz.receipts.md:45:$ git -C repos/xz log --all --author=Hans\ Jansen --format=%h\ %aI\ %cn\ %s
chapters/04-xz.receipts.md:46:f1cd9d71 2023-10-12T19:37:01+02:00 Jia Tan liblzma: Added crc32_clmul to crc32_fast.c.
chapters/04-xz.receipts.md:47:93e6fb08 2023-10-12T19:23:40+02:00 Jia Tan liblzma: Moved CLMUL CRC logic to crc_common.h.
chapters/04-xz.receipts.md:48:233885a4 2023-10-12T19:07:50+02:00 Jia Tan liblzma: Rename crc_macros.h to crc_common.h.
chapters/04-xz.receipts.md:54:$ git -C repos/xz show 4323bc3e0c
chapters/04-xz.receipts.md:56:Author: Jia Tan <jiat0218@gmail.com>
chapters/04-xz.receipts.md:63:## R5 — build-to-host.m4 was never a tracked file; the string lives only in .gitignore
chapters/04-xz.receipts.md:65:$ git -C repos/xz log --all -S build-to-host --format=%h\ %aI\ %s
chapters/04-xz.receipts.md:72:$ git -C repos/xz log --all --oneline -- m4/build-to-host.m4  # (no output = never tracked)
chapters/04-xz.receipts.md:77:$ git -C repos/xz show --format=%H%n%an%n%aI%n%s 328c52da8a
chapters/04-xz.receipts.md:79:Jia Tan
chapters/04-xz.receipts.md:87:$ git -C repos/xz show 328c52da8a -- CMakeLists.txt | grep -nE 'prctl|^\+.*\.$|my_sandbox'
chapters/04-xz.receipts.md:95:$ git -C repos/xz show --format=%H%n%an%n%aI%n%s%n%b f9cf4c05ed
chapters/04-xz.receipts.md:103:$ git -C repos/xz show f9cf4c05ed -- CMakeLists.txt | grep -E '^[+-][[:space:]]*\.?$'
chapters/04-xz.receipts.md:110:$ git -C repos/xz show -s --format=%h\ %aI\ %cn\ %s af071ef770
chapters/04-xz.receipts.md:111:af071ef7 2024-03-26T01:50:02+08:00 Jia Tan Docs: Simplify SECURITY.md.
chapters/04-xz.receipts.md:116:$ git -C repos/xz show -s --format=%H%n%an%n%aI%n%s e93e13c8b3
chapters/04-xz.receipts.md:124:$ git -C repos/xz show e93e13c8b3 | grep -E 'reverts|test files|disappeared|Backdoors are bad'
chapters/04-xz.html:7:<meta name="description" content="The xz backdoor as a human story: a two-year friendship, a weapon that ships in the package but never the repo, and one sabotaging period — told plainly.">
chapters/04-xz.html:17:<p class="kicker">chapter <b>01</b> · repo <b>tukaani-project/xz</b> · CVE-2024-3094</p>
chapters/04-xz.html:19:<p>There is a piece of software you have never heard of running on almost every computer that matters. It compresses things — squeezes files smaller — and it sits deep inside the machinery that unpacks your operating system, your software updates, the containers that run half the internet. It is called xz. And for essentially its entire life it was maintained by one man — Lasse Collin — working alone, for free, in his spare time.</p>
chapters/04-xz.html:23:<p>Lasse, worn down by years of carrying the thing alone, was grateful. And here the record preserves something colder than gratitude: an audience. Through that same year, strangers with names nobody had seen before began writing to the project's public mailing list to complain. Releases were too slow. Patches sat unanswered. <em>Progress will not happen until there is a new maintainer.</em> Lasse answered them honestly — he hadn't lost interest, but his capacity was limited; he cited long-term mental health issues, and reminded them that xz was an unpaid hobby project. And he offered the one hopeful thing he had: a helpful newcomer, Jia Tan, might take a bigger role. The messages did not vanish as neatly as later retellings imply: one of the strangers wrote once more, pressing Jia directly about a waiting patch, and another returned to the list in March 2024.</p>
chapters/04-xz.html:46:<p>And here is the mercy in it. The weapon was armed only in xz versions 5.6.0 and 5.6.1, and those had only reached the fast-moving frontier of Linux — the rolling and testing editions where new code lands first: Fedora Rawhide and the Fedora 40 beta, Debian's testing and unstable branches, openSUSE Tumbleweed, Arch, Kali. The stable releases that run most of the world's actual servers — the ones that wait months before accepting anything new — had not taken it yet. Freund's half-second caught it in the gap between <em>shipped</em> and <em>everywhere</em>.</p>
chapters/04-xz.html:48:<p>The hardest lesson of xz is that nothing was asleep. The code was reviewed. The maintainer was diligent. The contributor was, by every visible sign, excellent — for years — because being excellent for years <em>was</em> the attack. You could not have caught this by scanning for sloppiness. One at a time, the malicious changes were indistinguishable from good ones, and the two that mattered most were a tidy little ignore-list edit and a stray dot.</p>
chapters/04-xz.html:51:<p><em>Every commit in this story — the welcome, the co-maintainer line, the ignore-list edit, the dot, and the founder's furious one-character fix — is real and public. The full technical dig, with every command you can run on a clone yourself, is here: <a href="04-xz.full.html">One character — the full dig</a>.</em></p>
chapters/04-xz.reader.md:6:called xz. And for essentially its entire life it was maintained by one man — Lasse Collin —
chapters/04-xz.reader.md:26:he cited long-term mental health issues, and reminded them that xz was an unpaid hobby project.
chapters/04-xz.reader.md:27:And he offered the one hopeful thing he had: a helpful newcomer, Jia Tan, might take a bigger role.
chapters/04-xz.reader.md:126:<!-- VERIFIED: backdoor hooks sshd's RSA_public_decrypt via IFUNC; extracts payload from the RSA key, verifies it with the attacker's Ed448 signature, then runs it via system() — RCE. https://securitylabs.datadoghq.com/articles/xz-backdoor-cve-2024-3094/ and https://gist.github.com/thesamesam/223949d5a074ebc3dce9ee78baad9e27 -->
chapters/04-xz.reader.md:128:And here is the mercy in it. The weapon was armed only in xz versions 5.6.0 and 5.6.1, and those had
chapters/04-xz.reader.md:134:<!-- VERIFIED: affected xz 5.6.0/5.6.1 only; reached Fedora Rawhide + 40 beta, Debian testing/unstable/experimental, openSUSE Tumbleweed, Arch, Kali; not Debian stable, Ubuntu releases, or RHEL. https://www.openwall.com/lists/oss-security/2024/03/29/4 and https://www.helpnetsecurity.com/2024/03/31/xz-backdoored-linux-affected-distros/ -->
chapters/04-xz.reader.md:138:The hardest lesson of xz is that nothing was asleep. The code was reviewed. The maintainer was
chapters/04-xz.reader.md:155:command you can run on a clone yourself, is here: [One character — the full dig](04-xz.full.html).*
chapters/01-debian-openssl.md:126:files the maintainer meant to change, laid over an unpacked tarball at build time, like a stencil
chapters/01-debian-openssl.md:245:<!-- VERIFIED: DSA-1571/CVE-2008-0166; regenerate all key material generated 0.9.8c-1 (Sep 2006) through the 2008-05-13 fix on Debian/Ubuntu/derivatives; DSA keys merely used on an affected host are compromised (per-signature secret k); Debian openssl-blacklist / ssh-vulnkey shipped for detection. https://www.debian.org/security/2008/dsa-1571 -->
chapters/04-xz.full.html:17:<p class="kicker">chapter <b>01</b> · full dig · repo <b>tukaani-project/xz</b> · CVE-2024-3094</p>
chapters/04-xz.full.html:19:<p><em>This is the full dig — every command, every receipt. The plain-English telling of the same story is here: <a href="04-xz.html">One character</a>.</em></p>
chapters/04-xz.full.html:20:<p><code>git clone https://github.com/tukaani-project/xz</code> and run <code>shortlog</code> on the years before 2022, and the project is one man:</p>
chapters/04-xz.full.html:31:+    &lt;lasse.collin@tukaani.org&gt; and Jia Tan &lt;jiat0218@gmail.com&gt;.</code></pre>
chapters/04-xz.full.html:32:<p>One line. <a class="receipt-ref" href="#r2">R2</a> It is the nicest thing that can happen to a one-maintainer project: someone reliable showed up and stayed. By the end of 2022 Jia Tan is pushing as a committer. By 2023 Jia is doing more of the work than Lasse. Nobody in the room is watching a heist. They are watching a burnout end. That is the point of the two and a half years — not the code, the <em>trust</em>. The backdoor could not have been committed by a stranger. It had to be committed by the co-maintainer, and the way you become the co-maintainer is to be genuinely helpful for a very long time.</p>
chapters/04-xz.full.html:33:<p>The mailing list adds a chorus git cannot show you. Through 2022, unfamiliar names pressed Lasse in public — releases too slow, <em>no progress until there is a new maintainer</em> — and his reply cited long-term mental health issues, an unpaid hobby, and one hopeful development: Jia Tan might take a bigger role. The messages did not vanish as neatly as later retellings imply: Jigar wrote once more, asking Jia directly why he could not merge a waiting patch, and Dennis returned to the list in March 2024.</p>
chapters/04-xz.full.html:40:<p>Now the famous part, and the first surprise is that you cannot <code>git show</code> it. The payload that made CVE-2024-3094 — the code that hooks the SSH daemon's authentication — travelled in a file called <code>build-to-host.m4</code>, a build script. If you go looking for it, you find nothing:</p>
chapters/04-xz.full.html:41:<pre><span class="lang">console</span><code><span class="tok-prompt">$</span> git -C repos/xz log --all --oneline -- m4/build-to-host.m4  # (no output = never tracked)</code></pre>
chapters/04-xz.full.html:45:+build-to-host.m4</code></pre>
chapters/04-xz.full.html:46:<p>Read what that does. [R4, R5] Autotools generates the malicious build script into the release tarball. Adding its name to <code>.gitignore</code> means that if a maintainer ever regenerates it locally, <code>git status</code> stays clean and the unexpected file never shows up to be questioned. The crime scene is the <em>tarball</em>, the thing distributions actually download and compile. It is not the repository. Git, the tool everyone trusts to show them what changed, was specifically taught to say nothing. The one-line hygiene commit that taught it is so innocuous that after the breach Lasse himself cherry-picked it forward, twice, because read in isolation it is exactly what it claims to be: tidying a <code>.gitignore</code>.</p>
chapters/04-xz.full.html:54:<p>A lone <code>.</code> on its own line, between the include and the function. <a class="receipt-ref" href="#r6">R6</a> It is a syntax error. The test program never compiles, so the check always fails, so CMake decides Landlock is "not available," so <code>xz</code> never sandboxes itself. The Autotools half of the same commit does not have the period. Only CMake.</p>
chapters/04-xz.full.html:65:<p>What that period was protecting is the reason this is not a footnote. The payload in <code>build-to-host.m4</code> rewired the dynamic linker so that, on the machines it targeted, it hooked into <code>sshd</code> — the process that stands at every Linux server's front door and decides who gets in. Specifically it replaced the routine <code>sshd</code> uses to check an RSA login key: a connection whose key carried a payload signed with the attacker's own Ed448 key — a key nobody else held — would have that payload decrypted and passed straight to the system to execute. A backdoored <code>sshd</code> is not a data leak; it is a pre-authentication master key to a large fraction of the internet's servers, one only its author could turn, shipped through the update channel those servers trust most.</p>
chapters/04-xz.full.html:82:<p>The uncomfortable lesson of xz is that none of the usual defenses were asleep. The code was reviewed. The maintainer was diligent. The contributor was, by every visible signal, excellent — for years, because being excellent for years was the attack. You cannot grep your way to catching this; the malicious commits are, one at a time, indistinguishable from good ones, and the two that matter most are a <code>.gitignore</code> tidy and a whitespace-shaped <code>.</code>.</p>
chapters/04-xz.full.html:83:<p>But two habits would have narrowed it, and they cost nothing. First: your release tarball is not your git tree — <code>git archive</code> a tag, diff it against what you actually publish, and look hard at anything in the shipped artifact that is not in the repository, especially generated build scripts. Second: read the <em>negative</em> path of every "improvement." A commit that adds a sandbox check is a commit that can also quietly disable one, and the difference can be a single character that <code>git log --grep</code> will never find because the message says the opposite of what the diff does. Blame, here, is not a question of who to punish. It is a question of which line to read twice.</p>
chapters/04-xz.full.html:84:<div class="receipts"><h2>receipts</h2><ul><li id="r10"><span class="rid">R10</span> <code>git shortlog -sn --until=2022-01-01 HEAD</code> — before 2022: Lasse Collin 1259 commits, next name 11.</li><li id="r1"><span class="rid">R1</span> <code>git log --all --author='jiat75' --reverse</code> — first patch, 2022-01-28, committed by Lasse Collin.</li><li id="r2"><span class="rid">R2</span> <code>git show 692de534fa -- AUTHORS</code> — 2022-08, "and Jia Tan" added as co-maintainer.</li><li id="r3"><span class="rid">R3</span> <code>git log --all --author='Hans Jansen'</code> — a name present only June–October 2023, contributing the ifunc mechanism.</li><li id="r4"><span class="rid">R4</span> <code>git show 4323bc3e0c</code> — 2024-02-15, <code>build-to-host.m4</code> added to <code>m4/.gitignore</code>, nine days before 5.6.0.</li><li id="r5"><span class="rid">R5</span> <code>git log --all -S 'build-to-host'</code> / <code>git log --all -- m4/build-to-host.m4</code> — the string appears only in <code>.gitignore</code>; the file was never a tracked object.</li><li id="r6"><span class="rid">R6</span> <code>git show 328c52da8a -- CMakeLists.txt</code> — a lone <code>.</code> inside the CMake Landlock feature test (Autotools side clean).</li><li id="r7"><span class="rid">R7</span> <code>git show f9cf4c05ed</code> — "CMake: Fix sabotaged Landlock sandbox check. It never enabled it." — the fix is the single <code>.</code> removed.</li><li id="r8"><span class="rid">R8</span> <code>git show af071ef770</code> — 2024-03-26 01:50, "Docs: Simplify SECURITY.md," Jia's last authored+committed commit.</li><li id="r9"><span class="rid">R9</span> <code>git show e93e13c8b3</code> — 2024-04, Lasse removes the backdoor (CVE-2024-3094) and re-labels <code>AUTHORS</code>.</li></ul><p class="regen">Every command above is reproducible against a fresh clone. Full transcripts and the regenerate script sit beside this chapter in the repository.</p></div>
chapters/04-review-prompt.md:5:READ: chapters/04-xz.md (the Jia Tan / CVE-2024-3094 sabotage), plus CONTEXT.md and TEMPLATE.md.
chapters/04-xz.md:4:is here: [One character](04-xz.html).*
chapters/04-xz.md:7:`git clone https://github.com/tukaani-project/xz` and run `shortlog` on the years before 2022, and
chapters/04-xz.md:40:+    <lasse.collin@tukaani.org> and Jia Tan <jiat0218@gmail.com>.
chapters/04-xz.md:44:showed up and stayed. By the end of 2022 Jia Tan is pushing as a committer. By 2023 Jia is doing
chapters/04-xz.md:52:long-term mental health issues, an unpaid hobby, and one hopeful development: Jia Tan might take a
chapters/04-xz.md:83:`build-to-host.m4`, a build script. If you go looking for it, you find nothing:
chapters/04-xz.md:86:$ git -C repos/xz log --all --oneline -- m4/build-to-host.m4  # (no output = never tracked)
chapters/04-xz.md:95:+build-to-host.m4
chapters/04-xz.md:99:tarball. Adding its name to `.gitignore` means that if a maintainer ever regenerates it locally,
chapters/04-xz.md:101:*tarball*, the thing distributions actually download and compile. It is not the repository. Git, the
chapters/04-xz.md:125:available," so `xz` never sandboxes itself. The Autotools half of the same commit does not have the
chapters/04-xz.md:153:`build-to-host.m4` rewired the dynamic linker so that, on the machines it targeted, it hooked into
chapters/04-xz.md:160:<!-- VERIFIED: IFUNC hook redirects sshd's RSA_public_decrypt; payload extracted from the RSA key's N, ChaCha20-decrypted, Ed448-signature-verified against the attacker key, then run via system() — unauthenticated RCE. https://securitylabs.datadoghq.com/articles/xz-backdoor-cve-2024-3094/ and https://gist.github.com/thesamesam/223949d5a074ebc3dce9ee78baad9e27 -->
chapters/04-xz.md:167:<!-- VERIFIED: CVE-2024-3094, xz 5.6.0/5.6.1 only; carried by Fedora Rawhide + 40 beta, Debian testing/unstable/experimental, openSUSE Tumbleweed, Arch, Kali; not in Debian stable, Ubuntu stable, or RHEL. https://www.openwall.com/lists/oss-security/2024/03/29/4 and https://www.helpnetsecurity.com/2024/03/31/xz-backdoored-linux-affected-distros/ -->
chapters/04-xz.md:209:The uncomfortable lesson of xz is that none of the usual defenses were asleep. The code was reviewed.
chapters/04-xz.md:215:But two habits would have narrowed it, and they cost nothing. First: your release tarball is not your
chapters/04-xz.md:227:- **R2** `git show 692de534fa -- AUTHORS` — 2022-08, "and Jia Tan" added as co-maintainer.
chapters/04-xz.md:229:- **R4** `git show 4323bc3e0c` — 2024-02-15, `build-to-host.m4` added to `m4/.gitignore`, nine days before 5.6.0.
chapters/04-xz.md:230:- **R5** `git log --all -S 'build-to-host'` / `git log --all -- m4/build-to-host.m4` — the string appears only in `.gitignore`; the file was never a tracked object.
chapters/04-xz.md:236:*Full transcripts: `chapters/04-xz.receipts.md` (regenerate with `scripts/receipts-04.sh`).*
chapters/01-debian-openssl.full.html:65:<p>Look at where <code>md_rand.c</code> landed on 2 May: <code>rand/md_rand.c</code>. <a class="receipt-ref" href="#r4">R4</a> But OpenSSL 0.9.8 compiles <code>crypto/rand/md_rand.c</code>. Debian's packaging of this era stored <em>overlays</em> — only the upstream files the maintainer meant to change, laid over an unpacked tarball at build time, like a stencil cut over the real tree. Cut your hole one directory to the side, and the original code shows through untouched. A modified file at a path the build does not use is a no-op. You can prove it at the release tag:</p>
chapters/04-grok-review.md:3:Chapter 04, xz / Jia Tan / CVE-2024-3094. 1,507 words of body against a 2,200–3,200 band. This is a craft review, not a fact check. Hashes, dates, commands, and quoted output are locked. I am not touching them.
chapters/04-grok-review.md:21:**It announces.** Chapter 01, sentence two, named the guessable keys. Chapter 02, paragraph one, named the absent villain and the five deposits. Chapter 03 called itself the smallest story in the book. Every one of those was flagged. This is the same gesture in a better coat: a contrast-hinge that tells the reader how to feel about the next 2,000 words before they have seen a patch. CONTEXT.md exists because the earlier shelf had no surprise. A reader who already knows CVE-2024-3094 settles in for a well-written recap of Jia Tan. A reader who doesn’t has nothing left to feel a beat before it is named, because you have named the moral (purpose), the structure (patience, one name, trust), and the unique archaeology (the weapon is not in the tree). Then you clone.
chapters/04-grok-review.md:39:This is a patience story. Chronology *is* the plot. Hans between the welcome and the weapons is the right unease: the trusted name is in `AUTHORS`, and then a second name appears, donates a loader, and is never heard from again. Moving Hans after the period would turn him into a footnote on a hook we already understand. Moving the period before the empty log would pay the title early and make the tarball gap feel like appendix. The current order is: plant the hook, hide the weapon, disable the cage, turn out the lights. That is the heist. Keep it.
chapters/04-grok-review.md:79:The substance of this act is the strongest git-shaped find in the chapter: the payload travelled in a file that was never a tracked object; the only trace is its name in a `.gitignore`; Lasse himself cherry-picked the tidy forward, twice, because read in isolation it is exactly what it claims to be. That last fact is the “I might have done this” of the sabotage chapter — not Jia’s Tuesday, Lasse’s — and it is currently one clause at the end of a long paragraph about crime scenes and tarballs. Give it a breath. It is how this chapter stays *Blame* and does not become a thriller recap.
chapters/04-grok-review.md:81:The heading “The weapon that is not here” is a little cinematic and a little thesis. The object is `build-to-host.m4`, or the commit subject you already quote: `Update m4/.gitignore.` Either would be this story’s object. “The weapon that is not here” is the narrator pointing at the hole instead of letting the empty log be the hole.
chapters/04-grok-review.md:205:> The payload that made CVE-2024-3094 travelled in a file called `build-to-host.m4`. If you go looking for it, you find nothing:
chapters/04-grok-review.md:215:> February 2024. Jia adds a build check for Linux Landlock — a kernel sandbox that would confine the `xz` process, limiting what a compromised binary could do. Improving sandboxing is precisely what a responsible maintainer does.
chapters/04-grok-review.md:254:- Headings: story objects, not posters. “The welcome” can stay (it is this story’s room). “A name that only adds one thing” announces; call the heading **Hans Jansen** and let the prose do the one-thing. “The weapon that is not here” → **`build-to-host.m4`** or **Update m4/.gitignore**. “The period” names the reveal before the hunk; **Linux Landlock** or **A security improvement** is the room. “The exit” is slightly template; **01:50** or **Simplify SECURITY.md** is the object. “At home” stays. It is the book’s convention.
chapters/04-grok-review.md:256:- “The crime scene is the *tarball*”: TV-procedural. You can say the tarball. You do not need a crime scene.
chapters/04-grok-review.md:259:- Italics as elbow: *trust*, *tarball*, *improvement*, *ship* / *commit*, *negative*. You have earned about two of those in a chapter. The rest are the narrator squeezing the reader’s arm.
chapters/04-grok-review.md:261:- Clone then `git -C repos/xz`: the implied working directory slips. Pick one convention and hold it, the way 01 does.
chapters/04-grok-review.md:275:“Everything” includes Hans, and two pages later you correctly say the git history cannot prove who Hans was. “One person” is also the thing we do not know. What the tree holds is one *name* that became co-maintainer, and a second name that donated a hook. Lasse’s own commit says “the maintainer who added the backdoor has disappeared.” That is as far as this book can go. “Done on purpose” is fair for the period, the `.gitignore`, the `SECURITY.md` trim, the tarball. It is the open’s “everything / one person” that overreaches, and it is the same overreach that spends the title.
chapters/04-grok-review.md:277:> The uncomfortable lesson of xz is that none of the usual defenses were asleep. The code was reviewed. The maintainer was diligent.
chapters/04-grok-review.md:283:> The commits that matter are indistinguishable, one at a time, from the commits you want. Lasse cherry-picked one of them forward after the breach, because it was a `.gitignore` tidy. The usual defenses read subjects. They do not read a lone `.` inside a feature test, and they do not diff the tarball against the tag.
chapters/04-grok-review.md:303:Add in four places. Not more. Do not add a history of xz. Do not add the Andres Freund detective story (you have the right one clause; do not grow it). Do not add nation-state speculation. Do not add an ifunc tutorial. Do not add a supply-chain sermon. Do not add a sixth act.
chapters/04-grok-review.md:339:- A primer on tarball-versus-git for people who have never shipped. The empty log *is* the primer. `git archive` belongs in At home as a command, not as a workshop.
chapters/04-grok-review.md:343:If the chapter comes out around 2,200–2,400, that is the floor used honestly. If someone waves the 3,200 cap, the answer is the same as 03’s answer in reverse: consecutive chapters should not all be the same length. A short Bitcoin chapter and a mid-length xz chapter, after two longer security digs, is the craft. Chasing the cap would mean a sixth exhibit, and a sixth exhibit would be folklore.
chapters/04-grok-review.md:361:Then the `git log --author='jiat75' --reverse` receipt, one line, Lasse as committer. Then, in one sentence, who you are standing in: I clone xz, the compressor in effectively every Linux distribution, maintained for years, essentially alone, by Lasse Collin. Then the room.
chapters/04-grok-review.md:367:If you want a different object: the `AUTHORS` line alone (“and Jia Tan”), before we know why the second name matters. That is a name-open, and 03 already opened on names; I would not. The 01:50 clock is an exit object, not an entry. The period hunk as open pays the title in sentence one and turns the rest into confirmation. Don’t.
chapters/04-grok-review.md:389:It is the right title for the book. It is not folklore (not “The xz backdoor,” not the CVE). It is an object. It is a double: a glyph, and a name in the log. The double is the chapter. Paragraph one collapses it to villain-count — “by one person” — before we have seen a `.`. If that sentence dies, the title becomes honest again: we think person, we are shown a period, and the last line (“which line to read twice”) is how a character is also a character.
chapters/04-grok-review.md:399:3. **And Jia Tan** — the `AUTHORS` line, the welcome, the headstone-that-should-not-be-a-headstone. Tender toward Lasse. Drier about Jia. Risks reading as a true-crime nameplate.
chapters/04-grok-review.md:409:1. **Delete the contrast-hinge and the rest of paragraph one.** “The last chapter had no villain. This one has nothing else” violates the no-announcing rule, points at the wrong neighbor, and spends the title. Enter on the January patch. Clone in one sentence. Walk into Lasse’s inbox. This is the change that turns a well-written recap of Jia Tan into a chapter with a turn — and it is the only way the welcome can still work on a reader who just lived chapter 02.
chapters/04-codex-review.md:5:This is the right material in the right broad order, and it is already lean, legible, and morally more serious than the usual xz retelling. The chapter understands its real subject: sabotage did not resemble sabotage while it was being installed; it resembled relief, maintenance, build hygiene, and a security improvement. The `.gitignore` absence and the Landlock period are an excellent paired turn. One teaches Git not to report a file; the other makes a safety check report the opposite of reality.
chapters/04-codex-review.md:25:> Nine days before the 5.6.0 release, this line entered xz:
chapters/04-codex-review.md:28:> +build-to-host.m4
chapters/04-codex-review.md:33:Then rewind to January 2022 and “The welcome.” Chapter 3 opens on a `shortlog` and a malformed name; this would open on a diff hunk whose meaning is withheld, so it also satisfies the requirement that consecutive chapters enter on different kinds of objects. When the narrative returns to the line, the empty path and the tarball can disclose why it mattered.
chapters/04-codex-review.md:53:> “The test program never compiles, so the check always fails, so CMake concludes Landlock is ‘not available,’ so `xz` never sandboxes itself …”
chapters/04-codex-review.md:55:The repeated “so” is appropriate once, but four links flatten the moment. Give the false result its own sentence: “The test program never compiles. CMake records that failure as ‘Landlock not available,’ and `xz` proceeds without the sandbox.” That lets the reader experience the inversion instead of racing through it.
chapters/04-codex-review.md:61:The hardest-working paragraph begins “Read what that does.” It explains the generated tarball, the clean working tree, the repository/release distinction, Git’s induced silence, and the later cherry-picks in seven sentences. Its best line is:
chapters/04-codex-review.md:65:That is the chapter’s thesis made out of mechanism rather than commentary. Preserve it. The paragraph is carrying enough that “The crime scene is the *tarball*” can lose the crime-story diction; “The payload is in the *tarball*” is plainer and lets the Git sentence remain the rhetorical peak.
chapters/04-codex-review.md:77:The narrator is otherwise surprisingly absent for a book whose narrator runs `blame` daily. The one explicit “I” is the unhelpful “I am not going to tell you.” Add two small archaeological turns instead: where the narrator expects to find `build-to-host.m4` and gets an empty path, and where the narrator’s eye catches—or initially passes over—the period. No memoir is needed. A pair of sentences such as “I went looking for the payload in the path history. Git returned nothing” would give the evidence a discoverer and make the empty output dramatic rather than merely expository.
chapters/04-codex-review.md:98:The chapter needs one early sentence establishing how it will use the name Jia Tan: it is the identity recorded by Git, not a claim that the narrator knows who controlled that identity. After that, “Jia” can remain readable shorthand. With Hans, state the narrower limit separately. This avoids both coy speculation and numbing repetition of “the account.” Also replace motive-coloured constructions where the mechanism is stronger. For example:
chapters/04-codex-review.md:115:2. **The archaeological absence, 120–180 words.** Let the first-person narrator search the tracked path, confront the blank result, and explain in plain language how a generated release tarball can differ from the Git tree. This is where the book’s distinctive narrator and the nonexpert reader need each other.
chapters/01-debian-openssl.fable.md:108:files the maintainer meant to modify, laid over an unpacked tarball at build time. A modified
chapters/04-agy-review.stdout.md:3:# Craft Review: Chapter 04 (xz)
chapters/04-agy-review.stdout.md:31:> "The malicious build script gets generated into the release tarball by the autotools machinery — but it is added to `.gitignore` so that if it ever appears in a working tree, `git status` stays clean and no maintainer notices an unexpected file."
chapters/04-agy-review.stdout.md:33:*Rewrite:* "Autotools generates the malicious build script into the release tarball. By adding it to `.gitignore`, the attacker ensures that if a maintainer generates the script locally, `git status` stays clean. The unexpected file remains invisible."
chapters/04-agy-review.md:1:# Craft Review: Chapter 04 (xz)
chapters/04-agy-review.md:29:> "The malicious build script gets generated into the release tarball by the autotools machinery — but it is added to `.gitignore` so that if it ever appears in a working tree, `git status` stays clean and no maintainer notices an unexpected file."
chapters/04-agy-review.md:31:*Rewrite:* "Autotools generates the malicious build script into the release tarball. By adding it to `.gitignore`, the attacker ensures that if a maintainer generates the script locally, `git status` stays clean. The unexpected file remains invisible."

exec
/bin/bash -lc "awk '/"'^## Receipts/{exit} {print}'"' chapters/18-signatures.fable.md | perl -0pe 's/<"'!--.*?-->//gs'"' | wc -w; awk '/"'^## Receipts/{exit} {print}'"' chapters/18-signatures.fable.md | sed '/<"'!--/,/-->/d'"' | wc -w; sed -n '1,245p' chapters/04-xz.md | awk '/"'^## Receipts/{exit} {print}'"' | wc -w; rg -n '"'^# '"' README.md index.md chapters/index* 2>/dev/null | head -80" in /home/diablo/book16
 succeeded in 208ms:
2041
2017
1983

codex
The chapter does not pass the factual gate yet. Its strongest plot is OpenSSL → xz: an absent signature suggests an easy rule, then xz destroys that rule. Afterward it becomes a tour of interesting tag behavior. The signature-validity overclaims are the most urgent defect.

## Must-fix gates

1. **The xz scene claims cryptographic validity and trusted identity that the receipts do not prove.**

   These lines overclaim:

   > “The attacker signed his work.”  
   > “full cryptographic ceremony”  
   > “The signature was not forged.”  
   > “The signature was *true*.”  
   > “It faithfully attested”  
   > “a flawless attestation”

   [Draft lines 79–109](/home/diablo/book16/chapters/18-signatures.fable.md:79)

   The receipts prove only that the tag objects name Jia Tan as tagger and contain PGP armor. They do not prove verification, key ownership, or key trust.

   Replace the opening paragraph with:

   > There it is—the PGP block OpenSSL’s 1.0.1g tag lacked. Both xz release-tag objects name Jia Tan as tagger and contain PGP signature material [R3]. The receipts do not establish that either signature verifies, or that the signing key was trustworthy.

   Replace the concluding contrast with:

   > One release fixed the emergency and contained no signature material. The other two tag objects contain signature material while the dangerous file lay outside the trees they name. Signature presence and artifact safety are different questions.

   Apply the same terminology throughout: “PGP-bearing tag object” or “contains PGP signature material,” not “signed tag,” including the R3–R9 receipt summaries.

2. **“A signed tag attests to one thing: a tree” is technically wrong.**

   [Draft lines 85–88](/home/diablo/book16/chapters/18-signatures.fable.md:85)

   A tag signature, if verified, covers the annotated tag payload. That payload references an object—here, a commit—which in turn names a tree. It also covers the tag name, tagger field, and message. It does not directly attest “one thing: a tree.”

   Use:

   > When an annotated-tag signature verifies, it covers the tag object: its target, tag name, tagger field, and message. Here the target is a commit, and that commit names a tree. It does not cover a separately produced release tarball.

   Also revise the anatomy claim:

   > “The only difference between ‘a release solemnly attested by its maintainer’ and ‘a note anyone could have typed’ is whether the signature block exists…”

   A block’s presence still does not prove who produced it. Say:

   > PGP armor tells me that signature material is present. Verification and trust are separate questions.

3. **The Bitcoin section contains three concrete factual errors.**

   [Draft lines 129–147](/home/diablo/book16/chapters/18-signatures.fable.md:129)

   - “Delete that tag and the critical fix … vanishes” is false because the patch-identical twin remains on HEAD, and deleting a ref does not immediately delete an object. Replace with:

     > In this clone, that tag is the only ref containing the original commit. Remove the ref and no current ref would reach that particular object, although the same change remains on HEAD under another hash.

   - “`git patch-id` proves the diffs are byte-for-byte-equivalent” overstates what patch-id proves. Replace with:

     > The two commits produce the same stable patch-id.

   - “Seven years later the same maintainer signed a tag named `noversion`” is wrong. The first tag names Gavin Andresen; `noversion` names Wladimir J. van der Laan. Replace with:

     > Seven years later, a tag object created by Wladimir J. van der Laan and containing PGP armor points to a 2014 commit [R7].

   “Then-lead maintainer” and “software … minting real money” also require external evidence or removal.

4. **The OpenSSL and Log4j scenes turn inference into fact.**

   In OpenSSL:

   > “the worst week of his professional life”  
   > “an adversary nobody was thinking about that day”  
   > “ceremony always yields to urgency”  
   > “the project’s release tags carry signature blocks. The habit arrived.”

   [Draft lines 48–57](/home/diablo/book16/chapters/18-signatures.fable.md:48)

   The receipts reveal neither Henson’s mental state nor a project-wide habit; R2 proves one 2016 prerelease tag contains PGP armor. Use:

   > The record does not tell me why the signature is missing. It shows Henson authoring the bounds check at 00:51 on April 6 and preparing 1.0.1g the following evening [R2]. A 2016 prerelease tag, made by Matt Caswell, contains PGP armor [R2].

   In Log4j:

   > “hundreds of miles and one exhausted night apart”  
   > “Nothing in any changelog records this”  
   > “The emergency ran longer than any one volunteer could”  
   > “the releases were handed from hand to hand”

   [Draft lines 164–175](/home/diablo/book16/chapters/18-signatures.fable.md:164)

   Different time zones do not prove distance, exhaustion, volunteer status, or the reason tagger responsibility changed. Use:

   > The three tag objects record three tagger names. For 2.17.0, Goers authored the target commit and Gregory tagged it the following day [R8]. I read the changing names as a relay, but Git cannot tell me whether it reflects exhaustion, policy, or ordinary release rotation.

5. **All three `CHECK` markers remain blocking, and two are under-scoped.**

   - **Heartbleed marker:** [lines 8–9](/home/diablo/book16/chapters/18-signatures.fable.md:8). It covers the CVE, disclosure date, and 1.0.1g as the fix release. It does not cover “most anxiously awaited,” “half the internet’s servers,” “worst cryptographic emergency,” “repaired the internet’s encryption,” or “almost nobody has ever noticed.” Source each claim explicitly or cut the superlatives.

   - **xz marker:** [lines 64–65](/home/diablo/book16/chapters/18-signatures.fable.md:64). It covers the compromised versions and tarball delivery path. It does not cover “manufactured persona,” “spent two years,” “co-maintainer,” “aimed at the servers of the world,” or the “most notorious/most dangerous” claims. It also cannot turn the tagger name into verified signer identity.

   - **Log4j marker:** [lines 154–155](/home/diablo/book16/chapters/18-signatures.fable.md:154). Its stated scope—CVE, disclosure, and the three emergency-response releases—is appropriate. It does not cover the later volunteer/exhaustion/changelog claims; those should be cut or separately sourced.

6. **The console gate fails: only the OpenSSL panel is fully verbatim.**

   - The xz command shown would print `absent`, not `v5.6.0 m4/build-to-host.m4=absent`. The latter came from the receipt’s loop. Do not pair that output with a different command.
   - The Bitcoin command is shortened from the combined receipt command.
   - The three Log4j `$ ...` lines are editorial reconstructions, not receipt lines.
   - The generic at-home `$ git cat-file … v1.2.3` line is absent from the receipts.

   Either add and regenerate exact transcripts, or remove the `$`/`console` presentation and render derived summaries as prose. Under the stated gate, synthetic console is not acceptable.

7. **The field section makes unsupported institutional claims.**

   [Draft lines 177–190](/home/diablo/book16/chapters/18-signatures.fable.md:177)

   - Go: “trust placed deliberately outside git … by policy” is not proved. The receipts establish only that this clone has 71,792 reachable commits with `%G?=N` and 491 lightweight tag refs.
   - Linux: “in a standard clone, the tag ref no longer exists” exceeds the evidence and implies deletion. Replace with:

     > This clone contains zero tag refs, yet the 2026 merge commit retains a `mergetag` block containing PGP armor [R9]. The clone cannot tell us whether a corresponding tag ref was deleted, omitted during cloning, or never present here.

   - CPython does not currently say “backdated,” which is good. Tighten “was created in 2017” to:

     > The retained tag object has a 2017 tagger timestamp and points to a 2011 branch-close commit [R11].

     Cut “when the museum was reorganized”; that motive is not in the receipts.

8. **The four scenes do not presently make one plot; the draft openly labels itself a catalog.**

   The transitions—“the third specimen,” “the last specimen,” and then “The field, briefly”—produce exactly the Costume failure mode. The emotional spine peaks with xz, then resets twice.

   Cut **“The field, briefly” in full**. It turns four cases into seven and contributes no new turn. Also cut the `noversion` aside and compress Log4j to one paragraph unless the staffing inference can be sourced.

   Rebuild the transitions as one sequence of broken assumptions:

   > OpenSSL left me with an easy rule: an unsigned release was the danger. Then I opened `v5.6.0`.

   Then:

   > Xz killed that rule. Bitcoin killed a quieter assumption: that a release tag merely labels the history I already have.

   This also restores the missing first-person narrator. At present, the chapter sounds like an authoritative lecture; the engineer who performs the dig is almost absent.

   Rename “The signature that told the truth” and “Three hands in eight days.” Both announce their reveals before the reader sees the evidence, and the first also overclaims validity. `v5.6.0` and `rel/2.17.0` would let the objects disclose the turn.

9. **The xz section repeats the opening chapter’s distinctive archaeology.**

   The published xz chapter already owns:

   - the absent `m4/build-to-host.m4` path;
   - the `.gitignore` line nine days earlier;
   - the Git-tree/tarball gap;
   - the closing `git archive`/artifact-diff habit.

   See [04-xz.md](/home/diablo/book16/chapters/04-xz.md:83) and its close at [line 215](/home/diablo/book16/chapters/04-xz.md:215).

   The additive discovery here is narrow and excellent: both compromised-release tag objects contain PGP armor while the commit trees they name omit the delivery path. Keep that. Cut most of [lines 95–103](/home/diablo/book16/chapters/18-signatures.fable.md:95) and do not reteach the full artifact-diff workflow at the close.

10. **The at-home section is too long and repeats the xz chapter while carrying the same precision errors.**

   [Draft lines 192–211](/home/diablo/book16/chapters/18-signatures.fable.md:192)

   “The habit costs ten seconds” is unsupported; “four lines” is untrue for a lightweight tag; “who stood behind this release” overstates what the tagger field proves; and “the signature covers a tree” repeats the technical error.

   A tighter close:

   > Run `git cat-file -p refs/tags/v1.2.3`. If it prints a tag object, read the tagger field as a claim, not an identity; PGP armor as signature material, not verification; and the target as an object, not proof that your release artifact matches it. Then choose the follow-up the risk warrants: verify the tag, check reachability, or compare the artifact with the named tree. Those are three different questions.

## Optional suggestions

- **Anatomy placement:** correct. The OpenSSL error lands first, and the explanation arrives exactly when needed. Keep it there, but reduce it by roughly forty words and distinguish storage, verification, and trust.

- **Title:** keep it. “error: no signature found” is concrete, curious, and sits naturally beside titles such as “Fix typo” and “One character.” It works best if the chapter is narrowed around the OpenSSL/xz inversion; the present seven-example survey outgrows it.

- **Word count:** the body is approximately **2,041 words** excluding comments and receipts—already below the stated 2,200–3,200 band. Do not preserve weak material merely to meet the floor. Cut the field, `noversion`, repeated xz explanation, speculative Log4j drama, and half the at-home section: roughly 450–600 words. Spend back only what the chapter needs on first-person connective tissue, exact signature mechanics, and one concrete, sourced real-world consequence. If 2,200 is a hard floor, that is where the added words should go—not into more repositories.

- **Overall verdict:** there is a strong chapter here, but it is the two-act reversal—OpenSSL’s absent block followed by xz’s present block and absent file. Everything after that must either deepen the narrator’s changing method or leave.
tokens used
56,166
The chapter does not pass the factual gate yet. Its strongest plot is OpenSSL → xz: an absent signature suggests an easy rule, then xz destroys that rule. Afterward it becomes a tour of interesting tag behavior. The signature-validity overclaims are the most urgent defect.

## Must-fix gates

1. **The xz scene claims cryptographic validity and trusted identity that the receipts do not prove.**

   These lines overclaim:

   > “The attacker signed his work.”  
   > “full cryptographic ceremony”  
   > “The signature was not forged.”  
   > “The signature was *true*.”  
   > “It faithfully attested”  
   > “a flawless attestation”

   [Draft lines 79–109](/home/diablo/book16/chapters/18-signatures.fable.md:79)

   The receipts prove only that the tag objects name Jia Tan as tagger and contain PGP armor. They do not prove verification, key ownership, or key trust.

   Replace the opening paragraph with:

   > There it is—the PGP block OpenSSL’s 1.0.1g tag lacked. Both xz release-tag objects name Jia Tan as tagger and contain PGP signature material [R3]. The receipts do not establish that either signature verifies, or that the signing key was trustworthy.

   Replace the concluding contrast with:

   > One release fixed the emergency and contained no signature material. The other two tag objects contain signature material while the dangerous file lay outside the trees they name. Signature presence and artifact safety are different questions.

   Apply the same terminology throughout: “PGP-bearing tag object” or “contains PGP signature material,” not “signed tag,” including the R3–R9 receipt summaries.

2. **“A signed tag attests to one thing: a tree” is technically wrong.**

   [Draft lines 85–88](/home/diablo/book16/chapters/18-signatures.fable.md:85)

   A tag signature, if verified, covers the annotated tag payload. That payload references an object—here, a commit—which in turn names a tree. It also covers the tag name, tagger field, and message. It does not directly attest “one thing: a tree.”

   Use:

   > When an annotated-tag signature verifies, it covers the tag object: its target, tag name, tagger field, and message. Here the target is a commit, and that commit names a tree. It does not cover a separately produced release tarball.

   Also revise the anatomy claim:

   > “The only difference between ‘a release solemnly attested by its maintainer’ and ‘a note anyone could have typed’ is whether the signature block exists…”

   A block’s presence still does not prove who produced it. Say:

   > PGP armor tells me that signature material is present. Verification and trust are separate questions.

3. **The Bitcoin section contains three concrete factual errors.**

   [Draft lines 129–147](/home/diablo/book16/chapters/18-signatures.fable.md:129)

   - “Delete that tag and the critical fix … vanishes” is false because the patch-identical twin remains on HEAD, and deleting a ref does not immediately delete an object. Replace with:

     > In this clone, that tag is the only ref containing the original commit. Remove the ref and no current ref would reach that particular object, although the same change remains on HEAD under another hash.

   - “`git patch-id` proves the diffs are byte-for-byte-equivalent” overstates what patch-id proves. Replace with:

     > The two commits produce the same stable patch-id.

   - “Seven years later the same maintainer signed a tag named `noversion`” is wrong. The first tag names Gavin Andresen; `noversion` names Wladimir J. van der Laan. Replace with:

     > Seven years later, a tag object created by Wladimir J. van der Laan and containing PGP armor points to a 2014 commit [R7].

   “Then-lead maintainer” and “software … minting real money” also require external evidence or removal.

4. **The OpenSSL and Log4j scenes turn inference into fact.**

   In OpenSSL:

   > “the worst week of his professional life”  
   > “an adversary nobody was thinking about that day”  
   > “ceremony always yields to urgency”  
   > “the project’s release tags carry signature blocks. The habit arrived.”

   [Draft lines 48–57](/home/diablo/book16/chapters/18-signatures.fable.md:48)

   The receipts reveal neither Henson’s mental state nor a project-wide habit; R2 proves one 2016 prerelease tag contains PGP armor. Use:

   > The record does not tell me why the signature is missing. It shows Henson authoring the bounds check at 00:51 on April 6 and preparing 1.0.1g the following evening [R2]. A 2016 prerelease tag, made by Matt Caswell, contains PGP armor [R2].

   In Log4j:

   > “hundreds of miles and one exhausted night apart”  
   > “Nothing in any changelog records this”  
   > “The emergency ran longer than any one volunteer could”  
   > “the releases were handed from hand to hand”

   [Draft lines 164–175](/home/diablo/book16/chapters/18-signatures.fable.md:164)

   Different time zones do not prove distance, exhaustion, volunteer status, or the reason tagger responsibility changed. Use:

   > The three tag objects record three tagger names. For 2.17.0, Goers authored the target commit and Gregory tagged it the following day [R8]. I read the changing names as a relay, but Git cannot tell me whether it reflects exhaustion, policy, or ordinary release rotation.

5. **All three `CHECK` markers remain blocking, and two are under-scoped.**

   - **Heartbleed marker:** [lines 8–9](/home/diablo/book16/chapters/18-signatures.fable.md:8). It covers the CVE, disclosure date, and 1.0.1g as the fix release. It does not cover “most anxiously awaited,” “half the internet’s servers,” “worst cryptographic emergency,” “repaired the internet’s encryption,” or “almost nobody has ever noticed.” Source each claim explicitly or cut the superlatives.

   - **xz marker:** [lines 64–65](/home/diablo/book16/chapters/18-signatures.fable.md:64). It covers the compromised versions and tarball delivery path. It does not cover “manufactured persona,” “spent two years,” “co-maintainer,” “aimed at the servers of the world,” or the “most notorious/most dangerous” claims. It also cannot turn the tagger name into verified signer identity.

   - **Log4j marker:** [lines 154–155](/home/diablo/book16/chapters/18-signatures.fable.md:154). Its stated scope—CVE, disclosure, and the three emergency-response releases—is appropriate. It does not cover the later volunteer/exhaustion/changelog claims; those should be cut or separately sourced.

6. **The console gate fails: only the OpenSSL panel is fully verbatim.**

   - The xz command shown would print `absent`, not `v5.6.0 m4/build-to-host.m4=absent`. The latter came from the receipt’s loop. Do not pair that output with a different command.
   - The Bitcoin command is shortened from the combined receipt command.
   - The three Log4j `$ ...` lines are editorial reconstructions, not receipt lines.
   - The generic at-home `$ git cat-file … v1.2.3` line is absent from the receipts.

   Either add and regenerate exact transcripts, or remove the `$`/`console` presentation and render derived summaries as prose. Under the stated gate, synthetic console is not acceptable.

7. **The field section makes unsupported institutional claims.**

   [Draft lines 177–190](/home/diablo/book16/chapters/18-signatures.fable.md:177)

   - Go: “trust placed deliberately outside git … by policy” is not proved. The receipts establish only that this clone has 71,792 reachable commits with `%G?=N` and 491 lightweight tag refs.
   - Linux: “in a standard clone, the tag ref no longer exists” exceeds the evidence and implies deletion. Replace with:

     > This clone contains zero tag refs, yet the 2026 merge commit retains a `mergetag` block containing PGP armor [R9]. The clone cannot tell us whether a corresponding tag ref was deleted, omitted during cloning, or never present here.

   - CPython does not currently say “backdated,” which is good. Tighten “was created in 2017” to:

     > The retained tag object has a 2017 tagger timestamp and points to a 2011 branch-close commit [R11].

     Cut “when the museum was reorganized”; that motive is not in the receipts.

8. **The four scenes do not presently make one plot; the draft openly labels itself a catalog.**

   The transitions—“the third specimen,” “the last specimen,” and then “The field, briefly”—produce exactly the Costume failure mode. The emotional spine peaks with xz, then resets twice.

   Cut **“The field, briefly” in full**. It turns four cases into seven and contributes no new turn. Also cut the `noversion` aside and compress Log4j to one paragraph unless the staffing inference can be sourced.

   Rebuild the transitions as one sequence of broken assumptions:

   > OpenSSL left me with an easy rule: an unsigned release was the danger. Then I opened `v5.6.0`.

   Then:

   > Xz killed that rule. Bitcoin killed a quieter assumption: that a release tag merely labels the history I already have.

   This also restores the missing first-person narrator. At present, the chapter sounds like an authoritative lecture; the engineer who performs the dig is almost absent.

   Rename “The signature that told the truth” and “Three hands in eight days.” Both announce their reveals before the reader sees the evidence, and the first also overclaims validity. `v5.6.0` and `rel/2.17.0` would let the objects disclose the turn.

9. **The xz section repeats the opening chapter’s distinctive archaeology.**

   The published xz chapter already owns:

   - the absent `m4/build-to-host.m4` path;
   - the `.gitignore` line nine days earlier;
   - the Git-tree/tarball gap;
   - the closing `git archive`/artifact-diff habit.

   See [04-xz.md](/home/diablo/book16/chapters/04-xz.md:83) and its close at [line 215](/home/diablo/book16/chapters/04-xz.md:215).

   The additive discovery here is narrow and excellent: both compromised-release tag objects contain PGP armor while the commit trees they name omit the delivery path. Keep that. Cut most of [lines 95–103](/home/diablo/book16/chapters/18-signatures.fable.md:95) and do not reteach the full artifact-diff workflow at the close.

10. **The at-home section is too long and repeats the xz chapter while carrying the same precision errors.**

   [Draft lines 192–211](/home/diablo/book16/chapters/18-signatures.fable.md:192)

   “The habit costs ten seconds” is unsupported; “four lines” is untrue for a lightweight tag; “who stood behind this release” overstates what the tagger field proves; and “the signature covers a tree” repeats the technical error.

   A tighter close:

   > Run `git cat-file -p refs/tags/v1.2.3`. If it prints a tag object, read the tagger field as a claim, not an identity; PGP armor as signature material, not verification; and the target as an object, not proof that your release artifact matches it. Then choose the follow-up the risk warrants: verify the tag, check reachability, or compare the artifact with the named tree. Those are three different questions.

## Optional suggestions

- **Anatomy placement:** correct. The OpenSSL error lands first, and the explanation arrives exactly when needed. Keep it there, but reduce it by roughly forty words and distinguish storage, verification, and trust.

- **Title:** keep it. “error: no signature found” is concrete, curious, and sits naturally beside titles such as “Fix typo” and “One character.” It works best if the chapter is narrowed around the OpenSSL/xz inversion; the present seven-example survey outgrows it.

- **Word count:** the body is approximately **2,041 words** excluding comments and receipts—already below the stated 2,200–3,200 band. Do not preserve weak material merely to meet the floor. Cut the field, `noversion`, repeated xz explanation, speculative Log4j drama, and half the at-home section: roughly 450–600 words. Spend back only what the chapter needs on first-person connective tissue, exact signature mechanics, and one concrete, sourced real-world consequence. If 2,200 is a hard floor, that is where the added words should go—not into more repositories.

- **Overall verdict:** there is a strong chapter here, but it is the two-act reversal—OpenSSL’s absent block followed by xz’s present block and absent file. Everything after that must either deepen the narrator’s changing method or leave.
