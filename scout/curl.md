# curl — scout

- **repo:** https://github.com/curl/curl
- **clone:** `~/book16/repos/curl` — 159M working tree, 130M `.git`
- **history span:** 1999-12-29 → 2026-08-18 (author) / 2026-08-19 (committer)
- **commits:** 39,474 on `master` (`git rev-list --count HEAD`); 1,507 authors (`git shortlog -sn HEAD | wc -l`)

First commit on the DAG is not HttpGet 0.1 (1996). It is a CVS dump of curl 6.4-in-progress, dated Wed 29 Dec 1999, twelve days after Daniel Stenberg’s source disk died. Last commit on `HEAD` is Daniel again, author-date 23:58 the night before the scout. Between those poles: 26 years of cookie-replace logic that never left `lib/cookie.c`, a SASL overflow fixed by changing `/2` to `/4`, three years Daniel did not lead, and one contributor whose laptop still thought it was 29 February 2000.

```
git -C ~/book16/repos/curl log --reverse --format='%H %aI %an %s' | head -3
ae1912cb0d494b48d514d937826c9fe83ec96c4d 1999-12-29T14:20:26+00:00 Daniel Stenberg Initial revision
067a75e8957a91fb3407d1112931991998ae9219 2000-01-10T23:29:47+00:00 Daniel Stenberg removed junk files
26e8ccc63151a1c12db709cef4051803afd21189 2000-01-10T23:36:14+00:00 Daniel Stenberg syncing with local edit

git -C ~/book16/repos/curl log -1 --format='%H %aI %cI %an %s'
695aa15743685a9d46c4c41bb9c95221d4659541 2026-08-18T23:58:16+02:00 2026-08-19T07:49:55+02:00 Daniel Stenberg urldata: remove the aptr struct

git -C ~/book16/repos/curl rev-list --count HEAD
39474
```

Daniel Stenberg: 20,633 commits, 52.27% of `HEAD`. He led 22 of 28 calendar years. He did not lead 2008–2009 (Yang Tse), 2013–2014 (Steve Holme), or 2025–2026 (Viktor Szakats).

---

## 1. Day one is a recovery, not a birth

- **find-type:** 3 (first commit / what day one shows) and 2 (imported-history boundary)
- **hash:** `ae1912cb0d494b48d514d937826c9fe83ec96c4d`
- **date:** Wed 1999-12-29 14:20:26 +0000 (author = committer)
- **author:** Daniel Stenberg `<daniel@haxx.se>`
- **message:** `Initial revision`

```
git -C ~/book16/repos/curl show --shortstat --format=fuller ae1912cb0d494b48d514d937826c9fe83ec96c4d
AuthorDate: Wed Dec 29 14:20:26 1999 +0000
    Initial revision
 144 files changed, 37273 insertions(+)

git -C ~/book16/repos/curl show --stat ae1912cb0d -- curl-6.3.1.tar.gz
 curl-6.3.1.tar.gz | Bin 0 -> 242680 bytes
```

The tree is a working copy, not a seed. It ships `configure`, `config.cache`, `config.log`, `config.status`, generated `Makefile`s, three hand patches, and a 242,680-byte `curl-6.3.1.tar.gz` of the previous release. `CHANGES` inside the same commit is already 1,656 lines and ends at Rafael Sagula’s HttpGet 1.0:

```
git -C ~/book16/repos/curl show ae1912cb0d:CHANGES | tail -12
Version 1.1
 Daniel Stenberg <Daniel.Stenberg@sth.frontec.se>
 - Adjusted it slightly to accept named hosts on the command line. We
   wouldn't wanna use IP numbers for the rest of our lifes, would we?

Version 1.0
  Rafael Sagula <sagula@inf.ufrgs.br>
  - Wrote the initial httpget, which started all this!
```

A month earlier, in the same file, Daniel had already written the reason the git DAG cannot start in 1996:

```
git -C ~/book16/repos/curl show ae1912cb0d:CHANGES | grep -n -A3 'disk crash'
48: - I've had this major disk crash. My good old trust-worthy source disk died
49-   along with the machine that hosted it. Thank goodness most of all the
50-   things I've done are either backed up elsewhere or stored in this CVS
51-   server!
```

**Why it is a story.** On 23 November 1999 the machine that held the sources died. What survived was whatever had already been pushed to CVS, plus a tarball. Five weeks later that salvage is committed as “Initial revision.” The reader who stops at `git log --reverse | head` will date curl to late 1999. The reader who opens `CHANGES` in that same blob will find November 1996, a Brazilian student, an IRC currency bot, HttpGet → urlget → curl, and a license flip from GPL to MPL that predates the DAG. The history did not start here. The *backup* did.

**What the reader learns.** An “Initial revision” after a crash is an import boundary, not a birth certificate. Look for tarballs, `config.cache`, and a changelog that is older than the commit. The missing years are often sitting in a text file the first commit already contains. `git log` cannot show what a disk took.

**surprise:** 4

---

## 2. Twelve nights later, undo the import

- **find-type:** 8 (rollback of the world)
- **hashes:** `067a75e8957a91fb3407d1112931991998ae9219` then `c8d64b8ac2880d1091e211ae9ddf66c80d3e9add`
- **dates:** 2000-01-10 23:29:47 +0000; 2000-01-16 18:54:11 +0000
- **author:** Daniel Stenberg
- **messages:** `removed junk files` / `I removed the Makefile. Since it is generated, it always gets changed and I don't want to keep commiting it!`

```
git -C ~/book16/repos/curl show --stat --format='%h %aI %s' 067a75e8957a91fb3407d1112931991998ae9219
067a75e895 2000-01-10T23:29:47+00:00 removed junk files
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

Seven commits land between 23:29 and 23:57 that same night (`removed junk files`, `syncing with local edit`, `Cleaning up`, `cleanup`, `fixes`, `more removals`, `removed generated files`). Six days later the generated `lib/Makefile` goes too, with a commit message that is already a style guide.

**Why it is a story.** The first commit was “get it into the server before another disk dies.” The second week is the moment someone sits down, looks at what the salvage contained, and starts deleting. The tarball of the previous release, the configure cache from one machine, the BeOS patch — all of it was a life-raft, then immediately ballast. The outcome is not known at 23:29: he is not founding a 27-year project. He is cleaning a checkout so `cvs commit` will shut up.

**What the reader learns.** Import commits hoard generated files because the importer is scared. The next week’s deletes are the real `.gitignore`. A 28-minute burst of “cleanup” / “fixes” / “more removals” is the tell that day one was a dump, not a design.

**surprise:** 3

---

## 3. One character: `/2` becomes `/4`, CVE-2018-16839

- **find-type:** 1 (tiny diff, huge blast radius)
- **hash:** `f3a24d7916b9173c69a3e0ee790102993833d6c5`
- **date:** author 2018-09-28 16:08:16 +0200; committer 2018-10-29 08:05:23 +0100
- **author:** Daniel Stenberg
- **message:** `Curl_auth_create_plain_message: fix too-large-input-check` / `CVE-2018-16839` / `Reported-by: Harry Sintonen`

```
git -C ~/book16/repos/curl show --format=fuller --stat f3a24d7916b9173c69a3e0ee790102993833d6c5
AuthorDate: Fri Sep 28 16:08:16 2018 +0200
CommitDate: Mon Oct 29 08:05:23 2018 +0100
    Curl_auth_create_plain_message: fix too-large-input-check
    CVE-2018-16839
    Reported-by: Harry Sintonen
 lib/vauth/cleartext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

git -C ~/book16/repos/curl show --format='' f3a24d79 -- lib/vauth/cleartext.c
-  if((ulen > SIZE_T_MAX/2) || (plen > (SIZE_T_MAX/2 - 2)))
+  if((ulen > SIZE_T_MAX/4) || (plen > (SIZE_T_MAX/2 - 2)))
     return CURLE_OUT_OF_MEMORY;
   plainlen = 2 * ulen + plen + 2;
