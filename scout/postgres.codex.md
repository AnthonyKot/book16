# Independent verification and extension: postgres/postgres

## Verification table

| dig | claim | command rerun | result | note |
|---|---|---|---|---|
| 4, “One third, since 1992” | The root-file command prints the XXX comment and `0.3333333`. | `git -C ~/book16/repos/postgres show d31084e9d1118b25fd16580d9d8c2924b5740dff:src/backend/optimizer/plan/initsplan.c \| sed -n '198,205p'` | **FAIL** | The command starts at the assignment on line 198 and continues into `else`; it cannot print the lines 194–197 comment shown in the report. `sed -n '194,198p'` would reproduce that excerpt. The underlying constant and comment are real. |
| 4 | Tom Lane’s 2015 message says the old default was `0.3333333`, dates it to July 1992, and says he preserved it rather than changing everything to 0.5. | `git -C ~/book16/repos/postgres log -1 --format='%B' 39df0f150ca69fac1c89537065ddc97af18921b8 \| head -8` | **PASS** | The first eight lines match. The untruncated message also contains the reported “twenty-three years” rationale. |
| 4 | HEAD’s fallback was restored by `1eccb9315070` and still reads `0.3333333`, with the “hoariness” warning. | `git -C ~/book16/repos/postgres blame -L 1605,1612 HEAD -- src/backend/utils/adt/selfuncs.c` | **PASS** | Hash, Tom Lane attribution, 2025-09-20 timestamp, lines 1605–1612, and text all match. |
| 4 | Tom “dates” a previously undated root artifact in 2015. | `git -C /home/diablo/book16/repos/postgres grep -n 'JMH 7/9/92\|HACK TO GET V4 OUT THE DOOR' d31084e9d1118b25fd16580d9d8c2924b5740dff -- src/backend/optimizer` | **FAIL** | The root already has `THIS IS A HACK TO GET V4 OUT THE DOOR` and `-- JMH 7/9/92` at `src/backend/optimizer/path/clausesel.c:243-245`. The report checked the separate, undated `initsplan.c` occurrence and then conflated the two. Tom preserved and described an existing date; he did not supply it. |
| 4 | The three cited commits have the reported identities, dates, subjects, and relevant diffs. | `git -C /home/diablo/book16/repos/postgres show -s --format='%H %aI %an <%ae> %s' d31084e9 39df0f15 1eccb931` plus `git show --format= <hash> -- <path>` | **PASS** | Full hashes resolve exactly. Root is Marc G. Fournier, 1996-07-09; both later commits are Tom Lane on 2015-09-24 and 2025-09-20. The 2015 diff moves the fallback into `boolvarsel()`; the 2025 diff restores the function-call branch. |
| 1, “Day one is already ten years old” | Root hash, author, author date, and subject are as printed. | `git -C ~/book16/repos/postgres log -1 --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aD%n%n%B' d31084e9d1118b25fd16580d9d8c2924b5740dff` | **PASS** | Exact match: Marc G. Fournier, 1996-07-09 06:22:35 +0000, `Postgres95 1.01 Distribution - Virgin Sources`. A `format=fuller` check also confirms author and committer are identical. |
| 1 | The imported root has only `src` at top level. | `git -C ~/book16/repos/postgres ls-tree --name-only d31084e9d1118b25fd16580d9d8c2924b5740dff` | **PASS** | Output is exactly `src`. |
| 1 | The root contains the dated “That someday is today” comments. | `git -C ~/book16/repos/postgres grep -n 'That someday is today' d31084e9d1118b25fd16580d9d8c2924b5740dff` | **PASS** | The two printed receipts are real, but the exact command returns seven hits, not two: five in `transsup.c` plus two in `varsup.c`. The report silently excerpted the output without an ellipsis. |
| 1 | The root is an 868-file, 242,656-insertion snapshot. | `git -C ~/book16/repos/postgres diff-tree --root --shortstat d31084e9d1118b25fd16580d9d8c2924b5740dff` | **PASS** | Exact shortstat: `868 files changed, 242656 insertions(+)`. The CVS header, 1994 copyright, 1986 strategy-map comments, and 1984 lift claim also reproduce with `git show`/`git grep`. |
| 6, “ALTER TYPE enum DROP VALUE” | The exact `head -28` command shows the commit message and a one-file, 27-insertion stat. | `git -C ~/book16/repos/postgres show --stat --format='%B' af3ee8a086ca210d9461f813538d0169dbf07c2c \| head -28` | **PASS** | It prints the complete short body through the discussion URL and the two stat lines. |
| 6 | The same exact command prints the added grammar production and checklist shown under the stat. | same command as previous row | **FAIL** | `head -28` stops after `1 file changed, 27 insertions(+)`. None of the quoted diff follows from that command; the report combined output from an unstated second command. |
| 6 | The underlying hash, date, author, subject, and 27-line diff are correct. | `git -C /home/diablo/book16/repos/postgres show -s --format=fuller af3ee8a086ca210d9461f813538d0169dbf07c2c` and `git ... show --format= af3ee8a... -- src/backend/parser/gram.y` | **PASS** | Tom Lane, 2023-10-03 11:41:42 -0400, exact subject. The production, four concrete hazards, “Possibly more,” and `FEATURE_NOT_SUPPORTED` error all match. |
| 5, doubtful identity note | Hash/date/author/subject/stat and `SELECT NULL` comment match the report. | `git -C ~/book16/repos/postgres log -1 --format=fuller --stat 9b41da6ce48e3bed6730faa6347a5461175cff83 \| head -20` and `git -C ~/book16/repos/postgres show 9b41da6ce48e3bed6730faa6347a5461175cff83 -- src/backend/executor/execTuples.c \| tail -12` | **PASS** | The commit object and displayed output both say Bruce Momjian `<bruce@momjian.us>`; the rename and one-line comment are real. |
| 5, doubtful identity note | Bruce’s 1996 address “is a later mailmap.” | `git -C /home/diablo/book16/repos/postgres cat-file -p 9b41da6ce48e3bed6730faa6347a5461175cff83 \| sed -n '1,8p'` and `git -C /home/diablo/book16/repos/postgres show HEAD:.mailmap` | **FAIL** | The raw commit object already contains `<bruce@momjian.us>`. HEAD’s entire `.mailmap` is one Álvaro Herrera line, so it does not rewrite Bruce. This is likely conversion-time identity normalization, not a later mailmap. |

