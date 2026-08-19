#!/usr/bin/env bash
# Receipts for chapter 06 (the genesis lie — cross-repo). Clones under repos/.
cd "$(dirname "$0")/.."
out=chapters/06-genesis.receipts.md
r() { repo=$1; cap=$2; shift 2; echo '```'; printf '$ git -C repos/%s' "$repo"; printf ' %q' "$@"; echo; git -C "repos/$repo" "$@" 2>&1 | head -n "$cap"; echo '```'; echo; }
g() { desc=$1; cmd=$2; cap=$3; echo '```'; echo "$ $desc"; eval "$cmd" 2>&1 | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — ch. 06 the genesis lie (cross-repo)"
echo
echo "Verbatim outputs against full clones of php-src, cpython, linux, bitcoin, redis, openttd, git."
echo "Regenerate with \`scripts/receipts-06.sh\`. Long outputs truncated editorially (head)."
echo
echo "## R1 — php: the root commit is git's empty tree, authored by a robot"
r php 4 log --reverse --format='%H %aI %an <%ae> %s'
g "git -C repos/php cat-file -p f70a4db647886f65a3e24249351d2c8abc0cdfb3" "git -C repos/php cat-file -p f70a4db647886f65a3e24249351d2c8abc0cdfb3" 6
g "git -C repos/php hash-object -t tree /dev/null   # the empty tree's name" "git -C repos/php hash-object -t tree /dev/null" 1
echo "## R2 — php: the inventor's first recorded mark is a blank line"
r php 18 show a6043d3e1efa4cb7564118765dadd53cedd9d194
echo "## R3 — cpython: the first two commits have different dates and the same tree"
r cpython 3 log --reverse --format='%H %aI %s' af49df919dafc3767ae956767dce0482f9cd6d4e
g "git -C repos/cpython rev-parse 7f777ed95a^{tree} 3310257195^{tree}" "git -C repos/cpython rev-parse '7f777ed95a^{tree}' '3310257195^{tree}'" 2
echo "## R4 — cpython: the file inside the August commit already knows it is September; 178 commits say 'Initial revision'"
g "git -C repos/cpython show 7f777ed95a:Doc/README | tail -2" "git -C repos/cpython show 7f777ed95a19224294949e1b4ce56bbffcb1fe9f:Doc/README | tail -2" 3
g "git -C repos/cpython log --format='%s' af49df91 | grep -cx 'Initial revision'" "git -C repos/cpython log --format='%s' af49df919dafc3767ae956767dce0482f9cd6d4e | grep -cx 'Initial revision'" 1
echo "## R5 — cpython: the conversion robot's fingerprint in the raw commit object"
g "git -C repos/cpython cat-file -p 7f777ed95a | head -6" "git -C repos/cpython cat-file -p 7f777ed95a19224294949e1b4ce56bbffcb1fe9f | head -6" 6
echo "## R6 — linux: the famous first commit says out loud that it is a cut"
r linux 12 log -1 --format='%H%n%ai %an%n%B' 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
g "git -C repos/linux diff-tree --root --shortstat 1da177e4c3f4 | tail -1" "git -C repos/linux diff-tree --root --shortstat 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 | tail -1" 1
echo "## R7 — linux: the tree has FOUR geneses; one is a two-line GitHub README"
r linux 5 log --max-parents=0 --pretty='format:%H %aI %an <%ae> %s' origin/master
g "git -C repos/linux show a101ad945113:README.md" "git -C repos/linux show a101ad945113be3d7f283a181810d76897f0a0d6:README.md" 3
echo "## R8 — linux: the README genesis is an ancestor of master today; the file itself is gone"
g "git -C repos/linux merge-base --is-ancestor a101ad945113 origin/master && echo ANCESTOR: yes" "git -C repos/linux merge-base --is-ancestor a101ad945113be3d7f283a181810d76897f0a0d6 origin/master && echo 'ANCESTOR: yes'" 1
g "git -C repos/linux cat-file -e origin/master:README.md || echo 'README.md at tip: gone'" "git -C repos/linux cat-file -e origin/master:README.md 2>/dev/null || echo 'README.md at tip: gone'" 1
echo "## R9 — bitcoin: day one exists twice — same tree, two hashes, and it is not Satoshi"
g "git -C repos/bitcoin show -s --format='%H %aI %an <%ae> %s%n%b' 4405b78d e071a3f6" "git -C repos/bitcoin show -s --format='%H %aI %an <%ae>%n  %s%n  %b' 4405b78d6059e536c36974088a8ed4d9f0f29898 e071a3f6c06f41068ad17134189a4ac3073ef76b" 8
g "git -C repos/bitcoin rev-parse 4405b78d^{tree} e071a3f6^{tree}" "git -C repos/bitcoin rev-parse '4405b78d6059e536c36974088a8ed4d9f0f29898^{tree}' 'e071a3f6c06f41068ad17134189a4ac3073ef76b^{tree}'" 2
echo "## R10 — bitcoin: the tree day one imports is already eight months into someone else's project"
g "git -C repos/bitcoin show 4405b78d:readme.txt | head -3" "git -C repos/bitcoin show 4405b78d6059e536c36974088a8ed4d9f0f29898:readme.txt | head -3" 4
g "git -C repos/bitcoin show -s --format='%h %aI %an %s' e00d4805d71de8bb32c9af600f5bd8fce2414d5d" "git -C repos/bitcoin show -s --format='%h %aI %an %s' e00d4805d71de8bb32c9af600f5bd8fce2414d5d" 1
echo "## R11 — redis: day one at 10:30:00 sharp, version 0.07, copyright three years older than the repo"
r redis 1 log --reverse --format='%H %aI %an %s'
g "git -C repos/redis show ed9b544e10:COPYING | head -1" "git -C repos/redis show ed9b544e10b84cd43348ddfab7068b610a5df1f7:COPYING | head -1" 1
g "git -C repos/redis show ed9b544e10:redis.c | grep REDIS_VERSION" "git -C repos/redis show ed9b544e10b84cd43348ddfab7068b610a5df1f7:redis.c | grep REDIS_VERSION" 1
echo "## R12 — redis: sixteen years later the author adds a SECOND genesis"
r redis 5 log --max-parents=0 --all --format='%h %aI %an %s'
echo "## R13 — openttd: day one is r1 of a crashed SVN, and r1 is revision 975"
r openttd 2 log --reverse --format='%H %aI %an <%ae> %s'
g "git -C repos/openttd diff-tree --root --shortstat efaeb275f7 | tail -1" "git -C repos/openttd diff-tree --root --shortstat efaeb275f78e18d594d9ee8ff04eccd2dc59512c | tail -1" 1
g "git -C repos/openttd show efaeb275f7:readme.txt | head -3" "git -C repos/openttd show efaeb275f78e18d594d9ee8ff04eccd2dc59512c:readme.txt | head -3" 4
echo "## R14 — git: the control case — a first commit that is actually a first commit"
r git 1 log --reverse --format='%H %aI %an %s'
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
