#!/usr/bin/env bash
# verify.sh — the book's checkability, as a script.
# 1. every hash cited in a chapter .md exists as a real object in the named clone
# 2. every [Rn] marker in a chapter has a matching receipt entry
# 3. internal HTML links resolve
# 4. no unresolved factual CHECK comments remain in chapter manuscripts
# Repos are expected under repos/<name> (gitignored). Exit non-zero on any failure.
cd "$(dirname "$0")"
fail=0

# --- unresolved factual markers ---
if grep -R -n --include='*.md' '<!-- CHECK:' chapters; then
  echo "FAIL unresolved factual CHECK comments remain in chapters"; fail=1
else
  echo "checked zero unresolved factual CHECK comments"
fi

# --- final public reading order ---
expected_order=$(printf '%s\n' 04-xz 01-debian-openssl 10-t2t 14-openssl 15-postgres 12-php 09-npm 07-vim)
actual_order=$(sed -n '/<h2>Chapters<\/h2>/,/<\/ol>/p' index.html \
  | grep '<li><span class="num">' \
  | sed -E 's/.*href="chapters\/([^".]+)\.html".*/\1/')
if [ "$actual_order" != "$expected_order" ]; then
  echo "FAIL index.html: final chapter order drifted"; fail=1
else
  echo "checked final eight-chapter reading order"
fi

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


# --- chapter 02 -> repos/log4j2 ; chapter 03 -> repos/bitcoin ---
for pair in "02-log4j2:log4j2" "03-bitcoin:bitcoin" "04-xz:xz" "05-git:git" "07-vim:vim" "10-t2t:tensor2tensor" "11-ffmpeg:ffmpeg" "12-php:php" "13-node:node" "14-openssl:openssl" "15-postgres:postgres"; do
  ch="${pair%%:*}"; rp="repos/${pair##*:}"; m="chapters/${ch}.md"
  [ -f "$m" ] || continue
  if [ -d "$rp/.git" ]; then
    for h in $(grep -oE '\b[0-9a-f]{10}\b' "$m" | sort -u); do
      git -C "$rp" cat-file -e "${h}^{object}" 2>/dev/null || { echo "FAIL $m: hash $h not in $rp"; fail=1; }
    done
    echo "checked $(grep -oE '\b[0-9a-f]{10}\b' "$m" | sort -u | wc -l) hashes against $rp"
  else
    echo "SKIP $m: clone $rp missing"
  fi
  for r in $(grep -oE '\[R[0-9]+\]' "$m" | tr -d '[]' | sort -u); do
    n=${r#R}; grep -qE "^- \*\*R${n}\*\* " "$m" || { echo "FAIL $m: $r cited but no receipt line"; fail=1; }
  done
done

# --- chapter 06 (cross-repo): each hash must exist in at least one of the named clones ---
m=chapters/06-genesis.md
if [ -f "$m" ]; then
  CH06_REPOS="php cpython linux bitcoin redis openttd git"
  for h in $(grep -oE '\b[0-9a-f]{10}\b' "$m" | sort -u); do
    found=0
    for rp in $CH06_REPOS; do
      [ -d "repos/$rp/.git" ] && git -C "repos/$rp" cat-file -e "${h}^{object}" 2>/dev/null && { found=1; break; }
    done
    [ $found -eq 1 ] || { echo "FAIL $m: hash $h not in any ch06 clone"; fail=1; }
  done
  echo "checked $(grep -oE '\b[0-9a-f]{10}\b' "$m" | sort -u | wc -l) hashes against ch06 clones (union)"
  for r in $(grep -oE '\[R[0-9]+\]' "$m" | tr -d '[]' | sort -u); do
    n=${r#R}; grep -qE "^- \*\*R${n}\*\* " "$m" || { echo "FAIL $m: $r cited but no receipt line"; fail=1; }
  done
fi

# --- chapter 08 (cross-repo): each hash must exist in at least one of the named clones ---
m=chapters/08-costume.md
if [ -f "$m" ]; then
  CH08_REPOS="msdos the-algorithm swift"
  for h in $(grep -oE '\b[0-9a-f]{10}\b' "$m" | sort -u); do
    found=0
    for rp in $CH08_REPOS; do
      [ -d "repos/$rp/.git" ] && git -C "repos/$rp" cat-file -e "${h}^{object}" 2>/dev/null && { found=1; break; }
    done
    [ $found -eq 1 ] || { echo "FAIL $m: hash $h not in any ch08 clone"; fail=1; }
  done
  echo "checked $(grep -oE '\b[0-9a-f]{10}\b' "$m" | sort -u | wc -l) hashes against ch08 clones (union)"
  for r in $(grep -oE '\[R[0-9]+\]' "$m" | tr -d '[]' | sort -u); do
    n=${r#R}; grep -qE "^- \*\*R${n}\*\* " "$m" || { echo "FAIL $m: $r cited but no receipt line"; fail=1; }
  done
fi

# --- chapter 09 (cross-repo): each hash must exist in at least one of the named clones ---
m=chapters/09-npm.md
if [ -f "$m" ]; then
  CH09_REPOS="event-stream colors"
  for h in $(grep -oE '\b[0-9a-f]{10}\b' "$m" | sort -u); do
    found=0
    for rp in $CH09_REPOS; do
      [ -d "repos/$rp/.git" ] && git -C "repos/$rp" cat-file -e "${h}^{object}" 2>/dev/null && { found=1; break; }
    done
    [ $found -eq 1 ] || { echo "FAIL $m: hash $h not in any ch09 clone"; fail=1; }
  done
  echo "checked $(grep -oE '\b[0-9a-f]{10}\b' "$m" | sort -u | wc -l) hashes against ch09 clones (union)"
  for r in $(grep -oE '\[R[0-9]+\]' "$m" | tr -d '[]' | sort -u); do
    n=${r#R}; grep -qE "^- \*\*R${n}\*\* " "$m" || { echo "FAIL $m: $r cited but no receipt line"; fail=1; }
  done
fi

# --- chapter 16 (cross-repo): each hash must exist in at least one of the named clones ---
m=chapters/16-empty.md
if [ -f "$m" ]; then
  CH16_REPOS="php swift openssl ffmpeg node"
  for h in $(grep -oE '\b[0-9a-f]{10}\b' "$m" | sort -u); do
    found=0
    for rp in $CH16_REPOS; do
      [ -d "repos/$rp/.git" ] && git -C "repos/$rp" cat-file -e "${h}^{object}" 2>/dev/null && { found=1; break; }
    done
    [ $found -eq 1 ] || { echo "FAIL $m: hash $h not in any ch16 clone"; fail=1; }
  done
  echo "checked $(grep -oE '\b[0-9a-f]{10}\b' "$m" | sort -u | wc -l) hashes against ch16 clones (union)"
  for r in $(grep -oE '\[R[0-9]+\]' "$m" | tr -d '[]' | sort -u); do
    n=${r#R}; grep -qE "^- \*\*R${n}\*\* " "$m" || { echo "FAIL $m: $r cited but no receipt line"; fail=1; }
  done
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
