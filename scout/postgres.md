# Scout: postgres/postgres

- **repo:** https://github.com/postgres/postgres
- **clone:** `~/book16/repos/postgres` (already present; not re-cloned; not modified)
- **clone size:** 955M on disk; `git count-objects -vH` → 1 pack, 787.14 MiB, 1,145,201 objects
- **history span:** 1996-07-09 06:22:35 +0000 → 2026-08-19 12:37:09 +0900
- **commits:** 65,116 (`git rev-list --count HEAD`)
- **tip:** `be97b984f43079fd87c561e8ca6cd614c18e652e` Fujii Masao, "psql: Fix psql slash option leaks"
- **roots:** one (`git log --max-parents=0`) — `d31084e9d1118b25fd16580d9d8c2924b5740dff`

```
git -C ~/book16/repos/postgres log --reverse --format='%H %aI %an %s' | head -3
d31084e9d1118b25fd16580d9d8c2924b5740dff 1996-07-09T06:22:35+00:00 Marc G. Fournier Postgres95 1.01 Distribution - Virgin Sources
25bb71835f1d3c3ab85cfa33dbdf95419d003c2a 1996-07-09T06:35:38+00:00 Marc G. Fournier Fix: Can't drop tables with names longer than 16 characters.
950b6ab02272057811dcb4cdf2edcdc2f01b81b7 1996-07-09T06:39:19+00:00 Marc G. Fournier Fixes: Using LIKE or ~ operator on text type files which are null valued        causes segmentation fault.

git -C ~/book16/repos/postgres log -1 --format='%H %aI %an %s'
be97b984f43079fd87c561e8ca6cd614c18e652e 2026-08-19T12:37:09+09:00 Fujii Masao psql: Fix psql slash option leaks

git -C ~/book16/repos/postgres diff-tree --root --shortstat d31084e9d1118b25fd16580d9d8c2924b5740dff
d31084e9d1118b25fd16580d9d8c2924b5740dff
 868 files changed, 242656 insertions(+)
```

Day one is not a hello-world. It is an 868-file, 242,656-line snapshot of Postgres95 1.01, every file under `src/`, copyrights already reading `Copyright (c) 1994, Regents of the University of California`, CVS `$Header$` tags already saying `1.1.1.1`, and comments already signed `-mer 5 Aug 1991`. Thirteen minutes later the first real commit is a five-line buffer-size fix. Between that pole and a 2026 psql leak-fix sit Tom Lane's 16,863 commits, a magic number the planner has used since before the repo existed, and a last commit from the importer dated exactly fourteen years after his first.

---

## 1. Day one is already ten years old

- **find-type:** 3 (first commit) — also 2 (imported-history boundary)
- **hash:** `d31084e9d1118b25fd16580d9d8c2924b5740dff`
- **date:** Tue 9 Jul 1996 06:22:35 +0000 (author = committer)
- **author:** Marc G. Fournier `<scrappy@hub.org>`
- **message:** `Postgres95 1.01 Distribution - Virgin Sources`

```
git -C ~/book16/repos/postgres log -1 --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aD%n%n%B' d31084e9d1118b25fd16580d9d8c2924b5740dff
git -C ~/book16/repos/postgres ls-tree --name-only d31084e9d1118b25fd16580d9d8c2924b5740dff
git -C ~/book16/repos/postgres grep -n 'That someday is today' d31084e9d1118b25fd16580d9d8c2924b5740dff
commit d31084e9d1118b25fd16580d9d8c2924b5740dff
Author: Marc G. Fournier <scrappy@hub.org>
AuthorDate: Tue, 9 Jul 1996 06:22:35 +0000

    Postgres95 1.01 Distribution - Virgin Sources
src
d31084e9d1118b25fd16580d9d8c2924b5740dff:src/backend/access/transam/transsup.c:391:     *  That someday is today 5 Aug 1991 -mer
d31084e9d1118b25fd16580d9d8c2924b5740dff:src/backend/access/transam/varsup.c:508:     *  That someday is today -mer 6 Aug 1992
```

