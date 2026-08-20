# Remove Dual EC DRBG again...

Almost every secure connection you have ever made — every padlock in a browser, every online
payment — was protected, at some point over the last twenty-five years, by a single piece of
free software called OpenSSL. And for much of that time, the cryptographic heart of OpenSSL was
maintained, to a startling degree, by one man: Dr. Stephen Henson.

This is the story of six changes he made to one piece of that software, told entirely through
the little one-line notes programmers attach to their work. Lined up in order, those notes read:

> Add support for Dual EC DRBG.
> Disable Dual EC DRBG.
> Remove Dual EC DRBG from FIPS module.
> Revert "Remove Dual EC DRBG from FIPS module."
> Remove Dual EC DRBG again...

Add it. Disable it. Remove it. *Un-remove it.* Remove it a second time — and notice the tired
little trailing dots on that last one, the punctuation of someone doing a chore they have done
before. That sequence is the whole chapter. Everything else is understanding why a person would
delete the same thing twice, with an undo in between.

## What the thing was

Dual EC DRBG is a random-number generator. In cryptography, that is not a minor part — it is the
whole foundation. Every secret key is built from random numbers, and if someone can *predict*
your random numbers, they can predict your keys, and your encryption protects nothing. So the
one component you most need to trust is the one making the randomness.

Dual EC was a generator blessed by the US government's official standards body in the mid-2000s.
<!-- CHECK: Dual EC DRBG standardized in NIST SP 800-90A (2006) — public record. -->
It is also, now, the most infamous crypto algorithm of its generation. In 2013, leaked documents
brought into the open a suspicion cryptographers had harbored for years: that Dual EC had been
built with a hidden mathematical trapdoor — a secret relationship in its numbers that would let
whoever designed it predict everything it produced. The standards body eventually withdrew it.
<!-- CHECK: 2013 (Snowden-era) reporting linked Dual EC to a suspected NSA backdoor; NIST withdrew it in 2014 — public record. -->

You do not have to take any of that on faith to feel this story, though, because Henson told you
plainly how much he trusted the whole family of generators Dual EC arrived in. Six months before
he added it, he checked in the foundational code with a note describing it as, and this is a
direct quote: *"untested, probably not working, incomplete."* That is the ground Dual EC was
built on. He added it anyway — because it was in the government standard, and OpenSSL's job is to
implement the standard.

## Disable, remove, and then — put it back

In September 2013, days after the trapdoor story broke, Henson moved against it. First, at 5:23
in the morning, he didn't delete Dual EC but built a barrier in front of it: the generator would
now refuse to run unless a programmer deliberately switched it on with a setting whose very name,
`ALLOW_DUAL_EC_DRBG`, was a warning. Three months later, in December, he stopped hedging and cut
it out completely — a deletion of over two thousand lines.

That should have been the end. The suspect algorithm, deleted by the one person most entitled to
delete it, right after the world learned what it likely was. But five months later, in May 2014,
he put all two thousand lines back.

The note explaining why is the heart of the whole chapter, and the striking thing is how
*bureaucratic* it is. Not "we were forced," not "we were told to." It says the removal *"was not
accepted for 2.0.7 version of the module."*

Here is what that means. That special, security-critical version of OpenSSL wasn't just code — it
was a *certified* build, one that had passed the US government's formal testing program so that
federal agencies were permitted to use it.
<!-- CHECK: FIPS 140-2 is the US government's cryptographic-module validation program — public record. -->
And a certified build is frozen. The exact thing that got approved is the only thing you're
allowed to ship under that approval. So *any* change to it — even removing a suspected backdoor —
creates something that is no longer the approved thing, and now needs its own approval. Henson's
deletion was itself a change awaiting sign-off. And as of that version, the note tells us, the
sign-off had not come. So the code snapped back to matching the certificate: two thousand lines
of a suspect generator, restored by the very hand that had twice tried to remove it.

Who withheld the approval, and why — whether it was a real objection, a paperwork step, or just
bad timing — the record does not say, and I won't pretend otherwise. What it shows, plainly, is
the direction things flowed: the deletion was waiting on an approval, the approval wasn't there,
and so the certificate won and the code went back. (And to be exact: putting the *code* back is
not proof anyone was *running* it — the "off" switch from September was still there. What
returned was the source, inside the certified package.)

It's worth pausing on what else was happening that month. May 2014 was not a calm time to be the
person maintaining OpenSSL's crypto alone. Five weeks earlier, Heartbleed — the flaw that put
every padlock on the internet in doubt — had erupted out of this same codebase, with Henson at
the center of the emergency.
<!-- CHECK: Heartbleed (CVE-2014-0160) was disclosed 2014-04-07, in OpenSSL — public record. -->
He wrote the Heartbleed fix in April. In May, in the same stretch of days, he sat down and typed
the note putting Dual EC back. Two security stories running in opposite directions, one very
tired maintainer, the same weeks.

Two months later, the approval finally came through, and he removed Dual EC a second time — *"now
accepted for 2.0.8 onwards"* — this time for good. Those trailing dots in the note are what a
person types when they are deleting something for the second time, having watched it come back
once.

## The hand behind all of it

Every one of those six notes carries the same signature. Henson's first contribution to OpenSSL
was on New Year's Day, 1999. Across the next decade and a half he wrote something like a *third*
of the entire codebase — Heartbleed in and Heartbleed out, Dual EC in and Dual EC out, all of it.

And then his name stops. His final contribution is a routine housekeeping change, made at 2:41 in
the morning in late 2017. After that: nothing. The record does not say why, and I won't invent a
reason. It says only that the name attached to the entire Dual EC saga, and to a third of the
software around it, appears for the last time in the small hours of a night in 2017, and never
again.

## At home

If you take one habit from this, take this one: when you want the true story of how a project made
some decision, don't read one change in isolation — read the little notes as a *sequence*. A lone
"remove X" tells you nothing. *Add / disable / remove / un-remove / remove-again* is an entire
institution arguing with itself, laid out on a single screen. And when you find a change whose
note blames not a *bug* but an *approval* — "not accepted," "now accepted," "required by" — you've
found the exact seam where some process outside the code reached in and shaped it, and where a
tired maintainer was honest enough to write down why, instead of quietly hiding it. Those notes
are the most truthful thing a project keeps, because they record something the author plainly
wished they hadn't had to do.

---

*The six commit messages, the "untested, probably not working" warning, the disable-then-remove,
the "not accepted for 2.0.7" revert and its "now accepted for 2.0.8" resolution, and the
maintainer's last commit at 2:41 a.m. are all real and public, reproducible with a git command
each. The full technical dig is here: [Remove Dual EC DRBG again... — the full dig](14-openssl.full.html).*
