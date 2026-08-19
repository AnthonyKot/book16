# Independent verification and extension: go (golang/go)

| # | Dig | Claim checked | Command rerun | Result | Note |
|---:|---|---|---|:---:|---|
| 1 | Ranked #1, planted root | The first five commits have the reported hashes, author dates, authors/emails, and subjects. | `git -C /home/diablo/book16/repos/go log --reverse --format='%H %ai %an <%ae> %s' \| head -5` | PASS | All five lines match exactly. |
| 2 | Ranked #1, planted root | The root adds seven lines of B at the anachronistic `src/pkg/debug/macho/testdata/hello.b` path; the conversions and `R=ken`/`R=dmr` trailers are real. | `git -C /home/diablo/book16/repos/go show --stat --format=fuller 7d7c6a97...`; supplemental full `git show` of all four reported hashes | PASS | The B constants, three-line K&R C replacement, both ANSI diffs, clocks, and review trailers match. The cited `--stat` alone does not expose the old blob, but the objects do. |
| 3 | Ranked #1, planted root | Live blame of `hello.c` resolves to 1974 and 1988 commits with the reported line content. | `git -C /home/diablo/book16/repos/go blame src/debug/macho/testdata/hello.c` | PASS | Hash attribution and dates match, including `}` at `0bb0b61d6a8` and the ANSI lines at `0744...`/`d82b...`. |
| 4 | Ranked #1, displayed receipt | The report's displayed blame block is literal output of its exact blame command. | Same `git blame` command as row 3 | FAIL | Without `-e`, Git prints `(Brian Kernighan ...)`, not `(<research!bwk> ...)` or `(<bwk@research.att.com> ...)`. The underlying identities are correct; the quoted rendering is not. |
| 5 | Ranked #2, Ken's endpoints | Ken Thompson's first and last commits are `cb87526...` (2008-03-28, `SVN=114202`) and `a738177...` (2011-03-22, channel allocation). | The report's two `git log --author='Ken Thompson' ...` commands | PASS | Hashes, dates, subjects, and `ken@golang.org` all match. |
| 6 | Ranked #2, first/last diffs | The first commit adds 10,958 lines in 14 files; the last changes 24 lines in `chan.c` (20 insertions, 4 deletions). | The report's two `git show --stat --format=fuller ...` commands | PASS | Exact diffstats match. “24 lines out” means touched lines, not 24 deletions; the prose later makes that clear. |
| 7 | Ranked #2, disappearance | There are 508 Ken Thompson commits, all under `ken@golang.org`, split 298/131/55/24 in 2008–2011 and none afterward, including across `--all`. | `git rev-list --all --count --author='Ken Thompson'`; yearly/email-format `git log --all` checks | PASS | Count, yearly distribution, email, and disappearance all match. |
| 8 | Ranked #3, Go 1 object | `6174b5...` has the reported date, author, subject, and one-line `VERSION` stat; lightweight tag `go1` points directly to it. | `git -C /home/diablo/book16/repos/go show --stat --format=fuller 6174b5...`; `git rev-parse go1 go1^{}`; `git cat-file -t go1` | PASS | Metadata and target match; `cat-file` says `commit`, so `go1` is lightweight. |
| 9 | Ranked #3, bytes | `go1:VERSION` is exactly the three bytes `g`, `o`, `1`, with no newline. | `git -C /home/diablo/book16/repos/go show go1:VERSION \| od -c` | PASS | Output ends at offset `0000003`; there is no newline byte. |
| 10 | Ranked #3, displayed receipt | The report's `+go1` and `\ No newline at end of file` lines come from its exact two commands. | The row-8 `show --stat` and row-9 `od -c` commands | FAIL | `--stat` prints no patch, and `od -c` prints `0000000 g o 1` / `0000003`. The bytes claim is true, but the displayed patch fragment requires `git show --patch`, which was not cited. |
| 11 | Challenged dig #2 | `18c5b488...` really is a 1,197-line Sunday-night annotated spec with the reported author, date, message, and early design text. | The report's `git show --stat ...` and `git show ...:doc/go_spec \| head -80` | PASS | Metadata, stat, Ken note, “containers w/o templates,” and 1MLOC stretch goal match. |
| 12 | Challenged dig #2, displayed receipt | The `head -80` command displays the quoted no-type-parameters and red-text lines. | `git ... show 18c5b488...:doc/go_spec \| head -80`; supplemental `nl -ba \| rg ...` | FAIL | Those true lines are at 178 and 227, outside `head -80`. Again the content is real, but the shown receipt is not literal output of the cited command. |
| 13 | Challenged dig #2, continuity | The day-one `doc/go_spec` is fairly described as the document the project then spent years finishing. | `git log --follow -- doc/go_spec.html`; `git show --stat 73823d... 719a06...` | FAIL | A new `doc/go_lang.txt` appeared on March 4 at 22:18; five minutes later the day-one file was deleted as “obsolote.” The current spec's `--follow` trail chooses the replacement, not `18c5b488...`. This is a narrative overstatement, not a bad hash. |

