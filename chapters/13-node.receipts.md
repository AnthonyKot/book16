# Receipts — ch. 13 nodejs/node (the deletions the history unmade)

Verbatim outputs against a full clone of nodejs/node. Names shown via mailmap (Ryan → Ryan Dahl).
Regenerate with `scripts/receipts-13.sh`. Long outputs truncated editorially (head).

## R1 — June 2009: Node gets a Promise class
```
$ git -C repos/node log -1 --format='%h %ai %an%n%s' 7cd09874c6
7cd09874c66 2009-06-28 12:40:20 +0200 Ryan
Add Promise class
```

```
$ git -C repos/node show 7cd09874c6 -- src/events.cc | grep -E '^\+' | grep -iE 'Promise' | head -4
+Persistent<FunctionTemplate> Promise::constructor_template;
+Promise::Initialize (v8::Handle<v8::Object> target)
+  target->Set(String::NewSymbol("Promise"),
+Promise*
```

## R2 — eight months of building on them
```
$ git -C repos/node log --reverse --format='%h %ai %s' --until=2010-03-01 | grep -iE 'promis' | head -6
7cd09874c66 2009-06-28 12:40:20 +0200 Add Promise class
65324866bcf 2009-06-28 19:05:58 +0200 Implement Promises for file i/o
4f46c477734 2009-07-31 19:48:19 +0200 node.fs.File was not passing args to promise callbacks.
19f182a39f9 2009-08-25 04:10:20 +0200 Experimental support for Promise.block()
51addf19d8d 2009-08-26 11:25:53 +0200 Improve Promise documentation.
18d05117778 2009-08-26 17:12:44 +0200 promise.block() renamed to promise.wait()
```

## R3 — February 2010: 306 lines gone, no explanation
```
$ git -C repos/node show -s --format='%h %ai %an%n%s%n%b' 0485cc41d5
0485cc41d5c 2010-02-20 19:45:39 -0800 Ryan Dahl
Remove promises

```

```
$ git -C repos/node show --stat --format= 0485cc41d5 | tail -2
 test/mjsunit/test-promise.js         | 79 ------------------------------
 4 files changed, 306 deletions(-)
```

## R4 — the deleted class lived inside src/node.js, beside EventEmitter
```
$ git -C repos/node show 0485cc41d5 -- src/node.js | grep -E '^-' | grep -iE 'Promise' | head -5
-  exports.Promise = function () {
-  process.inherits(exports.Promise, exports.EventEmitter);
-  process.Promise = exports.Promise;
-  exports.Promise.prototype.timeout = function(timeout) {
-  exports.Promise.prototype._clearTimeout = function() {
```

## R5 — the deletion is invisible if you only search today's expected path
```
$ git -C repos/node log --all --oneline -- lib/promise.js | wc -l   # never lived there
0
```

## R6 — the founder's second deletion: require('sys') now throws
```
$ git -C repos/node log -1 --format='%h %ai %an%n%s%n%b' b28e700ebd
b28e700ebdf 2012-01-09 12:59:26 -0800 Ryan Dahl
require('sys') now throws
To be removed in v0.9

```

```
$ git -C repos/node show b28e700ebd -- lib/sys.js | grep -E '^\+' | grep -i throw
+throw new Error('The "sys" module is now called "util".');
```

## R7 — the next lead un-breaks it, with a note about old programs
```
$ git -C repos/node show -s --format='%h %ai %an%n%s' f2a9ed4873
f2a9ed48736 2012-06-28 10:13:28 -0700 isaacs
Fix #3577 Un-break require('sys')
```

```
$ git -C repos/node show f2a9ed4873 -- lib/sys.js | grep -E '^\+' | grep -vE '^\+\+\+'
+// Copyright Joyent, Inc. and other Node contributors.
+//
+// Permission is hereby granted, free of charge, to any person obtaining a
+// copy of this software and associated documentation files (the
+// "Software"), to deal in the Software without restriction, including
+// without limitation the rights to use, copy, modify, merge, publish,
```

## R8 — 2015: the committee votes, explicitly, don't remove
```
$ git -C repos/node log -1 --format='%h %ai %an%n%s%n%b' dc42e1faaf | grep -viE 'PR-URL|Reviewed-By'
dc42e1faaf3 2015-01-12 18:41:07 -0600 Wyatt Preul
sys: Mark as deprecated

discussed at TC meeting, deprecate, don't remove

```

## R9 — 2026: the throw the founder wrote is gone; his rename never happened
```
$ git -C repos/node show HEAD:lib/sys.js | tail -6

// Note to maintainers: Although this module has been deprecated for a while
// we do not plan to remove it. See: https://github.com/nodejs/node/pull/35407#issuecomment-700693439
module.exports = require('util');
process.emitWarning('sys is deprecated. Use `node:util` instead.',
                    'DeprecationWarning', 'DEP0025');
```

## R10 — the founder's fade: his last commit is a build-tool bump
```
$ git -C repos/node log --all --author='ry@tinyclouds.org' --format='%h %ai %s' | head -1
f90c9ce0e25 2012-08-22 15:18:45 -0400 Upgrade GYP to r1477
```

```
$ git -C repos/node show --stat --format= f90c9ce0e2 | tail -2
 tools/gyp/tools/emacs/testdata/media.gyp.fontified | 1107 ++++++++++++++++++++
 24 files changed, 4065 insertions(+), 159 deletions(-)
```

## R11 — the succession, in the shortlog, one year apart
```
$ git -C repos/node shortlog -sn HEAD --after=2009-01-01 --before=2010-01-01 | grep -E 'Ryan Dahl|Isaac Z'
   815	Ryan Dahl
    10	Isaac Z. Schlueter
```

```
$ git -C repos/node shortlog -sn HEAD --after=2012-01-01 --before=2013-01-01 | grep -E 'Ryan Dahl|Isaac Z'
   861	Isaac Z. Schlueter
    32	Ryan Dahl
```

