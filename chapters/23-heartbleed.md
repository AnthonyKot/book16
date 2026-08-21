# The commit the internet blames

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [The commit the internet blames](23-heartbleed.html).*

Everybody who knows the story of Heartbleed knows the commit. It landed on New Year's Eve, 2011,
just before eleven at night — a developer adding a small heartbeat feature to OpenSSL and forgetting
to check that one length was really as long as it claimed. It is, by reputation, the most infamous
single commit in the library's history. So I did the thing this book is about: I asked the ledger a
question. The first release that had Heartbleed was OpenSSL 1.0.1; the fix shipped in 1.0.1g. Is the
famous commit an ancestor of 1.0.1g — is it *in* the release that bled? [R1, R2]

```console
$ git -C repos/openssl show -s --format='%H %aI' 4817504d069b4c5082161b02a22116ad75f822b1
4817504d069b4c5082161b02a22116ad75f822b1 2011-12-31T22:59:57+00:00
$ git -C repos/openssl merge-base --is-ancestor 4817504d069b... OpenSSL_1_0_1g^{} \
    && echo 'in the release' || echo 'NOT in the release'
NOT in the release
```

The commit everyone blames for Heartbleed is not in the software that had Heartbleed. It never
shipped. Whatever bled into the world's servers, this is not the line that did it.

## The twin

The reason is the shape of the project. OpenSSL, like most long-lived code, does not develop on a
single line: new work lands on `master`, and separate *stable* branches carry what actually gets cut
into releases. A feature that is going to ship has to be committed to both — and a commit includes
its parent, not just its patch, so the same change on two branches becomes two different objects.
Their histories had diverged back in 2009, long before the heartbeat existed [R3], so each branch
got its own copy, committed one after the other [R1]:

```console
$ git -C repos/openssl show -s --format='%H %aI' 4817504d069b... bd6941cfaa31...
4817504d069b4c5082161b02a22116ad75f822b1 2011-12-31T22:59:57+00:00
bd6941cfaa31ee8a3f8661cb98227a5cbcc0f9f3 2011-12-31T23:00:36+00:00
```

The famous `4817504d` is the copy on master. Its twin `bd6941cf`, thirty-nine seconds later on the
stable branch, is the one that is an ancestor of 1.0.1g and of every bleeding release before it
[R2]:

```console
$ git -C repos/openssl merge-base --is-ancestor bd6941cfaa31... OpenSSL_1_0_1g^{} \
    && echo 'in the release' || echo 'NOT in the release'
in the release
```

~ 22:59:57 and 23:00:36.

The first became famous. The second shipped. For anyone reading the code they are the same missing
line; for anyone reading the history, only one is in the release — and only that one is evidence.
When you go hunting for the origin of a disaster, the commit that *matches the story* and the commit
that *shipped the code* are not guaranteed to be the same object.

## The fields

The name history attaches to Heartbleed is Robin Seggelmann — the researcher who proposed the TLS
heartbeat, wrote its specification, and submitted the code.
<!-- VERIFIED: Robin Seggelmann authored RFC 6520 (TLS/DTLS Heartbeat Extension, Feb 2012) and contributed the OpenSSL implementation; he is the person publicly identified with the Heartbleed code. https://en.wikipedia.org/wiki/Heartbleed and https://www.smh.com.au/technology/man-who-introduced-serious-heartbleed-security-flaw-denies-he-inserted-it-deliberately-20140411-zqta1.html -->
So I read past the names in the story and into the commit's own fields [R4]:

```console
$ git -C repos/openssl show -s --format='author    = %an <%ae>%ncommitter = %cn <%ce>' bd6941cfaa31...
author    = Dr. Stephen Henson <steve@openssl.org>
committer = Dr. Stephen Henson <steve@openssl.org>
$ git -C repos/openssl show -s --format='%b' bd6941cfaa31... | grep -iE 'submitted|reviewed'
Submitted by: Robin Seggelmann <seggelmann@fh-muenster.de>
Reviewed by: steve
```