**Verification count: 9 PASS / 4 FAIL.** All four failures are precision failures in displayed evidence or narrative continuity; none of the ranked hashes, dates, authors, subjects, or substantive object contents is false.

## New dig 1: The first spec was replaced five minutes before it was deleted

- **Find-type:** 8 (rollback of the world)
- **Hashes:** `73823d236a063e9e1fd326c07797be3a08b79edb` (replacement appears); `719a06fd97f69ebea8f17cbae8a6dcfbe33fe26b` (day-one path deleted)
- **Dates:** 2008-03-04 22:18:16 -0800; 2008-03-04 22:23:23 -0800
- **Author:** Robert Griesemer `<gri@golang.org>` for both
- **Messages:** `- added new, revised spec - updated todo` / `- renamed todo -> todo.txt - deleted obsolote go_spec`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/go log --follow --format='%H %ai %an <%ae> %s' -- doc/go_spec.html | tail -1
git -C /home/diablo/book16/repos/go show -s --format='%H %ai %an <%ae> %s' 719a06fd97f69ebea8f17cbae8a6dcfbe33fe26b
git -C /home/diablo/book16/repos/go show --shortstat --format='' 73823d236a063e9e1fd326c07797be3a08b79edb 719a06fd97f69ebea8f17cbae8a6dcfbe33fe26b
```

```text
73823d236a063e9e1fd326c07797be3a08b79edb 2008-03-04 22:18:16 -0800 Robert Griesemer <gri@golang.org> - added new, revised spec - updated todo
719a06fd97f69ebea8f17cbae8a6dcfbe33fe26b 2008-03-04 22:23:23 -0800 Robert Griesemer <gri@golang.org> - renamed todo -> todo.txt - deleted obsolote go_spec
 1 file changed, 1347 insertions(+)
 1 file changed, 1291 deletions(-)
```

- **Why it is a story:** At 22:18 Griesemer checks in a 1,347-line “new, revised spec” as `go_lang.txt`. At 22:23 he deletes the 1,291-line annotated `go_spec` that had begun two nights earlier. Before anyone knew which document would become canonical, the repository held both versions for five minutes. The current `doc/go_spec.html` trail follows the replacement; the famous day-one artifact is a discarded proposal, not its file ancestor.
- **What the reader learns:** Run `--follow` on today's famous file, but also inspect similarly named deleted paths. A project's first manifesto may be historically important without being the document that evolved into the present one.
- **Surprise:** 4

## New dig 2: “Change my name” splits one contributor into two league-table entries

- **Find-type:** 4 (name that disappears / appears)
- **Hash:** `5f9fe47deaceaa3688fcd549c888e8cfdaa1dc1a`
- **Date:** 2021-05-06 12:21:04 -0400
- **Author:** Cherry Mui `<cherryyz@google.com>`
- **Message:** `CONTRIBUTORS: change my name`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/go show -s --format='%H%n%ai%n%an <%ae>%n%s' 5f9fe47deaceaa3688fcd549c888e8cfdaa1dc1a
git -C /home/diablo/book16/repos/go show --format='' 5f9fe47deaceaa3688fcd549c888e8cfdaa1dc1a -- CONTRIBUTORS | rg '^[+-]Cherry'
git -C /home/diablo/book16/repos/go shortlog -sne --all | rg 'Cherry (Zhang|Mui)'
git -C /home/diablo/book16/repos/go cat-file -e HEAD:.mailmap 2>/dev/null || echo 'HEAD:.mailmap: absent'
```

