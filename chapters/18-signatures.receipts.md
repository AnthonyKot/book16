# Receipts — ch. 18 signature and tag-object archaeology (cross-repo)

Verbatim outputs against full clones of openssl, xz, bitcoin, log4j2, linux, go, and cpython.
A PGP armor line proves signature material is embedded in an object; it does not establish key trust.
Regenerate with `scripts/receipts-18.sh`. Long outputs are truncated editorially (head or sed).

## R1 — openssl: the annotated Heartbleed-fix release tag is unsigned
```
$ git -C repos/openssl rev-parse refs/tags/OpenSSL_1_0_1g 'refs/tags/OpenSSL_1_0_1g^{}'
7434fe25b14aa036f6b9e12358abeaebdb7b250a
b2d951e4232d2f90168f9a3dd0b7df9ecf2d81a8
```

```
$ git -C repos/openssl cat-file -p refs/tags/OpenSSL_1_0_1g
object b2d951e4232d2f90168f9a3dd0b7df9ecf2d81a8
type commit
tag OpenSSL_1_0_1g
tagger Dr. Stephen Henson <steve@openssl.org> 1396889744 +0100

OpenSSL 1.0.1g release tag
```

```
$ git -C repos/openssl tag -v OpenSSL_1_0_1g
object b2d951e4232d2f90168f9a3dd0b7df9ecf2d81a8
type commit
tag OpenSSL_1_0_1g
tagger Dr. Stephen Henson <steve@openssl.org> 1396889744 +0100

OpenSSL 1.0.1g release tag
error: no signature found
```

## R2 — openssl: the bounds-check fix is in 1.0.1g; a later tag object contains PGP armor
```
$ git -C repos/openssl show -s --format='%H%n%aI%n%an <%ae>%n%s' 96db9023b881d7cd9f379b0c154650d6c108e9a3 'OpenSSL_1_0_1g^{}'
96db9023b881d7cd9f379b0c154650d6c108e9a3
2014-04-06T00:51:06+01:00
Dr. Stephen Henson <steve@openssl.org>
Add heartbeat extension bounds check.
b2d951e4232d2f90168f9a3dd0b7df9ecf2d81a8
2014-04-07T17:55:44+01:00
Dr. Stephen Henson <steve@openssl.org>
Prepare for 1.0.1g release
```

```
$ git -C repos/openssl merge-base --is-ancestor 96db9023b881d7cd9f379b0c154650d6c108e9a3 'OpenSSL_1_0_1g^{}' && echo 'heartbleed_fix_ancestor_of_release=yes'
heartbleed_fix_ancestor_of_release=yes
```

```
$ git -C repos/openssl rev-parse refs/tags/OpenSSL_1_1_0-pre6 'refs/tags/OpenSSL_1_1_0-pre6^{}'; git -C repos/openssl cat-file -p refs/tags/OpenSSL_1_1_0-pre6 | sed -n '1,6p;/^-----BEGIN PGP SIGNATURE-----$/p'
04a54629c2bb904e9bd9a1d98381b1259147cc0d
2f554efe20d1fe05b242f41f593362965ae89912
object 2f554efe20d1fe05b242f41f593362965ae89912
type commit
tag OpenSSL_1_1_0-pre6
tagger Matt Caswell <matt@openssl.org> 1470319244 +0100

OpenSSL 1.1.0-pre6 release tag
-----BEGIN PGP SIGNATURE-----
```

## R3 — xz: both compromised-release tag objects contain PGP signatures
```
$ for tag in v5.6.0 v5.6.1; do git -C repos/xz rev-parse "refs/tags/$tag" "refs/tags/$tag^{}"; git -C repos/xz cat-file -p "refs/tags/$tag" | sed -n '1,6p;/^-----BEGIN PGP SIGNATURE-----$/p'; done
ea6bc696fe047eb031b1ecc4bdbaeb6d5b01a711
2d7d862e3ffa8cec4fd3fdffcd84e984a17aa429
object 2d7d862e3ffa8cec4fd3fdffcd84e984a17aa429
type commit
tag v5.6.0
tagger Jia Tan <jiat0218@gmail.com> 1708762926 +0800

XZ Utils 5.6.0
-----BEGIN PGP SIGNATURE-----
1b7a78738112e2ccecf9dcef68a79ffac8a0c738
fd1b975b7851e081ed6e5cf63df946cd5cbdbb94
object fd1b975b7851e081ed6e5cf63df946cd5cbdbb94
type commit
tag v5.6.1
tagger Jia Tan <jiat0218@gmail.com> 1709972160 +0800

XZ Utils 5.6.1
-----BEGIN PGP SIGNATURE-----
```

