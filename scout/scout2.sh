#!/usr/bin/env bash
# scout/scout2.sh [names...] — second-opinion codex pass on already-scouted repos:
# verify the first report's top digs + find new digs. Max 4 concurrent codex runs.
# Output: scout/<name>.codex.md; logs scout/log/<name>.codex.{out,err}
cd "$(dirname "$0")/.."; mkdir -p scout/log
names="${*:-$(awk '{print $1}' scout/repos.txt)}"
for n in $names; do
  [ -d "repos/$n/.git" ] || { echo "skip $n (not cloned)"; continue; }
  [ -f "scout/$n.md" ]   || { echo "skip $n (no first report)"; continue; }
  while [ "$(jobs -rp | wc -l)" -ge 4 ]; do wait -n; done
  p="You are the second, independent scout of one public git repository for a book of git archaeology. Read $(pwd)/scout/BRIEF.md and follow its rules. The repo is ALREADY cloned at $(pwd)/repos/$n — do not clone or modify it; use 'git -C $(pwd)/repos/$n ...' for everything.

A first scout (a different model) already wrote $(pwd)/scout/$n.md. Read it. Your job is different from repeating it:

1) VERIFY: for the report's ranked top-3 digs plus any claim you doubt, rerun the exact commands it gives. Confirm hash, date, author, message and diff content match what the report claims. Produce a verification table: dig / claim / command rerun / PASS or FAIL / note. Flag subtle misdescriptions, not just wrong hashes.

2) EXTEND: find 3-6 NEW digs that are NOT in that report. Deliberately use angles the first scout did not: --all refs and stale branches, tags and tag messages, GPG signature presence/absence, .mailmap archaeology, octopus/odd merges, --follow and renames of famous files, committer-vs-author identity splits, empty commits, largest/smallest commits by --stat, git notes if any. Each new dig in the brief's format: title, find-type 1-8, hashes, date, author, message, exact reproducible command with 3-10 lines of its output, why it is a story (moment-before-the-outcome), what the reader learns about their own repos, surprise 1-5 rated honestly.

Write everything to $(pwd)/scout/$n.codex.md — verification table first, then new digs, then a 2-line verdict on the first report's reliability. Write the file with a shell heredoc or a file-write tool.

Return as your final message: counts (claims verified / failed) and your single best new dig in 3 lines. Nothing else."
  ( codex exec --skip-git-repo-check -s workspace-write -C "$(pwd)" "$p" \
      < /dev/null > "scout/log/$n.codex.out" 2> "scout/log/$n.codex.err"
    printf '%-14s codex report %7s bytes  log %7s bytes\n' "$n" \
      "$(wc -c < scout/$n.codex.md 2>/dev/null || echo 0)" "$(wc -c < scout/log/$n.codex.out)" ) &
done
wait; echo "second-opinion reports in scout/ (*.codex.md)"
