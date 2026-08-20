#!/usr/bin/env bash
# Receipts for chapter 09 (the npm sabotage pair — event-stream, colors).
cd "$(dirname "$0")/.."
out=chapters/09-npm.receipts.md
r() { repo=$1; cap=$2; shift 2; echo '```'; printf '$ git -C repos/%s' "$repo"; printf ' %q' "$@"; echo; git -C "repos/$repo" "$@" 2>&1 | head -n "$cap"; echo '```'; echo; }
g() { desc=$1; cmd=$2; cap=$3; echo '```'; echo "$ $desc"; eval "$cmd" 2>&1 | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — ch. 09 the npm sabotage pair (event-stream + colors)"
echo
echo "Verbatim outputs against full clones of dominictarr/event-stream and Marak/colors.js."
echo "Regenerate with \`scripts/receipts-09.sh\`. Long outputs truncated editorially (head)."
echo
echo "## R1 — event-stream: the house style — a helper is a require and a re-export"
g "git -C repos/event-stream show --stat --format='%h %aI %an %s' 53c59a38da" "git -C repos/event-stream show --stat --format='%h %aI %an %s' 53c59a38da9ea58dc73085268c780234149b43c8" 6
g "git -C repos/event-stream show 53c59a38da -- index.js package.json | grep -E '^\+' | grep -iE 'map|version' | head -4" "git -C repos/event-stream show 53c59a38da9ea58dc73085268c780234149b43c8 -- index.js package.json | grep -E '^\+' | grep -iE 'map|version' | head -4" 5
echo "## R2 — event-stream: the last of one maintainer, the first of the next"
g "git -C repos/event-stream log --author='Dominic Tarr' --format='%h %aI %s' | head -2" "git -C repos/event-stream log --author='Dominic Tarr' --format='%h %aI %s' | head -2" 3
g "git -C repos/event-stream log --reverse --author=北川 --format='%h %aI %an <%ae> %s' | head -3" "git -C repos/event-stream log --reverse --author='北川' --format='%h %aI %an <%ae> %s' | head -3" 4
echo "## R3 — event-stream: the new maintainer's first week, in full, up to the payload"
g "git -C repos/event-stream log --author=北川 --reverse --format='%h %aI %s' | head -9" "git -C repos/event-stream log --author='北川' --reverse --format='%h %aI %s' | head -9" 10
g "git -C repos/event-stream show a74c9b2ab4 -- package.json | grep -E 'map-stream'" "git -C repos/event-stream show a74c9b2ab433c4e36089fbb72931f6b786b550f5 -- package.json | grep -E 'map-stream'" 3
echo "## R4 — event-stream: the payload — two lines and a dependency, in the house style"
g "git -C repos/event-stream show e3163361fe -- index.js package.json | grep -E '^[+-]' | grep -vE '^[+-]{3}' | head -6" "git -C repos/event-stream show e3163361fed01384c986b9b4c18feb1fc42b8285 -- index.js package.json | grep -E '^[+-]' | grep -vE '^[+-]{3}' | head -6" 7
echo "## R5 — event-stream: nine minutes later, the version every caret range will select — untagged"
g "git -C repos/event-stream show -s --format='%h %aI %s' e3163361fe 5999958dfc" "git -C repos/event-stream show -s --format='%h %aI %s' e3163361fed01384c986b9b4c18feb1fc42b8285 5999958dfc1b0a80e6caeac4cdc76b3b828bdfe2" 3
g "git -C repos/event-stream tag --list '3.3.6'   # (empty)" "git -C repos/event-stream tag --list '3.3.6'" 1
echo "## R6 — event-stream: seven days later, four minutes wash the face of the repository"
g "git -C repos/event-stream show -s --format='%h %aI %s' 908fee5c65 2bd63d58fe 8bc742ba91" "git -C repos/event-stream show -s --format='%h %aI %s' 908fee5c65d4eb02809a84a1ebc3e5df1f935cd1 2bd63d58fe24367372690c29c7249ed1c7145601 8bc742ba91aca6c5f5b9467d8d7653c95ec98f7d" 4
g "git -C repos/event-stream show 908fee5c65 -- index.js | grep -E '^[+-].*(flatmap|filterSync)' | head -4" "git -C repos/event-stream show 908fee5c65d4eb02809a84a1ebc3e5df1f935cd1 -- index.js | grep -E '^[+-].*(flatmap|filterSync)' | head -4" 5
g "git -C repos/event-stream show 2bd63d58fe -- package.json | grep -E '^[+-].*(version|flatmap)'" "git -C repos/event-stream show 2bd63d58fe24367372690c29c7249ed1c7145601 -- package.json | grep -E '^[+-].*(version|flatmap)'" 4
g "git -C repos/event-stream for-each-ref --format='%(refname:short) %(creatordate:iso-strict) %(objectname:short) %(subject)' refs/tags | tail -2" "git -C repos/event-stream for-each-ref --format='%(refname:short) %(creatordate:iso-strict) %(objectname:short) %(subject)' refs/tags | tail -2" 3
echo "## R7 — event-stream: the crime the news describes is not in this git"
g "git -C repos/event-stream log -S copay --all --oneline | wc -l" "git -C repos/event-stream log -S copay --all --oneline | wc -l" 1
g "git -C repos/event-stream log -S bitcoin --all --oneline | wc -l" "git -C repos/event-stream log -S bitcoin --all --oneline | wc -l" 1
g "git -C repos/event-stream log -S wallet --all --oneline | wc -l" "git -C repos/event-stream log -S wallet --all --oneline | wc -l" 1
echo "## R8 — event-stream: how the repository ends"
g "git -C repos/event-stream log -1 --format='%H%n%aI%n%an <%ae>%n%s'" "git -C repos/event-stream log -1 --format='%H%n%aI%n%an <%ae>%n%s'" 5
g "git -C repos/event-stream show HEAD:package.json | grep '\"author\"'" "git -C repos/event-stream show HEAD:package.json | grep '\"author\"'" 2
echo "## R9 — colors: day one, 02:56 on a Friday"
r colors 2 log --reverse --format='%h %aI %an %s'
g "git -C repos/colors show --stat --format= 270314c42b | tail -3" "git -C repos/colors show --stat --format= 270314c42b09ba393ab64598e375a53ce35010df | tail -3" 4
g "git -C repos/colors show 270314c42b:ReadMe.md" "git -C repos/colors show 270314c42b09ba393ab64598e375a53ce35010df:ReadMe.md" 2
echo "## R10 — colors: 2011 — the joke is checked in"
g "git -C repos/colors log --all --reverse -S zalgo --format='%h %aI %an %s' | head -1" "git -C repos/colors log --all --reverse -S zalgo --format='%h %aI %an %s' | head -1" 2
g "git -C repos/colors show 4b6bc29521 -- colors.js | grep -E '^\+' | head -5" "git -C repos/colors show 4b6bc295218eed1aafe866a5f6d90eea50a8cb39 -- colors.js | grep -E '^\+' | head -5" 6
echo "## R11 — colors: who ships vs who owns"
r colors 5 shortlog -sn --all
g "git -C repos/colors shortlog -sn --all --since=2018-01-01 --until=2020-01-01" "git -C repos/colors shortlog -sn --all --since=2018-01-01 --until=2020-01-01" 6
g "git -C repos/colors show HEAD:package.json | grep '\"author\"'" "git -C repos/colors show HEAD:package.json | grep '\"author\"'" 2
echo "## R12 — colors: Friday night, 7 January 2022 — four commits, three and a half minutes"
r colors 4 log -4 --format='%h %ai %an %s'
echo "## R13 — colors: what the first commit of the night adds to the entry point"
g "git -C repos/colors show 074a0f8ed0 -- lib/index.js | grep -E '^\+' | head -11" "git -C repos/colors show 074a0f8ed0c31c35d13d28632bd8a049ff136fb6 -- lib/index.js | grep -E '^\+' | head -11" 12
echo "## R14 — colors: 'Fix bug' — one character, so the loop can run"
g "git -C repos/colors show --format='%h %aI %s' 5d2d242f65 | head -8" "git -C repos/colors show --format='%h %aI %s' 5d2d242f656103ac38086d6b26433a09f1c38c75 | grep -vE '^(diff|index|---|\+\+\+|@@)' | head -8" 9
echo "## R15 — colors: nobody ever reverts; master is still the payload"
g "git -C repos/colors branch -a --contains 074a0f8ed0" "git -C repos/colors branch -a --contains 074a0f8ed0c31c35d13d28632bd8a049ff136fb6" 4
g "git -C repos/colors tag --contains 074a0f8ed0   # (empty)" "git -C repos/colors tag --contains 074a0f8ed0c31c35d13d28632bd8a049ff136fb6" 1
g "git -C repos/colors log --all --grep=Revert --format='%h %ai %s' | head -1   # newest revert in the repo" "git -C repos/colors log --all --grep=Revert --format='%h %ai %s' | head -1" 2
echo "## R16 — colors: the speech everyone remembers is not here"
g "git -C repos/colors log --all -S 'no more' --oneline | wc -l" "git -C repos/colors log --all -S 'no more' --oneline | wc -l" 1
g "git -C repos/colors log --all -G 'free work|unpaid|I will no longer' --oneline | wc -l" "git -C repos/colors log --all -G 'free work|unpaid|I will no longer' --oneline | wc -l" 1
echo "## R17 — colors: the versions the incident reports name were never committed"
g "git -C repos/colors log --all -G '1\\.4\\.[1-9]' --format='%h %ai %s' -- package.json" "git -C repos/colors log --all -G '1\\.4\\.[1-9]' --format='%h %ai %s' -- package.json" 3
g "git -C repos/colors for-each-ref --sort=creatordate --format='%(refname:short) %(creatordate:short)' refs/tags | tail -1   # newest tag" "git -C repos/colors for-each-ref --sort=creatordate --format='%(refname:short) %(creatordate:short)' refs/tags | tail -1" 2
echo "## R18 — colors: on the shipping branch, the owner's previous commit is six and a half years old"
g "git -C repos/colors log --first-parent --author=Marak --format='%h %ai %s' | head -5" "git -C repos/colors log --first-parent --author='Marak' --format='%h %ai %s' | head -5" 6
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
