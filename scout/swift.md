# Scout: swiftlang/swift

- **repo:** https://github.com/swiftlang/swift
- **clone:** `~/book16/repos/swift` (already present; not re-cloned). Do not modify.
- **clone size:** 1.7G on disk (`.git` 1.4G, working tree 301M); `git count-objects -vH` → 1 pack, 1.37 GiB, 2,054,185 objects
- **history span:** 2010-07-17 23:50:59 +0000 → 2026-08-18 23:33:38 -0700
- **commits:** 204301 (`git rev-list --count HEAD`)
- **tip:** `c1d4fa350b8a56147c808a8eb9469e4760591340` Allan Shortlidge, "Merge pull request #91580 …"
- **one root:** `18844bc65229786b96b89a9fc7739c0fc897905e` (empty tree)

```
git -C ~/book16/repos/swift log --reverse --format='%H %aI %an %s' | head -3
18844bc65229786b96b89a9fc7739c0fc897905e 2010-07-17T23:50:59+00:00 Chris Lattner initial swift test
afc81c1855bf711315b8e5de02db138d3d487eeb 2010-07-18T00:04:11+00:00 Chris Lattner initial checkin, nothing much to see here.
5e88a2175579b0b2ed3c4a15fe8c2382601ac321 2010-07-18T00:48:07+00:00 Chris Lattner sketch out lexer and token interfaces.

git -C ~/book16/repos/swift log -1 --format='%H %aI %an %s'
c1d4fa350b8a56147c808a8eb9469e4760591340 2026-08-18T23:33:38-07:00 Allan Shortlidge Merge pull request #91580 from tshortli/override-skipped-in-interface-internal-import
```

Apple open-sourced Swift on 2015-12-03 *with the internal SVN history attached*. The DAG begins on a Saturday night in 2010 as SVN r3, an empty tree. Thirteen minutes later the language is nine files and an empty `main()`. For 356 commits / 361 days the only name is Chris Lattner. The reader can watch a secret language happen: each new Apple name arrives before WWDC 2014; Radar numbers never leave; the Apache header in the 2010 blobs is a lie `git blame` will repeat forever.

---

## 1. Day one is empty. Day one-plus-thirteen-minutes is a stub.

- **find-type:** 3 (first commit) — also 2 (imported-history boundary)
- **hashes:** `18844bc65229786b96b89a9fc7739c0fc897905e` (r3), `afc81c1855bf711315b8e5de02db138d3d487eeb` (r4)
- **date:** Sat 17 Jul 2010 23:50:59 +0000 / Sun 18 Jul 2010 00:04:11 +0000
- **author:** Chris Lattner `<clattner@nondot.org>` (mailmap: `clattner@apple.com`)
- **message:** `initial swift test` / `initial checkin, nothing much to see here.`
- **command:**

```
git -C ~/book16/repos/swift log --max-parents=0 --format='%H %aI %s'
git -C ~/book16/repos/swift rev-parse 18844bc65229786b96b89a9fc7739c0fc897905e^{tree}
git -C ~/book16/repos/swift ls-tree -r --name-only afc81c1855bf711315b8e5de02db138d3d487eeb
git -C ~/book16/repos/swift show afc81c1855bf711315b8e5de02db138d3d487eeb:tools/swift/swift.cpp
```

```
18844bc65229786b96b89a9fc7739c0fc897905e 2010-07-17T23:50:59+00:00 initial swift test
4b825dc642cb6eb9a060e54bf8d69288fbee4904
Makefile
lib/Lex/Lexer.cpp
lib/Lex/Makefile
lib/Makefile
lib/Parse/Makefile
lib/Parse/Parser.cpp
tools/Makefile
tools/swift/Makefile
tools/swift/swift.cpp

int main() {
}
```

The empty-tree hash is git's well-known empty tree. SVN r1 and r2 were not imported. The lexer file at r4 is the line `int X;` and the parser is `int x;`. Every commit through October 2015 ends with a `Swift SVN rN` trailer (27,813 messages). Timezones stay `+00:00` until the git cutover; the first merge appears 2015-11-05.

