# Receipts — source 23 Heartbleed (the innocent twin)

Verbatim outputs against a full clone of openssl. Both heartbeat commits carry
Dr. Stephen Henson in the git *author* AND *committer* fields; Robin Seggelmann
appears only as `Submitted by:` in the message body. Regenerate with
`scripts/receipts-23.sh`. Long outputs selected editorially with sed/head.

## R1 — two heartbeat commits, same night, 39 seconds apart, both authored+committed by Henson
```
$ git -C repos/openssl show -s --format='%H %aI %an (author) / %cn (committer) | %s' 4817504d069b4c5082161b02a22116ad75f822b1 bd6941cfaa31ee8a3f8661cb98227a5cbcc0f9f3
4817504d069b4c5082161b02a22116ad75f822b1 2011-12-31T22:59:57+00:00 Dr. Stephen Henson (author) / Dr. Stephen Henson (committer) | PR: 2658 Submitted by: Robin Seggelmann <seggelmann@fh-muenster.de> Reviewed by: steve
bd6941cfaa31ee8a3f8661cb98227a5cbcc0f9f3 2011-12-31T23:00:36+00:00 Dr. Stephen Henson (author) / Dr. Stephen Henson (committer) | PR: 2658 Submitted by: Robin Seggelmann <seggelmann@fh-muenster.de> Reviewed by: steve
```

## R2 — the famous (master) commit is NOT in the vulnerable release; its twin IS
```
$ git -C repos/openssl merge-base --is-ancestor 4817504d069b4c5082161b02a22116ad75f822b1 OpenSSL_1_0_1g^{} && echo yes || echo NO   # master twin in 1.0.1g?
master 4817504d in 1.0.1g = NO
```

```
$ git -C repos/openssl merge-base --is-ancestor bd6941cfaa31ee8a3f8661cb98227a5cbcc0f9f3 OpenSSL_1_0_1g^{} && echo yes || echo NO   # shipped twin in 1.0.1g?
shipped bd6941cf in 1.0.1g = yes
```

## R3 — why the twin exists: master and 1.0.1-stable diverged in 2009, before either commit
```
$ git -C repos/openssl show -s --format='%H %aI | %s' $(git -C repos/openssl merge-base 4817504d069b4c5082161b02a22116ad75f822b1 bd6941cfaa31ee8a3f8661cb98227a5cbcc0f9f3)
70b2186e240dc39fd75e3a89ca931f8ba4117e80 2009-03-31T19:54:51+00:00 | Stop warnings.
```

## R4 — the ledger's answer to 'who wrote it': author field says Henson; the name Seggelmann is prose in the body
```
$ git -C repos/openssl show -s --format='author=%an <%ae>%ncommitter=%cn <%ce>' bd6941cfaa31ee8a3f8661cb98227a5cbcc0f9f3; git -C repos/openssl show -s --format='%B' bd6941cfaa31ee8a3f8661cb98227a5cbcc0f9f3 | grep -iE 'submitted by|reviewed by'
author=Dr. Stephen Henson <steve@openssl.org>
committer=Dr. Stephen Henson <steve@openssl.org>
Submitted by: Robin Seggelmann <seggelmann@fh-muenster.de>
Reviewed by: steve
```

## R5 — the shipped code: length read straight off the wire, no check before use
```
$ git -C repos/openssl show --format= --no-ext-diff bd6941cfaa31ee8a3f8661cb98227a5cbcc0f9f3 -- ssl/t1_lib.c | sed -n '/+tls1_process_heartbeat/,/+	pl = p;/p'
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

## R6 — the first vulnerable release, and the fix two years later
```
$ git -C repos/openssl tag --contains bd6941cfaa31ee8a3f8661cb98227a5cbcc0f9f3 --sort=creatordate | grep -iE 'OpenSSL_1_0_1[a-f]?$' | head -1   # first release carrying the bug
OpenSSL_1_0_1
```

```
$ git -C repos/openssl show -s --format='%H %aI %an | %s' 96db9023b881d7cd9f379b0c154650d6c108e9a3
96db9023b881d7cd9f379b0c154650d6c108e9a3 2014-04-06T00:51:06+01:00 Dr. Stephen Henson | Add heartbeat extension bounds check.
```

## R7 — the fix: the two bounds checks the original never had (real hunk, sed range)
```
$ git -C repos/openssl show --format= --no-ext-diff 96db9023b881d7cd9f379b0c154650d6c108e9a3 -- ssl/t1_lib.c | sed -n '1,28p'
diff --git a/ssl/t1_lib.c b/ssl/t1_lib.c
index b82fadace6..bddffd92cc 100644
--- a/ssl/t1_lib.c
+++ b/ssl/t1_lib.c
@@ -2588,16 +2588,20 @@ tls1_process_heartbeat(SSL *s)
 	unsigned int payload;
 	unsigned int padding = 16; /* Use minimum padding */
 
-	/* Read type and payload length first */
-	hbtype = *p++;
-	n2s(p, payload);
-	pl = p;
-
 	if (s->msg_callback)
 		s->msg_callback(0, s->version, TLS1_RT_HEARTBEAT,
 			&s->s3->rrec.data[0], s->s3->rrec.length,
 			s, s->msg_callback_arg);
 
+	/* Read type and payload length first */
+	if (1 + 2 + 16 > s->s3->rrec.length)
+		return 0; /* silently discard */
+	hbtype = *p++;
+	n2s(p, payload);
+	if (1 + 2 + payload + 16 > s->s3->rrec.length)
+		return 0; /* silently discard per RFC 6520 sec. 4 */
+	pl = p;
+
 	if (hbtype == TLS1_HB_REQUEST)
```

## R8 — the fix ships in 1.0.1g and not before (1.0.1f was the last bleeding release)
```
$ for t in OpenSSL_1_0_1f OpenSSL_1_0_1g; do git -C repos/openssl merge-base --is-ancestor 96db9023b881d7cd9f379b0c154650d6c108e9a3 "$t^{}" && echo "$t has_fix=yes" || echo "$t has_fix=NO"; done
OpenSSL_1_0_1f has_fix=NO
OpenSSL_1_0_1g has_fix=yes
```