The tree has one top-level name: `src`. No README, no COPYRIGHT (those land 40 days later in `9848d365`, still headed `POSTGRES95 Data Base Management System` and pointing at `http://www.ki.net/postgres95`). File headers already carry `$Header: /cvsroot/pgsql/.../heapam.c,v 1.1.1.1 1996/07/09 06:21:11 scrappy Exp $` — CVS vendor-branch stamps one minute older than the git commit. Comments already mention `strategy map architecture chosen in 1986` (`nbtree.c`, `hash.c`) and heap code `lifted from the heap section of the 1984`. The `-mer` initials (Mike Olson, Berkeley) date themselves August 1991. "Virgin" here means "the tarball as we got it," not "the first line anyone wrote."

**Why it is a story.** On a Tuesday morning in Halifax, Fournier loads someone else's decade into a new CVS root and labels it virgin. The moment before the outcome is a shipping decision: Berkeley has stopped, the name is still Postgres95, and the comments already know 1986. Everything later — PostgreSQL, MVCC, WAL, Tom Lane — is grafted onto a tree that arrived pre-aged. `git log --reverse | head -1` will tell you the project began in 1996. The blobs will not.

**Reader learns:** the first commit of a rescued academic codebase is a cut, not a birth. Read the comments and the `$Header$` tags, not just the date. `git log --max-parents=0` plus `git grep 1991 <root>` is how you find the real age.

**surprise:** 3 (the hash and the "Virgin Sources" subject are folklore; the 1991 `-mer` lines inside the same tree are the part people skip)

---

## 2. Thirteen minutes in, the first bug is a hardcoded 16

- **find-type:** 1 (tiny diff, huge blast radius)
- **hash:** `25bb71835f1d3c3ab85cfa33dbdf95419d003c2a`
- **date:** Tue 9 Jul 1996 06:35:38 +0000
- **author:** Marc G. Fournier `<scrappy@hub.org>`
- **message:** `Fix: Can't drop tables with names longer than 16 characters.`

```
git -C ~/book16/repos/postgres show 25bb71835f1d3c3ab85cfa33dbdf95419d003c2a -- src/backend/storage/smgr/md.c
    Fix: Can't drop tables with names longer than 16 characters.
-    char fname[20];/* XXX should have NAMESIZE defined */
-    char tname[20];
+    char fname[NAMEDATALEN];
+    char tname[NAMEDATALEN+10]; /* leave room for overflow suffixes*/
-    memset(fname,0,20);
-    strncpy(fname, RelationGetRelationName(reln)->data, 16);
+    memset(fname,0, NAMEDATALEN);
+    strncpy(fname, RelationGetRelationName(reln)->data, NAMEDATALEN);
```

The same root commit already disagrees with itself about the limit: `src/backend/include/postgres.h` has `#define NAMEDATALEN 16`, `src/Makefile.global` has `NAMEDATALEN = 32`, and `md.c` had a literal 16/20 plus an XXX that said they should have used a named constant. The first human commit after the import is five lines that pick the constant. Six years later Bruce Momjian still has to write `Cleanup use of 16 that should be NAMEDATALEN` (`0da6358f`, 1998-07-20). In 2002 he lands `Change NAMEDATALEN to 64` (`46bb23ac`). HEAD still has `#define NAMEDATALEN 64` in `src/include/pg_config_manual.h`.

**Why it is a story.** The imported tree cannot drop a table whose name is longer than a 1980s identifier. Someone has already raised the advertised limit to 32 in the makefile and forgotten the storage manager. The moment before: a user types `DROP TABLE` on a 17-character name and the file on disk is truncated. The first "we are now a project" commit is not a feature. It is a buffer.

**Reader learns:** the first commit after an import is often the first place the imported constants disagree. `git log --reverse` plus `git grep NAMEDATALEN <root>` will show you the split-brain before the fix.

**surprise:** 4

---

## 3. Eight-year-old comments still blamed on the importer

- **find-type:** 5 (comment that outlived its code)
- **hashes:** surviving lines `^d31084e9d11` on `src/backend/utils/hash/dynahash.c`; file still at HEAD
- **date:** 1996-07-09 as far as git knows; the comments claim Jul 26 1988 13:16, February 1990, April 1990
- **author:** Marc G. Fournier (via the import); original voices `ejp@ausmelb.oz`, `margo@postgres.berkeley.edu`, `sullivan@postgres.berkeley.edu`

