# Scout: cpython (python/cpython)

- **Repo:** https://github.com/python/cpython
- **Clone:** `~/book16/repos/cpython` (already present; not re-cloned). Working tree + `.git` = 881M; `.git` alone 879M (one pack). `refs/heads/main` in this clone is an empty file, so every command below pins an explicit tip: `af49df919dafc3767ae956767dce0482f9cd6d4e`.
- **History span:** 1990-08-09T14:25:15+00:00 → 2026-08-18T20:55:57+02:00
- **Commits:** 132821 on that tip
- **Authors (all time):** Guido van Rossum 11408, Victor Stinner 8533, Benjamin Peterson 5878, Serhiy Storchaka 5684, Georg Brandl 5680. Windows: 1990–95 is Guido + CWI (Jack Jansen, Sjoerd Mullender) plus 13 commits by `cvs2svn`; 2000–05 is led by Fred Drake (docs); 2018 Guido writes **one** commit; 2024–26 is Serhiy / Victor / Sam Gross.

Every hash below was produced by a command that was actually run. The history is a palimpsest: CVS → Subversion → Mercurial → Git. Early commit messages still carry `HG:extra convert_revision:svn%3A…`.

---

## 1. Day one is two troff files, and commit two has the same tree

- **Find-type:** 2 (planted / dated / faked) and 3 (first commit)
- **Hashes:** `7f777ed95a19224294949e1b4ce56bbffcb1fe9f` (first); `3310257195daa702bc91fb90e78ac96a30076336` (second, empty)
- **Date:** 1990-08-09T14:25:15+00:00 / 1990-09-10T11:15:23+00:00
- **Author:** Guido van Rossum `<guido@python.org>`
- **Messages:** `Initial revision` / `Warning about incompleteness.`
- **Command:**

```
git -C ~/book16/repos/cpython log --reverse --format='%H %aI %s' af49df919dafc3767ae956767dce0482f9cd6d4e | head -3
git -C ~/book16/repos/cpython show --stat --format=fuller 7f777ed95a19224294949e1b4ce56bbffcb1fe9f
git -C ~/book16/repos/cpython rev-parse 7f777ed95a^{tree} 3310257195^{tree}
git -C ~/book16/repos/cpython cat-file -p 7f777ed95a19224294949e1b4ce56bbffcb1fe9f | head -6
```

```
7f777ed95a19224294949e1b4ce56bbffcb1fe9f 1990-08-09T14:25:15+00:00 Initial revision
3310257195daa702bc91fb90e78ac96a30076336 1990-09-10T11:15:23+00:00 Warning about incompleteness.
b829a0935bbd3dea4898bf68b6be69b59bffcbec 1990-09-18T10:47:40+00:00 Renamed intro and modules to tut and mod; added tbl to pipeline.

    Initial revision
 Doc/Makefile | 29 +++++++++++++++++++++++++++++
 Doc/README   | 25 +++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

52384aa82c1f7785424544fc3ee003729b07ac12
52384aa82c1f7785424544fc3ee003729b07ac12

HG:extra convert_revision:svn%3A6015fed2-1504-0410-9fe1-9d1591cc4771/python/branches/legacy-trunk%402161
```

The README already ends `--Guido (last modified 10 Sep 90)` — a month *after* the commit's own date. There are **178** commits whose subject is exactly `Initial revision`.

- **Why it is a story:** Someone in 1990 is not opening a git repo. A conversion robot, years later, is assembling RCS/CVS check-ins into a linear novel. It gives the first two commits different messages and dates, then points them at the same tree. The file inside the "August" commit already knows it is September. The reader who recites "Guido's first commit, 9 August 1990" is reciting a reconstructed title card, not a moment.
- **What the reader learns:** `git log --reverse | head` on a project this old is a migration boundary. Compare `commit^{tree}` of adjacent "firsts". Read the blob, not just the date. If the file contradicts the timestamp, the timestamp is the artifact.
- **Surprise:** 5

---

## 2. The language arrives on a Sunday, 66 days later; the comment is still there

- **Find-type:** 3 (first commit, of the interpreter) and 5 (comment that outlived its era)
- **Hashes:** `85a5fbbdfea617f6cc8fae82c9e8c2b5c424436d` (source dump); blame still points here on `Include/object.h`
- **Date:** 1990-10-14T12:07:46+00:00
- **Author:** Guido van Rossum `<guido@python.org>`
- **Message:** `Initial revision`
- **Command:**

