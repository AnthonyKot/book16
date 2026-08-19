# Scout: git/git

- **repo:** https://github.com/git/git
- **clone:** `/home/diablo/repos/git` (already present; not re-cloned)
- **clone size:** 376M on disk; `git count-objects -vH` → 1 pack, 314.06 MiB, 419158 objects
- **history span:** 2005-04-07 15:13:13 -0700 → 2026-08-15 09:20:13 -0700
- **commits:** 81925 (`git rev-list --count HEAD`)
- **tip:** `18e66859d87fb4b76599f73460b54f0848c76b16` Junio C Hamano, "The 14th batch"

```
git -C ~/book16/repos/git log --reverse --format='%H %ai %an %s' | head -3
e83c5163316f89bfbde7d9ab23ca2e25604af290 2005-04-07 15:13:13 -0700 Linus Torvalds Initial revision of "git", the information manager from hell
8bc9a0c769ac1df7820f2dbf8f7b7d64835e3c68 2005-04-07 15:16:10 -0700 Linus Torvalds Add copyright notices.
e497ea2a9b6c378f01d092c210af20cbee762475 2005-04-07 21:03:28 -0700 Linus Torvalds Make read-tree actually unpack the whole tree.

git -C ~/book16/repos/git log -1 --format='%H %ai %an %s'
18e66859d87fb4b76599f73460b54f0848c76b16 2026-08-15 09:20:13 -0700 Junio C Hamano The 14th batch
```

Day-one tree is 11 files / 1244 lines (`Makefile README cache.h cat-file.c commit-tree.c init-db.c read-cache.c read-tree.c show-diff.c update-cache.c write-tree.c`). Only `Makefile` and `read-cache.c` still exist at those paths. The first README opens "GIT - the stupid content tracker" and defines the object model as SHA-1 of the *compressed* bytes — a sentence that will be false thirteen days later.

---

## 1. Day one: the information manager from hell

- **find-type:** 3 (first commit)
- **hash:** `e83c5163316f89bfbde7d9ab23ca2e25604af290`
- **date:** 2005-04-07 15:13:13 -0700
- **author:** Linus Torvalds `<torvalds@ppc970.osdl.org>` (mailmap: linux-foundation.org)
- **message:** `Initial revision of "git", the information manager from hell`

```
git -C ~/book16/repos/git show --stat e83c5163316f89bfbde7d9ab23ca2e25604af290
commit e83c5163316f89bfbde7d9ab23ca2e25604af290
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Apr 7 15:13:13 2005 -0700

    Initial revision of "git", the information manager from hell

 Makefile       |  40 +++++++++
 README         | 168 +++++++++++++++++++++++++++++++++++++
 cache.h        |  93 +++++++++++++++++++++++++
 ...
 11 files changed, 1244 insertions(+)
```

**Why it is a story.** BitKeeper's license had just been pulled. There is no `git` wrapper, no commit command, no index-as-we-know-it — only a "current directory cache" and a content-addressable store. The subject line is a joke he is not sure anyone else will have to live with. The README already contains the four-mood definition of "git" and the claim that SHA-1 is taken *after* zlib. He is writing a replacement for the tool that hosted Linux, in one afternoon, and naming it after an insult.

**Reader learns:** day-one commits show what the author thought the program *was*, not what it became. The first tree is the design document.

**surprise:** 2 (everyone knows the subject line; fewer have counted the 11 files)

---

## 2. Three minutes later he copyrights it, by hand

- **find-type:** 2 (dated artifact) — also the real first-commit story
- **hash:** `8bc9a0c769ac1df7820f2dbf8f7b7d64835e3c68`
- **date:** 2005-04-07 15:16:10 -0700 (177 seconds after e83c516)
- **author:** Linus Torvalds
- **message:** `Add copyright notices.`

```
git -C ~/book16/repos/git log -1 --format='%B' 8bc9a0c769ac1df7820f2dbf8f7b7d64835e3c68
Add copyright notices.

The tool interface sucks (especially "committing" information, which is just
me doing everything by hand from the command line), but I think this is in
theory actually a viable way of describing the world. So copyright it.
```

Eight files, +5 lines each: `/* GIT - The information manager from hell / Copyright (C) Linus Torvalds, 2005 */`. There is no `git commit`. He is assembling trees and commit objects from the shell.

**Why it is a story.** The moment before the outcome: he has a pile of C that tracks directories, the UI is embarrassing, and he decides the *model* is worth owning. "Viable way of describing the world" is the sentence that turns a weekend hack into a project. The comment he pasted into `cat-file.c` is still line 2 of `builtin/cat-file.c` twenty-one years later (see dig 6).

