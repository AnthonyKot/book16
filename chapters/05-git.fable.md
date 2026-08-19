# Magically fixes all errors

There is a sentence in the first document git ever shipped, and the sentence is a law. It sits in
the README of the very first commit, in the section that explains how objects get their names:

> The SHA1 hash is always the hash of the _compressed_ object, not the original one.

This is the closest thing git has to a constitution. Everything else — branches, merges, tags,
the entire archaeology this book practices — stands on how an object gets its name. And the law
as written on day one is false in every repository on earth. It was false thirteen days after it
was written. This is the story of the night it stopped being true, which is also the night the
identity of everything git would ever store was settled, between ten past one and twenty-five to
two in the morning, by one man who then apparently went to bed.

## Eleven files

Day one has a timestamp: Thursday, 7 April 2005, 15:13:13. The commit is `e83c5163`, the subject
is `Initial revision of "git", the information manager from hell`, and the tree is eleven files,
1,244 lines, total. [R1] Linux had just lost the proprietary tool that hosted its source, and its
creator was writing the replacement personally, in an afternoon.
<!-- CHECK: "Linux had just lost BitKeeper" — the April 2005 license withdrawal is public record, not in this repo. -->
Read the eleven file names like an inventory: `read-cache.c`, `update-cache.c`, `commit-tree.c`,
`write-tree.c`, `cat-file.c`. There is no `git` command in this tree. There is no `git commit`,
no `git log`, no branches. There is a content store, a directory cache, and a README that
describes, with total confidence, a design that is two hours old.

Now look at the second commit, because the second commit is where the real decision lives. It
lands at 15:16:10 — one hundred and seventy-seven seconds after the first — and it adds copyright
notices. The message reads:

```console
$ git show -s --format='%B' 8bc9a0c7
The tool interface sucks (especially "committing" information, which is just
me doing everything by hand from the command line), but I think this is in
theory actually a viable way of describing the world. So copyright it.
```

[R3] Sit in that three-minute gap. He has a pile of C whose interface, by his own account, sucks.
Committing means hand-assembling objects from the shell. And in that state, before writing
anything easier, he stops to claim ownership — not of the tool, the tool is embarrassing, but of
the *model*. "A viable way of describing the world" is the sentence where a weekend hack becomes
a project. The copyright header he pasted that afternoon calls it `The information manager from
hell`, and it is still line 2 of `builtin/cat-file.c` today.

## The hand-made weeks

For the next two weeks the world runs on that embarrassing interface, and you can see the
hand-assembly in the objects it left. On 18 April there is a commit whose subject announces real
work: `Add "dotest" and "applypatch" scripts to actually make things useful.` Ask git what it
changed:

```console
$ git show -s --format='tree   %T' e90a4c0e
tree   32195815983806b5bbfb708e11fea0ec139d772d
$ git show -s --format='parent-tree %T' e90a4c0e^
parent-tree 32195815983806b5bbfb708e11fea0ec139d772d
```

The tree is identical to its parent's tree. The diff is empty. [R4] The scripts it announces had
already landed, six days earlier, in the parent. This is not deception; it is what history looks
like when a person is forging commits manually and re-records an announcement whose work is
already in. But mark the shape, because this book will keep meeting it: a commit message is a
*claim*, and the tree is the *fact*, and nothing in the model forces them to agree.

That is the world on the night of 19 April: a two-week-old tool, hand-driven, already hosting its
own development and the beginnings of the kernel's. And its naming law has a flaw the README
walked right past.

## 01:10

Here is the flaw, in the day-one law itself: *the hash of the compressed object*. An object's
name was the SHA-1 of the zlib-deflated bytes on disk. Which means the name depends not only on
what you stored but on how the container squeezed it. Compress the same content with a different
zlib version, a different setting, a different mood — the bytes of the container change, and the
name changes with them. The identity of your data is coupled to the behavior of a compression
library. For a system whose entire premise is *the name is the content*, the name was, in fact,
the packaging.

At 01:10:46 on 20 April, commit `d98b46f8`, subject `Do SHA1 hash _before_ compression.`:

```diff
-	SHA1_Init(&c);
-	SHA1_Update(&c, compressed, size);
-	SHA1_Final(sha1, &c);
+	SHA1_Update(&c, header, 1+sprintf(header, "%s %lu", type, size));
+	SHA1_Init(&c);
+	SHA1_Update(&c, buf, len);
+	SHA1_Final(sha1, &c);
```

[R5] Four lines. The hash now covers a tiny header — the object's type and size — followed by the
raw, uncompressed content. Compression becomes what it should always have been: a storage detail,
free to change forever without renaming anything. The same commit ships a new program,
`convert-cache.c`, 138 lines, whose job is to walk every object made under the old law and mint
it a new name under the new one. Thirteen days of history — the whole world so far — is now a
migration.

~ Every object name in every git repository since is the output of those four lines.

The clone this chapter is dug from holds 419,158 objects; every one of them answers to the 01:10
rule. [R11] So does every hash printed in this book's receipts. The receipts you have been
checking these chapters against are written in a currency minted that night. And the rule
outlived even its own hash function: when git later grew SHA-256 repositories, what changed was
the algorithm — the law, *name the header plus the raw bytes*, is the 01:10 law still.

## 01:34

Twenty-four minutes later, a second commit:

```console
$ git show -s --format='%ai%n%s%n%b' f18ca731
2005-04-20 01:34:54 -0700
The recent hash/compression switch-over missed the blob creation.
Happily, convert-cache just magically fixes all errors.
```

[R6] Read what happened inside those twenty-four minutes. He had changed the naming of everything
— and missed *files*. The code path that creates blobs, the single most common object in any
repository, was still hashing the compressed stream. The fix moves the blob's `"blob %lu"` header
and raw contents into the hash, the same shape as the 01:10 change, and the message waves at the
damage with one word doing all the work: *happily*, the converter he happened to write that same
night mops up every object the oversight had misnamed.

~ The identity of everything git would ever store was settled between 01:10 and 01:35, by a man
debugging his own naming law in production, alone.

There was no design review. There was no committee, no RFC, no migration window. There was a
falsifiable idea, a four-line diff, a converter, a missed case, and a second cup of whatever he
was drinking. The most load-bearing identifier in modern software — the thing your CI trusts,
your signatures sign, your this-book's-receipts check — got its final shape in the small hours,
recorded in two commits nobody was awake to read.

## The constitution didn't notice

Now go back to the README, because the README was not in either commit. The 01:10 change touched
five files — `Makefile`, `cache.h`, `convert-cache.c`, `fsck-cache.c`, `sha1_file.c` — and the
founding document is not among them. [R5] Check the README as of the flip itself:

```console
$ git show d98b46f8:README | sed -n '68,70p'
data in the object.  It's worth noting that the SHA1 hash that is used
to name the object is always the hash of this _compressed_ object, not
the original data.
```

[R7] The law changed at 01:10; the constitution kept the old text. Not for an hour — for
thirty-two days. Nobody rushed to amend it, because everybody who mattered already knew, and the
set of everybody was approximately one.

The correction, when it finally comes on 22 May, is my favorite commit in this chapter, because
of what it says it is. Author: David Greaves — not Linus; the project has readers now. Subject:
`[PATCH] Docs - asciidoc changes`. Body: "Whitespace and asciidoc formatting changes only in
preparation for content changes." And inside this formatting-only patch, this hunk:

```diff
-to name the object is always the hash of this _compressed_ object, not
-the original data.
+to name the object is the hash of the original data (historical note:
+in the dawn of the age of git this was the sha1 of the _compressed_
+object)
```

[R8] The commit that amends the constitution *says it changes nothing*. The claim and the diff
part ways again — this time in the polite direction, a copy-edit understating itself rather than
an announcement overstating, but the archaeological lesson is identical and it is the sharpest
one in this repository: you cannot bisect for meaning by reading messages. The message is
testimony. The tree is evidence.

