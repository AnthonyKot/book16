# Scout: nodejs/node

- **repo:** https://github.com/nodejs/node
- **clone:** `~/book16/repos/node` (already present; not re-cloned)
- **clone size:** 2.4G on disk; `git count-objects -vH` → 1 pack, 1.49 GiB, 1,154,922 objects
- **history span:** 2009-02-16 01:02:00 +0100 → 2026-08-18 22:36:15 -0700
- **commits:** 47922 (`git rev-list --count HEAD`)
- **tip:** `c79868f1020c0020ca0db328b90e267ba003c91c` Trivikram Kamat, "stream: reject pull on signal abort during flush"
- **single root:** `9d7895c567e8f38abfff35da1b6d6d6a0a06f9aa` (one day-one, unlike linux)

```
git -C ~/book16/repos/node log --reverse --format='%H %ai %an %s' | head -5
9d7895c567e8f38abfff35da1b6d6d6a0a06f9aa 2009-02-16 01:02:00 +0100 Ryan add dependencies
61890720c8a22a7f1577327b32a180a2d267d765 2009-02-16 01:34:45 +0100 Ryan add readme and initial code
6ded7fec5fb50c3d94e5b2abee49c93d93968fb8 2009-02-20 16:18:44 +0100 Ryan ...
4a5bab8ef62659f605f229fa6e21db776deb9ae5 2009-02-20 16:34:18 +0100 Ryan  intermediate commit. nothing works.
7b7ceea4eca78cdbf63a01f3f7c8edcf36241026 2009-02-20 17:06:07 +0100 Ryan first compile

git -C ~/book16/repos/node log -1 --format='%H %ai %an %s'
c79868f1020c0020ca0db328b90e267ba003c91c 2026-08-18 22:36:15 -0700 Trivikram Kamat stream: reject pull on signal abort during flush
```

`--no-mailmap` the first author is `Ryan <ry@tinyclouds.org>`; mailmap promotes him to Ryan Dahl. The DAG that becomes Node 26 starts as two git submodules and a four-line README, then a weekend of "nothing works." Sixteen years later `lib/sys.js` is still a shim, Promises have been added and deleted and added again, and this repository is the io.js fork that renamed the binary away from `node` and then back.

The 2013 gendered-pronoun revert war is **not here**. It happened in libuv. `git log --all --after=2012-01-01 --before=2014-06-01 --grep=pronoun` on this repo is empty; later pronoun commits (2020–2023) are README/docs hygiene, not a revert war. Traces in `deps/uv` also do not carry that fight.

---

## 1. Day one is two submodules at 01:02, and then nothing works

- **find-type:** 3 (first commit)
- **hash:** `9d7895c567e8f38abfff35da1b6d6d6a0a06f9aa` (code: `61890720c8a22a7f1577327b32a180a2d267d765`; compile: `7b7ceea4eca78cdbf63a01f3f7c8edcf36241026`)
- **date:** Mon 16 Feb 2009 01:02:00 +0100 (author = committer)
- **author:** Ryan `<ry@tinyclouds.org>` (mailmap: Ryan Dahl)
- **message:** `add dependencies`

```
git -C ~/book16/repos/node log -1 --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aD%n%n%B' --no-mailmap 9d7895c567e8f38abfff35da1b6d6d6a0a06f9aa
git -C ~/book16/repos/node diff-tree --root --stat 9d7895c567e8f38abfff35da1b6d6d6a0a06f9aa
git -C ~/book16/repos/node show --stat --format='%s' 61890720c8a22a7f1577327b32a180a2d267d765 | tail -8
git -C ~/book16/repos/node show 61890720c8a22a7f1577327b32a180a2d267d765:README
```