## R4 — xz: those signatures name Git trees that omit the tarball payload path but ignore it
```
$ for tag in v5.6.0 v5.6.1; do git -C repos/xz show -s --format="$tag commit=%H tree=%T%n%aI %an <%ae>%n%s" "$tag^{}"; if git -C repos/xz cat-file -e "$tag^{tree}:m4/build-to-host.m4" 2>/dev/null; then echo "$tag m4/build-to-host.m4=present"; else echo "$tag m4/build-to-host.m4=absent"; fi; git -C repos/xz show "$tag^{commit}:m4/.gitignore" | rg '^build-to-host\.m4$'; done
v5.6.0 commit=2d7d862e3ffa8cec4fd3fdffcd84e984a17aa429 tree=5c8015c7712a44f2a035448121f83aa16e73a041
2024-02-24T15:55:08+08:00 Jia Tan <jiat0218@gmail.com>
Bump version and soname for 5.6.0.
v5.6.0 m4/build-to-host.m4=absent
scripts/receipts-18.sh: line 6: rg: command not found
v5.6.1 commit=fd1b975b7851e081ed6e5cf63df946cd5cbdbb94 tree=c61040fb8c1972d6da4568969d695ea73bd0a804
2024-03-09T11:42:50+08:00 Jia Tan <jiat0218@gmail.com>
Bump version and soname for 5.6.1.
v5.6.1 m4/build-to-host.m4=absent
scripts/receipts-18.sh: line 6: rg: command not found
```

```
$ git -C repos/xz log --all --format='%H' -- m4/build-to-host.m4 | wc -l; git -C repos/xz log --all --format='%H %aI %an <%ae> %s' -S 'build-to-host.m4' -- m4/.gitignore
0
2c024f60c2e51224981ecc7d1426ec821355f9b4 2024-02-15T22:26:43+08:00 Jia Tan <jiat0218@gmail.com> Update m4/.gitignore.
e164211b09d65f7f8663c46b1f74f12ac1c54d48 2024-02-15T22:26:43+08:00 Jia Tan <jiat0218@gmail.com> Update m4/.gitignore.
4323bc3e0c1e1d2037d5e670a3bf6633e8a3031e 2024-02-15T22:26:43+08:00 Jia Tan <jiat0218@gmail.com> Update m4/.gitignore.
```

## R5 — bitcoin: the signed v0.3.20.2 object calls itself a critical bug-fix release
```
$ git -C repos/bitcoin rev-parse refs/tags/v0.3.20.2 'refs/tags/v0.3.20.2^{}'; git -C repos/bitcoin cat-file -p refs/tags/v0.3.20.2 | sed -n '1,6p;/^-----BEGIN PGP SIGNATURE-----$/p'
90b4ed72f86e1d7f6196f9f9be0911a79f9cbb09
52248a757b25581339ca6e00cc0da05bfdb04dc8
object 52248a757b25581339ca6e00cc0da05bfdb04dc8
type commit
tag v0.3.20.2
tagger Gavin Andresen <gavinandresen@gmail.com> 1299250125 -0500

critical bug-fix release (block download failures due to too-small sendbuffer)
-----BEGIN PGP SIGNATURE-----
```

```
$ git -C repos/bitcoin show -s --format='%H%n%aI%n%an <%ae>%n%s' 52248a757b25581339ca6e00cc0da05bfdb04dc8
52248a757b25581339ca6e00cc0da05bfdb04dc8
2011-03-03T16:25:05-05:00
Gavin Andresen <gavinandresen@gmail.com>
Make send/receive limits bigger (10MB each)
```