**Verification count:** 10 PASS, 4 FAIL. All cited commit hashes are genuine; the failures are two non-reproducible excerpts and two provenance/identity misdescriptions.

## New dig 1 — Thirty years and 104,124 commits, with no merge at all

- **find-type:** 2 (planted/manufactured artifact)
- **hash:** `14a3ecf57abb46413d1c40d795e7825148a82daf`
- **date:** 1996-12-09 01:24:54 +0000 (author = committer)
- **author:** `CVS to git conversion script <webmaster@postgresql.org>`
- **message:** `This commit was manufactured by cvs2git to create branch 'REL2_0B'.`

Exact receipt (the final command shows the synthetic commit deleting two monitor files):

```text
git -C /home/diablo/book16/repos/postgres rev-list --all --count
git -C /home/diablo/book16/repos/postgres rev-list --all --min-parents=2 --count
git -C /home/diablo/book16/repos/postgres show -s --format='%H%n%aI%n%an <%ae>%n%s' 14a3ecf57abb46413d1c40d795e7825148a82daf
git -C /home/diablo/book16/repos/postgres diff-tree --stat --oneline 14a3ecf57abb46413d1c40d795e7825148a82daf
104124
0
14a3ecf57abb46413d1c40d795e7825148a82daf
1996-12-09T01:24:54+00:00
CVS to git conversion script <webmaster@postgresql.org>
This commit was manufactured by cvs2git to create branch 'REL2_0B'.
14a3ecf57abb46413d1c40d795e7825148a82daf This commit was manufactured by cvs2git to create branch 'REL2_0B'.
 src/bin/monitor/Makefile  |   23 -
 src/bin/monitor/monitor.c | 1066 ---------------------------------------------
 2 files changed, 1089 deletions(-)
```

**Why it is a story.** The moment before this Git commit did not occur in 1996: it occurred during the later CVS-to-Git conversion, when a script needed to express “sprout REL2_0B here.” It invented an author, a subject that admits the manufacture, and a 1,089-line deletion. Across every current, stale, alpha, and maintenance ref, the resulting 104,124-commit graph has zero two-parent commits. PostgreSQL integrated by linear commits and repeated backpatches, while the importer represented branch births as synthetic one-parent changes.

**Reader learns:** `git rev-list --all` can reveal tens of thousands of commits hidden from HEAD, and `--min-parents=2` tests whether the graph’s apparent collaboration actually contains merges. In converted repositories, search subjects for `manufactured by cvs2git` before treating every commit as a human event.

**surprise:** 5

## New dig 2 — The beta that was pulled is still tagged, but no tag can testify