```
git -C ~/book16/repos/cpython show --stat --format=fuller 85a5fbbdfea617f6cc8fae82c9e8c2b5c424436d | tail -3
git -C ~/book16/repos/cpython blame -L 8,15 af49df919dafc3767ae956767dce0482f9cd6d4e -- Include/object.h
```

```
    Initial revision
 … 78 files changed, 13589 insertions(+)

85a5fbbdfea6 (Guido van Rossum 1990-10-14 12:07:46 +0000  8) /* Object and type object interface */
85a5fbbdfea6 (Guido van Rossum 1990-10-14 12:07:46 +0000 11) Objects are structures allocated on the heap.  Special rules apply to
85a5fbbdfea6 (Guido van Rossum 1990-10-14 12:07:46 +0000 13) Objects are never allocated statically or on the stack; they must be
85a5fbbdfea6 (Guido van Rossum 1990-10-14 12:07:46 +0000 14) accessed through special macros and functions only.  (Type objects are
```

- **Why it is a story:** For two months the "Python repo" is a `ditroff -ms` documentation directory. Then a Sunday dump drops `object.h`, `intobject.c`, `posixmodule.c`, the grammar — 13,589 lines — under the same three-word subject as the docs. Thirty-six years later `git blame` on the public header still prints those sentences. The type/class unification of 2002 only had to insert two lines (Tim Peters, `4be93d0e848c`) into a paragraph Guido wrote before the first public release.
- **What the reader learns:** The first commit of a *file* is often more honest than the first commit of a *repo*. `git blame` on a header you assume is modern will, in a long-lived C project, land on a conversion-era "Initial revision". Comments outlive the memory model they describe.
- **Surprise:** 4

---

## 3. Twenty-eight ROT13 lines to commemorate a conference

- **Find-type:** 1 (tiny diff, huge blast radius)
- **Hashes:** `63cd9bf4887cd4603ead4db29c772fa370e68a25` (add); `5ff8cb4f1bb9f722908cf2331c95f9530e5bf108` (Guido, +28 min, whitespace); `be19ed77ddb047e02fe94d142181062af6d99dcc` (2007, `print` → `print()`)
- **Date:** 2002-02-08T20:13:47+00:00
- **Author:** Fred Drake `<fdrake@acm.org>` (not Tim Peters)
- **Message:** `Python 10 was a success, commemorate it\!`
- **Command:**

```
git -C ~/book16/repos/cpython log --diff-filter=A --format='%H %aI %an %s' af49df919dafc3767ae956767dce0482f9cd6d4e -- Lib/this.py
git -C ~/book16/repos/cpython show --stat 63cd9bf4887cd4603ead4db29c772fa370e68a25
git -C ~/book16/repos/cpython show 63cd9bf4887cd4603ead4db29c772fa370e68a25:Lib/this.py | head -6
```

```
63cd9bf4887cd4603ead4db29c772fa370e68a25 2002-02-08T20:13:47+00:00 Fred Drake Python 10 was a success, commemorate it\!
 Lib/this.py | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
s = """Gur Mra bs Clguba, ol Gvz Crgref
Ornhgvshy vf orggre guna htyl.
```

`git log -S 'Beautiful is better than ugly'` does **not** find this commit. The plaintext never existed in the tree.

- **Why it is a story:** Python 10 (the conference, not the version) has just ended. Fred, the docs guy, drops Tim's list into the stdlib as a rot13 joke. Twenty-eight minutes later Guido only fixes whitespace. Five years later the one `print` statement in the file is rewritten as `print()` in the 2-to-3 pass (`be19ed77`). The culture of the language is now a 28-line Easter egg that `git log -S` on the famous sentence cannot see.
- **What the reader learns:** The author of a file is not always the author of the idea. Pickaxe searches the bytes that landed, not the bytes they decode to. A one-file commit with a party in the subject can outlive the conference, the print statement, and the BDFL.
- **Surprise:** 3

---

## 4. The lock that named an era is a weekend patch for SGI video

