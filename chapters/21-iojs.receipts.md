# Receipts — ch. 21 Node.js / io.js (fork, rename, convergence)

Verbatim outputs against the full nodejs/node clone in `repos/node`.
Regenerate with `scripts/receipts-21.sh`. Outputs are pinned to explicit objects or refs; long outputs are truncated editorially with `sed` or `head`.

## R1 — a stale remote ref alone retains sixteen commits from the private rehearsal
```
$ git -C repos/node branch -r --list '*archived-io.js*'; git -C repos/node for-each-ref refs/remotes/origin/archived-io.js-v0.10 --format='%(objectname) %(refname)'; git -C repos/node branch -r --contains e7dec60a63b9171465fd4037a04aeb709198aea2; printf 'unique_to_archived '; git -C repos/node rev-list --count origin/archived-io.js-v0.10 --not origin/main
  origin/archived-io.js-v0.10
  origin/archived-io.js-v0.12
e7dec60a63b9171465fd4037a04aeb709198aea2 refs/remotes/origin/archived-io.js-v0.10
  origin/archived-io.js-v0.10
unique_to_archived 16
```

```
$ git -C repos/node log --reverse --no-mailmap --format='%H %aI %an <%ae> | %s' origin/archived-io.js-v0.10 --not origin/main -- CONTRIBUTING.md doc/tc-meetings
f60abb0ced54f5ba08d324e62ad3fbb306ba37f7 2014-10-01T13:40:32-07:00 Mikeal Rogers <mikeal.rogers@gmail.com> | First draft of a new contribution policy.
051dc546d6c155de047cbbc07c44e8f905a7a332 2014-10-09T22:17:42-04:00 cjihrig <cjihrig@gmail.com> | node: update links in CONTRIBUTING.md
8c60aaad1442149b639c18b0eec716a7e6cbab7d 2014-10-10T19:29:06-04:00 Jeremiah Senkpiel <fishrock123@rocketmail.com> | node: add aliases to names in CONTRIBUTING.md
7ee5c4efbf07717c37413a26b8bd12605427dc5f 2014-10-09T12:12:20-07:00 Mikeal Rogers <mikeal.rogers@gmail.com> | node: outline invited persons and representatives
cafac11a5033ebe19c4fd44a4f3b108628cfa2d2 2014-10-10T19:34:36-04:00 Jeremiah Senkpiel <fishrock123@rocketmail.com> | node: refine TC percentage rules - CONTRIBUTING.md
3cb5f3db0faccc0caa5c6633aeb91654f2e49f6a 2014-10-09T16:16:49-07:00 Mikeal Rogers <mikeal.rogers@gmail.com> | doc: meeting notes from oct 9th TC meeting
2c7847b3228b40aab8ea4902109639725eb0d8c3 2014-10-29T15:17:56-07:00 Mikeal Rogers <mikeal.rogers@gmail.com> | doc: add TC notes from october 29th
e7dec60a63b9171465fd4037a04aeb709198aea2 2014-10-29T17:30:17-07:00 Mikeal Rogers <mikeal.rogers@gmail.com> | Said public when I meant private.
```

## R2 — 2014-10-01: the stranded branch drafts governance for node-forward/node
```
$ git -C repos/node show -s --no-mailmap --format='%H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' f60abb0ced54f5ba08d324e62ad3fbb306ba37f7
f60abb0ced54f5ba08d324e62ad3fbb306ba37f7
parents 25702abc5638bbecffa92e8349d2a871a5f592c9
Author: 2014-10-01T13:40:32-07:00 Mikeal Rogers <mikeal.rogers@gmail.com>
Committer: 2014-10-08T14:30:12-07:00 isaacs <i@izs.me>

First draft of a new contribution policy.

PR-URL: https://github.com/node-forward/node/pull/1
Signed-off-by: isaacs <i@izs.me>

```

