# Receipts — ch. 08 the corporate costume (cross-repo)

Verbatim outputs against full clones of microsoft/MS-DOS, twitter/the-algorithm, swiftlang/swift.
Regenerate with `scripts/receipts-08.sh`. Long outputs truncated editorially (head).

## R1 — msdos: the first four commits; two claim the 1980s
```
$ git -C repos/msdos log --reverse --format=%h\ %aI\ %cI\ %an\ %s
b1e80fe 2018-09-21T17:47:37-07:00 2018-09-21T17:47:37-07:00 Rich Turner Initial commit
fce0f75 1982-03-03T16:51:26-08:00 2018-09-21T17:51:26-07:00 Rich Turner MS-DOS v1.25 Release
80ab2fd 1983-08-12T17:53:34-07:00 2018-09-21T17:53:34-07:00 Rich Turner MS-DOS v2.0 Release
a527b9a 2018-09-29T02:12:15+01:00 2018-09-29T02:12:15+01:00 Nicola Heald Fix the license link
```

## R2 — msdos: the 1982 commit's two dates share a clock second, 36 years apart
```
$ git -C repos/msdos show -s --format=fuller fce0f75959 80ab2fddfd | grep -E 'commit|Date'
commit fce0f75959b9806f4016beb7b19e19b37cc97b6c
AuthorDate: Wed Mar 3 16:51:26 1982 -0800
CommitDate: Fri Sep 21 17:51:26 2018 -0700
commit 80ab2fddfdf30f09f0a0a637654cbb3cd5c7baa6
AuthorDate: Fri Aug 12 17:53:34 1983 -0700
CommitDate: Fri Sep 21 17:53:34 2018 -0700
```

## R3 — msdos: where the calendar dates came from — the files' own revision banners
```
$ git -C repos/msdos show fce0f75959:v1.25/source/MSDOS.ASM | grep -n '03/03/82' | head -2
31:; 1.25 03/03/82 Put marker (00) at end of directory to speed searches
```

```
$ git -C repos/msdos show 80ab2fddfd:v2.0/source/MSHEAD.ASM | grep -n '08/12/83' | head -2
99:; 2.11 08/12/83 Dos split into several more modules for assembly on
```

## R4 — msdos: a 16 December 2013 email, blamed to 3 March 1982
```
$ git -C repos/msdos blame -- v1.25/Tim_Paterson_16Dec2013_email.txt | sed -n '1,4p'
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800  1) From: Tim Paterson 
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800  2) To: Len Shustek 
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800  3) Date: Mon, 16 Dec 2013 10:34:17 -0800
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800  4) Subject: RE: Source code to MS-DOS 1.0
```

## R5 — msdos: the 1982 folder was still being revised in 1983 — the stamp covers a drawer, not a day
```
$ git -C repos/msdos blame -L 20,24 -- v1.25/source/ASM.ASM
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800 20) ;		  allow expressions with *, /, and ()
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800 21) ; 07/04/82  2.41  Fix Intel's 8087 "reverse-bit" bug; don't copy date
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800 22) ; 08/18/82  2.42  Increase stack from 80 to 256 (Damn! Overflowed again!)
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800 23) ; 01/05/83  2.43  Correct over-zealous optimization in 2.42
fce0f759 (Rich Turner 1982-03-03 16:51:26 -0800 24) ; 05/09/83  2.44  Add memory usage report
```

## R6 — msdos: MZ is back — the one author who was in the room
```
$ git -C repos/msdos show -s --format=fuller 2d04cacc53 | head -8
commit 2d04cacc5322951f187bb17e017c12920ac8ebe2
Author:     Mark Zbikowski <mark@zbikowski.org>
AuthorDate: Thu Apr 25 21:24:10 2024 +0100
Commit:     Microsoft Open Source <microsoftopensource@users.noreply.github.com>
CommitDate: Thu Apr 25 22:32:27 2024 +0000

    MZ is back!
```

```
$ git -C repos/msdos show --shortstat --format= 2d04cacc53 | tail -1
 1339 files changed, 527719 insertions(+), 3 deletions(-)
```

## R7 — msdos: the roster — full names in the 1983 tree, initials in the 1985-sourced tree
```
$ git -C repos/msdos blame -L 3,9 -- v2.0/source/MSHEAD.ASM
80ab2fdd (Rich Turner 1983-08-12 17:53:34 -0700 3) ; MS-DOS  High-performance operating system for the 8086  version 1.28
80ab2fdd (Rich Turner 1983-08-12 17:53:34 -0700 4) ;       by Microsoft MSDOS development group:
80ab2fdd (Rich Turner 1983-08-12 17:53:34 -0700 5) ;           Tim Paterson (Ret.)
80ab2fdd (Rich Turner 1983-08-12 17:53:34 -0700 6) ;           Aaron Reynolds
80ab2fdd (Rich Turner 1983-08-12 17:53:34 -0700 7) ;           Nancy Panners (Parenting)
80ab2fdd (Rich Turner 1983-08-12 17:53:34 -0700 8) ;           Mark Zbikowski
80ab2fdd (Rich Turner 1983-08-12 17:53:34 -0700 9) ;           Chris Peters (BIOS) (ret.)
```

