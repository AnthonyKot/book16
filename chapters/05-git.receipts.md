# Receipts — ch. 05 git (the 01:10 hash flip)

Verbatim outputs against a full clone of https://github.com/git/git.
Regenerate with `scripts/receipts-05.sh`. Long outputs truncated editorially (head).

## R1 — day one: 2005-04-07 15:13, 11 files, 1,244 lines
```
$ git -C repos/git show --stat --format=%H%n%ai\ %an%n%s e83c5163316f89bfbde7d9ab23ca2e25604af290
e83c5163316f89bfbde7d9ab23ca2e25604af290
2005-04-07 15:13:13 -0700 Linus Torvalds
Initial revision of "git", the information manager from hell

 Makefile       |  40 +++++++++
 README         | 168 +++++++++++++++++++++++++++++++++++++
 cache.h        |  93 +++++++++++++++++++++
 cat-file.c     |  23 +++++
 commit-tree.c  | 172 ++++++++++++++++++++++++++++++++++++++
 init-db.c      |  51 ++++++++++++
 read-cache.c   | 259 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 read-tree.c    |  43 ++++++++++
 show-diff.c    |  81 ++++++++++++++++++
 update-cache.c | 248 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 write-tree.c   |  66 +++++++++++++++
 11 files changed, 1244 insertions(+)
```

## R2 — the day-one README defines the object name: hash of the COMPRESSED bytes
```
$ git -C repos/git show e83c5163:README | sed -n '31,34p'
database.  They are all in deflated with zlib, and start off with a tag
of their type, and size information about the data.  The SHA1 hash is
always the hash of the _compressed_ object, not the original one.
```

## R3 — 177 seconds later: 'So copyright it.'
```
$ git -C repos/git show -s --format=%H%n%ai\ %an%n%ct%n%B 8bc9a0c769ac1df7820f2dbf8f7b7d64835e3c68
8bc9a0c769ac1df7820f2dbf8f7b7d64835e3c68
2005-04-07 15:16:10 -0700 Linus Torvalds
1112912170
Add copyright notices.

The tool interface sucks (especially "committing" information, which is just
me doing everything by hand from the command line), but I think this is in
theory actually a viable way of describing the world. So copyright it.
```

```
$ epoch delta: 1112912170 - 1112911993 = 177 seconds
1112911993 Initial revision of "git", the information manager from hell
1112912170 Add copyright notices.
```

## R4 — the hand-made weeks: a commit that claims two scripts, tree identical to its parent
```
$ git -C repos/git show -s --format=%H%n%ai\ %an%n%s%n%b%ntree\ \ \ %T e90a4c0ed17b66c302f48ec0a234cac6f27e5eec
e90a4c0ed17b66c302f48ec0a234cac6f27e5eec
2005-04-18 16:11:32 -0700 Linus Torvalds
Add "dotest" and "applypatch" scripts to actually make things useful.
Also updates "mailinfo" to write the file list.

tree   32195815983806b5bbfb708e11fea0ec139d772d
```

```
$ parent tree is the same object; diff is empty
parent-tree 32195815983806b5bbfb708e11fea0ec139d772d
diff EMPTY
```

## R5 — 2005-04-20 01:10:46: 'Do SHA1 hash _before_ compression.'
```
$ git -C repos/git show --stat --format=%H%n%ai\ %an%n%B d98b46f8d9a3daf965a39f8c0089c1401e0081ee
d98b46f8d9a3daf965a39f8c0089c1401e0081ee
2005-04-20 01:10:46 -0700 Linus Torvalds
Do SHA1 hash _before_ compression.

And add a "convert-cache" program to convert from old-style
to new-style.


 Makefile        |   6 ++-
 cache.h         |   2 +-
 convert-cache.c | 138 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck-cache.c    |  11 +++--
 sha1_file.c     |  14 +++---
 5 files changed, 158 insertions(+), 13 deletions(-)
```