Author and committer are both Stephen Henson; Seggelmann is a line of prose in the body, and
`Reviewed by: steve` is Henson's own handle. That was the old OpenSSL workflow — a maintainer
applied a contributor's patch under his own name and kept the source in the message. The fields and
the body answer different questions, and they disagree: the name in the newspapers is the one in the
body, not the one git records as author.

## The heartbeat

Here is the code that shipped, the heart of it, out of the commit that reached 1.0.1g's ancestry
[R5]:

```console
$ git -C repos/openssl show --format= --no-ext-diff bd6941cfaa31... -- ssl/t1_lib.c \
    | sed -n '/+tls1_process_heartbeat/,/+	pl = p;/p'
+tls1_process_heartbeat(SSL *s)
+	{
+	unsigned char *p = &s->s3->rrec.data[0], *pl;
+	unsigned short hbtype;
+	unsigned int payload;
+	unsigned int padding = 16; /* Use minimum padding */
+
+	/* Read type and payload length first */
+	hbtype = *p++;
+	n2s(p, payload);
+	pl = p;
```

`n2s(p, payload)` reads a two-byte number off the wire and calls it `payload` — the length the
sender *claims*. `pl = p` points at the sender's data. Further down, the function copies `payload`
bytes from `pl` back to the sender. Nothing in between checks the one thing that mattered: whether
the message is actually that long. Send one byte and claim 65,535, and OpenSSL returns your byte
followed by 65,534 more lying beside it in memory — session keys, passwords, the server's own
private key. The bug is not a wrong line. It is an absent one.
<!-- VERIFIED: Heartbleed = CVE-2014-0160, disclosed 2014-04-07; a missing bounds check in OpenSSL's TLS heartbeat (RFC 6520) let a client read up to ~64KB of server process memory per request, including private keys, and repeat arbitrarily; ~17% (~half a million) of trusted HTTPS servers were estimated vulnerable. https://heartbleed.com/ and https://www.cisa.gov/news-events/alerts/2014/04/08/openssl-heartbleed-vulnerability-cve-2014-0160 -->

## Two years

The absent line shipped in OpenSSL 1.0.1 in March 2012 and stood in every release of that series
until the fix — the last version that still bled was 1.0.1f, the first that did not was 1.0.1g
[R6, R8]:

```console
$ for t in OpenSSL_1_0_1f OpenSSL_1_0_1g; do \
    git -C repos/openssl merge-base --is-ancestor 96db9023b881... "$t^{}" \
      && echo "$t  fixed" || echo "$t  bleeding"; done
OpenSSL_1_0_1f  bleeding
OpenSSL_1_0_1g  fixed
```

The fix, on April 6th 2014, was exactly the line that had been missing — two of them, one guarding
the record length before the read and one guarding the claimed payload before the copy [R7]:

```console
$ git -C repos/openssl show --format= --no-ext-diff 96db9023b881... -- ssl/t1_lib.c | sed -n '9,24p'
+	/* Read type and payload length first */
+	if (1 + 2 + 16 > s->s3->rrec.length)
+		return 0; /* silently discard */
+	hbtype = *p++;
+	n2s(p, payload);
+	if (1 + 2 + payload + 16 > s->s3->rrec.length)
+		return 0; /* silently discard per RFC 6520 sec. 4 */
+	pl = p;
```

`if (1 + 2 + payload + 16 > s->s3->rrec.length)` — if the message isn't really as long as it claims,
stop. The second check even cites the paragraph of the specification it satisfies: `RFC 6520 sec. 4`.
The knowledge was in the spec the patch had claimed to implement. Only the line was ever missing.

## What it cost

