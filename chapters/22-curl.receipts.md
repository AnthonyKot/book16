# Receipts — source 22 curl (a recovery, then one maintainer across decades)

Verbatim outputs against the curl/curl clone, pinned at `695aa15743685a9d46c4c41bb9c95221d4659541`.
Regenerate with `scripts/receipts-22.sh`. Long outputs are selected or truncated by the commands shown.

## R1 — the Git root: 29 December 1999, "Initial revision", and already 37,273 lines
```
$ git -C repos/curl rev-list --max-parents=0 695aa15743685a9d46c4c41bb9c95221d4659541
ae1912cb0d494b48d514d937826c9fe83ec96c4d
```

```
$ git -C repos/curl show --shortstat --format='%H%nAuthorDate: %aI%nCommitDate: %cI%nAuthor: %an <%ae>%nSubject: %s' ae1912cb0d494b48d514d937826c9fe83ec96c4d
ae1912cb0d494b48d514d937826c9fe83ec96c4d
AuthorDate: 1999-12-29T14:20:26+00:00
CommitDate: 1999-12-29T14:20:26+00:00
Author: Daniel Stenberg <daniel@haxx.se>
Subject: Initial revision

 144 files changed, 37273 insertions(+)
```

## R2 — the root is a working recovery tree: cache, logs, patches, a prior tarball, and a built executable
```
$ git -C repos/curl ls-tree -r --long ae1912cb0d494b48d514d937826c9fe83ec96c4d | awk '$5=="CHANGES" || $5=="Makefile" || $5=="config.cache" || $5=="config.log" || $5=="config.status" || $5=="curl-6.3.1.tar.gz" || $5=="src/curl" || $5 ~ /^curl.*patch$/'
100644 blob 34cc7bf83ce0739690cee6e5fab993d7acb685d9   72928	CHANGES
100644 blob 0eaf99620d26bd02992030c4382f71e16af72b7d   12983	Makefile
100644 blob ba8353a0d1c15691912bff0769341cc08866f2a8    4548	config.cache
100644 blob ac13614e42bc5ec48a804e41635c876ba4969e1c    3858	config.log
100755 blob 8c3de4b68fa32c94f7c8a4ea91fe9f000eb20b0d   20162	config.status
100644 blob 38bba51aa8910f0d41d755f44a007753df656eb0  242680	curl-6.3.1.tar.gz
100644 blob 25a1b3b60c7861ca33acca5ec01c72a6358c7185   19010	curl.beos-patch
100644 blob 242e308f9f25c6b3e7d2de4521e69ec2d70446cc   36246	curl_631_general.patch
100644 blob 03738dbc037c1ff723ef4fe469e402bda88c70a7    2328	curl_63_form.patch
100644 blob 9df65e232bb489e07de21815f07975d429441eb0    3051	curl_63_partialdl.patch
100755 blob cba40a4c0c9a3d5d2992840616c9f4f7d8af9340 1830293	src/curl
```

## R3 — what the root CHANGES literally opens with: curl 6.4 in December 1999
```
$ git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | sed -n '1,25p'
                                  _   _ ____  _     
                              ___| | | |  _ \| |    
                             / __| | | | |_) | |    
                            | (__| |_| |  _ <| |___ 
                             \___|\___/|_| \_\_____|

                               History of Changes


Version 6.4

Daniel (28 December 1999):
 - Tim Verhoeven <dj@walhalla.sin.khk.be> correctly identified that curl
   doesn't support URL formatted file names when getting ftp. Now, there's a
   problem with getting very weird file names off FTP servers. RFC 959 defines
   that the file name syntax to use should be the same as in the native OS of
   the server. Since we don't know the peer server system we currently just
   translate the URL syntax into plain letters. It is still better and with
   the solaris 2.6-supplied ftp server it works with spaces in the file names.

Daniel (27 December 1999):
 - When curl parsed cookies straight off a remote site, it corrupted the input
   data, which, if the downloaded headers were stored made very odd characters
   in the saved data. Correctfully identified and reported by Paul Harrington
   <paul@pizza.org>.
```

## R4 — five weeks before the root: the crash and the CVS copy, in the root's own CHANGES
```
$ git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | sed -n '43,52p'
   different directories than the sources.

Version 6.3.1

Daniel (23 November 1999):
 - I've had this major disk crash. My good old trust-worthy source disk died
   along with the machine that hosted it. Thank goodness most of all the
   things I've done are either backed up elsewhere or stored in this CVS
   server!

```

## R5 — behind the DAG: the root CHANGES ends at HttpGet 1.0; repository history dates it to 1996
```
$ git -C repos/curl show ae1912cb0d494b48d514d937826c9fe83ec96c4d:CHANGES | tail -12
 - Implemented URLs (and skipped the old syntax).
 - Output is written to stdout, so to achieve the above example, do:
   httpget http://143.54.10.6/info_logo.gif > test.gif

Version 1.1
 Daniel Stenberg <Daniel.Stenberg@sth.frontec.se>
 - Adjusted it slightly to accept named hosts on the command line. We
   wouldn't wanna use IP numbers for the rest of our lifes, would we?

Version 1.0
  Rafael Sagula <sagula@inf.ufrgs.br>
  - Wrote the initial httpget, which started all this!
```

