# Magically fixes all errors

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [Magically fixes all errors](05-git.html).*

There is a sentence in the first document git ever shipped. It sits in the README of the very
first commit, in the section that explains how objects get their names:

> The SHA1 hash is always the hash of the _compressed_ object, not the original one.

That is the law of the whole design — everything else in git stands on how an object gets its
name — and it is written the way you write when you are two hours into a project and completely
sure: *always*. [R2] Hold on to the sentence. We will come back for it.

## Eleven files

Day one has a timestamp: Thursday, 7 April 2005, 15:13:13. The commit is `e83c516331`, the subject
is `Initial revision of "git", the information manager from hell`, and the tree is eleven files,
1,244 lines, total. [R1] Linux had just lost the proprietary tool that hosted its source, and its
creator was writing the replacement personally, in an afternoon.
<!-- CHECK: "Linux had just lost BitKeeper" — the April 2005 license withdrawal is public record, not in this repo. -->
Read the eleven file names like an inventory: `read-cache.c`, `update-cache.c`, `commit-tree.c`,
`write-tree.c`, `cat-file.c`. There is no `git` command in this tree. There is no `git commit`,
no `git log`, no branches. There is a content store, a directory cache, and that README.

Now look at the second commit, because the second commit is where the real decision lives. It
lands at 15:16:10 — one hundred and seventy-seven seconds after the first — and it adds copyright
notices. The message reads:

```console
$ git show -s --format='%B' 8bc9a0c769
The tool interface sucks (especially "committing" information, which is just
me doing everything by hand from the command line), but I think this is in
theory actually a viable way of describing the world. So copyright it.
```

[R3] Sit in that three-minute gap. He has a pile of C whose interface, by his own account, sucks.
And in that state, before writing anything easier, he stops to claim ownership — not of the tool,
the tool is embarrassing, but of the *model*. "A viable way of describing the world" is the
sentence where a weekend hack becomes a project. The copyright header he pasted that afternoon
calls it `The information manager from hell`, and it is still line 2 of `builtin/cat-file.c`
today.

## The hand-made weeks

For the next two weeks the world runs on that embarrassing interface. "Doing everything by hand"
is not a figure of speech; here is the README's own instruction for making a commit, as it stood
that month:

```console
$ git show 6ad6d3d36c:README | sed -n '363,370p'
		commit-tree <tree> -p <parent> [-p <parent2> ..]

	and then giving the reason for the commit on stdin ...

	commit-tree will return the name of the object that represents
	that commit, and you should save it away for later use.
```

[R12] *You should save it away for later use.* The version control system hands you your commit
ID and trusts you, personally, to write it down. That is the workshop. And you can see the
hand-assembly in the objects it left behind. On 18 April there is a commit whose subject announces
real work: `Add "dotest" and "applypatch" scripts to actually make things useful.` This is the
kind of subject line that makes my hand reach for the tree — triumphant verbs age badly in this
book — and the tree repays the reflex:

```console
$ git show -s --format='tree   %T' e90a4c0ed1
tree   32195815983806b5bbfb708e11fea0ec139d772d
$ git show -s --format='parent-tree %T' e90a4c0ed1^
parent-tree 32195815983806b5bbfb708e11fea0ec139d772d
```

The tree is identical to its parent's tree. The diff is empty. [R4] The scripts it announces had
already landed, six days earlier, in the parent. No deception — just a man forging commits
manually, re-recording an announcement whose work was already in. But pocket the shape: the
message said one thing, the tree said another, and nothing in the model forced them to agree.

That is the world on the night of 19 April: a two-week-old tool, hand-driven, already hosting its
own development. And its naming law is about to change.

## 01:10

First, be fair to the law as written, because on 7 April it is a perfectly sane choice. The
objects live on disk as zlib-deflated files. If the name is the hash of the file as stored, then
verifying an object is one step: hash what is on disk, compare with the filename, done. No
inflating, no parsing. The compressed bytes are the *actual artifact* — hashing the thing itself,
rather than some idea of the thing, is the kind of decision a careful engineer defends in review.
For thirteen days, it is the truth, and it works.

The trouble is what the name is now coupled to. Compress the same content with a different zlib
version, a different setting, a different mood — the bytes of the container change, and the name
changes with them. The identity of the data depends on the behavior of a compression library.
For a system whose entire premise is *the name is the content*, the name was, in fact, the
packaging.

At 01:10:46 on 20 April, commit `d98b46f8d9`, subject `Do SHA1 hash _before_ compression.`:

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

## 01:34

Twenty-four minutes later, a second commit:

```console
$ git show -s --format='%ai%n%s%n%b' f18ca73166
2005-04-20 01:34:54 -0700
The recent hash/compression switch-over missed the blob creation.
Happily, convert-cache just magically fixes all errors.
```

[R6] Read what happened inside those twenty-four minutes. He had changed the naming of everything
— and missed *files*. Not an exotic corner: blobs, the object type a version control system
exists to store, the commonest thing in any repository. The path that creates them, over in
`update-cache.c`, was still hashing the compressed stream under the old law. For twenty-four
minutes the young world ran on two naming laws at once, and the one still on the old law was the
one holding all the actual work.

Now read the first word of the second line, because the whole night is in it. *Happily.* This is
what the miss cost: nothing. The converter he had written an hour earlier — built to migrate
thirteen days of history — turned out to be exactly the mop the new mess needed. Foresight did
not prevent the mistake. It made the mistake cheap. The fix moves the blob's `"blob %lu"` header
and raw contents into the hash, the same shape as the 01:10 change. The converter mops up every
object the oversight had misnamed.