```
commit 9d7895c567e8f38abfff35da1b6d6d6a0a06f9aa
Author: Ryan <ry@tinyclouds.org>
AuthorDate: Mon, 16 Feb 2009 01:02:00 +0100

    add dependencies
 .gitmodules | 6 ++++++
 deps/ebb    | 1 +
 deps/oi     | 1 +
 3 files changed, 8 insertions(+)

    add readme and initial code
 Makefile                     |  32 +++
 README                       |   4 +
 js_http_request_processor.cc | 606 +++++++++++++++++++++++++++++++++++++++++++
 js_http_request_processor.h  | 104 ++++++++
 server.cc                    | 247 ++++++++++++++++++
 5 files changed, 993 insertions(+)

git submodule init
git submodule update
make
```

Four days later the log is `...`, then ` intermediate commit. nothing works.`, then `first compile`. The first tree is not Node. It is Ryan's HTTP parser (`ry/libebb`) and an I/O helper (`ry/liboi`) pointed at as submodules, committed at one in the morning, Central European time. Thirty-two minutes later the actual program appears: a C++ HTTP request processor and a 4-line README that is only build instructions. No "evented I/O for V8." No vision statement. The weekend after, he is still telling the log that nothing works.

**Why it is a story.** The moment before the outcome: he is not founding a platform. He is wiring V8 to an HTTP parser he already wrote, at 1am, and the first commit is the *dependencies* because that is what he needed to clone to compile. `git log --reverse | head` of the runtime that now underwrites npm is a gitlink and a Makefile. The product name is not in the tree yet.

**Reader learns:** day one of a famous repo is often the author's previous library, vendored, plus a weekend of broken intermediates. Read commit 2 and the "nothing works" line, not the hash everyone quotes.

**surprise:** 4

---

## 2. `// Uncomment in 2011` — a deprecation with a calendar

- **find-type:** 5 (comment that outlived its code) — also the start of find 3
- **hash:** `6ce007e89a54084edd42e44a85a0c46702ad6639` (uncommented by `8d70cc607cafc4c8caecd1d59727d2b2ab3fe550`)
- **date:** 2010-11-02 21:20:28 -0700
- **author:** Ryan Dahl `<ry@tinyclouds.org>`
- **message:** `Remove warning in 'sys' - too aggressive`

```
git -C ~/book16/repos/node show 6ce007e89a54084edd42e44a85a0c46702ad6639 -- lib/sys.js
git -C ~/book16/repos/node show 8d70cc607cafc4c8caecd1d59727d2b2ab3fe550 -- lib/sys.js
```

```
    Remove warning in 'sys' - too aggressive
-  util.error(sysWarning);
+  // Uncomment in 2011
+  //util.error(sysWarning);

    Show warning when using lib/sys.js
-  // Uncomment in 2011
-  //util.error(sysWarning);
+  util.error(sysWarning);
```

Micheil Smith had just done the "soft migration" of `sys` → `util` (`e38eb0c5a4d4`, 2010-10-12). Three weeks later Ryan decides the warning is "too aggressive" and leaves a dated instruction in the source: turn it back on next year. Maciej Małecki does exactly that on 2011-08-31. The comment is a calendar, not a maybe.

**Why it is a story.** The moment before: `require('sys')` is how every 2010 tutorial prints things. He wants the rename but not the mail. Rather than delete the warning he *schedules* it. A one-line comment is the project's compatibility policy for a year. When Maciej uncommented it, he was executing a note Ryan had written for a future self who might not be in the tree.

**Reader learns:** dated comments are policy. `git log -S 'Uncomment in'` finds the decisions that were too hot to ship and too important to forget.

**surprise:** 4

---

## 3. `require('sys') now throws` — then the next lead un-throws it, forever

