# Scout: OpenTTD (OpenTTD/OpenTTD)

- **Repo:** https://github.com/OpenTTD/OpenTTD
- **Clone:** `~/book16/repos/openttd` (already present; not re-cloned). Working tree + `.git` **656M**; pack file **646M**.
- **History span (HEAD / master):** 2004-08-09T17:04:08+00:00 → 2026-08-17T23:36:20+01:00 (author); last committer date 2026-08-18T21:13:28+01:00
- **Commits:** **33080** on `HEAD` / `master` (`git rev-list --count HEAD`). The pack holds 35100 commit objects (other branches/tips).
- **Authors (`git shortlog -sn HEAD`):** rubidium 5544, translators 4071, frosch 2547, Peter Nelson 2313, peter1138 1498, tron 1344, Rubidium 1286, smatz 1057, alberth 1024, Darkvater 910. peter1138 and Peter Nelson are the same person (`peter1138@openttd.org`). Darkvater / darkvater are the same person (case-insensitive `--author=darkvater` is 1236).

The folklore is: Ludvig Strigeus reverse-engineered Transport Tycoon Deluxe in 2004, an SVN import followed, the game needed Chris Sawyer's original `.grf` files, then OpenGFX set it free. Git confirms the last three and quietly withholds the first. Day one of this repository is not a reverse-engineer's first file. It is a salvage.

---

## 1. Day one is r975 of a crashed SVN

- **Find-type:** 2 + 3 (planted / imported history boundary; first commit)
- **Hash:** `efaeb275f78e18d594d9ee8ff04eccd2dc59512c`
- **Date:** 2004-08-09T17:04:08+00:00 (author = committer)
- **Author:** truelight `<truelight@openttd.org>`
- **Message:** `(svn r1) Import of revision 975 of old (crashed) SVN`
- **Command:**

```
git -C ~/book16/repos/openttd log --reverse --format='%H %aI %an <%ae> %s' | head -5
git -C ~/book16/repos/openttd show --stat --format=fuller efaeb275f78e18d594d9ee8ff04eccd2dc59512c | tail -3
git -C ~/book16/repos/openttd show efaeb275f78e18d594d9ee8ff04eccd2dc59512c:readme.txt | head -5
```

```
efaeb275f78e18d594d9ee8ff04eccd2dc59512c 2004-08-09T17:04:08+00:00 truelight <truelight@openttd.org> (svn r1) Import of revision 975 of old (crashed) SVN
804f038594ccd7d12b776299038f9bc5809f90e5 2004-08-10T14:14:00+00:00 darkvater <darkvater@openttd.org> (svn r2) -Fix [993829] UDP Fixes (lucaspiller) ...
e4940ebc79149fee171d11ed33e10a810a25c379 2004-08-10T14:32:17+00:00 darkvater <darkvater@openttd.org> (svn r3) -[1005611] Player Window patch: ...
 189 files changed, 129220 insertions(+)

OpenTTD README
Last updated:    $LastChangedDate: 2004-07-25 21:22:11 +0200 (Sun, 25 Jul 2004) $
Release version: 0.3.3
```

- **Why it is a story:** Someone's previous Subversion died. The next person (TrueLight / truelight) stands in the wreckage, takes whatever was revision 975, and types `svn r1`. The tree is already a shipping game: 129,220 lines, 14 language files, MorphOS and BeOS ports, a changelog that starts at 0.3.3, SVN keyword `$LastChangedDate$` frozen on 2004-07-25. The reverse-engineering of Chris Sawyer's binary — the thing the book would most like to watch — is not in this git. It was in the crashed repository. The first commit is a funeral and a restart on the same day.
- **What the reader learns:** `git log --reverse | head` on a famous project often shows a *migration*, not a genesis. If the previous VCS crashed, the origin story is a blob whose revision number resets to 1 (here: `r1` of 975). Ask what the import chose to remember, and what it could not.
- **Surprise:** 5

