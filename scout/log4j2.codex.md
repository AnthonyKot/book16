# Second scout: apache/logging-log4j2

## Verification table

I treated a displayed transcript as a claim too: a command fails verification if the underlying fact is true but the shown output cannot have come from that exact command.

| dig | claim | command rerun | result | note |
|---|---|---|---|---|
| Ranked #1, dig 3 | `8916625d9141f9c1e8c52e09d949d36fbe2555df`; Ralph Goers; 2012-09-23 21:27:17 +0000; stated message; formatted messages are passed to `config.getSubst().replace(...)` when they contain `${`. | `git -C /home/diablo/book16/repos/log4j2 show 8916625d91 -- '*MessagePatternConverter.java'` | **PASS** | Hash, author, date, subject, and the decisive diff all match. The causal description is sound: the result comes from `msg.getFormattedMessage()`/`MultiformatMessage` and is then substituted. |
| Ranked #1, dig 3 | The displayed `4 files changed, 30 insertions(+), 16 deletions(-)` came from that exact command, and the change was simply “two lines.” | `git -C /home/diablo/book16/repos/log4j2 show 8916625d91 -- '*MessagePatternConverter.java'` | **FAIL** | The path-limited command emits no stat line and shows only one file. An additional unscoped `show --stat` confirms the numbers, but the commit is a four-file, 46-line refactor. “Two lines” accurately describes the decisive added expression, not the whole diff. |
| Ranked #2, dig 6 | `6a4c88d4ae85f6a70843df23e0781becc790c821`; Gary Gregory; 2016-08-19 00:31:44 -0700; stated Camel/compatibility subject; `%m{nolookups}` added; 223 insertions, 16 deletions. | `git -C /home/diablo/book16/repos/log4j2 show --stat --format=fuller 6a4c88d4ae` | **PASS** | Metadata and stat match exactly. A supplemental path-limited show confirms `NOLOOKUPS`, option parsing, and `config != null && !noLookups`. |
| Ranked #2, dig 6 | `dd18e9b21009055e226daf5b233c92b6a17934ca`; Carter Kozak; authored 2017-11-09; committed by Mikael Ståldal on 2017-11-12; global property defaults to `false`. | `git -C /home/diablo/book16/repos/log4j2 show dd18e9b210 -- '*Constants.java'` | **PASS** | Exact diff shows the subject, Carter's author identity/date, property name, and `false`. Supplemental `log -1 --format=fuller` confirms Mikael Ståldal and commit date 2017-11-12 15:28:55 +0100. |
| Ranked #3, dig 4 | `f1a0cac60f1e41347c9bced7c1470be488840344`; Ralph Goers; 2013-07-18 19:47:20 +0000; stated subject; 9 files, 376 insertions, 8 deletions. | `git -C /home/diablo/book16/repos/log4j2 show --stat --format=fuller f1a0cac60f` | **PASS** | Hash, author/committer, dates, subject, file list, and totals match. |
| Ranked #3, dig 4 | The commit registers `jndi`, calls `InitialContext.lookup`, avoids the `java:comp/env/` prefix for any key containing a colon, and documents that behavior. | `git -C /home/diablo/book16/repos/log4j2 show f1a0cac60f -- '*Interpolator.java' '*JndiLookup.java' src/site/xdoc/manual/lookups.xml` | **PASS** | All quoted lines match. Nuance: the code casts the lookup result to `String` and catches `NamingException`; neither changes the colon/scheme claim. |
| Doubt check, dig 8 | One `git log -1` invocation over the three release tags produces the three displayed release-commit lines. | `git -C /home/diablo/book16/repos/log4j2 log -1 --format='%h %ad %an %s' --date=iso rel/2.15.0 rel/2.16.0 rel/2.17.0` | **FAIL** | It prints only `a19ef9bcee ... log4j-2.17.0-rc1`: `-1` limits the combined traversal globally. The three underlying target commits are real, but reproduction needs a loop or three commands. |
| Doubt check, dig 1 | Curtis William Arnold's “moving old code to 2008 dir” commit actually changes only `pom.xml`. | `git -C /home/diablo/book16/repos/log4j2 show --stat --format=fuller 2f40efb4985f36281ac8c224412a9ea7233ef4f6` | **PASS** | It is exactly one file, one insertion, two deletions. The report's “ghost” characterization is precise: the subject promises a restructure that the imported tree does not contain. |
| Doubt check, dig 8 | `27972043b76c9645476f561c5adc483dec6d3f5d` is Ralph Goers, 2021-12-12 22:32:00 -0700, `LOG4J2-3211 - Remove Messge Lookups (#623)`. | `git -C /home/diablo/book16/repos/log4j2 show -s --format=fuller 27972043b76c9645476f561c5adc483dec6d3f5d` | **PASS** | Hash, author date, commit date, author, GitHub committer, and the misspelling `Messge` all match. |