- **Find-type:** 1 (tiny relative to blast radius) and 7 (feature that became the constraint)
- **Hash:** `1984f1e1c6306d4e8073c28d2395638f80ea509b`
- **Date:** 1992-08-04T12:41:02+00:00
- **Author:** Guido van Rossum `<guido@python.org>`
- **Message:** `* new optional built-in threadmodule.c, build upon Sjoerd's thread.{c,h}.` (one bullet in a grab-bag with `mmmodule`, `sv`, and `bzero -> memset`)
- **Command:**

```
git -C ~/book16/repos/cpython show --stat --format=fuller 1984f1e1c6306d4e8073c28d2395638f80ea509b | head -22
git -C ~/book16/repos/cpython show 1984f1e1c6306d4e8073c28d2395638f80ea509b -- Python/ceval.c | head -40
```

```
    * new optional built-in threadmodule.c, build upon Sjoerd's thread.{c,h}.
    * new module from Sjoerd: mmmodule.c (dynamically loaded).
 Python/ceval.c         |  96 ++++++++++-
 Python/thread.c        | 263 ++++++++++++++++++++++++++++++
 11 files changed, 1249 insertions(+), 393 deletions(-)

+/* Interface for threads.
+   A module that plans to do a blocking system call … can allow other
+   threads to run as follows:
+x = save_thread();
+…blocking system call here…
+restore_thread(x);
+   Note that not yet all candidates have been converted to use this
+   mechanism!
+*/
+static type_lock interpreter_lock;
```

Same afternoon: Sjoerd Mullender's first commit (`099d9233`, `new file for SGI Video`). Nine days later Jack Jansen's first (`743db36c`, `Modified to allow other threads to run in a multithreaded environment.`).

- **Why it is a story:** CWI needs threads so a video capture module can block without freezing the interpreter. The lock is optional (`#ifdef USE_THREAD`), local (`static type_lock`), and already apologetic ("not yet all candidates have been converted"). Nobody in that room is choosing the concurrency model of the 2010s. They are making `sv` and `mm` work on an SGI. The name "GIL" is not even in the patch.
- **What the reader learns:** The constraint that defines a language can enter as a helper for a hardware module that no longer exists. `git log --grep=GIL` starts in 2001; the thing itself is 1992 and does not use the acronym. Search the mechanism (`interpreter_lock`, `save_thread`), not the later nickname.
- **Surprise:** 4

---

## 5. `Print()`, capital P, "I'll rename it later"

- **Find-type:** 1 (tiny diff, huge blast radius)
- **Hashes:** `343435146a48d7922041a37bbd714fe5291523ff` (add `Print()`); `452bf519a70c3db0e7f0d2540b1bfb07d9085583` (grammar, 2007-02-09 05:32); `be19ed77ddb047e02fe94d142181062af6d99dcc` (stdlib print statements, +5 min)
- **Date:** 2006-11-30T22:13:52+00:00
- **Author:** Guido van Rossum `<guido@python.org>`
- **Message:** `Add built-in Print() function.  This is PEP 3105 except for the name; I'll rename it to print() later.`
- **Command:**

```
git -C ~/book16/repos/cpython show --stat --format=fuller 343435146a48d7922041a37bbd714fe5291523ff
```

```
    Add built-in Print() function.  This is PEP 3105 except for the name;
    I'll rename it to print() later.

    Now I can start working on the refactoring tool for print -> Print().

    Also, sep and end should be required to be strings (or Unicode?).
    Someone please volunteer.
 Python/bltinmodule.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
```

The C function is already named `builtin_print`; the advertised builtin is `Print` so the statement and the function can coexist while the 2to3 tool is written.

- **Why it is a story:** The most painful syntax break in Python 3 begins as a 55-line function with a temporary name and an open call for a volunteer to type-check `sep` and `end`. Guido is not shipping a manifesto. He is giving himself a target the refactoring tool can aim at. Three months later, at 05:32 UTC, the grammar changes and the stdlib starts to move. The capital P is the moment before the outcome was known: maybe this stays `Print()`.
- **What the reader learns:** A one-file commit that looks like a rename in waiting is often the real flag day. The "essential" follow-up (`452bf519`, 9 files, generated `graminit.c`) is bigger and less interesting. Read the first, small one.
- **Surprise:** 3

---

## 6. April 1, 2009: "The BDFL has retired!"

