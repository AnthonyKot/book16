#!/usr/bin/env bash
# Regenerate the verbatim receipts for chapter 01 (Debian OpenSSL, CVE-2008-0166).
# Requires the clone at repos/debian-openssl (https://salsa.debian.org/debian/openssl.git).
cd "$(dirname "$0")/.."
repo=repos/debian-openssl
out=chapters/01-debian-openssl.receipts.md
r() { # r <lines-cap> <git args...>
  cap=$1; shift
  echo '```'
  printf '$ git -C repos/debian-openssl'; printf ' %q' "$@"; echo
  git -C "$repo" "$@" 2>&1 | head -n "$cap"
  echo '```'; echo
}
{
echo "# Receipts — ch. 01 Debian OpenSSL (CVE-2008-0166)"
echo
echo "Verbatim command outputs against a full clone of https://salsa.debian.org/debian/openssl.git."
echo "Regenerate with \`scripts/receipts-01.sh\`. Long outputs are truncated editorially (head); the command shown is always the full command."
echo
echo "## R1 — the packaging line starts 2005-09-05 (svn-inject), not 1998"
r 4 log --first-parent --reverse --format='%h %aI %an %s' HEAD
echo "## R2 — the DAG's own first commits are upstream SSLeay 1998 (no shared ancestor with R1)"
r 3 log --reverse --format='%h %aI %an %s' HEAD
r 3 merge-base 90718ac5274e07cd7b1933f068e9546d12e621f5 3a6c894124d0140780a4675b928a9ef08fe11987
echo "## R3 — 1998: the PURIFY comment arrives with the SSLeay import"
r 8 grep -n -B1 -A1 'purify complains' d02b48c63a58ea4367a0e905979f140b7d090f86 -- crypto/rand/md_rand.c
echo "## R4 — 2006-05-02 16:25: md_rand.c imported at the WRONG path (rand/, not crypto/rand/)"
r 14 show --format=fuller --stat b03fc027554b096402708b4e762bc05eb1d59d0e
echo "## R5 — 2006-05-02 16:34 (nine minutes later): the seed-mixing commented out"
r 16 show --format=fuller --stat 8f27a7dc022e95ab7274628715f22207235f8e36
r 40 show 8f27a7dc022e95ab7274628715f22207235f8e36 -- rand/md_rand.c
echo "## R6 — the changelog stanza it lands in is dated four weeks earlier (trailer: 6 Apr 2006)"
r 26 show 8f27a7dc022e95ab7274628715f22207235f8e36 -- debian/changelog
echo "## R7 — at tag 0.9.8b-1 the patched file exists ONLY at the dead path"
r 4 ls-tree --name-only debian/openssl-0.9.8b-1 rand/md_rand.c crypto/rand/md_rand.c
r 4 grep -n 'uninitialised' debian/openssl-0.9.8b-1 -- rand/md_rand.c
echo "## R8 — 2006-09-17 13:32: the Sunday rename that makes it live ('really fixing')"
r 10 show --format=fuller --stat 33a9d075e95aa0b88c163a1fc45e6ff50cf4eed3
echo "## R9 — 57 minutes later: 'nested comments don't work' — the compiler's last protest"
r 30 show --format=fuller a590e4f46997ce41db5c21dddb2638c8780c46f5
echo "## R10 — 2008-05-07 18:35: the fix is one sentence, inside a translations upload"
r 14 show --format=fuller --stat f7949d6e0a140e9a87e483ae89b140f1c57755d3
r 52 show f7949d6e0a140e9a87e483ae89b140f1c57755d3 -- crypto/rand/md_rand.c debian/changelog debian/libssl0.9.8.postinst
echo "## R11 — no commit message in the whole repo names the CVE or the advisory"
r 2 log --all --grep=CVE-2008-0166 --oneline
r 2 log --all --grep=DSA-1571 --oneline
echo "## R12 — the etch security upload exists only as a 2009 reconstruction"
r 10 log -1 --format=fuller debian/openssl-0.9.8c-4etch3
r 16 show c03d4f6594cbe965318bbadf4b0d1fde7068a5ac -- debian/changelog
echo "## R13 — the 2008 fix is NOT an ancestor of the etch branch (exit 1 = not ancestor)"
echo '```'
echo '$ git -C repos/debian-openssl merge-base --is-ancestor f7949d6e0a140e9a87e483ae89b140f1c57755d3 origin/debian/etch; echo exit=$?'
git -C "$repo" merge-base --is-ancestor f7949d6e0a140e9a87e483ae89b140f1c57755d3 origin/debian/etch; echo "exit=$?"
echo '```'; echo
echo "## R15 — three hours before the fix, the same 0.9.8g-9 stanza was a translations upload"
r 2 show -s --format='%h %aI %an %s' ad1ff815c9
echo "## R14 — 2009: the leftover half is christened debian/patches/valgrind.patch"
r 12 show c86e4fc32229f067511b10a7dc2ccf4b1ce2c310:debian/patches/valgrind.patch
r 8 log --all --format='%h %aI %s' -- debian/patches/valgrind.patch
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