**Count: 7 verified, 2 failed.** Both failures are reproducibility/editorial failures; neither is a fabricated object.

## New dig 1 — The Java 6 rescue branch begins at 22:43 on Sunday

- **find-type:** 8 (rollback of the world)
- **hashes:** `a0b0e1149714272cc9a37d70ad7f8808ebc55f70`; `be848dacbac6df30c4f32b2852e24446033ecf79`
- **dates:** 2021-12-19 22:43:43 -0700; 2021-12-19 23:30:42 -0700
- **author:** rgoers `<ralph.goers@dslextreme.com>` (both)
- **messages:** `Create branch for security releases`; `LOG4J2-3198 - Remove ability to perform lookups from message text`

```sh
git -C /home/diablo/book16/repos/log4j2 log --reverse --format='%h|%aI|%an <%ae>|%s' 2.x..origin/2.3.x | sed -n '1,3p'
git -C /home/diablo/book16/repos/log4j2 show --format= --unified=1 be848dacbac6df30c4f32b2852e24446033ecf79 -- '*MessagePatternConverter.java' | sed -n '/@@ -70/,+5p'
```

```text
a0b0e11497|2021-12-19T22:43:43-07:00|rgoers <ralph.goers@dslextreme.com>|Create branch for security releases
be848dacba|2021-12-19T23:30:42-07:00|rgoers <ralph.goers@dslextreme.com>|LOG4J2-3198 - Remove ability to perform lookups from message text
6f0c11e3ba|2021-12-20T17:23:15+09:00|rpopma <rpopma@apache.org>|[DOC] Update log4j-2.3.x About page to mention security vulns and point to security page
@@ -70,4 +70,3 @@ public final class MessagePatternConverter extends LogEventPatternConverter {
             if (result != null) {
-                toAppendTo.append(config != null && result.contains("${") ?
-                    config.getStrSubstitutor().replace(event, result) : result);
+                toAppendTo.append(result);
             } else {
```

**Why it is a story.** `HEAD` does not contain these commits. Nine days after disclosure, Ralph starts a new 2.3.x security line from the old release whose POM still targets Java 1.6; 47 minutes later he removes message evaluation with a three-line edit. This is the moment maintainers decide that users stranded on an obsolete runtime still need a survivable jar, before knowing how many more December CVEs will follow.

**What the reader learns.** `git log HEAD` can omit the patch your oldest production runtime actually received. Compare maintained refs with `HEAD..old-branch`, and inspect the branch POM/toolchain before calling an old line dead.

**surprise:** 4

## New dig 2 — Three emergency releases, three signed taggers

