# Independent verification: php/php-src

## Verification table

The ranked list makes its second-place choice out of digs 2 and 3, so this audit covers ranked digs 1–4. “FAIL” includes a true underlying claim whose displayed command transcript is materially incomplete, because the assignment asks whether exact reruns match.

| Dig | Claim | Command rerun | Result | Note |
|---|---|---|---|---|
| 1 | All four hashes, dates, authors/committers, and nested revert subjects are as reported. | `git -C /home/diablo/book16/repos/php show -s --format=fuller c730aa26bd52829a49f2ad284b181b7e82a68d7d 046827a7e867bb0e655923c75c25a20d06e3aa8b 2b0f239b211c7544ebc7a4cd2c977a5b7a11ed8a 8d743d5281c29e9750e183804b7ba02e1ff82f0b` | **PASS** | Exact matches, including Levi's author/commit timestamps differing by 13 seconds. |
| 1 | `c730aa26` adds 11 lines in `ext/zlib/zlib.c`, including `HTTP_USER_AGENTT`, `zerodium`, and `zend_eval_string(...+8, ...)`. | `git -C /home/diablo/book16/repos/php show c730aa26 -- ext/zlib/zlib.c` | **PASS** | The diff is exactly 11 insertions and no deletions. |
| 1 | If the header “contains” `zerodium`, PHP evaluates “the rest of the header.” | Same `git show c730aa26 -- ext/zlib/zlib.c` | **FAIL** | Subtle semantic error: `strstr()` accepts `zerodium` anywhere, but evaluation always begins at fixed offset `Z_STRVAL_P(enc)+8`, not after the substring match. “Header starts with `zerodium`, then evaluates what follows” describes the intended trigger; “contains” does not. |
| 1 | The first revert calls the push a likely compromised account and says access was revoked. | `git -C /home/diablo/book16/repos/php show --format=fuller 046827a7e867bb0e655923c75c25a20d06e3aa8b` | **PASS** | Message matches verbatim. |
| 1 | The two malicious commits have identical trees. | `git -C /home/diablo/book16/repos/php rev-parse 'c730aa26^{tree}' '2b0f239b^{tree}'` | **PASS** | Both print `a1c87b3d3dcea24d3f232a65345b66c4968a6ed3`. |
| 1 | Both malicious commits remain ancestors of current `master`. | `git -C /home/diablo/book16/repos/php merge-base --is-ancestor c730aa26 HEAD; echo $?; git -C /home/diablo/book16/repos/php merge-base --is-ancestor 2b0f239b HEAD; echo $?` | **PASS** | Both exit `0`; release tags from `php-8.1.0` through current PHP 8.5 tags also contain `c730aa26`. |
| 1 | Commit-message search for `zerodium` is empty; pickaxe search finds the four-commit revert sequence. | `git -C /home/diablo/book16/repos/php log --all --grep=zerodium --format='%H %s'`; `git -C /home/diablo/book16/repos/php log --all -Szerodium --format='%H %s' -- ext/zlib/zlib.c` | **PASS** | First command prints nothing; second prints `c730aa26`, `046827a7`, `2b0f239b`, and `8d743d52`. |
| 1 | This is the sole Rasmus-authored commit with a `Signed-off-by` trailer. | `git -C /home/diablo/book16/repos/php log --all --author='Rasmus' --grep='Signed-off-by' --format='%H %aI %ae %s'` | **PASS** | Exactly the single reported line. |
| 1 | `rasmus@lerdorf.com` occurs on “93 other commits” and `nikita.ppv@gmail.com` on “7,162 other commits.” | `git -C /home/diablo/book16/repos/php log --all --author='rasmus@lerdorf.com' --format='%H' \| wc -l`; `git -C /home/diablo/book16/repos/php log --all --author='nikita.ppv@gmail.com' --format='%H' \| wc -l` | **FAIL** | The totals are 93 and 7,162 **including** the suspect commits, so the correct “other” counts are 92 and 7,161. The broader identity anomaly remains valid. |
| 2 | The first three commits are the reported SVN Migration, Andi, and Rasmus hashes with the stated metadata. | `git -C /home/diablo/book16/repos/php log --reverse --format='%H %aI %an <%ae> %s' \| head -3` | **PASS** | Exact three-line match. |
| 2 | The root commit points at Git's empty tree. | `git -C /home/diablo/book16/repos/php cat-file -p f70a4db647886f65a3e24249351d2c8abc0cdfb3`; `git -C /home/diablo/book16/repos/php hash-object -t tree /dev/null` | **PASS** | Both identify `4b825dc642cb6eb9a060e54bf8d69288fbee4904`. |
| 2 | “Eight minutes later” Andi imports a “20,000-line” Zend tree, then “twenty-seven minutes” later Zeev commits PHP 4.0. | `git -C /home/diablo/book16/repos/php show --stat --oneline 573b46022c46ab41a879c23f4ea432dd4d0c102e`; `git -C /home/diablo/book16/repos/php show -s --format='%H %aI %s' aceaabceffd537a0ed83fa25e189b08eae585f4a` | **FAIL** | Andi's import has the **same** `18:10:10` timestamp as the root and records 16,187 insertions, not 20,000. Zeev's `PHP 4.0` is at `21:05:13`, 2h55m03s later, not 27 minutes. |
| 2 | `aceaabce`, `bb6dff9c`, and `4b98f345` carry the quoted PHP 4 / `php3_ini` subjects. | `git -C /home/diablo/book16/repos/php show -s --format='%H %aI %an <%ae> %s' aceaabce bb6dff9c 4b98f345` | **PASS** | Hashes, authors, dates, and subjects match. |
| 3 | Rasmus's first recorded commit is `a6043d3e`, an empty-log-message commit adding one blank line before `#include "zend.h"`. | `git -C /home/diablo/book16/repos/php show a6043d3e1efa4cb7564118765dadd53cedd9d194` | **PASS** | Metadata and one-line whitespace diff match exactly. |
| 3 | Rasmus has 1,470 commits here and his next recorded work arrives weeks later. | `git -C /home/diablo/book16/repos/php log --all --author='Rasmus Lerdorf' --format='%H' \| wc -l`; `git -C /home/diablo/book16/repos/php log --all --author='Rasmus Lerdorf' --reverse --format='%H %aI %s' \| head -3` | **PASS** | Count is 1,470; next commit is 1999-04-22, fifteen days later, with the quoted IMAP subject. |
| 4 | The displayed output of the first-commit `grep -n 'PAAMAYIM' ... '*.y' '*.l'` is exact. | `git -C /home/diablo/book16/repos/php grep -n 'PAAMAYIM' 573b46022c46ab41a879c23f4ea432dd4d0c102e -- '*.y' '*.l'` | **FAIL** | Underlying birth claim is true, but the transcript silently omits a third hit: `Zend/zend-parser.y:398` uses the token. The rerun prints three lines, not two. |
| 4 | The 2002 tokenizer import registers both names to one value and returns `T_DOUBLE_COLON`. | `git -C /home/diablo/book16/repos/php show cf5ba0fe:ext/tokenizer/tokenizer.c \| grep -n -E 'PAAMAYIM\|DOUBLE_COLON'` | **PASS** | Lines 268, 269, and 462 match. Commit metadata is Stig Bakken, 2002-02-08, `@Added Andrei's tokenizer extension (Stig)`. |
| 4 | The displayed current-tree `git grep` output is exact. | `git -C /home/diablo/book16/repos/php grep -n 'PAAMAYIM' -- ext/tokenizer/tokenizer_data.c Zend/zend_language_parser.y` | **FAIL** | Core persistence claim is true, but the command now emits 13 lines: the report shows only the declaration and tokenizer mapping, silently omitting eleven parser uses. |
| 4 | `55a15f32` was authored by Rowan Tommins on 2020-06-11, committed by Nikita on 2020-07-13, and explicitly names the “notorious” parse error. | `git -C /home/diablo/book16/repos/php show -s --format=fuller 55a15f32ced0bd2467e6dec0c1287a4f11b1852f` | **PASS** | Exact metadata and message match. |
| 4 | Pickaxe history bottoms out at Andi's first Zend import, and there is no in-tree comment explaining the Hebrew. | `git -C /home/diablo/book16/repos/php log --all -S T_PAAMAYIM_NEKUDOTAYIM --format='%H %aI %an %s' -- Zend/zend-parser.y Zend/zend_language_parser.y \| tail -8`; `git -C /home/diablo/book16/repos/php grep -in -E 'Hebrew\|pa.amayim\|nekudotayim' HEAD` | **PASS** | The final pickaxe hash is `573b460`; current matches are identifiers or unrelated calendar prose, not an explanation of the token name. |

