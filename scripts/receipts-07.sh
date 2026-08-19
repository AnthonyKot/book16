#!/usr/bin/env bash
# Receipts for chapter 07 (vim — the last 32 hours and the succession). Clone at repos/vim.
cd "$(dirname "$0")/.."
repo=repos/vim
out=chapters/07-vim.receipts.md
r() { cap=$1; shift; echo '```'; printf '$ git -C repos/vim'; printf ' %q' "$@"; echo; git -C "$repo" "$@" 2>&1 | head -n "$cap"; echo '```'; echo; }
g() { desc=$1; cmd=$2; cap=$3; echo '```'; echo "$ $desc"; eval "$cmd" 2>&1 | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — ch. 07 vim (the last 32 hours and the succession)"
echo
echo "Verbatim outputs against a full clone of https://github.com/vim/vim."
echo "Regenerate with \`scripts/receipts-07.sh\`. Long outputs truncated editorially (head)."
echo
echo "## R1 — the last five commits with Bram as committer"
g "git -C repos/vim log --committer='Bram' --format='%ci %an | %s' | head -5" "git -C \"$repo\" log --committer='Bram' --format='%ci %an | %s'" 5
echo "## R2 — Friday 18:57: patch 9.0.1673, the teapot"
r 8 show -s --format='%H%n%ai %an%n%s%n%b' 80adaa8ae8398403ca4e9797219ea9a501fc76a5
g "git -C repos/vim show 80adaa8ae8 | grep -E 'E418|E503' | head -4" "git -C \"$repo\" show 80adaa8ae8398403ca4e9797219ea9a501fc76a5 | grep -E 'E418|E503'" 4
echo "## R3 — 23:19: the new help entry is put in alphabetical order"
r 5 show -s --format='%H%n%ai%n%s%n%b' 416bd916b4cc4502eb734218f406e4edd8dd199c
echo "## R4 — 00:54 Saturday: the last commit Bram authors"
r 6 show -s --format='%H%nauthor    %an <%ae> %ai%ncommitter %cn %ci%n%s' 16abd997c99b1a40fb0ba54889ce0cf44d7585b4
echo "## R5 — 02:38 Sunday: the last commit Bram applies — a stranger's typo fix"
r 6 show -s --format='%H%nauthor    %an <%ae> %ai%ncommitter %cn %ci%n%s' 4c0089d696b8d1d5dc40568f25ea5738fa5bbffb
g "git -C repos/vim show 4c0089d696 | grep -E '^[+-].*argu' | head -2" "git -C \"$repo\" show 4c0089d696b8d1d5dc40568f25ea5738fa5bbffb | grep -E '^[+-].*argu'" 2
echo "## R6 — fifteen years, one name: decade shortlogs and the first non-Bram author"
r 2 shortlog -sn HEAD --since=2004-01-01 --until=2011-01-01
r 2 shortlog -sn HEAD --since=2011-01-01 --until=2019-01-01
g "git -C repos/vim log --reverse --format='%H %ai %an %s' | grep -v 'Bram Moolenaar' | head -1" "git -C \"$repo\" log --reverse --format='%H %ai %an %s' | grep -v 'Bram Moolenaar' | head -1" 1
echo "## R7 — the contributors live in the body: 404 Bram-authored commits credit Christian Brabandt"
g "git -C repos/vim log --author='Bram Moolenaar' --grep='(Christian Brabandt)' --format='%h' | wc -l" "git -C \"$repo\" log --author='Bram Moolenaar' --grep='(Christian Brabandt)' --format='%h' | wc -l" 1
g "git -C repos/vim log --author='Bram Moolenaar' --grep='(Christian Brabandt)' --format='%h %aI %s' | head -2" "git -C \"$repo\" log --author='Bram Moolenaar' --grep='(Christian Brabandt)' --format='%h %aI %s' | head -2" 2
echo "## R8 — the constitution: the first three 'Merge pull request' subjects in the whole history"
g "git -C repos/vim log --reverse --grep='Merge pull request' --format='%H %ai %an %s' | head -3" "git -C \"$repo\" log --reverse --grep='Merge pull request' --format='%H %ai %an %s' | head -3" 3
g "git -C repos/vim show --stat --format='%s' 7a212c625362 | tail -4" "git -C \"$repo\" show --stat --format='%s' 7a212c625362d86327878d57269d63f6a2ca5d2b | tail -4" 4
echo "## R9 — 2020: LICENSE added 'because Vim license not easy to find on github' — naming one human"
r 6 show -s --format='%H%n%ai %an%n%s%n%b' c838626fea42ed5924ee6084d87d1b37b2d7b0ff
g "git -C repos/vim show c838626fea:LICENSE | sed -n '24,26p'" "git -C \"$repo\" show c838626fea42ed5924ee6084d87d1b37b2d7b0ff:LICENSE | sed -n '24,26p'" 3
echo "## R10 — the bridge: the succession's first patch was authored while Bram was alive"
r 5 show -s --format='%H%nauthor    %an %aI%ncommitter %cn %cI%n%s' 84bc00e9b52b1174888f2f696f8b628a83c49988
echo "## R11 — 13 August 2023: the announcement the LICENSE promised"
r 4 show -s --format='%H%n%ai %an%n%s' e978b4534a5e10471108259118c0ef791106fd92
g "git -C repos/vim show e978b4534a -- LICENSE | grep -E '^[+-].*maintainer' " "git -C \"$repo\" show e978b4534a5e10471108259118c0ef791106fd92 -- LICENSE | grep -E '^[+-].*maintainer'" 3
g "git -C repos/vim show e978b4534a -- README.txt | grep -E '^[+-].*(flowers|Bram|vim-dev)'" "git -C \"$repo\" show e978b4534a5e10471108259118c0ef791106fd92 -- README.txt | grep -E '^[+-].*(flowers|Bram|vim-dev)'" 5
g "git -C repos/vim show e978b4534a:runtime/doc/version9.txt | sed -n '47,49p'" "git -C \"$repo\" show e978b4534a5e10471108259118c0ef791106fd92:runtime/doc/version9.txt | sed -n '47,49p'" 3
echo "## R12 — the machine survives: the patch counter never resets, the grammar stays"
g "git -C repos/vim log --reverse --committer='Christian Brabandt' --since=2023-08-03 --format='%ci %an | %s' | head -2" "git -C \"$repo\" log --reverse --committer='Christian Brabandt' --since=2023-08-03 --format='%ci %an | %s' | head -2" 2
r 7 shortlog -sn HEAD --since=2023-08-03
echo "## R14 — twenty-nine days: every commit in the repository between 8 July and 9 August"
g "git -C repos/vim log --format='%ci %an | committer=%cn | %s' --since=2023-07-08 --until=2023-08-09 --reverse | head -4" "git -C \"\$repo\" log --format='%ci %an | committer=%cn | %s' --since=2023-07-08 --until=2023-08-09 --reverse | head -4" 4
echo "## R15 — the 2019 revert's message body is empty"
g "git -C repos/vim show -s --format='%an %aI%n%s%n---body---%n%b' d52986e7be" "git -C \"\$repo\" show -s --format='%an %aI%n%s%n---body---%n%b' d52986e7be366b6f8c9e18078648f1c5219c4335" 5
echo "## R13 — the flowers line arrives in README.txt in 2010"
g "git -C repos/vim log --reverse -S 'flowers' --format='%h %ai %s' -- README.txt | head -1" "git -C \"\$repo\" log --reverse -S 'flowers' --format='%h %ai %s' -- README.txt | head -1" 1
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
