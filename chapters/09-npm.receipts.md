# Receipts — ch. 09 the npm sabotage pair (event-stream + colors)

Verbatim outputs against full clones of dominictarr/event-stream and Marak/colors.js.
Regenerate with `scripts/receipts-09.sh`. Long outputs truncated editorially (head).

## R1 — event-stream: the house style — a helper is a require and a re-export
```
$ git -C repos/event-stream show --stat --format='%h %aI %an %s' 53c59a38da
53c59a3 2012-08-18T15:10:31+02:00 Dominic Tarr refactor out map

 index.js     | 94 ++----------------------------------------------------------
 package.json |  3 +-
 2 files changed, 4 insertions(+), 93 deletions(-)
```

```
$ git -C repos/event-stream show 53c59a38da -- index.js package.json | grep -E '^\+' | grep -iE 'map|version' | head -4
+  , map = require('map-stream')
+es.map = map
+    "map-stream": "0.0.1"
```

## R2 — event-stream: the last of one maintainer, the first of the next
```
$ git -C repos/event-stream log --author='Dominic Tarr' --format='%h %aI %s' | head -2
7319862 2017-10-10T08:50:06+13:00 Merge pull request #107 from Rolias/master
b3be03d 2017-03-22T13:50:08+13:00 Merge pull request #103 from detailyang/patch-1
```

```
$ git -C repos/event-stream log --reverse --author=北川 --format='%h %aI %an <%ae> %s' | head -3
a74c9b2 2018-09-04T08:12:15+00:00 北川 <right9ctrl@outlook.com> upgrade dependencies
0cc6c7f 2018-09-04T08:53:07+00:00 北川 <right9ctrl@outlook.com> add map and split examples
ee8f8e4 2018-09-04T09:19:17+00:00 北川 <right9ctrl@outlook.com> remove trailing in split example
```

## R3 — event-stream: the new maintainer's first week, in full, up to the payload
```
$ git -C repos/event-stream log --author=北川 --reverse --format='%h %aI %s' | head -9
a74c9b2 2018-09-04T08:12:15+00:00 upgrade dependencies
0cc6c7f 2018-09-04T08:53:07+00:00 add map and split examples
ee8f8e4 2018-09-04T09:19:17+00:00 remove trailing in split example
c08d14b 2018-09-05T04:13:50+00:00 better pretty.js example
05b0224 2018-09-05T05:06:29+00:00 update readme
918d4a3 2018-09-05T05:27:34+00:00 3.3.5
50c0edb 2018-09-06T08:09:04+00:00 add note for gulp 4 in readme
0f3738c 2018-09-09T07:15:41+00:00 add collect alias for write array
e316336 2018-09-09T08:07:49+00:00 add flat map
```

```
$ git -C repos/event-stream show a74c9b2ab4 -- package.json | grep -E 'map-stream'
-    "map-stream": "~0.1.0",
+    "map-stream": "0.0.7",
```

## R4 — event-stream: the payload — two lines and a dependency, in the house style
```
$ git -C repos/event-stream show e3163361fe -- index.js package.json | grep -E '^[+-]' | grep -vE '^[+-]{3}' | head -6
+  , flatmap = require('flatmap-stream')
+es.flatmap = flatmap
+    "flatmap-stream": "^0.1.0",
```

## R5 — event-stream: nine minutes later, the version every caret range will select — untagged
```
$ git -C repos/event-stream show -s --format='%h %aI %s' e3163361fe 5999958dfc
e316336 2018-09-09T08:07:49+00:00 add flat map
5999958 2018-09-09T08:17:22+00:00 3.3.6
```

```
$ git -C repos/event-stream tag --list '3.3.6'   # (empty)
```

## R6 — event-stream: seven days later, four minutes wash the face of the repository
```
$ git -C repos/event-stream show -s --format='%h %aI %s' 908fee5c65 2bd63d58fe 8bc742ba91
908fee5 2018-09-16T11:14:19+00:00 add filter and rewrite flatmap
2bd63d5 2018-09-16T11:16:18+00:00 update package.json
8bc742b 2018-09-16T11:18:12+00:00 update readme
```

```
$ git -C repos/event-stream show 908fee5c65 -- index.js | grep -E '^[+-].*(flatmap|filterSync)' | head -4
-  , flatmap = require('flatmap-stream')
-es.flatmap = flatmap
+// filterSync
+es.filterSync = function (test) {
```

```
$ git -C repos/event-stream show 2bd63d58fe -- package.json | grep -E '^[+-].*(version|flatmap)'
-  "version": "3.3.6",
+  "version": "4.0.0",
-    "flatmap-stream": "^0.1.0",
```

```
$ git -C repos/event-stream for-each-ref --format='%(refname:short) %(creatordate:iso-strict) %(objectname:short) %(subject)' refs/tags | tail -2
4.0.0 2018-09-16T11:18:12+00:00 8bc742b update readme
4.0.1 2018-09-20T13:17:24+00:00 9a5c52a remove testling from package.json
```

## R7 — event-stream: the crime the news describes is not in this git
```
$ git -C repos/event-stream log -S copay --all --oneline | wc -l
0
```

```
$ git -C repos/event-stream log -S bitcoin --all --oneline | wc -l
0
```

```
$ git -C repos/event-stream log -S wallet --all --oneline | wc -l
0
```

## R8 — event-stream: how the repository ends
```
$ git -C repos/event-stream log -1 --format='%H%n%aI%n%an <%ae>%n%s'
9a5c52a712a721cbc76192b5d0940bcc29cbef03
2018-09-20T13:17:24+00:00
北川 <right9ctrl@outlook.com>
remove testling from package.json
```

