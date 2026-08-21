# error: no signature found

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [error: no signature found](18-signatures.html).*

I run `git tag -v` about as often as I run `git blame` — which is to say almost never, right up
until the moment I need it and it tells me something I did not want to know. Here is the moment
that taught me to run it. In April 2014, the OpenSSL project shipped the most anxiously awaited
release in its history — version 1.0.1g, the one that closed the Heartbleed hole while a large
share of the internet's servers stood bleeding their private keys into anyone who asked.
<!-- VERIFIED: Heartbleed = CVE-2014-0160, disclosed 2014-04-07; OpenSSL 1.0.1g released 2014-04-07 as the fix; ~17% (~half a million) of trusted secure web servers were believed vulnerable, exposing private keys. https://heartbleed.com/ and https://www.cisa.gov/news-events/alerts/2014/04/08/openssl-heartbleed-vulnerability-cve-2014-0160 -->
Ask git today to verify the signature on that release's tag — the tag cut by the world's most
important cryptography project, at the peak of the worst cryptographic emergency it would ever face
— and here is the complete answer [R1]:

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
with an expired key — *not signed*. And almost nobody has ever noticed, because almost nobody ever
asks. This chapter is about the asking: one command, `git cat-file -p` pointed at a tag, and the
one thing it reliably reveals — not whether a release is safe, but whether the ceremony you are
trusting is even there.

## Four lines and maybe a promise

The whole chapter lives inside one distinction most working engineers have never had a reason to
draw. The tag most people meet is a bookmark: a name pointing at a commit. But git also has the
*annotated* tag — a real object in the database, with a four-line header (what it points at, its
name, who made it, when) and a message. And optionally, at the very bottom, a block of PGP armor: a
cryptographic signature.

Here is the trap. **Annotated is not signed.** The four lines and the ceremony are present either
way; the tagger's name looks equally official in both. The only difference between "a release
attested by its maintainer" and "a note anyone could have typed" is whether a signature block sits
at the bottom — and nothing in daily git usage ever shows you the bottom. `git tag -v` is the
question. The OpenSSL answer above is what "no" sounds like.

And the record is gentle with the man who cut that tag. The bounds-check fix that closed Heartbleed
is authored by the same Stephen Henson at 00:51 in the morning of April 6th; the release-prep
commit and its tag carry the same timestamp to the second, 17:55 on April 7th [R1, R2]. This is a
man in the middle of the worst week of his professional life, tagging the release the entire world
is refreshing for, at the instant he ships it. The signature is the step that guards against an
adversary nobody in that room had spare attention for, and it is exactly the kind of step that
evaporates under load. The habit did arrive, later: a pre-release tag two years on,
`OpenSSL_1_1_0-pre6`, carries a PGP block, cut by Matt Caswell [R2]. Ceremony showed up after the
emergency that most needed it — which is how ceremony usually shows up.

So I came away with a tidy rule: an unsigned release is the thing to worry about. Then I opened a
different repository.

## The signature that attested nothing useful

Ten years later, the xz-utils compression library shipped the most infamous poisoned releases in
the history of open source — 5.6.0 and 5.6.1, carrying a backdoor into the world's servers. (That
attack is this book's opening chapter; here we only care what its *tags* look like.) Read one the
way we just read OpenSSL's [R3]:

```console
$ git -C repos/xz cat-file -p refs/tags/v5.6.0 | sed -n '1,7p'
object 2d7d862e3ffa8cec4fd3fdffcd84e984a17aa429
type commit
tag v5.6.0
tagger Jia Tan <jiat0218@gmail.com> 1708762926 +0800

XZ Utils 5.6.0
-----BEGIN PGP SIGNATURE-----
```

There it is — the block the panicked OpenSSL release lacked. The attacker put a PGP signature on
his work. If your rule was "unsigned is the danger, signed is safe," the most dangerous release of
the decade sails straight through, pennant up.

Now look at what that block actually covers, because the mechanics are the entire lesson. A signed
tag attests to the object named in its first line — here a *commit* (`object 2d7d862e… type
commit`), and therefore that commit's tree, its snapshot of files. So ask git whether the
backdoor's delivery vehicle, a build file called `m4/build-to-host.m4`, is *in* the tree this
signature ultimately vouches for [R4]:

```console
$ git -C repos/xz cat-file -e 'v5.6.0^{tree}:m4/build-to-host.m4' && echo present || echo absent
absent
```

Absent. Across the entire repository — every branch, all of history — that file was modified in
exactly zero commits [R4]. It never existed in git. It lived only in the release *tarball*, the
bundle installers actually consume, which is built from the tree and then, in the gap between tree
and bundle, had the poisoned file slipped in. This clone cannot tell you whether any keyring would
even accept the signature block; that is not the point. The point is that whatever the block
attests, it attests a tree — and the tree is clean. The weapon rode in the one part of the shipment
no signature named. Nine days earlier, the same hands had added a single line to the repository —
`build-to-host.m4`, in git's ignore file [R4] — so that if the carrier ever showed up on a
developer's disk, git would say nothing.

Set the two releases side by side and they are the same lesson from opposite directions. One
protected the world and carried no attestation. The other wore the full ceremony and attacked the
world. *A signature answers exactly one question — was this object the one attested? — and says
nothing about what got shipped under its name.* Ceremony and safety are simply not the same axis,
and every instinct that fuses them is exploitable.

## A coda: the fix only a tag remembers

