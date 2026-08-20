#!/usr/bin/env bash
# Receipts for chapter 11 (ffmpeg — the fork war as git objects).
cd "$(dirname "$0")/.."
out=chapters/11-ffmpeg.receipts.md
g() { desc=$1; cmd=$2; cap=$3; echo '```'; echo "$ $desc"; eval "$cmd" 2>&1 | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — ch. 11 ffmpeg (the fork war)"
echo
echo "Verbatim outputs against a full clone of FFmpeg/FFmpeg."
echo "Regenerate with \`scripts/receipts-11.sh\`. Long outputs truncated editorially (head)."
echo
echo "## R1 — the restore, with its reason"
g "git -C repos/ffmpeg log -1 --format='%aD%n%an%n%B' 111ccca602" "git -C repos/ffmpeg log -1 --format='%aD%n%an%n%B' 111ccca602e96f18d4fab1117b2b768ae51814f7" 7
echo "## R2 — what had been committed: seven lines out of MAINTAINERS"
g "git -C repos/ffmpeg show --format='%aD %an <%ae>%n%s' f4f5cab94e -- MAINTAINERS | head -19" "git -C repos/ffmpeg show --format='%aD %an <%ae>%n%s' f4f5cab94e0881cd30965b28f3d78d9c63d6918e -- MAINTAINERS | head -19" 20
echo "## R3 — the day before: the no-merge constitution"
g "git -C repos/ffmpeg show -s --format='%aD %an %s' ffe9fd253f" "git -C repos/ffmpeg show -s --format='%aD %an %s' ffe9fd253f21db43ccc52a4043af94b7b9044f53" 2
g "git -C repos/ffmpeg show --format= ffe9fd253f -- doc/git-howto.txt | grep -E '^\+.*[Mm]erge' | head -3" "git -C repos/ffmpeg show --format= ffe9fd253f21db43ccc52a4043af94b7b9044f53 -- doc/git-howto.txt | grep -E '^\+.*[Mm]erge' | head -3" 4
echo "## R4 — seventy-five days later, the first qatar merge; then a thousand more"
g "git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%H %aI %an %s' --reverse | head -1" "git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%H %aI %an %s' --reverse | head -1" 2
g "git -C repos/ffmpeg rev-list --count --min-parents=2 --grep=qatar HEAD" "git -C repos/ffmpeg rev-list --count --min-parents=2 --grep=qatar HEAD" 1
g "git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%an' | sort | uniq -c" "git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%an' | sort | uniq -c" 2
echo "## R5 — the hour of the merges"
g "git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%ad' --date=format:%H | sort | uniq -c | sort -rn | head -3" "git -C repos/ffmpeg log --grep=qatar --min-parents=2 --format='%ad' --date=format:'%H' | sort | uniq -c | sort -rn | head -3" 4
echo "## R6 — the last qatar merge: a conflict, a cross-reference, no goodbye"
g "git -C repos/ffmpeg log -1 --format='%aI%n%B' 4899ccd295" "git -C repos/ffmpeg log -1 --format='%aI%n%B' 4899ccd29572f139b0da648212595d3affc9bf5d" 10
echo "## R7 — the name, changed in 1,335 files at once, and the rename reverted"
g "git -C repos/ffmpeg show --shortstat --format='%aD %an %s' 2912e87a6c | tail -3" "git -C repos/ffmpeg show --shortstat --format='%aD %an %s' 2912e87a6c9264d556734e2bf94a99c64cf9b102 | tail -3" 4
g "git -C repos/ffmpeg log -1 --format='%aI %an %s' c0b1bc8d17" "git -C repos/ffmpeg log -1 --format='%aI %an %s' c0b1bc8d1797355c4f65ae4c488705b98cf9c8e9" 2
echo "## R8 — who won the string"
g "git -C repos/ffmpeg grep -l 'This file is part of Libav' HEAD | wc -l" "git -C repos/ffmpeg grep -l 'This file is part of Libav' HEAD | wc -l" 1
g "git -C repos/ffmpeg grep -l 'This file is part of FFmpeg' HEAD | wc -l" "git -C repos/ffmpeg grep -l 'This file is part of FFmpeg' HEAD | wc -l" 1
echo "## R9 — the biography of a heading, 2006–2022"
g "git -C repos/ffmpeg log -S 'Project Leader' --format='%h %ai %an %s' -- MAINTAINERS" "git -C repos/ffmpeg log -S 'Project Leader' --format='%h %ai %an %s' -- MAINTAINERS" 5
echo "## R10 — 2015: the name leaves; the office stays"
g "git -C repos/ffmpeg show --format='%aD %an%n%s' f2c58931e6 | head -8" "git -C repos/ffmpeg show --format='%aD %an%n%s' f2c58931e629343f7d68258cc2b2d62c5f501ba5 | head -8" 9
echo "## R11 — 2022: the office is taken down"
g "git -C repos/ffmpeg show --format='%aD %an%n%B' 07d930014d | head -11" "git -C repos/ffmpeg show --format='%aD %an%n%B' 07d930014d839dc1c10f3a539e78cc7f8b9d7a4a | head -11" 12
echo "## R12 — the census"
g "git -C repos/ffmpeg shortlog -sn HEAD | head -5" "git -C repos/ffmpeg shortlog -sn HEAD | head -5" 6
g "git -C repos/ffmpeg rev-list --count --min-parents=2 --author='Michael Niedermayer' HEAD" "git -C repos/ffmpeg rev-list --count --min-parents=2 --author='Michael Niedermayer' HEAD" 1
echo "## R13 — 2017: a merge invents a path that exists in neither parent"
g "git -C repos/ffmpeg show -s --format='%aI %an %s' fd5f4ac081" "git -C repos/ffmpeg show -s --format='%aI %an %s' fd5f4ac0813c27c34c387f00044905a859e29e37" 2
g "git -C repos/ffmpeg ls-tree 'fd5f4ac081^1' ffmpeg.c | head -1" "git -C repos/ffmpeg ls-tree 'fd5f4ac0813c27c34c387f00044905a859e29e37^1' ffmpeg.c | head -1" 2
g "git -C repos/ffmpeg ls-tree 'fd5f4ac081^2' avtools/avconv.c | head -1" "git -C repos/ffmpeg ls-tree 'fd5f4ac0813c27c34c387f00044905a859e29e37^2' avtools/avconv.c | head -1" 2
g "git -C repos/ffmpeg ls-tree fd5f4ac081 fftools/ffmpeg.c | head -1" "git -C repos/ffmpeg ls-tree fd5f4ac0813c27c34c387f00044905a859e29e37 fftools/ffmpeg.c | head -1" 2
g "git -C repos/ffmpeg log --reverse --follow --format='%h %aI %s' -- fftools/ffmpeg.c | head -1" "git -C repos/ffmpeg log --reverse --follow --format='%h %aI %s' -- fftools/ffmpeg.c | head -1" 2
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
