# Scout: apache/logging-log4j2

- **repo:** https://github.com/apache/logging-log4j2
- **clone:** `~/book16/repos/log4j2` (already present; not re-cloned)
- **clone size:** 203M working tree; 163M `.git`
- **default branch:** `2.x`
- **history span:** 2010-05-13 → 2026-08-18
- **commits:** 14,702 on `HEAD` (`2.x`); 20,855 `--all`
- **first:** `3e6bb87f728a9da48d33cecf9dd02dd09bc1a330` Ralph Goers, 2010-05-13 06:31:04 +0000, "First version"
- **last:** `ecf1f41c99c65c6500ed6e9bb1d7d1c16a5b8e77` Piotr P. Karwasz, 2026-08-18 18:35:07 +0200, "Change `build` and `codeql-analysis` triggers (#4212)"

Commands for the header numbers:

```
git -C ~/book16/repos/log4j2 rev-list --count HEAD
# 14702
git -C ~/book16/repos/log4j2 rev-list --count --all
# 20855
du -sh ~/book16/repos/log4j2 ~/book16/repos/log4j2/.git
# 203M    .../log4j2
# 163M    .../log4j2/.git
```

The history is a git-svn import of Apache SVN. Day one is not an empty tree: it is a personal experimental branch dump. The story the world knows (Log4Shell, December 2021) is real and is in this log; the archaeology is that the blast radius was assembled in ordinary commits years earlier, and that the off switch existed for five years with the default left on.

---

## 1. "First version" is a 15,000-line personal SVN dump

- **find-type:** 3 (first commit — what day one shows)
- **hash:** `3e6bb87f728a9da48d33cecf9dd02dd09bc1a330`
- **date:** 2010-05-13 06:31:04 +0000
- **author:** Ralph Goers `<rgoers@apache.org>`
- **message:** `First version`

```
git -C ~/book16/repos/log4j2 log --reverse --format='%H%n%an <%ae>%n%ad%n%s%n%b' --date=iso | head -8
git -C ~/book16/repos/log4j2 show --shortstat --format=fuller 3e6bb87f728a9da48d33cecf9dd02dd09bc1a330 | tail -8
```

```
3e6bb87f728a9da48d33cecf9dd02dd09bc1a330
Ralph Goers <rgoers@apache.org>
2010-05-13 06:31:04 +0000
First version
git-svn-id: https://svn.apache.org/repos/asf/logging/log4j/branches/BRANCH_2_0_EXPERIMENTAL/rgoers@943816 13f79535-47bb-0310-9956-ffa450edef68

    First version
    git-svn-id: https://svn.apache.org/repos/asf/logging/log4j/branches/BRANCH_2_0_EXPERIMENTAL/rgoers@943816 ...
 135 files changed, 15038 insertions(+)
```

**Why it is a story.** The first git commit is not "add README." It is Ralph Goers dropping a working Log4j 2 API + core (Logger, Level, Appender, PatternLayout, StructuredDataMessage — 15,038 lines) into his own directory on `BRANCH_2_0_EXPERIMENTAL`. Two weeks later Curtis William Arnold is leaving code-review tags (`@issue`, `@doubt`, `@compare`) and a commit that says he is "moving old code to 2008 dir" — but that commit only touches `pom.xml`. The 2008 prototype is a ghost the git-svn import did not bring across. On 2012-02-06 Ralph commits `6d0959e9e8` "Move Log4j2 from experimental to its own trunk." Day one of this clone is already a rewrite-in-progress, not a blank page.

**What the reader learns.** Imported history starts wherever the importer pointed. A "First version" hash is often a boundary, not a birth. If your project came from SVN, CVS, or a personal branch, `git log --reverse` shows the import, not the invention.

**surprise:** 3

---

## 2. Variable substitution arrives at 05:09 UTC, with a plugin loader

- **find-type:** 7 (feature that became the vulnerability)
- **hash:** `2338fcb9fb5cff5325305db4da1bed098b930beb`
- **date:** 2010-10-25 05:09:08 +0000
- **author:** Ralph Goers `<rgoers@apache.org>`
- **message:** `Add support for variable substitution`

```
git -C ~/book16/repos/log4j2 show --stat --format=fuller 2338fcb9fb
```

