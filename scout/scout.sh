#!/usr/bin/env bash
# scout/scout.sh [-e grok|codex] [names...] — one agent run per repo, in parallel, on already-cloned repos.
# Default engine grok (cheap). Output: scout/<name>.md written by the agent; stdout/err in scout/log/.
cd "$(dirname "$0")/.."; mkdir -p scout/log
engine=grok; [ "${1:-}" = "-e" ] && { engine=$2; shift 2; }
names="${*:-$(awk '{print $1}' scout/repos.txt)}"
for n in $names; do
  [ -d "repos/$n/.git" ] || { echo "skip $n (not cloned)"; continue; }
  p="$(cat scout/prompt_$n.txt)
NOTE: the repository is ALREADY cloned at $(pwd)/repos/$n — do not clone again. Repo root for writing: $(pwd). Write the report with a shell heredoc or file-write tool to $(pwd)/scout/$n.md."
  ( cd "$(pwd)"
    if [ $engine = grok ]; then grok --always-approve --max-turns 80 -p "$p" > "scout/log/$n.out" 2> "scout/log/$n.err"
    else codex exec --skip-git-repo-check -s workspace-write -C "$(pwd)" "$p" < /dev/null > "scout/log/$n.out" 2> "scout/log/$n.err"; fi
    printf '%-14s report %7s bytes  log %7s bytes\n' "$n" "$(wc -c < scout/$n.md 2>/dev/null || echo 0)" "$(wc -c < scout/log/$n.out)" ) &
done
wait; echo "reports in scout/"
