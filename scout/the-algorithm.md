# Scout: the-algorithm (twitter/the-algorithm)

- **Repo:** https://github.com/twitter/the-algorithm
- **Clone:** `~/book16/repos/the-algorithm` (already present; not re-cloned). Working tree 63M; `.git` 11M.
- **History span (HEAD, commit order):** 2023-03-31T17:36:31-05:00 → 2025-09-03T15:46:53-05:00
- **Commits:** 31 on `HEAD` / `main` (same `--all`; one branch, no tags).
- **Authors:** `twitter-team` 25 (empty email `<>`), `dzhao` 3, Pouriya Jahanbakhsh 2, Auro 1.
- **Shape:** not a living repo. Day one is a 5,364-file / 460,239-line orphan squash. Almost every later commit is another curated dump from an internal tree. Community names exist for four days, then never again. A 783-day silence is broken by one 988-file "update for-you recommendations code" that retitles the README from Twitter to X.

This is the rare public git whose interesting history is *what they deleted after you could see it*, and what they quietly put back two years later.

---

## 1. Day one is a force-pushed squash that admits the first sanitization

- **Find-type:** 2 (planted / faked artifact) and 3 (first commit)
- **Hash:** `ef4c5eb65e6e04fac4f0e1fa8bbeff56b75c1f98`
- **Date:** 2023-03-31T17:36:31-05:00 (author = committer)
- **Author:** `twitter-team <>` (empty email)
- **Message:** `Twitter Recommendation Algorithm` — body: `Please note we have force-pushed a new initial commit in order to remove some publicly-available Twitter user information. Note that this process may be required in the future.`
- **Command:**

```
git -C ~/book16/repos/the-algorithm log --reverse --format='%H%n  %aI %cI%n  %an <%ae>%n  %s%n  %b'
git -C ~/book16/repos/the-algorithm show --shortstat --format='author=[%an] email=[%ae]' ef4c5eb65e6e04fac4f0e1fa8bbeff56b75c1f98
git -C ~/book16/repos/the-algorithm rev-list --max-parents=0 --all
```

```
ef4c5eb65e6e04fac4f0e1fa8bbeff56b75c1f98
  2023-03-31T17:36:31-05:00 2023-03-31T17:36:31-05:00
  twitter-team <>
  Twitter Recommendation Algorithm
  Please note we have force-pushed a new initial commit in order to remove some publicly-available Twitter user information. Note that this process may be required in the future.
author=[twitter-team] email=[]
 5364 files changed, 460239 insertions(+)
ef4c5eb65e6e04fac4f0e1fa8bbeff56b75c1f98
```

- **Why it is a story:** Elon Musk announced the open-sourcing on 2023-03-31. What landed is not the internal history of the ranking stack. It is one orphan commit, authored by a nameless team account with no email, that already confesses it is the *second* first commit. Someone decided a list of real user IDs could not survive contact with the public, rewrote genesis, and left the confession in the commit message — plus a promise they might do it again. The reader never sees the first first commit. The public git begins after the regret.
- **What the reader learns:** An open-source dump of a proprietary system is a press artifact. `git log --reverse` on such a repo shows what they were willing to show, not how the code grew. Empty `Author: name <>` plus a force-push note is the tell.
- **Surprise:** 3

---

## 2. The three-minute scrub, authored two hours before the dump

- **Find-type:** 1 (tiny diff, huge blast radius) and 8 (rollback of the world)
- **Hashes:** dump `ef4c5eb65e6e04fac4f0e1fa8bbeff56b75c1f98`; scrub `ec83d01dcaebf369444d75ed04b3625a0a645eb9`
- **Dates:** dump committed 2023-03-31T17:36:31-05:00; scrub *authored* 2023-03-31T13:39:57-07:00 (15:39 CDT — ~2 hours *before* the dump) and *committed* 2023-03-31T17:39:34-05:00 (three minutes after).
- **Author:** `twitter-team <>`
- **Message:** `Remove stats collection code measuring how often Tweets from specific user groups are served`
- **Command:**

```
git -C ~/book16/repos/the-algorithm log --format='%h %aI %cI %s' --reverse | head -3
git -C ~/book16/repos/the-algorithm show --stat --format=fuller ec83d01dcaebf369444d75ed04b3625a0a645eb9
git -C ~/book16/repos/the-algorithm log -S 'author_is_elon' --all --oneline
```