## R6 — bitcoin: that exact fix is outside HEAD; an identical patch survives under another hash
```
$ git -C repos/bitcoin rev-parse HEAD; if git -C repos/bitcoin merge-base --is-ancestor 52248a757b25581339ca6e00cc0da05bfdb04dc8 HEAD; then echo release_commit_ancestor_of_HEAD=yes; else echo release_commit_ancestor_of_HEAD=no; fi; git -C repos/bitcoin for-each-ref --contains 52248a757b25581339ca6e00cc0da05bfdb04dc8 --format='%(refname) %(objecttype) %(objectname)'
b88bffe550a3a017440aff6a189cdb5f79f9b060
release_commit_ancestor_of_HEAD=no
refs/tags/v0.3.20.2 tag 90b4ed72f86e1d7f6196f9f9be0911a79f9cbb09
```

```
$ git -C repos/bitcoin log HEAD -1 --format='%H %aI %an <%ae> %s' --grep='^Make send/receive limits bigger'; for oid in 52248a757b25581339ca6e00cc0da05bfdb04dc8 f36b494aebcfe4cc6a45003520ee7d15eeaba8df; do git -C repos/bitcoin show "$oid" | git patch-id --stable; done
f36b494aebcfe4cc6a45003520ee7d15eeaba8df 2011-03-03T16:25:05-05:00 Gavin Andresen <gavinandresen@gmail.com> Make send/receive limits bigger (10MB each)
7c1460fdc434ba2240ad13a495979de13ae9670e 52248a757b25581339ca6e00cc0da05bfdb04dc8
7c1460fdc434ba2240ad13a495979de13ae9670e f36b494aebcfe4cc6a45003520ee7d15eeaba8df
```

```
$ git -C repos/bitcoin show --format= --unified=2 52248a757b25581339ca6e00cc0da05bfdb04dc8 -- net.cpp
diff --git a/net.cpp b/net.cpp
index 0ba147bf75..d18b63eb5f 100644
--- a/net.cpp
+++ b/net.cpp
@@ -742,5 +742,5 @@ void ThreadSocketHandler2(void* parg)
                     unsigned int nPos = vRecv.size();
 
-                    if (nPos > 1000*GetArg("-maxreceivebuffer", 2*1000)) {
+                    if (nPos > 1000*GetArg("-maxreceivebuffer", 10*1000)) {
                         if (!pnode->fDisconnect)
                             printf("socket recv flood control disconnect (%d bytes)\n", vRecv.size());
@@ -807,5 +807,5 @@ void ThreadSocketHandler2(void* parg)
                             }
                         }
-                        if (vSend.size() > 1000*GetArg("-maxsendbuffer", 256)) {
+                        if (vSend.size() > 1000*GetArg("-maxsendbuffer", 10*1000)) {
                             if (!pnode->fDisconnect)
                                 printf("socket send flood control disconnect (%d bytes)\n", vSend.size());
```