```
$ git -C repos/node show --format='' --no-ext-diff f60abb0ced54f5ba08d324e62ad3fbb306ba37f7 -- CONTRIBUTING.md | sed -n '1,90p'
diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 4c3a86b00f3..62af881fae8 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -6,13 +6,13 @@ through the process.
 
 ### FORK
 
-Fork the project [on GitHub](https://github.com/joyent/node) and check out
+Fork the project [on GitHub](https://github.com/node-forward/node) and check out
 your copy.
 
 ```sh
 $ git clone git@github.com:username/node.git
 $ cd node
-$ git remote add upstream git://github.com/joyent/node.git
+$ git remote add upstream git://github.com/node-forward/node.git
 ```
 
 Now decide if you want your feature or bug fix to go into the master branch
@@ -148,7 +148,134 @@ not send out notifications when you add commits.
 
 
 [stability index page]: https://github.com/joyent/node/blob/master/doc/api/documentation.markdown
-[issue tracker]: https://github.com/joyent/node/issues
+[issue tracker]: https://github.com/node-forward/node/issues
 [node.js mailing list]: http://groups.google.com/group/nodejs
 [IRC]: http://webchat.freenode.net/?channels=node.js
-[project maintainers]: https://github.com/joyent/node/wiki/Project-Organization
+
+### COMMITTER GUIDE
+
+Committers who are merging their work and the work of others have a few other
+rules to follow.
+
+  - Always include the `Reviewed-by: You Name <your-email>` in the commit
+  message.
+  - In commit messages also include `Fixes:` that either includes the
+  **full url** (e.g. `https://github.com/joyent/node/issues/...`), and/or
+  the hash and commit message if the commit fixes a bug in a previous commit.
+  - PR's should include their full `PR-URL:` so it's easy to trace a commit
+  back to the conversation that lead up to that change.
+  - Double check PR's to make sure the persons **full name** and email
+  address are correct before merging.
+  - Except when updating dependencies, all commits should be self contained.
+  Meaning, every commit should pass all tests. Makes it much easier when
+  bisecting to find a breaking change.
+
+# Governance
+
+This repository (node-forward/node) is jointly governed by a technical
+committee, commonly referred to as the "TC."
+
+Initial membership invitations to the TC were given to individuals who had
+been active contributors to Node. Current membership is:
+
+```
+Fedor Indutny
+Trevor Norris
+Ben Noordhuis
+Isaac Z. Schlueter
+Nathan Rajlich
+Bert Belder
+```
+
+Invitations were also given to `TJ Fontaine` and `Alexis Campailla` who have
+not accepted but are still invited to participate without accepting a role or
+officially endorsing this effort.
+
+The TC has final authority over this project including:
+
+* Project governance and process
+* Contribution policy
+* GitHub repository hosting
+
+The TC can change its governance model if they deem it necessary. The current
+governance rules are:
+
+* [Consensus Seeking](http://en.wikipedia.org/wiki/Consensus-seeking_decision-making)
+* Motions with voting when consensus cannot be reached.
+* Quorum of 60%, simple majority wins.
+* No more than 30% of the TC membership can be affiliated with the same
+employer.
+
+## TC Meetings
+
+The TC meets weekly on a Google hangout. The meeting is run by a designated
+moderator, currently @mikeal. Each meeting should be published to Youtube.
+
+## Contributor Policy
```

## R3 — 2014-10-29: private minutes put a date and the words soft fork on the plan
```
$ git -C repos/node show -s --no-mailmap --format='%H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' e7dec60a63b9171465fd4037a04aeb709198aea2
e7dec60a63b9171465fd4037a04aeb709198aea2
parents 2c7847b3228b40aab8ea4902109639725eb0d8c3
Author: 2014-10-29T17:30:17-07:00 Mikeal Rogers <mikeal.rogers@gmail.com>
Committer: 2014-10-29T17:30:17-07:00 Mikeal Rogers <mikeal.rogers@gmail.com>

Said public when I meant private.
```

```
$ git -C repos/node show --format='' --no-ext-diff e7dec60a63b9171465fd4037a04aeb709198aea2 -- doc/tc-meetings/2014-10-29.md
diff --git a/doc/tc-meetings/2014-10-29.md b/doc/tc-meetings/2014-10-29.md
index 0fa77502743..ce64c62ddb0 100644
--- a/doc/tc-meetings/2014-10-29.md
+++ b/doc/tc-meetings/2014-10-29.md
@@ -13,7 +13,7 @@
 * Update on "release buckets"
  * doesn't make sense while we're private, we'll wait until it is public again
 * `node-forward/node` going public
- * when we made the repo public it was messaged as only being for "four weeks"
+ * when we made the repo private it was messaged as only being for "four weeks"
  * "four weeks" is up on November 8th
  * someone on the Advisory Board needs to remind Joyent of this in the
    next advisory board meeting so they aren't suprised by it even though
```

```
$ git -C repos/node show e7dec60a63b9171465fd4037a04aeb709198aea2:doc/tc-meetings/2014-10-29.md | sed -n '13,24p'
* Update on "release buckets"
 * doesn't make sense while we're private, we'll wait until it is public again
* `node-forward/node` going public
 * when we made the repo private it was messaged as only being for "four weeks"
 * "four weeks" is up on November 8th
 * someone on the Advisory Board needs to remind Joyent of this in the
   next advisory board meeting so they aren't suprised by it even though
   it was communicated to them when it was first made public.
 * @mikeal will work on the messaging in the README to make it clear this is
   a "soft" fork and not a "hard" fork.
 * ramifications of going public will be discussed in next week's TC meeting as
   well
```

## R4 — 2014-12-01: the public README says exactly what this repository became
```
$ git -C repos/node show --no-mailmap --no-ext-diff --format='commit %H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' 51514c8e8cbd98be7f29c3f1508b625d16e91b5d -- README.md
commit 51514c8e8cbd98be7f29c3f1508b625d16e91b5d
parents a647c39acfac136acdd841b5a2faaae46b67425d
Author: 2014-12-01T18:06:21-08:00 Mikeal Rogers <mikeal.rogers@gmail.com>
Committer: 2014-12-02T20:21:46+03:00 Fedor Indutny <fedor@indutny.com>

docs: simple project messaging.

Reviewed-By: Fedor Indutny <fedor@indutny.com>
PR-URL: https://github.com/iojs/io.js/pull/24


diff --git a/README.md b/README.md
index b157ddd3f2a..b7860dcc06c 100644
--- a/README.md
+++ b/README.md
@@ -1,6 +1,14 @@
-Evented I/O for V8 javascript.
+io.js
 ===
 
+This repository began as a GitHub fork of
+[joyent/node](https://github.com/joyent/node) where contributions,
+releases, and contributorship are under an
+[open governance model](./CONTRIBUTING.md#governance).
+
+We intend to release, with increasing regularity, releases which are
+compatible with npm ecosystem that has been built to date for node.js.
+
 ### To build:
 
 Prerequisites (Unix only):
```

## R5 — 2015-01-08: the build target and installed executable change from node to iojs
```
$ git -C repos/node show -s --no-mailmap --format='%H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' f17f473af5e28f4ec00a518f97a84b69c426309e
f17f473af5e28f4ec00a518f97a84b69c426309e
parents 3e7a25dd95194269fd112aa5677fc5e6d4156135
Author: 2015-01-08T14:00:43+01:00 Ben Noordhuis <info@bnoordhuis.nl>
Committer: 2015-01-08T23:21:20+01:00 Ben Noordhuis <info@bnoordhuis.nl>

build: rename binary from node to iojs

* rename the build targets

* update the test runner to use `out/{Debug,Release}/iojs`

* update the installer to install the iojs binary

* update one test that explicitly checks for the binary name

PR-URL: https://github.com/iojs/io.js/pull/262
Reviewed-By: Bert Belder <bertbelder@gmail.com>

```

```
$ git -C repos/node diff --no-ext-diff f17f473af5e28f4ec00a518f97a84b69c426309e^ f17f473af5e28f4ec00a518f97a84b69c426309e -- node.gyp tools/install.py | sed -n '1,60p'
diff --git a/node.gyp b/node.gyp
index 30a1bdf7ebc..43622958ec8 100644
--- a/node.gyp
+++ b/node.gyp
@@ -73,7 +73,7 @@
 
   'targets': [
     {
-      'target_name': 'node',
+      'target_name': 'iojs',
       'type': 'executable',
 
       'dependencies': [
diff --git a/tools/install.py b/tools/install.py
index 77e6d0cbd10..affce2265ce 100755
--- a/tools/install.py
+++ b/tools/install.py
@@ -108,12 +108,12 @@ def npm_files(action):
     if os.environ.get('PORTABLE'):
       # This crazy hack is necessary to make the shebang execute the copy
       # of node relative to the same directory as the npm script. The precompiled
-      # binary tarballs use a prefix of "/" which gets translated to "/bin/node"
+      # binary tarballs use a prefix of "/" which gets translated to "/bin/iojs"
       # in the regular shebang modifying logic, which is incorrect since the
       # precompiled bundle should be able to be extracted anywhere and "just work"
-      shebang = '/bin/sh\n// 2>/dev/null; exec "`dirname "$0"`/node" "$0" "$@"'
+      shebang = '/bin/sh\n// 2>/dev/null; exec "`dirname "$0"`/iojs" "$0" "$@"'
     else:
-      shebang = os.path.join(node_prefix or '/', 'bin/node')
+      shebang = os.path.join(node_prefix or '/', 'bin/iojs')
     update_shebang(link_path, shebang)
   else:
     assert(0) # unhandled action type
@@ -128,7 +128,7 @@ def subdir_files(path, dest, action):
 
 def files(action):
   exeext = '.exe' if sys.platform == 'win32' else ''
-  action(['out/Release/node' + exeext], 'bin/node' + exeext)
+  action(['out/Release/iojs' + exeext], 'bin/iojs' + exeext)
 
   if 'true' == variables.get('node_use_dtrace'):
     action(['out/Release/node.d'], 'lib/dtrace/node.d')
```

## R6 — 2015-08-13: convergence renames the target and installed executable back to node
```
$ git -C repos/node show --no-mailmap --shortstat --format='%H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' a69ab27ab458385d24676792b75ad1c25b8c30e5
a69ab27ab458385d24676792b75ad1c25b8c30e5
parents ae8d436623109f315229ca9cc05715af362257b0
Author: 2015-08-13T12:14:34-04:00 cjihrig <cjihrig@gmail.com>
Committer: 2015-08-23T17:59:43-04:00 cjihrig <cjihrig@gmail.com>

node: rename from io.js to node

This commit replaces instances of io.js with Node.js, based on the
recent convergence. There are some remaining instances of io.js,
related to build and the installer.

Fixes: https://github.com/nodejs/node/issues/2361
PR-URL: https://github.com/nodejs/node/pull/2367
Reviewed-By: James M Snell <jasnell@gmail.com>
Reviewed-By: João Reis <reis@janeasystems.com>


 96 files changed, 2162 insertions(+), 2187 deletions(-)
```

```
$ git -C repos/node diff --no-ext-diff a69ab27ab458385d24676792b75ad1c25b8c30e5^ a69ab27ab458385d24676792b75ad1c25b8c30e5 -- node.gyp tools/install.py | sed -n '1,76p'
diff --git a/node.gyp b/node.gyp
index 7b2d0a54f7c..d86cd1ce9ab 100644
--- a/node.gyp
+++ b/node.gyp
@@ -78,7 +78,7 @@
 
   'targets': [
     {
-      'target_name': 'iojs',
+      'target_name': 'node',
       'type': '<(node_target_type)',
 
       'dependencies': [
@@ -531,10 +531,10 @@
             {
               'action_name': 'node_dtrace_provider_o',
               'inputs': [
-                '<(OBJ_DIR)/iojs/src/node_dtrace.o',
+                '<(OBJ_DIR)/node/src/node_dtrace.o',
               ],
               'outputs': [
-                '<(OBJ_DIR)/iojs/src/node_dtrace_provider.o'
+                '<(OBJ_DIR)/node/src/node_dtrace_provider.o'
               ],
               'action': [ 'dtrace', '-G', '-xnolibs', '-s', 'src/node_provider.d',
                 '<@(_inputs)', '-o', '<@(_outputs)' ]
@@ -584,7 +584,7 @@
                 '<(SHARED_INTERMEDIATE_DIR)/v8constants.h'
               ],
               'outputs': [
-                '<(OBJ_DIR)/iojs/src/node_dtrace_ustack.o'
+                '<(OBJ_DIR)/node/src/node_dtrace_ustack.o'
               ],
               'conditions': [
                 [ 'target_arch=="ia32"', {
diff --git a/tools/install.py b/tools/install.py
index 3254eba17e5..dda11a14931 100755
--- a/tools/install.py
+++ b/tools/install.py
@@ -108,12 +108,12 @@ def npm_files(action):
     if os.environ.get('PORTABLE'):
       # This crazy hack is necessary to make the shebang execute the copy
       # of node relative to the same directory as the npm script. The precompiled
-      # binary tarballs use a prefix of "/" which gets translated to "/bin/iojs"
+      # binary tarballs use a prefix of "/" which gets translated to "/bin/node"
       # in the regular shebang modifying logic, which is incorrect since the
       # precompiled bundle should be able to be extracted anywhere and "just work"
-      shebang = '/bin/sh\n// 2>/dev/null; exec "`dirname "$0"`/iojs" "$0" "$@"'
+      shebang = '/bin/sh\n// 2>/dev/null; exec "`dirname "$0"`/node" "$0" "$@"'
     else:
-      shebang = os.path.join(node_prefix or '/', 'bin/iojs')
+      shebang = os.path.join(node_prefix or '/', 'bin/node')
     update_shebang(link_path, shebang)
   else:
     assert(0) # unhandled action type
@@ -130,7 +130,7 @@ def files(action):
   is_windows = sys.platform == 'win32'
 
   exeext = '.exe' if is_windows else ''
-  action(['out/Release/iojs' + exeext], 'bin/iojs' + exeext)
+  action(['out/Release/node' + exeext], 'bin/node' + exeext)
 
   if not is_windows:
     # Install iojs -> node compatibility symlink.
@@ -152,9 +152,9 @@ def files(action):
   action(['deps/v8/tools/gdbinit'], 'share/doc/node/')
 
   if 'freebsd' in sys.platform or 'openbsd' in sys.platform:
-    action(['doc/iojs.1'], 'man/man1/')
+    action(['doc/node.1'], 'man/man1/')
   else:
-    action(['doc/iojs.1'], 'share/man/man1/')
+    action(['doc/node.1'], 'share/man/man1/')
 
   if 'true' == variables.get('node_install_npm'): npm_files(action)
 
```

## R7 — the v4 line imports the v3.3.0 release record as a separate commit
```
$ git -C repos/node show -s --no-mailmap --format='%H%nparents %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' 8a9a3bf798a3d6dda5a852a01820422c53eea765 | sed -n '1,28p'
8a9a3bf798a3d6dda5a852a01820422c53eea765
parents f6b093343da915832c20bfbc040c7d6bef26f08c
Author: 2015-09-02T15:39:16+10:00 Rod Vagg <rod@vagg.org>
Committer: 2015-09-03T17:46:24-04:00 Jeremiah Senkpiel <fishrock123@rocketmail.com>

doc: update changelog for io.js v3.3.0

Notable changes:

* build: Add a --link-module option to configure that can be used to
  bundle additional JavaScript modules into a built binary
  (Bradley Meck) #2497
* docs: Merge outstanding doc updates from joyent/node
  (James M Snell) #2378
* http_parser: Significant performance improvement by having
  http.Server consume all initial data from its net.Socket and parsing
  directly without having to enter JavaScript. Any 'data' listeners on
  the net.Socket will result in the data being "unconsumed" into
  JavaScript, thereby undoing any performance gains.
  (Fedor Indutny) #2355
* libuv: Upgrade to 1.7.3 (from 1.6.1), see
  https://github.com/libuv/libuv/blob/v1.x/ChangeLog for details
  (Saúl Ibarra Corretgé) #2310
* V8: Upgrade to 4.4.63.30 (from 4.4.63.26) (Michaël Zasso) #2482

cherry-picked from v3.x @ 1a6e52db30

PR-URL: https://github.com/nodejs/node/pull/2653
```

```
$ git -C repos/node merge-base --is-ancestor 8a9a3bf798a3d6dda5a852a01820422c53eea765 'v4.0.0^{}' && echo 'v3.3.0_changelog_import_ancestor_of_v4.0.0=yes'
v3.3.0_changelog_import_ancestor_of_v4.0.0=yes
```

## R8 — annotated tags identify the two releases and their distinct commit parents
```
$ for tag in v3.3.0 v4.0.0; do git -C repos/node for-each-ref --format='%(refname:short) tag-object=%(objectname) target=%(*objectname) | %(taggerdate:iso8601-strict) %(taggername) <%(taggeremail:trim)> | %(subject)' "refs/tags/$tag"; git -C repos/node show -s --no-mailmap --format='commit %H%nparent %P%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%s' "$tag^{}"; done
v3.3.0 tag-object=6077335ececf9037a27f5fec27de3bb1ac1949fe target=1a6e52db307f0da605a6f15426727834cfc522d8 | 2015-09-02T22:29:58+10:00 Rod Vagg <rod@vagg.org> | 2015-09-02 io.js v3.3.0 Release
commit 1a6e52db307f0da605a6f15426727834cfc522d8
parent d2f314c190ddc21492dcea36d9394863ff4e7eb3
Author: 2015-09-02T15:39:16+10:00 Rod Vagg <rod@vagg.org>
Committer: 2015-09-02T20:12:36+10:00 Rod Vagg <rod@vagg.org>
2015-09-02 io.js v3.3.0 Release
v4.0.0 tag-object=67b4fb359b36a850e38a1469efef705b37be4bad target=f9f837885343a2a3f5ba2b8c510eaac395c8c865 | 2015-09-09T05:03:37+10:00 Rod Vagg <rod@vagg.org> | 2015-09-08 Node.js v4.0.0 Release
commit f9f837885343a2a3f5ba2b8c510eaac395c8c865
parent 0cb0f4a6e499a2a8e8186a8915f0e0af5a03c121
Author: 2015-09-07T13:54:43+10:00 Rod Vagg <rod@vagg.org>
Committer: 2015-09-08T23:29:00+10:00 Rod Vagg <rod@vagg.org>
2015-09-08, Version 4.0.0 (Stable) Release
```

## R9 — v3.3.0 is the written baseline, not a Git parent or ancestor of v4.0.0
```
$ printf 'v3.3.0_tagged_commit '; git -C repos/node rev-parse 'v3.3.0^{}'; printf 'v4.0.0_tagged_commit '; git -C repos/node rev-parse 'v4.0.0^{}'; printf 'v4.0.0_direct_parent '; git -C repos/node rev-parse 'v4.0.0^'; printf 'merge_base '; git -C repos/node merge-base 'v3.3.0^{}' 'v4.0.0^{}'; printf 'v3_only v4_only '; git -C repos/node rev-list --left-right --count 'v3.3.0^{}...v4.0.0^{}'; if git -C repos/node merge-base --is-ancestor 'v3.3.0^{}' 'v4.0.0^{}'; then echo 'v3.3.0_ancestor_of_v4.0.0=yes'; else echo 'v3.3.0_ancestor_of_v4.0.0=no'; fi
v3.3.0_tagged_commit 1a6e52db307f0da605a6f15426727834cfc522d8
v4.0.0_tagged_commit f9f837885343a2a3f5ba2b8c510eaac395c8c865
v4.0.0_direct_parent 0cb0f4a6e499a2a8e8186a8915f0e0af5a03c121
merge_base a020d9a5c9b79a1630a6a1aae3c480fa578e99e2
v3_only v4_only 151	209
v3.3.0_ancestor_of_v4.0.0=no
```

## R10 — the files at the tags change title from io.js to Node.js and name v3.3.0 as v4's baseline
```
$ git -C repos/node show 'v3.3.0^{}:CHANGELOG.md' | sed -n '1,8p'
# io.js ChangeLog

## 2015-09-02, Version 3.3.0, @rvagg

### Notable changes

* **build**: Add a `--link-module` option to `configure` that can be used to bundle additional JavaScript modules into a built binary (Bradley Meck) [#2497](https://github.com/nodejs/node/pull/2497)
* **docs**: Merge outstanding doc updates from joyent/node (James M Snell) [#2378](https://github.com/nodejs/node/pull/2378)
```

```
$ git -C repos/node show 'v4.0.0^{}:CHANGELOG.md' | sed -n '1,14p'
# Node.js ChangeLog

## 2015-09-08, Version 4.0.0 (Stable), @rvagg

### Notable changes

This list of changes is relative to the last io.js v3.x branch release, v3.3.0. Please see the list of notable changes in the v3.x, v2.x and v1.x releases for a more complete list of changes from 0.12.x. Note, that some changes in the v3.x series as well as major breaking changes in this release constitute changes required for full convergence of the Node.js and io.js projects.

* **child_process**: `ChildProcess.prototype.send()` and `process.send()` operate asynchronously across all platforms so an optional callback parameter has been introduced that will be invoked once the message has been sent, i.e. `.send(message[, sendHandle][, callback])` (Ben Noordhuis) [#2620](https://github.com/nodejs/node/pull/2620).
* **node**: Rename "io.js" code to "Node.js" (cjihrig) [#2367](https://github.com/nodejs/node/pull/2367).
* **node-gyp**: This release bundles an updated version of node-gyp that works with all versions of Node.js and io.js including nightly and release candidate builds. From io.js v3 and Node.js v4 onward, it will only download a headers tarball when building addons rather than the entire source. (Rod Vagg) [#2700](https://github.com/nodejs/node/pull/2700)
* **npm**: Upgrade to version 2.14.2 from 2.13.3, includes a security update, see https://github.com/npm/npm/releases/tag/v2.14.2 for more details, (Kat Marchán) [#2696](https://github.com/nodejs/node/pull/2696).
* **timers**: Improved timer performance from porting the 0.12 implementation, plus minor fixes (Jeremiah Senkpiel) [#2540](https://github.com/nodejs/node/pull/2540), (Julien Gilli) [nodejs/node-v0.x-archive#8751](https://github.com/nodejs/node-v0.x-archive/pull/8751) [nodejs/node-v0.x-archive#8905](https://github.com/nodejs/node-v0.x-archive/pull/8905)
* **util**: The `util.is*()` functions have been deprecated, beginning with deprecation warnings in the documentation for this release, users are encouraged to seek more robust alternatives in the npm registry, (Sakthipriyan Vairamani) [#2447](https://github.com/nodejs/node/pull/2447).
```

