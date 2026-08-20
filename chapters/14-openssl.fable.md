# Remove Dual EC DRBG again...

One algorithm, one maintainer, six commits, in his own subject lines:

```console
$ git -C repos/openssl log --all --reverse --grep='Dual EC' --format='%h %ai %s'
7fdcb45745 2011-09-09 17:16:43 +0000 Add support for Dual EC DRBG from SP800-90...
a4870de5aa 2013-09-16 05:23:44 +0100 Disable Dual EC DRBG.
b49df9502e 2013-09-16 05:23:44 +0100 Disable Dual EC DRBG.
200f249b8c 2013-12-09 21:54:50 +0000 Remove Dual EC DRBG from FIPS module.
3b43568d5b 2014-05-12 18:35:30 +0100 Revert "Remove Dual EC DRBG from FIPS module."
7fb7844f3b 2014-07-11 19:12:21 +0100 Remove Dual EC DRBG again...
```

[R7] Add. Disable. Remove. *Revert the removal.* Remove again — the last one with an ellipsis,
the tired trailing dots of a chore you have done before. Everything you need is on that one
screen; the rest of this chapter is learning to read it. The name on every line is
Dr. Stephen Henson, who for a stretch of years was very nearly the entire cryptographic core of
OpenSSL by himself.

## What Dual EC was

Dual EC DRBG is a random number generator, and for cryptography a random number generator is
not a detail — it is the whole game. Every key you make, every session you secure, is only as
unguessable as the numbers underneath it; predict the generator and you predict the keys, and
the encryption is theatre. Dual EC was one such generator, standardized by the US government's
standards body in the mid-2000s.
<!-- CHECK: Dual EC DRBG standardized in NIST SP 800-90A (2006) — public record. -->
It is also, today, the most notorious cryptographic algorithm of its era: in 2013, leaked
documents made public a long-held suspicion among cryptographers that Dual EC carried a
deliberate mathematical backdoor — a relationship, hidden in its constants, that would let
whoever chose those constants predict its output. The standards body later withdrew it.
<!-- CHECK: 2013 (Snowden-era) reporting linked Dual EC DRBG to a suspected NSA backdoor; NIST withdrew it from SP 800-90A in 2014 — public record, not provable from this repo. -->

You do not have to trust any of that to feel the story in the git, because the man who added
Dual EC told you how much he trusted the whole family it came in. Six months before Dual EC, he
laid the groundwork with a subject line that is one of the most honest I have read:

```console
$ git -C repos/openssl show -s --format='%h %ai %s' 591cbfae3c
591cbfae3c 2011-03-04 18:00:21 +0000 Initial, provisional, subject to wholesale change,
untested, probably not working, incomplete and unused SP800-90 DRBGs...
```

[R1] `untested, probably not working, incomplete`. That is the soil Dual EC was planted in. Six
months later it arrives for real — two thousand lines of it [R2] — because it was in the
government standard, and OpenSSL implements the standard.

## Disable, then remove

September 2013, days after the backdoor stories broke. At 05:23 in the morning, Henson does not
delete the algorithm — he builds a gate in front of it:

```console
$ git -C repos/openssl show a4870de5aa -- crypto/rand/rand_lib.c | grep -E '^\+' | grep -vE '^\+\+\+' | head -5
+#ifndef OPENSSL_ALLOW_DUAL_EC_DRBG
+	if (fips_drbg_type >> 16)
+		{
+		RANDerr(RAND_F_RAND_INIT_FIPS, RAND_R_DUAL_EC_DRBG_DISABLED);
+		return 0;
```

[R3] The generator will now refuse to start unless you compile with a flag literally named
`OPENSSL_ALLOW_DUAL_EC_DRBG` — you must reach past a guard whose own name is a warning to make
the suspect thing run. Three months after that, December, he stops gating and starts cutting:

```console
$ git -C repos/openssl show --stat --format= 200f249b8c | tail -1
 8 files changed, 2 insertions(+), 2265 deletions(-)
```

[R4] `Remove Dual EC DRBG from FIPS module` — 2,265 lines gone. Every instinct says the story
ends here, with the right outcome: the suspect algorithm, disabled and then deleted from the
security-critical module by the person who maintains it, in the months after the world learned
what it probably was.

## Not accepted

Five months later, he puts all 2,265 lines back.

```console
$ git -C repos/openssl show -s --format=fuller 3b43568d5b | head -8
Author:     Dr. Stephen Henson <steve@openssl.org>
AuthorDate: Mon May 12 18:35:30 2014 +0100

    Revert "Remove Dual EC DRBG from FIPS module."

    Revert Dual EC DRBG removal commit as it was not accepted for 2.0.7
```

[R5] Read the reason the way an engineer reads a diff, one word at a time, because every word is
doing work and none of it is the word you expect. *Not accepted* — passive, no subject; the
sentence does not say who did not accept it, and neither will the rest of the repository. *For
2.0.7* — the decision is pinned to a specific version of something. That something is the thing
the commits keep naming: the `FIPS module`, a specially packaged build of OpenSSL's
cryptography that has passed the US government's formal validation program.
<!-- CHECK: FIPS 140-2 is the US government cryptographic-module validation program; "the OpenSSL FIPS Object Module" was the validated build — public record. -->
A validated module is not ordinary code. The thing that was certified is one frozen artifact,
and *any* change to it — including deleting a suspected backdoor — makes a version that is no
longer the version that was approved. So the removal was itself a change that had to be
accepted, and this commit says, in the plainest possible terms, that as of 2.0.7 it had not
been. What the git does not say is who withheld the acceptance, or why, or whether it was a
substantive objection, a procedural step, or a matter of timing. It says only that the deletion
was waiting on an approval, and the approval had not come, and so the code went back to matching
the certificate — 2,265 lines of a generator its own maintainer had already tried twice to be
rid of, restored to the module by the same hand.

