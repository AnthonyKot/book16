#!/usr/bin/env bash
# Receipts for chapter 05 (git / the 01:10 hash flip). Clone at repos/git.
cd "$(dirname "$0")/.."
repo=repos/git
out=chapters/05-git.receipts.md
r() { cap=$1; shift; echo '```'; printf '$ git -C repos/git'; printf ' %q' "$@"; echo; git -C "$repo" "$@" 2>&1 | head -n "$cap"; echo '```'; echo; }
g() { desc=$1; cmd=$2; pat=$3; cap=$4; echo '```'; echo "$ $desc"; eval "$cmd" 2>/dev/null | grep -E "$pat" | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — ch. 05 git (the 01:10 hash flip)"
echo
echo "Verbatim outputs against a full clone of https://github.com/git/git."
echo "Regenerate with \`scripts/receipts-05.sh\`. Long outputs truncated editorially (head)."
echo
echo "## R1 — day one: 2005-04-07 15:13, 11 files, 1,244 lines"
r 20 show --stat --format='%H%n%ai %an%n%s' e83c5163316f89bfbde7d9ab23ca2e25604af290
echo "## R2 — the day-one README defines the object name: hash of the COMPRESSED bytes"
g "git -C repos/git show e83c5163:README | sed -n '31,34p'" "git -C \"$repo\" show e83c5163316f89bfbde7d9ab23ca2e25604af290:README | sed -n '31,34p'" "." 4
echo "## R3 — 177 seconds later: 'So copyright it.'"
r 8 show -s --format='%H%n%ai %an%n%ct%n%B' 8bc9a0c769ac1df7820f2dbf8f7b7d64835e3c68
g "epoch delta: 1112912170 - 1112911993 = 177 seconds" "git -C \"$repo\" show -s --format='%ct %s' e83c5163316f89bfbde7d9ab23ca2e25604af290 8bc9a0c769ac1df7820f2dbf8f7b7d64835e3c68" "." 2
echo "## R4 — the hand-made weeks: a commit that claims two scripts, tree identical to its parent"
r 6 show -s --format='%H%n%ai %an%n%s%n%b%ntree   %T' e90a4c0ed17b66c302f48ec0a234cac6f27e5eec
g "parent tree is the same object; diff is empty" "git -C \"$repo\" show -s --format='parent-tree %T' e90a4c0ed17b66c302f48ec0a234cac6f27e5eec^; git -C \"$repo\" diff --quiet e90a4c0ed17b66c302f48ec0a234cac6f27e5eec^ e90a4c0ed17b66c302f48ec0a234cac6f27e5eec && echo 'diff EMPTY'" "." 2
echo "## R5 — 2005-04-20 01:10:46: 'Do SHA1 hash _before_ compression.'"
r 14 show --stat --format='%H%n%ai %an%n%B' d98b46f8d9a3daf965a39f8c0089c1401e0081ee
g "the four lines in sha1_file.c: hash the buffer, not the zlib stream" "git -C \"$repo\" show d98b46f8d9a3daf965a39f8c0089c1401e0081ee -- sha1_file.c" "^[+-].*SHA1_(Init|Update|Final)" 8
echo "## R6 — 01:34:54, twenty-four minutes later: blobs were missed"
r 5 show -s --format='%H%n%ai %an%n%s%n%b' f18ca7316631914776136455c151d70318299459
g "update-cache.c: the blob header 'blob %lu' now hashed with the raw content" "git -C \"$repo\" show f18ca7316631914776136455c151d70318299459 -- update-cache.c" "^[+-].*(blob|SHA1_Update|metadata)" 8
echo "## R7 — the same night's commit does NOT touch README; the founding rule stays false"
g "git -C repos/git show d98b46f8d9:README | sed -n '68,70p'  (README as of the flip commit)" "git -C \"$repo\" show d98b46f8d9a3daf965a39f8c0089c1401e0081ee:README | sed -n '68,70p'" "." 3
echo "## R8 — 32 days later the definition is corrected by a patch that says 'formatting changes only'"
r 6 show -s --format='%H%n%ai %an%n%s%n%b' 8ac866a869a61d382486ace6ea39f9741d9159f8
g "the hunk: name = hash of the original data; old rule demoted to 'historical note'" "git -C \"$repo\" show 8ac866a869a61d382486ace6ea39f9741d9159f8 -- README" "^[+-]to name the object|^\+in the dawn|^\+object\)|^-the original data" 5
echo "## R9 — convert-cache lives five months and dies in the Big tool rename"
g "git -C repos/git log --diff-filter=D --format='%h %ai %an %s' -- convert-cache.c" "git -C \"$repo\" log --diff-filter=D --format='%h %ai %an %s' -- convert-cache.c" "." 2
echo "## R10 — the rule, runnable anywhere: object name = sha1('blob <len>\\\\0' + raw bytes)"
g "printf 'hello' | git hash-object --stdin ; printf 'blob 5\\\\0hello' | sha1sum" "printf 'hello' | git -C \"$repo\" hash-object --stdin; printf 'blob 5\\0hello' | sha1sum" "." 3
echo "## R11 — this clone today: every object named by the 01:10 rule"
r 4 count-objects -vH
echo "## R12 — how committing worked that night: the README's own instructions (as of 2005-04-17)"
g "git -C repos/git show 6ad6d3d36c:README | sed -n '363,374p'" "git -C \"\$repo\" show 6ad6d3d36c5924c8ff502ebbb6a6216df01e7efb:README | sed -n '363,374p'" "." 12
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