---

## 2. The founding author is a three-week guest

- **Find-type:** 4 (name that appears / disappears)
- **Hashes:** first `b5a30ed0fce43f8aa10f85905da2aeb42071a583`; last `062ed26b4d492e5327c5bd2dfabb6ec7b0875e6f`
- **Dates:** 2005-07-12T19:15:56+00:00 → 2005-08-08T15:26:53+00:00
- **Author:** ludde `<ludde@openttd.org>` (Ludvig Strigeus)
- **Messages:** `(svn r2550) raise 32767 limit of gamma values...` through `(svn r2842) Fix bug with aircraft autoreplace (peter1138)`
- **Command:**

```
git -C ~/book16/repos/openttd log --author='ludde' --format='%aI %h %s' --reverse
git -C ~/book16/repos/openttd rev-list --count --author='ludde' HEAD
git -C ~/book16/repos/openttd grep -n 'Ludvig Strigeus' HEAD -- CREDITS.md
```

```
2005-07-12T19:15:56+00:00 b5a30ed0fc (svn r2550) raise 32767 limit of gamma values, and 16MB limit of RIFF chunks in saveload code.
2005-07-12T19:57:41+00:00 dc9b51f110 (svn r2552) - Fix: [map] Fix so the code compiles correctly and doesn't crash on MSVC6 ...
...
2005-08-08T15:26:53+00:00 062ed26b4d (svn r2842) Fix bug with aircraft autoreplace (peter1138)
46

HEAD:CREDITS.md:41:- Ludvig Strigeus (ludde) - Original author of OpenTTD, main coder (0.1 - 0.3)
```

- **Why it is a story:** The README in r1 already lists "Ludvig Strigeus (ludde) — OpenTTD author, main coder." CREDITS.md today still says "Original author … (0.1 – 0.3)". Versions 0.1–0.3 are not in this git. When ludde actually types, it is July 2005, a year after the salvage, for 27 days: saveload limits, a rewritten string/plural system, Mersenne Twister, an A* pathfinder, then aircraft autoreplace. Forty-six commits. Then nothing, for twenty-one years. The founding author enters history as a guest in his own house.
- **What the reader learns:** `git shortlog` and `CREDITS` disagree. The name on the monument can have almost no commits. `--author` on the credited founder is the test; here it returns a summer, not a genesis.
- **Surprise:** 4

---

## 3. `320` is not a typo. The revert is the rule.

- **Find-type:** 6 (revert war / a rule enforced by reverts)
- **Hashes:** `61fe35688046b7ef36305ebd92b79bfcc535783f` (numbers enter as "TTD's original rate"); `7e22f243ed3b324df3da9dba5594c14b4e6794a0` ("typo"); `61dba850af737cd49d1bb344dafd7a91a18895bf` (revert)
- **Dates:** 2007-04-12; 2019-11-18; 2019-11-20T01:00:07+01:00
- **Authors:** maedhros; Yourself `<kyle.smith314@gmail.com>` (committed by planetmaker); frosch (committed by Charles Pigott)
- **Messages:**
  - `(svn r9613) -Feature: Make it possible to have some control over the town growth. The default rate is TTD's original rate...`
  - `Fix: typo in town growth rates (#7837)`
  - `Revert #7837, 7e22f243e: OpenTTD tries to replicate the original game mechanics. Making numbers look nice and correlate is no goal, and in this case they actually did not correlate.`
- **Command:**

```
git -C ~/book16/repos/openttd log --reverse -S '{ 320, 420, 300' --format='%h %aI %an %s' -- src/town_cmd.cpp
git -C ~/book16/repos/openttd show 7e22f243ed -- src/town_cmd.cpp
git -C ~/book16/repos/openttd show 61dba850af -- src/town_cmd.cpp
```