- **find-type:** 4 (a name disappears / appears)
- **tag-object hashes:** `636ce10d676202b2ea4aa2bab9924a5a8c6dd401` (`rel/2.15.0`); `70638718e0db900552c062b98956a05409d70058` (`rel/2.16.0`); `8285c82d998164dccfb2e57889b9dfb73dc27533` (`rel/2.17.0`)
- **dates / taggers:** 2021-12-10 23:20:33 -0700, Ralph Goers; 2021-12-13 10:58:39 -0600, Matt Sicker; 2021-12-18 09:14:13 -0500, Gary Gregory
- **messages:** `Release 2.15.0 of Log4j`; `Release 2.16.0 of Log4j`; `Release tag for 2.17.0`

```sh
for tag in rel/2.15.0 rel/2.16.0 rel/2.17.0; do meta=$(git -C /home/diablo/book16/repos/log4j2 for-each-ref --format='%(refname:short)|%(objectname)|%(taggerdate:iso8601)|%(taggername) %(taggeremail)|%(subject)' "refs/tags/$tag"); if git -C /home/diablo/book16/repos/log4j2 cat-file -p "refs/tags/$tag" | grep -q '^-----BEGIN PGP SIGNATURE-----'; then printf '%s|PGP-present\n' "$meta"; else printf '%s|unsigned\n' "$meta"; fi; done
```

```text
rel/2.15.0|636ce10d676202b2ea4aa2bab9924a5a8c6dd401|2021-12-10 23:20:33 -0700|Ralph Goers <rgoers@apache.org>|Release 2.15.0 of Log4j|PGP-present
rel/2.16.0|70638718e0db900552c062b98956a05409d70058|2021-12-13 10:58:39 -0600|Matt Sicker <boards@gmail.com>|Release 2.16.0 of Log4j|PGP-present
rel/2.17.0|8285c82d998164dccfb2e57889b9dfb73dc27533|2021-12-18 09:14:13 -0500|Gary Gregory <garydgregory@gmail.com>|Release tag for 2.17.0|PGP-present
```

**Why it is a story.** The release commits in the first report are not the release tags. Each fix receives a later annotated tag object, and the signing hand passes from Ralph to Matt to Gary as one patch gives way to the next. Before anyone knows 2.17.0 will hold, a third maintainer attaches a third signed statement to a third candidate.

**What the reader learns.** A release has at least two clocks and identities: the commit and the tag object. Inspect both. `PGP-present` proves only that signature material is embedded; cryptographic validity still requires `git tag -v` with a trusted keyring.

**surprise:** 3

## New dig 3 — On Christmas Eve, JNDI leaves core on the future main line

- **find-type:** 8 (rollback of the world)
- **hash:** `14e307ac825f9c169f8c14203c680564d1943ac2`
- **date:** 2021-12-24 22:12:23 -0700
- **author:** Ralph Goers `<rgoers@apache.org>`
- **message:** `LOG4J2-3242 - Move JNDI to its own module. Require a system property to enable JNDI features. Limit JNDI to the java protocol`

```sh
git -C /home/diablo/book16/repos/log4j2 log origin/main --follow --diff-filter=AR --format='%H|%aI|%an <%ae>|%s' --name-status -- log4j-jndi/src/main/java/org/apache/logging/log4j/jndi/lookup/JndiLookup.java | sed -n '1,9p'
```

```text
14e307ac825f9c169f8c14203c680564d1943ac2|2021-12-24T22:12:23-07:00|Ralph Goers <rgoers@apache.org>|LOG4J2-3242 - Move JNDI to its own module. Require a system property to enable JNDI features. Limit JNDI to the java protocol

R084 log4j-core/src/main/java/org/apache/logging/log4j/core/lookup/JndiLookup.java log4j-jndi/src/main/java/org/apache/logging/log4j/jndi/lookup/JndiLookup.java
b93cdf94167691cf509c15f69f3857abaaa80765|2013-08-26T12:23:20+00:00|Gary D. Gregory <ggregory@apache.org>|[LOG4J2-333] Match artifact ids with Maven module names

R100 core/src/main/java/org/apache/logging/log4j/core/lookup/JndiLookup.java log4j-core/src/main/java/org/apache/logging/log4j/core/lookup/JndiLookup.java
f1a0cac60f1e41347c9bced7c1470be488840344|2013-07-18T19:47:20+00:00|Ralph Goers <rgoers@apache.org>|LOG4J2-313 - Add JNDILookup

A core/src/main/java/org/apache/logging/log4j/core/lookup/JndiLookup.java
```

