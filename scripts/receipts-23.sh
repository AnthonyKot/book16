#!/usr/bin/env bash
# Receipts for source 23 (Heartbleed — the innocent twin).
# Verbatim outputs against the local openssl clone. Regenerate: scripts/receipts-23.sh
# Both heartbeat commits carry Henson in BOTH author and committer fields; Seggelmann
# appears only as "Submitted by:" in the message body. Pin those fields explicitly.
cd "$(dirname "$0")/.."
repo=repos/openssl
out=chapters/23-heartbleed.receipts.md

MASTER=4817504d069b4c5082161b02a22116ad75f822b1   # master, the famous NYE commit
SHIPPED=bd6941cfaa31ee8a3f8661cb98227a5cbcc0f9f3  # 1.0.1-stable, the one that shipped
FIX=96db9023b881d7cd9f379b0c154650d6c108e9a3      # bounds check, 1.0.1g

blk() { echo '```'; echo "$ $1"; shift; eval "$@" 2>&1; echo '```'; echo; }

{
echo "# Receipts — source 23 Heartbleed (the innocent twin)"
echo
echo "Verbatim outputs against a full clone of openssl. Both heartbeat commits carry"
echo "Dr. Stephen Henson in the git *author* AND *committer* fields; Robin Seggelmann"
echo "appears only as \`Submitted by:\` in the message body. Regenerate with"
echo "\`scripts/receipts-23.sh\`. Long outputs selected editorially with sed/head."
echo

echo "## R1 — two heartbeat commits, same night, 39 seconds apart, both authored+committed by Henson"
blk "git -C $repo show -s --format='%H %aI %an (author) / %cn (committer) | %s' $MASTER $SHIPPED" \
    "git -C $repo show -s --format='%H %aI %an (author) / %cn (committer) | %s' $MASTER $SHIPPED"

echo "## R2 — the famous (master) commit is NOT in the vulnerable release; its twin IS"
blk "git -C $repo merge-base --is-ancestor $MASTER OpenSSL_1_0_1g^{} && echo yes || echo NO   # master twin in 1.0.1g?" \
    "git -C $repo merge-base --is-ancestor $MASTER 'OpenSSL_1_0_1g^{}' && echo 'master 4817504d in 1.0.1g = yes' || echo 'master 4817504d in 1.0.1g = NO'"
blk "git -C $repo merge-base --is-ancestor $SHIPPED OpenSSL_1_0_1g^{} && echo yes || echo NO   # shipped twin in 1.0.1g?" \
    "git -C $repo merge-base --is-ancestor $SHIPPED 'OpenSSL_1_0_1g^{}' && echo 'shipped bd6941cf in 1.0.1g = yes' || echo 'shipped bd6941cf in 1.0.1g = NO'"

echo "## R3 — why the twin exists: master and 1.0.1-stable diverged in 2009, before either commit"
blk "git -C $repo show -s --format='%H %aI | %s' \$(git -C $repo merge-base $MASTER $SHIPPED)" \
    "git -C $repo show -s --format='%H %aI | %s' \$(git -C $repo merge-base $MASTER $SHIPPED)"

echo "## R4 — the ledger's answer to 'who wrote it': author field says Henson; the name Seggelmann is prose in the body"
blk "git -C $repo show -s --format='author=%an <%ae>%ncommitter=%cn <%ce>' $SHIPPED; git -C $repo show -s --format='%B' $SHIPPED | grep -iE 'submitted by|reviewed by'" \
    "git -C $repo show -s --format='author=%an <%ae>%ncommitter=%cn <%ce>' $SHIPPED; git -C $repo show -s --format='%B' $SHIPPED | grep -iE 'submitted by|reviewed by'"

echo "## R5 — the shipped code: length read straight off the wire, no check before use"
blk "git -C $repo show --format= --no-ext-diff $SHIPPED -- ssl/t1_lib.c | sed -n '/+tls1_process_heartbeat/,/+	pl = p;/p'" \
    "git -C $repo show --format= --no-ext-diff $SHIPPED -- ssl/t1_lib.c | sed -n '/+tls1_process_heartbeat/,/+\tpl = p;/p'"

echo "## R6 — the first vulnerable release, and the fix two years later"
blk "git -C $repo tag --contains $SHIPPED --sort=creatordate | grep -iE 'OpenSSL_1_0_1[a-f]?\$' | head -1   # first release carrying the bug" \
    "git -C $repo tag --contains $SHIPPED --sort=creatordate | grep -iE 'OpenSSL_1_0_1[a-f]?$' | head -1"
blk "git -C $repo show -s --format='%H %aI %an | %s' $FIX" \
    "git -C $repo show -s --format='%H %aI %an | %s' $FIX"

echo "## R7 — the fix: the two bounds checks the original never had (real hunk, sed range)"
blk "git -C $repo show --format= --no-ext-diff $FIX -- ssl/t1_lib.c | sed -n '1,28p'" \
    "git -C $repo show --format= --no-ext-diff $FIX -- ssl/t1_lib.c | sed -n '1,28p'"

echo "## R8 — the fix ships in 1.0.1g and not before (1.0.1f was the last bleeding release)"
blk "for t in OpenSSL_1_0_1f OpenSSL_1_0_1g; do git -C $repo merge-base --is-ancestor $FIX \"\$t^{}\" && echo \"\$t has_fix=yes\" || echo \"\$t has_fix=NO\"; done" \
    "for t in OpenSSL_1_0_1f OpenSSL_1_0_1g; do git -C $repo merge-base --is-ancestor $FIX \"\$t^{}\" && echo \"\$t has_fix=yes\" || echo \"\$t has_fix=NO\"; done"

} > "$out"
echo "wrote $out"
