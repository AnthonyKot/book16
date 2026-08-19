# The nine minutes

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [The nine minutes](01-debian-openssl.html).*

At 16:25 on a Tuesday afternoon in May 2006, Kurt Roeckx imports one file into Debian's OpenSSL
package. At 16:34, he adds six lines to it. The commit message says he is stopping some Valgrind
errors and closing a bug. Nine minutes, one file, six lines — the kind of afternoon that never
makes it into anyone's memory.

I go looking for it in the Debian *packaging* repository, not upstream, because that is where it
lived. `git clone https://salsa.debian.org/debian/openssl.git`, and then the mechanism sits
there in the history, in plain sight, for anyone who thinks to run `git show` on a sixteen-year-old
housekeeping commit.

## What Kurt knew

Here is what Kurt Roeckx knew that Tuesday, and here is what he did not.

He had a bug report: Debian #363516. Someone had run the OpenSSL test suite under Valgrind and
Purify — memory checkers that flag any read of uninitialized memory — and gotten a wall of errors,
all pointing at one file, `md_rand.c`, the heart of OpenSSL's random number generator. A package
maintainer's queue is full of these: someone else's warning, on someone else's code, sitting in
your inbox with a bug number attached, waiting for you to make the red text go away so you can
close the ticket and get to the next one.

The errors were not a mistake. They were a deliberate OpenSSL design choice: to capture every
scrap of unpredictability it could, the generator hashed a buffer *before* filling it,
uninitialized bytes and all. Think of it as sweeping whatever is already on the floor into the
pot — it looks appalling to a health inspector, but to a random number generator, chaos is the
nutrition. Uninitialized memory is unpredictable, and unpredictable is exactly what you want.

Upstream knew it looked wrong. Check out the 1998 SSLeay import and grep the file, and the tell
is already there, eight years before Kurt touches it:

```console
$ git grep -n -B1 -A1 'purify complains' d02b48c63a -- crypto/rand/md_rand.c
crypto/rand/md_rand.c-281-#ifndef PURIFY
crypto/rand/md_rand.c:282:		MD_Update(&m,buf,j); /* purify complains */
crypto/rand/md_rand.c-283-#endif
```

One read, and one read only, sits behind `#ifndef PURIFY` — a switch you flip when the checker
is running, so the deliberately dirty read disappears and Purify goes quiet. That comment,
`/* purify complains */`, is a *scope*. It says: this one read, of this one throwaway buffer, is
the line Purify hates, and here is the single place we make an exception. It does not say the
practice is wrong. It says one function is noisy under one tool. [R3]

But if you are reading the file for the first time, on a Tuesday, with a bug to close, the comment
looks less like a warning than like permission. And there are two calls in the file that look
exactly alike.