- **find-type:** 6 (revert war / a rule enforced by reverts)
- **hashes:** `b28e700ebdf6583364fec3171390a24153f79632` (throws) → `f2a9ed487369ab7222522e1097708550adbe165c` (un-break) → `dc42e1faaf358e1ee8729439e0a3ade26f3cbce1` (deprecate, don't remove)
- **date:** 2012-01-09 / 2012-06-28 / 2015-01-12
- **authors:** Ryan Dahl; Isaac Z. Schlueter; Wyatt Preul
- **messages:** `require('sys') now throws` / `Fix #3577 Un-break require('sys')` / `sys: Mark as deprecated`

```
git -C ~/book16/repos/node log -1 --format='%H%n%ai %an %s%n%b' b28e700ebdf6583364fec3171390a24153f79632
git -C ~/book16/repos/node show b28e700ebdf6583364fec3171390a24153f79632 -- lib/sys.js | tail -8
git -C ~/book16/repos/node show f2a9ed487369ab7222522e1097708550adbe165c -- lib/sys.js | tail -12
git -C ~/book16/repos/node log -1 --format='%s%n%b' dc42e1faaf358e1ee8729439e0a3ade26f3cbce1
git -C ~/book16/repos/node show HEAD:lib/sys.js | tail -8
```

```
    require('sys') now throws
    To be removed in v0.9
+throw new Error('The "sys" module is now called "util".');

    Fix #3577 Un-break require('sys')
+// the sys module was renamed to 'util'.
+// this shim remains to keep old programs working.
+module.exports = require('util');

    sys: Mark as deprecated
    discussed at TC meeting, deprecate, don't remove
    PR-URL: https://github.com/iojs/io.js/pull/317

// Note to maintainers: Although this module has been deprecated for a while
// we do not plan to remove it. See: https://github.com/nodejs/node/pull/35407#issuecomment-700693439
module.exports = require('util');
process.emitWarning('sys is deprecated. Use `node:util` instead.',
                    'DeprecationWarning', 'DEP0025');
```

Ryan's last *interesting* core change, nine days into 2012, is to make the old name throw, with a promise that v0.9 will delete it. v0.9 never exists as a line (0.9 was the odd-numbered unstable slot; 0.10 shipped instead). Six months later Isaac, now the person landing patches, restores a 24-line MIT-licensed shim: "Un-break." In 2015 the io.js TC votes, explicitly, *don't remove*. In 2024 Rafael Gonzaga writes a maintainer note pointing at a GitHub comment: we do not plan to remove it. In 2026 `lib/sys.js` is still in the tree. v0.9's deletion never came.

**Why it is a story.** The moment before Isaac's un-break: Ryan has decided that a warning is not a contract and a throw is. The ecosystem still `require('sys')`. Isaac's first act as the practical BDFL of 2012 is to reverse the founder on compatibility. Every later "we will remove this in the next major" in this repo sits in the shadow of that un-break. The rule that actually held was not Ryan's throw. It was Isaac's revert.

**Reader learns:** a deprecation is only real if a later maintainer is willing to keep it. `git log --follow -- lib/sys.js` is a 16-year argument about whether a rename happened. Search for `Un-break` and `don't remove`, not just `deprecate`.

**surprise:** 5

---

## 4. The founder's last commit is a GYP bump; the shortlog is the goodbye

- **find-type:** 4 (name that disappears)
- **hash:** `f90c9ce0e255e531fee4f07dbe53f0c6c893e700` (last); last version bump `72cbb7492cb5956c8265b415bd6ff473b7b89f35`
- **date:** 2012-08-22 15:18:45 -0400
- **author:** Ryan Dahl `<ry@tinyclouds.org>`
- **message:** `Upgrade GYP to r1477`

```
git -C ~/book16/repos/node log --all --author='ry@tinyclouds.org' --format='%H %ai %s' | head -3
git -C ~/book16/repos/node show --stat --format='%s' f90c9ce0e255e531fee4f07dbe53f0c6c893e700 | tail -5
git -C ~/book16/repos/node shortlog -sn HEAD --after=2009-01-01 --before=2010-01-01 | head -4
git -C ~/book16/repos/node shortlog -sn HEAD --after=2012-01-01 --before=2013-01-01 | head -5
```

```
f90c9ce0e255e531fee4f07dbe53f0c6c893e700 2012-08-22 15:18:45 -0400 Upgrade GYP to r1477
fe464a2fea93880a7da883138f83a2ae8ad6a30f 2012-06-20 13:31:49 -0700 Rename GYP variable node_use_system_openssl to be consistent
c9f17305e611c2b304bd646093ef498a489ee504 2012-04-02 15:14:52 -0700 Mac installer shows license
    Upgrade GYP to r1477
 tools/gyp/tools/emacs/gyp.el                       |  251 +++++
 tools/gyp/tools/emacs/testdata/media.gyp           | 1105 +++++++++++++++++++
 24 files changed, 4065 insertions(+), 159 deletions(-)

   815 Ryan Dahl          # 2009
   861 Isaac Z. Schlueter # 2012
   478 Ben Noordhuis
    32 Ryan Dahl
```

3113 commits under `ry@tinyclouds.org` on `--all`. Then silence. No farewell, no "handing over," no last feature. January 16, 2012 he still bumps `Now working on v0.7.1-pre`. By April he is pasting licenses into the Mac installer. By August he is upgrading the GYP Emacs testdata. 2009: 815 of his vs. 10 Isaac. 2012: 32 of his vs. 861 Isaac. The all-time shortlog still lists him #2 (3021), behind only Rich Trott (3151) — a ranking that is almost entirely 2009–2011.

**Why it is a story.** The moment before: he still owns the version number. The moment after: the next `Now working on` is someone else's, and the last object with his name on it is a Chromium build-tool vendor bump. Fade-outs in git are not speeches. They are a year when the shortlog swaps the first two names, then a final commit that could have been anyone's.

**Reader learns:** `git log --author=founder | head` is the real last day, and it is usually boring on purpose. Compare `shortlog -sn` across calendar windows, not feelings.

**surprise:** 3 (the fade is folklore; the GYP-emacs last commit is not)

---

## 5. Isaac arrives as a one-line Host header on `http.cat`

- **find-type:** 4 (name that appears)
- **hash:** `45f540244660aed31d26eba38f8eda43519528e0`
- **date:** 2009-09-29 16:38:07 -0700
- **author:** isaacs `<i@foohack.com>` (later Isaac Z. Schlueter `<i@izs.me>`)
- **message:** `Pass the Host header in http.cat calls, if it was specified in the URL passed to http.cat.`

```
git -C ~/book16/repos/node log --reverse --author='Isaac Z. Schlueter' --format='%H %ai %an <%ae> %s' | head -3
git -C ~/book16/repos/node show 45f540244660aed31d26eba38f8eda43519528e0 -- lib/http.js
```

```
45f540244660aed31d26eba38f8eda43519528e0 2009-09-29 16:38:07 -0700 isaacs <i@foohack.com> Pass the Host header in http.cat calls…
    var req = client.get(uri.path || "/", uri.host ? {"Host" : uri.host} : {});
 lib/http.js | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
```

`http.cat` is a Promise-returning convenience that Ben Noordhuis will delete in 2011 (`bc7cfd7cd7c2`, "http: remove legacy http library"). Isaac's first patch is one ternary so that convenience sends `Host`. He is `i@foohack.com`. Three years later he is the person un-breaking `sys` and writing 861 commits in a year. In 2014 he will blog that he is leaving to start npm, Inc.

**Why it is a story.** The moment before: Node's HTTP client is still named after Unix `cat`, and it forgets RFC 2616. The future steward of npm and of the 2012 tree does not introduce himself with a manifesto. He fixes a header.

**Reader learns:** `git log --author=… --reverse | head` on a future BDFL is almost always a one-line bugfix on an API that will die. The first commit is a foot in the door, not a thesis.

**surprise:** 3

---

## 6. Twenty-four lines that replaced `setTimeout(cb, 0)`

- **find-type:** 1 (tiny diff, huge blast radius)
- **hash:** `8abeffa9ea5626e81d2d9d0164b2a43ea458a0b8`
- **date:** 2010-01-18 10:27:27 -0800
- **author:** Ryan Dahl `<ry@tinyclouds.org>`
- **message:** `Add process.nextTick()`

```
git -C ~/book16/repos/node log -1 --format='%H%n%ai %an %s%n%b' 8abeffa9ea5626e81d2d9d0164b2a43ea458a0b8
git -C ~/book16/repos/node show --stat 8abeffa9ea5626e81d2d9d0164b2a43ea458a0b8
git -C ~/book16/repos/node show 8abeffa9ea5626e81d2d9d0164b2a43ea458a0b8 -- src/node.js | head -50
```

```
    Add process.nextTick()
    This is a replacement for the common hack:
      setTimeout(cb, 0);
    It's much more efficient.
 4 files changed, 61 insertions(+), 6 deletions(-)

+var nextTickQueue = [];
+var nextTickWatcher = new process.IdleWatcher();
+nextTickWatcher.setPriority(process.EVMAXPRI); // max priority
+process.nextTick = function (callback) {
+  nextTickQueue.push(callback);
+  nextTickWatcher.start();
+};
```

The implementation is an idle watcher at max libev priority and a JS array. The first two call sites are `loadModule` and `loadObject` — module loading was using `setTimeout(..., 0)` to defer Promise success. The API that every Node programmer now treats as a primitive of the event loop is a 2010 efficiency shim for the Promise machinery he is about to delete.

**Why it is a story.** The moment before: the way you yield is a timer. He is slightly embarrassed (`the common hack`) and slightly proud (`much more efficient`). He does not know that `nextTick` will starve I/O, grow a starvation-warning, grow `setImmediate`, and become the thing interviewers ask about. He knows it makes module loading cheaper.

**Reader learns:** the scheduling primitive of a platform is often a local performance patch. `git log -S 'nextTick' --reverse -- lib src` finds the day the event loop grew a user-facing queue.

**surprise:** 3 (the API is famous; the `setTimeout(cb, 0)` commit message and the module-loader call sites are not)

---

## 7. Node had Promises. Ryan deleted them.

- **find-type:** 8 (rollback of the world)
- **hashes:** `7cd09874c666f0ce64b1d7776de74f55ff3e53ab` (add, 2009-06-28) → `0485cc41d5c260458f590d249c073794047434fb` (remove, 2010-02-20)
- **date:** 2010-02-20 19:45:39 -0800
- **author:** Ryan Dahl `<ry@tinyclouds.org>`
- **message:** `Remove promises`

```
git -C ~/book16/repos/node log --reverse --format='%H %ai %an %s' --until=2010-03-01 | grep -i promis | head -5
git -C ~/book16/repos/node log -1 --format='%H%n%ai %an %s' 7cd09874c666f0ce64b1d7776de74f55ff3e53ab
git -C ~/book16/repos/node show --stat --format='%s' 0485cc41d5c260458f590d249c073794047434fb
git -C ~/book16/repos/node show 0485cc41d5c260458f590d249c073794047434fb -- src/node.js | head -40
```

```
7cd09874c666f0ce64b1d7776de74f55ff3e53ab 2009-06-28 12:40:20 +0200 Ryan Add Promise class
65324866bcfa72b8ed934e081ac7ef239f3a819b 2009-06-28 19:05:58 +0200 Ryan Implement Promises for file i/o
19f182a39f90ec7ef16648cf6bc7dee213b74118 2009-08-25 04:10:20 +0200 Ryan Experimental support for Promise.block()
    Add Promise class
     src/events.cc | 31 +++++++++++++++++++++++++++++++
    Remove promises
 4 files changed, 306 deletions(-)
-  exports.Promise = function () {
-    exports.EventEmitter.call(this);
-  process.Promise = exports.Promise;
-  exports.Promise.prototype.addCallback = function (listener) {
-  exports.Promise.prototype.addErrback = function (listener) {
```

Eight months of API: `Promise.block()` renamed to `wait()`, `EIOPromise`, `timeout()`, `cancel()` removed and restored, Felix Geisendörfer building on it, `http.cat` returning one. Then a Saturday in February, 306 lines gone, no body on the commit. Node will spend the next five years as the callback platform, invent `error-first` as culture, grow `async`/`await` on V8's Promises, and pretend this did not happen. `git log -S Promise -- lib/promise.js` is empty because the class never lived in `lib/promise.js`. It lived inside `src/node.js` next to `EventEmitter`.

**Why it is a story.** The moment before: Promises are how file I/O returns, and `promise.wait()` can block the event loop on purpose. He has been trying to make them less wrong for half a year (`Only allow a promise to fire once`). The moment after: callbacks, and a generation of libraries that will later be rewritten as Promises. The folklore that "Node never had Promises" is a deletion, not a fact.

**Reader learns:** absence in today's tree is not absence in history. Search `git log --grep=Promise --until=2010-03-01` before you write "this project chose callbacks." A 306-line deletion can set a decade of style.

**surprise:** 5

---

## 8. This repository is the fork: `node` → `iojs` → `node`

- **find-type:** 8 (rollback of the world) — also 2 (imported-history / rename boundary)
- **hashes:** `51514c8e8cbd98be7f29c3f1508b625d16e91b5d` (README declares the fork) → `f17f473af5e28f4ec00a518f97a84b69c426309e` (binary rename to iojs) → `a69ab27ab458385d24676792b75ad1c25b8c30e5` (rename back) → `f9f837885343a2a3f5ba2b8c510eaac395c8c865` (v4.0.0)
- **dates:** 2014-12-01 / 2015-01-08 / 2015-08-13 / 2015-09-07
- **authors:** Mikeal Rogers; Ben Noordhuis; cjihrig (Colin Ihrig); Rod Vagg
- **messages:** `docs: simple project messaging.` / `build: rename binary from node to iojs` / `node: rename from io.js to node` / `2015-09-08, Version 4.0.0 (Stable) Release`

```
git -C ~/book16/repos/node show 51514c8e8cbd98be7f29c3f1508b625d16e91b5d -- README.md
git -C ~/book16/repos/node log -1 --format='%H %ai %an %s' f17f473af5e28f4ec00a518f97a84b69c426309e
git -C ~/book16/repos/node show --stat --format='%s%n%b' a69ab27ab458385d24676792b75ad1c25b8c30e5 | head -18
git -C ~/book16/repos/node log -1 --format='%s%n%b' f9f837885343a2a3f5ba2b8c510eaac395c8c865 | head -12
git -C ~/book16/repos/node rev-list --count origin/v1.x --not origin/v0.12
git -C ~/book16/repos/node rev-list --count origin/v0.12 --not HEAD
```

```
-Evented I/O for V8 javascript.
+io.js
+This repository began as a GitHub fork of
+[joyent/node](https://github.com/joyent/node) where contributions,
+releases, and contributorship are under an
+[open governance model](./CONTRIBUTING.md#governance).
    PR-URL: https://github.com/iojs/io.js/pull/24

    build: rename binary from node to iojs
    node: rename from io.js to node
    This commit replaces instances of io.js with Node.js, based on the
    recent convergence.
    96 files changed, 2162 insertions(+), 2187 deletions(-)
    PR-URL: https://github.com/nodejs/node/pull/2367

    2015-09-08, Version 4.0.0 (Stable) Release
    This list of changes is relative to the last io.js v3.x branch
    release, v3.3.0. … changes required for full
    convergence of the Node.js and io.js projects.

v1.x not in v0.12: 1061
v0.12 not in main: 486
```

There is no octopus merge that heals two histories. `nodejs/node` *is* the io.js repo. On 2014-12-01 Mikeal overwrites the tagline "Evented I/O for V8 javascript." with `io.js` and a paragraph that names Joyent as the parent. PR #24. Four days later Rod Vagg commits `CONTRIBUTING.md` with a Technical Committee whose *initial* membership is Ben, Bert, Fedor, Isaac, Nathan, TJ, Trevor (`185d11c791c2`). In January they rename the binary. In August, after the Foundation deal, Colin Ihrig runs a 96-file s/io.js/Node.js/. v4.0.0's notes are written relative to *io.js v3.3.0*, not to Joyent 0.12. Joyent's `v0.12` still holds 486 commits that never landed on `main` (mostly later 0.12.x maintenance).

Shortlog across the split, Dec 2014–Sep 2015:

```
git -C ~/book16/repos/node shortlog -sn origin/v1.x --after=2014-12-01 --before=2015-09-01 | head -5
git -C ~/book16/repos/node shortlog -sn origin/v0.12 --after=2014-12-01 --before=2015-09-01 | head -5
```

```
   172 Ben Noordhuis     # io.js / v1.x
    93 Rod Vagg
    98 Julien Gilli      # joyent v0.12
    25 Shigeki Ohtsu
```

**Why it is a story.** The moment before Mikeal's README: the project is still called Node, still tagged "Evented I/O for V8 javascript.", still Joyent's. The moment after: the same DAG, a new name, a TC, a binary called `iojs`. Eight months later they spend 2,162 insertions renaming it back. Convergence is a search-and-replace plus a version jump from 3 to 4, not a merge commit you can point a camera at.

**Reader learns:** when a community forks by renaming the GitHub org, `git log --grep=io.js` will drown in false positives (`internal/worker/io.js`, OpenSSL `s_client`). Find the README sentence that says "this repository began as a GitHub fork" and the `git mv` of the binary. The reconciliation commit may be a branding pass.

**surprise:** 4 (the fork is folklore; that *this* clone is io.js, and that v4.0.0's changelog parents at io.js v3.3.0, is the part the blog posts skip)

---

## 9. "TJ will take Node to 1.0" — io.js ships v1.0.0 eleven months later

- **find-type:** 4 (name that appears / handover)
- **hashes:** `e7f7e2aeca77485b99969dccedb4b71e2c157b9d` (blog) → `b82bb600370db7207a39e53329af228f6af3ffa1` (io.js 1.0.0)
- **date:** 2014-01-15 09:03:45 -0800 / 2015-01-14 14:07:28 +1100
- **authors:** Isaac Z. Schlueter; Rod Vagg
- **messages:** `blog: TJ is the new node core project lead` / `2015-01-14 io.js v1.0.0 Release`

```
git -C ~/book16/repos/node log -1 --format='%H%n%ai %an %s' e7f7e2aeca77485b99969dccedb4b71e2c157b9d
git -C ~/book16/repos/node show e7f7e2aeca77485b99969dccedb4b71e2c157b9d -- '*.md' | grep -A2 -E '1.0|npm, Inc|Effective immediately'
git -C ~/book16/repos/node log -1 --format='%H %ai %an %s' b82bb600370db7207a39e53329af228f6af3ffa1
git -C ~/book16/repos/node shortlog -sn HEAD --after=2014-01-01 --before=2015-01-01 | head -6
```

```
    blog: TJ is the new node core project lead
+Effective immediately, TJ Fontaine is the Node.js project
+lead.  I will remain a Node core committer…
+I am starting a company, npm, Inc.
+TJ is exactly the leader who can help us take Node.js to 1.0 and
+beyond.

b82bb600370db7207a39e53329af228f6af3ffa1 2015-01-14 14:07:28 +1100 Rod Vagg 2015-01-14 io.js v1.0.0 Release

   211 Fedor Indutny     # 2014, Isaac not in the top 12
   134 Ben Noordhuis
   130 Timothy J Fontaine
```

Isaac writes the handover into `doc/blog/`. He is going to make npm a company. TJ is "exactly the leader who can help us take Node.js to 1.0." Joyent Node never ships 1.0. It stays on 0.12. The 1.0.0 tag in *this* repo is Rod Vagg's io.js release, almost one year to the day later, from the fork that listed both Isaac and TJ on its first TC. 2014's shortlog already had Isaac off the front page — the blog made official a handover the commit counts had already performed, and then the project split anyway.

**Why it is a story.** The moment before: Isaac believes a named successor and a blog post can keep Node one thing while he builds npm, Inc. The moment after: the successor inherits a Joyent process the rest of core will not live under, and the version number 1.0.0 is claimed by the fork. Handover posts are not history. They are bets.

**Reader learns:** when a lead change is a markdown file in `doc/blog/` plus a version promise, check whether that version number ever ships on that line. `git tag | grep 1.0` and `git log --author=successor -1` will tell you if the bet cleared.

**surprise:** 4

---

## 10. `Buffer.alloc` — the constructor that was a feature and then a CVE class

- **find-type:** 7 (feature that became the vulnerability)
- **hash:** `85ab4a5f1281c4e1dd06450ac7bd3250326267fa`
- **date:** 2016-01-25 15:00:06 -0800
- **author:** James M Snell `<jasnell@gmail.com>`
- **message:** `buffer: add .from(), .alloc() and .allocUnsafe()`

```
git -C ~/book16/repos/node log -1 --format='%H%n%ai %an %s%n%b' 85ab4a5f1281c4e1dd06450ac7bd3250326267fa | head -20
git -C ~/book16/repos/node show --stat --format='' 85ab4a5f1281c4e1dd06450ac7bd3250326267fa | tail -3
```

```
    buffer: add .from(), .alloc() and .allocUnsafe()
    * Soft-Deprecate Buffer() constructors
    * Add `Buffer.from()`, `Buffer.alloc()`, and `Buffer.allocUnsafe()`
    * Add `--zero-fill-buffers` command line option
    PR-URL: https://github.com/nodejs/node/pull/4682
 229 files changed, 2824 insertions(+), 853 deletions(-)
```

`new Buffer(size)` did not zero memory. That was the point — allocation was a pool, uninitialized on purpose, fast. By 2016 it is also how you leak leftover heap into HTTP responses. The fix is not "make Buffer safe." The fix is *three* constructors so the unsafe one can keep its speed and its name, a `--zero-fill-buffers` flag for the frightened, and a "soft-deprecate" of the thing every snippet on Stack Overflow still showed. `SlowBuffer` had to be docs-deprecated separately two months later (`3fe204c7009c`). In 2025 someone will still have to `Revert "buffer: move SlowBuffer to EOL"` (`2e1d9581e013`).

**Why it is a story.** The moment before: speed is the contract, and zeroing is someone else's malloc. The moment after: the safe API is the long name, the fast API has `Unsafe` in it so you cannot pretend you did not know, and the original constructor is undead. Same shape as `sys`: a dangerous default, a rename, a deprecation that cannot quite kill the old spelling.

**Reader learns:** when a performance default becomes a security boundary, git will show a *proliferation* of names (`alloc` / `allocUnsafe` / `allocUnsafeSlow` / `from`) rather than a clean replacement. Count the new identifiers. That number is the residual blast radius.

**surprise:** 2 (widely known; the "soft-deprecate" wording and the later SlowBuffer EOL revert are the receipts)

---

## Ranked top 3

1. **#3 `require('sys') now throws` / Un-break / still in HEAD** — a 16-year deprecation whose only hard enforcement was reverted by the next lead. Type 6, surprise 5.
2. **#7 Remove promises** — Node shipped Promises for eight months in 2009–2010; Ryan deleted 306 lines and the folklore became "Node chose callbacks." Type 8, surprise 5.
3. **#8 This clone is io.js** — README fork, binary rename out, binary rename back, v4.0.0 changelog parented at io.js v3.3.0. Type 8, surprise 4.

**Disappointing:** the 2013 gendered-pronoun revert war is not in this repository (it is libuv); Ryan left no farewell commit, only a GYP bump; `git log -S` / `--all` over `deps/v8` is too slow to be a pleasant pickaxe; author/committer skew on HEAD is almost all cherry-picks (247 commits >1 year), not planted dates.