```
git -C ~/book16/repos/postgres blame -L 66,93 HEAD -- src/backend/utils/hash/dynahash.c
^d31084e9d11 (Marc G. Fournier 1996-07-09 06:22:35 +0000 66) /*
51ee9fa1574e (Tom Lane         2006-07-22 23:04:39 +0000 67)  * Original comments:
^d31084e9d11 (Marc G. Fournier 1996-07-09 06:22:35 +0000 69)  * Dynamic hashing, after CACM April 1988 pp 446-457, by Per-Ake Larson.
^d31084e9d11 (Marc G. Fournier 1996-07-09 06:22:35 +0000 71)  * by ejp@ausmelb.oz, Jul 26, 1988: 13:16;
^d31084e9d11 (Marc G. Fournier 1996-07-09 06:22:35 +0000 89)  * Modified margo@postgres.berkeley.edu February 1990
^d31084e9d11 (Marc G. Fournier 1996-07-09 06:22:35 +0000 91)  * Modified by sullivan@postgres.berkeley.edu April 1990
```

Margo Seltzer and Mike Sullivan are still in the file, at Berkeley addresses, under a 1994 UC copyright, blamed on a man who imported a tarball in 1996. Tom Lane in 2006 only added the heading `Original comments:`. David Rowley touched the HASH_STATISTICS sentence in 2025. The CACM citation, the Australian timestamp down to the minute, and the two `postgres.berkeley.edu` modifiers have not been worth rewriting in thirty git years. The 1986 "strategy map architecture" comments in `nbtree.c` / `hash.c` did not survive; these did.

**Why it is a story.** The hash table every backend still uses to find a catalog cache opens with a 1988 Melbourne timestamp and two 1990 Berkeley modifiers. Git has no parent older than Fournier, so `blame` pins a generation of names on the importer. The caret (`^`) is the tell. The moment before: Margo types `added multiple table interface` in February 1990, into a file that will outlive the university project, the name Postgres95, and every VCS they used before this one.

**Reader learns:** `git blame` on a file that predates the VCS will pin a generation of work on the person who ran the import. The `^` prefix is how git admits it. Search the first commit for `@berkeley.edu` before you believe the author column.

**surprise:** 4

---

## 4. One third, since 1992, on purpose

- **find-type:** 5 (comment/TODO that outlived its code)
- **hashes:** number already in root `d31084e9` (`src/backend/optimizer/plan/initsplan.c`); Tom Lane names it `39df0f150ca69fac1c89537065ddc97af18921b8` (2015) and `1eccb93150707acfcc8f24556a15742a6313c8ac` (2025)
- **dates:** 1996-07-09 (number in tree); 2015-09-24; 2025-09-20
- **author:** unknown Berkeley hand, then Tom Lane `<tgl@sss.pgh.pa.us>`
- **messages:** (root, no message about it); `Allow planner to use expression-index stats for function calls in WHERE.`; `Re-allow using statistics for bool-valued functions in WHERE.`

```
git -C ~/book16/repos/postgres show d31084e9d1118b25fd16580d9d8c2924b5740dff:src/backend/optimizer/plan/initsplan.c | sed -n '198,205p'
git -C ~/book16/repos/postgres log -1 --format='%B' 39df0f150ca69fac1c89537065ddc97af18921b8 | head -8
git -C ~/book16/repos/postgres blame -L 1605,1612 HEAD -- src/backend/utils/adt/selfuncs.c
 * XXX If we have a func clause set selectivity to 1/3,
 *     really need a true selectivity function.
 */
clauseinfo->selectivity = (Cost)0.3333333;

Previously, a function call appearing at the top level of WHERE had a
hard-wired selectivity estimate of 0.3333333, a kludge conveniently dated
in the source code itself to July 1992. ... I preserved the behavior ...
changing a default estimate that's survived for twenty-three years seems
like something not to do without a lot more testing than I care to put
into it right now.

1eccb9315070 (Tom Lane 2025-09-20 12:44:52 -0400 1608)  * using that estimate for function calls since 1992.  The hoariness
1eccb9315070 (Tom Lane 2025-09-20 12:44:52 -0400 1609)  * of this behavior suggests that we should not be in too much hurry
1eccb9315070 (Tom Lane 2025-09-20 12:44:52 -0400 1612) selec = 0.3333333;
```

