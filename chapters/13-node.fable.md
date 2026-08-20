# Remove promises

Everyone knows Node.js is the platform that chose callbacks. The error-first
`function(err, data)`, callback hell, the pyramid of doom, the decade of libraries written to
tame it — all of it grew from a founding decision to build asynchronous I/O on callbacks
rather than the alternative JavaScript would later standardize on: Promises. So if you went
looking for the Promise implementation Node must have considered and rejected, you would
search where such a thing lives today, and you would find this:

```console
$ git -C repos/node log --all --oneline -- lib/promise.js | wc -l
0
```

[R5] Nothing. No history at all. Which looks like confirmation: there is no Promise code in
Node's past because Node was a callback platform from the first commit. Except a filename is
the wrong place to look. Search the *content* of the early history instead — pickaxe the word
itself, before 2010 — and the zero becomes this:

```console
$ git -C repos/node log --reverse --format='%h %ai %s' --until=2010-03-01 | grep -iE 'promis'
7cd09874c66 2009-06-28 12:40:20 +0200 Add Promise class
65324866bcf 2009-06-28 19:05:58 +0200 Implement Promises for file i/o
4f46c477734 2009-07-31 19:48:19 +0200 node.fs.File was not passing args to promise callbacks.
19f182a39f9 2009-08-25 04:10:20 +0200 Experimental support for Promise.block()
51addf19d8d 2009-08-26 11:25:53 +0200 Improve Promise documentation.
18d05117778 2009-08-26 17:12:44 +0200 promise.block() renamed to promise.wait()
```

[R2] `Add Promise class`. `Implement Promises for file i/o`. `Improve Promise documentation.`
Node had Promises. Four months into the project, in June 2009, Ryan Dahl added a `Promise`
class [R1], made file I/O return them, documented them, and let contributors build on them for
most of a year. This is not a proposal that was floated and declined. It is a shipped API with
a test file. The platform whose entire culture rests on *not* having had Promises spent its
first year having them.

## Saturday night

Here is where they went. February 20, 2010, a Saturday, 7:45 in the evening, Pacific time:

```console
$ git -C repos/node show -s --format='%h %ai %an%n%s%n%b' 0485cc41d5
0485cc41d5c 2010-02-20 19:45:39 -0800 Ryan Dahl
Remove promises
```

[R3] `Remove promises` — the whole subject, and the body below it is blank. Sit in that
Saturday night for a moment, with what he could see from it, because it makes the deletion far
more reasonable than the folklore's caricature of a clean architectural choice. What he had
was eight months of a young, strange API. His Promises inherited from `EventEmitter` — that is
how unformed the pattern still was, years before the JavaScript standard would fix what a
Promise even is:

```console
$ git -C repos/node show 0485cc41d5 -- src/node.js | grep -E '^-' | grep -iE 'Promise' | head -4
-  exports.Promise = function () {
-  process.inherits(exports.Promise, exports.EventEmitter);
-  process.Promise = exports.Promise;
-  exports.Promise.prototype.timeout = function(timeout) {
```

[R4] And the marquee feature of that API was `promise.wait()` — a call, renamed from
`.block()` two commits into its life, that would *stop the event loop* until the promise
resolved. On a platform whose one idea is that you never block the event loop, the headline
convenience of its Promise class was a way to block the event loop. From the chair he was
sitting in that night, that is not a pattern to refine into the future of async JavaScript.
It is a false start with a loaded gun in it. So he removed it — the class, the file-I/O
integration, the docs, and a 79-line test file:

```console
$ git -C repos/node show --stat --format= 0485cc41d5 | tail -1
 4 files changed, 306 deletions(-)
```