```

The SASL PLAIN buffer is `2 * ulen + plen + 2`. The overflow guard divided by two. One digit was wrong. A month of embargo sits between author date and commit date.

Close cousins, same shape:

```
# CVE-2015-3144 — empty host, index -1. Reported-by: Hanno Böck
git -C ~/book16/repos/curl show --format='' 0583e87ada7a3cfb10904ae4ab61b339582c5bd3 -- lib/url.c
-  if(host->name[len-1] == '.')
+  if(len && (host->name[len-1] == '.'))

# CVE-2016-5420 — one added predicate. Connection reuse ignores client cert.
git -C ~/book16/repos/curl show --format='' 11ec5ad4352bba384404c56e77c7fab9382fd22d -- lib/vtls/vtls.c
+     safe_strequal(data->clientcert, needle->clientcert) &&
```

**Why it is a story.** Someone already wrote the overflow check. It compiled. Tests with short usernames passed. The moment before the outcome is a reviewer staring at `SIZE_T_MAX/2` and nodding — “yes, we thought about overflow.” Harry Sintonen read the *next* line, `plainlen = 2 * ulen + …`, and the 2 in the denominator was the wrong 2. The embargo month is the project sitting on a one-character patch while every downstream still ships the 2.

**What the reader learns.** The dangerous check is the one that is almost right. `git log --grep=CVE --pretty=%H` piped through `git show --numstat` surfaces the one-line security commits; the blast radius is not in the diff, it is in the advisory. A guard that uses a different constant than the allocation is a finding, not a style nit.

**surprise:** 4

---

## 4. A leap-day in 2000, committed in 2012

- **find-type:** 2 (planted / dated / faked artifact)
- **hash:** `dd18e714ff23d60ad43c524e290ab3e3093ba259`
- **author date:** Tue 2000-02-29 16:49:47 +0200
- **commit date:** Mon 2012-04-23 20:24:15 +0200
- **author:** Gokhan Sengun `<gokhansengun@gmail.com>`
- **committer:** Daniel Stenberg
- **message:** `OpenSSL cert: provide more details when cert check fails`

```
git -C ~/book16/repos/curl log -1 --format=fuller dd18e714ff23d60ad43c524e290ab3e3093ba259
Author:     Gokhan Sengun <gokhansengun@gmail.com>
AuthorDate: Tue Feb 29 16:49:47 2000 +0200
Commit:     Daniel Stenberg <daniel@haxx.se>
CommitDate: Mon Apr 23 20:24:15 2012 +0200
    OpenSSL cert: provide more details when cert check fails
```

February 29, 2000 was a real Tuesday (2000 was a leap year). Gokhan’s other commits in the same era are dated 2011–2012. This is the only commit on the entire DAG whose author year is 2000 and whose author is not Daniel. It is also the only year-2000 commit that is not Daniel — the “710 vs 709” wrinkle in a per-year `shortlog`.

```
git -C ~/book16/repos/curl log --format='%ad %an' --date=format:'%Y' \
  | awk '$1==2000{c[$2" "$3]++} END{for(a in c) print c[a], a}'