~ Then, with the world renamed twice before two in the morning, he apparently went to bed.

Every object name in every git repository since is the output of those four lines — including
every hash in this book's receipts, which is to say the thing you have been checking these
chapters against was itself settled that night. [R11]

## The constitution didn't notice

Now go back to the README, because the README was not in either commit. The 01:10 change touched
five files — `Makefile`, `cache.h`, `convert-cache.c`, `fsck-cache.c`, `sha1_file.c` — and the
founding document is not among them. [R5] Check it as of the flip itself:

```console
$ git show d98b46f8d9:README | sed -n '68,70p'
data in the object.  It's worth noting that the SHA1 hash that is used
to name the object is always the hash of this _compressed_ object, not
the original data.
```

[R7] The law changed at 01:10; the constitution kept the old text. Not for an hour — for
thirty-two days. Nobody rushed to amend it, because everybody who mattered already knew, and the
set of everybody was approximately one.

The correction, when it finally comes on 22 May, is not from Linus — the project has readers now.
Author: David Greaves. Subject: `[PATCH] Docs - asciidoc changes`. Body: "Whitespace and asciidoc
formatting changes only in preparation for content changes." And this hunk:

```diff
-to name the object is always the hash of this _compressed_ object, not
-the original data.
+to name the object is the hash of the original data (historical note:
+in the dawn of the age of git this was the sha1 of the _compressed_
+object)
```

[R8] The commit that amends the constitution says it changes nothing. The message is testimony;
the tree is evidence — it is the empty-diff shape from the hand-made weeks, inverted, a copy-edit
understating itself instead of an announcement overstating. You cannot bisect for meaning by
reading messages, in either direction.

And savor the parenthetical itself: "in the dawn of the age of git." The dawn of the age was five
weeks before the sentence was written. The old law had lasted thirteen days, and it was already
being written about the way we write about Sumer.

## The mayfly

`convert-cache` — the 138-line mop of the night, the only program that ever spoke both naming
laws — lived exactly five months. It died on 7 September 2005, deleted in Junio C Hamano's `Big
tool rename` along with the rest of the project's first vocabulary. [R9] Nobody would ever need
it again: every repository born after 20 April was born under the new law, and the handful born
before had been converted by their only user. The migration tool for the most durable name in
software had the lifespan of a mayfly. The permanence lives in the *rule*, not in the machinery
around it — the machinery is disposable the moment the last old object is gone. Even the hash
function turned out to be machinery: when git later grew SHA-256 repositories, the algorithm
changed and the law did not. *Name the header plus the raw bytes* is the 01:10 law still.

## At home

You can hold the whole night in one hand. Run this anywhere:

```console
$ printf 'hello' | git hash-object --stdin
b6fc4c620b67d95f953a5c1c1230aaab5db5a1b0
$ printf 'blob 5\0hello' | sha1sum
b6fc4c620b67d95f953a5c1c1230aaab5db5a1b0  -
```

[R10] Identical. No git involved in the second line — just the header, a NUL, the raw bytes, and
SHA-1. That equality *is* the four-line diff from 01:10. Notice what is absent: compression. Your
object's name will survive every repack, every storage rewrite, every zlib upgrade git will ever
ship, because one man decided, at ten past one in the morning, that a thing's identity must never
depend on its container. That is the takeaway, and it is portable to everything you build: hash
the content, never the packaging. The moment you name the gzip instead of the data, you have
coupled every identifier in your system to a library's output.

Twenty-one years on, the two commands above still agree, and they will agree the day you read
this. Type them and watch a decision from the small hours of 20 April 2005 come back as forty
hex characters — the same answer it gave the first tired man who checked.

## Receipts

- **R1** `git show --stat e83c516331` — 2005-04-07 15:13:13, "Initial revision of 'git', the information manager from hell", 11 files, 1,244 insertions.
- **R2** `git show e83c516331:README | sed -n '31,34p'` — the day-one law: "The SHA1 hash is always the hash of the _compressed_ object."
- **R3** `git show -s --format='%B' 8bc9a0c769` — 15:16:10 (+177s), "a viable way of describing the world. So copyright it."
- **R4** `git show -s --format='tree %T' e90a4c0ed1{,^}` — 2005-04-18, subject claims two scripts; tree identical to parent, diff empty.
- **R5** `git show --stat d98b46f8d9 -- sha1_file.c` — 2005-04-20 01:10:46, "Do SHA1 hash _before_ compression.", the four-line flip + convert-cache.c (138 lines); README not touched.
- **R6** `git show f18ca73166 -- update-cache.c` — 01:34:54, "missed the blob creation. Happily, convert-cache just magically fixes all errors."
- **R7** `git show d98b46f8d9:README | sed -n '68,70p'` — as of the flip, the README still states the compressed-hash law.
- **R8** `git show 8ac866a869 -- README` — 2005-05-22, David Greaves, "Whitespace and asciidoc formatting changes only"; the hunk rewrites the naming law, old rule demoted to "historical note: in the dawn of the age of git".
- **R9** `git log --diff-filter=D -- convert-cache.c` — deleted 2005-09-07, Junio C Hamano, "Big tool rename."
- **R10** `printf 'hello' | git hash-object --stdin` vs `printf 'blob 5\0hello' | sha1sum` — identical; the rule, runnable anywhere.
- **R11** `git count-objects -vH` — 419,158 objects in this clone alone, all named by the 01:10 rule.
- **R12** `git show 6ad6d3d36c:README | sed -n '363,374p'` — the hand workflow: commit-tree returns the name "and you should save it away for later use."

*Full transcripts: `chapters/05-git.receipts.md` (regenerate with `scripts/receipts-05.sh`).*
