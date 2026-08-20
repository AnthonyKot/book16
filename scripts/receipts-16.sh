#!/usr/bin/env bash
# Receipts for chapter 16 (the empty commit — cross-repo: php, swift, openssl, ffmpeg, node).
cd "$(dirname "$0")/.."
out=chapters/16-empty.receipts.md
g() { desc=$1; cmd=$2; cap=$3; echo '```'; echo "$ $desc"; eval "$cmd" 2>&1 | head -n "$cap"; echo '```'; echo; }
# emptycheck <repo> <hash>: prints commit tree and parent tree (equal == empty)
{
echo "# Receipts — ch. 16 the empty commit (cross-repo)"
echo
echo "Verbatim outputs against full clones of php-src, swiftlang/swift, openssl, ffmpeg, nodejs/node."
echo "An 'empty' commit is one whose tree hash equals its parent's: it changes no bytes."
echo "Regenerate with \`scripts/receipts-16.sh\`. Long outputs truncated editorially (head)."
echo
echo "## R1 — php: a commit whose only purpose is to ring a doorbell"
g "git -C repos/php show -s --format='%h %ai %an%n%s' 00d8e26d71" "git -C repos/php show -s --format='%h %ai %an%n%s' 00d8e26d71139234f803c37d0d8b061868882f83" 3
g "git -C repos/php rev-parse '00d8e26d71^{tree}' '00d8e26d71^^{tree}'   # commit tree == parent tree" "git -C repos/php rev-parse '00d8e26d71139234f803c37d0d8b061868882f83^{tree}' '00d8e26d71139234f803c37d0d8b061868882f83^^{tree}'" 3
echo "## R2 — swift: an empty commit whose payload is the fact of a build running"
g "git -C repos/swift show -s --format='%h %ai %an%n%s' 63fd0d0ea6" "git -C repos/swift show -s --format='%h %ai %an%n%s' 63fd0d0ea6dd9dad42444f79e4133758a18aa790" 3
g "git -C repos/swift rev-parse '63fd0d0ea6^{tree}' '63fd0d0ea6^^{tree}'   # equal: nothing changed" "git -C repos/swift rev-parse '63fd0d0ea6dd9dad42444f79e4133758a18aa790^{tree}' '63fd0d0ea6dd9dad42444f79e4133758a18aa790^^{tree}'" 3
g "git -C repos/swift branch -r --contains 63fd0d0ea6 | head -1   # lives only on a stale eng branch" "git -C repos/swift branch -r --contains 63fd0d0ea6dd9dad42444f79e4133758a18aa790 | head -1" 2
echo "## R3 — openssl: four empty commits used as chapter dividers of a migration"
g "for h in 304e56e870 a96f48995e cbf4b68333 99655cb91d; do git -C repos/openssl show -s --format='%h %ai %an | %s' \$h; done" "for h in 304e56e87033fc2108478bc8c131e12f6e1759f2 a96f48995ed1cbedf65ac700211b65b09e40e0be cbf4b68333dc48fc50905b867bbd1f8cda09de4c 99655cb91d669273da23c40912b77004ea086b97; do git -C repos/openssl show -s --format='%h %ai %an | %s' \$h; done" 5
g "git -C repos/openssl rev-parse '304e56e870^{tree}' '304e56e870^^{tree}'   # first marker: empty" "git -C repos/openssl rev-parse '304e56e87033fc2108478bc8c131e12f6e1759f2^{tree}' '304e56e87033fc2108478bc8c131e12f6e1759f2^^{tree}'" 3
echo "## R4 — ffmpeg: an empty commit that is a receipt — the fix was already present"
g "git -C repos/ffmpeg show -s --format='%h %ai %an%n%s' 7df9a56f0d" "git -C repos/ffmpeg show -s --format='%h %ai %an%n%s' 7df9a56f0d2bdbf45e7868f7b4e1f06a6fc01be1" 3
g "git -C repos/ffmpeg rev-parse '7df9a56f0d^{tree}' '7df9a56f0d^^{tree}'   # equal: nothing to apply" "git -C repos/ffmpeg rev-parse '7df9a56f0d2bdbf45e7868f7b4e1f06a6fc01be1^{tree}' '7df9a56f0d2bdbf45e7868f7b4e1f06a6fc01be1^^{tree}'" 3
g "git -C repos/ffmpeg show -s --format='%b' 7df9a56f0d | grep -i 'cherry picked'" "git -C repos/ffmpeg show -s --format='%b' 7df9a56f0d2bdbf45e7868f7b4e1f06a6fc01be1 | grep -i 'cherry picked'" 2
echo "## R5 — node: the same reviewed patch landed twice, twelve minutes apart; the second is empty"
g "git -C repos/node show -s --format='%h %aI committed %cI by %cn%n%s' 766d063e05 71e9d0fb1b" "git -C repos/node show -s --format='%h %aI committed %cI by %cn%n%s' 766d063e0578c0f7758c3a965c971763f43fec85 71e9d0fb1b455f447ce5c4362decf7d0e3e836f3" 5
g "git -C repos/node rev-parse '71e9d0fb1b^{tree}' '71e9d0fb1b^^{tree}'   # second landing: empty" "git -C repos/node rev-parse '71e9d0fb1b455f447ce5c4362decf7d0e3e836f3^{tree}' '71e9d0fb1b455f447ce5c4362decf7d0e3e836f3^^{tree}'" 3
g "git -C repos/node merge-base --is-ancestor 766d063e05 71e9d0fb1b && echo 'first landing is already an ancestor of the second'" "git -C repos/node merge-base --is-ancestor 766d063e0578c0f7758c3a965c971763f43fec85 71e9d0fb1b455f447ce5c4362decf7d0e3e836f3 && echo 'first landing is already an ancestor of the second'" 2
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