## R7 — log4j2: three emergency release tag objects, three taggers in eight days
```
$ for tag in rel/2.15.0 rel/2.16.0 rel/2.17.0; do git -C repos/log4j2 for-each-ref --format='%(refname:short) tag=%(objectname) target=%(*objectname) %(taggerdate:iso-strict) %(taggername) %(taggeremail) | %(subject)' "refs/tags/$tag"; git -C repos/log4j2 cat-file -p "refs/tags/$tag" | sed -n '1,6p;/^-----BEGIN PGP SIGNATURE-----$/p'; git -C repos/log4j2 show -s --format='target %H%n%aI %an <%ae>%n%s' "$tag^{}"; done
rel/2.15.0 tag=636ce10d676202b2ea4aa2bab9924a5a8c6dd401 target=c30a1398a6697fb832c650870c44284d0052103e 2021-12-10T23:20:33-07:00 Ralph Goers <rgoers@apache.org> | Release 2.15.0 of Log4j
object c30a1398a6697fb832c650870c44284d0052103e
type commit
tag rel/2.15.0
tagger Ralph Goers <rgoers@apache.org> 1639203633 -0700

Release 2.15.0 of Log4j
-----BEGIN PGP SIGNATURE-----
target c30a1398a6697fb832c650870c44284d0052103e
2021-12-09T11:24:32-07:00 Ralph Goers <rgoers@apache.org>
[maven-release-plugin] prepare release log4j-2.15.0-rc2
rel/2.16.0 tag=70638718e0db900552c062b98956a05409d70058 target=cffe58f6a433ea1ab60ceb129d4c9b3377acda1d 2021-12-13T10:58:39-06:00 Matt Sicker <boards@gmail.com> | Release 2.16.0 of Log4j
object cffe58f6a433ea1ab60ceb129d4c9b3377acda1d
type commit
tag rel/2.16.0
tagger Matt Sicker <boards@gmail.com> 1639414719 -0600

Release 2.16.0 of Log4j
-----BEGIN PGP SIGNATURE-----
target cffe58f6a433ea1ab60ceb129d4c9b3377acda1d
2021-12-12T23:40:13-06:00 Matt Sicker <boards@gmail.com>
[maven-release-plugin] prepare release log4j-2.16.0-rc1
rel/2.17.0 tag=8285c82d998164dccfb2e57889b9dfb73dc27533 target=a19ef9bceeaad862cfc0b50394a7f791d5e17b8c 2021-12-18T09:14:13-05:00 Gary Gregory <garydgregory@gmail.com> | Release tag for 2.17.0
object a19ef9bceeaad862cfc0b50394a7f791d5e17b8c
type commit
tag rel/2.17.0
tagger Gary Gregory <garydgregory@gmail.com> 1639836853 -0500

Release tag for 2.17.0
-----BEGIN PGP SIGNATURE-----
target a19ef9bceeaad862cfc0b50394a7f791d5e17b8c
2021-12-17T18:56:20-07:00 Ralph Goers <rgoers@apache.org>
[maven-release-plugin] prepare release log4j-2.17.0-rc1
```

## R8 — bitcoin: noversion is a signed 2018 policy marker planted on a 2014 commit
```
$ git -C repos/bitcoin rev-parse refs/tags/noversion 'refs/tags/noversion^{}'; git -C repos/bitcoin cat-file -p refs/tags/noversion | sed -n '1,10p;/^-----BEGIN PGP SIGNATURE-----$/p'
8a5c4f445d1588c0a7c30cec929ecf75648b4589
aefbf6e30cadaf77ebee44284c74cc5449dc173f
object aefbf6e30cadaf77ebee44284c74cc5449dc173f
type commit
tag noversion
tagger Wladimir J. van der Laan <laanwj@gmail.com> 1520434590 +0100

dummy tag for commits on master

This is a dummy tag so that `git describe` no longer shows everything
relative to v0.9.0rc2 just because that was the last version to be tagged
on master instead of on a branch.
-----BEGIN PGP SIGNATURE-----
```

```
$ git -C repos/bitcoin show -s --format='%H%n%aI%n%an <%ae>%n%s' aefbf6e30cadaf77ebee44284c74cc5449dc173f; git -C repos/bitcoin describe --tags 'aefbf6e30cadaf77ebee44284c74cc5449dc173f^'; git -C repos/bitcoin describe --tags aefbf6e30cadaf77ebee44284c74cc5449dc173f
aefbf6e30cadaf77ebee44284c74cc5449dc173f
2014-03-03T09:41:18+01:00
Wladimir J. van der Laan <laanwj@gmail.com>
doc: Empty release notes for next release
v0.9.0rc2
noversion
```

## R9 — linux: a merge commit retains a signed mergetag although this clone has no tag refs
```
$ git -C repos/linux show -s --format='%H%n%P%n%aI%n%an <%ae>%n%s' 1200d84f4c0a929a0780180d25063d93773be79c
1200d84f4c0a929a0780180d25063d93773be79c
85cdaca6970028bf6f544c355c90035586836ddf 1304643a1c20badbb91b86a5084dd76cb7620c05
2026-08-18T12:08:13-07:00
Linus Torvalds <torvalds@linux-foundation.org>
Merge tag 'powerpc-7.3-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
```