```
AuthorDate: Mon Oct 25 05:09:08 2010 +0000
    Add support for variable substitution
    git-svn-id: .../BRANCH_2_0_EXPERIMENTAL/rgoers@1026947 ...
 .../logging/log4j/core/lookup/Interpolator.java    | 116 +++
 .../logging/log4j/core/lookup/StrSubstitutor.java  | 946 +++++++++++++++++++++
 20 files changed, 1830 insertions(+), 31 deletions(-)
```

The new `Interpolator` already walked `PluginManager("Lookup")` and instantiated every lookup plugin it found. `StrSubstitutor` is ~946 lines of Commons-Lang-shaped `${var}` replacement, including prefix-before-colon dispatch (`PREFIX_SEPARATOR = ':'`). At 05:09 UTC on a Monday, this is configuration convenience: `${sys:foo}`, `${env:USER}`. Nobody is logging untrusted input into it yet.

**Why it is a story.** This is the moment the project decided that a string containing `${` is not data, it is a program. The plugin loop means any later `@Plugin(name=..., category="Lookup")` becomes a new verb in that language automatically. The colon is already the prefix separator. Eight years of lookups will be hung on this frame.

**What the reader learns.** A "config interpolator" is a tiny language. If you ever evaluate it against attacker-controlled text, you have given the attacker every verb you register. Plugin auto-discovery makes that verb list a moving target.

**surprise:** 3

---

## 3. A performance refactor makes every log message a lookup

- **find-type:** 1 (tiny diff, huge blast radius)
- **hash:** `8916625d9141f9c1e8c52e09d949d36fbe2555df`
- **date:** 2012-09-23 21:27:17 +0000
- **author:** Ralph Goers `<rgoers@apache.org>`
- **message:** `Move variable substitution from PatternLayout to appropriate converters to improve performance.`

```
git -C ~/book16/repos/log4j2 show 8916625d91 -- '*MessagePatternConverter.java'
```

```
    Move variable substitution from PatternLayout to appropriate converters to improve performance.
 4 files changed, 30 insertions(+), 16 deletions(-)
+            toAppendTo.append(config != null && result.contains("${") ?
+                config.getSubst().replace(event, result) : result);
```

**Why it is a story.** Before this commit, substitution ran on the layout pattern — the string the *operator* wrote in `log4j2.xml`. After it, substitution runs on the *formatted message*, i.e. the string the application (and anyone who can influence a log line) produced. The commit message is sincere: moving the work out of PatternLayout into the converters that actually need it is faster, and `contains("${")` is a cheap reject. The author is optimizing a layout. He is also, without knowing, wiring user-controlled text into the interpolator from dig 2. Ten months later someone will register `jndi` as a verb.

**What the reader learns.** "Move this out of the hot path for performance" can change *what the code is*. A two-line ternary on `%m` turned a config feature into a data feature. If your interpolator ever touches user input, the performance check (`contains("${")`) is the attack trigger, not a guard.

**surprise:** 5

---

## 4. One `lookups.put` and a documented colon

- **find-type:** 7 (feature that became the vulnerability) / 1 (tiny diff)
- **hash:** `f1a0cac60f1e41347c9bced7c1470be488840344`
- **date:** 2013-07-18 19:47:20 +0000
- **author:** Ralph Goers `<rgoers@apache.org>`
- **message:** `LOG4J2-313 - Add JNDILookup`

```
git -C ~/book16/repos/log4j2 show --stat --format=fuller f1a0cac60f
git -C ~/book16/repos/log4j2 show f1a0cac60f -- '*Interpolator.java' '*JndiLookup.java' src/site/xdoc/manual/lookups.xml
```

```
    LOG4J2-313 - Add JNDILookup
    git-svn-id: .../log4j2/trunk@1504620 ...
 9 files changed, 376 insertions(+), 8 deletions(-)
+        lookups.put("jndi", new JndiLookup());
+            InitialContext ctx = new InitialContext();
+            return (String) ctx.lookup(convertJndiName(key));
+        if (!jndiName.startsWith(CONTAINER_JNDI_RESOURCE_PATH_PREFIX) && jndiName.indexOf(':') == -1) {
+            jndiName = CONTAINER_JNDI_RESOURCE_PATH_PREFIX + jndiName;
+            The JNDILookup allows variables to be retrieved via JNDI. By default the key will be prefixed with
+            java:comp/env/, however if the key contains a ":" no prefix will be added.
```

