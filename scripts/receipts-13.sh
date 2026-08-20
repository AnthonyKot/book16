#!/usr/bin/env bash
# Receipts for chapter 13 (nodejs/node — the deletions the history unmade).
cd "$(dirname "$0")/.."
out=chapters/13-node.receipts.md
g() { desc=$1; cmd=$2; cap=$3; echo '```'; echo "$ $desc"; eval "$cmd" 2>&1 | head -n "$cap"; echo '```'; echo; }
{
echo "# Receipts — ch. 13 nodejs/node (the deletions the history unmade)"
echo
echo "Verbatim outputs against a full clone of nodejs/node. Names shown via mailmap (Ryan → Ryan Dahl)."
echo "Regenerate with \`scripts/receipts-13.sh\`. Long outputs truncated editorially (head)."
echo
echo "## R1 — June 2009: Node gets a Promise class"
g "git -C repos/node log -1 --format='%h %ai %an%n%s' 7cd09874c6" "git -C repos/node log -1 --format='%h %ai %an%n%s' 7cd09874c666f0ce64b1d7776de74f55ff3e53ab" 3
g "git -C repos/node show 7cd09874c6 -- src/events.cc | grep -E '^\+' | grep -iE 'Promise' | head -4" "git -C repos/node show 7cd09874c666f0ce64b1d7776de74f55ff3e53ab -- src/events.cc | grep -E '^\+' | grep -iE 'Promise' | head -4" 5
echo "## R2 — eight months of building on them"
g "git -C repos/node log --reverse --format='%h %ai %s' --until=2010-03-01 | grep -iE 'promis' | head -6" "git -C repos/node log --reverse --format='%h %ai %s' --until=2010-03-01 | grep -iE 'promis' | head -6" 7
echo "## R3 — February 2010: 306 lines gone, no explanation"
g "git -C repos/node show -s --format='%h %ai %an%n%s%n%b' 0485cc41d5" "git -C repos/node show -s --format='%h %ai %an%n%s%n%b' 0485cc41d5c260458f590d249c073794047434fb" 5
g "git -C repos/node show --stat --format= 0485cc41d5 | tail -2" "git -C repos/node show --stat --format= 0485cc41d5c260458f590d249c073794047434fb | tail -2" 3
echo "## R4 — the deleted class lived inside src/node.js, beside EventEmitter"
g "git -C repos/node show 0485cc41d5 -- src/node.js | grep -E '^-' | grep -iE 'Promise' | head -5" "git -C repos/node show 0485cc41d5c260458f590d249c073794047434fb -- src/node.js | grep -E '^-' | grep -iE 'Promise' | head -5" 6
echo "## R5 — the deletion is invisible if you only search today's expected path"
g "git -C repos/node log --all --oneline -- lib/promise.js | wc -l   # never lived there" "git -C repos/node log --all --oneline -- lib/promise.js | wc -l" 1
echo "## R6 — the founder's second deletion: require('sys') now throws"
g "git -C repos/node log -1 --format='%h %ai %an%n%s%n%b' b28e700ebd" "git -C repos/node log -1 --format='%h %ai %an%n%s%n%b' b28e700ebdf6583364fec3171390a24153f79632" 4
g "git -C repos/node show b28e700ebd -- lib/sys.js | grep -E '^\+' | grep -i throw" "git -C repos/node show b28e700ebdf6583364fec3171390a24153f79632 -- lib/sys.js | grep -E '^\+' | grep -i throw" 2
echo "## R7 — the next lead un-breaks it, with a note about old programs"
g "git -C repos/node show -s --format='%h %ai %an%n%s' f2a9ed4873" "git -C repos/node show -s --format='%h %ai %an%n%s' f2a9ed487369ab7222522e1097708550adbe165c" 3
g "git -C repos/node show f2a9ed4873 -- lib/sys.js | grep -E '^\+' | grep -vE '^\+\+\+'" "git -C repos/node show f2a9ed487369ab7222522e1097708550adbe165c -- lib/sys.js | grep -E '^\+' | grep -vE '^\+\+\+'" 6
echo "## R8 — 2015: the committee votes, explicitly, don't remove"
g "git -C repos/node log -1 --format='%h %ai %an%n%s%n%b' dc42e1faaf | grep -viE 'PR-URL|Reviewed-By'" "git -C repos/node log -1 --format='%h %ai %an%n%s%n%b' dc42e1faaf358e1ee8729439e0a3ade26f3cbce1 | grep -viE 'PR-URL|Reviewed-By'" 5
echo "## R9 — 2026: the throw the founder wrote is gone; his rename never happened"
g "git -C repos/node show HEAD:lib/sys.js | tail -6" "git -C repos/node show HEAD:lib/sys.js | tail -6" 7
echo "## R10 — the founder's fade: his last commit is a build-tool bump"
g "git -C repos/node log --all --author='ry@tinyclouds.org' --format='%h %ai %s' | head -1" "git -C repos/node log --all --author='ry@tinyclouds.org' --format='%h %ai %s' | head -1" 2
g "git -C repos/node show --stat --format= f90c9ce0e2 | tail -2" "git -C repos/node show --stat --format= f90c9ce0e255e531fee4f07dbe53f0c6c893e700 | tail -2" 3
echo "## R11 — the succession, in the shortlog, one year apart"
g "git -C repos/node shortlog -sn HEAD --after=2009-01-01 --before=2010-01-01 | grep -E 'Ryan Dahl|Isaac Z'" "git -C repos/node shortlog -sn HEAD --after=2009-01-01 --before=2010-01-01 | grep -E 'Ryan Dahl|Isaac Z'" 3
g "git -C repos/node shortlog -sn HEAD --after=2012-01-01 --before=2013-01-01 | grep -E 'Ryan Dahl|Isaac Z'" "git -C repos/node shortlog -sn HEAD --after=2012-01-01 --before=2013-01-01 | grep -E 'Ryan Dahl|Isaac Z'" 3
} > "$out"
echo "wrote $out ($(wc -l < "$out") lines)"
