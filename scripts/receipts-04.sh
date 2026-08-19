#!/usr/bin/env bash
# Receipts for chapter 04 (xz / Jia Tan, CVE-2024-3094). Clone at repos/xz.
cd "$(dirname "$0")/.."
repo=repos/xz
out=chapters/04-xz.receipts.md
r() { cap=$1; shift; echo '```'; printf '$ git -C repos/xz'; printf ' %q' "$@"; echo; git -C "$repo" "$@" 2>&1 | head -n "$cap"; echo '```'; echo; }
g() { desc=$1; cmd=$2; pat=$3; cap=$4; echo '```'; echo "$ $desc"; eval "$cmd" 2>/dev/null | grep -E "$pat" | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — ch. 04 xz (Jia Tan, CVE-2024-3094)"
echo
echo "Verbatim outputs against a full clone of https://github.com/tukaani-project/xz."
echo "Regenerate with \`scripts/receipts-04.sh\`. Long outputs truncated editorially (head)."
echo
echo "## R10 — before 2022, the project is one person"
r 3 shortlog -sn --until=2022-01-01 HEAD
echo "## R1 — 2022-01: 'jiat75' arrives with a NULL-check patch, committed by Lasse"
r 3 log --all --author='jiat75' --reverse --format='%h %aI %cI %an <%ae> | committer=%cn | %s'
echo "## R2 — 2022-08: the name is written into AUTHORS as co-maintainer"
r 16 show 692de534fa -- AUTHORS
echo "## R3 — 2023-06: Hans Jansen — a name that exists only to add ifunc"
r 4 log --all --author='Hans Jansen' --format='%h %aI %cn %s'
echo "## R4 — 2024-02-15: the weapon's name is added to m4/.gitignore, nine days before 5.6.0"
r 6 show 4323bc3e0c
echo "## R5 — build-to-host.m4 was never a tracked file; the string lives only in .gitignore"
r 3 log --all -S 'build-to-host' --format='%h %aI %s'
g "git -C repos/xz log --all --oneline -- m4/build-to-host.m4  # (no output = never tracked)" "git -C \"$repo\" log --all --oneline -- m4/build-to-host.m4" "." 5
echo "## R6 — 2024-02-26: one '.' inside the CMake Landlock check, hidden in a 'fix' commit"
r 6 show --format='%H%n%an%n%aI%n%s' 328c52da8a
g "git -C repos/xz show 328c52da8a -- CMakeLists.txt | grep -nE 'prctl|^\\+.*\\.\$|my_sandbox'" "git -C \"$repo\" show 328c52da8a -- CMakeLists.txt" "prctl\.h|^\+[[:space:]]*\.\$|my_sandbox" 6
echo "## R7 — 2024-03-30: Lasse removes the '.' — 'Fix sabotaged Landlock sandbox check. It never enabled it.'"
r 4 show --format='%H%n%an%n%aI%n%s%n%b' f9cf4c05ed
g "git -C repos/xz show f9cf4c05ed -- CMakeLists.txt | grep -E '^[+-][[:space:]]*\\.?\$'" "git -C \"$repo\" show f9cf4c05ed -- CMakeLists.txt" "^[+-][[:space:]]*\.?\$" 4
echo "## R8 — 2024-03-26 01:50: Jia's last act is to trim SECURITY.md"
r 4 show -s --format='%h %aI %cn %s' af071ef770
echo "## R9 — 2024-04: Lasse removes the backdoor and rewrites AUTHORS"
r 6 show -s --format='%H%n%an%n%aI%n%s' e93e13c8b3
g "git -C repos/xz show e93e13c8b3 | grep -E 'reverts|test files|disappeared|Backdoors are bad'" "git -C \"$repo\" show e93e13c8b3" "reverts the following|Tests: (Add|Update)|suddenly disappeared|Backdoors are bad" 6
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