And savor the parenthetical itself: "in the dawn of the age of git." The dawn of the age was five
weeks before the sentence was written. The old law had lasted thirteen days, and it was already
being written about the way we write about Sumer.

## The mayfly

One loose end. `convert-cache`, the 138-line program that translated the old universe into the
new one — the only tool that ever spoke both naming laws — lived exactly five months. It died on
7 September 2005, deleted in Junio C Hamano's `Big tool rename` along with the rest of the
project's first vocabulary. [R9] Nobody would ever need it again: every repository born after 20
April was born under the new law, and the handful born before had been converted by their only
user. The migration tool for the most durable identifier in software had the lifespan of a
mayfly. Durability and permanence live in the *rule*, not in the machinery around it; the
machinery is disposable the moment the last old object is gone.

## At home

You can hold the 01:10 decision in one hand. Run this anywhere:

```console
$ printf 'hello' | git hash-object --stdin
b6fc4c620b67d95f953a5c1c1230aaab5db5a1b0
$ printf 'blob 5\0hello' | sha1sum
b6fc4c620b67d95f953a5c1c1230aaab5db5a1b0  -
```

[R10] Identical. No git involved in the second line — just the header, a NUL, the raw bytes, and
SHA-1. That equality *is* the four-line diff from 01:10; you have just executed a decision made
at one in the morning twenty-one years ago. Notice what is absent: compression. Your object's
name will survive every repack, every storage rewrite, every zlib upgrade git will ever ship.

Three habits to take home. First, when you find a format flip in any project's history, hunt for
the converter — `git log --diff-filter=A -- '*convert*'` — and check the author-date hours around
it; the decisions that define a system's world tend to carry timestamps no meeting would ever
produce. Second, compare trees, not messages: `git diff <commit>^ <commit>` on a suspiciously
triumphant subject line will occasionally return nothing at all, and a "formatting only" patch
will occasionally rewrite a law. The message is testimony; the tree is evidence. And third, the
01:10 rule itself, portable to everything you build: never let a thing's identity depend on its
container. The moment you hash the gzip instead of the content, the serialization instead of the
data, you have coupled every name in your system to a library's mood — and somewhere down the
line there is a 1 a.m. waiting for you too.

## Receipts

- **R1** `git show --stat e83c5163` — 2005-04-07 15:13:13, "Initial revision of 'git', the information manager from hell", 11 files, 1,244 insertions.
- **R2** `git show e83c5163:README | sed -n '31,34p'` — day-one law: "The SHA1 hash is always the hash of the _compressed_ object."
- **R3** `git show -s --format='%B' 8bc9a0c7` — 15:16:10 (+177s), "a viable way of describing the world. So copyright it."
- **R4** `git show -s --format='tree %T' e90a4c0e{,^}` — 2005-04-18, subject claims two scripts; tree identical to parent, diff empty.
- **R5** `git show --stat d98b46f8 -- sha1_file.c` — 2005-04-20 01:10:46, "Do SHA1 hash _before_ compression.", the four-line flip + convert-cache.c (138 lines); README not touched.
- **R6** `git show f18ca731 -- update-cache.c` — 01:34:54, "missed the blob creation. Happily, convert-cache just magically fixes all errors."
- **R7** `git show d98b46f8:README | sed -n '68,70p'` — as of the flip, the README still states the compressed-hash law.
- **R8** `git show 8ac866a869 -- README` — 2005-05-22, David Greaves, "Whitespace and asciidoc formatting changes only"; the hunk rewrites the naming law, old rule demoted to "historical note: in the dawn of the age of git".
- **R9** `git log --diff-filter=D -- convert-cache.c` — deleted 2005-09-07, Junio C Hamano, "Big tool rename."
- **R10** `printf 'hello' | git hash-object --stdin` vs `printf 'blob 5\0hello' | sha1sum` — identical; the rule, runnable anywhere.
- **R11** `git count-objects -vH` — 419,158 objects in this clone, all named by the 01:10 rule.

*Full transcripts: `chapters/05-git.receipts.md` (regenerate with `scripts/receipts-05.sh`).*
