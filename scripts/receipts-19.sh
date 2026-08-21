#!/usr/bin/env bash
# Receipts for chapter 19 (OpenTTD — the 320 creed-revert).
cd "$(dirname "$0")/.."
out=chapters/19-openttd.receipts.md
g() { desc=$1; cmd=$2; cap=$3; echo '```'; echo "$ $desc"; eval "$cmd" 2>&1 | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — ch. 19 OpenTTD (the \`320\` creed-revert)"
echo
echo "Verbatim outputs against a full clone of OpenTTD/OpenTTD."
echo "Regenerate with \`scripts/receipts-19.sh\`. Outputs are pinned to explicit commits; long outputs are truncated editorially with \`sed\` or \`head\`."
echo
echo "## R1 — the complete lineage of the asymmetric town-growth table"
g "git -C repos/openttd log --reverse -S '{ 320, 420, 300' --format='%H%n%aI %an <%ae>%n%s' 4d4f8bff38d200fbcfda11789bd69259ebbefd17 -- src/town_cmd.cpp" "git -C repos/openttd log --reverse -S '{ 320, 420, 300' --format='%H%n%aI %an <%ae>%n%s' 4d4f8bff38d200fbcfda11789bd69259ebbefd17 -- src/town_cmd.cpp" 12
echo "## R2 — 2007: maedhros labels the default as TTD's original rate"
g "git -C repos/openttd show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' 61fe35688046b7ef36305ebd92b79bfcc535783f" "git -C repos/openttd show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' 61fe35688046b7ef36305ebd92b79bfcc535783f" 12
echo "## R3 — the original hunk: \`320\` arrives beside the one-in-twelve malus"
g "git -C repos/openttd show --format='' --no-ext-diff 61fe35688046b7ef36305ebd92b79bfcc535783f -- src/town_cmd.cpp | sed -n '28,59p'" "git -C repos/openttd show --format='' --no-ext-diff 61fe35688046b7ef36305ebd92b79bfcc535783f -- src/town_cmd.cpp | sed -n '28,59p'" 33
echo "## R4 — 2019: the clone records one commit by the author identity \`Yourself\`"
g "git -C repos/openttd log 4d4f8bff38d200fbcfda11789bd69259ebbefd17 --author='kyle\\.smith314@gmail\\.com' --reverse --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%s'" "git -C repos/openttd log 4d4f8bff38d200fbcfda11789bd69259ebbefd17 --author='kyle\\.smith314@gmail\\.com' --reverse --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%s'" 6
g "git -C repos/openttd rev-list 4d4f8bff38d200fbcfda11789bd69259ebbefd17 --count --author='kyle\\.smith314@gmail\\.com'" "git -C repos/openttd rev-list 4d4f8bff38d200fbcfda11789bd69259ebbefd17 --count --author='kyle\\.smith314@gmail\\.com'" 1
echo "## R5 — the proposed fix: one cell, from \`320\` to \`420\`"
g "git -C repos/openttd show --format='' --no-ext-diff 7e22f243ed3b324df3da9dba5594c14b4e6794a0 -- src/town_cmd.cpp" "git -C repos/openttd show --format='' --no-ext-diff 7e22f243ed3b324df3da9dba5594c14b4e6794a0 -- src/town_cmd.cpp" 15
echo "## R6 — 2019-11-20: frosch states the replication creed and the non-correlation reason"
g "git -C repos/openttd show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' 61dba850af737cd49d1bb344dafd7a91a18895bf" "git -C repos/openttd show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' 61dba850af737cd49d1bb344dafd7a91a18895bf" 9
echo "## R7 — the revert restores \`320\` and writes the hidden rule beside it"
g "git -C repos/openttd show --format='' --no-ext-diff 61dba850af737cd49d1bb344dafd7a91a18895bf -- src/town_cmd.cpp" "git -C repos/openttd show --format='' --no-ext-diff 61dba850af737cd49d1bb344dafd7a91a18895bf -- src/town_cmd.cpp" 22
echo "## R8 — immediate aftermath: against the pre-fix tree, only the explanation remains"
g "git -C repos/openttd diff --no-ext-diff 7e22f243ed3b324df3da9dba5594c14b4e6794a0^ 61dba850af737cd49d1bb344dafd7a91a18895bf -- src/town_cmd.cpp" "git -C repos/openttd diff --no-ext-diff 7e22f243ed3b324df3da9dba5594c14b4e6794a0^ 61dba850af737cd49d1bb344dafd7a91a18895bf -- src/town_cmd.cpp" 18
echo "## R9 — 2023: a mechanical integer-type migration changes the table's type, not its values or note"
g "git -C repos/openttd show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%s' eaae0bb5e71b237cc1fe1388ab74e6bd3aa0c69e" "git -C repos/openttd show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%s' eaae0bb5e71b237cc1fe1388ab74e6bd3aa0c69e" 7
g "git -C repos/openttd show --format='' --no-ext-diff eaae0bb5e71b237cc1fe1388ab74e6bd3aa0c69e -- src/town_cmd.cpp | sed -n '326,340p'" "git -C repos/openttd show --format='' --no-ext-diff eaae0bb5e71b237cc1fe1388ab74e6bd3aa0c69e -- src/town_cmd.cpp | sed -n '326,340p'" 16
echo "## R10 — at the audited 2026 tip, the explanation and \`320\` still belong to the revert"
g "git -C repos/openttd show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%s' 4d4f8bff38d200fbcfda11789bd69259ebbefd17" "git -C repos/openttd show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%s' 4d4f8bff38d200fbcfda11789bd69259ebbefd17" 6
g "git -C repos/openttd show 4d4f8bff38d200fbcfda11789bd69259ebbefd17:src/town_cmd.cpp | sed -n '3860,3875p'" "git -C repos/openttd show 4d4f8bff38d200fbcfda11789bd69259ebbefd17:src/town_cmd.cpp | sed -n '3860,3875p'" 17
g "git -C repos/openttd blame -l --date=iso-strict -L 3862,3869 4d4f8bff38d200fbcfda11789bd69259ebbefd17 -- src/town_cmd.cpp" "git -C repos/openttd blame -l --date=iso-strict -L 3862,3869 4d4f8bff38d200fbcfda11789bd69259ebbefd17 -- src/town_cmd.cpp" 9
echo "## R11 — the project's own README at the audited tip names the original game"
g "git -C repos/openttd show 4d4f8bff38d200fbcfda11789bd69259ebbefd17:README.md | sed -n '23p'" "git -C repos/openttd show 4d4f8bff38d200fbcfda11789bd69259ebbefd17:README.md | sed -n '23p'" 2
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