**Verification count: 15 PASS, 5 FAIL.** The five failures are two factual/semantic inaccuracies, one pair of off-by-one counts, and two unmarked transcript truncations; none is a fabricated hash.

## New dig 1 — The empty commit that rang GitHub's doorbell

- **Find-type:** 1 (tiny diff, huge blast radius: zero changed bytes, intended external effect)
- **Hash:** `00d8e26d71139234f803c37d0d8b061868882f83`
- **Date:** 2015-05-28T02:08:48+02:00
- **Author:** Ferenc Kovacs `<tyrael@php.net>`
- **Message:** `empty commit to trigger a github mirror`

Exact reproduction:

```text
$ git -C /home/diablo/book16/repos/php show -s --format='%H%n%aI %an <%ae>%n%s' 00d8e26d71139234f803c37d0d8b061868882f83; git -C /home/diablo/book16/repos/php rev-parse '00d8e26^{tree}' '00d8e26^^{tree}'
00d8e26d71139234f803c37d0d8b061868882f83
2015-05-28T02:08:48+02:00 Ferenc Kovacs <tyrael@php.net>
empty commit to trigger a github mirror
a064a669874bc010c940635e33981edf3f74e62a
a064a669874bc010c940635e33981edf3f74e62a
```

- **Why it is a story:** At 02:08, before GitHub became canonical, Ferenc created an object with the same tree as its parent solely to make machinery outside Git notice an event. The moment before the outcome is wonderfully bare: no source fix to review, only a new commit identity and the hope that the mirror wakes up.
- **What the reader learns:** Empty commits are not necessarily mistakes. Compare a commit's tree with its parent's, then read the subject as an operations log: CI reruns, deployments, mirrors, and webhooks can leave immutable events with no file diff.
- **Surprise:** 4/5