**Why it is a story.** The checked-out 2.x branch still has `JndiLookup` in `log4j-core`; `--all` reveals the more radical future on `origin/main`. At 22:12 on Christmas Eve, Ralph turns the once-automatic lookup into a separately packaged, property-gated subsystem. The rename trail places that retreat directly above the 2013 add: before the next major line ships, they are redrawing the artifact boundary itself.

**What the reader learns.** Security response may diverge by product line. Use `--all` and `--follow` on the dangerous file: the strongest architectural fix may live on a future branch while compatibility branches carry narrower patches.

**surprise:** 4

## New dig 4 — A 2016 author date enters the repository in 2023

- **find-type:** 2 (planted / dated artifact)
- **hash:** `945cb7fecb48b35d16e375db58d8cda5dfd414e5`
- **author date:** 2016-04-17 15:27:19 -0700
- **commit date:** 2023-11-14 15:55:23 +0100
- **author / committer:** ggregory `<ggregory@apache.org>` / Piotr P. Karwasz `<piotr.github@karwasz.org>`
- **message:** `[LOG4J2-1362] Create a YAML layout (part)`; body: `Cherry-pick of an old commit that introduced: ServletRequestThreadContext`

```sh
git -C /home/diablo/book16/repos/log4j2 show -s --format='%H%nAuthorDate: %aI%nAuthor: %an <%ae>%nCommitDate: %cI%nCommitter: %cn <%ce>%n%s%n%b' 945cb7fecb48b35d16e375db58d8cda5dfd414e5 | sed -n '1,10p'
```

```text
945cb7fecb48b35d16e375db58d8cda5dfd414e5
AuthorDate: 2016-04-17T15:27:19-07:00
Author: ggregory <ggregory@apache.org>
CommitDate: 2023-11-14T15:55:23+01:00
Committer: Piotr P. Karwasz <piotr.github@karwasz.org>
[LOG4J2-1362] Create a YAML layout (part)
Cherry-pick of an old commit that introduced:

`ServletRequestThreadContext`
```

**Why it is a story.** Piotr deliberately resurrects one useful piece of a seven-and-a-half-year-old change while assembling the newer main line, preserving Gary's author identity and clock. At the moment of the cherry-pick, the subject still describes the larger YAML-layout work even though this commit's diff is only the 45-line servlet request context class. It is an honest fossil with a new object ID.

**What the reader learns.** Author date is when a patch says it began; commit date is when this object entered this lineage. Rank archaeology by both `%aI` and `%cI`, especially after cherry-picks, rebases, or reconstructed branches.

**surprise:** 4

## New dig 5 — The largest commit is a 603,261-line publication artifact

- **find-type:** 2 (planted / dated artifact)
- **hash:** `7e258b50fcba8f55bfcc8541f98e93e4069a5ba3`
- **date:** 2024-09-06 21:34:25 +0000
- **author:** ASF Logging Services RM `<private@logging.apache.org>`
- **message:** `Add website content generated from 92a8bb61668e2416e8c60698be451997fd0afe14`

```sh
git -C /home/diablo/book16/repos/log4j2 log --all --numstat --format='@@%H|%aI|%an <%ae>|%s' | awk 'function emit(){if(h!="") print add+del "|" add "|" del "|" h} /^@@/{emit(); h=substr($0,3); add=0; del=0; next} $1~/^[0-9]+$/&&$2~/^[0-9]+$/{add+=$1;del+=$2} END{emit()}' | sort -t'|' -k1,1nr | sed -n '1,5p'
```