**Why it is a story.** He is starting a language on a Saturday night and the first object he keeps is a blank. Thirteen minutes later he has a driver that does nothing, two one-line C++ files, and a subject line that is still true: nothing much to see. The moment before the outcome is a compiler engineer who has LLVM in his fingers and no syntax yet, committing into an Apple SVN that will not be public for five years. r3 is the breath before the first word.

**Reader learns:** `git log --reverse | head` on an imported repo is a conversion artifact, not a birth. Check `^{tree}` of the first commit; empty trees and `SVN r3` trailers are how you find the real day one.

**surprise:** 4 (folklore says "Lattner, 2010"; it does not say the first commit is empty)

---

## 2. The language on Sunday has two keywords, and one of them is already doomed

- **find-type:** 3 (first commit / day-one tree)
- **hashes:** `6236deaabc0a9f0841a74fb7cfa5570570ecb884` (keywords), `454dd86c2b8e4867d237efbd7d56be883761b6ad` (first `.swift`), `e1e335610f5f083f036e2456f9e3e531e2e72ab7` (`int` demoted)
- **date:** Sun 18 Jul 2010 18:57:12 +0000 / Mon 19 Jul 2010 03:21:45 +0000 / Wed 4 Aug 2010 05:27:45 +0000
- **author:** Chris Lattner
- **messages:** `implement lexer support for identifiers and our 2 keywords so far.` / `add a testcase` / `int is no longer a keyword, it is a type alias for the new __builtin_int32_type type.`
- **command:**

```
git -C ~/book16/repos/swift show 6236deaabc0a9f0841a74fb7cfa5570570ecb884:include/swift/Parse/Token.h | sed -n '30,50p'
git -C ~/book16/repos/swift show 454dd86c2b8e4867d237efbd7d56be883761b6ad:test/simple.swift
```

```
#define KEYWORD(X) kw_ ## X,
    // Types.
    KEYWORD(int)
//    KEYWORD(uint)
//    KEYWORD(int8)
    KEYWORD(var)
//    KEYWORD(foreach)

// Comment.

var x : int;
var x2 = (4);
var x3 = 4+5*4+12/97;
//var x4 : float = 4+5;
```

By 01:44 he can lex `//` comments. By 18:57 the language is `int` and `var`. `foreach` is already sketched and commented out. Day-three `test/simple.swift` is eight lines and already has the colon type syntax, discarded `float`, and the same arithmetic the lexer commit used as a brag. Seventeen days later (`e1e335610f5f`, SVN r146) `int` is not a keyword. At SVN r100 (`cc15dc4f4a03`, 2010-07-27) he adds `make wc`: "Up to 3400 lines."

**Why it is a story.** The moment before Swift is a language is a man choosing that the first reserved words are a C integer and a mutable binding. He already knows `foreach` is coming and already knows the sized-int ladder, and he comments them out rather than decide. `int` lasts seventeen days as a keyword and forever as a habit. You are watching design happen at the speed of a Saturday–Monday, in a repo nobody outside Apple can see.

**Reader learns:** the first `.def` / token-enum file is the real language spec. `git log -S 'KEYWORD(int)'` plus the first `*.swift` test is day one of a compiler; the README is not.

**surprise:** 4

---

## 3. `git blame` says 2010 files are part of Swift.org

- **find-type:** 2 (planted / dated artifact)
- **hashes:** `5e88a2175579b0b2ed3c4a15fe8c2382601ac321` (2010 lexer, rewritten blob); `39dcf401fab5eaab848a0a44fa1b2d4cb8f1d8ea` (real LICENSE.txt, 2015-11-02)
- **date:** blame attributes the header to 2010-07-18; LICENSE lands 2015-11-02 16:26:26 -0800
- **author (blame):** Chris Lattner, 2010 / Ted Kremenek, 2015
- **message:** `sketch out lexer and token interfaces.` / `Add license text for content of repository.`
- **command:**