## New dig 2 — Seven commits survive only under `experimetnal`

- **Find-type:** 4 (a name disappears/appears), also 2 (a conversion-planted branch)
- **Hashes:** `b5d60d2a2d05adacfc759c67e8132a76adb7f1a4` (manufactured branch root); `78248be56939433204ff11dbf8f817563cf7755c` (tip)
- **Date:** 1999-12-07T16:00:40+00:00 → 1999-12-15T20:01:45+00:00
- **Authors:** SVN Migration `<svn@php.net>` → Zeev Suraski `<zeev@php.net>`
- **Messages:** `This commit was manufactured by cvs2svn to create branch 'RETURN_REF_PATCH'.` → `- Implement return by reference: ...`

Exact reproduction:

```text
$ git -C /home/diablo/book16/repos/php for-each-ref --format='%(refname) %(objectname) %(creatordate:iso-strict)' refs/remotes/origin/experimetnal/RETURN_REF_PATCH; git -C /home/diablo/book16/repos/php merge-base --is-ancestor 78248be56939433204ff11dbf8f817563cf7755c master; printf 'ancestor-of-master=%s\n' "$?"; git -C /home/diablo/book16/repos/php log --format='%h %s' master..origin/experimetnal/RETURN_REF_PATCH
refs/remotes/origin/experimetnal/RETURN_REF_PATCH 78248be56939433204ff11dbf8f817563cf7755c 1999-12-15T20:01:45+00:00
ancestor-of-master=1
78248be5693 - Implement return by reference:   - In function declaration instead of the return statement   - In the assignment phase - Implement ability to turn off support for call-time pass by reference
4e1a9625c61 - Preliminary return ref patch. It breaks libzend so don't use this branch   right now.
05f8c04928a - Fix problem when return_value's is_ref/refcount is overwritten by the   internal function.
419c68f9eca - Another small fix.
0e2f4cc3264 - Support returning references
3ebf98f1489 - This is supposed to be commited to the RETURN_REF_PATCH branch which is   the beginning of work on allowing returning of references from functions.
b5d60d2a2d0 This commit was manufactured by cvs2svn to create branch 'RETURN_REF_PATCH'.
```

