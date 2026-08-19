| dig | claim | command rerun | result | note |
|---|---|---|---|---|
| 1, Day one | Root hash, date, author/committer, `Initial revision`, and `144 files changed, 37273 insertions(+)` | `git -C ~/book16/repos/curl show --shortstat --format=fuller ae1912cb0d494b48d514d937826c9fe83ec96c4d` | **PASS** | All metadata and the shortstat match exactly. |
| 1, Day one | The root contains a 242,680-byte `curl-6.3.1.tar.gz` | `git -C ~/book16/repos/curl show --stat ae1912cb0d -- curl-6.3.1.tar.gz` | **PASS** | Reproduces `Bin 0 -> 242680 bytes`. |
| 1, Day one | The root's `CHANGES` reaches back to HttpGet 1.0 and credits Rafael Sagula | <code>git -C ~/book16/repos/curl show ae1912cb0d:CHANGES &#124; tail -12</code> | **PASS** | The quoted Version 1.1 and Version 1.0 tail is exact, including “started all this!” |
| 1, Day one | The root commit was “twelve days after” the source-disk death | <code>git -C ~/book16/repos/curl show ae1912cb0d:CHANGES &#124; grep -n -A3 'disk crash'</code><br>Supplement: <code>git -C repos/curl show ae1912cb0d:CHANGES &#124; sed -n '43,51p'</code> | **FAIL** | The report's exact grep reproduces its four quoted lines but omits the heading. The expanded context dates the crash entry **23 Nov 1999**; the root is **29 Dec 1999**, 36 days later, not twelve. The detailed “five weeks later” wording is accurate. |
| 3, `/2` to `/4` | Hash, author/commit dates, Daniel Stenberg, subject, CVE and reporter, plus a 1+/1- stat | `git -C ~/book16/repos/curl show --format=fuller --stat f3a24d7916b9173c69a3e0ee790102993833d6c5` | **PASS** | All metadata and message lines match. |
| 3, `/2` to `/4` | The security fix changes only `SIZE_T_MAX/2` to `SIZE_T_MAX/4` in the username guard | `git -C ~/book16/repos/curl show --format='' f3a24d79 -- lib/vauth/cleartext.c` | **PASS** | The displayed hunk is exact; the next line is `plainlen = 2 * ulen + plen + 2`. |
| 3, cousin | CVE-2015-3144 adds `len &&` before indexing `host->name[len-1]` | `git -C ~/book16/repos/curl show --format='' 0583e87ada7a3cfb10904ae4ab61b339582c5bd3 -- lib/url.c` | **PASS** | Exact one-line replacement reproduced. |
| 3, cousin | CVE-2016-5420 adds client-certificate equality to SSL connection reuse | `git -C ~/book16/repos/curl show --format='' 11ec5ad4352bba384404c56e77c7fab9382fd22d -- lib/vtls/vtls.c` | **PASS** | Exact one-line predicate reproduced. |
| 3, `/2` to `/4` | “A month of embargo” explains the author/commit date gap | `git -C ~/book16/repos/curl show --format=fuller --stat f3a24d7916b9173c69a3e0ee790102993833d6c5` | **FAIL** | Git proves a 31-day gap (28 Sep to 29 Oct), but this command does not prove why. “Embargo” is plausible security context, not a fact established by the receipt. |
| 4, leap day | Hash, raw author, author/committer dates, committer, and subject | `git -C ~/book16/repos/curl log -1 --format=fuller dd18e714ff23d60ad43c524e290ab3e3093ba259` | **PASS** | All fields match exactly: Gokhan Sengun authored on 29 Feb 2000; Daniel committed on 23 Apr 2012. |
| 4, leap day | The patch really adds certificate-verification detail | `git -C ~/book16/repos/curl show --format='' dd18e714ff23d60ad43c524e290ab3e3093ba259 -- lib/ssluse.c` | **PASS** | Supplemental diff check: 13 additions/3 deletions add `SSL_get_verify_result()`, `X509_verify_cert_error_string()`, and move `SSL_strerror()` into the default case. |
| 4, leap day | Author-year 2000 has 709 Daniel commits and exactly one non-Daniel commit, this one | <code>git -C ~/book16/repos/curl log --format='%ad %an' --date=format:'%Y' &#124; awk '$1==2000{c[$2" "$3]++} END{for(a in c) print c[a], a}'</code> | **PASS** | Exact output is `1 Gokhan Sengun` and `709 Daniel Stenberg`; a supplemental `--all` scan also found no other non-Daniel author-date in 2000. |
| 4, leap day | A contributor's laptop clock caused the 12-year discrepancy | `git -C ~/book16/repos/curl log -1 --format=fuller dd18e714ff23d60ad43c524e290ab3e3093ba259` | **FAIL** | The anomalous timestamp is real, and his other commits are dated 2011–2012, but Git cannot identify the machine or cause. “A clock did” is an inference stated too confidently. |