```
61fe356880 2007-04-12T17:24:34+00:00 maedhros (svn r9613) -Feature: Make it possible to have some control over the town growth...
7e22f243ed 2019-11-18T07:20:47-08:00 Yourself Fix: typo in town growth rates (#7837)
61dba850af 2019-11-20T01:00:07+01:00 frosch Revert #7837, 7e22f243e: OpenTTD tries to replicate the original game mechanics...

- { 320, 420, 300, 220, 160, 100 }  // Normal values
+ { 420, 420, 300, 220, 160, 100 }  // Normal values
```

The revert puts `320` back and adds:

```
 * Unserviced+unfunded towns get an additional malus in UpdateTownGrowth(),
 * so the "320" is actually not better than the "420".
```

- **Why it is a story:** A new contributor sees `{ 320, 420, 300, 220, 160, 100 }` at 07:20 on a Monday and does the kind thing: the first cell looks like a typo, so they make the row pretty. A maintainer who has lived with those numbers since 2007 — when they were written down as *TTD's original rate* — reverts two days later, at 01:00, and writes the project's constitution into the commit message. OpenTTD is not a game that should look nice. It is a replica. The ugly `320` is the original binary speaking. The one-line "fix" was an accidental rewrite of Chris Sawyer.
- **What the reader learns:** A one-character table change can be a policy change. Magic numbers that look wrong may be the product. `git log -S '{ 320, 420, 300'` is how you find out the number was *chosen*, not mistyped. Reverts that quote a creed are the real style guide.
- **Surprise:** 5

---

## 4. "We consider GRF files trusted" — still, 22 years later

- **Find-type:** 5 + 7 (comment that outlived its code; feature that became the vulnerability)
- **Hashes:** `efaeb275f78e18d594d9ee8ff04eccd2dc59512c` (born in the crashed-SVN import, `grfspecial.c`); still at `4d4f8bff38d200fbcfda11789bd69259ebbefd17` (`HEAD`, `src/newgrf.cpp:1252`)
- **Date:** 2004-08-09 → 2026-08-17 (comment text unchanged in substance)
- **Author:** (import) truelight; comment almost certainly from the TTDPatch/NewGRF work of pasky / the pre-crash tree
- **Message (of the surviving comment):** not a commit message — a warning left in the decoder
- **Command:**

```
git -C ~/book16/repos/openttd grep -n 'We consider GRF files trusted' efaeb275f78e18d594d9ee8ff04eccd2dc59512c
git -C ~/book16/repos/openttd grep -n 'We consider GRF files trusted' HEAD
git -C ~/book16/repos/openttd log -L 1252,1255:src/newgrf.cpp --format='%h %aI %an %s' | head -20
```

```
efaeb275f78e18d594d9ee8ff04eccd2dc59512c:grfspecial.c:1029:/* XXX: We consider GRF files trusted. It would be trivial to exploit OTTD by

HEAD:src/newgrf.cpp:1252: * XXX: We consider GRF files trusted. It would be trivial to exploit OTTD by
 * a crafted invalid GRF file. We should tell that to the user somehow, or
 * better make this more robust in the future. */
```

`git log -L` on those lines shows comment-style tweaks (2009 rubidium, 2024 `byte`→`uint8_t`, 2025 allocator change) and never a deletion.

- **Why it is a story:** In 2004 the NewGRF decoder is a partial port of TTDPatch's spec (`http://www.ttdpatch.net/src/newgrf.txt`). The author already knows a crafted GRF is a trivial exploit. They write "we should tell the user, or make this more robust in the future." The file is renamed `grfspecial.c` → `newgrf.c` → `src/newgrf.cpp`, C becomes C++, `malloc` becomes `ReusableBuffer<uint8_t>`, and the warning is still there on the day of the last commit in 2026. NewGRF became the game's entire content ecosystem — the feature *is* the attack surface — and the first sentence about it was already a security advisory.
- **What the reader learns:** `git grep` a scary comment on `HEAD`, then on the root commit. If both hit, you have a twenty-year unclosed ticket. "We'll make this robust later" is how a trusted-file format becomes a forever-ABI.
- **Surprise:** 5

