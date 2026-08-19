# Independent verification and extension: OpenTTD

| Dig | Claim | Exact command rerun | PASS / FAIL | Note |
|---|---|---|---|---|
| 1. Day one | `efaeb275f78e18d594d9ee8ff04eccd2dc59512c` is the first reachable commit; its 2004-08-09 author/committer, `truelight`, and subject match. | `git -C ~/book16/repos/openttd log --reverse --format='%H %aI %an <%ae> %s' \| head -5` | **PASS** | The printed command now fails with `fatal: your current branch appears to be broken`; substituting the report's explicit tip `4d4f8bff...` reproduces the claimed first five commits and all metadata. This is a command-reproducibility defect, not a bad commit receipt. |
| 1. Day one | The root import changes 189 files with 129,220 insertions. | `git -C ~/book16/repos/openttd show --stat --format=fuller efaeb275f78e18d594d9ee8ff04eccd2dc59512c \| tail -3` | **PASS** | Exact output ends `189 files changed, 129220 insertions(+)`. |
| 1. Day one | The imported README identifies OpenTTD 0.3.3 and carries a 2004-07-25 SVN keyword date. | `git -C ~/book16/repos/openttd show efaeb275f78e18d594d9ee8ff04eccd2dc59512c:readme.txt \| head -5` | **PASS** | Hash, blob, title, date, and version match exactly. |
| 1. Day one | The imported tree has “14 language files.” | `git -C ~/book16/repos/openttd ls-tree -r --name-only efaeb275f78e18d594d9ee8ff04eccd2dc59512c \| rg '^lang/.*\\.txt$' \| wc -l` | **FAIL** | It has **13**, not 14. This is a small but definite miscount. The BeOS and MorphOS claim is otherwise supported by `Jamfile.next`, `Makefile`, `bemidi.cpp`, and the changelog. |
| 1. Day one | The prior SVN “crashed” and the restart happened “on the same day.” | `git -C ~/book16/repos/openttd show -s --format=fuller efaeb275f78e18d594d9ee8ff04eccd2dc59512c` | **FAIL** | “old (crashed) SVN” and the import date are in the commit; the crash date is not. “On the same day” is unsupported narrative compression. |
| 3. `320` | The three-commit lineage is `61fe356880` (original rate), `7e22f243ed` (typo fix), `61dba850af` (revert), with the reported dates/authors/subjects. | `git -C ~/book16/repos/openttd log --reverse -S '{ 320, 420, 300' --format='%h %aI %an %s' -- src/town_cmd.cpp` | **PASS** | The exact command now fails because implicit `HEAD` is broken. With explicit tip `4d4f8bff...`, it returns exactly those three commits in that order. `show -s --format=fuller` also confirms planetmaker and Charles Pigott as the respective committers. |
| 3. `320` | `7e22f243ed` changes only the normal-growth first cell from 320 to 420. | `git -C ~/book16/repos/openttd show 7e22f243ed -- src/town_cmd.cpp` | **PASS** | Hash, author, date, subject, and one-line diff all match. |
| 3. `320` | `61dba850af` restores 320 and adds the malus explanation; its creed-like two-line message matches. | `git -C ~/book16/repos/openttd show 61dba850af -- src/town_cmd.cpp` | **PASS** | Diff and message match. Subtlety: “the original binary speaking” is an interpretation; the receipts establish “TTD's original rate” and the project's replication policy, not a direct disassembly trace. |
| 4. Trusted GRFs | The warning exists in the root blob at `grfspecial.c:1029` with the reported text. | `git -C ~/book16/repos/openttd grep -n 'We consider GRF files trusted' efaeb275f78e18d594d9ee8ff04eccd2dc59512c` | **PASS** | Exact match. |
| 4. Trusted GRFs | The warning survives at the reported tip in `src/newgrf.cpp:1252`, unchanged in substance. | `git -C ~/book16/repos/openttd grep -n 'We consider GRF files trusted' HEAD` | **PASS** | The exact `HEAD` command now fails; replacing `HEAD` with the report's tip `4d4f8bff38d200fbcfda11789bd69259ebbefd17` reproduces the line and surrounding three-line warning. Root-versus-tip blob comparison confirms the warning's words are unchanged. |
| 4. Trusted GRFs | Line history shows later mechanical edits but no deletion of the warning. | `git -C ~/book16/repos/openttd log -L 1252,1255:src/newgrf.cpp --format='%h %aI %an %s' \| head -20` | **PASS** | Again the exact command fails only because `HEAD` is broken. With explicit tip, it shows frosch's 2025 allocator change and Patric Stout's 2024 `byte`→`uint8_t`; blame also attributes the 2009 comment-style touch to `b25a4f8231` by rubidium. |
| 4. Trusted GRFs | The imported warning was “almost certainly” written by pasky / pre-crash TTDPatch work. | `git -C ~/book16/repos/openttd log --follow -S 'We consider GRF files trusted' --format='%H %aI %an %s' 4d4f8bff38d200fbcfda11789bd69259ebbefd17 -- src/newgrf.cpp` | **FAIL** | Git reaches only the import and attributes it to truelight. The nearby TTDPatch specification URL supports provenance of the format, not authorship of this comment. The report labels this as conjecture, correctly, but it cannot be verified. |

