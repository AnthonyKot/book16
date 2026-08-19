## Verification table

| Dig | Claim | Command rerun | Result | Note |
|---|---|---|---|---|
| #2 | The first three commits are `ef4c5eb`, `64e7548`, `ec83d01`, with the reported author/committer timestamps and subjects. | `git -C /home/diablo/book16/repos/the-algorithm log --format='%h %aI %cI %s' --reverse \| head -3` | **PASS** | Output matches exactly. The scrub's author time is 2023-03-31T13:39:57-07:00; its commit time is 2023-03-31T17:39:34-05:00. |
| #2 | `ec83d01dcaebf369444d75ed04b3625a0a645eb9` is by `twitter-team <>`, has the reported message, and changes five files with 3 insertions and 66 deletions. | `git -C /home/diablo/book16/repos/the-algorithm show --stat --format=fuller ec83d01dcaebf369444d75ed04b3625a0a645eb9` | **PASS** | Hash, author, committer, dates, subject, paths, and shortstat all match. |
| #2 | `author_is_elon` exists at genesis and is removed by `ec83d01`. | `git -C /home/diablo/book16/repos/the-algorithm log -S 'author_is_elon' --all --oneline` | **PASS** | Exactly the two reported commits are returned, newest first. |
| #2 | The genesis blob contains the four named predicates and the hydrator's metrics/A-B-test explanation. | `git -C /home/diablo/book16/repos/the-algorithm show ef4c5eb:home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/decorator/HomeTweetTypePredicates.scala`; `git -C /home/diablo/book16/repos/the-algorithm show ef4c5eb:home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/feature_hydrator/RequestQueryFeatureHydrator.scala` | **PASS** | The exact strings `author_is_elon`, `author_is_power_user`, `author_is_democrat`, and `author_is_republican` are present. The quoted three-line explanation matches. |
| #2 | The earlier author date proves the deletion was an “already-written” or “staged apology” that the team knowingly failed to squash. | `git -C /home/diablo/book16/repos/the-algorithm show --no-patch --format=fuller ec83d01dcaebf369444d75ed04b3625a0a645eb9` | **FAIL** | Git proves only that the recorded author timestamp is 1:56:34 before genesis and the commit timestamp is 3:03 after it. Author dates are copyable/settable metadata; they do not prove when prose was typed, intent, or why two commits were published separately. The chronology is real; the psychological conclusion is inference. |
| #10 | `72eda9a` is followed by `c54bec0`, separated by 783 days. | `git -C /home/diablo/book16/repos/the-algorithm log --format='%h %aI %cI %s' 72eda9a^..c54bec0`; `old=$(git -C /home/diablo/book16/repos/the-algorithm show -s --format=%ct 72eda9a); new=$(git -C /home/diablo/book16/repos/the-algorithm show -s --format=%ct c54bec0); awk -v old="$old" -v new="$new" 'BEGIN {print (new-old)/86400}'` | **PASS** | The exact commit-time gap is 783.405428 days (67,686,229 seconds). “783 days” is a fair truncation. |
| #10 | `c54bec0d4e029fe34926ef3258a86ccacc0d0182` has the reported identity, dates, subject, and 988-file / +65,319 / -3,195 stat. | `git -C /home/diablo/book16/repos/the-algorithm show --shortstat --format=fuller c54bec0` | **PASS** | Output matches exactly. |
| #10 | `grok_politics_left` first appears in `c54bec0`. | `git -C /home/diablo/book16/repos/the-algorithm log -S 'grok_politics_left' --all --oneline` | **PASS** | The command returns only `c54bec0 update for-you recommendations code`. |
| #10 | The HEAD grep output is at lines 398-399. | `git -C /home/diablo/book16/repos/the-algorithm grep -n -A1 'grok_politics_left' HEAD -- home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/decorator/builder/HomeTweetTypePredicates.scala` | **FAIL** | The content matches, but the immutable blob reports lines **394-395**, not 398-399. This is a transcription/line-number error, not a semantic one. |
| #10 | The 2025 disclaimer repeats the 2023 defense “word for word.” | `git -C /home/diablo/book16/repos/the-algorithm grep -n -i 'purely for metrics' ef4c5eb -- home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/feature_hydrator/RequestQueryFeatureHydrator.scala`; `git -C /home/diablo/book16/repos/the-algorithm grep -n -i 'purely for metrics' c54bec0 -- home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/decorator/builder/HomeTweetTypePredicates.scala` | **FAIL** | The ideas rhyme, but the text does not. 2023 says “used purely for metrics collection”; 2025 says “Purely for metrics tracking. Does not affect the recommendations.” |
| #1 | Genesis has the reported full hash, date, empty-email team identity, subject, and force-push body. | `git -C /home/diablo/book16/repos/the-algorithm log --reverse --format='%H%n  %aI %cI%n  %an <%ae>%n  %s%n  %b'` | **PASS** | All reported fields match. The command prints the entire log; the report accurately excerpts its first record. |
| #1 | Genesis changes 5,364 files with 460,239 insertions and has an empty author email. | `git -C /home/diablo/book16/repos/the-algorithm show --shortstat --format='author=[%an] email=[%ae]' ef4c5eb65e6e04fac4f0e1fa8bbeff56b75c1f98` | **PASS** | Exact match. |
| #1 | `ef4c5eb65e6e04fac4f0e1fa8bbeff56b75c1f98` is the sole root reachable from all refs. | `git -C /home/diablo/book16/repos/the-algorithm rev-list --max-parents=0 --all` | **PASS** | Exactly one hash is returned, and it matches. |
| #1 | The replacement genesis is specifically a “squash.” | `git -C /home/diablo/book16/repos/the-algorithm rev-list --max-parents=0 --all`; `git -C /home/diablo/book16/repos/the-algorithm show -s --format='%B' ef4c5eb65e6e04fac4f0e1fa8bbeff56b75c1f98` | **FAIL** | The object is parentless and its message admits a force-pushed new initial commit. Neither fact establishes that it was created with a squash operation. “Root snapshot” is supported; “squash” is plausible but unproved. |
| #3 | The genesis file opens with the reported warning against logging sensitive internal author labels. | `git -C /home/diablo/book16/repos/the-algorithm grep -n -A2 'IMPORTANT: Please avoid' ef4c5eb -- home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/decorator/HomeTweetTypePredicates.scala` | **PASS** | Text and old line numbers 12-14 match exactly. |
| #3 | `git log -L` follows the file into its new `builder/` location and shows `c54bec0` replacing the warning with a metrics-tracking description. | `git -C /home/diablo/book16/repos/the-algorithm log -L 15,18:home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/decorator/builder/HomeTweetTypePredicates.scala --oneline` | **PASS** | Both `c54bec0` and `ef4c5eb` appear with the reported diff. The added first line has an inconsequential trailing space omitted from the report. |
| Repo summary | HEAD and `--all` each contain 31 commits; only `main`/its remote aliases exist; there are no tags. | `git -C /home/diablo/book16/repos/the-algorithm rev-list HEAD --count`; `git -C /home/diablo/book16/repos/the-algorithm rev-list --all --count`; `git -C /home/diablo/book16/repos/the-algorithm for-each-ref --format='%(refname) %(objectname)'`; `git -C /home/diablo/book16/repos/the-algorithm tag -n99` | **PASS** | Counts are 31 and 31. The only refs are local `main`, `origin/main`, and `origin/HEAD`, all at `c54bec0`; tag output is empty. |