```
$ git -C repos/git show d98b46f8d9 -- sha1_file.c | sed -n '14,50p'  (both functions' hunks, verbatim)
@@ -80,12 +80,14 @@ char *sha1_file_name(const unsigned char *sha1)
 	return base;
 }
 
-int check_sha1_signature(unsigned char *sha1, void *map, unsigned long size)
+int check_sha1_signature(unsigned char *sha1, void *map, unsigned long size, const char *type)
 {
+	char header[100];
 	unsigned char real_sha1[20];
 	SHA_CTX c;
 
 	SHA1_Init(&c);
+	SHA1_Update(&c, header, 1+sprintf(header, "%s %lu", type, size));
 	SHA1_Update(&c, map, size);
 	SHA1_Final(real_sha1, &c);
 	return memcmp(sha1, real_sha1, 20) ? -1 : 0;
@@ -172,6 +174,11 @@ int write_sha1_file(char *buf, unsigned len, unsigned char *returnsha1)
 	unsigned char sha1[20];
 	SHA_CTX c;
 
+	/* Sha1.. */
+	SHA1_Init(&c);
+	SHA1_Update(&c, buf, len);
+	SHA1_Final(sha1, &c);
+
 	/* Set it up */
 	memset(&stream, 0, sizeof(stream));
 	deflateInit(&stream, Z_BEST_COMPRESSION);
@@ -188,11 +195,6 @@ int write_sha1_file(char *buf, unsigned len, unsigned char *returnsha1)
 	deflateEnd(&stream);
 	size = stream.total_out;
 
-	/* Sha1.. */
-	SHA1_Init(&c);
-	SHA1_Update(&c, compressed, size);
-	SHA1_Final(sha1, &c);
-
```

## R6 — 01:34:54, twenty-four minutes later: blobs were missed
```
$ git -C repos/git show -s --format=%H%n%ai\ %an%n%s%n%b f18ca7316631914776136455c151d70318299459
f18ca7316631914776136455c151d70318299459
2005-04-20 01:34:54 -0700 Linus Torvalds
The recent hash/compression switch-over missed the blob creation.
Happily, convert-cache just magically fixes all errors.

```

```
$ update-cache.c: the blob header 'blob %lu' now hashed with the raw content
+	int metadata_size;
+	metadata_size = 1+sprintf(metadata, "blob %lu", size);
+	SHA1_Update(&c, metadata, metadata_size);
+	SHA1_Update(&c, in, size);
-	stream.avail_in = 1+sprintf(metadata, "blob %lu", size);
+	stream.avail_in = metadata_size;
-	SHA1_Update(&c, out, stream.total_out);
```

## R7 — the same night's commit does NOT touch README; the founding rule stays false
```
$ git -C repos/git show d98b46f8d9:README | sed -n '68,70p'  (README as of the flip commit)
data in the object.  It's worth noting that the SHA1 hash that is used
to name the object is always the hash of this _compressed_ object, not
the original data.
```

## R8 — 32 days later the definition is corrected by a patch that says 'formatting changes only'
```
$ git -C repos/git show -s --format=%H%n%ai\ %an%n%s%n%b 8ac866a869a61d382486ace6ea39f9741d9159f8
8ac866a869a61d382486ace6ea39f9741d9159f8
2005-05-22 18:44:16 +0100 David Greaves
[PATCH] Docs - asciidoc changes
Whitespace and asciidoc formatting changes only in preparation for
content changes.

```

```
$ the hunk: name = hash of the original data; old rule demoted to 'historical note'
-to name the object is always the hash of this _compressed_ object, not
-the original data.
+to name the object is the hash of the original data (historical note:
+in the dawn of the age of git this was the sha1 of the _compressed_
+object)
```

## R9 — convert-cache lives five months and dies in the Big tool rename
```
$ git -C repos/git log --diff-filter=D --format='%h %ai %an %s' -- convert-cache.c
215a7ad1ef 2005-09-07 17:26:23 -0700 Junio C Hamano Big tool rename.
```

## R10 — the rule, runnable anywhere: object name = sha1('blob <len>\\0' + raw bytes)
```
$ printf 'hello' | git hash-object --stdin ; printf 'blob 5\\0hello' | sha1sum
b6fc4c620b67d95f953a5c1c1230aaab5db5a1b0
b6fc4c620b67d95f953a5c1c1230aaab5db5a1b0  -
```

## R11 — this clone today: every object named by the 01:10 rule
```
$ git -C repos/git count-objects -vH
count: 0
size: 0 bytes
in-pack: 419158
packs: 1
```

## R12 — how committing worked that night: the README's own instructions (as of 2005-04-17)
```
$ git -C repos/git show 6ad6d3d36c:README | sed -n '363,374p'
		commit-tree <tree> -p <parent> [-p <parent2> ..]
	and then giving the reason for the commit on stdin (either
	through redirection from a pipe or file, or by just typing it at
	the tty). 
	commit-tree will return the name of the object that represents
	that commit, and you should save it away for later use.
	Normally, you'd commit a new "HEAD" state, and while git doesn't
	care where you save the note about that state, in practice we
	tend to just write the result to the file ".git/HEAD", so that
	we can always see what the last committed state was.
```

