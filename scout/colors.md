# Scout: colors (Marak/colors.js)

- **Repo:** https://github.com/Marak/colors.js
- **Clone:** `~/book16/repos/colors` (already present; not re-cloned). Working tree 224K excluding `.git`; `.git` 592K; pack 409.63 KiB (`git count-objects -vH`). Whole tree 816K.
- **History span (HEAD):** 2010-06-11T02:56:25-04:00 → 2022-01-07T23:22:34-05:00
- **Commits:** 259 on `HEAD` / `master`; 262 `--all` (`origin/develop` plus two leftover `v1.3.2` commits not on master).
- **Authors (all refs):** DABH 74, Marak Squires 44, Marak 37 (same person, shorter name after 2012), paladox 19, Pavan Kumar Sunkara 12, then a long tail. Calendar 2020 and 2021 are empty. Calendar 2022 is four commits, all Marak, all on one Friday night.

The folklore is that in January 2022 Marak sabotaged his own library, then the history was cleaned up. What this git actually holds is the opposite: `master` still *is* the sabotage, there is no revert, there is no `liberty` tag, and there is no “no more free work” manifesto anywhere in the tree. The person who had been shipping the library (DABH / David Hyde) is a contributor line in `package.json`. The name on the GitHub door is still Marak.

---

## 1. Day one is 24 lines and “colors are awesome yo”

- **Find-type:** 3 (first commit)
- **Hash:** `270314c42b09ba393ab64598e375a53ce35010df`
- **Date:** 2010-06-11T02:56:25-04:00 (author = committer)
- **Author:** Marak Squires `<marak.squires@gmail.com>`
- **Message:** `first commit`
- **Command:**

```
git -C ~/book16/repos/colors log --reverse --format='%h %aI %an %s' | head -5
git -C ~/book16/repos/colors show --stat --format=fuller 270314c42b09ba393ab64598e375a53ce35010df
```

```
270314c 2010-06-11T02:56:25-04:00 Marak Squires first commit
8b3d411 2010-06-11T02:59:01-04:00 Marak Squires added docs
e1daf4f 2010-06-11T02:59:57-04:00 Marak Squires added docs
afcf88b 2010-06-11T03:00:27-04:00 Marak Squires added docs
64e2167 2010-06-11T03:02:42-04:00 Marak Squires added docs

    first commit
 ReadMe.md |  1 +
 colors.js | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)
```

`ReadMe.md` is the single line `colors are awesome yo`. `colors.js` hangs seven getters (`bold`, `grey`, `yellow`…) on `String.prototype` and writes ANSI with `'\033['`. The next twenty commits that night are almost all `added docs` / `updating docs`. `package.json` arrives nine days later (`3cc8750`, “get colors in your node.js console like what”, `node >=0.1.90`).

- **Why it is a story:** At 02:56 on a Friday, a one-file toy invents the API the entire npm graph will later `require`: `"hello".red`. There is no license, no test, no package. The decision that will matter in 2022 — that requiring the module mutates `String.prototype` — is the entire first commit. Twelve years later the infinite loop is one more getter: `'.zalgo'`.
- **What the reader learns:** `git log --reverse | head` on a famous package often shows a joke README, not an import. The blast radius of a 24-line night is not visible until a decade of dependents have stacked on the joke.
- **Surprise:** 2

---

## 2. Four minutes of liberty; `master` is still the crime scene

- **Find-type:** 8 (rollback of the world) — except the rollback never happened *here*
- **Hashes:** `074a0f8ed0c31c35d13d28632bd8a049ff136fb6` → `137c6dae3339e97f4bbc838c221803c363b0a9fd` → `5d2d242f656103ac38086d6b26433a09f1c38c75` → `6bc50e79eeaa1d87369bb3e7e608ebed18c5cf26` (HEAD)
- **Date:** 2022-01-07 23:19:03 → 23:22:34 -0500 (author = committer on all four)
- **Author:** Marak `<marak.squires@gmail.com>`
- **Messages:** `Adds new American flag module` / `Bump to \`v1.4.44-liberty\`` / `Fix bug` / `Bump to \`v1.4.44-liberty-2\``
- **Command:**