```
ef4c5eb 2023-03-31T17:36:31-05:00 2023-03-31T17:36:31-05:00 Twitter Recommendation Algorithm
64e7548 2023-03-31T13:15:49-07:00 2023-03-31T17:39:21-05:00 Fix simclusters README
ec83d01 2023-03-31T13:39:57-07:00 2023-03-31T17:39:34-05:00 Remove stats collection code measuring how often Tweets from specific user groups are served

AuthorDate: Fri Mar 31 13:39:57 2023 -0700
CommitDate: Fri Mar 31 17:39:34 2023 -0500
 5 files changed, 3 insertions(+), 66 deletions(-)
ec83d01 Remove stats collection code measuring how often Tweets from specific user groups are served
ef4c5eb Twitter Recommendation Algorithm
```

The deleted predicates, from `git show ef4c5eb:home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/decorator/HomeTweetTypePredicates.scala` around the old lines 224–246:

```
      "author_is_elon",
      ... DDGStatsElonFeature ...
      "author_is_power_user",
      ... DDGStatsVitsFeature ...
      "author_is_democrat",
      ... DDGStatsDemocratsFeature ...
      "author_is_republican",
      ... DDGStatsRepublicansFeature ...
```

The hydrator they also deleted explained itself (`RequestQueryFeatureHydrator.scala`):

```
       * These author ID lists are used purely for metrics collection. We track how often we are
       * serving Tweets from these authors and how often their tweets are being impressed by users.
       * This helps us validate in our A/B experimentation platform that we do not ship changes
       * that negatively impacts one group over others.
```

- **Why it is a story:** Someone internally wrote the removal at 13:39 Pacific — two hours before the public dump was committed. They published anyway, with `author_is_elon` / `author_is_democrat` / `author_is_republican` / `author_is_power_user` live in the tree. Three minutes later the same empty-email account pushed the already-written 66-line deletion. The public read the predicates as proof of political and owner-specific tracking; the comment said "purely for metrics." Both things can be true. What git records is the sequence: they knew, they shipped, they scrubbed. That sequence *is* the company's regret.
- **What the reader learns:** Author date vs commit date is the leak. A cleanup authored before the announcement and committed three minutes after is not a response to the internet — it is a response they had already typed and then failed to squash. `git log --format='%aI %cI'` is how you catch a staged apology.
- **Surprise:** 4 (the folklore is the deletion; the receipt is that they authored it first)

---

## 3. The comment that forbade exactly the lines they shipped

- **Find-type:** 5 (comment that outlived its code) and 7 (feature that became the vulnerability)
- **Hashes:** comment arrives in `ef4c5eb`; Elon/party lines deleted in `ec83d01`; warning itself rewritten in `c54bec0d4e029fe34926ef3258a86ccacc0d0182` (2025-09-03)
- **Date:** 2023-03-31, then 2025-09-03
- **Author:** `twitter-team <>`
- **Command:**

```
git -C ~/book16/repos/the-algorithm grep -n -A2 'IMPORTANT: Please avoid' ef4c5eb -- \
  home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/decorator/HomeTweetTypePredicates.scala
git -C ~/book16/repos/the-algorithm log -L 15,18:home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/decorator/builder/HomeTweetTypePredicates.scala --oneline
```

```
ef4c5eb:.../HomeTweetTypePredicates.scala:12:   * IMPORTANT: Please avoid logging tweet types that are tied to sensitive
ef4c5eb:.../HomeTweetTypePredicates.scala-13-   * internal author information / labels (e.g. blink labels, abuse labels, or geo-location).
ef4c5eb:.../HomeTweetTypePredicates.scala-14-   */

c54bec0 update for-you recommendations code
-   * IMPORTANT: Please avoid logging tweet types that are tied to sensitive
-   * internal author information / labels (e.g. blink labels, abuse labels, or geo-location).
+   * The predicates defined in this file are used purely for metrics tracking purposes to
+   * measure how often we serve posts with various attributes.
ef4c5eb Twitter Recommendation Algorithm
```

- **Why it is a story:** The file that named Elon, Democrats, Republicans, and "power users" opened with a bolded warning not to log sensitive author labels. The warning survived the three-minute scrub. Two years later, when they finally rewrote the comment, they did not strengthen it. They replaced the prohibition with the same "purely for metrics" sentence that had failed to save them in 2023. A comment is a decision someone already made; this one was ignored, then overwritten.
- **What the reader learns:** `git blame` / `git log -L` on a warning comment is often more honest than the code under it. If the comment says "do not log X" and the next fifty lines log X, the comment is the plot.
- **Surprise:** 4