709 Daniel Stenberg
1 Gokhan Sengun
```

**Why it is a story.** A contributor finishes a useful OpenSSL diagnostic, commits locally, and the laptop clock says 29 February 2000. Daniel applies the patch in April 2012 and git faithfully stores both timestamps. For fourteen years `git log --since=1999 --until=2001` has contained a lie: one extra author, one extra year-2000 commit, a leap day that belongs to a different century of the project. Nobody faked it. A clock did.

**What the reader learns.** Author date is a claim about a laptop, not about history. `git log --format='%aI %cI'` on outliers (year gaps ≥ 5) is how you find clocks, delayed patch application, and cherry-picks. Never count “authors in year Y” from author date alone.

**surprise:** 5

---

## 5. Three years Daniel did not lead

- **find-type:** 4 (name that appears / disappears)
- **hashes:** Yang Tse first `93d59520e4` (2005-12-08), last `59224a31fd` (2013-08-07); Steve Holme first `5ed17de326` (2011-08-09), last `aea8ac14df` (2022-06-08); Viktor Szakats first `82b8b6865c` (2014-09-11)
- **dates / authors:** see yearly table

```
# per-year leader (author-date year)
git -C ~/book16/repos/curl log --format='%ad %an' --date=format:'%Y' | awk '
{ y=$1; $1=""; sub(/^ /,""); a=$0; c[y][a]++ }
END {
  for (y in c) {
    max=0; lead=""
    for (a in c[y]) if (c[y][a]>max) { max=c[y][a]; lead=a }
    print y, lead, max, "daniel=" c[y]["Daniel Stenberg"]+0
  }
}' | sort
```

| year | leader (commits) | Daniel |
|------|------------------|--------|
| 1999–2007 | Daniel Stenberg | 41–100% |
| **2008** | **Yang Tse (649)** | 563 |
| **2009** | **Yang Tse (492)** | 433 |
| 2010–2012 | Daniel | 28–46% |
| **2013** | **Steve Holme (664)** | 360 |
| **2014** | **Steve Holme (664)** | 516 |
| 2015–2024 | Daniel | 36–60% |
| **2025** | **Viktor Szakats (1352)** | 1186 |
| **2026** | **Viktor Szakats (888)** | 633 |

Yang Tse’s 2008 subjects are configure probes, `inet_pton` runtime checks, libssh2 ifdefs, 80-column wraps — the unglamorous portability work that lets a C project survive. His last commit is `packages/vms/Makefile.am: add latest file additions to EXTRA_DIST`. No farewell. Steve Holme arrives via NTLM tidy-up and owns the SASL/protocol years. Viktor arrives in 2014 converting tabs in `mk-ca-bundle.pl` and, a decade later, outpaces Daniel.

Lifetime: Daniel 20,633; Viktor 3,312; Yang Tse 2,587; Steve Holme 1,916. Daniel is 52.27% of 39,474 — a majority, not a monopoly.

**Why it is a story.** The folklore is “curl is Daniel.” The shortlog says he lost the year three separate times, to three different people, for two years each, and that the third of those people is winning *now*. The moment before each handover is invisible: Yang Tse does not announce a campaign; he lands 649 configure fixes while Daniel is merely the second-most-prolific committer. The moment after is equally quiet. Yang Tse’s name simply stops.

**What the reader learns.** `git shortlog -sn` over the whole repo hides the handovers. Window it. Names that lead a year and then vanish are the maintainers who kept the build alive, and their last commit is almost never a speech. A 52% founder after 27 years is the opposite of a bus-factor horror story — and still not “one man.”

**surprise:** 4

---

## 6. `struct lifreq`: a TODO that outlived Solaris’s claim

- **find-type:** 5 (comment/TODO that outlived its code)
- **hash (origin):** `0d2cdd9773aa6f0beda5cbcd43bdc21b9d0e753b`
- **date:** Fri 2004-10-08 09:57:33 +0000
- **author:** Daniel Stenberg
- **message:** `Use 'struct lifreq' and SIOCGLIFADDR`

```
git -C ~/book16/repos/curl show --format=fuller -- docs/TODO 0d2cdd9773aa6f0beda5cbcd43bdc21b9d0e753b
AuthorDate: Fri Oct 8 09:57:33 2004 +0000
    Use 'struct lifreq' and SIOCGLIFADDR
+ * Use 'struct lifreq' and SIOCGLIFADDR instead of 'struct ifreq' and
+   SIOCGIFADDR on newer Solaris versions as they claim the latter is obsolete.
```

It is still the first libcurl item in `docs/TODO.md` on HEAD (reformatted, not done, 2025-12-08 markdown conversion `3dd1ffdeb0`):

```
git -C ~/book16/repos/curl log -S 'struct lifreq' --format='%h %as %s' -- docs/TODO.md docs/TODO TODO
3dd1ffdeb0 2025-12-08 FAQ/TODO/KNOWN_BUGS: convert to markdown
41d8186c7e 2007-12-08 reformat to FAQ/CONTRIBUTE style...
0d2cdd9773 2004-10-08 Use 'struct lifreq' and SIOCGLIFADDR
```

The 1999 root `TODO` (in the first commit) wanted `rtsp://`, gzip Content-Encoding, HTTP pipelining, Digest auth, SOCKS, IPv6. Those shipped. The item that *stuck* is a Solaris ioctl alias added five years later.