## New digs

### 1. The compile fix whose tree did not change

- **find-type:** 2 (planted/imported artifact; an empty commit with a non-empty claim)
- **hash:** `f30102f03861781efc1a6f0246695dc054badb74`
- **date:** 2001-10-05 02:30:27 +0000 (author = committer)
- **author:** sm `<sm@resistor.net>`
- **message:** `VC ID project workspace - fixes compile under win32`

```
git -C /home/diablo/book16/repos/curl show -s --format='%H%n%aI%n%cI%n%an <%ae>%n%s%n%T%n%P' f30102f03861781efc1a6f0246695dc054badb74
git -C /home/diablo/book16/repos/curl show -s --format='%T' f30102f03861781efc1a6f0246695dc054badb74^
f30102f03861781efc1a6f0246695dc054badb74
2001-10-05T02:30:27+00:00
2001-10-05T02:30:27+00:00
sm <sm@resistor.net>
VC ID project workspace - fixes compile under win32
09c7fb7f461168de49dcd67c43f5824d9b60994e
a27ac6f394f8c1b8b5388607d41a4775f0f50aa7
09c7fb7f461168de49dcd67c43f5824d9b60994e
```

**Why it is a story.** Forty seconds after `a27ac6f3` says the VC project now uses `ws2_32.lib`, another commit promises a workspace compile fix. At that moment it reads like the second half of a Windows repair; in Git's surviving history its tree ID is byte-for-byte the parent's, so the promised outcome left only metadata. The receipt supports the no-op, not a theory about how CVS conversion produced it.

**What the reader learns.** A meaningful subject is not proof of a change. Compare `%T` with the first parent's `%T`; empty commits can be deliberate markers, migration artifacts, or lost intent, and Git alone may not distinguish them.

**surprise:** 4

### 2. “Especially not my old Microsoft email address”

- **find-type:** 4 (a displayed identity disappears and another becomes canonical)
- **hash:** `dc8a87fc74136970b7927a76dfc8a491ca9c8e91`
- **date:** 2026-05-24 10:22:21 +0100
- **author:** Max Dymond `<cmeister2@gmail.com>`
- **message:** `mailmap: cmeister2@gmail is primary for Max Dymond`

```
git -C /home/diablo/book16/repos/curl show --format='%H%n%aI%n%an <%ae>%n%s%n%b' --unified=1 dc8a87fc74136970b7927a76dfc8a491ca9c8e91 -- .mailmap | grep -E "^(dc8a87|2026-|Max Dymond|mailmap:|I'd|of anything|[-+]Max Dymond)"
dc8a87fc74136970b7927a76dfc8a491ca9c8e91
2026-05-24T10:22:21+01:00
Max Dymond <cmeister2@gmail.com>
mailmap: cmeister2@gmail is primary for Max Dymond
I'd rather all my commits be attributed to cmeister2@gmail.com instead
of anything else; especially not my old Microsoft email address!
-Max Dymond <max.dymond@microsoft.com> <max.dymond@metaswitch.com>
-Max Dymond <max.dymond@microsoft.com> <cmeister2@gmail.com>
+Max Dymond <cmeister2@gmail.com> <max.dymond@metaswitch.com>
+Max Dymond <cmeister2@gmail.com> <max.dymond@microsoft.com>
```

**Why it is a story.** Before this commit, curl's mailmap presented a former employer address as Max's canonical identity even when a commit carried his personal address. He did not rewrite a single old object; he asked the project to reverse two mappings, explicitly naming the identity he no longer wanted history to foreground.

**What the reader learns.** `.mailmap` is a mutable view over immutable authorship. Compare `%an <%ae>` with `%aN <%aE>` and inspect mailmap diffs before treating a shortlog's names or employers as what contributors chose permanently.