**Why it is a story.** JNDI is a reasonable J2EE feature: look up `java:comp/env/logging/context-name` from a container. `convertJndiName` helpfully adds that prefix *unless the key already contains a colon*, so that an explicit `java:` scheme still works. The site docs say so in the same commit. `ldap:`, `rmi:`, `dns:` all contain a colon. Combined with dig 3, a log line `${jndi:ldap://...}` is now a JNDI lookup of an attacker URL. The moment before the outcome: a Thursday in July 2013, adding a lookup next to `sys` and `env`, documenting the colon as a convenience.

**What the reader learns.** The dangerous line is often the "unless the user already specified a scheme" helper, not the feature flag. If you write a prefix-unless-colon, you have allow-listed every URI scheme you have never heard of. Write the allow-list (`java:` only) in the same commit as the feature.

**surprise:** 4

---

## 5. Android cannot load JNDI, so they catch the error and continue

- **find-type:** 5 (comment that outlived its code) / 7
- **hash:** `3203d3eab6bdd12fdad7ded1860db16a89468c3f`
- **date:** 2014-07-10 03:20:34 +0000
- **author:** Gary D. Gregory `<ggregory@apache.org>`
- **message:** `[LOG4J2-703] Android: Could not find class 'javax.naming.InitialContext', referenced from method org.apache.logging.log4j.core.lookup.JndiLookup.lookup.`

```
git -C ~/book16/repos/log4j2 show 3203d3eab6 -- '*Interpolator.java'
```

```
-        lookups.put("jndi", new JndiLookup());
+        try {
+            lookups.put("jndi", new JndiLookup());
+        } catch (Exception e) {
+            // [LOG4J2-703] We might be on Android
+            // java.lang.VerifyError: org/apache/logging/log4j/core/lookup/JndiLookup
+            LOGGER.warn(
+                    "JNDI lookup class is not available because this JRE does not support JNDI. ...",
+                    e);
+        }
```

Two months earlier (`c44856afae`, 2014-05-04, Matt Sicker) the same file gained `// TODO: this ought to use the PluginManager` above a hardcoded list that already included `jndi`. That TODO is still there when this try/catch is added. It will still be there in December 2021.

**Why it is a story.** A platform without JNDI *crashes interpolator construction*. The fix is not "JNDI is optional and off." The fix is "if the class will not load, log a warning and keep going — with JNDI still on everywhere it does load." They have now treated JNDI as a best-effort plugin for classloading purposes, and as a default-on verb everywhere else. The 03:20 UTC timestamp is a small human detail: this is a night commit about a VerifyError.

**What the reader learns.** "Make it not crash on Android" is not the same as "make it opt-in." An optional dependency that is default-on is not optional. The try/catch that swallows linkage errors is often the moment you *almost* decided the feature was dangerous.

**surprise:** 3

---

## 6. Camel users hit `${` in log lines; the off switch defaults to on

- **find-type:** 7 (feature that became the vulnerability)
- **hashes:** `6a4c88d4ae85f6a70843df23e0781becc790c821`, `dd18e9b21009055e226daf5b233c92b6a17934ca`
- **dates:** 2016-08-19 00:31:44 -0700; 2017-11-09 08:32:14 -0500 (committed 2017-11-12)
- **authors:** Gary Gregory; Carter Kozak (committed by Mikael Ståldal)
- **messages:** `[LOG4J2-905] Ability to disable (date) lookup completely, compatibility issues with other libraries like Camel.` / `LOG4J2-2109: Added "log4j.formatMsgNoLookups" global configuration`

```
git -C ~/book16/repos/log4j2 show --stat --format=fuller 6a4c88d4ae
git -C ~/book16/repos/log4j2 show dd18e9b210 -- '*Constants.java'
```

```
AuthorDate: Fri Aug 19 00:31:44 2016 -0700
    [LOG4J2-905] Ability to disable (date) lookup completely, compatibility
    issues with other libraries like Camel.
+    private static final String NOLOOKUPS = "nolookups";
+        this.noLookups = noLookupsIdx >= 0;
 6 files changed, 223 insertions(+), 16 deletions(-)
```

```
+     * LOG4J2-2109 if {@code true}, MessagePatternConverter will always operate as though
+     * <pre>%m{nolookups}</pre> is configured.
+    public static final boolean FORMAT_MESSAGES_PATTERN_DISABLE_LOOKUPS = ...
+            "log4j.formatMsgNoLookups", false);
```