```
$ git -C repos/curl show 695aa15743685a9d46c4c41bb9c95221d4659541:docs/HISTORY.md | sed -n '15,24p'
## 1996

On November 11, 1996 the Brazilian developer Rafael Sagula wrote and released
HttpGet version 0.1.

Daniel extended this existing command-line open-source tool. After a few minor
adjustments, it did what he needed. The first release with Daniel's additions
was 0.2, released on December 17, 1996. Daniel quickly became the new
maintainer of the project.

```

## R6 — twelve days later, the recovery ballast is deleted as "junk files"
```
$ git -C repos/curl show --format='%H%n%aI%n%an <%ae>%n%s' --stat 067a75e8957a91fb3407d1112931991998ae9219
067a75e8957a91fb3407d1112931991998ae9219
2000-01-10T23:29:47+00:00
Daniel Stenberg <daniel@haxx.se>
removed junk files

 config.cache            |   86 ----
 config.h                |  220 ---------
 config.log              |   90 ----
 config.status           |  492 ------------------
 curl-6.3.1.tar.gz       |  Bin 242680 -> 0 bytes
 curl.beos-patch         |  695 --------------------------
 curl_631_general.patch  | 1265 -----------------------------------------------
 curl_63_form.patch      |   92 ----
 curl_63_partialdl.patch |  106 ----
 9 files changed, 3046 deletions(-)
```

## R7 — lifetime scale at the pinned tip: 39,474 commits, 1,507 mailmapped authors, Daniel first
```
$ printf 'commits '; git -C repos/curl rev-list --count 695aa15743685a9d46c4c41bb9c95221d4659541; printf 'mailmapped authors '; git -C repos/curl shortlog -sn 695aa15743685a9d46c4c41bb9c95221d4659541 | wc -l
commits 39474
mailmapped authors 1507
```

```
$ git -C repos/curl shortlog -sn 695aa15743685a9d46c4c41bb9c95221d4659541 | head -10
 20578	Daniel Stenberg
  3311	Viktor Szakats
  2587	Yang Tse
  1916	Steve Holme
  1463	Dan Fandrich
  1145	Stefan Eissing
   784	Jay Satiro
   662	Guenter Knauf
   498	Gisle Vanem
   461	Marc Hoersken
```

## R8 — Daniel Stenberg's authored endpoints: the root in 1999 and the pinned tip in 2026
```
$ git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp --reverse --format='%H %aI %cI %an <%ae> %s' 695aa15743685a9d46c4c41bb9c95221d4659541 | head -1
ae1912cb0d494b48d514d937826c9fe83ec96c4d 1999-12-29T14:20:26+00:00 1999-12-29T14:20:26+00:00 Daniel Stenberg <daniel@haxx.se> Initial revision
```

```
$ git -C repos/curl log --author='^Daniel Stenberg <' --perl-regexp --format='%H %aI %cI %an <%ae> %s' 695aa15743685a9d46c4c41bb9c95221d4659541 | head -1
695aa15743685a9d46c4c41bb9c95221d4659541 2026-08-18T23:58:16+02:00 2026-08-19T07:49:55+02:00 Daniel Stenberg <daniel@haxx.se> urldata: remove the aptr struct
```

## R9 — top five authors by author-date decade: Daniel leads each decade in the clone
```
$ git -C repos/curl log --use-mailmap --format='%ad%x09%aN' --date=format:'%Y' 695aa15743685a9d46c4c41bb9c95221d4659541 | awk -F '\t' '$1 ~ /^[0-9][0-9][0-9][0-9]$/ { decade=int($1/10)*10; count[decade SUBSEP $2]++ } END { for (key in count) { split(key, part, SUBSEP); print part[1], count[key], part[2] } }' | sort -k1,1n -k2,2nr -k3,3 | awk '$1 != decade {decade=$1; rank=0} rank++ < 5 {print}'
1990 1 Daniel Stenberg
2000 9055 Daniel Stenberg
2000 1679 Yang Tse
2000 657 Dan Fandrich
2000 415 Gisle Vanem
2000 409 Guenter Knauf
2010 5289 Daniel Stenberg
2010 1865 Steve Holme
2010 908 Yang Tse
2010 435 Dan Fandrich
2010 393 Jay Satiro
2020 6233 Daniel Stenberg
2020 3228 Viktor Szakats
2020 1145 Stefan Eissing
2020 391 Jay Satiro
2020 371 Dan Fandrich
```

## R10 — not a monopoly: the six author-date years when another contributor led
```
$ git -C repos/curl log --use-mailmap --format='%ad%x09%aN' --date=format:'%Y' 695aa15743685a9d46c4c41bb9c95221d4659541 | awk -F '\t' '{count[$1 SUBSEP $2]++; years[$1]=1} END {for (year in years) {max=0; leader=""; for (key in count) {split(key, part, SUBSEP); if (part[1]==year && (count[key]>max || (count[key]==max && part[2]<leader))) {max=count[key]; leader=part[2]}} if (leader != "Daniel Stenberg") print year, max, leader}}' | sort -n
2008 649 Yang Tse
2009 492 Yang Tse
2013 664 Steve Holme
2014 664 Steve Holme
2025 1352 Viktor Szakats
2026 888 Viktor Szakats
```

