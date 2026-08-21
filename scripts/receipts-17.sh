#!/usr/bin/env bash
# Receipts for source 17 (Dirty COW — the eleven-year COW race).
cd "$(dirname "$0")/.."
out=chapters/17-dirtycow.receipts.md
g() { desc=$1; cmd=$2; cap=$3; echo '```'; echo "$ $desc"; eval "$cmd" 2>&1 | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — source 17 Dirty COW (the eleven-year COW race)"
echo
echo "Verbatim outputs against the local torvalds/linux and bitcoin/bitcoin clones."
echo "Regenerate with \`scripts/receipts-17.sh\`. Long outputs selected editorially with sed/head."
echo
echo "## R1 — 2005-08-01: Linus's first attempt to fix the write-access race"
g "git -C repos/linux show --stat --format='<full metadata and message>' 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6" "git -C repos/linux show --stat --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommitter: %cn <%ce>%nCommitDate: %cI%n%n%B' 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6" 40
echo "## R2 — 2005-08-03: the s390/copy_one_pte objection and replacement protocol"
g "git -C repos/linux show --stat --format='<full metadata and message>' f33ea7f404e592e4563b12101b7a4d17da6558d7" "git -C repos/linux show --stat --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommitter: %cn <%ce>%nCommitDate: %cI%n%n%B' f33ea7f404e592e4563b12101b7a4d17da6558d7" 48
echo "## R3 — the three commits on one exact author-date timeline"
g "git -C repos/linux show -s --format='%H %aI %an | %s' 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6 f33ea7f404e592e4563b12101b7a4d17da6558d7 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619" "git -C repos/linux show -s --format='%H %aI %an | %s' 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6 f33ea7f404e592e4563b12101b7a4d17da6558d7 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619" 5
echo "## R4 — 2016: Linus's full account of the ancient bug, the undo, and the new fix"
g "git -C repos/linux show --stat --format='<full metadata and message>' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619" "git -C repos/linux show --stat --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommitter: %cn <%ce>%nCommitDate: %cI%n%n%B' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619" 70
echo "## R5 — the 2016 diff, hunk one: introduce FOLL_COW"
g "git -C repos/linux show --format= --no-ext-diff 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 -- include/linux/mm.h mm/gup.c | sed -n '1,12p'" "git -C repos/linux show --format= --no-ext-diff 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 -- include/linux/mm.h mm/gup.c | sed -n '1,12p'" 14
echo "## R6 — the 2016 diff, remaining hunks: validate COW and stop clearing FOLL_WRITE"
g "git -C repos/linux show --format= --no-ext-diff 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 -- include/linux/mm.h mm/gup.c | sed -n '13,50p'" "git -C repos/linux show --format= --no-ext-diff 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 -- include/linux/mm.h mm/gup.c | sed -n '13,50p'" 40
echo "## R7 — 2017 aftermath: the forgotten transparent-huge-page check, also sent to stable"
g "git -C repos/linux show -s --format='<metadata and message>' 8310d48b125d19fcd9521d83b8293e63eb1646aa | sed -n '1,17p;57,77p'" "git -C repos/linux show -s --format='%H%nAuthorDate: %aI%nAuthor: %an <%ae>%nSubject: %s%n%n%b' 8310d48b125d19fcd9521d83b8293e63eb1646aa | sed -n '1,17p;57,77p'" 40
echo "## R8 — 2020 aftermath: Linus documents that COW can break either way"
g "git -C repos/linux show -s --format='<metadata and message>' 17839856fd588f4ab6b789f482ed3ffd7c403e1f | sed -n '1,21p;31,55p'" "git -C repos/linux show -s --format='%H%nAuthorDate: %aI%nAuthor: %an <%ae>%nSubject: %s%n%n%b' 17839856fd588f4ab6b789f482ed3ffd7c403e1f | sed -n '1,21p;31,55p'" 48
echo "## R9 — 2022 aftermath: an explicit Dirty COW/CVE mention and removal of FOLL_COW"
g "git -C repos/linux show -s --format='<metadata and message>' 5535be3099717646781ce1540cf725965d680e7b | sed -n '1,20p;50,67p;83p'" "git -C repos/linux show -s --format='%H%nAuthorDate: %aI%nAuthor: %an <%ae>%nSubject: %s%n%n%b' 5535be3099717646781ce1540cf725965d680e7b | sed -n '1,20p;50,67p;83p'" 42
echo "## R10 — Bitcoin twin: the entire 2018 repair is false to true"
g "git -C repos/bitcoin show --stat --format='<full metadata and message>' b8f801964f59586508ea8da6cf3decd76bc0e571" "git -C repos/bitcoin show --stat --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommitter: %cn <%ce>%nCommitDate: %cI%n%n%B' b8f801964f59586508ea8da6cf3decd76bc0e571" 20
g "git -C repos/bitcoin show --format= --no-ext-diff b8f801964f59586508ea8da6cf3decd76bc0e571 -- src/validation.cpp | sed -n '1,13p'" "git -C repos/bitcoin show --format= --no-ext-diff b8f801964f59586508ea8da6cf3decd76bc0e571 -- src/validation.cpp | sed -n '1,13p'" 15
echo "## R11 — Bitcoin's later in-repo comment names CVE-2018-17144 at that true call"
g "git -C repos/bitcoin show -s --format='<metadata and message>' 38bfca6bb2ad68719415e9c54a981441052da072 | sed -n '1,18p'" "git -C repos/bitcoin show -s --format='commit %H%nAuthorDate: %aI%nAuthor: %an <%ae>%n%n%B' 38bfca6bb2ad68719415e9c54a981441052da072 | sed -n '1,18p'" 20
g "git -C repos/bitcoin show --format= --no-ext-diff 38bfca6bb2ad68719415e9c54a981441052da072 -- src/validation.cpp | sed -n '14,21p'" "git -C repos/bitcoin show --format= --no-ext-diff 38bfca6bb2ad68719415e9c54a981441052da072 -- src/validation.cpp | sed -n '14,21p'" 10
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