---

## 4. `authors.yml` is the ghost they force-pushed away

- **Find-type:** 2 (planted / missing artifact)
- **Hash:** `ef4c5eb` (code that loads the file); no hash for the file itself
- **Date:** 2023-03-31
- **Author:** `twitter-team <>`
- **Command:**

```
git -C ~/book16/repos/the-algorithm show ef4c5eb:home-mixer/server/src/main/scala/com/twitter/home_mixer/module/HomeMixerResourcesModule.scala
git -C ~/book16/repos/the-algorithm log --all --full-history -- '**/authors.yml' '**/authors.yaml'
```

```
  private val AuthorsFile = "/config/authors.yml"
  @Named(DDGStatsAuthors)
  def providesDDGStatsAuthors(): YamlMap = YamlMap.load(AuthorsFile)

(no commits; the path never existed in this clone)
```

- **Why it is a story:** The first-commit message said they force-pushed to remove "publicly-available Twitter user information." The loader stayed. The YAML — the actual Elon user id, the Democrat set, the Republican set, the VIT/"power user" list — did not. The public can see the *shape* of the secret (four named buckets, one of them a single Long called `elon`) and never the contents. `ec83d01` then deletes even the loader, so the ghost is only visible by checking out the three-minute window.
- **What the reader learns:** A missing file that the code still names is a first-class artifact. `git log -- path` returning nothing, next to a `YamlMap.load("/config/authors.yml")`, is how you prove a sanitization. Check for the data file, not just the symbol.
- **Surprise:** 3

---

## 5. `UkraineCrisisTopic` becomes `DeprecatedSpaceSafetyLabel14`

