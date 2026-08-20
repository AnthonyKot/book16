# Receipts — ch. 03 bitcoin (the contributor named --author=Satoshi)

Verbatim outputs against a full clone of https://github.com/bitcoin/bitcoin.
Regenerate with `scripts/receipts-03.sh`. Long outputs truncated editorially (head).

## R1 — shortlog lists a flag as a person (three spellings of one name)
```
$ git -C repos/bitcoin shortlog -sne --all | grep -iE 'nakamoto|author='
   245	s_nakamoto <s_nakamoto@1a98c847-1fd6-4fd8-948a-caf3550aa51b>
    26	Satoshi Nakamoto <satoshin@gmx.com>
     8	--author=Satoshi Nakamoto <satoshin@gmx.com>
```

## R2 — the 8 commits: author literally '--author=Satoshi Nakamoto', committer Gavin
```
$ git -C repos/bitcoin log --all --author=--author --format=%h\ %aI\ %an\ \<%ae\>\ \|\ committer=%cn\ \|\ %s
e1cb7ce017 2010-07-31T14:14:41+00:00 --author=Satoshi Nakamoto <satoshin@gmx.com> | committer=Gavin Andresen | simplified makefile.unix, updated build-unix.txt instructions to include boost 1.37
a75560d828 2010-07-30T17:36:06+00:00 --author=Satoshi Nakamoto <satoshin@gmx.com> | committer=Gavin Andresen | reverted makefile.unix wx-config -- version 0.3.6
ec82517c89 2010-07-30T17:35:17+00:00 --author=Satoshi Nakamoto <satoshin@gmx.com> | committer=Gavin Andresen | Fredrik Roubert: simplified makefile.unix with wx-config, misc
31ffe954b6 2010-07-30T17:31:39+00:00 --author=Satoshi Nakamoto <satoshin@gmx.com> | committer=Gavin Andresen | fixed makefile.osx
872d60f6e4 2010-07-30T17:31:05+00:00 --author=Satoshi Nakamoto <satoshin@gmx.com> | committer=Gavin Andresen | fixed makefile.vc
2689f4d02b 2010-07-27T20:46:41+00:00 --author=Satoshi Nakamoto <satoshin@gmx.com> | committer=Gavin Andresen | better IsInitialBlockDownload
3dd20ff2f8 2010-07-27T20:43:55+00:00 --author=Satoshi Nakamoto <satoshin@gmx.com> | committer=Gavin Andresen | added a subset of Crypto++ 5.6.0 with 48% faster ASM SHA-256, combined speedup 2.5x faster vs 0.3.3, thanks BlackEye for figuring out the alignment problem
9f35575ca3 2010-07-27T14:21:02+00:00 --author=Satoshi Nakamoto <satoshin@gmx.com> | committer=Gavin Andresen | tcatm's cached SHA256 state idea, about 70% faster generating
```

## R3 — the same patch, done right, on the SVN line by s_nakamoto
```
$ git -C repos/bitcoin show --format=%h\ %aI\ %an\ \<%ae\>\ %s --stat 01bed1828b
01bed1828b 2010-07-30T23:22:55+00:00 s_nakamoto <s_nakamoto@1a98c847-1fd6-4fd8-948a-caf3550aa51b> simplified makefile.unix, updated build-unix.txt instructions to include boost 1.37

 build-unix.txt | 16 +++++++++-------
 makefile.unix  | 15 ++++-----------
```

## R4 — Gavin arrives five weeks earlier as 'Fix CRLF'
```
$ git -C repos/bitcoin log --all --author=Gavin --reverse --format=%h\ %aI\ %an\ %s HEAD
8bd66202c3 2010-07-14T15:54:31+00:00 Gavin Andresen Fix CRLF
9d2174b6f5 2010-07-19T01:02:04+00:00 Gavin Andresen version 0.3.1 rc1
05708fc63e 2010-07-19T01:08:47+00:00 Gavin Andresen Spanish translation by milkiway, French translation by aidos
8e79c64750 2010-07-19T01:10:37+00:00 Gavin Andresen version 0.3.1 release
```

```
$ git -C repos/bitcoin show --stat --format=%h\ %s 8bd66202c3
8bd66202c3 Fix CRLF

 base58.h                           |   402 +-
```

## R5 — one of the flagged commits in full (the quoting bug is permanent, tree never rewritten)
```
$ git -C repos/bitcoin show --format=fuller --stat 9f35575ca3
commit 9f35575ca34eb15b20d1d5374b56ac9d4c8cc2bf
Author:     --author=Satoshi Nakamoto <satoshin@gmx.com>
AuthorDate: Tue Jul 27 14:21:02 2010 +0000
Commit:     Gavin Andresen <gavinandresen@gmail.com>
CommitDate: Tue Jul 27 14:21:02 2010 +0000

    tcatm's cached SHA256 state idea, about 70% faster generating

```

## R6 — no .mailmap at HEAD: nobody has even papered over the display
```
$ git -C repos/bitcoin cat-file -e HEAD:.mailmap || echo 'no .mailmap at HEAD'
no .mailmap at HEAD
```

