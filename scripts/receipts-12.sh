#!/usr/bin/env bash
# Receipts for chapter 12 (php-src — the zerodium backdoor / impersonation).
cd "$(dirname "$0")/.."
out=chapters/12-php.receipts.md
g() { desc=$1; cmd=$2; cap=$3; echo '```'; echo "$ $desc"; eval "$cmd" 2>&1 | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — ch. 12 php-src (the zerodium backdoor)"
echo
echo "Verbatim outputs against a full clone of php/php-src."
echo "Regenerate with \`scripts/receipts-12.sh\`. Long outputs truncated editorially (head)."
echo
echo "## R1 — the commit that calls itself a typo, signed by the founder"
g "git -C repos/php show -s --format=fuller c730aa26bd" "git -C repos/php show -s --format=fuller c730aa26bd52829a49f2ad284b181b7e82a68d7d" 12
echo "## R2 — the diff: eleven lines that evaluate an attacker's header"
g "git -C repos/php show c730aa26bd -- ext/zlib/zlib.c | grep -E '^\+' | grep -vE '^\+\+\+'" "git -C repos/php show c730aa26bd52829a49f2ad284b181b7e82a68d7d -- ext/zlib/zlib.c | grep -E '^\+' | grep -vE '^\+\+\+'" 14
echo "## R3 — Rasmus's only Signed-off-by in the entire repository"
g "git -C repos/php log --all --author=Rasmus --grep='Signed-off-by' --format='%H %aI %ae %s'" "git -C repos/php log --all --author='Rasmus' --grep='Signed-off-by' --format='%H %aI %ae %s'" 3
echo "## R4 — the real Rasmus commits sit in American timezones; the fake is +0200 at dawn"
g "git -C repos/php log --all --author='rasmus@lerdorf.com' --format='%aI %s' | head -6" "git -C repos/php log --all --author='rasmus@lerdorf.com' --format='%aI %s' | head -6" 7
echo "## R5 — five hours later: the revert names it a compromised account"
g "git -C repos/php show -s --format=fuller 046827a7e8" "git -C repos/php show -s --format=fuller 046827a7e867bb0e655923c75c25a20d06e3aa8b" 12
echo "## R6 — the attacker comes back wearing Nikita's name; identical tree"
g "git -C repos/php show -s --format='%h %aI %an <%ae> %s' 2b0f239b21" "git -C repos/php show -s --format='%h %aI %an <%ae> %s' 2b0f239b211c7544ebc7a4cd2c977a5b7a11ed8a" 2
g "git -C repos/php rev-parse 'c730aa26^{tree}' '2b0f239b^{tree}'" "git -C repos/php rev-parse 'c730aa26bd52829a49f2ad284b181b7e82a68d7d^{tree}' '2b0f239b211c7544ebc7a4cd2c977a5b7a11ed8a^{tree}'" 3
echo "## R7 — the whole four-commit revert war (pickaxe on the payload word)"
g "git -C repos/php log --all -S zerodium --format='%h %aI %an %s' -- ext/zlib/zlib.c" "git -C repos/php log --all -S zerodium --format='%h %aI %an %s' -- ext/zlib/zlib.c" 5
g "git -C repos/php log --all --grep=zerodium --oneline | wc -l   # zero: the word is never in a message" "git -C repos/php log --all --grep=zerodium --oneline | wc -l" 1
echo "## R8 — both malicious commits are ancestors of master today"
g "git -C repos/php merge-base --is-ancestor c730aa26bd HEAD && echo 'c730aa26: ANCESTOR of HEAD'" "git -C repos/php merge-base --is-ancestor c730aa26bd52829a49f2ad284b181b7e82a68d7d HEAD && echo 'c730aa26: ANCESTOR of HEAD'" 1
g "git -C repos/php merge-base --is-ancestor 2b0f239b21 HEAD && echo '2b0f239b: ANCESTOR of HEAD'" "git -C repos/php merge-base --is-ancestor 2b0f239b211c7544ebc7a4cd2c977a5b7a11ed8a HEAD && echo '2b0f239b: ANCESTOR of HEAD'" 1
echo "## R9 — the day after: the door the attacker came through is removed from the docs"
g "git -C repos/php show -s --format='%h %aI %an <%ae>%n%s' 49a20cf3db" "git -C repos/php show -s --format='%h %aI %an <%ae>%n%s' 49a20cf3db63879cc04b40c9cc799cd23a13efa6" 4
g "git -C repos/php show 49a20cf3db -- README.md | grep -E '^[+-]' | grep -iE 'git.php.net|mirror|github' | head -5" "git -C repos/php show 49a20cf3db63879cc04b40c9cc799cd23a13efa6 -- README.md | grep -E '^[+-]' | grep -iE 'git.php.net|mirror|github' | head -5" 6
echo "## R10 — the canonical remote moved: today's tip is committed by GitHub"
g "git -C repos/php log -1 --format='%h %aI committer=%cn <%ce>%n%s'" "git -C repos/php log -1 --format='%h %aI committer=%cn <%ce>%n%s'" 3
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