One more thing Kurt did, and it matters because every sneering retelling leaves it out: he asked.
The day before the commit, he described the offending `MD_Update` lines on OpenSSL's own
development list and asked whether removing them was acceptable; the reply he got back amounted to
*if it helps with debugging, I'm in favor of removing them*.
<!-- CHECK: the openssl-dev exchange (2006-05-01 thread "Random number generator, uninitialised data and valgrind"; Ulf Möller's reply) is mailing-list record, outside both git repos. -->
Whatever each side of that exchange thought it covered — a debug build, one line, both lines — none
of it is in this repository. What is in the repository is what happened next, and permission is the
frame to read it in: by the time he opens the editor, the comment has said *exception*, and the
authors have said *fine*.

## Two calls

At 16:25 Kurt imports upstream's `md_rand.c` into the package. [R4] Nine minutes later, at 16:34,
he generalizes the exception:

```console
$ git show --format=fuller --stat 8f27a7dc02
    Don't add uninitialised data to the random number generator.  This stop
    valgrind from giving error messages in unrelated code.  (Closes: #363516)
 debian/changelog | 3 +++
 rand/md_rand.c   | 6 ++++++
```

Six lines. What you are about to see is the same function call, `MD_Update`, silenced in two
different places by wrapping it in `/* */` comment marks — the C equivalent of striking a line
through it. Watch the reasoning happen: a maintainer seeing two calls that look like the same
problem, and treating them the same way:

```diff
@@ static void ssleay_rand_add(...)
+/*
+ * Don't add uninitialised data.
 		MD_Update(&m,buf,j);
+*/
...
@@ static int ssleay_rand_bytes(...)
 #ifndef PURIFY
+/*
+ * Don't add uninitialised data.
 		MD_Update(&m,buf,j); /* purify complains */
+*/
 #endif
```

Two functions, two identical comments, two `MD_Update` calls commented out. The second is the one
Purify actually complained about — the throwaway output buffer, already behind `#ifndef PURIFY`.
Fine. But the first is in `ssleay_rand_add`, and `ssleay_rand_add` is not a throwaway.

It is the function that mixes the caller's seed into the pool.

Every seed the process has — the process ID, the time, the contents of `/dev/urandom` — comes in
through `ssleay_rand_add`. The line that hashes it into the pool is `MD_Update(&m,buf,j)`. That is
the line now sitting inside `/* */`. [R5]

He has not disabled a Purify workaround.

~ He has disabled the seeding.

From here on, the only thing feeding the pool is a few bytes of process ID — and a PID on Linux
is a number under 32,768. The space of keys the generator can produce collapses from astronomical
to something you could write down. Nothing in the commit looks like an emergency. It closes a
bug and disappears into an already-open changelog stanza dated four weeks *earlier*, `Thu, 6 Apr
2006`, because that entry was still sitting open. [R6] It reads like hygiene.
<!-- CHECK: "at most ~15 bits / PID-only entropy" and the 32,768 figure — standard in the public analysis of CVE-2008-0166; keep the number, it is not from the repo -->

## The dead path

And here is the part that is pure `git`, the part no CVE writeup will tell you.

For four months, it does not matter. He put the file in the wrong place.

Look at where `md_rand.c` landed on 2 May: `rand/md_rand.c`. [R4] But OpenSSL 0.9.8 compiles
`crypto/rand/md_rand.c`. Debian's packaging of this era stored *overlays* — only the upstream
files the maintainer meant to change, laid over an unpacked tarball at build time, like a stencil
cut over the real tree. Cut your hole one directory to the side, and the original code shows
through untouched. A modified file at a path the build does not use is a no-op. You can prove it
at the release tag:

```console
$ git ls-tree --name-only debian/openssl-0.9.8b-1 rand/md_rand.c crypto/rand/md_rand.c
rand/md_rand.c
```

The sabotaged file exists only at the dead path. `crypto/rand/md_rand.c` is not there; the build
used the pristine upstream one. Version 0.9.8b-1 *claims* the valgrind fix in its changelog and
ships a perfectly good random number generator. [R7]

~ The bug is checked in and inert.

Valgrind, of course, is still noisy — because the fix is not really applied. So on Sunday
17 September, at 13:32, Kurt fixes that:

```console
$ git show --format=fuller --stat 33a9d075e9
    Move the modified rand/md_rand.c file to the right place really fixing #363516.
 {rand => crypto/rand}/md_rand.c | 0
```

Zero lines changed. The file merely moves onto the path the compiler reads. *That* is the commit
that arms it. Everything Debian and Ubuntu ship from here descends from this Sunday afternoon, not
from May. [R8]

And fifty-seven minutes later, the compiler gets its one vote. It votes on the wrong line.

```diff
$ git show --format=fuller a590e4f469
    Make md_rand.c build, nested comments don't work.
...
 #ifndef PURIFY
-/*
- * Don't add uninitialised data.
+#if 0 /* Don't add uninitialised data. */
 		MD_Update(&m,buf,j); /* purify complains */
-*/
+#endif
```

The `/* */` he had wrapped around the *second* call sat inside a line that already held a
`/* purify complains */` comment — a comment inside a comment, which C will not compile. So he
converts that one to `#if 0`. [R9] Notice what the build break caught. It choked on the harmless
half — the throwaway buffer — purely because that line happened to contain an inner comment. The
fatal half, the seed path in `ssleay_rand_add`, had no inner comment, compiled clean the first
time, and drew no protest at all.

The last automated check between Kurt and the disaster was looking at the wrong function.

## Twenty months of keys

The keys generated by that build were predictable for twenty months. Every SSH host key, every
SSL certificate, every OpenVPN key made on a Debian or Ubuntu machine between September 2006 and
May 2008 came out of a pool with about fifteen bits of unpredictability in it.

Sit with what that means for an attacker, because it is not what "broken crypto" usually means.
The key still looks like a key. It is still a long, official-looking number; the mathematics
around it is not cracked. But it was drawn from a catalog of at most 32,768 possibilities. So you
generate the whole catalog once — every key the broken generator could ever have produced, for
every architecture — and then you do not attack anything. You look it up. Someone's SSH server,
someone's VPN, someone's certificate: you match the key you see against your precomputed shelf and
read off the private half.

~ You did not break the key. You enumerated it.

The catch, after twenty months, was not a tool and not an attacker. In early May 2008 a Debian
developer named Luciano Bello found the generator predictable and traced it back to the 2006
change; the advisory, DSA-1571, went out on 13 May.
<!-- CHECK: Luciano Bello as discoverer and the 2008-05-13 DSA-1571 date — public record of CVE-2008-0166, outside the packaging repo (and per R11, the advisory ID appears in no commit message). -->
Inside the repository, the catch looks like this. The fix, when it comes on 7 May 2008, is one
sentence:

```console
$ git show --format=fuller --stat f7949d6e0a
    ssleay_rand_add() really needs to call MD_Update() for buf.
 crypto/rand/md_rand.c       | 3 ---
 debian/changelog            | 8 ++++++--
 debian/libssl0.9.8.postinst | 2 +-
```

Three lines gone from `md_rand.c` — the `/* */` around the seed call, deleted, so
`MD_Update(&m,buf,j)` runs again. That is the whole repair. The subject now names the function and
the call precisely: `ssleay_rand_add() really needs to call MD_Update() for buf`. It is a man
writing down, in a commit message, the exact line he had commented out two years earlier. [R10]

What the subject does *not* contain is any word a user would search for. Not "security." Not
"regenerate your keys." Not the name of the CVE. And that is not a guess — grep the whole
repository:

```console
$ git log --all --grep=CVE-2008-0166 --oneline
$ git log --all --grep=DSA-1571 --oneline
```

Both empty. [R11] The most catastrophic bug in Debian's history is invisible to the search anyone
would actually type. To find it in `git`, you cannot grep the message — you have to grep the
*mechanism*: `git log -S 'uninitialised' -- '**/md_rand.c'`, and read the diffs.

It even went out wearing someone else's clothes. Three hours before Kurt's fix, Christoph Martin
had prepared version 0.9.8g-9 as a routine translations update. [R15] Kurt reused that same
version: the changelog for the security release lists `[ Christoph Martin ]` and his debconf
translations first, then `[ Kurt Roeckx ]` and one line about `MD_Update`. [R10] Urgency flips
from `low` to `high`, and a restart prompt gets added on upgrade — the only two signs, anywhere
in the packaging, that this was the fire and not a Tuesday.

## The name that would not die

One more thing, because it changes how you read a tag. The parallel fix for the *stable* release,
`etch`, lives in this repo as tag `debian/openssl-0.9.8c-4etch3`, its changelog signed by the
security team and dated May 2008. But look at when the commit was actually made:

```console
$ git log -1 --format=fuller debian/openssl-0.9.8c-4etch3
AuthorDate: Sat May 16 14:56:28 2009 +0000
    Re-introducing seeding of the random number generator.
```

2009. A year after users got it. The archive shipped `4etch3` in May 2008; the *version control*
only backfilled it a year later, in one sitting, preserving the 2008 changelog text inside a 2009
commit — and until that Saturday, the `etch` branch in this repository still carried the
commented-out seed. [R12, R13] A tag named like a shipped version is not a receipt that the
version control ever held that code when it shipped. Compare a tag's author date to its changelog
trailer; when they disagree by a year, you are looking at a reconstruction, not a release.

And the last word belongs to the leftover. In July 2009, Debian finally split its in-tree edits
into named quilt patches — and the *other* half, the genuinely harmless throwaway-buffer wrapper,
was checked in with a name of its own: `debian/patches/valgrind.patch`. [R14] The original excuse,
still riding on the file, rebased release after release — 1.0.0, 1.0.1, 1.0.2 — until 2016, when
upstream deleted `md_rand.c` and it finally had nowhere left to live. The disaster got a CVE
number and a decade of postmortems. The half that was harmless got to keep the name.

So when you go hunting for the worst thing that ever happened to a codebase, do not grep the
commit messages. A `#ifndef SANITIZER` that disables a *read* is an invitation: the next person to
open the file will read the comment as a rule and widen it, exactly the way one scoped
`/* purify complains */` became two. Run `git log -S` on the name of a tool instead — `valgrind`,
`purify`, `asan`, `coverity` — find every place someone quieted a checker, and check whether the
next commit quieted it somewhere the checker was right. The people who did this were closing a
bug. They wrote down the ticket number, not the crime.

## Receipts

- **R3** `git grep 'purify complains' d02b48c63a` — the 1998 `#ifndef PURIFY` scope, one read only.
- **R4** `git show b03fc02755` — 2006-05-02 16:25, `md_rand.c` imported at path `rand/`.
- **R5** `git show 8f27a7dc02` — 2006-05-02 16:34, six lines comment out both `MD_Update` calls.
- **R6** `git show 8f27a7dc02 -- debian/changelog` — stanza trailer dated Thu 6 Apr 2006.
- **R7** `git ls-tree debian/openssl-0.9.8b-1` — patched file exists only at the dead path `rand/`.
- **R8** `git show 33a9d075e9` — 2006-09-17 13:32, rename `{rand => crypto/rand}/md_rand.c`, "really fixing".
- **R9** `git show a590e4f469` — 2006-09-17 14:29, "nested comments don't work"; only the harmless half broke the build.
- **R10** `git show f7949d6e0a` — 2008-05-07 18:35, three-line fix; urgency low→high; postinst threshold bump.
- **R11** `git log --all --grep=CVE-2008-0166` / `DSA-1571` — both empty.
- **R12** `git log -1 debian/openssl-0.9.8c-4etch3` — etch fix committed 2009-05-16, changelog dated 2008.
- **R13** `git merge-base --is-ancestor f7949d6e0a origin/debian/etch` — exit 1, not an ancestor.
- **R14** `debian/patches/valgrind.patch` — the surviving harmless half, named 2009, rebased to 2016.
- **R15** `git show ad1ff815c9` — 2008-05-07 15:39, the translations upload whose 0.9.8g-9 stanza the fix reused.

*Full command transcripts: `chapters/01-debian-openssl.receipts.md` (regenerate with `scripts/receipts-01.sh`).*