**surprise:** 4

### 3. Four tiny-curl product lines live outside `master`

- **find-type:** 4 (a product name appears only when all refs are searched)
- **hashes / dates / author / messages:** `0c9211798f` (author 2020-08-27, commit 2020-08-27, `tiny-curl: 7.72.0 release`); `eacc69258f` (author 2020-08-27, commit 2021-09-28, `tiny-curl: 7.79.1 release`); `f402c181e3` (author 2023-08-17, commit 2023-08-24, `lib: build fixups when built with most things disabled`); `172e54cda1` (author 2023-10-30, commit 2023-10-30, `tiny-curl: patch set applied on 8.4.0`). All are Daniel Stenberg.

```
git -C /home/diablo/book16/repos/curl for-each-ref --no-merged=master --sort=committerdate --format='%(refname:short) %(objectname) %(authordate:iso8601-strict) %(committerdate:iso8601-strict) %(authorname) %(subject)' refs/remotes/origin | grep -E '(^|/)tiny-curl|curl-tiny'
origin/curl-tiny-7.72 0c9211798fc80d5c9cc9bcdc8e11eb485c9c1c5b 2020-08-27T09:42:11+02:00 2020-08-27T10:05:10+02:00 Daniel Stenberg tiny-curl: 7.72.0 release
origin/tiny-curl-7_79 eacc69258fcc184edbd412ef46e2f72cafd6cb18 2020-08-27T09:42:11+02:00 2021-09-28T15:30:11+02:00 Daniel Stenberg tiny-curl: 7.79.1 release
origin/tiny-curl-8_2 f402c181e38c2d18ad4c487f43a1324ec390571f 2023-08-17T14:18:06+02:00 2023-08-24T13:15:31+02:00 Daniel Stenberg lib: build fixups when built with most things disabled
origin/tiny-curl-8_4 172e54cda18412da73fd8eb4e444e8a5b371ca59 2023-10-30T09:16:41+01:00 2023-10-30T09:32:12+01:00 Daniel Stenberg tiny-curl: patch set applied on 8.4.0
```

```
for ref in origin/curl-tiny-7.72 origin/tiny-curl-7_79 origin/tiny-curl-8_2 origin/tiny-curl-8_4; do printf '%s ' "$ref"; git -C /home/diablo/book16/repos/curl rev-list --left-right --count master..."$ref" | tr '\t' ' '; done
origin/curl-tiny-7.72 13396 6
origin/tiny-curl-7_79 11777 3
origin/tiny-curl-8_2 8828 2
origin/tiny-curl-8_4 8313 1
```

**Why it is a story.** A normal `git log master` says none of this happened. The first branch carried six exclusive commits for a smaller libcurl on FreeRTOS/Micrium; later releases reapplied or squashed the patch stack onto fresh bases. The 7.79.1 tip even keeps the 7.72 release commit's 2020 author timestamp while its committer timestamp moves to 2021—the trace of an old patch being made to speak for a new release.

**What the reader learns.** Search `--all` and quantify `main...ref` before declaring an abandoned experiment absent. Long-lived patch products may be rebased or squashed rather than merged, and author date can survive that replay while committer date reveals when the new object actually entered history.

**surprise:** 4

### 4. Release 7.76.0 is where the tag starts carrying a signature

- **find-type:** 2 (dated release artifact; signature presence begins at a boundary)
- **hashes:** unsigned tag object `0a9a82d8a6d9cd42389569751fa22ad9f14a3320` -> commit `2f33be817cbce6ad7a36f27dd7ada9219f13584c`; signed tag object `a63d8fa778ba52be7194ff43682e88bb03d7b453` -> commit `3266b35bbe21c68dea0dc7ccd991eb028e6d360c`
- **dates:** tagger 2021-02-03 08:03:17 +0100; 2021-03-31 07:51:40 +0200
- **author/tagger:** Daniel Stenberg `<daniel@haxx.se>`
- **messages:** `7.75.0`; `7.76.0`