```
git -C ~/book16/repos/colors log -4 --format='%h %ai %an %s'
git -C ~/book16/repos/colors branch -a --contains 074a0f8
git -C ~/book16/repos/colors tag --contains 074a0f8
git -C ~/book16/repos/colors log --all --grep=Revert --format='%h %ai %s'
```

```
6bc50e7 2022-01-07 23:22:34 -0500 Marak Bump to `v1.4.44-liberty-2`
5d2d242 2022-01-07 23:21:02 -0500 Marak Fix bug
137c6da 2022-01-07 23:19:44 -0500 Marak Bump to `v1.4.44-liberty`
074a0f8 2022-01-07 23:19:03 -0500 Marak Adds new American flag module

* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/master
(no tags contain 074a0f8)

05129e7 2018-04-30 15:07:19 -0700 Revert dummy commit
13dd5a8 2015-01-24 16:55:56 +0100 Revert "Reverted to the latest tag"
1f617ec 2015-01-24 16:54:45 +0100 Reverted to the latest tag
c0bc636 2013-08-21 14:36:13 -0700 Revert "Prevent the defineProperty being called when property already exists"
52d4f71 2013-01-05 12:13:41 +0530 Revert "[api fix] Make properties non-enumerable"
```

`074a0f8` is 41 insertions: a new `lib/custom/american.js` (ASCII flag signed “Carl Pilcher”, three `console.log('LIBERTY LIBERTY LIBERTY')` lines) and, at the bottom of `lib/index.js` — which every `require('colors')` runs — this, left in under `/* remove this line after testing */`:

```
for (let i = 666; i < Infinity; i++;) {
  if (i % 333) {
    // console.log('testing'.zalgo.rainbow)
  }
  console.log('testing testing testing testing testing testing testing'.zalgo)
}
```

`origin/develop` does not contain any of this. The newest tag is still `v1.4.0` (DABH, 2019-09-22). There is no liberty tag. Folklore said the history was force-pushed away. As of this clone — and as of GitHub’s `master` SHA on 2026-08-19, still `6bc50e79eeaa1d87369bb3e7e608ebed18c5cf26` — it was not. The owner is still `Marak`. The repo is not archived.

- **Why it is a story:** A Friday at 23:19, after 838 days of silence on this branch, the original author types an infinite loop into the module’s entry point, bumps the version to a political slogan, notices it does not parse, fixes the slogan, and stops. Nobody in this repository ever hits revert. The “aftermath” the news described (npm unpublishing 1.4.1–1.4.4, DABH’s fork the next day) is a story that happened *around* this git, not in it. The default branch of a 5,000-star repo is still the payload.
- **What the reader learns:** “The history was rewritten” is itself a claim that wants `git branch -a --contains` and `git tag --contains`. A force-push you expected and did not find is a find. So is a default branch that no longer matches any tag.
- **Surprise:** 4

---

## 3. The sabotage did not parse; “Fix bug” is one character

- **Find-type:** 1 (tiny diff, huge blast radius)
- **Hash:** `5d2d242f656103ac38086d6b26433a09f1c38c75`
- **Date:** 2022-01-07T23:21:02-05:00
- **Author:** Marak `<marak.squires@gmail.com>`
- **Message:** `Fix bug`
- **Command:**

```
git -C ~/book16/repos/colors show --format=fuller 5d2d242f656103ac38086d6b26433a09f1c38c75
```

```
AuthorDate: Fri Jan 7 23:21:02 2022 -0500
CommitDate: Fri Jan 7 23:21:02 2022 -0500
    Fix bug
 lib/index.js | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-for (let i = 666; i < Infinity; i++;) {
+for (let i = 666; i < Infinity; i++) {
```