- **Why it is a story:** The branch begins with a converter manufacturing a place for an experiment, immediately warns that it breaks Zend, and ends eight days later with return-by-reference syntax. It never becomes an ancestor of master. Twenty-seven years later its seven private commits remain reachable because the remote-tracking ref itself misspells `experimental` as `experimetnal`.
- **What the reader learns:** `git log --all` can expose abandoned work that ordinary `git log` cannot. Audit remote refs—including typos—before deleting them: the misspelled namespace may be the only name keeping an unmerged experiment alive.
- **Surprise:** 4/5

## New dig 3 — PHP 7's before and after are 47 seconds apart

- **Find-type:** 2 (deliberately planted, precisely dated artifacts)
- **Tag-object hashes:** `77ccbb54405fec74ab2633f174279154958e35e4` (`PRE_PHPNG_MERGE`); `d6a7b86660739bc6f907c56fec06d0c294b428a9` (`POST_PHPNG_MERGE`)
- **Peeled commit hashes:** `e9dac4cf71af3af131e75bf57aba1635f10ba82e`; `8b66d64b2343bc4fd8aeabb690024edb850a0155`
- **Date:** 2014-08-15T08:59:51+04:00 → 2014-08-15T09:00:38+04:00
- **Tagger/author:** Dmitry Stogov `<dmitry@zend.com>`
- **Messages:** `master branch before phpng merge` → `master brunch after phpng merge`

Exact reproduction:

```text
$ git -C /home/diablo/book16/repos/php for-each-ref --format='%(refname:short) %(objectname) %(taggerdate:iso-strict) %(taggername) %(subject)' refs/tags/PRE_PHPNG_MERGE refs/tags/POST_PHPNG_MERGE; git -C /home/diablo/book16/repos/php rev-parse 'PRE_PHPNG_MERGE^{}' 'POST_PHPNG_MERGE^{}'; git -C /home/diablo/book16/repos/php diff --shortstat 'PRE_PHPNG_MERGE^{}' 'POST_PHPNG_MERGE^{}'
POST_PHPNG_MERGE d6a7b86660739bc6f907c56fec06d0c294b428a9 2014-08-15T09:00:38+04:00 Dmitry Stogov master brunch after phpng merge
PRE_PHPNG_MERGE 77ccbb54405fec74ab2633f174279154958e35e4 2014-08-15T08:59:51+04:00 Dmitry Stogov master branch before phpng merge
e9dac4cf71af3af131e75bf57aba1635f10ba82e
8b66d64b2343bc4fd8aeabb690024edb850a0155
 874 files changed, 111578 insertions(+), 65140 deletions(-)
```

- **Why it is a story:** Dmitry placed one named stake immediately before PHPNG crossed into master and another 47 seconds later. Between them, 874 files and 176,718 changed lines turn into the engine that would ship as PHP 7. The post tag's `brunch` typo preserves the haste of the moment before anyone knew whether the transplant would hold.
- **What the reader learns:** Annotated PRE/POST tags can be better archaeological section markers than the merge commit. Peel both tag objects and diff the resulting commits; first-parent `git show` can make a vast merge look tiny.
- **Surprise:** 4/5

## New dig 4 — A locking fix waited 1,423 days to become a commit

- **Find-type:** 4 (author and committer identities split), also 2 (two dates for one artifact)
- **Hash:** `29fe06fa5919bb0f239677d29f3856d64537eeec`
- **Dates:** authored 2018-03-19T13:06:04+01:00; committed 2022-02-09T23:02:45+00:00
- **Author:** Till Backhaus `<backhaus@traum-ferienwohnungen.de>`
- **Committer:** Jakub Zelenka `<bukka@php.net>`
- **Message:** `Fix bug #76109: Implement fpm_scoreboard_copy`

Exact reproduction:

```text
$ git -C /home/diablo/book16/repos/php show -s --format='author    %aI %an <%ae>%ncommitter %cI %cn <%ce>%nsubject   %s' 29fe06fa5919bb0f239677d29f3856d64537eeec; git -C /home/diablo/book16/repos/php diff-tree --no-commit-id --shortstat -r 29fe06fa5919bb0f239677d29f3856d64537eeec
author    2018-03-19T13:06:04+01:00 Till Backhaus <backhaus@traum-ferienwohnungen.de>
committer 2022-02-09T23:02:45+00:00 Jakub Zelenka <bukka@php.net>
subject   Fix bug #76109: Implement fpm_scoreboard_copy
 4 files changed, 118 insertions(+), 61 deletions(-)
```

