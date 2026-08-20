#!/usr/bin/env bash
# Receipts for chapter 03 (bitcoin, the contributor named --author=Satoshi). Clone at repos/bitcoin.
cd "$(dirname "$0")/.."
repo=repos/bitcoin
out=chapters/03-bitcoin.receipts.md
r() { cap=$1; shift; echo '```'; printf '$ git -C repos/bitcoin'; printf ' %q' "$@"; echo; git -C "$repo" "$@" 2>&1 | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — ch. 03 bitcoin (the contributor named --author=Satoshi)"
echo
echo "Verbatim outputs against a full clone of https://github.com/bitcoin/bitcoin."
echo "Regenerate with \`scripts/receipts-03.sh\`. Long outputs truncated editorially (head)."
echo
echo "## R1 — shortlog lists a flag as a person (three spellings of one name)"
echo '```'; echo "\$ git -C repos/bitcoin shortlog -sne --all | grep -iE 'nakamoto|author='"; git -C "$repo" shortlog -sne --all 2>/dev/null | grep -iE "nakamoto|author=" | head -4; echo '```'; echo
echo "## R2 — the 8 commits: author literally '--author=Satoshi Nakamoto', committer Gavin"
r 10 log --all --author='--author' --format='%h %aI %an <%ae> | committer=%cn | %s'
echo "## R3 — the same patch, done right, on the SVN line by s_nakamoto"
r 4 show --format='%h %aI %an <%ae> %s' --stat 01bed1828b
echo "## R4 — Gavin arrives five weeks earlier as 'Fix CRLF'"
r 4 log --all --author='Gavin' --reverse --format='%h %aI %an %s' HEAD
r 3 show --stat --format='%h %s' 8bd66202c3
echo "## R5 — one of the flagged commits in full (the quoting bug is permanent, tree never rewritten)"
r 8 show --format=fuller --stat 9f35575ca3
echo "## R6 — no .mailmap at HEAD: nobody has even papered over the display"
echo '```'
echo "$ git -C repos/bitcoin cat-file -e HEAD:.mailmap || echo 'no .mailmap at HEAD'"
git -C repos/bitcoin cat-file -e HEAD:.mailmap 2>/dev/null || echo 'no .mailmap at HEAD'
echo '```'
echo
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
