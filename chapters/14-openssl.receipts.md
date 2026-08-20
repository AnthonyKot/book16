# Receipts — ch. 14 openssl (the Dual EC remove/revert/remove)

Verbatim outputs against a full clone of openssl/openssl (all branches).
Regenerate with `scripts/receipts-14.sh`. Long outputs truncated editorially (head).

## R1 — 2011: the author's own health warning, above a new random-number generator
```
$ git -C repos/openssl show -s --format='%h %ai %an%n%s' 591cbfae3c
591cbfae3c 2011-03-04 18:00:21 +0000 Dr. Stephen Henson
Initial, provisional, subject to wholesale change, untested, probably not working, incomplete and unused SP800-90 DRBGs for CTR and Hash modes.
```

## R2 — six months later: Dual EC is added
```
$ git -C repos/openssl show -s --format='%h %ai %an%n%s' 7fdcb45745
7fdcb45745 2011-09-09 17:16:43 +0000 Dr. Stephen Henson
Add support for Dual EC DRBG from SP800-90. Include updates to algorithm tests and POST code.
```

```
$ git -C repos/openssl show --stat --format= 7fdcb45745 | tail -1
 11 files changed, 2121 insertions(+), 11 deletions(-)
```

## R3 — Sept 2013, 05:23: disabled by default on the release line
```
$ git -C repos/openssl show -s --format='%h %ai %an%n%s' a4870de5aa
a4870de5aa 2013-09-16 05:23:44 +0100 Dr. Stephen Henson
Disable Dual EC DRBG.
```

```
$ git -C repos/openssl show a4870de5aa -- crypto/rand/rand_lib.c | grep -E '^\+' | grep -vE '^\+\+\+' | head -6
+#ifndef OPENSSL_ALLOW_DUAL_EC_DRBG
+	if (fips_drbg_type >> 16)
+		{
+		RANDerr(RAND_F_RAND_INIT_FIPS, RAND_R_DUAL_EC_DRBG_DISABLED);
+		return 0;
+		}
```

## R4 — Dec 2013: removed from the FIPS module entirely (−2265)
```
$ git -C repos/openssl show -s --format='%h %ai %an%n%s' 200f249b8c
200f249b8c 2013-12-09 21:54:50 +0000 Dr. Stephen Henson
Remove Dual EC DRBG from FIPS module.
```

```
$ git -C repos/openssl show --stat --format= 200f249b8c | tail -1
 8 files changed, 2 insertions(+), 2265 deletions(-)
```

## R5 — May 2014: the removal is REVERTED, and the body says why
```
$ git -C repos/openssl show -s --format=fuller 3b43568d5b | head -9
commit 3b43568d5bae85196834f9ca3339b32a77ab2c4b
Author:     Dr. Stephen Henson <steve@openssl.org>
AuthorDate: Mon May 12 18:35:30 2014 +0100
Commit:     Dr. Stephen Henson <steve@openssl.org>
CommitDate: Mon May 12 18:35:30 2014 +0100

    Revert "Remove Dual EC DRBG from FIPS module."
    
    Revert Dual EC DRBG removal commit as it was not accepted for 2.0.7
```

## R6 — July 2014: removed again — the ellipsis, and the reason
```
$ git -C repos/openssl show -s --format='%s%n%n%b' 7fb7844f3b
Remove Dual EC DRBG again...

Dual EC DRBG removal now accepted for 2.0.8 onwards.

```

## R7 — the whole biography of the algorithm, chronological, in the maintainer's own subjects
```
$ git -C repos/openssl log --all --reverse --grep='Dual EC' --format='%h %ai %s'
7fdcb45745 2011-09-09 17:16:43 +0000 Add support for Dual EC DRBG from SP800-90. Include updates to algorithm tests and POST code.
a4870de5aa 2013-09-16 05:23:44 +0100 Disable Dual EC DRBG.
b49df9502e 2013-09-16 05:23:44 +0100 Disable Dual EC DRBG.
200f249b8c 2013-12-09 21:54:50 +0000 Remove Dual EC DRBG from FIPS module.
3b43568d5b 2014-05-12 18:35:30 +0100 Revert "Remove Dual EC DRBG from FIPS module."
7fb7844f3b 2014-07-11 19:12:21 +0100 Remove Dual EC DRBG again...
```

## R8 — Oct 2014: on master, the whole FIPS apparatus is deleted
```
$ git -C repos/openssl show -s --format='%h %ai %an%n%s' 78c990c156
78c990c156 2014-10-18 23:46:00 +0100 Dr. Stephen Henson
Remove fipscanister from Configure, delete fips directory
```

## R9 — the man who wrote the whole sequence: first line, last line, then gone
```
$ git -C repos/openssl log --reverse --author=Henson --format='%h %aI %s' | head -1
ebc828cad9 1999-01-01T18:43:44+00:00 Add extended key usage OID and update STATUS file.
```

```
$ git -C repos/openssl log --author=Henson --format='%h %aI %s' | head -1
549be25303 2017-10-12T02:41:27+01:00 make update
```

```
$ git -C repos/openssl log --author=Henson --since=2018-01-01 --oneline | wc -l   # nothing after 2017
0
```