**Why it is a story.** In 2016 a user of Apache Camel reports that date-like `${...}` in a *message* is being eaten by Log4j. The maintainers add `%m{nolookups}` — an opt-in to *not* treat the message as a program. Default remains: treat it as a program. In 2017 Carter Kozak adds a JVM-wide kill switch so you do not have to remember the converter option. The default is `false`: lookups stay on. The comments are about Camel compatibility and CPU, not remote code execution. The off switch now exists in every 2.10+ install. Almost nobody turns it. Four years later the entire internet will be told to set `log4j.formatMsgNoLookups=true`.

**What the reader learns.** If users file a ticket that your interpolator is firing on *their* strings, that is not a compatibility bug. That is the interpolator seeing data as code. An off switch whose default is on is a comment, not a mitigation.

**surprise:** 5

---

## 7. Eleven days before the CVE, "this feature is not used"

- **find-type:** 7
- **hash:** `001aaada7dab82c3c09cde5f8e14245dc9d8b454`
- **date:** authored 2021-11-29 14:20:33 +0000; committed 2021-12-04 22:47:24 -0700 by Ralph Goers
- **author:** Carter Kozak `<ckozak@apache.org>`
- **message:** `LOG4J2-3198: Log4j2 no longer formats lookups in messages by default`

```
git -C ~/book16/repos/log4j2 log -1 --format=fuller 001aaada7d
git -C ~/book16/repos/log4j2 log -1 --format='%B' 001aaada7d
```

```
AuthorDate: Mon Nov 29 14:20:33 2021 +0000
CommitDate: Sat Dec 4 22:47:24 2021 -0700
    LOG4J2-3198: Log4j2 no longer formats lookups in messages by default

Lookups in messages are confusing, and muddy the line between logging APIs
and implementation. ...
There's also a cost to searching formatted message strings for particular
escape sequences which define lookups. This feature is not used as far as
we've been able to tell searching github and stackoverflow, so it's
unnecessary for every log event in every application to burn several cpu
cycles searching for the value.
```

Alibaba privately reported the RCE around 24 November 2021. This commit is authored five days later. The message never says "security." It says the feature is unused (they grepped GitHub and Stack Overflow) and costs cycles. Ralph merges it on 4 December, the same evening he lands `d82b47c6fa` / `c77b3cb393` limiting JNDI protocols. The public CVE is still a week away.

**Why it is a story.** The last calm sentence in the file is "this feature is not used." They are right that almost nobody *wanted* message lookups. They are about to be shown that everybody *had* them. Whether Carter is already responding to the private report and choosing not to write "RCE" in a still-private git log, or is independently killing a misfeature the same week, the timestamp is the story: the default flip lands before the world has a name for it.

**What the reader learns.** "We grepped GitHub; nobody uses this" is not an argument that the code is safe. It is an argument that you can change the default. Do that the first time you think it, not the week a vendor is already in your inbox.

**surprise:** 4

---

## 8. They commit `JndiExploit.java` on a Saturday night, then patch three more times

- **find-type:** 8 (rollback of the world)
- **hashes:**
  - `d82b47c6fae9c15fcb183170394d5f1a01ac02d3` 2021-12-04 21:00:58 -0700 Ralph Goers — `LOG4J2-3201 - Limit the protocols JNDI can use by default...`
  - `c77b3cb39312b83b053d23a2158b99ac7de44dd3` 2021-12-04 21:03:32 -0700 Ralph / GitHub — `Restrict LDAP access via JNDI (#608)`
  - `44569090f1cf1e92c711fb96dfd18cd7dccc72ea` 2021-12-11 16:05:58 -0700 Ralph — `LOG4J2-3208 - Disable JNDI by default`
  - `70edc233343815d5efa043b54294a6fb065aa1c5` 2021-12-13 20:10:27 -0700 Ralph — `Disable JNDI Lookup and Lookups in MessagePatternConverter`
  - `27972043b76c9645476f561c5adc483dec6d3f5d` 2021-12-12 22:32:00 -0700 Ralph — `LOG4J2-3211 - Remove Messge Lookups (#623)`
  - `5bad9ce0e84bd527bff052d65871811685f66dfd` authored 2021-12-16, committed 2022-01-07 Carter — `Fix string substitution recursion`