Heartbleed did not corrupt anything, crash anything, or trip an alarm. It read. An attacker could
ask a vulnerable server for a heartbeat and receive up to sixty-odd kilobytes of its live memory,
then ask again, for as long as they liked, leaving nothing in the logs — because a heartbeat that
gets answered is not an error, and nothing was configured to record it. What came back was whatever
the process held: login cookies, passwords in flight, and, worst, the server's own private key, the
secret that lets an impostor *be* that server. At disclosure on April 7th 2014, something like half
a million of the internet's trusted HTTPS servers were estimated vulnerable, and the responsible
remedy was not only to patch but to regenerate and revoke every key that might have been exposed —
which was most of them.
<!-- VERIFIED: on disclosure (2014-04-07) ~17% (~half a million) of trusted secure web servers were believed vulnerable; remediation required patching to 1.0.1g AND revoking/reissuing certificates and keys that may have been exposed. https://heartbleed.com/ and https://www.cisa.gov/news-events/alerts/2014/04/08/openssl-heartbleed-vulnerability-cve-2014-0160 -->
The two years between the missing line and its return are not a story of neglect. Nobody sat on a
known bug. For twenty-seven months the omission simply left no mark on either branch — which is the
quiet terror of a missing check: there is nothing on the screen to notice.

## At home

When I inherit a famous origin commit, I test it against the thing that broke before I build a
sentence on it: `git merge-base --is-ancestor <commit> <release>^{}`. The same change can live in
more than one commit object — a patch applied across branches, a rebase, a cherry-pick all make
twins with the same diff and different hashes — and only the one in the shipping branch's ancestry is
evidence. Then I read the fields, not the folklore: `%an` and `%cn` say who git holds responsible,
which in an old project with a `Submitted by:` culture is very often not the name in the story. The
most famous bug in OpenSSL's history was applied, reviewed, and committed by one person to two
branches thirty-nine seconds apart, and every part of that sentence is a field you can read for
yourself. The story you inherited is a place to start looking. It is not the receipt.

## Receipts

- **R1** `git -C repos/openssl show -s --format='%H %aI author=%an committer=%cn' 4817504d069b... bd6941cfaa31...` — the two heartbeat commits, New Year's Eve 2011, 22:59:57 and 23:00:36 UTC, both authored and committed by Dr. Stephen Henson.
- **R2** `git -C repos/openssl merge-base --is-ancestor <commit> OpenSSL_1_0_1g^{}` — `4817504d` (master) is NOT an ancestor of the 1.0.1g release; `bd6941cf` (1.0.1-stable) IS.
- **R3** `git -C repos/openssl show -s --format='%H %aI | %s' $(git ... merge-base 4817504d bd6941cf)` — the two branches last shared history at `70b2186e`, 2009-03-31, before the feature existed.
- **R4** `git -C repos/openssl show -s --format='author=%an committer=%cn' bd6941cf` + `show -s --format='%b' | grep -iE 'submitted|reviewed'` — author and committer both Henson; body carries `Submitted by: Robin Seggelmann` and `Reviewed by: steve`.
- **R5** `git -C repos/openssl show --format= --no-ext-diff bd6941cf -- ssl/t1_lib.c | sed -n '/+tls1_process_heartbeat/,/+	pl = p;/p'` — the shipped code: `n2s(p, payload); pl = p;` with no length check before use.
- **R6** `git -C repos/openssl show -s --format='%H %aI %an | %s' 96db9023b881...` — the fix, 2014-04-06, Dr. Stephen Henson, "Add heartbeat extension bounds check."
- **R7** `git -C repos/openssl show --format= --no-ext-diff 96db9023b881... -- ssl/t1_lib.c | sed -n '9,24p'` — the two added bounds checks, the second citing RFC 6520 sec. 4.
- **R8** `for t in OpenSSL_1_0_1f OpenSSL_1_0_1g; do git ... merge-base --is-ancestor 96db9023 "$t^{}"; done` — last bleeding release 1.0.1f, first fixed release 1.0.1g.