119 seconds after the first version bump (`137c6da` 23:19:44), 92 seconds before `v1.4.44-liberty-2`. The “bug” is a stray semicolon in the `for` header — a `SyntaxError`, not a logic error. The first liberty publish, if it went out as committed, would have thrown on `require` and done no looping at all.

- **Why it is a story:** The moment before the outcome is not a manifesto. It is a man at 23:21 who has just shipped an infinite loop that cannot start, and who treats that as a bug to fix rather than a chance to stop. The next commit is another version bump so the *fixed* loop can be the thing people install. “Fix bug” is the most ordinary commit message in the repository, sitting on the least ordinary one-character change.
- **What the reader learns:** `git show` the commit *after* a famous one. The human tell is often a follow-up that is smaller, duller, and more incriminating than the headline. Also: a protest that depends on JavaScript parsing is a protest that can fail closed.
- **Surprise:** 5

---

## 4. The name that ships is DABH; the name that owns is Marak

- **Find-type:** 4 (name that appears / the old name recedes, then returns with the keys)
- **Hashes:** `c9eef4220b8c0cca61f762cbbf74fad29942012e` (DABH’s first commit); `2631877f888a3f1642b61c8d9bee241489544626` (writes himself into `package.json`); `baa0e1c7dc50d868354206b9ea71273e3f05f593` (tags `v1.4.0`, last real release); `6bc50e79eeaa1d87369bb3e7e608ebed18c5cf26` (Marak’s return)
- **Dates:** 2018-02-12 / 2018-07-22 / 2019-09-22 / 2022-01-07
- **Authors:** DABH `<DABH@users.noreply.github.com>` (committer name David Hyde on the squash-merges); Marak
- **Messages:** `Merge remote-tracking branch 'origin/master' into develop` / `update roadmap and bump version -- 1.3.1 release` / `update roadmap` / `Bump to \`v1.4.44-liberty-2\``
- **Command:**

```
git -C ~/book16/repos/colors shortlog -sn --all
git -C ~/book16/repos/colors shortlog -sn --all --since=2018-01-01 --until=2020-01-01
git -C ~/book16/repos/colors log --first-parent --author='Marak' --format='%h %ai %s' | head -6
```

```
    74	DABH
    44	Marak Squires
    37	Marak
    19	paladox
    12	Pavan Kumar Sunkara

2018: 69 DABH / 5 Marak (those 5 are 2015 commits rebase-committed in 2018; see #8)
2019: 5 DABH, 0 Marak
2020–2021: empty
2022: 4 Marak

074a0f8 2022-01-07 23:19:03 -0500 Adds new American flag module
90dd85b 2015-06-17 15:42:07 +0200 Update ReadMe.md
```

On first-parent `master`, Marak’s last commit before liberty is 2015-06-17. That is six years, six months, and three weeks. DABH tags every release from `v1.2.0-rc0` through `v1.4.0`. He adds himself only as a contributor, never as `author`. GitHub (checked 2026-08-19) still lists owner `Marak`, `archived: false`, default branch `master` at `6bc50e7`. DABH’s continuation is a *new* repo, `DABH/colors.js`, created 2022-01-09 (`fork: false`), not a transfer of this one.

- **Why it is a story:** For a year and a half a different person is the project. The shortlog knows it. `package.json` still says `"author": "Marak Squires"`. npm’s publish right and GitHub’s admin bit stay with the name on the door. The moment before 23:19 is a repository that looks abandoned and is, in the only sense that mattered, fully armed. DABH’s issue #317 (2022-01-11) is the extra-git receipt: he got npm to delete the tarballs; he could not get the GitHub repo.
- **What the reader learns:** `git shortlog -sn` in year windows is the org chart. The `author` field of `package.json` and the GitHub owner are the *keys*. Those two documents can disagree for years without anyone treating the disagreement as an incident — until the keys get used.
- **Surprise:** 4

---

## 5. “Snuck in demonic entity”: the 2011 joke is the 2022 payload

