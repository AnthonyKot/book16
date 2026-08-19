## Verification table

| dig | claim | command rerun | result | note |
|---|---|---|---|---|
| #2 | `59fd1780…` is antirez's 2020-06-22 `Clarify maxclients… Remove myself too.` commit; 9 insertions/1 deletion, including subtracting the `myself` node | `git -C /home/diablo/book16/repos/redis show --format=fuller --stat 59fd178014c7cca1b0c668b30ab0d991dd3030f3` (plus `show` of the diff) | **PASS** | Hash, both dates, author/committer, subject, stat, and `dictSize(...)-1` diff agree. Calling the subject an intentional autobiographical pun is plausible interpretation, not something Git can prove. |
| #2 | antirez's actual last 2020 commit is `ad0a9df7…` on 2020-06-25, and there are zero antirez/Salvatore-authored commits from 2021-01-01 through 2024-12-31 | `git -C /home/diablo/book16/repos/redis log --author='antirez\|Salvatore' --since=2020-06-20 --until=2021-01-01 --format='%aI %s'`; `git -C /home/diablo/book16/repos/redis rev-list --count --author='antirez\|Salvatore' HEAD --since=2021-01-01 --until=2025-01-01` | **PASS** | The last authored object and its four-line comment diff match; count is `0`. |
| #2 | the three displayed log lines are the output of the exact date-window command | same `log --author=… --since=… --until=…` command | **FAIL** | The command prints ten commits, not three. The report silently omits seven antirez/Salvatore-authored merge/fix commits, including two later on June 25. This does not change the last-commit conclusion, but the displayed receipt is not exact output. |
| #2 | 2020/2021 top-three shortlogs are `244/211/164` and `129/72/67` | the two reported `git … shortlog -sn HEAD --since=… --until=… \| head -3` commands | **PASS** | Both triplets reproduce exactly. |
| #7 | `33d653e2…` is a zero-parent 2025-01-27 antirez commit titled `First internal release.`, 21 files/7,058 insertions, with a two-line All Rights Reserved license | the four reported root/`show`/license commands | **PASS** | Hash, author and committer dates, author, message, stat, and license text all match. |
| #7 | copyright changes to Redis Ltd, then the tree is imported and merged on April 2; Salvatore returns on mainline April 9 | reported license diff, plus `git … show -s --format='%H %aI %an %s' 78e0d871… 5e7333d2… 96a0cfde…` | **PASS** | `afcc2ff6…`, `78e0d871…`, the two-parent merge `5e7333d2…`, and typo-subject PR `96a0cfde…` all match. The 2025 shortlog also puts antirez first at 129. |
| #6 | `d6510286…` adds the AGPL option with 179 files, 1,856 insertions, 762 deletions | `git -C /home/diablo/book16/repos/redis show --shortstat d65102861f51af48241f607afa678c4c2a0f894c` | **PASS** | Hash, date, author, subject, body links, and stat match. |
| #6 | the added section was headed AGPL but contained GPL text until `26683565…` fixed it five days later | the reported `show 26683565… -- LICENSE.txt \| head -25` and `show d6510286…:LICENSE.txt \| grep -n GNU \| head -6` | **PASS** | The old body says “GNU General Public License”; the fix changes the Affero preamble and is dated 2025-05-06. |
| #5 | `0b343969…` performs the BSD-to-RSAL/SSPL rewrite, including deletion of `COPYING` and replacement of C-file banners | the four reported `show`/`log` commands | **PASS** | Hash, subject/body, 166-file stat, deleted BSD text, and `src/adlist.c` banner replacement match. |
| #5 | “author = committer = GitHub” | `git -C /home/diablo/book16/repos/redis show --format=fuller --shortstat 0b34396924eca4edc524469886dc5be6c77ec4ed` | **FAIL** | Author is **Pieter Cailliau `<pieter@redis.com>`**; committer is **GitHub `<noreply@github.com>`**. Their timestamps are equal, but their identities are not. A raw `gpgsig` is present on the GitHub-committed object. |
| #5 | Pieter Cailliau's complete author history is two license commits | `git -C /home/diablo/book16/repos/redis log --reverse --author='Pieter Cailliau' --format='%h %aI %s'` | **PASS** | Exactly the 2024 dual-license commit and 2025 AGPL-option commit appear; the touched-file claims are consistent. |
| #3 | object `1f37f1dd…` has the claimed author date/commit date, subject, and 4-insertion/3-deletion alias diff | `git -C /home/diablo/book16/repos/redis show --format=fuller --stat 1f37f1dd53160e2defcc82c04c7fb7ffd03b4656` (plus `show -- src/server.c`) | **PASS** | The object and patch are real. It changes `slaveof` to call `replicaofCommand` and adds `replicaof`. |
| #3 | that hash is the first commit in the displayed mainline `Slave removal:` series, making it the same lineage as the cited LOLWUT work | reported three commands, plus `branch -a --contains` and comparison with `ef2c7a5b…` | **FAIL** | The report splices histories. `1f37f1dd…` is contained by `origin/5.0`, not `unstable`; mainline carries the rewritten twin `ef2c7a5b…` (same author date, different parent/tree and 2018-09-11 commit date). The exact `log --grep` command walks mainline but hides hashes, while `show --stat 1f37…` switches to the release-line object. Also, `show --stat` cannot emit the displayed diff hunk. |
| #3 | there are twenty `Slave removal:` commits | `git -C /home/diablo/book16/repos/redis log --grep='^Slave removal' --format='%H' \| wc -l` | **FAIL** | It returns **21**. The omitted one is `cb51bb43…`, `Slave removal: capitalize Replica`, authored 2018-09-11 11:30:46 +0200. |
| #3 | LOLWUT/Schotter work occupies the next two days, with `43385c43…` wrapping it as a command | reported antirez date-window log, plus `git … show --format=fuller --stat 43385c43…` | **PASS** | Hash, 2018-09-12 date, author, message, and 40-insertion/15-deletion stat match. This object is on `unstable`. |