- **Why it is a story:** The patch says the old FPM status path held its shared scoreboard lock only briefly; the replacement copies the scoreboard and locks each process record. Till's author clock stops in March 2018. Jakub's commit clock resumes almost four years later, with `Closes GH-7931` and a co-author trailer. The object preserves both the moment the solution was written and the much later moment PHP accepted it.
- **What the reader learns:** `%aI` and `%cI` answer different questions. Sort by their delta to find patches that waited in bug trackers, mailboxes, or rebases; `git log`'s default author date can make a newly landed fix look ancient.
- **Surprise:** 4/5

## New dig 5 — PHP signed releases four years before it signed commits

- **Find-type:** 2 (attestation artifacts with datable adoption)
- **Hashes:** tag object `21a74f2e57e416594a454764db0dcf6337eb3210` peeling to commit `8cdfc8bead815973d29ca5499b16b7171c0a45bc`; commit `3b43b829c466168d5e0d92d902f760dec9d36d5d`
- **Dates:** first PGP-signed annotated tag by tagger time: 2012-03-22T01:03:34-07:00; first commit carrying a `gpgsig` header by committer time: 2016-06-26T17:51:44+02:00
- **Authors/taggers:** Stanislav Malyshev `<stas@php.net>`; Richard Fussenegger `<fleshgrinder@users.noreply.github.com>`
- **Messages:** `5.4.1 RC1`; `Added editorconfig file`

Exact chronological scans (presence only, not cryptographic validity):

```text
$ while read -r t; do git -C /home/diablo/book16/repos/php cat-file tag "$t" | grep -q '^-----BEGIN PGP SIGNATURE-----' && git -C /home/diablo/book16/repos/php for-each-ref --format='%(taggerdate:unix) %(refname:short) %(objectname) %(taggerdate:iso-strict) %(taggername) %(subject)' "refs/tags/$t"; done < <(git -C /home/diablo/book16/repos/php for-each-ref --format='%(refname:short) %(objecttype)' refs/tags | awk '$2=="tag"{print $1}') | sort -n | sed -n '1p'
1332403414 PHP-5.4.1-RC1 21a74f2e57e416594a454764db0dcf6337eb3210 2012-03-22T01:03:34-07:00 Stanislav Malyshev 5.4.1 RC1
$ git -C /home/diablo/book16/repos/php rev-list --all | git -C /home/diablo/book16/repos/php cat-file --batch | awk '/^[0-9a-f]{40} commit [0-9]+$/{h=$1} /^committer /{t=$(NF-1)} /^gpgsig /{print t,h}' | sort -n | sed -n '1p'; git -C /home/diablo/book16/repos/php show -s --format='%cI %cn <%ce> %s' 3b43b829c466168d5e0d92d902f760dec9d36d5d
1466956304 3b43b829c466168d5e0d92d902f760dec9d36d5d
2016-06-26T17:51:44+02:00 Richard Fussenegger <fleshgrinder@users.noreply.github.com> Added editorconfig file
```

- **Why it is a story:** PHP began attaching PGP material to release tags in this graph in 2012, but the first signed commit object does not appear until 2016—and it adds `.editorconfig`, not a security fix. Before that commit, a signed tag could attest a release snapshot while every contributing commit remained unsigned. The raw objects show presence; without the historical keys configured, they do not by themselves prove validity.
- **What the reader learns:** Tag signatures and commit signatures answer different questions. Inspect raw tag objects for `BEGIN PGP SIGNATURE` and commit objects for `gpgsig`; do not equate a signed release tag with a fully signed history, and do not call a signature valid merely because the header survived.
- **Surprise:** 3/5

Verdict: The first report is strong on hashes, identities, and its central narratives: 15 of 20 audited claims/transcripts pass.
Reliability: Use it after a precision edit and transcript rerun; the five failures are wording, timing/count arithmetic, or silent output truncation—not invented commits.