The first commit already contains the number and the XXX that promised a real selectivity function. I did not find the words "July 1992" in that blob — Tom, reading the tree in 2015, dates the kludge there. In 2015 he almost changes the default to 0.5 and refuses. In 2025, after a later patch accidentally dropped the fallback, he puts 0.3333333 back and writes "hoariness" into `selfuncs.c` so the next person will also refuse. HEAD still estimates a bare function in WHERE at one third.

**Why it is a story.** Someone in Berkeley needed a number, picked 1/3, and left an XXX. Thirty-three years later the most careful committer in the project treats changing it as more dangerous than leaving it. The moment before the 2015 commit: he has a better estimator in hand, a complaint from the field, and a default that has steered every function-in-WHERE plan since before the repo existed. He keeps the number. The comment is the decision.

**Reader learns:** a magic constant with an XXX is not unfinished work. It is a contract with every plan that has been "good enough" since. `git log -S 0.3333333` plus the commit message that refuses to change it is the archaeology; the number on HEAD is the receipt.

**surprise:** 5

---

## 5. The name change is a man-page sweep plus SELECT NULL

- **find-type:** 4 (name that appears)
- **hashes:** `9b41da6ce48e3bed6730faa6347a5461175cff83` (first), then a year of follow-ups (`1b929d17`, `d02015d1`, `b070db66`…)
- **date:** Wed 11 Dec 1996 00:28:15 +0000
- **author:** Bruce Momjian `<bruce@momjian.us>` (address is a later mailmap)
- **message:** `Rename postgres95 to PostgreSQL.  Add comment for SELECT NULL`

```
git -C ~/book16/repos/postgres log -1 --format=fuller --stat 9b41da6ce48e3bed6730faa6347a5461175cff83 | head -20
AuthorDate: Wed Dec 11 00:28:15 1996 +0000
    Rename postgres95 to PostgreSQL.  Add comment for SELECT NULL
 61 files changed, 385 insertions(+), 186 deletions(-)

git -C ~/book16/repos/postgres show 9b41da6ce48e3bed6730faa6347a5461175cff83 -- src/backend/executor/execTuples.c | tail -12
+       /* fix for SELECT NULL ... */
        get_id_typname(restype?restype:UNKNOWNOID),
```

Five months after "Virgin Sources," Bruce walks the man pages and the banner strings and, in the same commit, sticks a one-line comment on the `SELECT NULL` crash the 1996 TODO still lists as `Prevent SELECT NULL from crashing server`. The rename is not a single switch. Fournier is still committing `Change Postgres95 to PostgreSQL` in April 1997. Peter Eisentraut in 2001 can write `We're past Postgres95 now, and I'm sure Jolly doesn't want to receive any bug reports. ;-)` (`e6a44134`). Tom in 2008 can still say a file `has been dead code since Postgres95` (`c8b69ed6`).

**Why it is a story.** The project decides it is no longer a numbered Berkeley release. The commit that says so is mostly `s/postgres95/PostgreSQL/` in `.l` man pages, plus a crash comment, authored by a man who two months earlier landed `Changed gawk to awk` (`0d83b867`, 1996-09-25) and who will still be editing synopsis whitespace in 2026 (`07374f7f`). The moment before: the web page is still `www.ki.net/postgres95` and the copyright still says POSTGRES95.

**Reader learns:** a rename in git is a year of leftover strings, not a flag day. `git log --grep=Postgres95` after the "rename" commit is the real length of the name.

**surprise:** 2

---

## 6. A grammar production that exists so you will read the warning