```
git -C ~/book16/repos/swift show 5e88a2175579b0b2ed3c4a15fe8c2382601ac321:lib/Lex/Lexer.cpp | head -12
git -C ~/book16/repos/swift blame -L 1,6 5e88a2175579b0b2ed3c4a15fe8c2382601ac321 -- lib/Lex/Lexer.cpp
git -C ~/book16/repos/swift log --diff-filter=A --format='%h %aI %an %s' -- LICENSE.txt
```

```
//===--- Lexer.cpp - Swift Language Lexer ---------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2015 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception

5e88a2175579 (Chris Lattner 2010-07-18 00:48:07 +0000 1) //===--- Lexer.cpp - Swift Language Lexer ---------------------------------===//
5e88a2175579 (Chris Lattner 2010-07-18 00:48:07 +0000 3) // This source file is part of the Swift.org open source project
5e88a2175579 (Chris Lattner 2010-07-18 00:48:07 +0000 5) // Copyright (c) 2014 - 2015 Apple Inc. and the Swift project authors

39dcf401fab 2015-11-02T16:26:26-08:00 Ted Kremenek Add license text for content of repository.
```

Swift.org does not exist in 2010. The Apache header and the 2014–2015 copyright were written into every historical blob when SVN was converted for release. `LICENSE.txt` itself is an honest 2015-11-02 add, a month before the public clone. Blame on the 2010 lexer still names Lattner and 2010 for a sentence that could not have been typed then.

**Why it is a story.** The night before open source they have a choice: ship the secret history dirty, or launder the files so the first thing a journalist's `git blame` prints is a license. They launder. The conversion keeps every Radar, every "sabre" joke, every `meth` keyword — and plants a 2015 identity on 2010 lines. The moment before the outcome is a counsel-and-release checklist that treats the past as a product surface.

**Reader learns:** if a 2010 commit contains a URL or copyright year that did not exist, the history was filtered. Compare `git show ROOT:file` against the first commit that *adds* `LICENSE.txt`. Blame is not a witness after a conversion.

**surprise:** 5

---

## 4. For a year the shortlog is one name. The second name fixes "ins."

- **find-type:** 4 (name that appears)
- **hashes:** `023c9cc431e1b67c83ab9c8763b01dd4d8de972e` (Doug Gregor first); `207ede0bec33a8113096e712be91198e06d01133` (his notes, dated 2001)
- **date:** Wed 13 Jul 2011 18:17:18 +0000 / Tue 19 Jul 2011 00:32:23 +0000
- **author:** Doug Gregor `<dgregor@apple.com>`
- **message:** `Fix a typo` / `Add my notes from skimming the implementation`
- **command:**

```
git -C ~/book16/repos/swift shortlog -sn --since=2010-01-01 --until=2011-01-01 HEAD
git -C ~/book16/repos/swift rev-list --count 023c9cc431e1b67c83ab9c8763b01dd4d8de972e^
git -C ~/book16/repos/swift show 023c9cc431e1b67c83ab9c8763b01dd4d8de972e
git -C ~/book16/repos/swift show --stat --format='%aI %s' 207ede0bec33a8113096e712be91198e06d01133
```

```
   209	Chris Lattner
356
    Fix a typo
    Swift SVN r402
-    <i>// pair_fn is a function that takes two ins and returns a tuple.</i>
+    <i>// pair_fn is a function that takes two ints and returns a tuple.</i>
2011-07-19T00:32:23+00:00 Add my notes from skimming the implementation
 docs/Notes/doug-2001-07-18.txt | 86 +++++++++++++++++++++++++++++
```

2010: 209 commits, 1 author. 2011: 697 commits, 6 authors — Doug, then Ted Kremenek (one CMake commit), Howard Hinnant (string prototype + TIFF diagrams of layouts), John McCall, Dave Zarzycki. Doug's sixth-day file is named `doug-2001-07-18.txt`. The notes already flinch at juxtaposition, one-tuples, and "pushing most control flow into the library." Three weeks later he checks in `docs/Generics.rtf` (`b64c49f97afc`, "Generics manifesto").