- **tags:** `rel/2.15.0` 2021-12-09; `rel/2.16.0` 2021-12-12 23:40; `rel/2.17.0` 2021-12-17

```
git -C ~/book16/repos/log4j2 show d82b47c6fa -- '*JndiExploit.java'
git -C ~/book16/repos/log4j2 show 70edc23334 -- '*Interpolator.java' '*JndiLookup.java'
git -C ~/book16/repos/log4j2 log -1 --format='%h %ad %an %s' --date=iso rel/2.15.0 rel/2.16.0 rel/2.17.0
```

```
+public class JndiExploit implements ObjectFactory {
+        fail("getObjectInstance must not be allowed");
+        return null;
```

```
+                if (!clazz.getName().equals("org.apache.logging.log4j.core.lookup.JndiLookup")) {
+                    strLookupMap.put(entry.getKey().toLowerCase(), ReflectionUtil.instantiate(clazz));
+        LOGGER.warn("Attempt to use JNDI Lookup");
+        return RESULT;   // "JNDI is not supported"
```

```
c30a1398a6 2021-12-09 11:24:32 -0700 Ralph Goers [maven-release-plugin] prepare release log4j-2.15.0-rc2
cffe58f6a4 2021-12-12 23:40:13 -0600 Matt Sicker [maven-release-plugin] prepare release log4j-2.16.0-rc1
a19ef9bcee 2021-12-17 18:56:20 -0700 Ralph Goers [maven-release-plugin] prepare release log4j-2.17.0-rc1
```

**Why it is a story.** Saturday 4 December, 21:00 Colorado time: they check in a class named `JndiExploit` so the test suite can fail if LDAP object factories still run, and they limit protocols. That incomplete fence becomes 2.15.0 on 9 December (CVE-2021-44228 public). Thread-context and other lookup paths still reach JNDI (CVE-2021-45046). Sunday night the 12th they cut 2.16.0, stub `JndiLookup.lookup()`, and — because `Interpolator` now *does* use PluginManager — skip the class by hard-coded FQCN so the `@Plugin` annotation cannot put it back. Recursion in `StrSubstitutor` (the 946-line 2010 copy) is still a DoS; 2.17.0 follows on the 17th (CVE-2021-45105). On 31 December Gary Gregory is still reverting commits (`ddaea036f0`). The world is rolling back jars; the git log is rolling back the design, one release a night.

**What the reader learns.** The first security patch is a hypothesis. If you "limit protocols" you have not removed the evaluator. If you leave a `@Plugin` on the dangerous class, the plugin loader will resurrect it. Name the exploit in the test (`JndiExploit`) the same day you think you have fixed it — and assume you have not.

**surprise:** 3 (the cascade is famous; `JndiExploit` and the FQCN exclude are not)

---

## 9. Remko Popma's nine years, then Piotr

- **find-type:** 4 (name that disappears / appears)
- **hashes:** `d2f11a530d` (Remko first, 2013-04-26); `448b057cf0` (Remko last, 2022-04-27); `af5d3b589b` / `b03d760893` (Piotr first, 2022-02)
- **authors:** rpopma / Remko Popma; Piotr P. Karwasz

```
git -C ~/book16/repos/log4j2 shortlog -sn --all | head -16
git -C ~/book16/repos/log4j2 log --all --author='rpopma' --format='%ad %h %s' --date=short --reverse | head -1
git -C ~/book16/repos/log4j2 log --all --author='Remko Popma' --format='%ad %h %s' --date=short -1
git -C ~/book16/repos/log4j2 log --all --author='Piotr P. Karwasz' --format='%ad %h %s' --date=short --reverse | head -3
```

```
  3456  Gary Gregory
  2400  ASF Logging Services RM
  2136  rpopma
  2007  Ralph Goers
  1865  Matt Sicker
  1795  Piotr P. Karwasz
  1463  Gary D. Gregory
  1122  ggregory
   853  Volkan Yazıcı
   ...
   330  Carter Kozak
2013-04-26 d2f11a530d Fix for Log4j2-217: ensure PluginManager streams are always closed
2022-04-27 448b057cf0 LOG4J2-3473 (DOC) fix version number
2022-02-21 b03d760893 Provide a uniform Log4j 1.x message factory
2022-02-25 af5d3b589b [LOG4J-3413] Fixes resolution of non-Log4j properties
```