- **find-type:** 5 (comment that outlived — here, preceded — its code)
- **hash:** `af3ee8a086ca210d9461f813538d0169dbf07c2c`
- **date:** Tue 3 Oct 2023 11:41:42 -0400
- **author:** Tom Lane `<tgl@sss.pgh.pa.us>`
- **message:** `Add some notes about why "ALTER TYPE enum DROP VALUE" is hard.`

```
git -C ~/book16/repos/postgres show --stat --format='%B' af3ee8a086ca210d9461f813538d0169dbf07c2c | head -28
    Add some notes about why "ALTER TYPE enum DROP VALUE" is hard.

    In hopes of putting these where any would-be implementer is sure to
    find them, make a placeholder grammar production for ALTER DROP VALUE
    and put them there.  This is really just a docs patch, though.

    Vik Fearing, with a bit more wordsmithing by me
 src/backend/parser/gram.y | 27 +++++++++++++++++++++++++++

+ | ALTER TYPE_P any_name DROP VALUE_P Sconst
+{
+/*
+ * The following problems must be solved before this can be
+ * implemented:
+ * - There must be no instance of the target value in any table.
+ * - The value must not appear in any catalog metadata...
+ * - The value must not appear in any non-leaf page of a btree...
+ * - Concurrent sessions must not be able to insert the value...
+ * - Possibly more...
+ */
+ereport(ERROR, (errcode(ERRCODE_FEATURE_NOT_SUPPORTED),
+ errmsg("dropping an enum value is not implemented"),
```

The diff is 27 lines. The commit message is longer than the code that is not being written. He adds a parser production whose only job is to fire `FEATURE_NOT_SUPPORTED` and to hold a checklist, because a wiki page or a mail-thread is a place people will not look. This is Tom Lane's house style taken to its limit: the message is better than the diff because the diff is a signpost.

His first commit, for contrast, is three loader flags: `Change HPUX loader flags to trap null pointer derefs` (`502769d0`, 1998-10-01). Twenty-five years and 16,863 commits later (`git rev-list --count --author='Tom Lane' HEAD`) he is still writing the thing he wishes the next person would read.

**Why it is a story.** A feature request has been circling for years. The cheapest way to stop the next patch from being wrong is to make the parser itself reject the syntax and explain why. The moment before: Vik Fearing has the notes, someone is about to implement DROP VALUE, and Tom chooses to land the warning instead of the feature.

**Reader learns:** if you cannot afford the feature, put the refusal where the next implementer will type. A grammar production that only errors is a design doc that `git grep` will find. `git log --author='Tom Lane' --grep='why .* is hard'` is a reading list.

**surprise:** 4

---

## 7. The man who shipped MVCC logged out mid-sentence

- **find-type:** 4 (name that disappears)
- **hashes:** `3f7fbf85dc5b42dfd33c803efe6c90533773576a` (Initial MVCC); `47937403676d913c0e740eec6b85113865c6c8ab` (XLOG/WAL); last `3092869233bedc8e7057c4aebf66d11ed4ca65ea`
- **dates:** 1998-12-15; 1999-10-06; last 2001-04-05 09:34:32 +0000
- **author:** Vadim B. Mikheev `<vadim4o@yahoo.com>`
- **message (last):** `StartupXLOG(): initialize XLogCtl->Insert to new page if there is no room for a record on last log page.`

```
git -C ~/book16/repos/postgres shortlog -sn --after=1996-01-01 --before=2001-01-01 HEAD | head -6
  3276  Bruce Momjian
  1441  Marc G. Fournier
  1441  Tom Lane
   981  Thomas G. Lockhart
   503  Vadim B. Mikheev

git -C ~/book16/repos/postgres log --author='Vadim B. Mikheev' -1 --format='%H %ai %s'
git -C ~/book16/repos/postgres diff-tree --shortstat 3f7fbf85dc5b42dfd33c803efe6c90533773576a
3092869233bedc8e7057c4aebf66d11ed4ca65ea 2001-04-05 09:34:32 +0000 StartupXLOG(): initialize XLogCtl->Insert to new page if there is no room for a record on last log page.
3f7fbf85dc5b42dfd33c803efe6c90533773576a
 65 files changed, 1382 insertions(+), 1273 deletions(-)
```

