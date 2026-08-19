#!/usr/bin/env bash
# Receipts for chapter 02 (log4j2 / Log4Shell as a causal chain). Clone at repos/log4j2.
cd "$(dirname "$0")/.."
repo=repos/log4j2
out=chapters/02-log4j2.receipts.md
r() { cap=$1; shift; echo '```'; printf '$ git -C repos/log4j2'; printf ' %q' "$@"; echo; git -C "$repo" "$@" 2>&1 | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — ch. 02 log4j2 (Log4Shell, CVE-2021-44228)"
echo
echo "Verbatim outputs against a full clone of https://github.com/apache/logging-log4j2."
echo "Regenerate with \`scripts/receipts-02.sh\`. Long outputs truncated editorially (head)."
echo
echo "## R1 — 2010: variable substitution arrives, with a plugin loader"
r 8 show --format=fuller --stat 2338fcb9fb
echo "## R2 — 2012: the pivot — 'to improve performance', %m now interpolated"
r 6 show --format='%H%n%an%n%aI%n%s' 8916625d91
echo '```'; echo "\$ git -C repos/log4j2 show 8916625d91 -- '*MessagePatternConverter.java' | grep -A1 'contains'"; git -C "$repo" show 8916625d91 -- '*MessagePatternConverter.java' | grep -A1 'contains("\${"' | head -4; echo '```'; echo
echo "## R3 — 2013: one lookups.put('jndi'...) and the documented colon"
r 6 show --format='%H%n%an%n%aI%n%s' f1a0cac60f
echo '```'; echo "\$ git -C repos/log4j2 show f1a0cac60f | grep -E 'lookups.put..jndi|indexOf..:... == -1|no prefix will be added'"; git -C "$repo" show f1a0cac60f 2>/dev/null | grep -E "lookups.put..jndi|indexOf..:... == -1|no prefix will be added" | head -6; echo '```'; echo
echo "## R4 — 2016: the off switch is added (default off)"
r 8 show --format=fuller --stat 6a4c88d4ae
echo "## R5 — 2017: the JVM-wide kill switch, default false"
echo '```'; echo "\$ git -C repos/log4j2 show dd18e9b210 -- '*Constants.java' | grep -A1 FORMAT_MESSAGES_PATTERN_DISABLE_LOOKUPS"; git -C "$repo" show dd18e9b210 -- '*Constants.java' | grep -A1 'FORMAT_MESSAGES_PATTERN_DISABLE_LOOKUPS =' | head -2; echo '```'; echo
echo "## R6 — 2021, eleven days before the CVE: 'this feature is not used'"
r 4 log -1 --format='%H%nAuthorDate: %aI%nCommitDate: %cI' 001aaada7d
r 14 log -1 --format='%B' 001aaada7d
echo "## R7 — the fire: JndiExploit.java checked in with the first limiting patch"
r 8 show d82b47c6fa --stat
echo '```'; echo "\$ git -C repos/log4j2 show d82b47c6fa -- '*JndiExploit.java' | grep -E 'class JndiExploit|fail'"; git -C "$repo" show d82b47c6fa -- '*JndiExploit.java' | grep -E 'class JndiExploit|fail\(' | head -4; echo '```'; echo
echo "## R8 — 2.16 excludes JndiLookup by hard-coded FQCN (the plugin loader would resurrect it)"
r 12 show 70edc23334 -- '*Interpolator.java'
echo "## R9 — the PluginManager TODO that made the FQCN exclude necessary (2014-2022)"
r 4 log --all --format='%h %ad %an %s' --date=short -S 'this ought to use the PluginManager' -- '*.java'
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
