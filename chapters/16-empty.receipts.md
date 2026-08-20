# Receipts — ch. 16 the empty commit (cross-repo)

Verbatim outputs against full clones of php-src, swiftlang/swift, openssl, ffmpeg, nodejs/node.
An 'empty' commit is one whose tree hash equals its parent's: it changes no bytes.
Regenerate with `scripts/receipts-16.sh`. Long outputs truncated editorially (head).

## R1 — php: a commit whose only purpose is to ring a doorbell
```
$ git -C repos/php show -s --format='%h %ai %an%n%s' 00d8e26d71
00d8e26d711 2015-05-28 02:08:48 +0200 Ferenc Kovacs
empty commit to trigger a github mirror
```

```
$ git -C repos/php rev-parse '00d8e26d71^{tree}' '00d8e26d71^^{tree}'   # commit tree == parent tree
a064a669874bc010c940635e33981edf3f74e62a
a064a669874bc010c940635e33981edf3f74e62a
```

## R2 — swift: an empty commit whose payload is the fact of a build running
```
$ git -C repos/swift show -s --format='%h %ai %an%n%s' 63fd0d0ea6
63fd0d0ea6d 2021-12-17 11:01:36 -0800 Anders Bertelrud
Empty commit for CI
```

```
$ git -C repos/swift rev-parse '63fd0d0ea6^{tree}' '63fd0d0ea6^^{tree}'   # equal: nothing changed
22829324a357a546641e2743b5f27c5d52ab3c15
22829324a357a546641e2743b5f27c5d52ab3c15
```

```
$ git -C repos/swift branch -r --contains 63fd0d0ea6 | head -1   # lives only on a stale eng branch
  origin/eng/anders/empty-commit-for-ci
```

## R3 — openssl: four empty commits used as chapter dividers of a migration
```
$ for h in 304e56e870 a96f48995e cbf4b68333 99655cb91d; do git -C repos/openssl show -s --format='%h %ai %an | %s' $h; done
304e56e870 2023-11-09 10:27:13 +0000 Hugo Landau | MARKER: End of Phase 1: Unused QUIC_PORT
a96f48995e 2023-11-09 10:27:13 +0000 Hugo Landau | MARKER: End of Phase 2: Transfer of Responsibilities Done, Legacy Compat Retained
cbf4b68333 2023-11-09 10:27:14 +0000 Hugo Landau | MARKER: End of Phase 3: Legacy Cleanup
99655cb91d 2023-11-09 10:27:14 +0000 Hugo Landau | MARKER: End of Phase 4: Finalization & SRT Handling
```

```
$ git -C repos/openssl rev-parse '304e56e870^{tree}' '304e56e870^^{tree}'   # first marker: empty
ee4032f663851c7c51256e0134b43a6654aca81b
ee4032f663851c7c51256e0134b43a6654aca81b
```

## R4 — ffmpeg: an empty commit that is a receipt — the fix was already present
```
$ git -C repos/ffmpeg show -s --format='%h %ai %an%n%s' 7df9a56f0d
7df9a56f0d 2026-03-11 21:48:33 +0800 Zhao Zhili
avformat/rtmpproto: fix listen_timeout conversion for special negative values
```

```
$ git -C repos/ffmpeg rev-parse '7df9a56f0d^{tree}' '7df9a56f0d^^{tree}'   # equal: nothing to apply
9b69b789e7e03903fadeb92bb08c71f5a648b849
9b69b789e7e03903fadeb92bb08c71f5a648b849
```

```
$ git -C repos/ffmpeg show -s --format='%b' 7df9a56f0d | grep -i 'cherry picked'
(cherry picked from commit f189657ec67cfae78dc7fdf44754aa1633e24be0)
```

## R5 — node: the same reviewed patch landed twice, twelve minutes apart; the second is empty
```
$ git -C repos/node show -s --format='%h %aI committed %cI by %cn%n%s' 766d063e05 71e9d0fb1b
766d063e057 2014-12-03T18:28:40+11:00 committed 2014-12-04T21:20:28+11:00 by Rod Vagg
configure: remove shared cares build option
71e9d0fb1b4 2014-12-03T18:28:40+11:00 committed 2014-12-04T21:32:05+11:00 by Rod Vagg
configure: remove shared cares build option
```

```
$ git -C repos/node rev-parse '71e9d0fb1b^{tree}' '71e9d0fb1b^^{tree}'   # second landing: empty
97d40506c54701d05f42f405c86f4cc2da1c8f4a
97d40506c54701d05f42f405c86f4cc2da1c8f4a
```

```
$ git -C repos/node merge-base --is-ancestor 766d063e05 71e9d0fb1b && echo 'first landing is already an ancestor of the second'
first landing is already an ancestor of the second
```