At verification time `.git/index`, `.git/packed-refs`, `refs/heads/master`, and `refs/remotes/origin/HEAD` were zero-byte files, while `HEAD` pointed to `refs/heads/master`. I did not repair or modify the repository. All objects cited below are readable, so I use the first report's claimed tip explicitly and make every new command independent of refs.

Unused-angle checks also found: all 33,080 commits reachable from that tip report `%G? = N` (no commit signatures); the tip has no `.mailmap`; the pack exposes no annotated-tag objects; and the broken refs make lightweight tags, notes, and stale-branch tips impossible to audit faithfully from this clone. Those are constraints or negative findings, not promoted into stories.

## New dig 1: The fix lands twice; the second commit contains nothing

- **Find-type:** 2 (planted / duplicated artifact)
- **Hashes:** real fix `520595ff87bc55042010a370ef1070f296ff07c0`; empty duplicate `67063ceeb3832a7e0f608859ccbd5e79214e9853`
- **Date:** 2021-05-01T18:14:50+01:00, then 2021-05-01T18:15:22+01:00 — 32 seconds apart
- **Author:** Matt Kimber `<mattkimber@users.noreply.github.com>`; both committed by GitHub `<noreply@github.com>`
- **Message:** both say `Fix 3d7ab09: stopped trains not updating viewport hash when reversed for a second time (#9165)`
- **Exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/openttd log -2 --format='%H %T %P %aI %an %s' 67063ceeb3832a7e0f608859ccbd5e79214e9853
git -C /home/diablo/book16/repos/openttd show --stat --oneline 67063ceeb3832a7e0f608859ccbd5e79214e9853 520595ff87bc55042010a370ef1070f296ff07c0 | tail -4
```

```text
67063ceeb3832a7e0f608859ccbd5e79214e9853 afbb301ef256e502a9622c3669476e9e4c49f58e 520595ff87bc55042010a370ef1070f296ff07c0 2021-05-01T18:15:22+01:00 Matt Kimber Fix 3d7ab09: stopped trains not updating viewport hash when reversed for a second time (#9165)
520595ff87bc55042010a370ef1070f296ff07c0 afbb301ef256e502a9622c3669476e9e4c49f58e 05394d5216f89c9a7e14487b571515e510828657 2021-05-01T18:14:50+01:00 Matt Kimber Fix 3d7ab09: stopped trains not updating viewport hash when reversed for a second time (#9165)
67063ceeb3 Fix 3d7ab09: stopped trains not updating viewport hash when reversed for a second time (#9165)
520595ff87 Fix 3d7ab09: stopped trains not updating viewport hash when reversed for a second time (#9165)
 src/vehicle.cpp | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)
```

- **Why it is a story:** At 18:14:50 Matt Kimber's 12-line vehicle fix becomes a tree. Thirty-two seconds later history records the same author and message again, but the second commit points to exactly the same tree as its parent. The repository has 46 empty-tree commits; the other old ones mostly preserve SVN property changes that Git cannot represent. This lone 2021 duplicate is a modern echo: a decision is recorded twice, while the code changes once.
- **What the reader learns:** A commit is not proof that a diff happened. Compare `%T` with the parent's `%T`, especially after imports, automation, or forge operations. Empty commits may preserve workflow evidence even when `git show` has nothing to show.
- **Surprise:** 4/5

## New dig 2: README becomes Markdown; only the commit message says `REAMDE`

- **Find-type:** 4 (a name disappears / appears)
- **Hash:** `413ece9b51807b789049f959fcb59cd3363032ba`
- **Date:** 2018-04-15T17:11:40+02:00
- **Author:** Heiko August `<post@auge8472.de>`; committed by Patric Stout `<truebrain@openttd.org>`
- **Message:** `Doc #6698: rename the readme.txt to REAMDE.md`
- **Exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/openttd log 4d4f8bff38d200fbcfda11789bd69259ebbefd17 --follow --diff-filter=R --format='%H%n%aI %an <%ae>%n%s' --summary -- README.md
```

```text
413ece9b51807b789049f959fcb59cd3363032ba
2018-04-15T17:11:40+02:00 Heiko August <post@auge8472.de>
Doc #6698: rename the readme.txt to REAMDE.md

 rename readme.txt => README.md (100%)
```

- **Why it is a story:** A week into the GitHub-style era, Heiko August gives the oldest public-facing file a forge-friendly `.md` name. The operation is perfect — a 100% rename, zero content churn — and the destination is spelled correctly in the tree. The typo survives only in the immutable message. Before the outcome was known, reviewer and committer had one job that mattered: preserve the file; they did. The archaeological joke is harmless because Git trusts the tree, not the prose.
- **What the reader learns:** Use `--follow --diff-filter=R --summary` on famous files. Commit subjects are annotations, not ground truth; rename metadata can vindicate a change that its own message misspells.
- **Surprise:** 3/5

## New dig 3: 33,080 commits, zero merge commits — even commits named “Merge”

- **Find-type:** 2 (imported / flattened history artifact)
- **Anchor hash:** `b69c0acca2f7084641eef4fb0b01ba4923f967f9`
- **Date:** 2017-12-24T12:18:36+00:00
- **Author:** frosch `<frosch@openttd.org>`
- **Message:** `(svn r27950) -Merge: Documentation updates from 1.7 branch`
- **Exact reproducible command:**

```sh
git -C /home/diablo/book16/repos/openttd rev-list --count 4d4f8bff38d200fbcfda11789bd69259ebbefd17
git -C /home/diablo/book16/repos/openttd rev-list --count --min-parents=2 4d4f8bff38d200fbcfda11789bd69259ebbefd17
git -C /home/diablo/book16/repos/openttd show -s --format='%H%nparents: %P%n%aI %an <%ae>%n%s' b69c0acca2f7084641eef4fb0b01ba4923f967f9
```

```text
33080
0
b69c0acca2f7084641eef4fb0b01ba4923f967f9
parents: 43be9c80b1cc9b55e006b5da643b5a1117672c8f
2017-12-24T12:18:36+00:00 frosch <frosch@openttd.org>
(svn r27950) -Merge: Documentation updates from 1.7 branch
```

- **Why it is a story:** On Christmas Eve 2017, frosch merges documentation from the 1.7 branch. The subject remembers the branch operation; the converted Git graph gives the commit one parent. This is not an isolated oddity: the entire reachable history is a single-parent chain, including the later pull-request era. Whatever branching and review happened, this public graph preserves outcomes rather than branch ancestry.
- **What the reader learns:** Search both the prose and the topology. `--grep=Merge` tells you what people believed they were doing; `--min-parents=2` tells you what the imported DAG retained. A migration can turn collaboration into a straight line without falsifying any individual patch.
- **Surprise:** 4/5

## New dig 4: The largest text diff is the translator bot absorbing one developer's reorder

- **Find-type:** 2 (generated / dated artifact)
- **Hash:** `7fcebf09971a00010237cd3dccc54572449356b8`
- **Date:** 2009-08-05T18:56:43+00:00
- **Author:** translators `<translators@openttd.org>` (author and committer)
- **Message:** `(svn r17076) -Update: reflect the changes Rubidium made in the last few days to all languages`
- **Exact reproducible command:** the seven workers each find the maximum text-line churn in a disjoint 5,000-commit slice; sorting those maxima proves the global maximum while keeping memory bounded. Columns are churn, insertions, deletions, marker, hash, date, author, subject.

```sh
{
for s in 0 5000 10000 15000 20000 25000 30000; do
  git -C /home/diablo/book16/repos/openttd log 4d4f8bff38d200fbcfda11789bd69259ebbefd17 --skip="$s" -n 5000 --format='C%x09%H%x09%aI%x09%an%x09%s' --shortstat |
  awk -F '\t' 'BEGIN {max=-1} /^C\t/ {meta=$0; next} /files? changed/ {line=$0; gsub(/^[ ]+/,"",line); split(line,a,", "); ins=del=0; for(i in a){if(a[i]~/insertion/){split(a[i],b," ");ins=b[1]} if(a[i]~/deletion/){split(a[i],b," ");del=b[1]}} if(ins+del>max){max=ins+del;best=(ins+del) "\t" ins "\t" del "\t" meta}} END {print best}' &
done
wait
} | sort -nr
```

```text
179542  95769  83773  C  7fcebf09971a00010237cd3dccc54572449356b8  2009-08-05T18:56:43+00:00  translators  (svn r17076) -Update: reflect the changes Rubidium made in the last few days to all languages
129220  129220  0      C  efaeb275f78e18d594d9ee8ff04eccd2dc59512c  2004-08-09T17:04:08+00:00  truelight    (svn r1) Import of revision 975 of old (crashed) SVN
43410   21705   21705  C  deb7ff245a3a0129297322afea5d5d92fb2a4a89  2006-11-16T22:19:12+00:00  peter1138    (svn r7183) -Feature (cont): Convert all language from ISO8859-15 to UTF-8
34649   27057   7592   C  7107e63f8c6ca35c3d1b39d6cd09198a85ed6ba8  2021-09-09T18:49:31+00:00  translators  Update: Translations from eints korean: 6 changes by telk5093 hungarian: 34 changes by pnpBrumi indonesian: 16 changes by dimaspaf14 latvian: 94 changes by lexuslatvia polish: 2 changes by pAter-exe
33500   16749   16751  C  b8866be0939c6b51372f92027d32555ab95b97eb  2011-11-19T22:15:44+00:00  rubidium     (svn r23269) -Codechange: rename some control/string codes/IDs to be more consistent
17985   9495    8490   C  828e808444ff38689d455d43920ad4f70e879bdf  2025-03-21T19:55:33+00:00  Peter Nelson Codechange: Split NewGRF loader into separate Action handlers.
7376    99      7277   C  3ca0937c1cc5c229eb07d4e07de2979c0e024e47  2010-01-10T13:12:34+00:00  rubidium     (svn r18769) -Codechange: replace MiniLZO with the real library.
```

- **Why it is a story:** At 17:59 that day, Rubidium commits `1fe3ad3288`, renaming roughly 750 strings after a day of reordering the English source. Fifty-seven minutes later the `translators` identity re-renders 40 language catalogs: 95,769 lines enter and 83,773 leave. It exceeds even the 129,220-line root import. A human tries to make identifiers orderly; automation makes that local cleanup the largest textual event in the repository.
- **What the reader learns:** Rank commits by generated line churn, then inspect the immediately preceding commits. The biggest diff may be a downstream cache or catalog rebuild; review the small upstream decision and the generated blast together. (`--shortstat` counts textual insertions/deletions, not bytes in binary files.)
- **Surprise:** 4/5

The first report is highly reliable on its ranked receipts and storytelling: all three core digs, hashes, metadata, and diffs check out.
Its reliability is **good, not perfect**: 9 checked claims pass and 3 fail (one 13-vs-14 miscount and two clearly inferential statements); several printed commands are currently unreproducible only because this clone's refs were zeroed after that report was written.