```
$ git -C repos/linux cat-file commit 1200d84f4c0a929a0780180d25063d93773be79c | awk '/^(mergetag| object | type | tag | tagger | -----BEGIN PGP SIGNATURE-----)/ {print}'; git -C repos/linux rev-parse '1200d84f4c0a929a0780180d25063d93773be79c^2'
mergetag object 1304643a1c20badbb91b86a5084dd76cb7620c05
 type commit
 tag powerpc-7.3-1
 tagger Madhavan Srinivasan <maddy@linux.ibm.com> 1786941438 +0530
 -----BEGIN PGP SIGNATURE-----
1304643a1c20badbb91b86a5084dd76cb7620c05
```

```
$ printf 'tag_refs='; git -C repos/linux for-each-ref refs/tags --format='%(refname)' | wc -l; git -C repos/linux for-each-ref --format='%(refname) %(objecttype) %(objectname)'
tag_refs=0
refs/remotes/origin/master commit 1200d84f4c0a929a0780180d25063d93773be79c
```

## R10 — go: 71,792 reachable commits have no Git signature, and all 491 tags are lightweight
```
$ printf 'all_commits='; git -C repos/go rev-list --all --count; git -C repos/go log --all --format='%G?' | sort | uniq -c; git -C repos/go for-each-ref refs/tags --format='%(objecttype)' | sort | uniq -c; printf 'tag_refs='; git -C repos/go for-each-ref refs/tags --format='%(refname)' | wc -l
all_commits=71792
      3 E
  71789 N
    491 commit
tag_refs=491
```

```
$ git -C repos/go for-each-ref refs/tags/weekly.2009-11-06 refs/tags/go1.27rc3 --format='%(refname:short) %(objecttype) %(objectname) %(creatordate:iso-strict) %(authorname) %(authoremail) | %(subject)'; git -C repos/go tag -v go1.27rc3; echo verify_exit=$?
go1.27rc3 commit 90cf2c38605cf6514cc395c9d94688c1154ffcda 2026-08-13T10:38:53-07:00 Gopher Robot <gobot@golang.org> | [release-branch.go1.27] go1.27rc3
weekly.2009-11-06 commit 9ad14c94db182dd3326e4c80053e0311f47700ce 2009-11-06T10:33:46-08:00 Russ Cox <rsc@golang.org> | expand "this is not just mercurial" section
error: go1.27rc3: cannot verify a non-tag object of type commit.
verify_exit=1
```

## R11 — cpython: tag object 2.0 was made in 2017 for a branch closed in 2011
```
$ git -C repos/cpython cat-file -t 1f73a4e1379223ff2e9a8fbed0a62222b6d0eda5; git -C repos/cpython cat-file -p 1f73a4e1379223ff2e9a8fbed0a62222b6d0eda5 | sed -n '1,6p;/^-----BEGIN PGP SIGNATURE-----$/p'; TZ=Etc/GMT+4 date --date=@1497830728 '+tagger_time=%Y-%m-%dT%H:%M:%S%z'
tag
object 2a9b0a93091b9ef7350a94bb3d3f1c43725b7a8c
type commit
tag 2.0
tagger Ned Deily <nad@python.org> 1497830728 -0400

Final head of the former 2.0 branch
-----BEGIN PGP SIGNATURE-----
tagger_time=2017-06-18T20:05:28-0400
```

```
$ git -C repos/cpython show -s --format='%H%n%aI%n%an <%ae>%n%s' 2a9b0a93091b9ef7350a94bb3d3f1c43725b7a8c; if git -C repos/cpython merge-base --is-ancestor 2a9b0a93091b9ef7350a94bb3d3f1c43725b7a8c af49df919dafc3767ae956767dce0482f9cd6d4e; then echo tag_target_ancestor_of_main=yes; else echo tag_target_ancestor_of_main=no; fi; if git -C repos/cpython show-ref --verify --quiet refs/tags/2.0; then echo 'refs/tags/2.0=present'; else echo 'refs/tags/2.0=absent (tag object retained by object ID)'; fi
2a9b0a93091b9ef7350a94bb3d3f1c43725b7a8c
2011-03-05T14:54:19+01:00
Georg Brandl <georg@python.org>
Close 2.0 branch.
tag_target_ancestor_of_main=no
refs/tags/2.0=absent (tag object retained by object ID)
```