**Why it is a story.** In 2004 someone — probably on Solaris — said the old ioctl was obsolete. Daniel wrote it down in nine words. Twenty-one years, a file move, a style reformat, and a markdown conversion later, the same sentence is still item one. The code it would replace (`SIOCGIFADDR` / `struct ifreq`) is still the code. The moment before the outcome is a note made so it would not be forgotten. Forgetting it was not the failure. Never needing it enough was.

**What the reader learns.** The oldest still-open TODO is rarely the most important leftover. It is the one that is true, small, and never quite worth a weekend. `git log -S 'exact heading' -- docs/TODO` is how you date a wish. If the only later hits are reformats, it is a fossil, not a plan.

**surprise:** 3

---

## 7. Pipelining: wished in 1999, built in 2006, killed with a bitmask, excised in 2019

- **find-type:** 7 (feature that became the vulnerability / the liability) and 8
- **hashes:** TODO in `ae1912cb0d` (1999); land `b7eeb6e67fca686f840eacd6b8394edb58b07482` (2006-09-07); deprecate `f7208df7d9d5cd5e15e2d89237e828f32b63f135` (2018-09-05); remove `2f44e94efb3df8e50bb2ddbc4ec6b569a6424517` (2019-04-05)
- **author:** Daniel Stenberg (all four)

The 1999 TODO still talks about `urlget()`:

```
git -C ~/book16/repos/curl show ae1912cb0d:TODO | grep -A6 'pipelining'
 * HTTP Pipelining/persistant connections
 - I'm gonna introduce HTTP "pipelining". Curl should be able
   to request for several HTTP documents in one connect.
...
   This will require that the urlget() function supports several
   documents from a single HTTP server, which it doesn't today.
```

Seven years later it lands as a “major overhaul” (ftp.c ±726, multi.c +431). Twelve years after *that*, deprecation is one bitwise AND. The commit message says the revert is one line:

```
git -C ~/book16/repos/curl show f7208df7d9 -- lib/multi.c
   case CURLMOPT_PIPELINING:
-    multi->pipelining = va_arg(param, long);
+    multi->pipelining = va_arg(param, long) & CURLPIPE_MULTIPLEX;
```

Seven months later the body is gone:

```
git -C ~/book16/repos/curl show --stat --format='%h %as %s' 2f44e94efb
2f44e94efb 2019-04-05 pipelining: removed
 lib/pipeline.c | 404 ---------------------
 lib/url.c      | 283 +++------------
 28 files changed, 183 insertions(+), 1394 deletions(-)
```

**Why it is a story.** In 1999 pipelining is how you imagine site mirroring. In 2006 it is how you catch browsers. By 2016 it is a pile of `KNOWN_BUGS` and a thing you must *not* mix with POST, HTTP/2, or a connection about to close. The 2018 bitmask does not delete the dream; it makes the option keep returning `OK` while ignoring the HTTP/1 bit — a polite lie to existing `setopt` callers. The 2019 deletion is the honest one. The moment before the outcome is a 1999 author writing “I’m gonna introduce HTTP pipelining” with no idea that the feature’s last act will be a mask that throws it away.

**What the reader learns.** A TODO that ships is not a success until you watch it die. Features that interact with connection reuse accumulate CVEs and special cases until the cheapest fix is to stop offering them. Search `git log --grep=pipelin` across twenty years and you will see the life cycle: wish, land, flail, deprecate-in-place, delete.

**surprise:** 3

---

## 8. The cookie-replace skeleton is still the first commit

