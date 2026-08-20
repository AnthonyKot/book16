#!/usr/bin/env bash
# Receipts for chapter 15 (postgres — the refusals of Tom Lane).
cd "$(dirname "$0")/.."
out=chapters/15-postgres.receipts.md
g() { desc=$1; cmd=$2; cap=$3; echo '```'; echo "$ $desc"; eval "$cmd" 2>&1 | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — ch. 15 postgres (the refusals of Tom Lane)"
echo
echo "Verbatim outputs against a full clone of postgres/postgres."
echo "Regenerate with \`scripts/receipts-15.sh\`. Long outputs truncated editorially (head)."
echo
echo "## R1 — day one, 1996: the magic number and the XXX that promised to replace it"
g "git -C repos/postgres show d31084e9d1:src/backend/optimizer/plan/initsplan.c | sed -n '195,198p'" "git -C repos/postgres show d31084e9d1118b25fd16580d9d8c2924b5740dff:src/backend/optimizer/plan/initsplan.c | sed -n '195,198p'" 6
echo "## R2 — the confession the estimate came wrapped in, dated in the source itself"
g "git -C repos/postgres show d31084e9d1:src/backend/optimizer/path/clausesel.c | sed -n '242,245p'" "git -C repos/postgres show d31084e9d1118b25fd16580d9d8c2924b5740dff:src/backend/optimizer/path/clausesel.c | sed -n '242,245p'" 6
echo "## R3 — 2015: Tom Lane has a better estimator, and declines to use it"
g "git -C repos/postgres log -1 --format='%h %ai %an%n%s' 39df0f150c" "git -C repos/postgres log -1 --format='%h %ai %an%n%s' 39df0f150ca69fac1c89537065ddc97af18921b8" 3
g "git -C repos/postgres log -1 --format='%b' 39df0f150c | grep -iE 'twenty-three|survived|not to do' | head -4" "git -C repos/postgres log -1 --format='%b' 39df0f150ca69fac1c89537065ddc97af18921b8 | grep -iE 'twenty-three|survived|not to do' | head -4" 5
echo "## R4 — 2025: a later patch dropped the estimate; Tom puts it back and warns the next person"
g "git -C repos/postgres log -1 --format='%h %ai %an%n%s' 1eccb93150" "git -C repos/postgres log -1 --format='%h %ai %an%n%s' 1eccb93150707acfcc8f24556a15742a6313c8ac" 3
g "git -C repos/postgres blame -L 1606,1612 HEAD -- src/backend/utils/adt/selfuncs.c" "git -C repos/postgres blame -L 1606,1612 HEAD -- src/backend/utils/adt/selfuncs.c" 8
echo "## R5 — the estimate is still on HEAD, thirty-three years on"
g "git -C repos/postgres grep -n '0.3333333' HEAD -- src/backend/utils/adt/selfuncs.c | head -1" "git -C repos/postgres grep -n '0.3333333' HEAD -- src/backend/utils/adt/selfuncs.c | head -1" 2
echo "## R6 — 2023: the feature Tom would not write, landed as a warning"
g "git -C repos/postgres log -1 --format='%h %ai %an%n%s%n%n%b' af3ee8a086 | head -8" "git -C repos/postgres log -1 --format='%h %ai %an%n%s%n%n%b' af3ee8a086ca210d9461f813538d0169dbf07c2c | head -8" 9
echo "## R7 — the diff: a grammar rule whose only job is to refuse, and list why"
g "git -C repos/postgres show af3ee8a086 -- src/backend/parser/gram.y | grep -E '^\+' | grep -vE '^\+\+\+' | sed -n '3,14p'" "git -C repos/postgres show af3ee8a086ca210d9461f813538d0169dbf07c2c -- src/backend/parser/gram.y | grep -E '^\+' | grep -vE '^\+\+\+' | sed -n '3,14p'" 13
echo "## R8 — the scale of the hand: first commit, count, and it is not a feature"
g "git -C repos/postgres log --author='Tom Lane' --reverse --format='%h %ai %s' | head -1" "git -C repos/postgres log --author='Tom Lane' --reverse --format='%h %ai %s' | head -1" 2
g "git -C repos/postgres rev-list --count --author='Tom Lane' HEAD" "git -C repos/postgres rev-list --count --author='Tom Lane' HEAD" 1
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