**Why it is a story.** Almost a calendar year of one person in a secret repo. The second human's first act is a one-character doc fix, and his second substantial act is a skim-notes file whose filename is off by a decade. He does not yet know he will out-commit the founder. The moment before the outcome is a compiler engineer invited onto a private branch, reading LangRef, and writing down that the clever bits worry him.

**Reader learns:** `git shortlog -sn` sliced by year is a hiring timeline. The first commit from a new name is often a typo; the second is what they actually thought. Filename dates are as forgeable as author dates — and as revealing when they slip.

**surprise:** 4

---

## 5. The first Radar is a deleted newline. 24,610 more follow it out the door.

- **find-type:** 2 (internal artifact that survived) — also 5 (comment/ticket that outlived its code)
- **hash:** `35328c4921cf687d8664ec949ab80095cd4c7d29`
- **date:** Tue 27 Jul 2010 05:44:01 +0000 (SVN r99, ten days in)
- **author:** Chris Lattner
- **message:** `testing whether rdar://8238427 is reproducible.`
- **command:**

```
git -C ~/book16/repos/swift log --reverse --grep='rdar' --format='%h %aI %s' | head -3
git -C ~/book16/repos/swift show 35328c4921cf687d8664ec949ab80095cd4c7d29
git -C ~/book16/repos/swift log --grep='rdar' --oneline | wc -l
git -C ~/book16/repos/swift log --grep='rdar://' -1 --format='%aI %s%n%b' 
```

```
35328c4921c 2010-07-27T05:44:01+00:00 testing whether rdar://8238427 is reproducible.
da564d50d35 2011-11-01T06:51:50+00:00 A long journey later, implement support for type inference of integer literals…
    testing whether rdar://8238427 is reproducible.
    Swift SVN r99
- 
\ No newline at end of file
24610
2026-08-18T17:12:06-07:00 [Embedded] Don't try to specialize generic requirements of protocols
Fixes rdar://185238587 / https://github.com/swiftlang/swift/issues/91566.
```

A one-line deletion of a trailing space, committed to see if Apple's bug tracker would notice. That is the first of 24,610 commits whose messages still carry `rdar://`. They are still typed in 2026, now paired with a GitHub issue. John McCall's 2012 workaround "sabre's insistence on using obsolete technology" (`3e2c295a43f7`) names Lattner's machine in the log forever.

**Why it is a story.** Open-sourcing the history meant open-sourcing the ticketing system that history pointed at. Nobody scrubbed the Radars. The first one is not even a fix — it is a man using his new language repo as a probe for an SVN/Radar bug. The moment before the outcome is "will this reproduce?" about a tracker the public will one day be able to grep, and cannot open.

**Reader learns:** `git log --grep='rdar://'` (or JIRA, or a hostname) on a newly public repo is the inventory of what legal forgot to strip. The smallest such commit is usually the most honest.

**surprise:** 5

---

## 6. `meth` lasts five days, and the commit message admits why it dies

- **find-type:** 1 (tiny diff, huge blast) — also a language-design revert
- **hashes:** `504ee85c0ea8c2a81c7fedcd139e4a3ceb7b5521` (add, +3 lines) → `0fc77abf5c2e195008072839f20ca130602ac6a5` (remove)
- **date:** Tue 19 Jul 2011 04:19:40 +0000 / Sun 24 Jul 2011 20:11:35 +0000
- **author:** Chris Lattner
- **messages:** `introduce a 'meth' keyword.` / `Per discussion on swift-dev, unify 'meth' and 'func' syntax into just 'func' syntax where you can optionally declare a receiver type. This is cleaner both conceptually and in implementation, and eliminates drug references. :)`
- **command:**

```
git -C ~/book16/repos/swift log -S 'kw_meth' --reverse --format='%h %aI %s'
git -C ~/book16/repos/swift show --stat 504ee85c0ea8c2a81c7fedcd139e4a3ceb7b5521
git -C ~/book16/repos/swift show 0fc77abf5c2e195008072839f20ca130602ac6a5 -- include/swift/Parse/Token.h
```