## New dig 1 — GitHub signed the four commits where the mask came off

- **Find-type:** 4 (a name appears/disappears)
- **Hashes:** `9115361f008b7b038d67c959c7879356244afb28`, `9f0afc0ec47222c5093daa60048901a977fac00a`, `e8147d8e5fb1609001e9e749296dc44d7f3675d4`, `36588c650e94f901d040a0e3a7b7b1b2cdab0492`
- **Dates:** 2023-03-31T17:52:31-07:00 through 2023-04-04T11:06:35-07:00; for all four, author and committer timestamps are equal.
- **Authors:** Auro for `9115361`; dzhao for the other three. **Committer:** `GitHub <noreply@github.com>` for all four.
- **Messages:** `(docs): Improve README file for Navi`; `Merge pull request #550 from MrAuro/improve-navi-docs`; `Update README.md`; `Merge pull request #452 from pouriya/refactor-dr_transform`.
- **Exact command:**

```sh
for h in $(git -C /home/diablo/book16/repos/the-algorithm rev-list --all); do
  if git -C /home/diablo/book16/repos/the-algorithm cat-file commit "$h" | grep -q '^gpgsig '; then
    git -C /home/diablo/book16/repos/the-algorithm show -s --format='%H | %aI | author=%an <%ae> | committer=%cn <%ce> | %s' "$h"
  fi
done
```