---

## 5. A helicopter FIXME that flew from 2004 to 2025

- **Find-type:** 5 (comment/TODO that outlived its code)
- **Hashes:** `efaeb275f78e18d594d9ee8ff04eccd2dc59512c` (born); `ec647975adfe1edeb5aad8702d8fbb92ab26b029` (killed)
- **Dates:** 2004-08-09; 2025-03-15T09:21:05+01:00 (committed 2025-03-16)
- **Authors:** (import) truelight; Rubidium
- **Messages:** the first-commit blob; `Cleanup: remove ancient FIXME comments`
- **Command:**

```
git -C ~/book16/repos/openttd grep -n 'if station no longer exists, do not land' efaeb275f78e18d594d9ee8ff04eccd2dc59512c
git -C ~/book16/repos/openttd log -S 'if station no longer exists, do not land' --format='%h %aI %an %s' -- aircraft_cmd.c src/aircraft_cmd.cpp
git -C ~/book16/repos/openttd show ec647975ad -- src/aircraft_cmd.cpp src/station_cmd.cpp
```

```
efaeb275f78e18d594d9ee8ff04eccd2dc59512c:aircraft_cmd.c:822:// FIXME - Aircraft_5 -> if station no longer exists, do not land
efaeb275f78e18d594d9ee8ff04eccd2dc59512c:aircraft_cmd.c:934://FIXME -- FIXED - Aircraft_5 -> if station no longer exists, do not land

efaeb275f7 2004-08-09T17:04:08+00:00 truelight (svn r1) Import of revision 975 of old (crashed) SVN
1f66d60272 2005-02-22T19:38:44+00:00 Darkvater (svn r1905) - Fix: ... rename all vehicle controllers to ...Controller ...
ec647975ad 2025-03-15T09:21:05+01:00 Rubidium Cleanup: remove ancient FIXME comments
```

The 2025 deletion still had the same question: if the airport is gone, the helicopter circles until the sign disappears; if that was the only order, it stays in one place.

- **Why it is a story:** Someone debugging the reverse-engineered aircraft state machine writes `Aircraft_5` and a question they cannot answer. Twenty years, a rename to `AircraftController`, C to C++, and the same helicopter still does the same wrong thing. In 2025 Rubidium does not fix the helicopter. He deletes the comment. The other victim of that cleanup is `// FIXME -- GetTileTrackStatus_Station -> animated stationtiles` — also from r1, also never "embedded into Airport variable." The TODOs outlived every person who could have meant them.
- **What the reader learns:** `git grep FIXME` on the root commit, then `git log -S` the unique phrase. A FIXME that survives a language migration is not a reminder. It is a fossil. Deleting it is not the same as doing the work.
- **Surprise:** 4

---

## 6. The game would not start without Chris Sawyer's files

- **Find-type:** 1 (tiny-looking policy with huge blast radius)
- **Hashes:** `efaeb275f78e18d594d9ee8ff04eccd2dc59512c` (required files in README); `aa261049f4d3c0977555e413ab7d9807c70eef02` (MD5 fingerprints of those files); `c3a9653c894ad597c35d41e6d8739c3330371c74` (basesets, anyone can ship graphics); `b9b357b8e87b67c14d5b45e087a6196598159f14` (OpenGFX/OpenSFX documented as enough)
- **Dates:** 2004-08-09; 2005-01-10; 2008-08-31; 2009-12-13
- **Authors:** truelight; dominik; rubidium; rubidium
- **Messages:** (import README); `(svn r1453) Feature: MD5 hash check for TTD files`; `(svn r14197) ... allow people to create their own base graphics easily and without requiring code changes`; `(svn r18483) -Document [FS#3367]: that OpenGFX/OpenSFX can be used...`
- **Command:**