```
504ee85c0ea 2011-07-19T04:19:40+00:00 introduce a 'meth' keyword.
0fc77abf5c2 2011-07-24T20:11:35+00:00 Per discussion on swift-dev, unify 'meth' and 'func'…
 include/swift/Parse/Token.h | 1 +
 lib/Parse/Lexer.cpp         | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)
-  KEYWORD(meth)
```

A year earlier, lambdas were a keyword; `a64c74ec941b` (2011-08-03) replaces `lambda` with `func` and notes that attributes on a `func` expression will need "heroic lookahead." Methods get their own word for five days. The unification is the Swift method syntax everyone later learns (`func` plus a receiver). The smiley is in the object.

**Why it is a story.** On a private `swift-dev` list someone says the quiet part: we cannot ship a keyword that is also a street drug. The patch is one token. The blast radius is every method in the language. The moment before the outcome is a room that can still joke, because the language has not been announced, and they pick the joke that will not be on a keynote slide.

**Reader learns:** `git log -S 'kw_foo'` on a compiler's token enum is a complete biography of a word. A five-day keyword with a punchline in the message is a design meeting you can replay.

**surprise:** 5

---

## 7. The type everyone uses was named `data`, then `oneof`, then `union`, then `enum`

- **find-type:** 1 (tiny conceptual change, huge surface)
- **hashes:** `906ba908fd6d100e657b51ba1342e6ccfdddb028` (`data`→`oneof`); `674a03b08583037a0e1906266fdb5a5f0065dc87` (`oneof`→`union`); `e1091241864a819d2169cff34ff33778df4ce61e` (`union`→`enum`)
- **date:** 2010-11-11 / 2013-07-31 / 2013-09-20
- **authors:** Chris Lattner / Jordan Rose / Joe Groff
- **messages:** `Rename 'data' to 'oneof', resolving a fixme in the spec.  Yay for CLU!` / `Replace "oneof" with "union"...everywhere.` / `Replace 'union' keyword with 'enum'.`
- **command:**

```
git -C ~/book16/repos/swift log --grep='oneof' --reverse --format='%h %aI %an %s' | head -3
git -C ~/book16/repos/swift log -1 --format='%B' 674a03b08583037a0e1906266fdb5a5f0065dc87
git -C ~/book16/repos/swift log -1 --format='%aI %an %s' e1091241864a819d2169cff34ff33778df4ce61e
```

```
906ba908fd6 2010-11-11T01:20:36+00:00 Chris Lattner Rename 'data' to 'oneof', resolving a fixme in the spec.  Yay for CLU!
2653092ae56 2010-11-11T21:06:00+00:00 Chris Lattner Change the grammar for oneof elements to require a ':'…
    Replace "oneof" with "union"...everywhere.
    We haven't fully updated references to union cases, and enums still are not
    their own thing yet, but "oneof" is gone. Long live "union"!
    Swift SVN r6783
2013-09-20T01:33:14+00:00 Joe Groff Replace 'union' keyword with 'enum'.
```

CLU's `oneof` lasts almost three years in a secret Apple language. Jordan Rose's eulogy still thinks `enum` will be "their own thing." Fifty days later Joe Groff does the last rename, compiler and tests only: "Doc updates to follow." Classes themselves do not exist until Eli Friedman, 2012-05-15 (`a5a39860cdc7`) — twenty-two months after day one.

**Why it is a story.** They know the construct is the heart of the language and they do not know what to call it. CLU is a love letter; `union` is a C retreat; `enum` is what will fit on a slide next to Objective-C. The moment before `enum` is a codebase whose AST nodes, diagnostics, and SIL docs still say `oneof`, and a team that has not announced anything, so the rename is free.

**Reader learns:** `git log --grep` for the *previous* name of a type is how you find the design argument. Three names in three years means the feature was stable and the audience was not.

**surprise:** 4

---

## 8. WWDC day: one commit. Open-source day: 254.