There is one thing this restoration is *not*, and the distinction matters: putting the source
back is not proof anyone was running it. The default was still the gate at 05:23; what returned
was the code, in the certified build, not a demonstration that the suspect generator was live in
anything shipped. The drama is the direction of the dependency, not a proven exploit.

Sit for a second in what that Monday held. May 2014 is not a quiet month for the man maintaining
OpenSSL's cryptography alone. Heartbleed — the vulnerability that put the whole internet's
padlocks in doubt — had been disclosed five weeks earlier, out of this same codebase, with
Henson at the center of the response.
<!-- CHECK: Heartbleed (CVE-2014-0160) was publicly disclosed 2014-04-07, in OpenSSL — public record. -->
He wrote the Heartbleed fix in April. In May, in the same weeks, he is at his keyboard typing
`Revert "Remove Dual EC DRBG from FIPS module."` — restoring the era's most notorious algorithm
to the validated build because a version of that build had not accepted its removal. Two
security stories, opposite directions, one exhausted maintainer, the same month.

Two months later, the ellipsis:

```console
$ git -C repos/openssl show -s --format='%s%n%n%b' 7fb7844f3b
Remove Dual EC DRBG again...

Dual EC DRBG removal now accepted for 2.0.8 onwards.
```

[R6] *Now accepted for 2.0.8 onwards.* Read those words too. *Now* — a state has changed. *For
2.0.8 onwards* — and the change is not a one-off but a boundary: from this version forward, the
removal stands. The trailing dots are what a person types when they are deleting a thing for the
second time, having watched it come back once. In October he took the entire FIPS apparatus out
of the main branch [R8]; OpenSSL would not carry a validated module for years afterward.

~ The deletion needed accepting.

## The hand that typed all of it

Every commit in that biography has the same name on it — the honest health warning, the
addition, the gate, the removal, the revert, the remove-again. Henson's first commit is New
Year's Day, 1999 [R9]; across the 2000s and early 2010s he wrote something like a third of the
tree, Heartbleed in and Heartbleed out, Dual EC in and Dual EC out. And then:

```console
$ git -C repos/openssl log --author=Henson --format='%h %aI %s' | head -1
549be25303 2017-10-12 02:41:27 +0100 make update
$ git -C repos/openssl log --author=Henson --since=2018-01-01 --oneline | wc -l
0
```

[R9] His last commit is `make update`, a routine regeneration, at 02:41 in the morning in late
2017. After that, nothing. The git does not say why, and I will not pretend it does. It says
only that the name on the entire Dual EC sequence — and on a third of the codebase around it —
appears for the last time at two in the morning, and never again.

## At home

The habit from this dig is to read commit *subjects* as a sequence rather than one at a time. A
lone `Remove X` tells you nothing; `Add X / Disable X / Remove X / Revert "Remove X" / Remove X
again...` is an institution arguing with itself, and `git log --grep='<feature>' --reverse`
lays the whole argument on one screen with the dates attached. Then read the revert *bodies* the
way you would read a tricky diff — word by word, noticing what they don't say. When a revert
blames not a bug but an *acceptance* — "not accepted for," "now accepted for," "required by" —
you have found the seam where some process outside the code shaped the code, and a maintainer
was decent enough to name the process in the message instead of burying it in a rebase. Those
commits are the most honest documents a project keeps, precisely because they record something
the author would plainly rather not have typed. And when the same name is on every commit of a
long sequence and then stops, note the date and resist the urge to explain it. `git log
--author=` can prove a presence and prove an absence. It cannot tell you the reason for either,
and the discipline of this whole book is to say only what the objects say.

## Receipts

- **R1** `git -C repos/openssl show -s 591cbfae3c` — 2011-03-04, Henson: "Initial, provisional, subject to wholesale change, untested, probably not working, incomplete and unused SP800-90 DRBGs…"
- **R2** `git -C repos/openssl show -s 7fdcb45745` + `--stat` — 2011-09-09, "Add support for Dual EC DRBG from SP800-90," +2,121 lines.
- **R3** `git -C repos/openssl show a4870de5aa -- crypto/rand/rand_lib.c` — 2013-09-16 05:23, "Disable Dual EC DRBG": refuses to instantiate unless compiled with `OPENSSL_ALLOW_DUAL_EC_DRBG`.
- **R4** `git -C repos/openssl show -s 200f249b8c` + `--stat` — 2013-12-09, "Remove Dual EC DRBG from FIPS module," 8 files, −2,265 lines.
- **R5** `git -C repos/openssl show -s --format=fuller 3b43568d5b` — 2014-05-12, "Revert 'Remove Dual EC DRBG from FIPS module.'": "as it was not accepted for 2.0.7 version of the module."
- **R6** `git -C repos/openssl show -s 7fb7844f3b` — 2014-07-11, "Remove Dual EC DRBG again...": "Dual EC DRBG removal now accepted for 2.0.8 onwards."
- **R7** `git -C repos/openssl log --all --reverse --grep='Dual EC'` — the six-commit biography on one screen: add / disable / disable / remove / revert / remove-again.
- **R8** `git -C repos/openssl show -s 78c990c156` — 2014-10-18, "Remove fipscanister from Configure, delete fips directory": the FIPS apparatus leaves master.
- **R9** `git -C repos/openssl log --author=Henson` first/last + `--since=2018 | wc -l` — Henson's first commit 1999-01-01; last, "make update," 2017-10-12 02:41; zero after.

*Full transcripts: `chapters/14-openssl.receipts.md` (regenerate with `scripts/receipts-14.sh`).*
