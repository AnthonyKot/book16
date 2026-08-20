# Receipts — ch. 07 vim (the last 32 hours and the succession)

Verbatim outputs against a full clone of https://github.com/vim/vim.
Regenerate with `scripts/receipts-07.sh`. Long outputs truncated editorially (head).

## R1 — the last five commits with Bram as committer
```
$ git -C repos/vim log --committer='Bram' --format='%ci %an | %s' | head -5
2023-07-09 02:38:28 +0100 THARAK HEGDE | patch 9.0.1677: typo in syntax test input file
2023-07-08 00:54:06 +0100 Bram Moolenaar | patch 9.0.1676: warning for buffer in use when exiting early
2023-07-08 00:25:56 +0100 Bram Moolenaar | patch 9.0.1675: test may run into timeout when using valgrind
2023-07-07 23:19:18 +0100 Bram Moolenaar | patch 9.0.1674: help for builtin functions is not sorted properly
2023-07-07 18:57:40 +0100 Bram Moolenaar | patch 9.0.1673: cannot produce a status 418 or 503 message
```

## R2 — Friday 18:57: patch 9.0.1673, the teapot
```
$ git -C repos/vim show -s --format=%H%n%ai\ %an%n%s%n%b 80adaa8ae8398403ca4e9797219ea9a501fc76a5
80adaa8ae8398403ca4e9797219ea9a501fc76a5
2023-07-07 18:57:40 +0100 Bram Moolenaar
patch 9.0.1673: cannot produce a status 418 or 503 message
Problem:    Cannot produce a status 418 or 503 message.
Solution:   Add err_teapot().

```

```
$ git -C repos/vim show 80adaa8ae8 | grep -E 'E418|E503' | head -4
 	INIT(= N_("E418: Illegal value: %s"));
+	INIT(= N_("E418: I'm a teapot"));
 	INIT(= N_("E503: \"%s\" is not a file or writable device"));
+	INIT(= N_("E503: Coffee is currently not available"));
```

## R3 — 23:19: the new help entry is put in alphabetical order
```
$ git -C repos/vim show -s --format=%H%n%ai%n%s%n%b 416bd916b4cc4502eb734218f406e4edd8dd199c
416bd916b4cc4502eb734218f406e4edd8dd199c
2023-07-07 23:19:18 +0100
patch 9.0.1674: help for builtin functions is not sorted properly
Problem:    Help for builtin functions is not sorted properly.
Solution:   Put err_teapot() help in the right position.
```

## R4 — 00:54 Saturday: the last commit Bram authors
```
$ git -C repos/vim show -s --format=%H%nauthor\ \ \ \ %an\ \<%ae\>\ %ai%ncommitter\ %cn\ %ci%n%s 16abd997c99b1a40fb0ba54889ce0cf44d7585b4
16abd997c99b1a40fb0ba54889ce0cf44d7585b4
author    Bram Moolenaar <Bram@vim.org> 2023-07-08 00:54:06 +0100
committer Bram Moolenaar 2023-07-08 00:54:06 +0100
patch 9.0.1676: warning for buffer in use when exiting early
```

## R5 — 02:38 Sunday: the last commit Bram applies — a stranger's typo fix
```
$ git -C repos/vim show -s --format=%H%nauthor\ \ \ \ %an\ \<%ae\>\ %ai%ncommitter\ %cn\ %ci%n%s 4c0089d696b8d1d5dc40568f25ea5738fa5bbffb
4c0089d696b8d1d5dc40568f25ea5738fa5bbffb
author    THARAK HEGDE <120558797+captainhaddock18@users.noreply.github.com> 2023-07-09 02:38:28 +0100
committer Bram Moolenaar 2023-07-09 02:38:28 +0100
patch 9.0.1677: typo in syntax test input file
```

```
$ git -C repos/vim show 4c0089d696 | grep -E '^[+-].*argu' | head -2
-echo "Processing the following command line arguements: ${*:-none}"
+echo "Processing the following command line arguments: ${*:-none}"
```

## R6 — fifteen years, one name: decade shortlogs and the first non-Bram author
```
$ git -C repos/vim shortlog -sn HEAD --since=2004-01-01T00:00:00Z --until=2011-01-01T00:00:00Z
  2649	Bram Moolenaar
```