[R3] Three hundred and six lines, four files, nothing added, no explanation recorded. The
empty commit body is not negligence; at this point Node is a handful of people and Ryan is all
of them who matter, and a two-word subject on a deletion is what total authority over a
codebase looks like. What git cannot tell me is what he was thinking — whether he meant *never
again* or *not like this, not yet*. It can only tell me what he did. Node then spent roughly
five years without built-in Promises, becoming the callback platform and growing error-first
as a culture. Promises returned through the JavaScript language itself; `async`/`await` followed,
but callback culture shaped the rest of the decade. The founding "choice" everyone cites was
made on a Saturday night, against a blocking `.wait()`, and then hardened, by nothing but the
passage of time and the difficulty of finding it, into a story that says the choice was there
from the start.

~ In a tree, "never existed" and "was deleted years ago" look exactly the same.

## The one that didn't take

Ryan's deletion held. It held because in 2010 the tree was his — what he removed stayed
removed, because he was the person who would have had to be argued out of it, and he was also
the only person landing the code. Two years later he made the same kind of move on something
smaller, and by then that was no longer true.

The `sys` module had been renamed to `util`, and in January 2012 Ryan decided the old name
should stop working:

```console
$ git -C repos/node show b28e700ebd -- lib/sys.js | grep -E '^\+' | grep -i throw
+throw new Error('The "sys" module is now called "util".');
```

[R6] `require('sys')` now throws, and the commit body reads `To be removed in v0.9` — the old
name isn't just disabled, it's scheduled for deletion. The same founder instinct: this is
over, I have decided. But look at whose hands were actually on the tree by then, one year
before this commit and one year after:

```console
$ git -C repos/node shortlog -sn HEAD --after=2009-01-01 --before=2010-01-01 | grep -E 'Ryan Dahl|Isaac Z'
   815	Ryan Dahl
    10	Isaac Z. Schlueter
$ git -C repos/node shortlog -sn HEAD --after=2012-01-01 --before=2013-01-01 | grep -E 'Ryan Dahl|Isaac Z'
   861	Isaac Z. Schlueter
    32	Ryan Dahl
```

[R11] In 2009, Ryan's project: 815 commits to Isaac Schlueter's 10. By 2012, almost exactly
inverted: Isaac 861, Ryan 32. The founder still held the vision; someone else now held the
tree. And five months after Ryan made `sys` throw, the person holding the tree reversed him:

```console
$ git -C repos/node show -s --format='%h %ai %an%n%s' f2a9ed4873
f2a9ed48736 2012-06-28 10:13:28 -0700 isaacs
Fix #3577 Un-break require('sys')
```

[R7] *Un-break.* The word chooses a side — to Isaac, Ryan's throw was not a decision, it was
breakage, filed under a bug number by the users it broke. In its place he committed a shim,
`module.exports = require('util')`, so that every old program calling `require('sys')` would
keep running. That was the whole code exchange: one throw, one un-break. Nearly three years
later, the project's governing committee made the policy explicit rather than fight it again:

```console
$ git -C repos/node log -1 --format='%h %ai %s%n%b' dc42e1faaf | grep -viE 'PR-URL|Reviewed-By'
dc42e1faaf3 2015-01-12 18:41:07 -0600 sys: Mark as deprecated

discussed at TC meeting, deprecate, don't remove
```

[R8] *Deprecate, don't remove* — minuted in a commit body. And so, in 2026, fourteen years
after Ryan wrote `throw`:

```console
$ git -C repos/node show HEAD:lib/sys.js | tail -4
// we do not plan to remove it. See: ...
module.exports = require('util');
process.emitWarning('sys is deprecated. Use `node:util` instead.',
                    'DeprecationWarning', 'DEP0025');
```

[R9] The throw is gone; the shim remains, under a maintainer's note that says, in plain words,
*we do not plan to remove it*. `require('sys')` still works today, on Node 26, because in 2012
the founder's deletion met a maintainer who called it breakage and had the commit bits to say
so. The same instinct that erased Promises in 2010 tried to erase `sys` in 2012 and could not,
and the only thing that had changed was who was landing the patches.

~ The tree is the current state of an argument. It is not the argument.

## The fade