```
$ git -C repos/msdos blame -L 5,10 -- v4.0/src/INC/MSHEAD.ASM
2d04cacc (Mark Zbikowski 2024-04-25 21:24:10 +0100  5) ;	by Microsoft MSDOS development group:
2d04cacc (Mark Zbikowski 2024-04-25 21:24:10 +0100  6) ;	    TP (Ret.)
2d04cacc (Mark Zbikowski 2024-04-25 21:24:10 +0100  7) ;	    AR
2d04cacc (Mark Zbikowski 2024-04-25 21:24:10 +0100  8) ;	    NP (Parenting)
2d04cacc (Mark Zbikowski 2024-04-25 21:24:10 +0100  9) ;	    MZ
2d04cacc (Mark Zbikowski 2024-04-25 21:24:10 +0100 10) ;	    CP (BIOS) (ret.)
```

## R8 — msdos: the sign on the door, 2018 vs 2024
```
$ git -C repos/msdos log -S 'Contribute!' --format='%h %aI %an %s' -- README.md
a5eb02a 2024-04-25T00:33:46+00:00 Microsoft Open Source Moving localized READMEs
b1e80fe 2018-09-21T17:47:37-07:00 Rich Turner Initial commit
```

```
$ git -C repos/msdos show a5eb02a4d7 -- README.md | grep -E '^[-+]#' 
-# Contribute!
+# For historical reference
```

## R9 — the-algorithm: genesis confesses it is the second genesis
```
$ git -C repos/the-algorithm log --reverse --format=%H%n\ \ %aI\ %cI%n\ \ %an\ \<%ae\>%n\ \ %s%n\ \ %b --max-parents=0
ef4c5eb65e6e04fac4f0e1fa8bbeff56b75c1f98
  2023-03-31T17:36:31-05:00 2023-03-31T17:36:31-05:00
  twitter-team <>
  Twitter Recommendation Algorithm
  Please note we have force-pushed a new initial commit in order to remove some publicly-available Twitter user information. Note that this process may be required in the future.

```

## R10 — the-algorithm: the scrub — authored before the dump, committed three minutes after
```
$ git -C repos/the-algorithm log --reverse --format='%h %aI %cI %s' | head -3
ef4c5eb 2023-03-31T17:36:31-05:00 2023-03-31T17:36:31-05:00 Twitter Recommendation Algorithm
64e7548 2023-03-31T13:15:49-07:00 2023-03-31T17:39:21-05:00 Fix simclusters README
ec83d01 2023-03-31T13:39:57-07:00 2023-03-31T17:39:34-05:00 Remove stats collection code measuring how often Tweets from specific user groups are served
```

```
$ git -C repos/the-algorithm show --shortstat --format=fuller ec83d01dca | head -9
commit ec83d01dcaebf369444d75ed04b3625a0a645eb9
Author:     twitter-team <>
AuthorDate: Fri Mar 31 13:39:57 2023 -0700
Commit:     twitter-team <>
CommitDate: Fri Mar 31 17:39:34 2023 -0500

    Remove stats collection code measuring how often Tweets from specific user groups are served

 5 files changed, 3 insertions(+), 66 deletions(-)
```

## R11 — the-algorithm: what the scrub removed
```
$ git -C repos/the-algorithm show ef4c5eb65e:home-mixer/.../HomeTweetTypePredicates.scala | grep -n 'author_is_' | head -6
225:      "author_is_elon",
230:      "author_is_power_user",
236:      "author_is_democrat",
242:      "author_is_republican",
```

```
$ git -C repos/the-algorithm show ef4c5eb65e:home-mixer/.../RequestQueryFeatureHydrator.scala | grep -n -A3 'purely for metrics'
87:       * These author ID lists are used purely for metrics collection. We track how often we are
88-       * serving Tweets from these authors and how often their tweets are being impressed by users.
89-       * This helps us validate in our A/B experimentation platform that we do not ship changes
90-       * that negatively impacts one group over others.
```

## R12 — the-algorithm: the file the code still names, which never existed here
```
$ git -C repos/the-algorithm show ef4c5eb65e:home-mixer/.../HomeMixerResourcesModule.scala | grep -n 'authors.yml'
12:  private val AuthorsFile = "/config/authors.yml"
```

```
$ git -C repos/the-algorithm log --all --full-history --oneline -- '**/authors.yml' | wc -l
0
```

## R13 — the-algorithm: the mask — the whole shortlog
```
$ git -C repos/the-algorithm shortlog -sn --all
    25	twitter-team
     3	dzhao
     2	Pouriya Jahanbakhsh
     1	Auro
```