```text
603262|603261|1|7e258b50fcba8f55bfcc8541f98e93e4069a5ba3|2024-09-06T21:34:25+00:00|ASF Logging Services RM <private@logging.apache.org>|Add website content generated from `92a8bb61668e2416e8c60698be451997fd0afe14`
575481|575480|1|747921c55c955228c2de205d4a9ad0a3b90ba852|2024-04-15T09:14:12+00:00|ASF Logging Services RM <private@logging.apache.org>|Add website content generated from `27ae663914cbc83df33c3eb79c0ab506eac1f73a`
502872|3277|499595|f1d612b4209472fa00d5d4124db90ce3f2b93bd8|2025-06-16T20:04:18+00:00|ASF Logging Services RM <private@logging.apache.org>|Add website content generated from `da4420763ee276c8da2f1d31d3a451063702c5d8`
502622|502556|66|69dd38f87d15f128a30b00ab1765c9b8c257b629|2025-06-18T07:06:33+00:00|ASF Logging Services RM <private@logging.apache.org>|Add website content generated from `7c9a7ed402934b9cc950526d0fe1fbf43d5381fc`
502622|502562|60|d94974e578360e6fbcd46c435cf69e58505c2c82|2025-06-21T03:02:21+00:00|ASF Logging Services RM <private@logging.apache.org>|Add website content generated from `f1054c7d0bc200d5506b9608c08a300058ea2990`
```

**Why it is a story.** The biggest diff in all refs is not a rewrite: a release bot materializes 2,230 generated site files on `origin/2.x-site-pro-out`, and names the human-source commit in backticks. Just before publication, `92a8bb6166` is a normal Piotr commit, `Prepare for new development cycle`; the bot turns that state into 603,261 inserted lines and leaves the provenance hash as the only practical way back.

**What the reader learns.** Largest-commit rankings over `--all` often measure deployment topology, not engineering effort. Preserve the generated-from hash, identify which ref contains the output, and rerun rankings with publication refs excluded before drawing conclusions.

**surprise:** 4

## New dig 6 — An empty commit does exactly what its message says

- **find-type:** 2 (planted / dated artifact)
- **hash:** `aedabcf09427a745e1b936a74770211693fa0b65`
- **date:** 2026-03-24 22:43:49 +0100
- **author:** Piotr P. Karwasz `<pkarwasz-github@apache.org>`
- **message:** `Dummy commit to trigger workflows`

```sh
git -C /home/diablo/book16/repos/log4j2 show -s --format='%H%n%aI%n%an <%ae>%n%s' aedabcf09427a745e1b936a74770211693fa0b65
git -C /home/diablo/book16/repos/log4j2 rev-parse 'aedabcf09427a745e1b936a74770211693fa0b65^{tree}' 'aedabcf09427a745e1b936a74770211693fa0b65^^{tree}'
```

```text
aedabcf09427a745e1b936a74770211693fa0b65
2026-03-24T22:43:49+01:00
Piotr P. Karwasz <pkarwasz-github@apache.org>
Dummy commit to trigger workflows
e3bdea3b30e93b22f96a521ace05cb9bd11adb27
e3bdea3b30e93b22f96a521ace05cb9bd11adb27
```

**Why it is a story.** On the 2.25.x maintenance ref, Piotr needs an event, not a code change. The commit and its parent name the identical tree, but the new commit object is enough to ask automation to try again. Before the workflow outcome is known, the trace is deliberately content-free and unusually candid.

**What the reader learns.** A commit is both a snapshot and an event. Detect intentional empty commits by comparing `commit^{tree}` with `commit^^{tree}`; do not erase them as “no change” until you have checked the CI or release event they were created to cause.

**surprise:** 2

Reliability: strong on identities, chronology, diffs, and causal interpretation—7 of 9 checked receipts passed.
The two failures are command/transcript mismatches, not invented history; the first report is trustworthy but needs a reproducibility edit.