- **Find-type:** 7 (feature that became the vulnerability)
- **Hash:** `4b6bc295218eed1aafe866a5f6d90eea50a8cb39`
- **Date:** 2011-03-15T03:10:40-07:00
- **Author:** Marak Squires `<marak.squires@gmail.com>`
- **Message:** `[dist] Updated package.json, bumped version, added creds. [misc] Snuck in demonic entity.`
- **Command:**

```
git -C ~/book16/repos/colors log --all --reverse -S 'zalgo' --format='%h %ai %an %s'
git -C ~/book16/repos/colors show 4b6bc295218eed1aafe866a5f6d90eea50a8cb39 -- colors.js | head -25
```

```
4b6bc29 2011-03-15 03:10:40 -0700 Marak Squires [dist] Updated package.json, bumped version, added creds. [misc] Snuck in demonic entity.
7fc7287 2011-07-14 15:59:52 -0700 nicoreed [minor] added exports for the colors
...
074a0f8 2022-01-07 23:19:03 -0500 Marak Adds new American flag module

+// don't summon zalgo
+String.prototype.__defineGetter__('zalgo', function () {
+  return zalgo(this);
+});
+
+// please no
+function zalgo(text, options) {
```

The 2014 refactor (`dfb15b5`) moves the function to `lib/custom/zalgo.js` and adds `lib/maps/america.js` (red/white/blue by index). The 2022 loop does not invent new output. It calls `.zalgo` in a `for (… i < Infinity)` and prints an ASCII flag that uses `.america`. The weapon is a party trick that had been in the box for 3,951 days.

- **Why it is a story:** At 03:10 on a Tuesday in 2011, “Snuck in demonic entity” is a wink. Combining diacritics on `String.prototype` is funny in a color library. Eleven years later the same author needs something noisy to dump to stdout forever and reaches for the joke he already shipped. He does not add a new dependency. He does not obfuscate. He summons zalgo.
- **What the reader learns:** `git log -S` a silly identifier. Features that exist “just for fun” are one-liners an angry future self can call in a loop. Prototype-mutating APIs make that one-liner look like English (`'testing'.zalgo`).
- **Surprise:** 4

---

## 6. `// please no` outlived every maintainer

- **Find-type:** 5 (comment that outlived its code)
- **Hashes:** `4b6bc295218eed1aafe866a5f6d90eea50a8cb39` (born); `dfb15b55382772ba4fd34fc21922a2d83e9d34d3` (moved, still the first line of the file)
- **Date:** 2011-03-15 / 2014-09-30; still line 1 of `lib/custom/zalgo.js` at HEAD
- **Author:** Marak Squires / Marak
- **Message:** see #5 / `[refactor] [major] Code cleanup…`
- **Command:**

```
git -C ~/book16/repos/colors blame -L 1,3 lib/custom/zalgo.js
git -C ~/book16/repos/colors log -S 'please no' --all --format='%h %ai %an %s'
```

```
dfb15b55 (Marak 2014-09-30 22:41:24 +0200 1) // please no
936cf564 (Marak 2014-10-01 13:00:33 +0200 2) module['exports'] = function zalgo(text, options) {
5aebc674 (DABH  2018-04-30 14:59:34 -0700 3)   text = text || '   he is here   ';

4b6bc29 2011-03-15 03:10:40 -0700 Marak Squires [dist] … [misc] Snuck in demonic entity.
dfb15b5 2014-09-30 22:41:24 +0200 Marak [refactor] [major] Code cleanup…
```

DABH’s 2018 lint pass keeps the comment and the default string `'   he is here   '`. The 2022 sabotage does not touch `zalgo.js`.

- **Why it is a story:** The file that produces the garbage on a million CI logs still opens with the author’s own flinch. “please no” was a joke about Unicode combining marks. After 23:19 it reads like a caption. Nobody who later owned the code — Pavan in 2015, DABH in 2018 — deleted it. The protest used the comment’s object and left the comment alone.
- **What the reader learns:** `git blame` the first lines of the weird files. A comment that survives a rewrite, a linter, and a sabotage is the project talking to itself across maintainers.
- **Surprise:** 3