- **Find-type:** 8 (rollback of the world)
- **Hash:** `3f6974687f0c16923da7e27b2c467abd0a109a1c`
- **Date:** authored 2023-04-04T16:27:41-04:00; committed 2023-04-04T20:35:00-05:00
- **Author:** `twitter-team <>`
- **Message:** `[VF] updates includes addressing Ukraine labels` (closes #1489, #1524, #1659, #1520)
- **Command:**

```
git -C ~/book16/repos/the-algorithm log -S 'UkraineCrisisTopic' --all --oneline
git -C ~/book16/repos/the-algorithm show 3f6974687f0c16923da7e27b2c467abd0a109a1c -- \
  visibilitylib/src/main/scala/com/twitter/visibility/models/SpaceSafetyLabelType.scala
```

```
3f69746 [VF] updates includes addressing Ukraine labels
ef4c5eb Twitter Recommendation Algorithm

-    s.SpaceSafetyLabelType.UkraineCrisisTopic -> UkraineCrisisTopic,
-    s.SpaceSafetyLabelType.DoNotPublicPublish -> DoNotPublicPublish,
+    s.SpaceSafetyLabelType.DeprecatedSpaceSafetyLabel14 -> Deprecated,
+    s.SpaceSafetyLabelType.DeprecatedSpaceSafetyLabel15 -> Deprecated,
-  case object UkraineCrisisTopic extends SpaceSafetyLabelType
-  case object DoNotPublicPublish extends SpaceSafetyLabelType
```

- **Why it is a story:** Four days after dump day, community issues had named the Ukraine crisis label. The visibility library's reply is not an explanation. It is a rename: a political/crisis topic and a `DoNotPublicPublish` flag become numbered deprecations 14 and 15. The enum slots stay (thrift compatibility); the English goes away. Same commit also edits `FreedomOfSpeechNotReach.scala`. Week-one vs dump-day is 45 files, 398 insertions, 569 deletions — most of the subtraction is this class of "please stop seeing that."
- **What the reader learns:** When a public dump includes a name that was only ever meant for an internal enum, the fix is often a rename to `DeprecatedN`, not a deletion. `git log -S 'UkraineCrisisTopic'` is how you watch a word leave the world while the slot remains.
- **Surprise:** 4

---

## 6. `has_gte_10k_favs` compared against 1,000 — a dozen PRs for one digit

- **Find-type:** 1 (tiny diff, huge blast radius)
- **Hash:** `d1cab28a1044a147a107ae067890850041956777`
- **Date:** authored 2023-04-03T15:37:52-07:00; committed 2023-04-03T20:47:10-05:00
- **Author:** `twitter-team <>`
- **Message:** `[home-mixer] fix has_gte_10k_favs typo` — closes #384, #242, #362, #572, #577, #650, #745, #935, #1076, #1079, #1105, #1561
- **Command:**

```
git -C ~/book16/repos/the-algorithm show d1cab28a1044a147a107ae067890850041956777
```

```
    [home-mixer] fix has_gte_10k_favs typo
    Fixes #384, closes #242, closes #362, closes #572, closes #577,
    closes #650, closes #745, closes #935, closes #1076, closes #1079,
    closes #1105, closes #1561
-      _.getOrElse(EarlybirdFeature, None).exists(_.favCountV2.exists(_ >= 1000))),
+      _.getOrElse(EarlybirdFeature, None).exists(_.favCountV2.exists(_ >= 10000))),
 1 file changed, 1 insertion(+), 1 deletion(-)
```

- **Why it is a story:** The same predicate file that tracked Elon also claimed to count tweets with ≥10k favorites, and the comparison was `>= 1000` — identical to the `has_gte_1k_favs` line above it. For however long this ran internally, "viral 10k" metrics were lying by an order of magnitude. The internet found it in four days. Twelve issue numbers ride on a one-character fix. They batched the community into one team commit rather than merge any of the PRs.
- **What the reader learns:** Metric names are not tests. A threshold in a string and a threshold in an integer will drift, and nobody inside will notice because the dashboard still goes up and to the right. Outsiders reading the dump will.
- **Surprise:** 3

---

## 7. The last human-readable ranking formula is deleted as "redundant"

- **Find-type:** 1 (tiny diff, huge blast radius)
- **Hash:** `138bb519975407d4ea0dc1478d897d451ef05dab`
- **Date:** authored 2023-04-04T17:15:37-07:00; committed 2023-04-04T20:39:52-05:00
- **Author:** `twitter-team <>`
- **Message:** `[cr-mixer/home-mixer] Remove getLinearRankingParams in EarlybirdTensorflowBasedSimilarityEngine`
- **Command:**

```
git -C ~/book16/repos/the-algorithm log -S 'getLinearRankingParams' --all --oneline
git -C ~/book16/repos/the-algorithm show 138bb519975407d4ea0dc1478d897d451ef05dab -- \
  cr-mixer/server/src/main/scala/com/twitter/cr_mixer/similarity_engine/EarlybirdTensorflowBasedSimilarityEngine.scala
```

```
138bb51 [cr-mixer/home-mixer] Remove `getLinearRankingParams` ...
ef4c5eb Twitter Recommendation Algorithm

-  private def getLinearRankingParams: ThriftRankingParams = {
-    ThriftRankingParams(
-      `type` = Some(ThriftScoringFunctionType.Linear),
-      retweetCountParams = Some(... weight = 20.0),
-      favCountParams = Some(... weight = 30.0),
-      offensiveBoost = 0.1,
-      inTrustedCircleBoost = 3.0,
-      inDirectFollowBoost = 4.0,
-      selfTweetBoost = 2.0,
```

- **Why it is a story:** For four days the public could read the old Earlybird linear ranker in English: favorites 30, retweets 20, reputation 0.2, trusted-circle 3×, direct-follow 4×, offensive 0.1×, English-UI 0.5. The commit message says these parameters were dead because `useTensorflowRanking` is always true and `applyBoosts` is false. That may be so in production. What the deletion *does* is take the last inspectable scoring function off GitHub. After this, ranking is a TensorFlow model named `"timelines_rectweet_replica"` that this repo does not contain.
- **What the reader learns:** "Dead code" in a just-open-sourced system is often the only code a stranger can still understand. Deleting it four days later, once the screenshots exist, is a transparency decision whether or not the function still ran.
- **Surprise:** 4

---

## 8. Blue Verified defaulted to a 4× score multiplier, then vanished

- **Find-type:** 7 (feature that became the vulnerability)
- **Hashes:** present in `ef4c5eb`; deleted in `72eda9a24f815f6d566818cbf8518138e29d83e9`
- **Dates:** 2023-03-31 dump; July update authored 2023-07-07T14:01:54-07:00, committed 2023-07-13T16:33:04+05:30
- **Author:** `twitter-team <>`
- **Messages:** (dump, no separate commit); `[opensource] Update home mixer with latest changes`
- **Command:**

```
git -C ~/book16/repos/the-algorithm show ef4c5eb:home-mixer/server/src/main/scala/com/twitter/home_mixer/param/HomeGlobalParams.scala | sed -n '89,107p'
git -C ~/book16/repos/the-algorithm log -S 'VerifiedAuthorScalingScorer' --all --oneline
```

```
  object BlueVerifiedAuthorInNetworkMultiplierParam
      extends FSBoundedParam[Double](
        name = "home_mixer_blue_verified_author_in_network_multiplier",
        default = 4.0, min = 0.0, max = 100.0)
  object BlueVerifiedAuthorOutOfNetworkMultiplierParam
      extends FSBoundedParam[Double](
        name = "home_mixer_blue_verified_author_out_of_network_multiplier",
        default = 2.0, min = 0.0, max = 100.0)

72eda9a [opensource] Update home mixer with latest changes
ef4c5eb Twitter Recommendation Algorithm
```

`VerifiedAuthorScalingScorer.scala` multiplied `ScoreFeature` by those factors whenever `AuthorIsBlueVerifiedFeature` was true.

- **Why it is a story:** Dump day did not only reveal *metrics* on Elon. It revealed a paid-check boost whose **defaults** were 4× in-network and 2× out-of-network, capped at 100×. That is not a comment, not a dashboard label — it is a scorer in the For You path. Three months later the July home-mixer refresh deletes the file and the params. The 2025 tree still *counts* `author_is_blue_verified` (and gold/gray/legacy/creator) as metrics predicates; the multiplier is gone. The public saw the thumb on the scale, and the next snapshot had no thumb.
- **What the reader learns:** Defaults in a feature-switch param are the production values until proven otherwise. `default = 4.0` next to `BlueVerified` is a product decision with a number on it. If a later dump deletes the scorer, `git log -S` is the only way to prove it was ever there.
- **Surprise:** 4

---

## 9. Named humans exist for four days, then the shortlog is a mask

- **Find-type:** 4 (name that appears / disappears)
- **Hashes:** Pouriya `2dbdfe1` / `ee5e7fc`; Auro `9115361`; dzhao `9f0afc0` / `e8147d8` / `36588c6`. Last human-named commit: `36588c650e94f901d040a0e3a7b7b1b2cdab0492` (2023-04-04).
- **Dates:** 2023-03-31 → 2023-04-04, then never
- **Authors:** Pouriya Jahanbakhsh, Auro, dzhao `<di.zhao@gmail.com>`
- **Command:**

```
git -C ~/book16/repos/the-algorithm shortlog -sn --all
git -C ~/book16/repos/the-algorithm log --format='%h %aI %an <%ae> %s' --all | grep -v twitter-team
```

```
    25  twitter-team
     3  dzhao
     2  Pouriya Jahanbakhsh
     1  Auro

36588c6 2023-04-04T11:06:35-07:00 dzhao <di.zhao@gmail.com> Merge pull request #452 from pouriya/refactor-dr_transform
e8147d8 2023-04-04T09:32:40-07:00 dzhao <di.zhao@gmail.com> Update README.md
9f0afc0 2023-04-04T09:30:11-07:00 dzhao <di.zhao@gmail.com> Merge pull request #550 from MrAuro/improve-navi-docs
9115361 2023-03-31T17:52:31-07:00 Auro <35087590+MrAuro@users.noreply.github.com> (docs): Improve README file for Navi
ee5e7fc 2023-04-01T02:33:51+03:30 Pouriya Jahanbakhsh <pouriya.jahanbakhsh@gmail.com> feat(navi/dr_transform): ...
2dbdfe1 2023-04-01T02:21:44+03:30 Pouriya Jahanbakhsh <pouriya.jahanbakhsh@gmail.com> ref(navi/dr_transform): ...
```

Day-one README invited "the community to submit GitHub issues and pull requests" and promised tools "to manage these suggestions and sync changes to our internal repository." After April 4, every commit is `twitter-team <>`. External PR numbers keep appearing as `Closes #N` on team dumps (`bb09560` closes seventeen grammar issues in one commit; `31e82d6` is authored April 5 and committed April 28 as `improvements from external prs`). Nobody outside the mask is allowed a commit after day four.

- **Why it is a story:** For one weekend this looked like a project. A stranger in Iran fixed clippy at 02:21, a docs PR landed, a Twitter engineer with a gmail address mashed merge. Then the hatch closed. The contributing paragraph is still in the 2025 README (Twitter swapped for X, HackerOne swapped for x). The shortlog is the honest document.
- **What the reader learns:** `git shortlog -sn` over the first week vs the rest of time is how you tell a launch-week performance from a maintained project. A README that still says "we invite PRs" after two years of `twitter-team`-only commits is marketing, and git will not play along.
- **Surprise:** 3

---

## 10. 783 days of silence, then political labels return wearing Grok

- **Find-type:** 4 (name that appears: X, Grok) and 7 (the feature returns) and 8 (rollback, reversed)
- **Hash:** `c54bec0d4e029fe34926ef3258a86ccacc0d0182`
- **Date:** 2025-09-03T15:46:53-05:00 (author = committer)
- **Author:** `twitter-team <>`
- **Message:** `update for-you recommendations code`
- **Command:**

```
git -C ~/book16/repos/the-algorithm log --format='%h %aI %cI %s' 72eda9a^..c54bec0
git -C ~/book16/repos/the-algorithm show --shortstat --format=fuller c54bec0
git -C ~/book16/repos/the-algorithm log -S 'grok_politics_left' --all --oneline
git -C ~/book16/repos/the-algorithm grep -n -A1 'grok_politics_left' HEAD -- \
  home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/decorator/builder/HomeTweetTypePredicates.scala
```

```
c54bec0 2025-09-03T15:46:53-05:00 2025-09-03T15:46:53-05:00 update for-you recommendations code
72eda9a 2023-07-07T14:01:54-07:00 2023-07-13T16:33:04+05:30 [opensource] Update home mixer with latest changes

    update for-you recommendations code
 988 files changed, 65319 insertions(+), 3195 deletions(-)

c54bec0 update for-you recommendations code

398:      "grok_politics_left", // Purely for metrics tracking. Does not affect the recommendations.
399-      _.getOrElse(GrokPoliticalInclinationFeature, None).contains(hmt.PoliticalInclination.Left)
```

Same file, same commit, also adds `grok_politics_neutral` / `grok_politics_right` with the identical disclaimer; plus `author_is_blue_verified` / gold / gray / legacy / creator; plus `grok_content_creator_*`; plus a `SlopAuthorScoreFeature`. Category ids in the same list are written `<removed_id>` — they remembered the 2023 user-id lesson and redacted this time.

Dump-day vs week-one (`ef4c5eb..138bb51`) was 45 files, −171 net lines. Dump-day vs last-2023 was +174k lines of extra modules. 2023-last vs 2025 is another +62k, and a README retitle from "Twitter's Recommendation Algorithm" to "X's Recommendation Algorithm."

- **Why it is a story:** The folklore ends in April 2023: they shipped the flags, the public screamed, they deleted the flags, the repo went quiet. That is not the end of the git. After 783 days (commit-date gap from 2023-07-13 to 2025-09-03) the same empty-email account drops a 65-thousand-line snapshot. Democrat/Republican author lists are gone. In their place, Grok labels each post Left / Right / Neutral, and a comment — "Purely for metrics tracking. Does not affect the recommendations." — repeats the 2023 defense word for word. The company is not a dead PR artifact. It is a company that learned to redact ids, forgot that the *labels* were the story, and published the sequel under a one-line commit message.
- **What the reader learns:** "Did they ever update it?" is a `git log -1` question, and the answer here is yes, once, late, huge. Always diff the latest dump against the sanitized week-one tree, not just against HEAD~1. The thing they were punished for is the first place a later snapshot will grow a new name.
- **Surprise:** 5

---

## Ranked top-3

1. **#2 — The three-minute Elon/Democrat/Republican scrub, authored two hours before publish.** The company's regret, with timestamps that prove the apology was typed first. 66 lines. The whole book pitch for this repo.
2. **#10 — 783 silent days, then `grok_politics_left` / `right` with the same "purely for metrics" comment.** The folklore has no second act. Git does.
3. **#1 / #3 — Force-pushed day one that admits sanitization, under a comment that forbade logging sensitive author labels.** Genesis is already take two, and the file that caused the scandal opened by telling its author not to write it.

## Disappointing

Thirty-one commits, twenty-five of them a faceless team account: there is no internal evolution to read, only curated snapshots and the deletions between them — you cannot watch the algorithm being built, only watch it being shown.