**Reader learns:** the second commit often tells you more than the first. Look at the commit *after* the import for the author's actual verdict.

**surprise:** 4

---

## 3. Four lines named `git`

- **find-type:** 1 (tiny diff, huge blast radius)
- **hash:** `e764b8e8b3c50b131be825532ba26fa346d6586e`
- **date:** 2005-06-01 09:13:26 -0700
- **author:** Linus Torvalds
- **message:** `Add "git" and "git-log-script" helper scripts.`

```
git -C ~/book16/repos/git show e764b8e8b3c50b131be825532ba26fa346d6586e:git
#!/bin/sh
cmd="git-$1-script"
shift
exec $cmd "$@"
```

```
git -C ~/book16/repos/git show --stat e764b8e8b3c50b131be825532ba26fa346d6586e
    Add "git" and "git-log-script" helper scripts.
    ...
    Cheesy.

 Makefile       | 5 +++--
 git            | 4 ++++
 git-log-script | 2 ++
 3 files changed, 9 insertions(+), 2 deletions(-)
```

**Why it is a story.** For the first eight weeks there is no `git log`. There is `git-rev-list` and a swarm of `*-script` binaries. The entire `git <subcommand>` UX — the thing every tutorial starts with — is a four-line exec that exists so CVS refugees can type `git log`. He calls it "Cheesy." Fifty-five days after day one, the product name and the invocation people will tattoo on muscle memory are a shell shim.

**Reader learns:** the command your users think *is* the program is often a late, tiny adapter. `git log --diff-filter=A -- git` (and `git.sh`, `git.c`) is how you find when a tool became a product.

**surprise:** 5

---

## 4. 01:10 — hash the bytes, not the zlib stream

- **find-type:** 8 (rollback of the world)
- **hashes:** `d98b46f8d9a3daf965a39f8c0089c1401e0081ee`, follow-up `f18ca7316631914776136455c151d70318299459`
- **date:** 2005-04-20 01:10:46 -0700 (follow-up 01:34:54)
- **author:** Linus Torvalds
- **message:** `Do SHA1 hash _before_ compression.`

```
git -C ~/book16/repos/git show d98b46f8d9a3daf965a39f8c0089c1401e0081ee -- sha1_file.c
    Do SHA1 hash _before_ compression.
    And add a "convert-cache" program to convert from old-style
    to new-style.
...
-/* Sha1.. */
-SHA1_Init(&c);
-SHA1_Update(&c, compressed, size);
-SHA1_Final(sha1, &c);
+/* Sha1.. */
+SHA1_Init(&c);
+SHA1_Update(&c, buf, len);
+SHA1_Final(sha1, &c);
```

```
git -C ~/book16/repos/git log -1 --format='%s%n%b' f18ca7316631914776136455c151d70318299459
The recent hash/compression switch-over missed the blob creation.

Happily, convert-cache just magically fixes all errors.
```

**Why it is a story.** The day-one README said the SHA-1 was "always the hash of the _compressed_ object." Thirteen days and a 1:10am rewrite later, every object name in every git repository that will ever exist is the hash of the *uncompressed* payload plus a type/size header. He ships `convert-cache.c` the same night. Twenty-four minutes later he notices blobs were forgotten; the converter "just magically fixes all errors." Two weeks of objects are now a migration. The identity function of the next twenty years of software history is a 1am edit plus a one-shot converter that the big rename of September 2005 will delete.

**Reader learns:** content-addressed systems can change the address. Hunt `convert-*` programs and author-date hours after midnight around format flips. Your own object IDs may date to a night someone inverted a hash.

**surprise:** 5

---

## 5. The maintainer arrives as a one-character typo

- **find-type:** 4 (name that appears)
- **hashes:** `31cedfb95e7dda1e43aead0107d32f90f85f2160` (first), `54c26fb9d0cdff94c7717125d0a222b324bfea8a` (Linus merges `/home/torvalds/junkio/.git/`)
- **date:** 2005-04-12 08:04:17 -0700 (five days after e83c516)
- **author:** Junio C Hamano `<junkio@cox.net>` (mailmap later rewrites this to gitster@pobox.com)
- **message:** `[PATCH] Typofix in git/show-files.`

```
git -C ~/book16/repos/git log --no-use-mailmap -1 --format='%an <%ae>%n%s%n%b' 31cedfb95e7dda1e43aead0107d32f90f85f2160
Junio C Hamano <junkio@cox.net>
[PATCH] Typofix in git/show-files.
Fixes a typo in usage string.

From: Junio C Hamano <junkio@cox.net>
Signed-off-by: Petr Baudis <pasky@ucw.cz>
```