- **find-type:** 5 (comment/code that outlived its surroundings)
- **hash:** `ae1912cb0d` (still blamed on HEAD)
- **date:** 1999-12-29
- **author:** Daniel Stenberg

```
git -C ~/book16/repos/curl blame --date=iso -L 882,945 lib/cookie.c
9919149aef6 (Daniel Stenberg   2024-11-06 ...)     if(!strcmp(clist->name, co->name)) {
^ae1912cb0d (Daniel Stenberg   1999-12-29 14:20:26 +0000 883)       /* the names are identical */
...
^ae1912cb0d (Daniel Stenberg   1999-12-29 14:20:26 +0000 928)       if(clist->domain && co->domain) {
...
^ae1912cb0d (Daniel Stenberg   1999-12-29 14:20:26 +0000 933)       }
^ae1912cb0d (Daniel Stenberg   1999-12-29 14:20:26 +0000 934)       else if(!clist->domain && !co->domain)
^ae1912cb0d (Daniel Stenberg   1999-12-29 14:20:26 +0000 935)         replace_old = TRUE;
^ae1912cb0d (Daniel Stenberg   1999-12-29 14:20:26 +0000 937)       if(replace_old) {
^ae1912cb0d (Daniel Stenberg   1999-12-29 14:20:26 +0000 938)         /* the domains were identical */
```

Same comment, same empty-domain else-if, same “the domains were identical,” twenty-six years on. Wrapped around it now: Harry Sintonen’s 2022 overlay protection (a non-secure cookie must not hide a secure one), Viktor’s `curl_strequal`, 2025 `DEBUGASSERT`s. `include/curl/curl.h` still carries 82 lines from the same first commit, including the comments that document the CURLOPT enum: “The full URL to get/put”, “Set cookie in request:”, “name of the file keeping your private SSL-certificate”, “User-Agent string (examined by some CGIs)”.

`lib/url.c` on HEAD still blames 26 lines on `^ae1912cb0d` — almost all `#include`s, braces, and the ASCII logo. The cookie file is where 1999 still *decides* something.

**Why it is a story.** Cookie replacement is the first thing you write once cookies exist: same name, same domain, replace. That decision never left. Everything that made cookies a CVE class — tail-match, secure-overlay, path prefix — grew *around* those eight lines. The moment before the outcome is 1999 Daniel writing two comments that later authors treated as load-bearing. They were. The 2022 security fix does not delete “the names are identical”; it adds a second, stricter paragraph underneath.

**What the reader learns.** `git blame` on a 26-year-old file will show you includes and it will show you law. The law is the comment that later security patches refuse to touch. Read the 1999 lines next to the 2022 lines: that is how a project accumulates correctness without being able to start over.

**surprise:** 4

---

## 9. Names in the changelog, before `Reported-by:` existed

- **find-type:** 4 (name that appears) — the credit culture, from first blob to trailer
- **hashes:** first commit `CHANGES`; first trailer `614bae813e0adf472a5c3d20abf98646a1b24dbf` (2010-06-18)
- **author:** Daniel Stenberg
- **message (2010):** `smtp: fixed a few uses of size_t that seemed to believe it was signed` / `Reported-by: Steven M. Schweda`

The first commit’s `CHANGES` already thanks by name and address:

```
git -C ~/book16/repos/curl show ae1912cb0d:CHANGES | grep -E 'pointed out|reported by|brought' | head -6
   in the saved data. Correctfully identified and reported by Paul Harrington
 - A small --stderr bug was reported by Eetu Ojanen <esojanen@jyu.fi>...
 - Michael S. Steuer <michael@steuer.com> pointed out a bug in the -F handling
 - Jason Baietto <jason@durians.com> pointed out a general flaw in the HTTP
 - Paul Harrington <paul@pizza.org> pointed out that the -m/--max-time option
 - Jongki Suwandi <Jongki.Suwandi@eng.sun.com> brought a nice patch for
```

Early commits do the same in the message body (`Oskar Liljeblad pointed out and corrected…`, `Ellis Pritchard made it work for MacOS X`). The `Reported-by:` trailer arrives 2010; by HEAD there are 2,754 commits carrying it.