```
git -C ~/book16/repos/openttd show efaeb275f78e18d594d9ee8ff04eccd2dc59512c:readme.txt | sed -n '84,110p'
git -C ~/book16/repos/openttd show aa261049f4:table/files.h | head -20
git -C ~/book16/repos/openttd show --stat --format='%h %aI %s' c3a9653c89 b9b357b8e8
```

```
IMPORTANT! You need the files from the WINDOWS version of TTD.
List of the required files:
sample.cat
trg1r.grf
trgcr.grf
trghr.grf
trgir.grf
trgtr.grf

WINDOWS -
TRG1R.GRF b04ce593d8c5016e07473a743d7d3358
...
SAMPLE.CAT 9212e81e72badd4bbe1eaeae66458e10

c3a9653c89 2008-08-31T08:46:43+00:00 (svn r14197) -Codechange: rework (original) base graphics determination methods...
b9b357b8e8 2009-12-13T14:23:45+00:00 (svn r18483) -Document [FS#3367]: that OpenGFX/OpenSFX can be used...
```

- **Why it is a story:** For five years the clone cannot legally ship a playable game. The README is a packing list from a 1995 CD-ROM. In 2005 they go further: they embed MD5s of Chris Sawyer's exact bytes so the clone can tell Windows TTD from DOS TTD from a corrupted copy. That table is a fingerprint of someone else's product, living in GPL source. Then August 2008 introduces `.obg` metadata — graphics become a set you configure, not a hardcoded filename — and December 2009 the README finally says you may use free files instead. The blast radius of those small metadata files is "this project can exist on Steam / GOG / a distro without a commercial CD."
- **What the reader learns:** A README packing list is a license. Hashing a file you cannot distribute is a dependency you will spend years deleting. The commit that *documents* the alternative is later, and smaller, than the commit that made the alternative possible.
- **Surprise:** 3

---

## 7. Names on the clock: Darkvater stops, a bot starts, rubidium stays

- **Find-type:** 4 (name that disappears / appears)
- **Hashes (anchors):** Darkvater last `2a2ee534e99e2845f0a55b03bd27ba59536f153a` (2007-03-10); translators first `325ef293fd15355dcec34d5e37ed379cec3b34e8` (2008-08-01); rubidium first `9b1bbf72ee7ebb545ba7dc0ea11a84fc18b11c45` (2006-05-09); GitHub-era first PR-style `97c0594cedcad866bbdea8a0f86406b5c38694a3` (2018-04-08, Patric Stout)
- **Dates:** 2006–2018
- **Authors:** see shortlog windows
- **Command:**

```
git -C ~/book16/repos/openttd shortlog -sn HEAD --since=2004-01-01 --until=2007-01-01 | head -6
git -C ~/book16/repos/openttd shortlog -sn HEAD --since=2007-01-01 --until=2011-01-01 | head -6
git -C ~/book16/repos/openttd shortlog -sn HEAD --since=2018-01-01 | head -6
git -C ~/book16/repos/openttd log --author='darkvater' --format='%aI %h %s' | head -1
git -C ~/book16/repos/openttd log --reverse --author='translators' --format='%aI %h %s' | head -1
```

```
2004–2006: 1232 tron / 803 Darkvater / 605 peter1138 / 535 miham / 462 truelight
2007–2010: 4164 rubidium / 969 smatz / 820 frosch / 776 alberth / 731 translators
2018–2026: 2313 Peter Nelson / 1818 translators / 1286 Rubidium / 755 Patric Stout

2007-03-10T00:30:18+00:00 2a2ee534e9 (svn r9086) -Feature/Fix: [win32] Rewrite keyboard input...
2008-08-01T00:31:20+00:00 325ef293fd (svn r13905) -Update: WebTranslator2 update to 2008-08-01 02:27:37
```

