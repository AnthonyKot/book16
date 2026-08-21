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