```
git -C ~/book16/repos/curl log --grep='Reported-by' --oneline | wc -l
2754
```

The name that started the whole thing is written down twice: in `CHANGES` Version 1.0 (1999 blob), and again in March 2026, when the HISTORY file is updated.

```
git -C ~/book16/repos/curl show 99bd5ed97b455995a81420cb94f444cdb7b27e3a -- docs/HISTORY.md
    HISTORY: mention that Rafael passed away much too early
+June 26: Rafael Sagula, author of the original httpget tool in 1996 died.
```

**Why it is a story.** Before git, before GitHub, before trailers, the project’s idea of a commit message is a letter that names the person who wrote in. Paul Harrington of pizza.org, Eetu at jyu.fi, Oskar at hem.passagen.se — they are not contributors in `shortlog` and they are the reason the code moved. The 2010 trailer standardizes what 1999 already believed. The 2026 HISTORY line is the other end of the same habit: Rafael never had a commit on this DAG, and the file still will not let him become a footnote.

**What the reader learns.** Credit leaves more archaeology than code. `grep pointed out` on the first changelog, then `git log --grep=Reported-by`, is a census of people `shortlog -sn` will never show. A project that names bug reporters in 1999 and still names them in 2026 is deciding, every time, that the trace is part of the work.

**surprise:** 2

---

## 10. Twenty-three hundred hours, and almost no 2 a.m.

- **find-type:** 2 (timestamps)
- **hash (sample):** `695aa15743` — last commit on HEAD, authored 23:58
- **author:** Daniel Stenberg

```
git -C ~/book16/repos/curl log --format='%ad' --date=format:'%H' --author='Daniel Stenberg' \
  | sort | uniq -c
    717 00
     61 01
      3 02
      7 03
      6 04
    ...
   1992 23
```

Daniel’s author-hour histogram is a commute: a morning block 08–11 (1,546 / 1,672 / 1,466 / 1,624), a dip after dinner, then the real peak at 22–00 (1,358 / **1,992** / 717). Hours 02–04 together are 16 commits in 27 years. He does ship on Christmas and New Year’s (`2025-12-25T23:17` `ftp: return better on OOM`; a pile of 2026-01-01 commits). The latest commit on `HEAD` is 23:58.

**Why it is a story.** The folklore of the lone night-owl maintainer is half right. He is a late-evening maintainer who almost never sees 2 a.m. The histogram is a life: Swedish mornings, a family-shaped hole at 19:00, then the second shift. The 23:58 `urldata: remove the aptr struct` is not a dramatic all-nighter. It is the same hour he has been using since the 1990s.

**What the reader learns.** `git log --date=format:'%H'` by author is a biography the mailing list will not give you. A 2 a.m. hole is as informative as a 2 a.m. spike. If you are reading “odd hours” for planted artifacts, Daniel’s 23:00 is the opposite of odd — it is the project’s wristwatch.

**surprise:** 3

---

## Ranked top-3

1. **Day one is a recovery** (`ae1912cb0d`, 1999-12-29) — tarball, `config.cache`, a CHANGES that opens in 1996, and a disk-crash note from five weeks earlier. The DAG starts when the backup does.
2. **`SIZE_T_MAX/2` → `/4`** (`f3a24d79`, CVE-2018-16839) — one digit, one month of embargo, a check that was already there and still wrong. The empty-host `len &&` and the one-line client-cert reuse check sit in the same drawer.
3. **The leap-day laptop** (`dd18e714`, author 2000-02-29 / commit 2012-04-23) — the only non-Daniel “year 2000” commit is a clock twelve years late. Author date is not history.

**Disappointing:** The 26 `lib/url.c` lines still blamed on 1999 are `#include`s, braces, and the ASCII logo — the brief’s suggested file survived as furniture, not as a secret. Yang Tse, who actually beat Daniel for two years, exits in 2013 on a VMS `Makefile.am` with no goodbye.
