#!/usr/bin/env bash
# Receipts for chapter 10 (tensor2tensor — the Transformer's own repository).
cd "$(dirname "$0")/.."
out=chapters/10-t2t.receipts.md
r() { repo=$1; cap=$2; shift 2; echo '```'; printf '$ git -C repos/%s' "$repo"; printf ' %q' "$@"; echo; git -C "repos/$repo" "$@" 2>&1 | head -n "$cap"; echo '```'; echo; }
g() { desc=$1; cmd=$2; cap=$3; echo '```'; echo "$ $desc"; eval "$cmd" 2>&1 | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — ch. 10 tensor2tensor (the Transformer's repository)"
echo
echo "Verbatim outputs against a full clone of tensorflow/tensor2tensor."
echo "Regenerate with \`scripts/receipts-10.sh\`. Long outputs truncated editorially (head)."
echo
echo "## R1 — day one: a title, then 155 seconds later, the Transformer"
g "git -C repos/tensor2tensor log --reverse --format='%h %ai %an %s' | head -3" "git -C repos/tensor2tensor log --reverse --format='%h %ai %an %s' | head -3" 4
g "git -C repos/tensor2tensor show --stat --format= cedf0e2df6 | tail -2" "git -C repos/tensor2tensor show --stat --format= cedf0e2df6c8b155856b31da58fc12b1c737e862 | tail -2" 3
g "git -C repos/tensor2tensor show --shortstat --format= 3d9c62f2ac | tail -1" "git -C repos/tensor2tensor show --shortstat --format= 3d9c62f2aca9492db5c22676416974005b9dcbae | tail -1" 2
echo "## R2 — what the initial push already contains"
g "git -C repos/tensor2tensor show 3d9c62f2ac:tensor2tensor/models/transformer.py | sed -n '15,20p'" "git -C repos/tensor2tensor show 3d9c62f2aca9492db5c22676416974005b9dcbae:tensor2tensor/models/transformer.py | sed -n '15,20p'" 7
g "git -C repos/tensor2tensor show 3d9c62f2ac:tensor2tensor/models/transformer.py | wc -l" "git -C repos/tensor2tensor show 3d9c62f2aca9492db5c22676416974005b9dcbae:tensor2tensor/models/transformer.py | wc -l" 1
g "git -C repos/tensor2tensor show 3d9c62f2ac:AUTHORS | tail -2" "git -C repos/tensor2tensor show 3d9c62f2aca9492db5c22676416974005b9dcbae:AUTHORS | tail -2" 3
echo "## R3 — who commits, and who never does"
r tensor2tensor 8 shortlog -sn HEAD
g "git -C repos/tensor2tensor shortlog -sn HEAD | grep -E 'Vaswani|Parmar|Gomez'" "git -C repos/tensor2tensor shortlog -sn HEAD | grep -E 'Vaswani|Parmar|Gomez'" 4
g "git -C repos/tensor2tensor log --author='Uszkoreit' --oneline | wc -l" "git -C repos/tensor2tensor log --author='Uszkoreit' --oneline | wc -l" 1
g "git -C repos/tensor2tensor log --author='Polosukhin' --oneline | wc -l" "git -C repos/tensor2tensor log --author='Polosukhin' --oneline | wc -l" 1
g "git -C repos/tensor2tensor log --author='Llion' --oneline | wc -l" "git -C repos/tensor2tensor log --author='Llion' --oneline | wc -l" 1
echo "## R4 — week one: the projection shows the office"
g "git -C repos/tensor2tensor show --stat --format=fuller 01787ca8a5 | head -10" "git -C repos/tensor2tensor show --stat --format=fuller 01787ca8a53e96c56eb6826443c5a12a29e9209a | head -10" 11
g "git -C repos/tensor2tensor show 01787ca8a5 | grep -E '^[+-]' | grep -iE 'blaze|brain' | head -3" "git -C repos/tensor2tensor show 01787ca8a53e96c56eb6826443c5a12a29e9209a | grep -E '^[+-]' | grep -iE 'blaze|brain' | head -3" 4
echo "## R5 — the look_right timeline, newest first"
g "git -C repos/tensor2tensor log -S look_right --format='%h %ai %an %s' -- '*.py'" "git -C repos/tensor2tensor log -S 'look_right' --format='%h %ai %an %s' -- '*.py'" 6
echo "## R6 — the unsafe signature arrives inside a commit about something else"
g "git -C repos/tensor2tensor show 75270907db -- tensor2tensor/models/common_attention.py | grep -B1 -A2 'masked_local_attention_1d' | head -8" "git -C repos/tensor2tensor show 75270907dbba3c7c224a08515d33167c29e26aed -- tensor2tensor/models/common_attention.py | grep -B1 -A2 'masked_local_attention_1d' | head -8" 9
echo "## R7 — the file changes address while the bug is live"
g "git -C repos/tensor2tensor show --summary --format='%h %ai %an %s' f6799b9515 -- tensor2tensor/models/common_attention.py tensor2tensor/layers/common_attention.py" "git -C repos/tensor2tensor show --summary --format='%h %ai %an %s' f6799b9515e0e214d2d4295f4e4cf94cf27cf333 -- tensor2tensor/models/common_attention.py tensor2tensor/layers/common_attention.py" 4
echo "## R8 — the first author of the paper reads the loss curve"
g "git -C repos/tensor2tensor show -s --format=fuller a0bd0177bf | head -16" "git -C repos/tensor2tensor show -s --format=fuller a0bd0177bf766c953041b7451398ab1791adb1e5 | head -16" 17
g "git -C repos/tensor2tensor show a0bd0177bf -- tensor2tensor/layers/common_attention.py | grep -E '^[+-].*look_right' | head -3" "git -C repos/tensor2tensor show a0bd0177bf766c953041b7451398ab1791adb1e5 -- tensor2tensor/layers/common_attention.py | grep -E '^[+-].*look_right' | head -3" 4
echo "## R9 — day 16: correctness wins, and says what it costs"
g "git -C repos/tensor2tensor show -s --format=fuller 98be812807 | head -12" "git -C repos/tensor2tensor show -s --format=fuller 98be8128078b8a8da34271eea60ad88f879389d7 | head -12" 13
echo "## R10 — 2019: a sincere one-line fix to the most famous formula in the library"
g "git -C repos/tensor2tensor show -s --format='%h %ai %an %s' e3e54900d3" "git -C repos/tensor2tensor show -s --format='%h %ai %an %s' e3e54900d377940c2930285104d6b05bf7cf0330" 2
g "git -C repos/tensor2tensor show e3e54900d3 -- tensor2tensor/layers/common_attention.py | grep -E '^[+-].*position' | head -2" "git -C repos/tensor2tensor show e3e54900d377940c2930285104d6b05bf7cf0330 -- tensor2tensor/layers/common_attention.py | grep -E '^[+-].*position' | head -2" 3
echo "## R11 — nine days later: compatibility wins, and says why"
g "git -C repos/tensor2tensor show --stat --format=fuller e4ea462e73 | head -18" "git -C repos/tensor2tensor show --stat --format=fuller e4ea462e73388b6c8a2ea99a5d92aacd9c3237c5 | head -18" 19
echo "## R12 — the TODO that outlived both names"
g "git -C repos/tensor2tensor log -S 'ask rsepassi' --format='%h %ai %an %s'" "git -C repos/tensor2tensor log -S 'ask rsepassi' --format='%h %ai %an %s'" 2
g "git -C repos/tensor2tensor blame -L 250,251 tensor2tensor/bin/t2t_trainer.py" "git -C repos/tensor2tensor blame -L 250,251 tensor2tensor/bin/t2t_trainer.py" 3
g "git -C repos/tensor2tensor log --author=Sepassi -1 --format='%ai %s'" "git -C repos/tensor2tensor log --author='Sepassi' -1 --format='%ai %s'" 2
g "git -C repos/tensor2tensor log --author=Shazeer -1 --format='%ai %s'" "git -C repos/tensor2tensor log --author='Shazeer' -1 --format='%ai %s'" 2
echo "## R13 — the fade: one word, then a timer"
g "git -C repos/tensor2tensor log --format='%ad' --date=format:%Y | sort | uniq -c | tail -7" "git -C repos/tensor2tensor log --format='%ad' --date=format:%Y | sort | uniq -c | tail -7" 8
g "git -C repos/tensor2tensor show 302a04f0e4 -- README.md | grep -E '^[+-].*mode|^[+-].*deprecated' | head -2" "git -C repos/tensor2tensor show 302a04f0e47252458984a7b3fb95057792a06f9a -- README.md | grep -E '^[+-].*(mode|deprecated)' | head -2" 3
g "git -C repos/tensor2tensor log -1 --format='%h %ai %an %s'" "git -C repos/tensor2tensor log -1 --format='%h %ai %an %s'" 2
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