```
$ git -C repos/vim shortlog -sn HEAD --since=2011-01-01T00:00:00Z --until=2019-01-01T00:00:00Z
  6517	Bram Moolenaar
```

```
$ git -C repos/vim log --reverse --format='%H %ai %an %s' | grep -v 'Bram Moolenaar' | head -1
e307073680d498b113c7df8250abd5676de1ed13 2019-11-27 15:45:57 +0100 Christian Brabandt Cirrus CI: add a simple CI using BSD
```

## R7 — the contributors live in the body: 404 Bram-authored commits credit Christian Brabandt
```
$ git -C repos/vim log --author='Bram Moolenaar' --grep='(Christian Brabandt)' --format='%h' | wc -l
404
```

```
$ git -C repos/vim log --author='Bram Moolenaar' --grep='(Christian Brabandt)' --format='%h %aI %s' | head -2
a96edb736 2022-04-28T17:52:24+01:00 patch 8.2.4841: empty string considered an error for expand()
04b871da8 2022-01-15T18:31:43+00:00 patch 8.2.4100: early return when getting the 'formatlistpat' value
```

## R8 — the constitution: the first three 'Merge pull request' subjects in the whole history
```
$ git -C repos/vim log --reverse --grep='Merge pull request' --format='%H %ai %an %s' | head -3
8fbd6723af3248a1fa46fa1e610804841603abe5 2019-11-27 16:08:29 +0100 Christian Brabandt Merge pull request #5273 from chrisbra/cirrus_ci
7a212c625362d86327878d57269d63f6a2ca5d2b 2019-11-27 21:57:06 +0100 Bram Moolenaar Merge pull request #5275 from vim/revert-5273-cirrus_ci
9fcde94176b9c1a3b85d054cc388c49cb17dfb18 2023-08-07 17:00:41 +0200 Christian Brabandt Merge pull request #12740 from k-takata/import-9.0.1678
```

```
$ git -C repos/vim show --stat --format='%s' 7a212c625362 | tail -4

 .cirrus.yml | 9 ---------
 README.md   | 1 -
 2 files changed, 10 deletions(-)
```

## R9 — 2020: LICENSE added 'because Vim license not easy to find on github' — naming one human
```
$ git -C repos/vim show -s --format=%H%n%ai\ %an%n%s%n%b c838626fea42ed5924ee6084d87d1b37b2d7b0ff
c838626fea42ed5924ee6084d87d1b37b2d7b0ff
2020-01-08 21:43:02 +0100 Bram Moolenaar
patch 8.2.0105: Vim license not easy to find on github
Problem:    Vim license not easy to find on github.
Solution:   Add a separate LICENCE file. (closes #5458)

```

```
$ git -C repos/vim show c838626fea:LICENSE | sed -n '24,26p'
          The current maintainer is Bram Moolenaar <Bram@vim.org>.  If this
          changes it will be announced in appropriate places (most likely
          vim.sf.net, www.vim.org and/or comp.editors). When it is completely
```

## R10 — the bridge: the succession's first patch was authored while Bram was alive
```
$ git -C repos/vim show -s --format=%H%nauthor\ \ \ \ %an\ %aI%ncommitter\ %cn\ %cI%n%s 84bc00e9b52b1174888f2f696f8b628a83c49988
84bc00e9b52b1174888f2f696f8b628a83c49988
author    Christian Brabandt 2023-07-13T11:45:54+02:00
committer Christian Brabandt 2023-08-08T20:39:55+02:00
patch 9.0.1679: Cleanup Tests from leftover files
```

## R11 — 13 August 2023: the announcement the LICENSE promised
```
$ git -C repos/vim show -s --format=%H%n%ai\ %an%n%s e978b4534a5e10471108259118c0ef791106fd92
e978b4534a5e10471108259118c0ef791106fd92
2023-08-13 10:33:05 +0200 Christian Brabandt
Farewell to Bram and dedicate upcoming Vim 9.1 to him (#12749)
```

```
$ git -C repos/vim show e978b4534a -- LICENSE | grep -E '^[+-].*maintainer' 
-          The current maintainer is Bram Moolenaar <Bram@vim.org>.  If this
+          The current maintainers are listed here: https://github.com/orgs/vim/people.
```