```text
36588c650e94f901d040a0e3a7b7b1b2cdab0492 | 2023-04-04T11:06:35-07:00 | author=dzhao <di.zhao@gmail.com> | committer=GitHub <noreply@github.com> | Merge pull request #452 from pouriya/refactor-dr_transform
e8147d8e5fb1609001e9e749296dc44d7f3675d4 | 2023-04-04T09:32:40-07:00 | author=dzhao <di.zhao@gmail.com> | committer=GitHub <noreply@github.com> | Update README.md
9f0afc0ec47222c5093daa60048901a977fac00a | 2023-04-04T09:30:11-07:00 | author=dzhao <di.zhao@gmail.com> | committer=GitHub <noreply@github.com> | Merge pull request #550 from MrAuro/improve-navi-docs
9115361f008b7b038d67c959c7879356244afb28 | 2023-03-31T17:52:31-07:00 | author=Auro <35087590+MrAuro@users.noreply.github.com> | committer=GitHub <noreply@github.com> | (docs): Improve README file for Navi
```

- **Why it is a story:** Before this repository settled into unsigned `twitter-team <>` snapshot drops, four objects passed through GitHub's normal authorship/committer path and acquired embedded PGP signatures. The signatures are presence evidence only—I did not claim cryptographic validity—but the split identity is inside the commit object: a human authored; GitHub committed and signed. After April 4, that provenance stratum disappears. The moment before the outcome is a maintainer pressing Merge, while the repository still behaved like a repository rather than a publication chute.
- **What the reader learns:** Inspect raw commit headers, not just `%an`. `author`, `committer`, and `gpgsig` can expose two workflows hiding behind one shortlog: reviewed host-native changes versus imported snapshots. A shell scan of `git cat-file commit` is also safer than assuming “unsigned” from an unavailable keyring.
- **Surprise:** 3/5

## New dig 2 — A service's deletion was authored 43 minutes after its public debut

- **Find-type:** 8 (rollback of the world)
- **Hashes:** introduction `617c8c787d75f1eb112eaea8b295e174edfca3c0`; deletion `23fa75d4068edb15a90c93369943987c631ae98c`
- **Dates:** introduction authored 2023-04-10T09:34:13-07:00, committed 2023-04-14T16:45:37-05:00; deletion authored 2023-04-14T15:28:51-07:00, committed 2023-04-28T10:29:20-05:00.
- **Author:** `twitter-team <>` for both.
- **Messages:** `Open-sourcing Unified User Actions`; `[Medium][UUA] Clean up BCE in UUA` — body: `This is to clean up the BCE adapters and services in UUA since BCE no longer exists.`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/the-algorithm log --follow --format='%H | %aI | %cI | %an <%ae> | %s' --shortstat -- unified_user_actions/adapter/src/main/scala/com/twitter/unified_user_actions/adapter/behavioral_client_event/BaseBCEAdapter.scala
git -C /home/diablo/book16/repos/the-algorithm show --shortstat --format='%H | %s' 23fa75d4068edb15a90c93369943987c631ae98c
```

```text
23fa75d4068edb15a90c93369943987c631ae98c | 2023-04-14T15:28:51-07:00 | 2023-04-28T10:29:20-05:00 | twitter-team <> | [Medium][UUA] Clean up BCE in UUA
 1 file changed, 96 deletions(-)
