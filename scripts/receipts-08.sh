#!/usr/bin/env bash
# Receipts for chapter 08 (the corporate costume — cross-repo: msdos, the-algorithm, swift).
cd "$(dirname "$0")/.."
out=chapters/08-costume.receipts.md
r() { repo=$1; cap=$2; shift 2; echo '```'; printf '$ git -C repos/%s' "$repo"; printf ' %q' "$@"; echo; git -C "repos/$repo" "$@" 2>&1 | head -n "$cap"; echo '```'; echo; }
g() { desc=$1; cmd=$2; cap=$3; echo '```'; echo "$ $desc"; eval "$cmd" 2>&1 | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — ch. 08 the corporate costume (cross-repo)"
echo
echo "Verbatim outputs against full clones of microsoft/MS-DOS, twitter/the-algorithm, swiftlang/swift."
echo "Regenerate with \`scripts/receipts-08.sh\`. Long outputs truncated editorially (head)."
echo
echo "## R1 — msdos: the first four commits; two claim the 1980s"
r msdos 4 log --reverse --format='%h %aI %cI %an %s'
echo "## R2 — msdos: the 1982 commit's two dates share a clock second, 36 years apart"
g "git -C repos/msdos show -s --format=fuller fce0f75959 80ab2fddfd | grep -E 'commit|Date'" "git -C repos/msdos show -s --format=fuller fce0f75959b9806f4016beb7b19e19b37cc97b6c 80ab2fddfdf30f09f0a0a637654cbb3cd5c7baa6 | grep -E '^commit|Date'" 12
echo "## R3 — msdos: where the calendar dates came from — the files' own revision banners"
g "git -C repos/msdos show fce0f75959:v1.25/source/MSDOS.ASM | grep -n '03/03/82' | head -2" "git -C repos/msdos show fce0f75959b9806f4016beb7b19e19b37cc97b6c:v1.25/source/MSDOS.ASM | grep -n '03/03/82' | head -2" 3
g "git -C repos/msdos show 80ab2fddfd:v2.0/source/MSHEAD.ASM | grep -n '08/12/83' | head -2" "git -C repos/msdos show 80ab2fddfdf30f09f0a0a637654cbb3cd5c7baa6:v2.0/source/MSHEAD.ASM | grep -n '08/12/83' | head -2" 3
echo "## R4 — msdos: a 16 December 2013 email, blamed to 3 March 1982"
g "git -C repos/msdos blame -- v1.25/Tim_Paterson_16Dec2013_email.txt | sed -n '1,4p'" "git -C repos/msdos blame -- v1.25/Tim_Paterson_16Dec2013_email.txt | sed -n '1,4p'" 5
echo "## R5 — msdos: the 1982 folder was still being revised in 1983 — the stamp covers a drawer, not a day"
g "git -C repos/msdos blame -L 20,24 -- v1.25/source/ASM.ASM" "git -C repos/msdos blame -L 20,24 -- v1.25/source/ASM.ASM" 6
echo "## R6 — msdos: MZ is back — the one author who was in the room"
g "git -C repos/msdos show -s --format=fuller 2d04cacc53 | head -8" "git -C repos/msdos show -s --format=fuller 2d04cacc5322951f187bb17e017c12920ac8ebe2 | head -8" 9
g "git -C repos/msdos show --shortstat --format= 2d04cacc53 | tail -1" "git -C repos/msdos show --shortstat --format= 2d04cacc5322951f187bb17e017c12920ac8ebe2 | tail -1" 2
echo "## R7 — msdos: the roster — full names in the 1983 tree, initials in the 1985-sourced tree"
g "git -C repos/msdos blame -L 3,9 -- v2.0/source/MSHEAD.ASM" "git -C repos/msdos blame -L 3,9 -- v2.0/source/MSHEAD.ASM" 8
g "git -C repos/msdos blame -L 5,10 -- v4.0/src/INC/MSHEAD.ASM" "git -C repos/msdos blame -L 5,10 -- v4.0/src/INC/MSHEAD.ASM" 7
echo "## R8 — msdos: the sign on the door, 2018 vs 2024"
g "git -C repos/msdos log -S 'Contribute!' --format='%h %aI %an %s' -- README.md" "git -C repos/msdos log -S 'Contribute!' --format='%h %aI %an %s' -- README.md" 3
g "git -C repos/msdos show a5eb02a4d7 -- README.md | grep -E '^[-+]#' " "git -C repos/msdos show a5eb02a4d7382faa1d8f91802a73241c32026a2d -- README.md | grep -E '^[-+]#'" 3
echo "## R9 — the-algorithm: genesis confesses it is the second genesis"
r the-algorithm 6 log --reverse --format='%H%n  %aI %cI%n  %an <%ae>%n  %s%n  %b' --max-parents=0
echo "## R10 — the-algorithm: the scrub — authored before the dump, committed three minutes after"
g "git -C repos/the-algorithm log --reverse --format='%h %aI %cI %s' | head -3" "git -C repos/the-algorithm log --reverse --format='%h %aI %cI %s' | head -3" 4
g "git -C repos/the-algorithm show --shortstat --format=fuller ec83d01dca | head -9" "git -C repos/the-algorithm show --shortstat --format=fuller ec83d01dcaebf369444d75ed04b3625a0a645eb9 | head -9" 10
echo "## R11 — the-algorithm: what the scrub removed"
g "git -C repos/the-algorithm show ef4c5eb65e:home-mixer/.../HomeTweetTypePredicates.scala | grep -n 'author_is_' | head -6" "git -C repos/the-algorithm show ef4c5eb65e6e04fac4f0e1fa8bbeff56b75c1f98:home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/decorator/HomeTweetTypePredicates.scala | grep -n 'author_is_' | head -6" 7
g "git -C repos/the-algorithm show ef4c5eb65e:home-mixer/.../RequestQueryFeatureHydrator.scala | grep -n -A3 'purely for metrics'" "git -C repos/the-algorithm show ef4c5eb65e6e04fac4f0e1fa8bbeff56b75c1f98:home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/feature_hydrator/RequestQueryFeatureHydrator.scala | grep -n -A3 'purely for metrics'" 6
echo "## R12 — the-algorithm: the file the code still names, which never existed here"
g "git -C repos/the-algorithm show ef4c5eb65e:home-mixer/.../HomeMixerResourcesModule.scala | grep -n 'authors.yml'" "git -C repos/the-algorithm show ef4c5eb65e6e04fac4f0e1fa8bbeff56b75c1f98:home-mixer/server/src/main/scala/com/twitter/home_mixer/module/HomeMixerResourcesModule.scala | grep -n 'authors.yml'" 3
g "git -C repos/the-algorithm log --all --full-history --oneline -- '**/authors.yml' | wc -l" "git -C repos/the-algorithm log --all --full-history --oneline -- '**/authors.yml' | wc -l" 1
echo "## R13 — the-algorithm: the mask — the whole shortlog"
r the-algorithm 6 shortlog -sn --all
g "git -C repos/the-algorithm log --format='%h %aI %an <%ae> %s' --all | grep -v 'twitter-team' | tail -3" "git -C repos/the-algorithm log --format='%h %aI %an <%ae> %s' --all | grep -v 'twitter-team' | tail -3" 4
echo "## R14 — the-algorithm: 783 days of silence, then the sequel"
g "git -C repos/the-algorithm log --format='%h %aI %cI %s' 72eda9a24f^..c54bec0d4e" "git -C repos/the-algorithm log --format='%h %aI %cI %s' 72eda9a24f815f6d566818cbf8518138e29d83e9^..c54bec0d4e029fe34926ef3258a86ccacc0d0182" 4
g "git -C repos/the-algorithm show --shortstat --format= c54bec0d4e | tail -1" "git -C repos/the-algorithm show --shortstat --format= c54bec0d4e029fe34926ef3258a86ccacc0d0182 | tail -1" 2
echo "## R15 — the-algorithm: the labels come back wearing Grok, with the same defense re-typed"
g "git -C repos/the-algorithm log -S 'grok_politics_left' --all --oneline" "git -C repos/the-algorithm log -S 'grok_politics_left' --all --oneline" 2
g "git -C repos/the-algorithm grep -n 'grok_politics' HEAD -- home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/decorator/builder/HomeTweetTypePredicates.scala | head -3" "git -C repos/the-algorithm grep -n 'grok_politics' HEAD -- home-mixer/server/src/main/scala/com/twitter/home_mixer/functional_component/decorator/builder/HomeTweetTypePredicates.scala | head -3" 4
echo "## R16 — swift: day one of the secret language, kept — an empty tree and a stub"
g "git -C repos/swift log --reverse --format='%h %aI %an %s' | head -2" "git -C repos/swift log --reverse --format='%h %aI %an %s' | head -2" 3
g "git -C repos/swift rev-parse '18844bc652^{tree}'" "git -C repos/swift rev-parse '18844bc65229786b96b89a9fc7739c0fc897905e^{tree}'" 1
g "git -C repos/swift show afc81c1855:tools/swift/swift.cpp" "git -C repos/swift show afc81c1855bf711315b8e5de02db138d3d487eeb:tools/swift/swift.cpp" 3
echo "## R17 — swift: blame says a 2010 file belongs to Swift.org, which did not exist until 2015"
g "git -C repos/swift show 5e88a21755:lib/Lex/Lexer.cpp | head -6" "git -C repos/swift show 5e88a2175579b0b2ed3c4a15fe8c2382601ac321:lib/Lex/Lexer.cpp | head -6" 7
g "git -C repos/swift blame -L 3,5 5e88a21755 -- lib/Lex/Lexer.cpp" "git -C repos/swift blame -L 3,5 5e88a2175579b0b2ed3c4a15fe8c2382601ac321 -- lib/Lex/Lexer.cpp" 4
g "git -C repos/swift log --diff-filter=A --format='%h %aI %an %s' -- LICENSE.txt" "git -C repos/swift log --diff-filter=A --format='%h %aI %an %s' -- LICENSE.txt" 2
echo "## R18 — swift: what they did NOT scrub — 24,610 internal tickets, starting ten days in"
g "git -C repos/swift log --grep='rdar' --oneline | wc -l" "git -C repos/swift log --grep='rdar' --oneline | wc -l" 1
g "git -C repos/swift log --reverse --grep='rdar' --format='%h %aI %s' | head -1" "git -C repos/swift log --reverse --grep='rdar' --format='%h %aI %s' | head -1" 2
echo "## R19 — swift: the five-day keyword and the message that explains its death"
g "git -C repos/swift log -S 'kw_meth' --reverse --format='%h %aI %s'" "git -C repos/swift log -S 'kw_meth' --reverse --format='%h %aI %s'" 3
g "git -C repos/swift log -1 --format='%B' 0fc77abf5c | head -4" "git -C repos/swift log -1 --format='%B' 0fc77abf5c2e195008072839f20ca130602ac6a5 | head -4" 5
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