---

## 7. This git contains no “no more free work”

- **Find-type:** 2 (planted / dated / faked artifact) — specifically, the expected artifact is *absent*
- **Hashes:** none. Searches that returned empty: `-S sponsor`, `-S donation`, `-S patreon`, `-S 'no more'`, `-G 'free work|unpaid|I will no longer'`, `--grep` on `protest|fuck|money|sponsor`.
- **Date:** —
- **Author:** —
- **Message:** —
- **Command:**

```
git -C ~/book16/repos/colors log --all -S 'no more' --format='%h %ai %an %s'
git -C ~/book16/repos/colors log --all -G 'free work|unpaid|I will no longer' --format='%h %s'
git -C ~/book16/repos/colors log --all --format='%h %s' --grep='protest\|fuck\|money\|sponsor' -i
```

```
(empty)
(empty)
(empty — the only --grep hits on those words are unrelated: “work for non-ASCI”, “license”, “is not work”)
```

The written protest of January 2022 lived in `faker.js` and on Twitter, not here. `colors` received only the loop, the flag, and a version string that says `liberty`.

- **Why it is a story:** Readers coming from the news bring a speech. This repository does not have it. The decision captured in git is narrower and stranger: break the *other* package with a joke module and an infinite `console.log`, and let the version number be the slogan. Whatever Marak meant, he did not mean it in a README in this tree.
- **What the reader learns:** Do not paste the Wikipedia paragraph onto the repo you have not grepped. Two packages sabotaged the same night can leave completely different receipts. Absence is reproducible: the commands above print nothing.
- **Surprise:** 3

---

## 8. A 2018 rebase quietly replays 2015 under a new committer

- **Find-type:** 2 (dated / rewritten artifact) + 4
- **Hashes:** `d0ae0e5`, `fbc2611`, `8407be1`, `85ec301`, `2f20f2e`, `dc8eb09` (author dates 2015; commit dates all 2018-02-12T12:10:38-08:00); DABH’s first original commit six minutes later (`b75a729`)
- **Date:** author 2015-06-17 / 2015-09-24; committer 2018-02-12
- **Authors:** Marak; fscherwi; committer clock is DABH’s takeover morning
- **Message:** Marak’s last 2015 fixes, then `Test against modern Node versions and stop testing against very ancient Node 0.6`
- **Command:**

```
git -C ~/book16/repos/colors log --all --format='%h %aI %cI %an %s' | awk '$2 != $3 && $3 ~ /2018-02-12/'
```

```
dc8eb09 2015-09-24T20:38:28+02:00 2018-02-12T12:10:38-08:00 fscherwi test Node.js 0.12 and 4
2f20f2e 2015-06-17T15:42:07+02:00 2018-02-12T12:10:38-08:00 Marak Update ReadMe.md
85ec301 2015-06-17T15:01:51+02:00 2018-02-12T12:10:38-08:00 Marak [dist] Bump to v1.1.2
8407be1 2015-06-17T14:59:08+02:00 2018-02-12T12:10:38-08:00 Marak [fix] Really bad example in README. … Blame c11d23d…
fbc2611 2015-06-17T14:50:29+02:00 2018-02-12T12:10:38-08:00 Marak [dist] Bump to v1.1.1
d0ae0e5 2015-06-17T14:49:52+02:00 2018-02-12T12:10:38-08:00 Marak [fix] In-proper scope reference. Closes #124
```

Same committer timestamp to the second on all six. They sit on `develop`’s rewritten history; the first-parent copies of the same Marak patches (`90dd85b` etc.) kept their original commit dates.