617c8c787d75f1eb112eaea8b295e174edfca3c0 | 2023-04-10T09:34:13-07:00 | 2023-04-14T16:45:37-05:00 | twitter-team <> | Open-sourcing Unified User Actions
 1 file changed, 96 insertions(+)
23fa75d4068edb15a90c93369943987c631ae98c | [Medium][UUA] Clean up BCE in UUA
 9 files changed, 569 deletions(-)
```

- **Why it is a story:** On April 14 the public received `BaseBCEAdapter.scala` fully formed. Forty-three minutes and fourteen seconds after that public commit's timestamp, the removal commit was authored because “BCE no longer exists.” The removal then waited until April 28 to be published, erasing nine files and every one of their 569 lines. The moment before the outcome lasted less than an hour in the metadata: readers were being handed a subsystem just as its obituary was being prepared.
- **What the reader learns:** `--follow` can turn a large deletion stat into a two-event biography. Compare author time on the deletion with commit time on the introduction; snapshot repositories can publish code whose internal retirement is already under way.
- **Surprise:** 4/5

## New dig 3 — The largest post-genesis insertion is a core service arriving full-grown

- **Find-type:** 2 (planted/dated artifact) and 3 (first commit of a component)
- **Hash:** `01dbfee4c05b1aa5cf7c6abf8978cd7f9ab76927`
- **Date:** authored 2023-05-12T09:11:38-07:00; committed 2023-05-19T16:20:06-05:00.
- **Author:** `twitter-team <>`
- **Message:** `Open-sourcing Tweetypie` — body: `Tweetypie is the core Tweet service that handles the reading and writing of Tweet data.`
- **Exact command:**

```sh
for h in $(git -C /home/diablo/book16/repos/the-algorithm rev-list --all); do
  set -- $(git -C /home/diablo/book16/repos/the-algorithm show --numstat --format= "$h" | awk '$1 ~ /^[0-9]+$/ {a+=$1; d+=$2} END {print a+0, d+0}')
  git -C /home/diablo/book16/repos/the-algorithm show -s --format="%H $1 $2 | %aI | %cI | %an <%ae> | %s" "$h"