- **find-type:** 8 (rollback of the released world), also 2 (artifact of the tag/import model)
- **hashes:** beta 2 `6781aa4707a807f8d6fb5f0d9f8522bde6d1f96a`; beta 3 `460a9f8a68cd6d280151dd99220c14bc7b0d60d2`
- **date:** 2001-01-09 13:11:32 +0000 for the beta 3 change
- **author:** `PostgreSQL Daemon <webmaster@postgresql.org>` (author = committer)
- **message:** `jump version to beta3 ... beta2 was created and pulled due to a couple of large-ish bugs that Tom and Vadim were able to fix, but to avoid any confusion, beta2 was removed ... and for tag'ng purposes, beta3 is being created ...`

Exact receipt (`N` is Git’s “no signature” status):

```text
git -C /home/diablo/book16/repos/postgres for-each-ref refs/tags --format='%(objecttype)' | sort | uniq -c
git -C /home/diablo/book16/repos/postgres tag --list REL7_1_BETA2 REL7_1_BETA3 --format='%(refname:short) %(objecttype) %(objectname) %(subject)'
git -C /home/diablo/book16/repos/postgres verify-tag REL7_1_BETA3 2>&1 || true
git -C /home/diablo/book16/repos/postgres log --all --format='%G?' | sort | uniq -c
git -C /home/diablo/book16/repos/postgres show --format='%H %aI %an <%ae> %s' --stat 460a9f8a68cd6d280151dd99220c14bc7b0d60d2 | head -6
    692 commit
REL7_1_BETA2 commit 6781aa4707a807f8d6fb5f0d9f8522bde6d1f96a tag configure as beta2 ..
REL7_1_BETA3 commit 460a9f8a68cd6d280151dd99220c14bc7b0d60d2 jump version to beta3 ... beta2 was created and pulled due to a couple of large-ish bugs that Tom and Vadim were able to fix, but to avoid any confusion, beta2 was removed ... and for tag'ng purposes, beta3 is being created ...
error: REL7_1_BETA3: cannot verify a non-tag object of type commit.
 104124 N
460a9f8a68cd6d280151dd99220c14bc7b0d60d2 2001-01-09T13:11:32+00:00 PostgreSQL Daemon <webmaster@postgresql.org> jump version to beta3 ... beta2 was created and pulled due to a couple of large-ish bugs that Tom and Vadim were able to fix, but to avoid any confusion, beta2 was removed ... and for tag'ng purposes, beta3 is being created ...
 configure    | 2 +-
 configure.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
```

The diff changes only `VERSION='7.1beta2'` to `VERSION='7.1beta3'` in `configure` and `configure.in`. All 692 tag refs point directly to commits: there are no annotated tag objects, hence no in-repository tagger identity, tag message, or tag signature. `%G?` also finds no signed commit among all 104,124 commits. This says only that Git does not carry the attestation; PostgreSQL release artifacts may be authenticated elsewhere.

**Why it is a story.** Two “large-ish bugs” are found after beta 2 is made. The team’s choice, before knowing whether the next build will hold, is to pull the release and spend a new number for clarity. CVS-to-Git preserves the supposedly removed beta as a lightweight tag, but that label cannot tell who created it or authenticate itself. The apology is durable; the provenance mechanism is not.

**Reader learns:** `git tag` is not one thing. Count `%(objecttype)`, then run `verify-tag`: a lightweight release tag is only a movable ref to a commit. A surviving tag can mark an artifact that users were explicitly told to forget.

**surprise:** 4

## New dig 3 — One accented letter rewrites 3,526 author displays

- **find-type:** 4 (name appears)
- **hash:** `7bdaa4b54208afe0d0fc691877da920016db6987`
- **date:** 2024-11-05 13:56:02 +0100 (author = committer)
- **author:** Daniel Gustafsson `<dgustafsson@postgresql.org>`
- **message:** `Add a Git .mailmap file`

Exact receipt:

```text
git -C /home/diablo/book16/repos/postgres show -s --format='%H %aI %an <%ae> %s' 7bdaa4b54208afe0d0fc691877da920016db6987
git -C /home/diablo/book16/repos/postgres show 7bdaa4b54208afe0d0fc691877da920016db6987:.mailmap
git -C /home/diablo/book16/repos/postgres log --all --format='%an <%ae>|%aN <%aE>' | awk -F '|' '$1!=$2 {count[$1 " -> " $2]++} END {for(k in count) print count[k], k}' | sort -nr
7bdaa4b54208afe0d0fc691877da920016db6987 2024-11-05T13:56:02+01:00 Daniel Gustafsson <dgustafsson@postgresql.org> Add a Git .mailmap file
Álvaro Herrera <alvherre@alvh.no-ip.org>
3526 Alvaro Herrera <alvherre@alvh.no-ip.org> -> Álvaro Herrera <alvherre@alvh.no-ip.org>
```