```
$ git -C repos/the-algorithm log --format='%h %aI %an <%ae> %s' --all | grep -v 'twitter-team' | tail -3
9115361 2023-03-31T17:52:31-07:00 Auro <35087590+MrAuro@users.noreply.github.com> (docs): Improve README file for Navi
ee5e7fc 2023-04-01T02:33:51+03:30 Pouriya Jahanbakhsh <pouriya.jahanbakhsh@gmail.com> feat(navi/dr_transform): add filename:line to file reader error message
2dbdfe1 2023-04-01T02:21:44+03:30 Pouriya Jahanbakhsh <pouriya.jahanbakhsh@gmail.com> ref(navi/dr_transform): fix clippy & formatting issues
```

## R14 — the-algorithm: 783 days of silence, then the sequel
```
$ git -C repos/the-algorithm log --format='%h %aI %cI %s' 72eda9a24f^..c54bec0d4e
c54bec0 2025-09-03T15:46:53-05:00 2025-09-03T15:46:53-05:00 update for-you recommendations code
72eda9a 2023-07-07T14:01:54-07:00 2023-07-13T16:33:04+05:30 [opensource] Update home mixer with latest changes
```

```
$ git -C repos/the-algorithm show --shortstat --format= c54bec0d4e | tail -1
 988 files changed, 65319 insertions(+), 3195 deletions(-)
```

## R15 — the-algorithm: the labels come back wearing Grok, with the same defense re-typed
```
$ git -C repos/the-algorithm log -S 'grok_politics_left' --all --oneline
c54bec0 update for-you recommendations code
```

```
$ git -C repos/the-algorithm grep -n 'grok_politics' HEAD -- home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/decorator/builder/HomeTweetTypePredicates.scala | head -3
HEAD:home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/decorator/builder/HomeTweetTypePredicates.scala:390:      "grok_politics_neutral", // Purely for metrics tracking. Does not affect the recommendations.
HEAD:home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/decorator/builder/HomeTweetTypePredicates.scala:394:      "grok_politics_left", // Purely for metrics tracking. Does not affect the recommendations.
HEAD:home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/decorator/builder/HomeTweetTypePredicates.scala:398:      "grok_politics_right", // Purely for metrics tracking. Does not affect the recommendations.
```

## R16 — swift: day one of the secret language, kept — an empty tree and a stub
```
$ git -C repos/swift log --reverse --format='%h %aI %an %s' | head -2
18844bc6522 2010-07-17T23:50:59+00:00 Chris Lattner initial swift test
afc81c1855b 2010-07-18T00:04:11+00:00 Chris Lattner initial checkin, nothing much to see here.
```

```
$ git -C repos/swift rev-parse '18844bc652^{tree}'
4b825dc642cb6eb9a060e54bf8d69288fbee4904
```

```
$ git -C repos/swift show afc81c1855:tools/swift/swift.cpp

int main() {
}
```

## R17 — swift: blame says a 2010 file belongs to Swift.org, which did not exist until 2015
```
$ git -C repos/swift show 5e88a21755:lib/Lex/Lexer.cpp | head -6
//===--- Lexer.cpp - Swift Language Lexer ---------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2015 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
```

```
$ git -C repos/swift blame -L 3,5 5e88a21755 -- lib/Lex/Lexer.cpp
5e88a2175579 (Chris Lattner 2010-07-18 00:48:07 +0000 3) // This source file is part of the Swift.org open source project
5e88a2175579 (Chris Lattner 2010-07-18 00:48:07 +0000 4) //
5e88a2175579 (Chris Lattner 2010-07-18 00:48:07 +0000 5) // Copyright (c) 2014 - 2015 Apple Inc. and the Swift project authors
```

```
$ git -C repos/swift log --diff-filter=A --format='%h %aI %an %s' -- LICENSE.txt
39dcf401fab 2015-11-02T16:26:26-08:00 Ted Kremenek Add license text for content of repository.
```

## R18 — swift: what they did NOT scrub — 24,610 internal tickets, starting ten days in
```
$ git -C repos/swift log --grep='rdar' --oneline | wc -l
24610
```

```
$ git -C repos/swift log --reverse --grep='rdar' --format='%h %aI %s' | head -1
35328c4921c 2010-07-27T05:44:01+00:00 testing whether rdar://8238427 is reproducible.
```

## R19 — swift: the five-day keyword and the message that explains its death
```
$ git -C repos/swift log -S 'kw_meth' --reverse --format='%h %aI %s'
504ee85c0ea 2011-07-19T04:19:40+00:00 introduce a 'meth' keyword.
ba2793aa6b6 2011-07-19T04:46:07+00:00 implement parser support for methods, including dox and a testcase.  No AST or sema yet.
0fc77abf5c2 2011-07-24T20:11:35+00:00 Per discussion on swift-dev, unify 'meth' and 'func' syntax into just 'func' syntax where you can optionally declare a receiver type.  This is cleaner both conceptually and in implementation, and eliminates drug references. :)
```

```
$ git -C repos/swift log -1 --format='%B' 0fc77abf5c | head -4
Per discussion on swift-dev, unify 'meth' and 'func' syntax into just 'func' syntax
where you can optionally declare a receiver type.  This is cleaner both conceptually
and in implementation, and eliminates drug references. :)

```