519 commits. Subject lines like `Initial MVCC code.` and `XLOG (also known as WAL -:))`. Yahoo.com. Then a 58-line xlog edge case and silence. Two years earlier Tom had written `I do not trust this until Vadim says it's OK...` on an 11-line pg_upgrade tweak (`b0984e69`, 1999-08-02). After April 2001 Vadim does not say. Thomas G. Lockhart (981 commits 1996–2000) follows him out the door on 2002-08-05 (`ac1a3dcf`, an assert-enabled xlog compile fix). Bryan Henderson's last line, years earlier, is `Add "else true" to make it magically work on Ultrix` (`6e725b29`, 1997-01-23).

**Why it is a story.** The storage model the rest of the world now calls "how Postgres works" is 65 files from a man whose last recorded thought is whether the WAL insert pointer has room on the page. The moment before: he has turned runtime btree recovery on by default (`c19dadbf`, 2001-02-07) and thanked Tom for a lock (`278aa680`, 2001-04-04). There is no farewell. The next WAL bug belongs to whoever is left.

**Reader learns:** `git shortlog -sn` in successive `--after/--before` windows is the handover map. The person who invented the subsystem is allowed to vanish on a Tuesday morning in a one-file bugfix. If your test is "Vadim says it's OK," write that down before he is gone.

**surprise:** 3

---

## 8. The importer's last commit is fourteen years to the day

- **find-type:** 4 (name that disappears) — also 2 (dated artifact)
- **hashes:** first `d31084e9d1118b25fd16580d9d8c2924b5740dff`; last `1084f317702e1a039696ab8a37caf900e55ec8f2`
- **dates:** Tue 9 Jul 1996 06:22:35 +0000 → Fri 9 Jul 2010 02:43:12 +0000
- **author:** Marc G. Fournier `<scrappy@hub.org>`
- **message (last):** `tag beta3`

```
git -C ~/book16/repos/postgres log --author='Marc G. Fournier' --reverse --format='%aD %s' | head -1
git -C ~/book16/repos/postgres log --author='Marc G. Fournier' -1 --format='%aD %s'
git -C ~/book16/repos/postgres show --stat --format=fuller 1084f317702e1a039696ab8a37caf900e55ec8f2 | head -16
Tue, 9 Jul 1996 06:22:35 +0000 Postgres95 1.01 Distribution - Virgin Sources
Fri, 9 Jul 2010 02:43:12 +0000 tag beta3
AuthorDate: Fri Jul 9 02:43:12 2010 +0000
    tag beta3
 configure                     | 18 +++++++++---------
 4 files changed, 15 insertions(+), 15 deletions(-)
```

1,491 commits. Early ones apply other people's mail (`From: Tom Lane <tgl@sss.pgh.pa.us>`). Late ones are version stamps. The last is a 9.0beta3 bump, on the calendar anniversary of the import, after years of doing only tags. I cannot prove he waited for July 9 — 9.0beta3 was going to land when it landed — but the two poles of his name in this repo are the same day of the year, fourteen years apart, and nothing of his follows.

**Why it is a story.** The man who created the repository spends his last morning doing the job he always did: bumping `configure` so a tarball can be called beta3. The moment before: he has already receded from code into release engineering (his last decade is almost all tags). Then the name stops. Tom, Bruce, and Peter keep going.

**Reader learns:** `git log --author=... | tail` plus `git log --author=... | head` is a life. When the last commit is a version stamp, the handover already happened and nobody wrote it down.

**surprise:** 4 (the date rhyme; the content of the last commit is ordinary)

---

## 9. Four thousand lines of TODO become a URL

- **find-type:** 8 (rollback of the world) — also 5
- **hashes:** first living list `9e9206e0df2bdf5452d5a8e942454b3821b1ebc6` (1996-10-04); truncation `cbcd3f9a927af05e2c4f0c74a5507641790f9522` (2008-08-20); HEAD still the stub
- **date:** Wed 20 Aug 2008 18:20:46 +0000
- **author:** Bruce Momjian `<bruce@momjian.us>`
- **message:** `New TODO list URL wiki location listed; contents truncated.`