That single line is still the whole file at HEAD. It changes no historical object, yet `%aN` and tools that honor mailmap now render 3,526 all-ref commits with `Álvaro`, where the raw `%an` says `Alvaro`.

**Why it is a story.** Twenty-eight years into the repository, Daniel chooses to restore one diacritic. The moment before the commit, thousands of receipts spell a colleague’s name the way old tooling accepted; the moment after, ordinary `git log` formats can show a name no commit object contains. It is a one-line diff with a history-wide human blast radius.

**Reader learns:** compare lowercase `%an/%ae` with uppercase `%aN/%aE`. `.mailmap` is a presentation layer over immutable history, powerful enough to reunify or rename thousands of attributions without rewriting a hash.

**surprise:** 4

## New dig 4 — “Re-add them; remove them”: two commits, one unchanging tree

- **find-type:** 2 (conversion/administrative artifact)
- **hashes:** base `2ee5d945f9d1939bbddcb3359bc9f55e844d7e7f`; add `91c62e211bc98c5f1bcd5a12d6ef1a2c9f4dbf73`; remove `a7664ca3ebcf6ef413a8053bf19a92ce2bd162f1`
- **dates:** 2007-04-17 01:05:10 +0000 and 2007-04-17 01:06:28 +0000
- **author:** Tom Lane `<tgl@sss.pgh.pa.us>` (author = committer for both)
- **messages:** `Temporarily re-add derived files, in hopes of straightening out their CVS status.`; `And remove 'em again ...`

Exact receipt (the second field is the tree hash):

```text
git -C /home/diablo/book16/repos/postgres show -s --format='%H %T %aI %an %s' 2ee5d945f9d1939bbddcb3359bc9f55e844d7e7f 91c62e211bc98c5f1bcd5a12d6ef1a2c9f4dbf73 a7664ca3ebcf6ef413a8053bf19a92ce2bd162f1
2ee5d945f9d1939bbddcb3359bc9f55e844d7e7f b1854ecbbd02e1b50c95579196d539ed757c6ce2 2007-04-16T20:15:38+00:00 Magnus Hagander Don't write timing output in quiet mode.
91c62e211bc98c5f1bcd5a12d6ef1a2c9f4dbf73 b1854ecbbd02e1b50c95579196d539ed757c6ce2 2007-04-17T01:05:10+00:00 Tom Lane Temporarily re-add derived files, in hopes of straightening out their CVS status.
a7664ca3ebcf6ef413a8053bf19a92ce2bd162f1 b1854ecbbd02e1b50c95579196d539ed757c6ce2 2007-04-17T01:06:28+00:00 Tom Lane And remove 'em again ...
```

Both `git diff-tree --stat` commands produce no output. There is also a third empty-tree commit in the all-ref graph, `f30d64d1b802b08700dcd1909281f9ff810e9582` (1998), whose message says it needed to “touch parse.h.”

**Why it is a story.** Tom is repairing CVS state, not changing PostgreSQL: temporarily add generated files, wait 78 seconds, remove them. Whatever changed administratively in CVS disappears in the conversion, leaving two Git commits whose messages describe opposite operations while parent, middle, and child all point to the same tree. The trace of the maintenance survives only because the empty commits do.

**Reader learns:** find adjacent commits with identical `%T`. An empty Git commit may be a deliberate deployment marker today—or, in converted history, the fossil of metadata that Git did not model.

**surprise:** 5

## New dig 5 — The directory named “log” looked safe to delete

- **find-type:** 7 (a feature/name that became the hazard), also 4 (name disappears/appears)
- **hashes:** directory `f82ec32ac30ae7e3ec7c84067192535b2ff8ec0e`; tools `85c11324cabaddcfaf3347df78555b30d27c5b5a`
- **dates:** 2016-10-20 11:24:37 -0400; 2017-02-09 16:23:46 -0500
- **author:** Robert Haas `<rhaas@postgresql.org>` (author = committer on both)
- **messages:** `Rename "pg_xlog" directory to "pg_wal".`; `Rename user-facing tools with "xlog" in the name to say "wal".`

Exact receipts:

```text
git -C /home/diablo/book16/repos/postgres show --format='%H %aI %an <%ae> %s' f82ec32ac30ae7e3ec7c84067192535b2ff8ec0e -- src/include/access/xlog_internal.h | rg -C 2 'XLOGDIR|XLOG_CONTROL_FILE'
git -C /home/diablo/book16/repos/postgres log --follow --format='%H %aI %an %s' --name-status -- src/bin/pg_resetwal/pg_resetwal.c | rg -B 3 -A 1 'R099.*pg_resetxlog' | head -8
 * The XLog directory and control file (relative to $PGDATA)
 */
-#define XLOGDIR                "pg_xlog"
+#define XLOGDIR                "pg_wal"
 #define XLOG_CONTROL_FILE      "global/pg_control"
M       src/bin/pg_resetwal/pg_resetwal.c
85c11324cabaddcfaf3347df78555b30d27c5b5a 2017-02-09T16:23:46-05:00 Robert Haas Rename user-facing tools with "xlog" in the name to say "wal".
R099    src/bin/pg_resetxlog/pg_resetxlog.c    src/bin/pg_resetwal/pg_resetwal.c
```

The first commit’s body supplies the missing causality: users sometimes believed `pg_xlog` was noncritical log output, with “unpleasant consequences.” It changes 37 files and makes upgrade/backup code understand both layouts. Four months later the second commit renames `pg_resetxlog`, `pg_receivexlog`, and `pg_xlogdump`; `--follow` carries the famous emergency tool through its 99%-similar rename.

**Why it is a story.** Immediately before the rename, an administrator sees a growing directory literally ending in `log` and has to decide whether it is disposable. The project has named database durability like housekeeping output. Robert chooses a compatibility-heavy rename rather than another warning: the filesystem itself will say WAL before the next person reaches for `rm`.

**Reader learns:** names are safety controls. Use `--follow --name-status` for the user-facing path, then inspect the earlier content change that motivated it; a rename may be a record of how users actually damaged systems, not branding.

**surprise:** 4

## New dig 6 — The same patch lands four years apart under two clocks

- **find-type:** 2 (dated artifact), also 4 (author/committer split)
- **hashes:** original `de8feb1f3a23465b5737e8a8c160e8ca62f61339`; REL13 cherry-pick `a5abacecb46358a7b771841e2ee0acbb1c353b79`
- **author date:** 2020-07-14 19:36:30 +0200 on both objects
- **commit dates:** 2020-07-14 19:55:25 +0200; 2024-11-08 09:42:21 +1030
- **author / committer:** Peter Eisentraut `<peter@eisentraut.org>` / Andrew Dunstan `<andrew@dunslane.net>` on the late commit
- **message:** `Fix -Wcast-function-type warnings`

Exact receipt:

```text
git -C /home/diablo/book16/repos/postgres show -s --format='%H %aI %cI %an/%cn %s' de8feb1f3a23465b5737e8a8c160e8ca62f61339 a5abacecb46358a7b771841e2ee0acbb1c353b79
git -C /home/diablo/book16/repos/postgres branch -r --contains a5abacecb46358a7b771841e2ee0acbb1c353b79
de8feb1f3a23465b5737e8a8c160e8ca62f61339 2020-07-14T19:36:30+02:00 2020-07-14T19:55:25+02:00 Peter Eisentraut/Peter Eisentraut Fix -Wcast-function-type warnings
a5abacecb46358a7b771841e2ee0acbb1c353b79 2020-07-14T19:36:30+02:00 2024-11-08T09:42:21+10:30 Peter Eisentraut/Andrew Dunstan Fix -Wcast-function-type warnings
  origin/REL_13_STABLE
```

The late commit changes seven files (127 insertions, 18 deletions), explicitly says it was cherry-picked from `de8feb1f`, and exists only on `REL_13_STABLE`. Its neighbors are more old-authored fixes committed by Andrew within minutes that morning.

**Why it is a story.** At 09:42 in 2024, Andrew is not writing this compiler-warning patch; he is transporting Peter’s 2020 decision into an old maintenance line. Git preserves Peter’s original author clock, making the commit look four years older unless the committer fields are read. The moment before the branch changes is in 2024, not 2020.

**Reader learns:** for cherry-picks and backpatches, `%aI/%an` answer who first wrote the change; `%cI/%cn` answer when and by whom this object entered this branch. Search `--all`, compare both clocks, and use `branch --contains` before constructing a chronology.

**surprise:** 4

Reliability verdict: 10 of 14 checked claims/receipts pass; every cited hash and the core of all three ranked stories are genuine.
Two printed excerpts are not reproducible as commanded, and the root-date lineage plus Bruce mailmap explanations need correction before publication.