```
$ git -C repos/event-stream show HEAD:package.json | grep '"author"'
  "author": "Dominic Tarr <dominic.tarr@gmail.com> (http://bit.ly/dominictarr)"
```

## R9 — colors: day one, 02:56 on a Friday
```
$ git -C repos/colors log --reverse --format=%h\ %aI\ %an\ %s
270314c 2010-06-11T02:56:25-04:00 Marak Squires first commit
8b3d411 2010-06-11T02:59:01-04:00 Marak Squires added docs
```

```
$ git -C repos/colors show --stat --format= 270314c42b | tail -3
 ReadMe.md |  1 +
 colors.js | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)
```

```
$ git -C repos/colors show 270314c42b:ReadMe.md
colors are awesome yo```

## R10 — colors: 2011 — the joke is checked in
```
$ git -C repos/colors log --all --reverse -S zalgo --format='%h %aI %an %s' | head -1
4b6bc29 2011-03-15T03:10:40-07:00 Marak Squires [dist] Updated package.json, bumped version, added creds. [misc] Snuck in demonic entity.
```

```
$ git -C repos/colors show 4b6bc29521 -- colors.js | grep -E '^\+' | head -5
+++ b/colors.js
+};
+
+// don't summon zalgo
+String.prototype.__defineGetter__('zalgo', function () {
```

## R11 — colors: who ships vs who owns
```
$ git -C repos/colors shortlog -sn --all
    74	DABH
    44	Marak Squires
    37	Marak
    19	paladox
    12	Pavan Kumar Sunkara
```

```
$ git -C repos/colors shortlog -sn --all --since=2018-01-01 --until=2020-01-01
    74	DABH
    18	paladox
    10	Josh Pike
     5	Marak
     2	Bastien Caudan
     2	pii
```

```
$ git -C repos/colors show HEAD:package.json | grep '"author"'
    "author": "Marak Squires",
```

## R12 — colors: Friday night, 7 January 2022 — four commits, three and a half minutes
```
$ git -C repos/colors log -4 --format=%h\ %ai\ %an\ %s
6bc50e7 2022-01-07 23:22:34 -0500 Marak Bump to `v1.4.44-liberty-2`
5d2d242 2022-01-07 23:21:02 -0500 Marak Fix bug
137c6da 2022-01-07 23:19:44 -0500 Marak Bump to `v1.4.44-liberty`
074a0f8 2022-01-07 23:19:03 -0500 Marak Adds new American flag module
```

## R13 — colors: what the first commit of the night adds to the entry point
```
$ git -C repos/colors show 074a0f8ed0 -- lib/index.js | grep -E '^\+' | head -11
+++ b/lib/index.js
+
+/* remove this line after testing */
+let am = require('../lib/custom/american');
+am();
+for (let i = 666; i < Infinity; i++;) {
+  if (i % 333) {
+    // console.log('testing'.zalgo.rainbow)
+  }
+  console.log('testing testing testing testing testing testing testing'.zalgo)
+}
```

## R14 — colors: 'Fix bug' — one character, so the loop can run
```
$ git -C repos/colors show --format='%h %aI %s' 5d2d242f65 | head -8
5d2d242 2022-01-07T23:21:02-05:00 Fix bug

 /* remove this line after testing */
 let am = require('../lib/custom/american');
 am();
-for (let i = 666; i < Infinity; i++;) {
+for (let i = 666; i < Infinity; i++) {
   if (i % 333) {
```

## R15 — colors: nobody ever reverts; master is still the payload
```
$ git -C repos/colors branch -a --contains 074a0f8ed0
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/master
```

```
$ git -C repos/colors tag --contains 074a0f8ed0   # (empty)
```

```
$ git -C repos/colors log --all --grep=Revert --format='%h %ai %s' | head -1   # newest revert in the repo
05129e7 2018-04-30 15:07:19 -0700 Revert dummy commit
```

## R16 — colors: the speech everyone remembers is not here
```
$ git -C repos/colors log --all -S 'no more' --oneline | wc -l
0
```

```
$ git -C repos/colors log --all -G 'free work|unpaid|I will no longer' --oneline | wc -l
0
```

## R17 — colors: the versions the incident reports name were never committed
```
$ git -C repos/colors log --all -G '1\.4\.[1-9]' --format='%h %ai %s' -- package.json
6bc50e7 2022-01-07 23:22:34 -0500 Bump to `v1.4.44-liberty-2`
137c6da 2022-01-07 23:19:44 -0500 Bump to `v1.4.44-liberty`
```

```
$ git -C repos/colors for-each-ref --sort=creatordate --format='%(refname:short) %(creatordate:short)' refs/tags | tail -1   # newest tag
v1.4.0 2019-09-22
```

## R18 — colors: on the shipping branch, the owner's previous commit is six and a half years old
```
$ git -C repos/colors log --first-parent --author=Marak --format='%h %ai %s' | head -5
6bc50e7 2022-01-07 23:22:34 -0500 Bump to `v1.4.44-liberty-2`
5d2d242 2022-01-07 23:21:02 -0500 Fix bug
137c6da 2022-01-07 23:19:44 -0500 Bump to `v1.4.44-liberty`
074a0f8 2022-01-07 23:19:03 -0500 Adds new American flag module
90dd85b 2015-06-17 15:42:07 +0200 Update ReadMe.md
```