```
git -C ~/book16/repos/postgres show 9e9206e0df2bdf5452d5a8e942454b3821b1ebc6:doc/TODO | head -22
====================================================
TODO list (FAQ) for Postgres95
====================================================
last updated:Thu Oct  3 17:59:06 EDT 1996
current maintainer:Bruce Momjian (maillist@candle.pha.pa.us)
RELIABILITY
-Overhaul bufmgr/lockmgr/transaction manager
-Fix CLUSTER
Prevent SELECT NULL from crashing server
ENHANCEMENTS
add subselects, possibility using temporary SQL functions
Implement HAVING clause
add OUTER joins, left and right
add UNIONS, INTERSECTS, SUBTRACTS
add temporary tables

git -C ~/book16/repos/postgres diff-tree --shortstat cbcd3f9a927af05e2c4f0c74a5507641790f9522
git -C ~/book16/repos/postgres show HEAD:doc/TODO
 2 files changed, 5 insertions(+), 4052 deletions(-)
The TODO list is now maintained at:
https://wiki.postgresql.org/wiki/Todo
```

The 1996 list is the next decade of the project, written down while the name is still Postgres95. Subselects, outer joins, unions, temporary tables, HAVING — each will be a release headline. Bruce maintains the file for twelve years (he is the `#1` committer 1996–2005 at 6,090, then `#7` by 2016–2020). In 2008 he deletes 4,052 lines and leaves a wiki URL. Tom later only flips the URL to https (`7f77cbd9`, 2017). The file is still there.

**Why it is a story.** A project's memory of what it is not yet moves off-git. The moment before: the in-tree TODO is the place a new contributor looks. After: git history still has every revision, but `HEAD:doc/TODO` is a pointer, and the pointer's contents are outside the object store. The 1996 wishes that took ten years to finish are now only reachable with `git show 9e9206e0:doc/TODO`.

**Reader learns:** when a TODO is "moved to the wiki," that is a delete of the in-repo memory. Keep a copy of the last fat revision. `git log --follow -- doc/TODO` plus `git show <first>:doc/TODO` is the real roadmap.

**surprise:** 3

---

## 10. Noon on the calendar, and a daemon who thanks God

- **find-type:** 2 (planted / dated / faked artifact)
- **hashes:** `665d1fad99e7b11678b0d5fa24d2898424243cd6` (Logical replication, noon); `a2c8e5cfdb9d82ae6d4bb8f37a4dc7cbeca63ec1` (author 2016-08-30 12:00:00, commit 2017-12-26); `baef78d96b799b6264a54f8cfce4fda2b2da9701` (PostgreSQL Daemon)
- **dates:** 2017-01-19 12:00:00 -0500 / 2016-08-30 12:00:00 -0400 / 1998-01-15 19:46:37 +0000
- **authors:** Peter Eisentraut; PostgreSQL Daemon `<webmaster@postgresql.org>`
- **messages:** `Logical replication`; `Add support for static assertions in C++`; `Thank god for searchable mail archives.`

```
git -C ~/book16/repos/postgres log --format='%ai %ci %an %s' | grep ' 12:00:00 ' | head -6
2016-08-30 12:00:00 -0400 2017-12-26 10:45:07 -0500 Peter Eisentraut Add support for static assertions in C++
2017-01-19 12:00:00 -0500 2017-01-20 09:04:49 -0500 Peter Eisentraut Logical replication

git -C ~/book16/repos/postgres diff-tree --shortstat 665d1fad99e7b11678b0d5fa24d2898424243cd6
 119 files changed, 13354 insertions(+), 95 deletions(-)

git -C ~/book16/repos/postgres log -1 --format='%an <%ae>%n%s%n%b' baef78d96b799b6264a54f8cfce4fda2b2da9701 | head -8
PostgreSQL Daemon <webmaster@postgresql.org>
Thank god for searchable mail archives.

Patch by: wieck@sapserv.debis.de (Jan Wieck)
   One  of  the design rules of PostgreSQL is extensibility.
```