One more turn of the same key, quicker, because it changes what you think a tag even *is*. In March
2011, Bitcoin's lead maintainer Gavin Andresen cut a signed tag whose message skips the ceremony
[R5]:

```console
$ git -C repos/bitcoin cat-file -p refs/tags/v0.3.20.2 | sed -n '1,7p'
object 52248a757b25581339ca6e00cc0da05bfdb04dc8
type commit
tag v0.3.20.2
tagger Gavin Andresen <gavinandresen@gmail.com> 1299250125 -0500

critical bug-fix release (block download failures due to too-small sendbuffer)
```

A critical fix, for software that by then moved real money. Now ask the obvious follow-up — is that
commit part of today's Bitcoin? [R6]:

```console
$ git -C repos/bitcoin merge-base --is-ancestor 52248a757b... HEAD && echo yes || echo no
no
$ git -C repos/bitcoin for-each-ref --contains 52248a757b...
refs/tags/v0.3.20.2
```

The commit the tag signs is reachable from exactly one ref in the whole repository — the tag
itself. Delete that tag and the *signed* critical release of March 2011 is reachable from nothing.
The fix did not vanish: today's history carries a patch-identical twin — same author, same date,
same subject, same `git patch-id` — under a completely different hash [R6]. Somewhere in Bitcoin's
chaotic early conversions, the line of history was rebuilt, the twin went forward, and the original
— the one with the signature on it — was left standing off to the side like a demolished building's
doorway. A tag is not decoration on history. Sometimes it is the only witness to a version of
history the branches walked away from, and "everything important is reachable from `main`" is an
assumption a signed critical release is quietly disproving.

The same reading turns tag headers into a staffing chart. In December 2021, during the Log4Shell
emergency, the three patch releases that fought the fire — 2.15.0, 2.16.0, 2.17.0 — were tagged in
eight days by three *different* people, Ralph Goers, Matt Sicker, and Gary Gregory, and 2.17.0's
release commit was authored by Goers the night before Gregory tagged it [R8].
<!-- VERIFIED: Log4Shell = CVE-2021-44228, disclosed 2021-12-09/10; 2.15.0/2.16.0/2.17.0 were the emergency-response releases. https://www.cisa.gov/news-events/alerts/2021/12/10/apache-log4j-vulnerability-cve-2021-44228 and https://logging.apache.org/log4j/2.x/security.html -->
No changelog records the hand-off; the `tagger` field does. When people say the world's
infrastructure runs on a handful of tired volunteers passing a baton, this is the primary source:
three names, eight days, one burning project.

## At home

The habit costs one command. Next time you rely on a release tag — before you build from it, cite
it, or trust it — read the object instead of the ref:

```console
$ git cat-file -p refs/tags/v1.2.3
```

Four lines, a message, and maybe a signature block. Read each with the right suspicion: the
`tagger` is a claim, not a verified identity; a `-----BEGIN PGP SIGNATURE-----` is signature
*material*, not proof anything verified it (to actually check it you need the key, and `git tag -v`
will tell you the rest); and the object in the first line is what the signature reaches — which is
not a promise that the tarball you are about to install matches it. Then ask the one question your
risk actually turns on. If it is provenance, verify the signature against a key you trust. If it is
"am I running what this names," check reachability with `git merge-base --is-ancestor`. And if it is
xz's question — does the artifact match the attested tree — then compare them, because that gap is
boring scaffolding in ten thousand projects and, in exactly one, was the worst supply-chain attack
ever shipped. Nothing looks in that gap for you. That is why it is the place to look.

## Receipts

- **R1** `git -C repos/openssl tag -v OpenSSL_1_0_1g` — annotated tag, tagger Dr. Stephen Henson, 2014-04-07; `error: no signature found`.
- **R2** `git -C repos/openssl show -s ... 96db9023b881...` + `merge-base --is-ancestor` + `cat-file -p refs/tags/OpenSSL_1_1_0-pre6` — the Heartbleed bounds-check fix authored 2014-04-06T00:51, an ancestor of the 1.0.1g release commit (same-second tag at 2014-04-07T17:55); the 2016 pre6 tag carries a PGP block, tagger Matt Caswell.
- **R3** `git -C repos/xz cat-file -p refs/tags/v5.6.0` (and `v5.6.1`) — poisoned-release tags carry PGP signature blocks, tagger Jia Tan, 2024.
- **R4** `git -C repos/xz cat-file -e 'v5.6.0^{tree}:m4/build-to-host.m4'` (absent, both tags) + `log --all -- m4/build-to-host.m4` (zero commits) + `log -S 'build-to-host.m4' -- m4/.gitignore` — the signed trees omit the payload path; the ignore-list line is Jia Tan's, 2024-02-15, nine days before 5.6.0.
- **R5** `git -C repos/bitcoin cat-file -p refs/tags/v0.3.20.2` — signed tag, tagger Gavin Andresen, 2011-03: "critical bug-fix release"; target commit `52248a757b...`.
- **R6** `merge-base --is-ancestor` (no) + `for-each-ref --contains` (only the tag) + `git patch-id --stable` — the signed commit is outside HEAD's history; HEAD carries a patch-identical twin `f36b494aeb...` under a different hash.
- **R8** `for-each-ref` + `cat-file -p` on `rel/2.15.0`, `rel/2.16.0`, `rel/2.17.0` — three PGP-bearing tags across eight days of December 2021; taggers Ralph Goers, Matt Sicker, Gary Gregory; 2.17.0's target commit authored by Goers, tagged by Gregory.