Windows: 2010–2012 is Ralph + Gary + two weeks of Curtis William Arnold (last commit 2010-06-01). 2013–2016 is Remko (`rpopma`) leading the count. 2021 is still Gary/Ralph/Carter/Remko. 2022–2023 Piotr arrives (February, eight weeks after Log4Shell) and takes the lead. 2024–2026 the top name is `ASF Logging Services RM` (2,217), a release bot; Piotr is second; Ralph is down to 12.

**Why it is a story.** The person who built the experimental branch (`rgoers`) is still merging the December 2021 patches. The person who owned the mid-2010s (`rpopma`) spends that December writing security docs in `+0900` and is gone by April 2022. The person who will own the next four years (`ppkarwasz`) does not appear until the fire is out. Gary Gregory is one human split across three `shortlog` identities (6,041 commits if you add them). After 2023 a bot outruns every human.

**What the reader learns.** `git shortlog -sn` lies when one person has three names, and it hides a handover that happens *after* a crisis. Slice by year. The name that will matter in five years may not be in the repo yet. The name that built the dangerous feature may still be the one cutting the emergency release.

**surprise:** 3

---

## 10. The PluginManager TODO sits from 2014 until after the fire

- **find-type:** 5 (comment/TODO that outlived its code)
- **hashes:** `c44856afae1220478b979f6855d4355da9c50f9b` (added 2014-05-04); `c062f55318cac4205c7f7606b8e3091f67999516` (removed 2022-01-21)
- **authors:** mattsicker; Carter Kozak
- **messages:** `Initial migration of servlet code to log4j-web.` / `LOG4J2-3358: Fix substitutions when programmatic configuration is used (#726)`

```
git -C ~/book16/repos/log4j2 log --all --format='%h %ad %an %s' --date=short -S 'this ought to use the PluginManager' -- '*.java'
```

```
c062f55318 2022-01-21 Carter Kozak LOG4J2-3358: Fix substitutions when programmatic configuration is used (#726)
7ca3c4f5f2 2022-01-21 Carter Kozak LOG4J2-3358: ...
c44856afae 2014-05-04 mattsicker Initial migration of servlet code to log4j-web.
```

Matt Sicker, moving `WebLookup` to another module, hardcodes the lookup list and writes `// TODO: this ought to use the PluginManager`. The 2010 interpolator *already* knew how to collect lookup plugins. The TODO survives the Android try/catch, the Camel off switch, the 2017 property, and the entire December 2021 cascade. When Carter finally merges the code paths in January 2022 so every constructor loads plugins, that is *why* the 13 December emergency patch had to exclude `JndiLookup` by string FQCN: the annotation would have put it back.

**Why it is a story.** A TODO that says "use the plugin system" looks like hygiene. In this file it is a fork in the road: two constructors, two sets of lookups, one of them hardcoded to include JNDI. For eight years nobody had to resolve the tension. The week they do, the plugin system is a load-bearing part of the vulnerability.

**What the reader learns.** A TODO on a security-sensitive registry is not hygiene. Two construction paths for an interpolator means two allow-lists. `git log -S 'this ought to use the PluginManager'` is how you find the ones that outlived the assumption.

**surprise:** 4

---

## Ranked top-3

1. **Dig 3 — `8916625d91` (2012-09-23).** Two lines, "to improve performance," make `%m` run the interpolator on user text. That is the blast radius. JNDI is just a verb that arrived later.
2. **Dig 6 — `6a4c88d4ae` + `dd18e9b210` (2016–2017).** Users already reported `${` firing on their messages. The project shipped `%m{nolookups}` and `log4j.formatMsgNoLookups` and left both default-off. The mitigation the world scrambled for in 2021 had been in the jar since 2.10.
3. **Dig 4 — `f1a0cac60f` (2013-07-18).** One `lookups.put("jndi", new JndiLookup())` and a documented "if the key contains a `:` no prefix will be added." The colon is the hole; the docs are the receipt.

## Disappointing

The December 2021 commit messages are already a public postmortem — the surprising objects are earlier and quieter — and `git log -S` is half-choked by years of generated Antora/site commits plus a release bot (`ASF Logging Services RM`) that now out-counts every human; the 2008 prototype named in Curtis's 2010 commit is not in this git at all.
