#!/usr/bin/env bash
# Receipts for chapter 14 (openssl — the Dual EC remove/revert/remove).
cd "$(dirname "$0")/.."
out=chapters/14-openssl.receipts.md
g() { desc=$1; cmd=$2; cap=$3; echo '```'; echo "$ $desc"; eval "$cmd" 2>&1 | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — ch. 14 openssl (the Dual EC remove/revert/remove)"
echo
echo "Verbatim outputs against a full clone of openssl/openssl (all branches)."
echo "Regenerate with \`scripts/receipts-14.sh\`. Long outputs truncated editorially (head)."
echo
echo "## R1 — 2011: the author's own health warning, above a new random-number generator"
g "git -C repos/openssl show -s --format='%h %ai %an%n%s' 591cbfae3c" "git -C repos/openssl show -s --format='%h %ai %an%n%s' 591cbfae3cfcb26b45c523499847d3dbe53a44e4" 3
echo "## R2 — six months later: Dual EC is added"
g "git -C repos/openssl show -s --format='%h %ai %an%n%s' 7fdcb45745" "git -C repos/openssl show -s --format='%h %ai %an%n%s' 7fdcb45745c01b90b256fe97e87eae31453e11e6" 2
g "git -C repos/openssl show --stat --format= 7fdcb45745 | tail -1" "git -C repos/openssl show --stat --format= 7fdcb45745c01b90b256fe97e87eae31453e11e6 | tail -1" 2
echo "## R3 — Sept 2013, 05:23: disabled by default on the release line"
g "git -C repos/openssl show -s --format='%h %ai %an%n%s' a4870de5aa" "git -C repos/openssl show -s --format='%h %ai %an%n%s' a4870de5aaef562c0947494b410a2387f3a6d04d" 2
g "git -C repos/openssl show a4870de5aa -- crypto/rand/rand_lib.c | grep -E '^\+' | grep -vE '^\+\+\+' | head -6" "git -C repos/openssl show a4870de5aaef562c0947494b410a2387f3a6d04d -- crypto/rand/rand_lib.c | grep -E '^\+' | grep -vE '^\+\+\+' | head -6" 7
echo "## R4 — Dec 2013: removed from the FIPS module entirely (−2265)"
g "git -C repos/openssl show -s --format='%h %ai %an%n%s' 200f249b8c" "git -C repos/openssl show -s --format='%h %ai %an%n%s' 200f249b8c3b6439e0200d01caadc24806f1a983" 2
g "git -C repos/openssl show --stat --format= 200f249b8c | tail -1" "git -C repos/openssl show --stat --format= 200f249b8c3b6439e0200d01caadc24806f1a983 | tail -1" 2
echo "## R5 — May 2014: the removal is REVERTED, and the body says why"
g "git -C repos/openssl show -s --format=fuller 3b43568d5b | head -9" "git -C repos/openssl show -s --format=fuller 3b43568d5bae85196834f9ca3339b32a77ab2c4b | head -9" 10
echo "## R6 — July 2014: removed again — the ellipsis, and the reason"
g "git -C repos/openssl show -s --format='%s%n%n%b' 7fb7844f3b" "git -C repos/openssl show -s --format='%s%n%n%b' 7fb7844f3b40b60c2df77e093398da55d7928e9d" 4
echo "## R7 — the whole biography of the algorithm, chronological, in the maintainer's own subjects"
g "git -C repos/openssl log --all --reverse --grep='Dual EC' --format='%h %ai %s'" "git -C repos/openssl log --all --reverse --grep='Dual EC' --format='%h %ai %s'" 12
echo "## R8 — Oct 2014: on master, the whole FIPS apparatus is deleted"
g "git -C repos/openssl show -s --format='%h %ai %an%n%s' 78c990c156" "git -C repos/openssl show -s --format='%h %ai %an%n%s' 78c990c156ba79521e98728e9a604b4c5cc8adec" 2
echo "## R9 — the man who wrote the whole sequence: first line, last line, then gone"
g "git -C repos/openssl log --reverse --author=Henson --format='%h %aI %s' | head -1" "git -C repos/openssl log --reverse --author='Henson' --format='%h %aI %s' | head -1" 2
g "git -C repos/openssl log --author=Henson --format='%h %aI %s' | head -1" "git -C repos/openssl log --author='Henson' --format='%h %aI %s' | head -1" 2
g "git -C repos/openssl log --author=Henson --since=2018-01-01 --oneline | wc -l   # nothing after 2017" "git -C repos/openssl log --author='Henson' --since=2018-01-01 --oneline | wc -l" 1
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
