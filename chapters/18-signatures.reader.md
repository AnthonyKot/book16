# error: no signature found

I run `git tag -v` about as often as I run `git blame` — which is to say almost never, right up
until the moment I need it and it tells me something I didn't want to know. Here is the moment that
taught me to run it.

In April 2014, the OpenSSL project shipped the most anxiously awaited release in its history —
version 1.0.1g, the one that closed the Heartbleed hole while a large share of the internet's
servers stood bleeding their private keys to anyone who asked. Ask git today to verify the
cryptographic signature on that release's tag — the tag cut by the world's most important
cryptography project, at the peak of the worst cryptographic emergency it would ever face — and
here is the complete answer:

```
error: no signature found
```

The release that repaired the internet's encryption is not signed. Not badly signed, not signed
with an expired key — *not signed*. And almost nobody has ever noticed, because almost nobody ever
asks. This is a chapter about the asking: one small command, and the one thing it reliably tells
you — not whether a release is safe, but whether the ceremony you're trusting is even there.

## Four lines and maybe a promise

The whole thing turns on a distinction most working engineers have never needed to draw. The tag
you meet every day is a bookmark: a name pointing at a commit. But git also has the *annotated*
tag — a real object with a little header (what it points at, its name, who made it, when) and a
message. And, optionally, at the very bottom, a cryptographic signature.

Here's the trap: **annotated is not signed.** The header and the ceremony are present either way;
the tagger's name looks equally official in both. The only difference between "a release attested
by its maintainer" and "a note anyone could have typed" is whether a signature block sits at the
bottom — and nothing in normal git use ever shows you the bottom.

And the record is kind to the man who cut that unsigned tag. He authored the Heartbleed fix itself
at 51 minutes past midnight, and tagged the release the same afternoon he shipped it, in the middle
of the worst week of his professional life. The signature guards against an adversary nobody in
that room had spare attention for — exactly the step that evaporates under load. The habit did
arrive later, on calmer releases. It just arrived after the emergency that most needed it, which is
how the habit usually arrives.

So I walked away with a tidy rule: an unsigned release is the thing to worry about. Then I opened a
different repository.

## The signature that vouched for nothing useful

Ten years later, the xz-utils compression library shipped the most infamous poisoned releases in
open-source history — carrying a backdoor into the world's servers. Read one of those release tags
the way we just read OpenSSL's, and there it is: a full cryptographic signature block, the very
thing the panicked OpenSSL release lacked. The attacker *signed his work.* If your rule was
"unsigned is danger, signed is safe," the most dangerous release of the decade sails straight
through, flags flying.

Now look at what that signature actually covers, because the mechanics are the whole lesson. A
signed tag vouches for one specific snapshot of files — the tree it points at. So ask git a simple
question: is the backdoor's delivery file *in* that snapshot? It is not. Across the entire
repository, every branch, all of history, that file was never committed at all. It existed only in
the release *tarball* — the bundle people actually download and install, which is built from the
snapshot and then, in the gap between snapshot and bundle, had the poison slipped in. The signature
wasn't forged. Whatever it vouched for, it vouched for a clean tree — and the weapon rode in the one
part of the shipment no signature named. (Nine days earlier, the same hands had quietly added that
file to git's ignore list, so it would stay invisible if it ever appeared on a developer's disk.)

Set the two releases side by side and they're the same lesson from opposite directions. One
protected the world and carried no attestation. The other wore the full ceremony and attacked the
world. *A signature answers exactly one question — was this the attested snapshot? — and says
nothing about what actually shipped under its name.* Ceremony and safety are not the same axis, and
every instinct that fuses them can be exploited.

## A coda: the fix only a tag remembers

One quicker turn of the same key, because it changes what you think a tag even *is*. In 2011,
Bitcoin's lead maintainer signed a tag for a "critical bug-fix release" — for software that by
then moved real money. Ask the obvious follow-up: is that commit part of today's Bitcoin? No. It's
reachable from exactly one place in the entire repository — the tag itself. Delete the tag and the
signed critical release becomes reachable from nothing. (The fix didn't vanish; today's history
carries an identical change — same author, same date, same diff — under a different hash, left
over from a long-ago rebuild of the project's early history.) A tag isn't just decoration on history. Sometimes it's the only surviving
witness to a version of history the main branch walked away from — and "everything important is
reachable from the main branch" is an assumption a signed critical release is quietly disproving.

The same trick turns tag headers into a staffing chart. During the Log4Shell fire in December 2021,
the three emergency patch releases were signed in eight days by three *different* maintainers, one
of them tagging a release another had prepared the night before. No changelog records that hand-off;
the tag headers do. When people say the world's infrastructure runs on a handful of tired
volunteers passing a baton, this is what the primary source looks like: three names, eight days, one
burning project.

## At home

The habit costs one command. Next time you rely on a release tag — before you build from it, cite
it, or trust it — read the underlying object, not just the name (`git cat-file -p refs/tags/…`).
You'll see four lines, a message, and maybe a signature block. Read each with the right suspicion:
the tagger's name is a claim, not proof of identity; a signature block is cryptographic *material*,
not proof that anything checked it; and the object it points at is not a promise that the file you
actually install matches it. Then ask the one question your situation really turns on — is it *who
made this*, or *am I running what this names*, or xz's question, *does what I install match what was
signed*? Those are three different checks. The signature answers only the first, and only if you
verify it. Nobody looks in the gap for you. That's exactly why it's the place to look.

---

*The unsigned Heartbleed release, the signed xz poison whose clean tree omitted the payload, the
Bitcoin critical fix reachable only from its tag, and the three Log4Shell taggers in eight days are
all real and public, reproducible with a git command each. The full technical dig is here:
[error: no signature found — the full dig](18-signatures.full.html).*