done | sort -k2,2nr | head -5
```

```text
ef4c5eb65e6e04fac4f0e1fa8bbeff56b75c1f98 460239 0 | 2023-03-31T17:36:31-05:00 | 2023-03-31T17:36:31-05:00 | twitter-team <> | Twitter Recommendation Algorithm
01dbfee4c05b1aa5cf7c6abf8978cd7f9ab76927 68352 0 | 2023-05-12T09:11:38-07:00 | 2023-05-19T16:20:06-05:00 | twitter-team <> | Open-sourcing Tweetypie
c54bec0d4e029fe34926ef3258a86ccacc0d0182 65319 3195 | 2025-09-03T15:46:53-05:00 | 2025-09-03T15:46:53-05:00 | twitter-team <> | update for-you recommendations code
b389c3d30201f466cc51a4fa397cc5e81c24fe50 42796 0 | 2023-05-19T09:53:56-07:00 | 2023-05-19T16:27:07-05:00 | twitter-team <> | Open-sourcing pushservice
617c8c787d75f1eb112eaea8b295e174edfca3c0 25277 0 | 2023-04-10T09:34:13-07:00 | 2023-04-14T16:45:37-05:00 | twitter-team <> | Open-sourcing Unified User Actions
```

- **Why it is a story:** Excluding the manufactured root, the largest insertion event is not the much-discussed 2025 update. It is Tweetypie: 591 files and 68,352 lines, presented as one parentless-in-spirit addition a week after its author timestamp. The commit calls it the core service for reading and writing Tweets, yet public git records no childhood, refactor, or incident—only the Friday when an already mature system was placed onstage. Before that outcome, the public repository simply had no core Tweet service; one commit later, it had 68,000 lines and no provenance for them.
- **What the reader learns:** Rank commits by numeric diff totals, then remove the literal root from consideration. The next giant all-insertion commit often marks an import boundary, and its author/committer date gap tells you how long the bundle sat between preparation and publication.
- **Surprise:** 3/5

## New dig 4 — A correct rename broke the front door until issue #1655

- **Find-type:** 1 (tiny diff, visible blast radius) and 4 (a path disappears/appears)
- **Hashes:** rename `9115361f008b7b038d67c959c7879356244afb28`; merge `9f0afc0ec47222c5093daa60048901a977fac00a`; repair `3496189edbd0a4fa7e5f9f0a67a5422516365e8e`
- **Dates:** rename 2023-03-31T17:52:31-07:00; merge 2023-04-04T09:30:11-07:00; repair authored 2023-04-04T15:13:45-07:00 and committed 2023-04-04T20:38:43-05:00.
- **Authors:** Auro; dzhao; `twitter-team <>`, respectively.
- **Messages:** `(docs): Improve README file for Navi`; `Merge pull request #550 from MrAuro/improve-navi-docs`; `[docs] Fix broken navi link in README` (body: `Closes twitter/the-algorithm#1655`).
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/the-algorithm show --summary --find-renames --format='%H | %aI | %an <%ae> | %s' 9115361f008b7b038d67c959c7879356244afb28 -- navi
git -C /home/diablo/book16/repos/the-algorithm show -s --format='%H | %aI | %an <%ae> | %s' 9f0afc0ec47222c5093daa60048901a977fac00a
git -C /home/diablo/book16/repos/the-algorithm show --format='%H | %aI | %an <%ae> | %s%n%b' 3496189edbd0a4fa7e5f9f0a67a5422516365e8e -- README.md | grep -E '^(349|Closes|[-+]\| Software framework)'
```

```text
9115361f008b7b038d67c959c7879356244afb28 | 2023-03-31T17:52:31-07:00 | Auro <35087590+MrAuro@users.noreply.github.com> | (docs): Improve README file for Navi
 rename navi/{navi => }/README.md (70%)
9f0afc0ec47222c5093daa60048901a977fac00a | 2023-04-04T09:30:11-07:00 | dzhao <di.zhao@gmail.com> | Merge pull request #550 from MrAuro/improve-navi-docs
3496189edbd0a4fa7e5f9f0a67a5422516365e8e | 2023-04-04T15:13:45-07:00 | twitter-team <> | [docs] Fix broken navi link in README
Closes twitter/the-algorithm#1655
-| Software framework | [navi](navi/navi/README.md) | High performance, machine learning model serving written in Rust. |
+| Software framework | [navi](navi/README.md) | High performance, machine learning model serving written in Rust. |
```

- **Why it is a story:** Auro sensibly moved Navi's README out of `navi/navi/`, and Twitter merged the PR. The root README still pointed at the path that had just disappeared, so the public project's main component table now led to a 404. An issue and a one-line team repair followed that afternoon. Immediately before the fix, the contribution was correct locally and broken globally: the classic rename that updates the file but not its inbound links.
- **What the reader learns:** Use rename detection or `--follow`, then search the parent tree for the old path. A 70%-similarity rename can preserve a file's biography while still breaking every external reference to its former name.
- **Surprise:** 2/5

## Verdict

The first report is highly reliable on receipts: the ranked hashes, identities, dates, messages, and substantive diffs reproduce.
Its narrative is less exact than its archaeology: four claims overstate what timestamps prove, misquote equivalence, assert an unproved squash, or copy the wrong immutable line number.