- **Find-type:** 2 (planted artifact)
- **Hashes:** `e3944a5e1ecf67aa722fd9ce0c0a4ee72ee5ba2d` (joke); `55cc34500e5abbfedb89adc95e3f94d53c544933` (2018-12-19, mandatory date slipped to 4.0)
- **Date:** 2009-04-01T05:08:41+00:00
- **Author:** Brett Cannon `<bcannon@gmail.com>`
- **Message:** `The BDFL has retired! Long live the FLUFL (Friendly Language Uncle For Life)!`
- **Command:**

```
git -C ~/book16/repos/cpython show --stat --format=fuller e3944a5e1ecf67aa722fd9ce0c0a4ee72ee5ba2d | head -20
git -C ~/book16/repos/cpython show e3944a5e1ecf67aa722fd9ce0c0a4ee72ee5ba2d -- Lib/__future__.py | tail -8
```

```
AuthorDate: Wed Apr 1 05:08:41 2009 +0000
    The BDFL has retired! Long live the FLUFL (Friendly Language Uncle For Life)!
 Grammar/Grammar        |   2 +-
 Lib/__future__.py      |   5 ++
 Lib/test/test_flufl.py |  27 +++++++
 13 files changed, 168 insertions(+), 121 deletions(-)

+barry_as_FLUFL = _Feature((3, 1, 0, "alpha", 2),
+                         (3, 9, 0, "alpha", 0),
+                         CO_FUTURE_BARRY_AS_BDFL)
```

`from __future__ import barry_as_FLUFL` makes `<>` the spelling of unequal, and `!=` a `SyntaxError`. The original mandatory release was **3.9**. In December 2018 — five months after Guido actually stepped down — Chris Rands, committed by Barry Warsaw, pushed it to 4.0 (`55cc3450`, message: `extending the joke!`). It is still `(4, 0, 0, "alpha", 0)` on today's tip.

- **Why it is a story:** At 05:08 UTC on April Fools' Day, Brett ships a real grammar change that pretends Guido has quit and Barry is in charge. The joke has a sunset clause: in 3.9, `<>` becomes the language. Nine years later Guido does quit, over PEP 572, and the joke's sunset has to be moved so Python 3.9 does not actually require `<>`. A gag with a version number became a prophecy that the project then had to defuse.
- **What the reader learns:** Easter eggs that encode a *date in the future* are time bombs. `__future__` features carry `(optional, mandatory)` tuples; those tuples are social contracts. When the joke's mandatory version approaches, someone has to decide whether to keep laughing.
- **Surprise:** 5

---

## 7. 2018: the name that wrote 11,408 commits writes one