```
for tag in curl-7_75_0 curl-7_76_0; do obj=$(git -C /home/diablo/book16/repos/curl rev-parse "$tag"); target=$(git -C /home/diablo/book16/repos/curl rev-parse "$tag^{}"); sig=$(git -C /home/diablo/book16/repos/curl cat-file -p "$obj" | grep -c '^-----BEGIN PGP SIGNATURE-----'); printf '%s tag=%s target=%s signature=%s ' "$tag" "$obj" "$target" "$sig"; git -C /home/diablo/book16/repos/curl for-each-ref --format='%(creatordate:iso8601-strict) %(taggername) %(subject)' "refs/tags/$tag"; done
git -C /home/diablo/book16/repos/curl for-each-ref --format='%(objecttype)' refs/tags | sort | uniq -c
curl-7_75_0 tag=0a9a82d8a6d9cd42389569751fa22ad9f14a3320 target=2f33be817cbce6ad7a36f27dd7ada9219f13584c signature=0 2021-02-03T08:03:17+01:00 Daniel Stenberg 7.75.0
curl-7_76_0 tag=a63d8fa778ba52be7194ff43682e88bb03d7b453 target=3266b35bbe21c68dea0dc7ccd991eb028e6d360c signature=1 2021-03-31T07:51:40+02:00 Daniel Stenberg 7.76.0
    109 commit
    116 tag
```

**Why it is a story.** One release morning the tag object is a name, target, tagger and `7.75.0`; the next release adds a PGP signature block. A chronological scan of tag objects finds no earlier signature marker, so the moment before 7.76.0 was the last curl release whose Git tag asserted a release without carrying that cryptographic attachment.

**What the reader learns.** A tag-looking ref may be lightweight (`objecttype=commit`), annotated but unsigned, or signed. `git cat-file -p` establishes signature presence; it does **not** establish trust—verification still requires the signer's public key and a trust decision.

**surprise:** 3

### 5. The largest textual commit is 960 documentation files changing language

- **find-type:** 4 (the name `curldown` appears) and 8 (a repository-wide representation is replaced)
- **hash:** `eefcc1bda4bccd800f5a56a0fe17a2f44a96e88b`
- **date:** author 2024-01-17 11:32:44 +0100; committer 2024-01-23 00:29:02 +0100
- **author:** Daniel Stenberg `<daniel@haxx.se>`
- **message:** `docs: introduce "curldown" for libcurl man page format`

```
git -C /home/diablo/book16/repos/curl log --all --numstat --format='@@%H%x09%aI%x09%an%x09%s' | awk -F '\t' '/^@@/{if(h) print add+del,add,del,files,h,date,name,msg; h=substr($1,3); date=$2; name=$3; msg=$4; add=del=files=0; next} NF==3 {if($1~/^[0-9]+$/){add+=$1; del+=$2} files++} END{if(h) print add+del,add,del,files,h,date,name,msg}' | sort -nr | head -5
80783 41071 39712 960 eefcc1bda4bccd800f5a56a0fe17a2f44a96e88b 2024-01-17T11:32:44+01:00 Daniel Stenberg docs: introduce "curldown" for libcurl man page format
37273 37273 0 144 ae1912cb0d494b48d514d937826c9fe83ec96c4d 1999-12-29T14:20:26+00:00 Daniel Stenberg Initial revision
30263 0 30263 153 4259d2df7dd95637a4b1e3fb174fe5e5aef81069 2010-03-24T10:34:30+01:00 Daniel Stenberg remove the ares subtree
24233 24 24209 46 5a0644fae8493bc50959f46b0891d661b31f66e2 2022-02-13T11:29:49+01:00 Daniel Stenberg projects: remove support for MSVC before VC10 (Visual Studio 2010)
23580 24 23556 45 6389ba87b8e5cf74b70c54beab3498dfc773364e 2024-04-08T09:13:17+02:00 Daniel Stenberg projects: drop MSVC project files for recent versions
```

**Why it is a story.** Six days separate author and commit dates while almost every libcurl man page is converted from hand-authored nroff to a Markdown-inspired source format that generates nroff. Before it landed, this was one enormous review boundary: 80,783 changed text lines—more than twice the root import's line count—with only 1,359 net new lines and no product-code feature to announce it.

**What the reader learns.** Rank `--numstat` churn, not just commit counts. The largest review surface may be a representation migration; isolate mechanical conversion from semantic edits, and remember that binary rows (`-`) are outside this textual ranking.

**surprise:** 3

Reliability verdict: strong on hashes and quoted Git output—10 verification claims passed—but not fully reliable on chronology or causal attribution.  
It has one arithmetic error and two inferences stated as facts; use its receipts, qualify its narration.