By the time his `sys` deletion was being reversed, Ryan was most of the way out the door, in
the quietest way git records a leaving. No farewell, no handover commit. His last object in
the entire repository:

```console
$ git -C repos/node log --all --author='ry@tinyclouds.org' --format='%h %ai %s' | head -1
f90c9ce0e25 2012-08-22 15:18:45 -0400 Upgrade GYP to r1477
```

[R10] `Upgrade GYP to r1477` — a version bump of Google's build tool, four thousand lines of
vendored configuration and Emacs testdata. [R10] The man who wrote `Remove promises` and set
the shape of a platform made his last mark on it by upgrading somebody else's build system,
and then he was gone from the log. He did not come back to re-throw `sys`. He did not need to
weigh in; by then he was one voice, and the tree already belonged to the people who kept it.

## At home

Two habits, and they are the same habit twice. When someone tells you a project "never" did
something — never had Promises, never supported X, always worked this way — go looking for the
removal, and look with `git log -S Feature --all` on the *content*, not `git log --
the/path/you/expect`, because the thing you are hunting was very likely deleted before it ever
reached the filename it would have today; a tree with no `promise.js` is not a tree that never
had promises. And when you find a deprecation — *to be removed in the next version* — check
whether the removal ever came: `git log --follow` on the condemned file will tell you whether
it was deleted as promised or, like `require('sys')`, outlived the person who condemned it
because the next maintainer refused to finish the job. A repository is not a set of facts about
how the software is. It is the current standings of every argument the software ever had, and
the arguments settled by deletion are the ones it hides best.

## Receipts

- **R1** `git -C repos/node log -1 7cd09874c6` + `show -- src/events.cc` — 2009-06-28, Ryan Dahl, "Add Promise class"; a V8 `Promise` constructor template in the C++ core.
- **R2** `git -C repos/node log --reverse --until=2010-03-01 | grep promis` — eight months of Promise work: file I/O, `Promise.block()` → `.wait()`, documentation.
- **R3** `git -C repos/node show -s 0485cc41d5` + `--stat` — 2010-02-20 19:45 −0800, "Remove promises," empty body, 4 files, 306 deletions, 0 insertions.
- **R4** `git -C repos/node show 0485cc41d5 -- src/node.js` — the deleted `exports.Promise` inherited from `EventEmitter`, lived inside `src/node.js`, not a `promise.js`.
- **R5** `git -C repos/node log --all -- lib/promise.js | wc -l` — zero: the class never lived at the path a modern reader would search; the deletion is only findable by content pickaxe.
- **R6** `git -C repos/node show b28e700ebd -- lib/sys.js` — 2012-01-09, Ryan Dahl, "require('sys') now throws," body "To be removed in v0.9"; adds `throw new Error(...)`.
- **R7** `git -C repos/node show -s f2a9ed4873` + `show -- lib/sys.js` — 2012-06-28, isaacs, "Fix #3577 Un-break require('sys')"; restores the `module.exports = require('util')` shim.
- **R8** `git -C repos/node log -1 dc42e1faaf` — 2015-01-12, "sys: Mark as deprecated," body "discussed at TC meeting, deprecate, don't remove."
- **R9** `git -C repos/node show HEAD:lib/sys.js` — at HEAD the throw is gone; the shim remains under "we do not plan to remove it," `DeprecationWarning DEP0025`.
- **R10** `git -C repos/node log --all --author='ry@tinyclouds.org' | head -1` + `show --stat` — Ryan Dahl's last commit is 2012-08-22 "Upgrade GYP to r1477," 24 files / 4,065 insertions of vendored build tooling.
- **R11** `git -C repos/node shortlog -sn` for 2009 vs 2012 — Ryan Dahl 815 / Isaac 10 in 2009; Isaac 861 / Ryan 32 in 2012: the succession, inverted, in one year.

*Full transcripts: `chapters/13-node.receipts.md` (regenerate with `scripts/receipts-13.sh`).*