- **Why it is a story:** The morning DABH arrives, 2015 happens again. It is not malice — it is `rebase` / cherry-pick while standing up `develop`. It is also the first time the graph shows a new person able to rewrite Marak’s commits. The handover is a timestamp collision, not a NEWS entry.
- **What the reader learns:** `awk '$author_iso != $committer_iso'` over `git log --format='%aI %cI'`. A cluster of old author dates with one new committer date is a takeover, a rebase, or both. 29 of 262 commits in this repo have that gap; six of them share one second.
- **Surprise:** 3

---

## 9. Seventy-one seconds of revert war, January 2015

- **Find-type:** 6 (revert war)
- **Hashes:** `1f617ecdc56d0e9592526326ca12deb2c15d7803` then `13dd5a84e32a584f06579df5e09878778a79d32e`
- **Date:** 2015-01-24 16:54:45 / 16:55:56 +0100
- **Author:** Pavan Kumar Sunkara `<pavan.sss1991@gmail.com>`
- **Messages:** `Reverted to the latest tag` / `Revert "Reverted to the latest tag"`
- **Command:**

```
git -C ~/book16/repos/colors show --stat --format='%h %ai %s' 1f617ec 13dd5a8
```

```
1f617ec 2015-01-24 16:54:45 +0100 Reverted to the latest tag
 MIT-LICENSE.txt | 23 +++++++++++++++++++++++
 lib/colors.js   | 11 -----------
 package.json    |  9 +--------
 7 files changed, 35 insertions(+), 37 deletions(-)

13dd5a8 2015-01-24 16:55:56 +0100 Revert "Reverted to the latest tag"
 MIT-LICENSE.txt | 23 -----------------------
 lib/colors.js   | 11 +++++++++++
 package.json    |  9 ++++++++-
 7 files changed, 37 insertions(+), 35 deletions(-)
```

Pavan is the most active committer of 2015 (12 commits). He is mid-merge-PR afternoon (`#93`, `#97`, `#103`) when he hard-resets the tree to the last tag and, 71 seconds later, undoes himself. `13dd5a8` is still the blamed origin of line 1 of `lib/extendStringPrototype.js`.

- **Why it is a story:** For 71 seconds the library goes backwards. A stand-in maintainer — not Marak, who is already fading — hits the eject handle, then the undo handle. It is the small version of what the ecosystem will wish someone had done to `master` in 2022, and it is the only time this repo ever reverts *itself* in anger. The 2022 loop is never reverted at all.
- **What the reader learns:** `git log --grep=Revert` is a map of who had the nerve and who had the bit. A revert of a revert 71 seconds later is a person who is allowed to break `master` and knows they will be forgiven. Compare that to a sabotage that sits unreverted for four years.
- **Surprise:** 3

---

## 10. Marak reverts the safety patches, then deletes `defineProperty`

- **Find-type:** 6 (a rule enforced by reverts)
- **Hashes:** `adf06f0988ad72d437275c192a7503421cd853ba` (non-enumerable) → `52d4f71696255acf21680f13ea83196ad353199c` (reverted); `3f6fe70f39a00e2b120ec07f3eea6a1194e924ce` (skip if already defined) → `c0bc636d4defbbc20a1ae314dc4ab8b0a6970a67` (reverted) → `38db25ad14f3499b5d6a4169ee62978f7d06fc6e` (`[fix] Removed Object.define property entirely`)
- **Dates:** 2012-06-27 / 2013-01-05; 2013-08-14 / 2013-08-21
- **Authors:** Maciej Małecki; Matt Gaunt `<mattgaunt@google.com>`; Marak
- **Messages:** `[api fix] Make properties non-enumerable` / `Revert "…"` / `Prevent the defineProperty being called when property already exists` / `Revert "…"` / `[fix] Removed Object.define property entirely`
- **Command:**

```
git -C ~/book16/repos/colors log --all --grep=Revert --format='%h %ai %an %s'
git -C ~/book16/repos/colors show --stat --format='%h %ai %s' 38db25a
```