- **Why it is a story:** 2004–2006 is Darkvater, tron (a cleanup engine: 1344 commits, then essentially gone after March 2007), truelight, Bjarni. March 10, 2007, 00:30, Darkvater's last commit is a Win32 IME rewrite. He does not announce a resignation. The next year's top name is rubidium, who will still be committing in 2026. August 1, 2008, 00:31, a user called `translators` appears and will become the second-largest author (4071). April 8, 2018, the first GitHub-style `(#6694)` commit lands two days after the last `(svn r28004)` translator push — the forge changes, the bot does not. The org chart is the shortlog.
- **What the reader learns:** Split `shortlog` on calendar windows. A lead can vanish at half past midnight on a Saturday. A bot can out-commit every human but one. Same person, two spellings (`peter1138` / `Peter Nelson`, `rubidium` / `Rubidium`) will split the crown unless you look.
- **Surprise:** 3

---

## 8. `$Id$` planted in every file, harvested 17 years later

- **Find-type:** 2 (planted artifact)
- **Hashes:** `a227065ab75d6cb9f449f2282315adc933450b49` (insert); `4031894aefd32092ae229d12b608ad2402442d95` (final sweep)
- **Dates:** 2005-07-24T14:12:37+00:00; 2022-11-02T00:24:31+00:00
- **Authors:** tron; PeterN
- **Messages:** `(svn r2701) Insert Id tags into all source files`; `Cleanup: Remove svn-style `$Id$` comments. (#10122)`
- **Command:**

```
git -C ~/book16/repos/openttd show --stat --format=fuller a227065ab7 | tail -5
git -C ~/book16/repos/openttd show --stat --format=fuller 4031894aef | head -20
```

```
(svn r2701) Insert Id tags into all source files
 231 files changed, 465 insertions(+), 3 deletions(-)

Cleanup: Remove svn-style `$Id$` comments. (#10122)
 src/blitter/40bpp_anim.cpp | 2 --
 src/blitter/40bpp_anim.hpp | 2 --
 src/misc/lrucache.hpp      | 2 --
 src/table/opengl_shader.h  | 2 --
 src/video/opengl.cpp       | 2 --
 src/video/opengl.h         | 2 --
 6 files changed, 12 deletions(-)
```

- **Why it is a story:** July 2005, tron walks the tree and staples Subversion's keyword into 231 files. SVN will expand `$Id$` on checkout; git will not. The tags sit there through the 2018 GitHub migration (`97c0594ced`, first `(#6694)`), through the last `(svn r28004)` on 2018-04-06. In 2022 six files still carry the tattoo. The VCS left; its folklore stayed in the headers.
- **What the reader learns:** Keyword expansion is a time bomb when you change forges. `git log -S '$Id$'` is the migration scar. New files added after the move can still inherit a comment the new VCS will never expand.
- **Surprise:** 3

---

## 9. A helper function waits nine years to land

- **Find-type:** 2 (dated / delayed artifact)
- **Hash:** `4a59aadb8bdf50d2faeaa83485392323fd6ca04b`
- **Date:** author 2017-04-30T08:52:09+02:00; committer 2026-07-26T10:12:27+01:00 (**3374 days**)
- **Author:** cirdan `<cirdansw@gmail.com>`; committer Peter Nelson `<peter@fuzzle.org>`
- **Message:** `Codechange: Add a helper function GetFoundationSpriteBlock`
- **Command:**

```
git -C ~/book16/repos/openttd log -1 --format=fuller 4a59aadb8bdf50d2faeaa83485392323fd6ca04b
git -C ~/book16/repos/openttd log --format='%H %at %ct %an %s' | awk '{d=$3-$2; if(d>86400*1000) print d/86400, $1, $4, substr($0,index($0,$5))}'
```