```
git -C ~/book16/repos/git show 31cedfb95e7dda1e43aead0107d32f90f85f2160
-usage("show-files (--[cached|deleted|others|ignoded])*");
+usage("show-files (--[cached|deleted|others|ignored])*");
```

```
git -C ~/book16/repos/git log -1 --format='%ai %an %s' 54c26fb9d0cdff94c7717125d0a222b324bfea8a
2005-05-03 07:30:10 -0700 Linus Torvalds Automatic merge of /home/torvalds/junkio/.git/
```

**Why it is a story.** The man who will make 28475 of the 81925 commits on `master` (Linus: 1118) enters as a usage-string typo, applied not by Linus but by Petr Baudis. Three weeks later Linus is merging a checkout that lives at `/home/torvalds/junkio/.git/` — Junio's tree is on Linus's disk, under Junio's Cox email handle. 2005 already belongs to Junio (1285 vs Linus 680). Linus's yearly counts then fade: 680, 162, 110, 81, 48, 16, 4, 5, 0, 3, 0, 4, 3, 0, 1, 0, 0, 1. Last commit: `04ede972` (2022-08-01), `symbolic-ref: refuse to set syntactically invalid target`.

**Reader learns:** `shortlog -sn` plus `--no-use-mailmap` plus the first commit of a name. Maintainers often arrive as a typo. Merge subjects that contain home directories are the handover happening in physical space.

**surprise:** 4

---

## 6. A joke comment that outlived the file it was written in