```
c0bc636 2013-08-21 14:36:13 -0700 Marak Revert "Prevent the defineProperty being called when property already exists"
52d4f71 2013-01-05 12:13:41 +0530 Marak Squires Revert "[api fix] Make properties non-enumerable"

38db25a 2013-08-21 16:15:05 -0700 [fix] Removed Object.define property entirely
 colors.js | 13 +------------
```

`lib/extendStringPrototype.js` at HEAD still uses `String.prototype.__defineGetter__` (blamed to `dfb15b5`, 2014). The 2014 “safe” API (`require('colors/safe')`) is a second entry point, not a fix to the first.

- **Why it is a story:** Contributors keep trying to make the prototype patch less rude (non-enumerable, don’t clobber, `defineProperty`). Marak keeps putting the rudeness back, then rips `defineProperty` out entirely as a “fix.” The product *is* the mutation. Eight years later the mutation is what lets `'testing'.zalgo` run as the first side effect of `require`.
- **What the reader learns:** A revert series is a style guide with teeth. If the owner repeatedly reverts “be less magical,” believe the magic is load-bearing — and that the same person can flip the magic from cute to hostile without changing the API.
- **Surprise:** 3

---

## 11. The versions the news named are not in this git

- **Find-type:** 2 (the published artifact and the committed artifact disagree)
- **Hashes:** `137c6dae3339e97f4bbc838c221803c363b0a9fd` (`1.4.0` → `1.4.44-liberty`); `6bc50e79eeaa1d87369bb3e7e608ebed18c5cf26` (`1.4.44-liberty` → `1.4.44-liberty-2`)
- **Date:** 2022-01-07 23:19:44 / 23:22:34 -0500
- **Author:** Marak
- **Messages:** the two liberty bumps
- **Command:**

```
git -C ~/book16/repos/colors log --all -G '1\.4\.[1-9]' --format='%h %ai %s' -- package.json
git -C ~/book16/repos/colors show 137c6da -- package.json | tail -8
```

```
137c6da 2022-01-07 23:19:44 -0500 Bump to `v1.4.44-liberty`
6bc50e7 2022-01-07 23:22:34 -0500 Bump to `v1.4.44-liberty-2`

-    "version": "1.4.0",
+    "version": "1.4.44-liberty",
```

No commit ever sets `1.4.1`, `1.4.2`, `1.4.3`, or `1.4.4`. Those are the numbers every incident writeup used, because those are the numbers that appeared on the npm registry (and were later unpublished). Git’s numbers are the slogan versions. Last annotated tag remains `v1.4.0`.

- **Why it is a story:** Semver is being used as a protest sign (`44-liberty`), and *separately* as a way to look like a patch release on the registry. Only one of those acts was committed. The other — the one that actually broke `npm install colors` for people who allowed `^1.4.0` — left no hash in this repository. The supply-chain event and the git event are not the same event.
- **What the reader learns:** `git log -G` the version you read in the CVE. If the string is missing, the tarball was published from a dirty tree, a different clone, or a history that was never pushed. Pinning to a git SHA would not have saved you from npm `1.4.4`; pinning to the git tag `v1.4.0` would have.
- **Surprise:** 4

---

## Ranked top-3

1. **#2 — liberty is still HEAD.** Four commits, 3.5 minutes, no revert, no tag, not on `develop`. The force-push the folklore promised did not happen; the default branch *is* the evidence.
2. **#4 — DABH shipped; Marak held the keys.** 74 commits to 0, for years. `shortlog` is the org chart; `package.json` `author` and the GitHub owner are the attack surface.
3. **#3 / #5 — `Fix bug` plus zalgo.** A one-character syntax fix so the 2011 demonic entity can run forever. The protest is a party trick in a loop, not a manifesto.

## Disappointing

There is no planted 1970 stamp, no “no more free work” README, and almost no pre-2014 blame (the 2014 rewrite, `dfb15b5`, reset the interesting files). The famous speech is in a different repo.