- **Find-type:** 4 (name that disappears / appears)
- **Hashes:** `95e4d589137260530e18ef98a2ed84ee3ec57e12` (Guido's only 2018 commit); `3ff06ebec4e8b466f76078aa9c97cea2093d52ab` (2024, withdraws CODEOWNERS); Jack Jansen last `f75225b448c9e16db83e24a39d3d709ede070e14` (2006)
- **Date:** 2018-01-26 / 2024-05-27 / 2006-04-20
- **Author:** Guido van Rossum; Jack Jansen
- **Message (2018):** `String annotations [PEP 563] (#4390)`
- **Command:**

```
git -C ~/book16/repos/cpython shortlog -sn af49df919dafc3767ae956767dce0482f9cd6d4e | head -5
git -C ~/book16/repos/cpython rev-list --count --author='Guido van Rossum' --since=2017-01-01 --until=2018-01-01 af49df9
git -C ~/book16/repos/cpython rev-list --count --author='Guido van Rossum' --since=2018-01-01 --until=2019-01-01 af49df9
git -C ~/book16/repos/cpython rev-list --count --author='Victor Stinner' --since=2018-01-01 --until=2019-01-01 af49df9
git -C ~/book16/repos/cpython shortlog -sn --since=1990-01-01 --until=1996-01-01 af49df9 | head -6
git -C ~/book16/repos/cpython shortlog -sn --since=2018-01-01 --until=2021-01-01 af49df9 | head -4
```

```
 11408	Guido van Rossum
  8533	Victor Stinner
  5878	Benjamin Peterson
  5684	Serhiy Storchaka
  5680	Georg Brandl
Guido 2017: 17
Guido 2018: 1
Victor 2018: 306
1990-95:  2750 Guido / 378 Jack Jansen / 118 Sjoerd Mullender / 45 Barry Warsaw / 13 cvs2svn
2018-20:  1297 Victor Stinner / 528 Serhiy Storchaka / 328 Pablo Galindo
```

Jack Jansen: 2978 commits, last one 2006-04-20 (Mac/`tp_init`). Fred Drake: 5465 commits, last real work 2011. `cvs2svn` is a named author (54 manufactured tag commits, `This commit was manufactured by cvs2svn to create tag 'release098'`).

- **Why it is a story:** The all-time leaderboard still says Guido. The 2018 window says otherwise. His one commit that year is PEP 563, landed by Łukasz Langa, six months before the PEP 572 fight ends the BDFL role. Victor writes 306 times. The CWI names that built 1992 (Jack, Sjoerd) are already gone. In 2024 Guido's last structural act is a 12-line CODEOWNERS edit: `Withdraw most of my ownership in favor of Mark`. The handover is not a commit titled "I resign". It is a year of near-silence.
- **What the reader learns:** `shortlog -sn` without a window is a hall of fame. `shortlog -sn --since=… --until=…` is the org chart. A name with thousands of commits can already be gone. Also: converters (`cvs2svn`) show up as people.
- **Surprise:** 3

---

## 8. Hash used to be deterministic. Then it was a weapon.

- **Find-type:** 7 (feature that became the vulnerability)
- **Hashes:** `2daf6ae2495c862adf8bc717bfe9964081ea0b10` (2012-02-20, opt-in `-R` / `PYTHONHASHSEED`); `c9f54cf512996790266c17f81584c9725ee99d47` (2012-02-21, on by default)
- **Date:** 2012-02-20 / 2012-02-21
- **Authors:** Georg Brandl; Benjamin Peterson
- **Messages:** `Issue #13703: add a way to randomize the hash values of basic types…` / `enable hash randomization by default`
- **Command:**

```
git -C ~/book16/repos/cpython log --grep='PYTHONHASHSEED' --reverse --format='%H %aI %an %s' af49df919dafc3767ae956767dce0482f9cd6d4e | head -3
git -C ~/book16/repos/cpython show --stat --format='%H %aI %s' c9f54cf512996790266c17f81584c9725ee99d47
```

```
2daf6ae2495c862adf8bc717bfe9964081ea0b10 2012-02-20T19:54:16+01:00 Georg Brandl Issue #13703: add a way to randomize the hash values of basic types (str, bytes, datetime) in order to make algorithmic complexity attacks on (e.g.) web apps much more complicated.
1e13eb084f72d5993cbb726e45b36bdb69c83a24 2012-02-20T20:42:21-05:00 Barry Warsaw - Issue #13703: oCERT-2011-003: add -R command-line option and PYTHONHASHSEED …
c9f54cf512996790266c17f81584c9725ee99d47 2012-02-21T16:08:05-2012 enable hash randomization by default
 9 files changed, 44 insertions(+), 65 deletions(-)
```

The "enable by default" commit is a *deletion*: `-R` is removed from the usage string because the defence is no longer a flag.

- **Why it is a story:** For twenty years, `hash("a")` was the same every process. That was a feature — doctests, set order, teaching. oCERT-2011-003 made it a remote DoS against every dict-keyed web framework. Day one they ship an opt-in. Day two Benjamin turns it on for everyone and deletes the flag from `-h`. A property the language advertised becomes a CVE, then a default, in twenty-four hours.
- **What the reader learns:** Stability of a hash is a compatibility promise *and* an attack surface. When a "bugfix" is mostly deletions of a command-line flag, the semantics just flipped. Look at `git show --stat` for minus-lines in a security commit.
- **Surprise:** 3

---

## 9. `from __future__ import braces` is a SyntaxError with a punchline, filed as a bugfix

- **Find-type:** 1 (tiny, durable) and 5 (comment/joke that outlived the code around it)
- **Hash:** `ad3d3f2f3f19833f59fd7e9ec59e1714e0986e08`
- **Date:** 2001-02-28T17:47:12+00:00
- **Author:** Jeremy Hylton `<jeremy@alum.mit.edu>`
- **Message:** `Improve SyntaxErrors for bad future statements.  Set file and location for errors raised in future.c.`
- **Command:**

```
git -C ~/book16/repos/cpython log -S 'not a chance' --reverse --format='%H %aI %an %s' af49df919dafc3767ae956767dce0482f9cd6d4e -- Python/ | head -3
git -C ~/book16/repos/cpython show ad3d3f2f3f19833f59fd7e9ec59e1714e0986e08 -- Python/future.c | grep -A3 braces
git -C ~/book16/repos/cpython blame -L 41,43 af49df919dafc3767ae956767dce0482f9cd6d4e -- Python/future.c
```

```
ad3d3f2f3f19833f59fd7e9ec59e1714e0986e08 2001-02-28T17:47:12+00:00 Jeremy Hylton Improve SyntaxErrors for bad future statements. …
+} else if (strcmp(feature, "braces") == 0) {
+PyErr_SetString(PyExc_SyntaxError,
+"not a chance");

f95a1b3c53bd (Antoine Pitrou   2010-05-09 15:52:27 +0000 41)         } else if (strcmp(feature, "braces") == 0) {
f95a1b3c53bd (Antoine Pitrou   2010-05-09 15:52:27 +0000 43)                             "not a chance");
```

(The *string* is Jeremy's 2001; blame on today's file lands on Antoine's 2010 rewrite of the same joke.)

- **Why it is a story:** `__future__` has just been invented so nested scopes can be opted into. While tightening the error path, Jeremy special-cases a feature that will never exist. The subject line does not mention braces. Twenty-five years of "why doesn't Python have braces?" are answered by three lines hiding in a commit about `PyErr_SyntaxLocation`.
- **What the reader learns:** The joke that defines a community may have a commit message that will not grep. Search the punchline (`not a chance`), not the folklore (`import braces`). Also: `git blame` on a surviving one-liner can name the last reformatter, not the author.
- **Surprise:** 4

---

## 10. Tim Peters' first commit is a CVS dry run on Windows

- **Find-type:** 4 (name that appears)
- **Hash:** `c155f828faeb115f82d527d786da4f662ebcbbd8`
- **Date:** 2000-06-30T09:04:35+00:00
- **Author:** Tim Peters `<tim.peters@gmail.com>`
- **Message:** `Making a tiny change to figure out what I'm going to screw up by trying to use CVS under Windows at all ...`
- **Command:**

```
git -C ~/book16/repos/cpython log --author='Tim Peters' --reverse --format='%H %aI %s' af49df919dafc3767ae956767dce0482f9cd6d4e | head -3
git -C ~/book16/repos/cpython show --stat --format=fuller c155f828faeb115f82d527d786da4f662ebcbbd8
```

```
c155f828faeb115f82d527d786da4f662ebcbbd8 2000-06-30T09:04:35+00:00 Making a tiny change to figure out what I'm going to screw up by trying to use CVS under Windows at all ...
4b5fb0772ea32767db5b6dd5080714658accfa74 2000-07-01T00:03:43+00:00 Update for 2.0b1. …
    Making a tiny change to figure out what I'm going to screw up
    by trying to use CVS under Windows at all ...
 PCbuild/readme.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
```

Nineteen months later Fred Drake commits Tim's Zen. Tim is still committing in 2026 (`3df0c4da`, `Note out-of-date obmalloc comments`).

- **Why it is a story:** The man who will write "There should be one-- and preferably only one --obvious way to do it" arrives as a Windows CVS experiment on a three-line `readme.txt`. He does not announce himself. He pokes the tool to see what breaks. Twenty-six years on he is still annotating allocator comments.
- **What the reader learns:** A future core voice often first appears as a one-line "can I commit?" on a platform file. `git log --author=… --reverse | head` is the real introduction.
- **Surprise:** 2

---

## Ranked top 3

1. **#1 First commit is a converted palimpsest** (same tree as commit 2; README dated 10 Sep 90 inside an 9 Aug 90 commit; `HG:extra convert_revision`). Type 2+3, surprise 5. This is the archaeology: the date everyone quotes is a title card.
2. **#6 Barry as BDFL, 2009-04-01** — a real grammar change that pretends Guido retired, then has to be postponed when he actually does. Type 2, surprise 5.
3. **#4 The interpreter lock, 1992-08-04** — a CWI video-thread helper that became the GIL, without using the word. Type 1+7, surprise 4.

**Disappointing:** `git log --grep` for revert/oops/sorry/hack/FIXME across 132k commits is modern CI noise (`gh-NNNNN`); the pickaxe for `Beautiful is better than ugly` misses `this.py` entirely because the Zen is stored rot13; author/committer date gaps are rare (314) because the converters were careful — the planted-ness is in identical trees and file-vs-stamp lies, not in clock skew.