- **find-type:** 4 (names appear — the public)
- **hashes:** `fb93d14aec5d943d10082b394ba00fac7b043ad9` (WWDC day); first public merges e.g. `14731ce7d6e01f14b5705e2ce12d1b440ae799b6` (PR #16, Lattner, 09:10)
- **date:** Mon 2 Jun 2014 15:44:48 +0000 / Thu 3 Dec 2015 09:10:47 -0800
- **authors:** Doug Gregor / Chris Lattner (merging strangers)
- **messages:** `Generalize downcasting through an Objective-C class to a bridged value type.` / `Merge pull request #16 from filipw/feature/readme-update`
- **command:**

```
git -C ~/book16/repos/swift rev-list --count --since=2014-06-02 --until=2014-06-03 HEAD
git -C ~/book16/repos/swift rev-list --count --since=2015-12-02 --until=2015-12-03 HEAD
git -C ~/book16/repos/swift rev-list --count --since=2015-12-03 --until=2015-12-04 HEAD
git -C ~/book16/repos/swift rev-list --count --until=2015-12-03 HEAD
git -C ~/book16/repos/swift shortlog -sn --until=2015-12-03 HEAD | wc -l
git -C ~/book16/repos/swift shortlog -sn --since=2015-12-03 --until=2016-01-01 HEAD | wc -l
```

```
1
15
254
28650
76
241
```

Week of WWDC: 47 commits (week before: 54). Week after open source: 852 (week before: 107). The announcement-day patch still cites `<rdar://problem/16972956>`. The first public PRs Ted and Chris merge on December 3 are README links and comment typos (Steve Klabnik's `readme_fixes` is #22). Three days later `practicalswift` arrives (`f781fbb820bb`, 2015-12-06) syncing a compiler-crash corpus; by 2016 he leads the human shortlog (1419). Yearly authors: 2010=1, 2011=6, 2012=11, 2013=35, 2014=49, 2015=264.

**Why it is a story.** On the morning Swift is a keynote they ship one downcast tweak and go back to ARC. They already live in the language. Twenty months later the same repo becomes a GitHub firehose and the first outsiders have nothing to offer but spelling, and they offer it immediately. The moment before 254 is a 76-person Apple roster that has never needed a merge commit (first merge: 2015-11-05, after the SVN→git cut).

**Reader learns:** count commits on the press-release day and on the clone-public day. An internal project does not spike when the world hears; it spikes when the world can push. `shortlog` before and after the first `Merge pull request` is the census.

**surprise:** 4

---

## 9. Lattner writes `await` in 2017. Doug commits it in 2020.

- **find-type:** 4 (name that disappears) — also 2 (author-date / commit-date gap)
- **hash:** `8bde04cc14e19d00b805cb4ce1935dd51cfad91d`
- **date:** AuthorDate Mon 7 Aug 2017 16:09:31 -0700 / CommitDate Wed 29 Jul 2020 22:08:09 -0700 (1,087 days)
- **author:** Chris Lattner `<sabre@nondot.org>`
- **committer:** Doug Gregor `<dgregor@apple.com>`
- **message:** `[Concurrency] Implement parsing and semantic analysis of await operator`
- **command:**

```
git -C ~/book16/repos/swift log -1 --format=fuller 8bde04cc14e19d00b805cb4ce1935dd51cfad91d
git -C ~/book16/repos/swift show --stat --format='' 8bde04cc14e19d00b805cb4ce1935dd51cfad91d | tail -5
# yearly Lattner commits:
# 2010=209 2011=497 2012=536 2013=850 2014=902 2015=1054 2016=468 2017=11 2018=9 2019=0 2020=1
```

```
Author:     Chris Lattner <sabre@nondot.org>
AuthorDate: Mon Aug 7 16:09:31 2017 -0700
Commit:     Doug Gregor <dgregor@apple.com>
CommitDate: Wed Jul 29 22:08:09 2020 -0700
    Note that we currently use the keyword `__await` because `await` in
    this position introduces grammatical ambiguities. We'll wait until
    later to sort out the specific grammar we want…
    It's possible that this kind of prefix operator isn't what we want anyway.
 14 files changed, 280 insertions(+), 108 deletions(-)
```

All-time shortlog is led by bots (`swift-ci` 25848, `swift_jenkins` 15027), then Doug Gregor 11523, then Lattner 10th at 4537. His last ordinary commits are 2018 (SE-0195 Dynamic Member Lookup). The 2020 `rev-list --author=Chris Lattner` hit *is* this cherry-pick. The address is `sabre@`, the same machine John McCall named in 2012.

**Why it is a story.** He has left. He still has a patch. `__await` is a sketch with the uncertainty left in the message — maybe a prefix operator is wrong. For three years the object sits outside `main`. In July 2020, when Swift concurrency is finally a project, the first other human on the repo (dig 4) commits the founder's leftover into the tree. The moment before the outcome is a 2017 file that might never land, written from a personal address, about a keyword the grammar cannot yet hold.

**Reader learns:** `log --format='%aI %cI'` on a famous feature. A multi-year author/committer gap is a patch that outlived its author's employment. `--author` yearly counts are how a handover looks when there is no farewell commit.

**surprise:** 5

---

## 10. The third week, Howard Hinnant checks in a temporary string. The TIFFs stay in git.

- **find-type:** 4 (name that appears) — also 5 (artifact that outlived its intent)
- **hash:** `f47e851b4fe427797d1593bbdb3e3ddd368f320f`
- **date:** Mon 25 Jul 2011 18:53:01 +0000 (twelve days after Doug; SVN r446)
- **author:** Howard Hinnant `<hhinnant@apple.com>`
- **message:** `check-in of prototype string.  This is not a finished product by any stretch of the imagination.  It is a first draft.  The intent of the string subdirectory is that it is temporary.  Once we get string figured out and integrated into a runtime library, this directory should go away.`
- **command:**

```
git -C ~/book16/repos/swift show --stat --format=fuller f47e851b4fe427797d1593bbdb3e3ddd368f320f | tail -20
```

```
    The intent of the string subdirectory is that it is temporary.
 string/main.cpp     | 107 +++++++++++++++
 string/s0.tiff      | Bin 0 -> 27408 bytes
 string/s1+.tiff     | Bin 0 -> 39784 bytes
 string/s1.tiff      | Bin 0 -> 19648 bytes
 string/s2.tiff      | Bin 0 -> 20400 bytes
 string/string.cpp   | 293 +++++++++++++++++++++++++++++++++++++++
 string/string.h     | 114 +++++++++++++++
 string/strings.html | 388 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 902 insertions(+)
```

The libc++ author arrives in a secret language and dumps layout diagrams as binary TIFFs. Next-day follow-ups discuss the high bit of a pointer on 32-bit and whether move assignment should just `swap`. The directory was supposed to go away.

**Why it is a story.** Week three of a multi-person Swift, and the string model is still a personal prototype with pictures. He says temporary in the message so that later people will delete it. Git does not delete. The moment before Swift.String is four TIFFs and a man who has not yet decided whether the pointer owns.

**Reader learns:** "temporary" in a first-checkin message is a promise git will not enforce. `git log --diff-filter=A -- '*.tiff'` in a compiler repo is how you find the design review that was an image.

**surprise:** 3

---

## Ranked top-3

1. **#9 — `await` authored 2017 from `sabre@nondot.org`, committed 2020 by Doug.** A 1,087-day gap is the founder leaving a seed and the first other name planting it.
2. **#1 + #2 — empty SVN r3, then two keywords and an eight-line `.swift` file.** You can watch a secret language choose its first words on a Saturday night.
3. **#3 + #5 — Apache headers planted into 2010 blobs; 24,610 Radars not planted out.** Open-sourcing the history rewrote the license and kept the tickets.

## Disappointing

WWDC morning is one downcast patch, not a ceremony; there is no "Shiny" rename, no farewell from Lattner, and after 2016 the shortlog is mostly `swift-ci`.