**Verification count: 11 PASS / 4 FAIL.**

---

## New dig 1 — Redis 6.2.14 and 6.2.15 are the same unsigned, message-less tag target

- **find-type:** 2 (planted/dated artifact)
- **hash:** `91863dd854feba7f75ae58976a920acb192a5b67` (the single commit targeted by both refs)
- **date:** 2023-10-17T13:43:45+03:00
- **author:** Oran Agra `<oran@redislabs.com>`
- **message:** commit subject `Redis 6.2.14`; tag message for `6.2.15`: absent
- **exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/redis for-each-ref --format='%(refname:short) %(objecttype) %(objectname) | tagger=%(taggername) | message=%(contents:subject)' refs/tags/6.2.14 refs/tags/6.2.15
git -C /home/diablo/book16/repos/redis show -s --format='%H %aI %an %s' 6.2.15
git -C /home/diablo/book16/repos/redis tag -v 6.2.15 2>&1 | head -1
```

```text
6.2.14 commit 91863dd854feba7f75ae58976a920acb192a5b67 | tagger= | message=Redis 6.2.14
6.2.15 commit 91863dd854feba7f75ae58976a920acb192a5b67 | tagger= | message=Redis 6.2.14
91863dd854feba7f75ae58976a920acb192a5b67 2023-10-17T13:43:45+03:00 Oran Agra Redis 6.2.14
error: 6.2.15: cannot verify a non-tag object of type commit.
```

- **Why it is a story:** At the moment somebody created the `6.2.15` ref, Git accepted a second release name on the exact `6.2.14` object. Because both are lightweight tags, `6.2.15` has no tagger, date, release message, or GPG signature of its own: the only prose available still says `Redis 6.2.14`. Nothing in the object graph distinguishes the two releases.
- **What the reader learns:** Compare release refs with `for-each-ref`, not only `git tag -l`. `%(objecttype)` tells whether a release has an annotated tag object; identical object IDs tell whether two version labels actually mark different history. `git tag -v` cannot verify a lightweight tag.
- **surprise:** 5

---

## New dig 2 — a signed commit that fixes no bytes

- **find-type:** 2 (planted/dated artifact)
- **hash:** `0d5d75e04d808ed554546dc6419b072b10b9a509`; parent `1e974e6311a2fca02e942f142bd6c1af7855f21f`
- **date:** 2025-12-20T19:30:15+08:00
- **author:** John `<johnufida@163.com>`; committer GitHub `<noreply@github.com>`
- **message:** `Fix incorrect comment about LRU clock resolution in initObjectLRUOrLFU (#14582)`
- **exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/redis show -s --format='%H %aI %an | %cn | %s%nTREE %T%nPARENT %P' 0d5d75e04d808ed554546dc6419b072b10b9a509
git -C /home/diablo/book16/repos/redis show -s --format='PARENT_TREE %T' 0d5d75e04d808ed554546dc6419b072b10b9a509^
git -C /home/diablo/book16/repos/redis diff --stat 0d5d75e04d808ed554546dc6419b072b10b9a509^ 0d5d75e04d808ed554546dc6419b072b10b9a509
git -C /home/diablo/book16/repos/redis cat-file commit 0d5d75e04d808ed554546dc6419b072b10b9a509 | grep '^gpgsig ' | head -1
git -C /home/diablo/book16/repos/redis show 0d5d75e04d808ed554546dc6419b072b10b9a509^:src/object.c | sed -n '1534,1537p'
```

```text
0d5d75e04d808ed554546dc6419b072b10b9a509 2025-12-20T19:30:15+08:00 John | GitHub | Fix incorrect comment about LRU clock resolution in initObjectLRUOrLFU (#14582)
TREE 8715ba88b5ef48a636483c31c9db9956f0ec53c0
PARENT 1e974e6311a2fca02e942f142bd6c1af7855f21f
PARENT_TREE 8715ba88b5ef48a636483c31c9db9956f0ec53c0
gpgsig -----BEGIN PGP SIGNATURE-----
        /* Provided LRU idle time is in seconds. Scale
         * according to the LRU clock resolution this Redis
         * instance was compiled with (normally 1000 ms, so the
         * below statement will expand to lru_idle*1000/1000. */
```

- **Why it is a story:** The moment before the outcome looks like an ordinary comment-fix PR. The resulting commit has the same tree as its parent, so the diff is empty; the parent already says `1000 ms`. Yet Git preserves a new author, message, timestamp, GitHub committer, and an embedded signature. This establishes signature **presence**, not local cryptographic validity.
- **What the reader learns:** A commit is not proof that content changed. Compare `%T` with the parent's `%T`, or run `git diff-tree`; then inspect raw `gpgsig` separately. Signed metadata can faithfully authenticate a no-op.
- **surprise:** 4

---

## New dig 3 — “Async IO threads (#13665)” lives only on a stale remote branch

- **find-type:** 2 (dated artifact on an unmerged ref)
- **hashes:** `779af3ab92d1be35094d78542891308681876f3b`, `033abd6f5708ee97acd83929a2714a31abec8c23`
- **dates:** 2024-11-08T15:58:10+08:00; 2024-12-22T19:30:37+08:00
- **author:** Yuan Wang `<yuan.wang@redis.com>`
- **messages:** `Dynamic event loop binding for connection structure (#13642)`; `Async IO threads (#13665)`
- **exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/redis log --format='%H %aI %an %s' unstable..origin/io-thread
git -C /home/diablo/book16/repos/redis merge-base --is-ancestor 033abd6f5708ee97acd83929a2714a31abec8c23 unstable; printf 'ancestor exit=%s\n' "$?"
git -C /home/diablo/book16/repos/redis diff --shortstat $(git -C /home/diablo/book16/repos/redis merge-base unstable origin/io-thread)..origin/io-thread
```

```text
033abd6f5708ee97acd83929a2714a31abec8c23 2024-12-22T19:30:37+08:00 Yuan Wang Async IO threads (#13665)
779af3ab92d1be35094d78542891308681876f3b 2024-11-08T15:58:10+08:00 Yuan Wang Dynamic event loop binding for connection structure (#13642)
ancestor exit=1
 37 files changed, 1681 insertions(+), 635 deletions(-)
```

- **Why it is a story:** Before the outcome was known, this branch proposed independent event loops and truly asynchronous network I/O, with PR numbers in the subjects and 2,316 changed lines. The clone still advertises `origin/io-thread`, but neither commit is an ancestor of `unstable`; only that remote ref keeps this alternate Redis core alive.
- **What the reader learns:** A subject containing `(#NNNN)` does not prove mainline inclusion. Use `git log main..remote/topic` and `merge-base --is-ancestor`; `git log --all` is where abandoned architectural futures remain readable.
- **surprise:** 4

---

## New dig 4 — `redis.c` disappears in 11,621 lines, then returns as `server.c`

- **find-type:** 4 (name disappears/appears)
- **hashes:** `e2641e09cc0daf44f63f654230f72d22acf3a9af` (split); `cef054e86856463d3e79d4a5048507377c85eab7` (rename)
- **dates:** split authored 2010-06-22T00:07:48+02:00, committed 2010-07-01T14:38:51+02:00; rename authored 2015-07-26T15:14:57+02:00
- **author:** antirez `<antirez@gmail.com>`
- **messages:** `redis.c split into many different C files.`; `RDMF (Redis/Disque merge friendlyness) refactoring WIP 1.`
- **exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/redis show -s --format='%H %aI | committed %cI | %an | %s' e2641e09cc0daf44f63f654230f72d22acf3a9af
git -C /home/diablo/book16/repos/redis show --format='' --numstat e2641e09cc0daf44f63f654230f72d22acf3a9af -- redis.c src/redis.c
git -C /home/diablo/book16/repos/redis log --follow --diff-filter=R --format='%H %aI %an %s' --summary -- src/server.c
```

```text
e2641e09cc0daf44f63f654230f72d22acf3a9af 2010-06-22T00:07:48+02:00 | committed 2010-07-01T14:38:51+02:00 | antirez | redis.c split into many different C files.
0       11621   redis.c
1516    0       src/redis.c
cef054e86856463d3e79d4a5048507377c85eab7 2015-07-26T15:14:57+02:00 antirez RDMF (Redis/Disque merge friendlyness) refactoring WIP 1.

 rename src/{redis.c => server.c} (98%)
```

- **Why it is a story:** At 00:07 author time, the 11,621-line file that had *been* Redis is cut into subsystems; the accumulated work is committed nine days later. Five years on, its surviving 1,516-line core changes names again, 98% intact, because Redis and Disque need friendlier parallel layouts. The apparent deletion is two refactorings, not two losses.
- **What the reader learns:** `--numstat` exposes the scale hidden by rename summaries, while `git log --follow --diff-filter=R --summary` reconnects a famous current file to names that vanished. Keep author and committer clocks when a large refactor was accumulated before publication.
- **surprise:** 4

---

## New dig 5 — DISCARD has an author in Argentina and a gatekeeper in Italy

- **find-type:** 4 (a name appears, with authorship distinct from integration)
- **hash:** `18b6cb7643f23c3c3d8e44dc4584167fb2b32b58`
- **date:** authored 2010-02-27T23:36:19-03:00; committed 2010-03-01T23:29:48+01:00
- **author:** Damian Janowski `<damian.janowski@gmail.com>`; committer antirez `<antirez@gmail.com>`
- **message:** `Add DISCARD command to discard queued MULTI commands.`
- **exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/redis show -s --format='%H%nAuthor %an <%ae> %aI%nCommit %cn <%ce> %cI%n%s' 18b6cb7643f23c3c3d8e44dc4584167fb2b32b58
git -C /home/diablo/book16/repos/redis show --shortstat --format='' 18b6cb7643f23c3c3d8e44dc4584167fb2b32b58
```

```text
18b6cb7643f23c3c3d8e44dc4584167fb2b32b58
Author Damian Janowski <damian.janowski@gmail.com> 2010-02-27T23:36:19-03:00
Commit antirez <antirez@gmail.com> 2010-03-01T23:29:48+01:00
Add DISCARD command to discard queued MULTI commands.
 2 files changed, 27 insertions(+), 1 deletion(-)
```

- **Why it is a story:** The moment before DISCARD became part of Redis is a Saturday night patch by Damian Janowski in `-03:00`; two days later antirez records it from `+01:00`. The 27-line feature is credited to its writer while its admission to the official history is credited separately to the maintainer.
- **What the reader learns:** Default `git log` shows only the author line. `--format=fuller` (or explicit `%a*`/`%c*` fields) recovers the contributor-to-gatekeeper handoff and both clocks; do not collapse committer into author when reconstructing early contribution workflows.
- **surprise:** 3

---

Reliability: Strong discovery instincts and mostly real receipts; 11 of 15 audited claims pass.
However, four failures matter: selectively quoted output, one author/committer inversion, a 20-vs-21 count, and a release-branch/mainline splice in ranked #3.