124 commits in this clone have author time exactly `12:00:00`; 123 of them are Peter Eisentraut's. Logical replication — 13,354 lines, PUBLICATION/SUBSCRIPTION, the feature of 10.0 — is authored at noon on a Thursday and committed the next morning. Another noon-stamped commit sits 483 days before its committer date (`a2c8e5cf`). Separately, 53 commits belong to an account named `PostgreSQL Daemon`, whose 1998 voice applies Jan Wieck's PL work with a subject that is a sigh.

**Why it is a story.** A 13,000-line feature does not happen at 12:00:00. Someone (or some script) normalized author dates to noon, then committed when review was done. The Daemon is the opposite artifact: a shared mailbox that committed as itself because that is who ran `cvs commit` from the web machine. The moment before logical replication lands: Petr Jelinek's years of work, four reviewers, and a clock that will say noon forever.

**Reader learns:** author date is a claim. `git log --format='%ai %ci'` and a grep for `12:00:00` will find the claims that were filled in. A named daemon in `shortlog` is a process, not a person.

**surprise:** 3

---

## 11. World-writable COPY, and whoever thought that was a default

- **find-type:** 1 (tiny diff, huge blast) — also 7 (feature that became the hazard)
- **hash:** `d8ba3dfb0b3385350d512fd6d56c83c244c98016`
- **date:** Sun 21 Nov 1999 04:16:17 +0000
- **author:** Tom Lane `<tgl@sss.pgh.pa.us>`
- **message:** `Change backend-side COPY to write files with permissions 644 not 666 (whoever thought world-writable files were a good default????). …`

```
git -C ~/book16/repos/postgres log -1 --format=fuller --stat d8ba3dfb0b3385350d512fd6d56c83c244c98016
AuthorDate: Sun Nov 21 04:16:17 1999 +0000
    Change backend-side COPY to write files with permissions 644 not 666
    (whoever thought world-writable files were a good default????).  Modify
    the pg_pwd code so that pg_pwd is created with 600 permissions.  Modify
    initdb so that permissions on a pre-existing PGDATA directory are not
    blindly accepted: if the dir is already there, it does chmod go-rwx
 5 files changed, 49 insertions(+), 23 deletions(-)

git -C ~/book16/repos/postgres show d8ba3dfb0b3385350d512fd6d56c83c244c98016 -- src/backend/commands/copy.c | grep -A4 fileumask
+  <fileumask> is the umask(2) setting to use while creating an output file.
+  Up through version 6.5, <fileumask> was always 000, which was foolhardy.
```

COPY TO a file, and the password file `pg_pwd`, had been created with umask 000. The same commit stops initdb from trusting a pre-existing `PGDATA`. It is a Sunday 4 a.m. permissions pass, written in the voice that will become the project's conscience (`whoever thought`, `foolhardy`). The feature is "write a file." The blast radius is every box that ran 6.5.

**Why it is a story.** For six major versions the server would write user data and the password file world-writable if you asked it to write a file. The moment before: COPY works, initdb works, nobody has filed the bug as a CVE because the year is 1999. Tom changes three numbers and writes the sentence that makes the old default look like a choice.

**Reader learns:** defaults that ship from academic code (`umask 000`, mode 666) survive until someone is angry in a commit message. `git log --grep='whoever thought'` is a short, useful index.

**surprise:** 3

---

## Ranked top-3

1. **One third, since 1992** (dig 4) — an XXX in the first tree that Tom Lane still will not change in 2025; the comment is now the feature.
2. **Virgin Sources already contain 5 Aug 1991** (dig 1) — day one is a cut, and the blobs are a decade older than the commit.
3. **ALTER TYPE enum DROP VALUE as a parser production that only warns** (dig 6) — the commit message is the product; the diff is a signpost.

**Disappointing:** there is no Heartbleed-sized one-line disaster in this history, and no revert *war* — `Revert "Add GROUP BY ALL"` (`a32733d8`, 2026-07-17) is a polite late-beta rollback, not a fight. The CVS import flattened Berkeley authors, so you cannot `git log` your way to Stonebraker; Margo and `-mer` survive only as comments. Tom Lane's essay-length messages are the house style, which makes "find the one where the message is better than the diff" almost too easy and therefore less of a surprise.