- **find-type:** 5 (comment that outlived its code)
- **hash:** `8bc9a0c769ac1df7820f2dbf8f7b7d64835e3c68` (still blamed on today's file)
- **date:** 2005-04-07
- **author:** Linus Torvalds
- **message:** (the copyright commit; the comment is the artifact)

```
git -C ~/book16/repos/git blame -L 1,5 builtin/cat-file.c
8bc9a0c769a cat-file.c (Linus Torvalds 2005-04-07 15:16:10 -0700 1) /*
8bc9a0c769a cat-file.c (Linus Torvalds 2005-04-07 15:16:10 -0700 2)  * GIT - The information manager from hell
8bc9a0c769a cat-file.c (Linus Torvalds 2005-04-07 15:16:10 -0700 3)  *
8bc9a0c769a cat-file.c (Linus Torvalds 2005-04-07 15:16:10 -0700 4)  * Copyright (C) Linus Torvalds, 2005
8bc9a0c769a cat-file.c (Linus Torvalds 2005-04-07 15:16:10 -0700 5)  */
```

```
git -C ~/book16/repos/git grep -n 'information manager from hell' HEAD | head -6
HEAD:Documentation/MyFirstObjectWalk.adoc:394:of "git", the information manager from hell". Congratulations! You've written
HEAD:builtin/cat-file.c:2: * GIT - The information manager from hell
HEAD:builtin/check-ref-format.c:2: * GIT - The information manager from hell
HEAD:builtin/commit-tree.c:2: * GIT - The information manager from hell
HEAD:builtin/diff-files.c:2: * GIT - The information manager from hell
HEAD:builtin/hash-object.c:2: * GIT - The information manager from hell
```

`cat-file.c` was moved to `builtin/` (`f81daefe`, 2006) and then into `builtin/` as a directory (`81b50f3c`, 2010). The five comment lines never changed. Same night he also minted `#define CACHE_SIGNATURE 0x44495243 /* "DIRC" */` in `cache.h`; it still defines the on-disk index magic in `read-cache-ll.h`.

**Why it is a story.** He put a dare in a header as he copyrighted a tool whose interface "sucks." The file was renamed, moved, rewritten around those five lines. New contributors still meet "from hell" before they meet `USE_THE_REPOSITORY_VARIABLE`. The on-disk index still answers to a four-letter joke from the afternoon git was born.

**Reader learns:** `git blame` on a comment older than the path. `git log -S` for the slogan. Banner comments and magic numbers are how day one occupies year twenty.

**surprise:** 3

---

## 7. A pack format with no unpacker

- **find-type:** 1 (tiny decision, huge blast radius)
- **hashes:** `c323ac7d9c573c5ee8b45b9b9def92a4d4d8204d`, then `a733cb606fed08130317d803956e946f73b0b88e`
- **dates:** 2005-06-25 14:42:43 -0700; 2005-06-28 14:21:02 -0700
- **author:** Linus Torvalds
- **messages:** `git-pack-objects: create a packed object representation.` / `Change pack file format. Hopefully for the last time.`

```
git -C ~/book16/repos/git log -1 --format='%s%n%b' c323ac7d9c573c5ee8b45b9b9def92a4d4d8204d
git-pack-objects: create a packed object representation.
...
I haven't actually written an unpacker yet, so the end result has not
been verified in any way yet.  I obviously always write bug-free code,
so it just has to work, no?
```

```
git -C ~/book16/repos/git log -1 --format='%s%n%b' a733cb606fed08130317d803956e946f73b0b88e
Change pack file format. Hopefully for the last time.

This also adds a header with a signature, version info, and the number
of objects to the pack file.
```

**Why it is a story.** The container that will move Linux, Chromium, and everyone else's history starts as 403 lines of packer and a joke that there is no reader. Three days later the on-disk layout changes "hopefully for the last time" (it will not be the last time: thin packs, bitmap indexes, multi-pack-index, cruft packs). `convert-cache` taught him to ship a migrator; here he ships a format and dares the future to keep it.

**Reader learns:** "hopefully the last time" in a format commit is a marker. Search it. The sentence is never true and always where the blast radius is.

**surprise:** 4

---

## 8. Big tool rename: cache becomes index, "in the near future"

- **find-type:** 1
- **hash:** `215a7ad1ef790467a4cd3f0dcffbd6e5f04c38f7`
- **date:** 2005-09-07 17:26:23 -0700
- **author:** Junio C Hamano `<junkio@cox.net>`
- **message:** `Big tool rename.`

```
git -C ~/book16/repos/git log -1 --format='%s%n%b' 215a7ad1ef790467a4cd3f0dcffbd6e5f04c38f7
Big tool rename.
As promised, this is the "big tool rename" patch.  The primary differences
since 0.99.6 are:

  (1) git-*-script are no more.  ...
  (2) Many command names with 'cache' in them are renamed with
      'index' if that is what they mean.

There are backward compatibility symblic links so that you and
Porcelains can keep using the old names, but the backward
compatibility support  is expected to be removed in the near
future.
```

160 files, 1023 insertions / 915 deletions. `update-cache.c => update-index.c`. `convert-cache` dies here.

**Why it is a story.** Five months in, the vocabulary of the whole project is swapped while users are forming habits. "Near future" for dropping the old names is doing a lot of work — `read-cache.c` is still a path on `master` in 2026. Porcelain (`git`) and plumbing (`git-update-index`) split in this commit; so does the word everyone uses for the staging area.

**Reader learns:** the words in your UI are often a rename with compatibility shims. `git log --diff-filter=R --summary` around the first year finds when the project decided what to call itself.

**surprise:** 3

---

## 9. Stop calling it stupid

- **find-type:** 5 (slogan that outlived the pose)
- **hash:** `28513c4f56a2164fd6d3a16ceddbab3a5bf3f191`
- **date:** 2016-02-25 09:37:29 +0100
- **author:** Matthieu Moy
- **message:** `README.md: don't call git stupid in the title`

```
git -C ~/book16/repos/git show 28513c4f56a2164fd6d3a16ceddbab3a5bf3f191 -- README.md
-Git - the stupid content tracker
-================================
+Git - fast, scalable, distributed revision control system
+=========================================================
```

"the stupid content tracker" was true in the early days of Git, but hardly applicable these days… Also, "stupid" can be seen as offensive… The new formulation is taken from the description of the Debian package.

Predecessor: `556b6600` (2007-01-17) Nicolas Pitre, `sanitize content of README file` — the original esoteric README is pushed into `Documentation/core-intro.txt`. The title joke survived that sanitizing and lived another nine years. `Documentation/git.adoc` still opens `git - the stupid content tracker`. `builtin/mktree.c` still wears it as a file banner.

**Why it is a story.** The project outgrew the joke and then spent a decade being unable to take it off the door. Debian's package description, not Linus, writes the new first line. The insult retreats into the man page and a banner comment, which is how slogans actually die: they are demoted, not deleted.

**Reader learns:** grep the founding joke in HEAD. The hits that remain after a "don't call it that" commit are the ones that won.

**surprise:** 3

---

## 10. Hooks during clone: a feature that became the CVEs, then a revert war

- **find-type:** 7 (feature that became the vulnerability) and 6 (revert war)
- **hashes:** `8db1e8743c0f1ed241f6a1b8bf55b6fef07d6751` (add), `873a466ea3f233d4fb11f894a311de06939a2a3e` (revert)
- **dates:** 2024-03-28; 2024-05-20
- **author:** Johannes Schindelin
- **messages:** `clone: prevent hooks from running during a clone` / `clone: drop the protections where hooks aren't run`

```
git -C ~/book16/repos/git log -1 --format='%s%n%b' 873a466ea3f233d4fb11f894a311de06939a2a3e
clone: drop the protections where hooks aren't run
As part of the security bug-fix releases v2.39.4, ..., v2.45.1, I
introduced logic to safeguard `git clone` from running hooks that were
installed _during_ the clone operation.

The rationale was that Git's CVE-2024-32002, CVE-2021-21300,
CVE-2019-1354, CVE-2019-1353, CVE-2019-1352, and CVE-2019-1349 should
have been low-severity vulnerabilities but were elevated to
critical/high severity by the attack vector that allows a weakness where
files inside `.git/` can be inadvertently written during a `git clone`
to escalate to a Remote Code Execution attack by virtue of installing a
malicious `post-checkout` hook ...

Unfortunately, Git LFS uses a similar strategy to install its own
`post-checkout` hook during a `git clone`...
This reverts commit 8db1e8743c0 (clone: prevent hooks from running
during a clone, 2024-03-28).
```

**Why it is a story.** Running hooks at the end of clone was convenience. Combined with case-folding, symlinks, and a writable `.git`, it was how a path bug became RCE. The defense-in-depth landed in the emergency releases, then came back out seven weeks later because Git LFS *is* the same pattern used in anger. The rule the reverts enforce: you cannot close the hole without breaking the largest extension. Same family as `a42643aa` (2014-12-15, Jeff King) `read-cache: optionally disallow HFS+ .git variants` — CVE-2014-9390, 45 lines, optional because it "has a minor performance penalty."

**Reader learns:** clone-time hooks and "optional" filesystem protections are how platform accidents become product CVEs. Pair `git log --grep=CVE` with the revert that names the downstream tool you cannot break.

**surprise:** 4

---

## 11. A 2012 gitk patch committed in 2025

- **find-type:** 2 (dated / planted-looking artifact)
- **hash:** `5eb02dd8f08fc3b7ff22320c3311cd1da6a5ab4d`
- **author date:** 2012-02-04 21:54:36 +0100
- **committer date:** 2025-01-11 18:17:42 +0100 (4724 days later)
- **author:** Karsten Blees; committer: Johannes Schindelin
- **message:** `gitk: Unicode file name support`

```
git -C ~/book16/repos/git log -1 --format='%H%n%ad%n%cd%n%an / %cn%n%s' --date=iso 5eb02dd8f08fc3b7ff22320c3311cd1da6a5ab4d
```

(verified via `%ai` / `%ci`: author 2012-02-04, commit 2025-01-11.) Same day Dscho also commits other gitk patches with 2012–2016 author dates (`baaa9d6d`, `ac75b4c2`, `18a7e198`). This is not clock skew; it is a pile of topic-branch patches that sat unapplied in the gitk tree for thirteen years.

**Why it is a story.** Unicode filenames on Windows were a real 2012 bug. The fix existed. gitk's maintainer chain let the author date freeze while the rest of git moved. A reader bisecting "when did gitk learn UTF-8 names?" on author date gets 2012; on commit date, 2025. Both are true.

**Reader learns:** always print `%ai` and `%ci`. Gaps measured in years are usually stalled subtrees (gitk, git-gui, l10n), not time travel — but they still lie to `git blame` and to anyone sorting by author date.

**surprise:** 3

---

## Ranked top 3

1. **#4 — 01:10 hash-before-compression** (`d98b46f8`). Every object ID in every git repo is this night. He inverted the first README, shipped a converter, missed blobs, and went to bed. Type 8, surprise 5.
2. **#3 — four-line Cheesy `git` wrapper** (`e764b8e8`). The verb people think is the program is a 4-line `exec` for CVS users. Type 1, surprise 5.
3. **#2 — "so copyright it"** (`8bc9a0c7`). One hundred seventy-seven seconds after day one, committing by hand, he decides the model is a viable way of describing the world. Type 2, surprise 4.

## Disappointing

`--grep=oops/sorry/hack/FIXME` and April-1 / Dec-31 timestamps were merge-ticket noise; BitKeeper is only in packaging docs; there is no planted fake date — git's mythology is earnest 1am engineering, and the later 80 000 commits are mostly "Merge branch" / "The Nth batch."