```
$ git -C repos/vim show e978b4534a -- README.txt | grep -E '^[+-].*(flowers|Bram|vim-dev)'
-	Bram Moolenaar <Bram@vim.org>
+If nothing else works, report bugs directly to the vim-dev mailing list:
+	<vim-dev@vim.org>
-Send any other comments, patches, flowers and suggestions to:
+Send any other comments, patches, flowers and suggestions to the vim-dev mailing list:
```

```
$ git -C repos/vim show e978b4534a:runtime/doc/version9.txt | sed -n '47,49p'
Vim version 9.1 is dedicated to Bram Moolenaar, who passed away on August 3rd 2023
while still working full-time on Vim.  The Vim project would not exist without
his ongoing passion to lead and develop Vim and the community for more than 30
```

## R12 — the machine survives: the patch counter never resets, the grammar stays
```
$ git -C repos/vim log --reverse --committer='Christian Brabandt' --since=2023-08-03 --format='%ci %an | %s' | head -2
2023-08-08 20:39:55 +0200 Christian Brabandt | patch 9.0.1679: Cleanup Tests from leftover files
2023-08-09 18:16:16 +0200 Christian Brabandt | patch 9.0.1680: sodium test fails in Github CI
```

```
$ git -C repos/vim shortlog -sn HEAD --since=2023-08-03
  1164	Christian Brabandt
   544	zeertzjq
   314	Hirohito Higashi
   291	Yegappan Lakshmanan
   259	Doug Kearns
   187	Yasuhiro Matsumoto
   164	Foxe Chen
```

## R14 — twenty-nine days: every commit in the repository between 8 July and 9 August
```
$ git -C repos/vim log --format='%ci %an | committer=%cn | %s' --since=2023-07-08 --until=2023-08-09 --reverse | head -4
2023-07-09 02:38:28 +0100 THARAK HEGDE | committer=Bram Moolenaar | patch 9.0.1677: typo in syntax test input file
2023-08-07 03:24:20 +0900 ObserverOfTime | committer=K.Takata | patch 9.0.1678: blade files are not recognized
2023-08-07 17:00:41 +0200 Christian Brabandt | committer=GitHub | Merge pull request #12740 from k-takata/import-9.0.1678
2023-08-08 20:39:55 +0200 Christian Brabandt | committer=Christian Brabandt | patch 9.0.1679: Cleanup Tests from leftover files
```

## R15 — the 2019 revert's message body is empty
```
$ git -C repos/vim show -s --format='%an %aI%n%s%n---body---%n%b' d52986e7be
Bram Moolenaar 2019-11-27T21:56:28+01:00
Revert "Cirrus CI: add a simple CI using BSD"
---body---

```

## R13 — the flowers line arrives in README.txt in 2010
```
$ git -C repos/vim log --reverse -S 'flowers' --format='%h %ai %s' -- README.txt | head -1
33aea1875 2010-08-07 13:19:27 +0200 Update README files.  Remove references to extra and lang archives.
```

## R16 — while he lived: the author column opens (2021), the committer column does not
```
$ git -C repos/vim log --until=2023-08-03 --format='%an' | grep -v '^Bram Moolenaar$' | wc -l
1420
```

```
$ git -C repos/vim log --until=2023-08-03 --format='%an' | grep -v '^Bram Moolenaar$' | sort -u | wc -l
223
```

```
$ git -C repos/vim log --reverse --since=2020-01-01 --format='%h %aI %an %s' | grep -v 'Bram Moolenaar' | head -2
bb01a1ef3 2021-04-26T21:17:52+02:00 Yegappan Lakshmanan patch 8.2.2813: cannot grep using fuzzy matching
2bf6034e5 2021-05-02T20:16:24+02:00 Dominique Pelle patch 8.2.2825: code in checkreadonly() not fully tested
```

```
$ git -C repos/vim log --until=2023-08-03 --format='%cn' | sort | uniq -c | sort -rn
  17981 Bram Moolenaar
      4 GitHub
      1 Christian Brabandt
```

## R17 — the hands after 3 August: the committer column since his death
```
$ git -C repos/vim log --since=2023-08-03 --format='%cn' | sort | uniq -c | sort -rn | head -5
   5881 Christian Brabandt
    434 GitHub
      4 h-east
      2 dkearns
      1 K.Takata
```

