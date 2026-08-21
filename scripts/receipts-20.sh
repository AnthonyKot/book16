#!/usr/bin/env bash
# Receipts for candidate chapter 20 (redis — "Remove myself too" and the second genesis).
cd "$(dirname "$0")/.."
out=chapters/20-redis.receipts.md
g() { desc=$1; cmd=$2; cap=$3; echo '```'; echo "$ $desc"; eval "$cmd" 2>&1 | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — candidate ch. 20 redis (\"Remove myself too\" and the second genesis)"
echo
echo "Verbatim outputs against the checked-out full clone in \`repos/redis\` (HEAD: \`unstable\`)."
echo "Regenerate with \`scripts/receipts-20.sh\`. Long outputs are bounded by the visible \`head\`/\`sed\` commands or the receipt helper."
echo
echo "## R1 — 2020-06-22: the subject says \"Remove myself too\""
g "git -C repos/redis show -s --format='%H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommit: %cn <%ce>%nCommitDate: %cI%nSubject: %s%nParents: %P' 59fd178014c7cca1b0c668b30ab0d991dd3030f3" "git -C repos/redis show -s --format='%H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommit: %cn <%ce>%nCommitDate: %cI%nSubject: %s%nParents: %P' 59fd178014c7cca1b0c668b30ab0d991dd3030f3" 9
g "git -C repos/redis show --shortstat --format='' 59fd178014c7cca1b0c668b30ab0d991dd3030f3" "git -C repos/redis show --shortstat --format='' 59fd178014c7cca1b0c668b30ab0d991dd3030f3" 3
echo "## R2 — the actual patch: maxclients guidance, then subtract the cluster node named \"myself\""
g "git -C repos/redis show --format= --no-ext-diff 59fd178014c7cca1b0c668b30ab0d991dd3030f3 -- redis.conf src/cluster.c | sed -n '1,70p'" "git -C repos/redis show --format= --no-ext-diff 59fd178014c7cca1b0c668b30ab0d991dd3030f3 -- redis.conf src/cluster.c | sed -n '1,70p'" 71
echo "## R3 — three days later: his last pre-gap commit on HEAD is another cluster comment"
g "git -C repos/redis show -s --format='%H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommitDate: %cI%nSubject: %s%nParents: %P' ad0a9df77a2ccf3fdf309dcdd1b54cf350fcbe3c" "git -C repos/redis show -s --format='%H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommitDate: %cI%nSubject: %s%nParents: %P' ad0a9df77a2ccf3fdf309dcdd1b54cf350fcbe3c" 8
g 'git -C repos/redis merge-base --is-ancestor ad0a9df77a2ccf3fdf309dcdd1b54cf350fcbe3c HEAD; printf "last-commit-is-on-HEAD exit=%s\n" "$?"; git -C repos/redis merge-base --is-ancestor 14a59d4ce7e266f9220e26dd2824a6f1d5c10186 HEAD; printf "parallel-twin-is-on-HEAD exit=%s\n" "$?"' 'git -C repos/redis merge-base --is-ancestor ad0a9df77a2ccf3fdf309dcdd1b54cf350fcbe3c HEAD; printf "last-commit-is-on-HEAD exit=%s\n" "$?"; git -C repos/redis merge-base --is-ancestor 14a59d4ce7e266f9220e26dd2824a6f1d5c10186 HEAD; printf "parallel-twin-is-on-HEAD exit=%s\n" "$?"' 3
g "git -C repos/redis show --format= --no-ext-diff ad0a9df77a2ccf3fdf309dcdd1b54cf350fcbe3c -- src/cluster.c | sed -n '1,40p'" "git -C repos/redis show --format= --no-ext-diff ad0a9df77a2ccf3fdf309dcdd1b54cf350fcbe3c -- src/cluster.c | sed -n '1,40p'" 41
echo "## R4 — the silence: a parallel-history twin at the boundary, then 1,677 days to the new root"
g "git -C repos/redis log --all --author='antirez@gmail.com' --format='%aI %H %an %s' | LC_ALL=C sort | awk '\$1 >= \"2020-06-25T12:58:21+02:00\" && \$1 <= \"2025-01-27T17:24:02+01:00\"'" "git -C repos/redis log --all --author='antirez@gmail.com' --format='%aI %H %an %s' | LC_ALL=C sort | awk '\$1 >= \"2020-06-25T12:58:21+02:00\" && \$1 <= \"2025-01-27T17:24:02+01:00\"'" 8
g "git -C repos/redis rev-list --all --count --author='antirez@gmail.com' --since='2021-01-01T00:00:00Z' --until='2025-01-01T00:00:00Z'" "git -C repos/redis rev-list --all --count --author='antirez@gmail.com' --since='2021-01-01T00:00:00Z' --until='2025-01-01T00:00:00Z'" 2
g 'start=$(git -C repos/redis show -s --format=%aI ad0a9df77a2ccf3fdf309dcdd1b54cf350fcbe3c); end=$(git -C repos/redis show -s --format=%aI 33d653e24f03adadf469dc1627e15e76580f68b5); seconds=$(( $(date -d "$end" +%s) - $(date -d "$start" +%s) )); printf "from %s\nto   %s\ngap  %d days %02d:%02d:%02d\n" "$start" "$end" "$((seconds/86400))" "$(((seconds%86400)/3600))" "$(((seconds%3600)/60))" "$((seconds%60))"' 'start=$(git -C repos/redis show -s --format=%aI ad0a9df77a2ccf3fdf309dcdd1b54cf350fcbe3c); end=$(git -C repos/redis show -s --format=%aI 33d653e24f03adadf469dc1627e15e76580f68b5); seconds=$(( $(date -d "$end" +%s) - $(date -d "$start" +%s) )); printf "from %s\nto   %s\ngap  %d days %02d:%02d:%02d\n" "$start" "$end" "$((seconds/86400))" "$(((seconds%86400)/3600))" "$(((seconds%3600)/60))" "$((seconds%60))"' 4
echo "## R5 — the one-person era at full scale: two bylines, one email, 7,188 of 13,257 commits"
g "git -C repos/redis rev-list --count HEAD; git -C repos/redis rev-list --count --author='antirez@gmail.com' HEAD" "git -C repos/redis rev-list --count HEAD; git -C repos/redis rev-list --count --author='antirez@gmail.com' HEAD" 3
g "git -C repos/redis shortlog -sne HEAD | head -8" "git -C repos/redis shortlog -sne HEAD | head -8" 9
g "git -C repos/redis log HEAD --author='antirez@gmail.com' --format='%aI' | cut -c1-4 | LC_ALL=C sort | uniq -c" "git -C repos/redis log HEAD --author='antirez@gmail.com' --format='%aI' | cut -c1-4 | LC_ALL=C sort | uniq -c" 20
echo "## R6 — the handover and return in yearly shortlogs"
g "for y in 2020 2021 2025; do next=\$((y+1)); printf 'YEAR %s\\n' \"\$y\"; git -C repos/redis shortlog -sn HEAD --since=\"\$y-01-01T00:00:00Z\" --until=\"\$next-01-01T00:00:00Z\" | head -3; done" "for y in 2020 2021 2025; do next=\$((y+1)); printf 'YEAR %s\\n' \"\$y\"; git -C repos/redis shortlog -sn HEAD --since=\"\$y-01-01T00:00:00Z\" --until=\"\$next-01-01T00:00:00Z\" | head -3; done" 13
echo "## R7 — second genesis: one of four roots on HEAD, with no parent"
g "git -C repos/redis log --max-parents=0 HEAD --format='%H %aI %an %s'" "git -C repos/redis log --max-parents=0 HEAD --format='%H %aI %an %s'" 6
g "git -C repos/redis rev-list --parents -n 1 33d653e24f03adadf469dc1627e15e76580f68b5" "git -C repos/redis rev-list --parents -n 1 33d653e24f03adadf469dc1627e15e76580f68b5" 2
g "git -C repos/redis cat-file -p 33d653e24f03adadf469dc1627e15e76580f68b5 | sed -n '1,/^\$/p'" "git -C repos/redis cat-file -p 33d653e24f03adadf469dc1627e15e76580f68b5 | sed -n '1,/^\$/p'" 7
g "git -C repos/redis show --root --shortstat --format='' 33d653e24f03adadf469dc1627e15e76580f68b5" "git -C repos/redis show --root --shortstat --format='' 33d653e24f03adadf469dc1627e15e76580f68b5" 3
echo "## R8 — the complete license at that root"
g "git -C repos/redis show 33d653e24f03adadf469dc1627e15e76580f68b5:LICENSE" "git -C repos/redis show 33d653e24f03adadf469dc1627e15e76580f68b5:LICENSE" 4
echo "## R9 — five weeks later, the copyright line changes from Salvatore to Redis Ltd"
g "git -C repos/redis show -s --format='%H%nAuthor: %an <%ae>%nAuthorDate: %aI%nSubject: %s%nParents: %P' afcc2ff6e8832dc0621fe4b90e4dae6152b0d0a8" "git -C repos/redis show -s --format='%H%nAuthor: %an <%ae>%nAuthorDate: %aI%nSubject: %s%nParents: %P' afcc2ff6e8832dc0621fe4b90e4dae6152b0d0a8" 7
g "git -C repos/redis show --no-ext-diff --format= afcc2ff6e8832dc0621fe4b90e4dae6152b0d0a8 -- LICENSE | sed -n '1,20p'" "git -C repos/redis show --no-ext-diff --format= afcc2ff6e8832dc0621fe4b90e4dae6152b0d0a8 -- LICENSE | sed -n '1,20p'" 21
echo "## R10 — April 2: the orphan history is subtree-joined, then merged into unstable"
g "git -C repos/redis show -s --format='%H %aI %an %s%nParents: %P%n%n%b' 78e0d87177f21b3d6823bbf78ac7a45b34a9bb25 41b1b5df183aa4bd2043413394debdfa6d40d762 5e7333d2dd2950afa0bb3df06ab926afcc42db7d" "git -C repos/redis show -s --format='%H %aI %an %s%nParents: %P%n%n%b' 78e0d87177f21b3d6823bbf78ac7a45b34a9bb25 41b1b5df183aa4bd2043413394debdfa6d40d762 5e7333d2dd2950afa0bb3df06ab926afcc42db7d" 40
g 'git -C repos/redis merge-base --is-ancestor 33d653e24f03adadf469dc1627e15e76580f68b5 5e7333d2dd2950afa0bb3df06ab926afcc42db7d; printf "root-is-ancestor-of-merge exit=%s\n" "$?"' 'git -C repos/redis merge-base --is-ancestor 33d653e24f03adadf469dc1627e15e76580f68b5 5e7333d2dd2950afa0bb3df06ab926afcc42db7d; printf "root-is-ancestor-of-merge exit=%s\n" "$?"' 2
echo "## R11 — April 9: the first founder-authored commit after the merge, now under his full name"
g "git -C repos/redis log --reverse --author='antirez@gmail.com' --format='%H %aI %an %s' 5e7333d2dd2950afa0bb3df06ab926afcc42db7d..HEAD | head -1" "git -C repos/redis log --reverse --author='antirez@gmail.com' --format='%H %aI %an %s' 5e7333d2dd2950afa0bb3df06ab926afcc42db7d..HEAD | head -1" 2
g "git -C repos/redis show -s --format='%H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommit: %cn <%ce>%nCommitDate: %cI%nSubject: %s%nParents: %P%n%n%b' 96a0cfdea27fa28f93b8071ec1b3c6ef8b315298" "git -C repos/redis show -s --format='%H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommit: %cn <%ce>%nCommitDate: %cI%nSubject: %s%nParents: %P%n%n%b' 96a0cfdea27fa28f93b8071ec1b3c6ef8b315298" 14
g "git -C repos/redis log HEAD --author='antirez@gmail.com' --since='2025-01-01T00:00:00Z' --until='2026-01-01T00:00:00Z' --format='%an' | LC_ALL=C sort | uniq -c" "git -C repos/redis log HEAD --author='antirez@gmail.com' --since='2025-01-01T00:00:00Z' --until='2026-01-01T00:00:00Z' --format='%an' | LC_ALL=C sort | uniq -c" 4
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
