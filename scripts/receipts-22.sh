#!/usr/bin/env bash
# Receipts for source 22 (curl — the first commit is a recovery, not a beginning).
set -eu
export LC_ALL=C
cd "$(dirname "$0")/.."
out=chapters/22-curl.receipts.md
g() { desc=$1; cmd=$2; cap=$3; echo '```'; echo "$ $desc"; eval "$cmd" 2>&1 | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — source 22 curl (a recovery, then one maintainer across decades)"
echo
echo "Verbatim outputs against the curl/curl clone, pinned at \`695aa15743685a9d46c4c41bb9c95221d4659541\`."
echo "Regenerate with \`scripts/receipts-22.sh\`. Long outputs are selected or truncated by the commands shown."
echo
echo "## R1 — the Git root: 29 December 1999, \"Initial revision\", and already 37,273 lines"
g "git -C repos/curl rev-list --max-parents=0 695aa15743685a9d46c4c41bb9c95221d4659541" "git -C repos/curl rev-list --max-parents=0 695aa15743685a9d46c4c41bb9c95221d4659541" 2
g "git -C repos/curl show --shortstat --format='%H%nAuthorDate: %aI%nCommitDate: %cI%nAuthor: %an <%ae>%nSubject: %s' ae1912cb0d494b48d514d937826c9fe83ec96c4d" "git -C repos/curl show --shortstat --format='%H%nAuthorDate: %aI%nCommitDate: %cI%nAuthor: %an <%ae>%nSubject: %s' ae1912cb0d494b48d514d937826c9fe83ec96c4d" 10
echo "## R2 — the root is a working recovery tree: cache, logs, patches, a prior tarball, and a built executable"
g "git -C repos/curl ls-tree -r --long ae1912cb0d494b48d514d937826c9fe83ec96c4d | awk '\$5==\"CHANGES\" || \$5==\"Makefile\" || \$5==\"config.cache\" || \$5==\"config.log\" || \$5==\"config.status\" || \$5==\"curl-6.3.1.tar.gz\" || \$5==\"src/curl\" || \$5 ~ /^curl.*patch\$/'" "git -C repos/curl ls-tree -r --long ae1912cb0d494b48d514d937826c9fe83ec96c4d | awk '\$5==\"CHANGES\" || \$5==\"Makefile\" || \$5==\"config.cache\" || \$5==\"config.log\" || \$5==\"config.status\" || \$5==\"curl-6.3.1.tar.gz\" || \$5==\"src/curl\" || \$5 ~ /^curl.*patch\$/'" 13
echo "## R3 — what the root CHANGES literally opens with: curl 6.4 in December 1999"
g "git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | sed -n '1,25p'" "git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | sed -n '1,25p'" 27
echo "## R4 — five weeks before the root: the crash and the CVS copy, in the root's own CHANGES"
g "git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | sed -n '43,52p'" "git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | sed -n '43,52p'" 12
echo "## R5 — behind the DAG: the root CHANGES ends at HttpGet 1.0; repository history dates it to 1996"
g "git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | tail -12" "git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | tail -12" 14
g "git -C repos/curl show 695aa15743685a9d46c4c41bb9c95221d4659541:docs/HISTORY.md | sed -n '15,24p'" "git -C repos/curl show 695aa15743685a9d46c4c41bb9c95221d4659541:docs/HISTORY.md | sed -n '15,24p'" 12
echo "## R6 — twelve days later, the recovery ballast is deleted as \"junk files\""
g "git -C repos/curl show --format='%H%n%aI%n%an <%ae>%n%s' --stat 067a75e8957a91fb3407d1112931991998ae9219" "git -C repos/curl show --format='%H%n%aI%n%an <%ae>%n%s' --stat 067a75e8957a91fb3407d1112931991998ae9219" 18
echo "## R7 — lifetime scale at the pinned tip: 39,474 commits, 1,507 mailmapped authors, Daniel first"
g "printf 'commits '; git -C repos/curl rev-list --count 695aa15743685a9d46c4c41bb9c95221d4659541; printf 'mailmapped authors '; git -C repos/curl shortlog -sn 695aa15743685a9d46c4c41bb9c95221d4659541 | wc -l" "printf 'commits '; git -C repos/curl rev-list --count 695aa15743685a9d46c4c41bb9c95221d4659541; printf 'mailmapped authors '; git -C repos/curl shortlog -sn 695aa15743685a9d46c4c41bb9c95221d4659541 | wc -l" 3
g "git -C repos/curl shortlog -sn 695aa15743685a9d46c4c41bb9c95221d4659541 | head -10" "git -C repos/curl shortlog -sn 695aa15743685a9d46c4c41bb9c95221d4659541 | head -10" 11
echo "## R8 — Daniel Stenberg's authored endpoints: the root in 1999 and the pinned tip in 2026"
g "git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp --reverse --format='%H %aI %cI %an <%ae> %s' 695aa15743685a9d46c4c41bb9c95221d4659541 | head -1" "git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp --reverse --format='%H %aI %cI %an <%ae> %s' 695aa15743685a9d46c4c41bb9c95221d4659541 | head -1" 2
g "git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp --format='%H %aI %cI %an <%ae> %s' 695aa15743685a9d46c4c41bb9c95221d4659541 | head -1" "git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp --format='%H %aI %cI %an <%ae> %s' 695aa15743685a9d46c4c41bb9c95221d4659541 | head -1" 2
echo "## R9 — top five authors by author-date decade: Daniel leads each decade in the clone"
g "git -C repos/curl log --use-mailmap --format='%ad%x09%aN' --date=format:'%Y' 695aa15743685a9d46c4c41bb9c95221d4659541 | awk -F '\\t' '\$1 ~ /^[0-9][0-9][0-9][0-9]\$/ { decade=int(\$1/10)*10; count[decade SUBSEP \$2]++ } END { for (key in count) { split(key, part, SUBSEP); print part[1], count[key], part[2] } }' | sort -k1,1n -k2,2nr -k3,3 | awk '\$1 != decade {decade=\$1; rank=0} rank++ < 5 {print}'" "git -C repos/curl log --use-mailmap --format='%ad%x09%aN' --date=format:'%Y' 695aa15743685a9d46c4c41bb9c95221d4659541 | awk -F '\\t' '\$1 ~ /^[0-9][0-9][0-9][0-9]\$/ { decade=int(\$1/10)*10; count[decade SUBSEP \$2]++ } END { for (key in count) { split(key, part, SUBSEP); print part[1], count[key], part[2] } }' | sort -k1,1n -k2,2nr -k3,3 | awk '\$1 != decade {decade=\$1; rank=0} rank++ < 5 {print}'" 18
echo "## R10 — not a monopoly: the six author-date years when another contributor led"
g "git -C repos/curl log --use-mailmap --format='%ad%x09%aN' --date=format:'%Y' 695aa15743685a9d46c4c41bb9c95221d4659541 | awk -F '\\t' '{count[\$1 SUBSEP \$2]++; years[\$1]=1} END {for (year in years) {max=0; leader=\"\"; for (key in count) {split(key, part, SUBSEP); if (part[1]==year && (count[key]>max || (count[key]==max && part[2]<leader))) {max=count[key]; leader=part[2]}} if (leader != \"Daniel Stenberg\") print year, max, leader}}' | sort -n" "git -C repos/curl log --use-mailmap --format='%ad%x09%aN' --date=format:'%Y' 695aa15743685a9d46c4c41bb9c95221d4659541 | awk -F '\\t' '{count[\$1 SUBSEP \$2]++; years[\$1]=1} END {for (year in years) {max=0; leader=\"\"; for (key in count) {split(key, part, SUBSEP); if (part[1]==year && (count[key]>max || (count[key]==max && part[2]<leader))) {max=count[key]; leader=part[2]}} if (leader != \"Daniel Stenberg\") print year, max, leader}}' | sort -n" 8
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