```text
5f9fe47deaceaa3688fcd549c888e8cfdaa1dc1a
2021-05-06 12:21:04 -0400
Cherry Mui <cherryyz@google.com>
CONTRIBUTORS: change my name
-Cherry Zhang <cherryyz@google.com>
+Cherry Mui <cherryyz@google.com>
  1056 Cherry Zhang <cherryyz@google.com>
   887 Cherry Mui <cherryyz@google.com>
    14 Cherry Zhang <lunaria21@gmail.com>
HEAD:.mailmap: absent
```

- **Why it is a story:** The final old-name commit is May 3; three days later the contributor edits the roster and authors the change under her new name, keeping the same `cherryyz@google.com` address. Before the outcome was visible in rankings, this looked like a one-line human correction. Five years later `shortlog --all` still turns that one career into 1,056 old-name commits and 887 new-name commits because the repository has no `.mailmap`.
- **What the reader learns:** Contributor counts are identity-policy outputs, not facts. Inspect names grouped by email and read name-change commits before claiming that one person arrived as another disappeared; add a `.mailmap` when continuity is the desired view.
- **Surprise:** 4

## New dig 3: The generics translator's branch ends with its own epitaph

- **Find-type:** 4 (name / experimental tool that disappears)
- **Hash:** `55626ee50b284ae88e5341741b55fb2a6cd4c5d8`
- **Date:** 2021-05-24 12:59:32 -0700
- **Author:** Ian Lance Taylor `<iant@golang.org>`
- **Message:** `[dev.go2go] README: document that this branch is no longer maintained`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/go rev-list --count master..origin/dev.go2go | awk '{print "commits off master:", $1}'
git -C /home/diablo/book16/repos/go show -s --format='%H%n%ai%n%an <%ae>%n%s' 55626ee50b284ae88e5341741b55fb2a6cd4c5d8
git -C /home/diablo/book16/repos/go show --format='' 55626ee50b284ae88e5341741b55fb2a6cd4c5d8 -- README.go2go.md | sed -n '/^+This branch provides/,+3p'
```

```text
commits off master: 502
55626ee50b284ae88e5341741b55fb2a6cd4c5d8
2021-05-24 12:59:32 -0700
Ian Lance Taylor <iant@golang.org>
[dev.go2go] README: document that this branch is no longer maintained
+This branch provides an experimental go2go tool for testing the use of
+the generics design draft.
+This branch was published in 2020 and is no longer being maintained.
+The [generics
```

- **Why it is a story:** Before accepted generics lived in the ordinary toolchain, users tested a source-to-source `go2go` translator on a development branch. Once the proposal was accepted, Taylor did not merge or delete the prototype: he wrote an epitaph at its tip. The remote-tracking ref still preserves 502 commits not reachable from `master`, including discarded syntax and contracts experiments.
- **What the reader learns:** `HEAD` tells the winning implementation. `git log --all` and `master..origin/<stale-branch>` expose the prototypes that paid for it. An abandoned branch with a final README can be a cleaner design record than the eventual squash of accepted ideas.
- **Surprise:** 4

## New dig 4: Go's only empty non-merge commits say “create release-branch”

- **Find-type:** 2 (planted / metadata-only artifact)
- **Hashes:** `35f3007cf13054a6b814571ff091f6414acb4514`, `9c3eb13a142de4c13b625fab93ac370dc6d5f46a`, `808bb141a64bf0977f4fa64b6235f7a8283dfe2b`
- **Dates:** 2011-06-29 13:46:53 +1000; 2011-07-31 14:38:41 -0700; 2011-09-08 10:39:39 +1000
- **Author:** Andrew Gerrand `<adg@golang.org>` for all three
- **Messages:** `create release-branch.r58` / `.r59` / `.r60`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/go log --all --no-merges --reverse --raw --format='C%x09%H%x09%ai%x09%an <%ae>%x09%s' | awk -F '\t' '$1=="C" {if(h!="" && !changed) print h, d, a, s; h=$2; d=$3; a=$4; s=$5; changed=0; next} /^:/ {changed=1} END {if(h!="" && !changed) print h, d, a, s}'
for dig_hash in 35f3007cf13054a6b814571ff091f6414acb4514 9c3eb13a142de4c13b625fab93ac370dc6d5f46a 808bb141a64bf0977f4fa64b6235f7a8283dfe2b; do git -C /home/diablo/book16/repos/go diff-tree --quiet "$dig_hash^" "$dig_hash" && echo "$dig_hash tree unchanged"; done
```

```text
35f3007cf13054a6b814571ff091f6414acb4514 2011-06-29 13:46:53 +1000 Andrew Gerrand <adg@golang.org> create release-branch.r58
9c3eb13a142de4c13b625fab93ac370dc6d5f46a 2011-07-31 14:38:41 -0700 Andrew Gerrand <adg@golang.org> create release-branch.r59
808bb141a64bf0977f4fa64b6235f7a8283dfe2b 2011-09-08 10:39:39 +1000 Andrew Gerrand <adg@golang.org> create release-branch.r60
35f3007cf13054a6b814571ff091f6414acb4514 tree unchanged
9c3eb13a142de4c13b625fab93ac370dc6d5f46a tree unchanged
808bb141a64bf0977f4fa64b6235f7a8283dfe2b tree unchanged
```

- **Why it is a story:** A branch is normally only a movable ref, invisible inside commit contents. Here three successive pre-Go-1 releases leave commits whose trees are byte-for-byte identical to their parents and whose entire payload is “create release-branch.” Before each maintenance line had any fixes, Gerrand made the fork itself an event. Those events now survive only because `--all` walks the stale `origin/release-branch.r58`, `.r59`, and `.r60` refs.
- **What the reader learns:** Empty commits are not necessarily accidents; they can be durable ceremony for otherwise ephemeral ref operations. Search all refs for non-merges with no raw changes before discarding “zero-line” commits from an archaeology corpus.
- **Surprise:** 3

## New dig 5: A 92-line patch is a merge whose two parents are the same commit

- **Find-type:** 2 (odd / planted Git artifact)
- **Hashes:** `fc8da86d21f0ab363b53b18d8f256b4dd664eb53` (duplicate-parent patch); `42d178985de65fbaa31be70dec5b53cda834933e` (later Gerrit integration)
- **Dates:** 2026-07-02 10:10:12 +0200; later integrated 2026-08-04 12:24:37 -0700
- **Authors:** qmuntal `<quimmuntal@gmail.com>`; later Gerrit Code Review `<noreply-gerritcodereview@google.com>`
- **Messages:** `syscall: fix Windows Fchdir with extended UNC paths` / `Merge "syscall: fix Windows Fchdir with extended UNC paths"`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/go show -s --format='%H%n%ai%n%an <%ae>%n%s%nparents: %P' fc8da86d21f0ab363b53b18d8f256b4dd664eb53
git -C /home/diablo/book16/repos/go show --shortstat --format='' fc8da86d21f0ab363b53b18d8f256b4dd664eb53
git -C /home/diablo/book16/repos/go show -s --format='%H %ai %an <%ae> %s' 42d178985de65fbaa31be70dec5b53cda834933e
```

```text
fc8da86d21f0ab363b53b18d8f256b4dd664eb53
2026-07-02 10:10:12 +0200
qmuntal <quimmuntal@gmail.com>
syscall: fix Windows Fchdir with extended UNC paths
parents: 3d3798e7fb03345f79a192f0a2acfc753325739b 3d3798e7fb03345f79a192f0a2acfc753325739b
 4 files changed, 89 insertions(+), 3 deletions(-)
42d178985de65fbaa31be70dec5b53cda834933e 2026-08-04 12:24:37 -0700 Gerrit Code Review <noreply-gerritcodereview@google.com> Merge "syscall: fix Windows Fchdir with extended UNC paths"
```

- **Why it is a story:** Before Gerrit integrated the Windows fix, the patch existed as a commit with two parent entries—and both entries named exactly the same base commit. Its tree nevertheless carries 89 insertions and 3 deletions. A month later a conventional Gerrit merge takes this odd object as its second parent. The trace preserves a staging mechanism that looks like a merge in topology but did not combine two histories.
- **What the reader learns:** “Two parents” is not synonymous with “two distinct lines of development.” Print `%P`, compare parent IDs, and inspect the tree delta; merge-only filters can contain substantial patches and duplicate-parent objects that invalidate ordinary merge assumptions.
- **Surprise:** 5

## New dig 6: All 491 tags are lightweight, and Git recognizes no signatures

- **Find-type:** 2 (release artifact whose missing object matters)
- **Hashes:** `9ad14c94db182dd3326e4c80053e0311f47700ce` (`weekly.2009-11-06`); `90cf2c38605cf6514cc395c9d94688c1154ffcda` (`go1.27rc3`)
- **Dates:** target author dates 2009-11-06 10:33:46 -0800 and 2026-08-13 10:30:25 -0700 (the latter was committed/tag-visible at 10:38:53)
- **Authors:** Russ Cox `<rsc@golang.org>`; Gopher Robot `<gobot@golang.org>`
- **Messages:** `expand "this is not just mercurial" section` / `[release-branch.go1.27] go1.27rc3`
- **Exact command:**

```sh
git -C /home/diablo/book16/repos/go for-each-ref refs/tags --format='%(objecttype)' | sort | uniq -c
git -C /home/diablo/book16/repos/go log --all --format='%G?' | sort | uniq -c
git -C /home/diablo/book16/repos/go for-each-ref refs/tags/weekly.2009-11-06 refs/tags/go1.27rc3 --format='%(refname:short) %(objecttype) %(objectname) %(creatordate:iso8601) %(authorname) %(subject)'
git -C /home/diablo/book16/repos/go show -s --format='%H %ai %an <%ae> %s' 9ad14c94db182dd3326e4c80053e0311f47700ce 90cf2c38605cf6514cc395c9d94688c1154ffcda
git -C /home/diablo/book16/repos/go verify-tag go1.27rc3 2>&1
```

```text
    491 commit
  71792 N
go1.27rc3 commit 90cf2c38605cf6514cc395c9d94688c1154ffcda 2026-08-13 10:38:53 -0700 Gopher Robot [release-branch.go1.27] go1.27rc3
weekly.2009-11-06 commit 9ad14c94db182dd3326e4c80053e0311f47700ce 2009-11-06 10:33:46 -0800 Russ Cox expand "this is not just mercurial" section
9ad14c94db182dd3326e4c80053e0311f47700ce 2009-11-06 10:33:46 -0800 Russ Cox <rsc@golang.org> expand "this is not just mercurial" section
90cf2c38605cf6514cc395c9d94688c1154ffcda 2026-08-13 10:30:25 -0700 Gopher Robot <gobot@golang.org> [release-branch.go1.27] go1.27rc3
error: go1.27rc3: cannot verify a non-tag object of type commit.
```

- **Why it is a story:** From the first weekly snapshot through the newest release candidate in this clone, every tag ref points straight at a commit: there are no annotated tag objects, hence no tag messages or embedded tag signatures. Across every reachable ref, `%G?` reports `N` for all 71,792 commits as well. Before a user treats a release name as cryptographic provenance, the repository itself supplies only a name-to-hash pointer.
- **What the reader learns:** A release tag is not automatically a signed release statement. Count tag object types, run `verify-tag`, and inspect commit signature status; then describe only repository-level attestation, not the security of separately published archives or checksums.
- **Surprise:** 4

Verdict: High factual reliability—the ranked hashes, dates, authors, subjects, topology, and substantive object contents all survive reproduction.  
Reliability caveat: three displayed snippets are not literal output of their cited commands, and the day-one-spec narrative hides a five-minute replacement handoff.