```
Author:     cirdan <cirdansw@gmail.com>
AuthorDate: Sun Apr 30 08:52:09 2017 +0200
Commit:     Peter Nelson <peter@fuzzle.org>
CommitDate: Sun Jul 26 10:12:27 2026 +0100
    Codechange: Add a helper function GetFoundationSpriteBlock
 3 files changed, 23 insertions(+), 20 deletions(-)

3374.1 4a59aadb8bdf50d2faeaa83485392323fd6ca04b cirdan Codechange: Add a helper function GetFoundationSpriteBlock
2251.01 6cac80a1587e78143e076a0c695047f76ea8f892 Konstantin Gribov Change: Add support for next/previous/first/last railtype hotkeys.
```

cirdan's other two commits (`395a5d9991`, `46ff7d918b`) are also 2012 work committed in 2020.

- **Why it is a story:** In April 2017 someone factors two near-identical foundation checks into a helper. In July 2026 a current maintainer finally presses merge. The author date is not a lie and not a rebase accident in the usual sense — git preserved the original clock across a decade of "we'll get to this." The same pattern (Konstantin Gribov's 2019 hotkeys landing in 2026) says the project keeps patches in a drawer. The helper is three files and 23 lines. The wait is the story.
- **What the reader learns:** Compare `%aI` and `%cI`. A gap measured in *years* is a review queue, a lost patch, or a cherry-pick from a contributor who stopped waiting. Your `author` date is the moment someone decided; your `committer` date is the moment the project agreed.
- **Surprise:** 4

---

## 10. NoAI: "tomatos and bananas" and the old cheats burn

- **Find-type:** 8 (rollback of a world) + 1
- **Hash:** `a3dd7506d377b1434f913bd65c019eed52b64b6e`
- **Date:** 2009-01-12T17:11:45+00:00
- **Author:** truebrain `<truebrain@openttd.org>` (Patric Stout)
- **Message:** `(svn r15027) -Merge: tomatos and bananas left to be, here is NoAI for all to see. ... -Remove: all old AIs and their cheats/hacks`
- **Command:**

```
git -C ~/book16/repos/openttd log -1 --format=fuller a3dd7506d3
git -C ~/book16/repos/openttd show --numstat --format='' a3dd7506d3 | awk '{a+=$1;d+=$2;n++} END{print "files",n,"added",a,"deleted",d}'
```

```
(svn r15027) -Merge: tomatos and bananas left to be, here is NoAI for all to see.
  NoAI is an API (a framework) to build your own AIs in.
-Remove: all old AIs and their cheats/hacks
files 257 added 34619 deleted 7575
```

- **Why it is a story:** The original AI lived in `ai.c` with a trail of `// XXX: not done` and `/* XXX: This part is utterly broken */` from the first commit. For five years it was a built-in opponent that cheated. TrueBrain merges a Squirrel API, thanks a list of people including a hosted challenge that "kept NoAI on track," and deletes the old brain. The commit message is a nursery rhyme. The diff is a funeral for every hack that made the computer player work.
- **What the reader learns:** Replacing a subsystem is often a delete of the personality that made the project itself. The rhyme is how a tired branch gets permission to land. Count the deletions.
- **Surprise:** 3

---

## Ranked top 3

1. **Day one is r975 of a crashed SVN** (`efaeb275f78e`) — the reverse-engineering origin is a hole; git starts at the salvage. Surprise 5.
2. **`320` is not a typo** (`7e22f243ed` / `61dba850af`) — a one-cell "fix" meets the project's real rule: replicate the original binary, even when the numbers look wrong. Surprise 5.
3. **GRF files are still trusted** (`src/newgrf.cpp:1252`, born `efaeb275f78e`) — a 2004 exploit warning that survived C→C++, 22 years, and the entire NewGRF economy. Surprise 5.

## What was disappointing

The actual reverse-engineering of Transport Tycoon Deluxe — ludde's 2004 work, the comments that would have said *this is what the binary does* — is not in this repository. The crashed SVN took it. What remains of that voice is a packing list, a pile of FIXMEs, and forty-six commits one summer later.
