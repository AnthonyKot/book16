#!/usr/bin/env bash
# verify.sh — the book's checkability, as a script.
# 1. every hash cited in a chapter .md exists as a real object in the named clone
# 2. every [Rn] marker in a chapter has a matching receipt entry
# 3. internal HTML links resolve
# Repos are expected under repos/<name> (gitignored). Exit non-zero on any failure.
cd "$(dirname "$0")"
fail=0

# --- chapter 01 -> repos/debian-openssl ---
repo=repos/debian-openssl
md=chapters/01-debian-openssl.md
if [ -d "$repo/.git" ]; then
  for h in $(grep -oE '\b[0-9a-f]{10}\b' "$md" | sort -u); do
    if ! git -C "$repo" cat-file -e "${h}^{object}" 2>/dev/null; then
      echo "FAIL $md: hash $h not in $repo"; fail=1
    fi
  done
  echo "checked $(grep -oE '\b[0-9a-f]{10}\b' "$md" | sort -u | wc -l) hashes against $repo"
else
  echo "SKIP hash check: clone $repo missing (git clone https://salsa.debian.org/debian/openssl.git $repo)"
fi

# --- [Rn] markers each have a receipt line ---
for r in $(grep -oE '\[R[0-9]+\]' "$md" | tr -d '[]' | sort -u); do
  n=${r#R}
  grep -qE "^- \*\*R${n}\*\* " "$md" || { echo "FAIL $md: $r cited but no receipt line"; fail=1; }
done
echo "checked receipt markers in $md"

# --- receipts file regenerates identically (if repo present) ---
if [ -d "$repo/.git" ] && [ -f scripts/receipts-01.sh ]; then
  cp chapters/01-debian-openssl.receipts.md /tmp/blame-r01.orig 2>/dev/null
  bash scripts/receipts-01.sh >/dev/null 2>&1
  if ! diff -q /tmp/blame-r01.orig chapters/01-debian-openssl.receipts.md >/dev/null 2>&1; then
    echo "FAIL receipts-01.sh output drifted from committed receipts"; fail=1
  else
    echo "receipts-01.sh reproduces committed output"
  fi
fi

# --- internal links in html resolve ---
for html in index.html about.html chapters/*.html; do
  [ -f "$html" ] || continue
  dir=$(dirname "$html")
  for href in $(grep -oE 'href="[^"#]+\.html' "$html" | sed 's/href="//'); do
    target="$dir/$href"
    [ -f "$(cd "$dir" && realpath -m "$href" 2>/dev/null)" ] || [ -f "$target" ] || { echo "FAIL $html: dead link $href"; fail=1; }
  done
done
echo "checked internal html links"

[ $fail -eq 0 ] && echo "OK — all checks passed" || echo "FAILURES above"
exit $fail
