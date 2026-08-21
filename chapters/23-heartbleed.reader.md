# The commit the internet blames

Heartbleed has a famous origin commit. New Year's Eve, 2011, just before eleven at night: a
developer adds a small "heartbeat" feature to OpenSSL — a way for two machines to check they're
still connected — and forgets one check. It is, by reputation, the most infamous single commit in
the library's history.

So I asked git a simple question: is that commit actually inside the release that bled? It isn't.
It's not there at all. The version of OpenSSL that had Heartbleed was never built from the commit the
whole world points at — and the commit that *did* ship is sitting a few branches over.

## The twin

Here's why. Big projects don't develop in a single line. There's one branch where new work lands,
and separate "stable" branches that hold the code actually packaged into releases. A feature meant to
ship has to be added to *both* — committed once to the development branch, and committed again to the
stable branch. Same change, two commits, two different fingerprints, because a commit carries its
whole history, not just its patch, and the two branches had split apart years earlier.

So on that New Year's Eve, the same developer applied the same heartbeat patch to two branches back
to back. The first copy — the famous one — is on the development branch. The copy that shipped, the
one baked into every bleeding release, is its twin on the stable branch, committed thirty-nine
seconds later.

~ 22:59:57 and 23:00:36.

The first became famous. The second is the one that bled. For anyone reading the code they're
identical — which is exactly why the mix-up is harmless. But if you're tracing what actually
shipped, only one of the two is evidence, and it isn't the one in the story.

## The fields

There's a second substitution in the same commit, and this one the record makes on its own. The name
history attaches to Heartbleed is Robin Seggelmann — the researcher who proposed the heartbeat
feature, wrote its official specification, and submitted the code.
<!-- VERIFIED: Robin Seggelmann authored RFC 6520 (TLS/DTLS Heartbeat Extension, Feb 2012) and contributed the OpenSSL implementation; he is the person publicly identified with the Heartbleed code. https://en.wikipedia.org/wiki/Heartbleed and https://www.smh.com.au/technology/man-who-introduced-serious-heartbleed-security-flaw-denies-he-inserted-it-deliberately-20140411-zqta1.html -->
But ask git who wrote the commit, and Seggelmann isn't in the fields at all. Both the "author" and
the "committer" are Stephen Henson, a senior OpenSSL maintainer. Seggelmann appears only as a line
inside the message — *Submitted by: Robin Seggelmann* — followed by *Reviewed by: steve*, Henson's
own handle.

That was the old OpenSSL way: a maintainer applied a contributor's patch under his own name and
noted the real source in the text. So the name the newspapers used is a sentence in the body, and
the name git records as the author is the maintainer who applied it. They answer two different
questions — and the story you inherited answered neither by reading the fields.

## The heartbeat

The bug itself is almost nothing. A heartbeat message says, in effect, "here's some data — send it
back to me," and it includes a little number: *how long* the data is. The shipped code read that
number and trusted it, and never asked the only question that mattered: is the message actually that
long?

So an attacker could send a one-byte heartbeat that claimed to be sixty-odd thousand bytes long. The
server dutifully sent back that one byte — followed by sixty-odd thousand bytes of whatever happened
to be sitting next to it in memory. Not data the attacker was owed: another user's password, a
session key, the server's own private key. Ask again, get another slice. Ask forever, and nothing in
the logs ever records it, because a heartbeat that gets answered isn't an error.

The fix, when it came in April 2014, was exactly the line that had been missing — two `if`
statements: if the message isn't really as long as it claims, stop. One of them even cited the
paragraph of the specification that had required the check all along. The knowledge was never
missing. Only the line was.

## Two years

The absent check shipped in OpenSSL 1.0.1, in March 2012, and stood in every release of that series
until the last bleeding version, 1.0.1f; the fix landed one letter later, in 1.0.1g. When it was
disclosed in April 2014, something like half a million of the internet's trusted secure servers were
vulnerable — and patching wasn't enough. Because the hole could leak a server's private key, the
responsible cleanup meant regenerating and revoking keys and certificates across a large slice of the
web, on the assumption they had already been stolen.
<!-- VERIFIED: on disclosure (2014-04-07) ~17% (~half a million) of trusted secure web servers were believed vulnerable; remediation required upgrading to 1.0.1g AND revoking/reissuing potentially exposed certificates and keys. https://heartbleed.com/ and https://www.cisa.gov/news-events/alerts/2014/04/08/openssl-heartbleed-vulnerability-cve-2014-0160 -->

But the two years between the missing line and its return aren't a story of neglect. Nobody sat on a
known bug. For twenty-seven months the omission simply left no mark on either branch — the quiet
terror of a check that isn't there: nothing on the screen to notice.

## At home

If you take one habit from this, take this one. When you meet a bug with a famous origin commit,
check that the commit is actually *in the thing that broke* before you build a word on it — one
command settles it: `git merge-base --is-ancestor <commit> <release>^{}`. The same change can live in
more than one commit — patches applied across branches, rebases, and cherry-picks all make twins with
the same diff and different fingerprints — and only the one in the shipping branch's history is
evidence. And read the fields, not the folklore: git records who it holds responsible, which in an
old project is very often not the person in the story you were handed. That story is a place to start
looking. It isn't the receipt.

---

*The two New Year's Eve commits thirty-nine seconds apart, the branch that shows only one of them
shipped, the author and committer fields, the missing bounds check, and the two-`if` fix are all real
and public, reproducible with a git command each. The full technical dig is here:
[The commit the internet blames — the full dig](23-heartbleed.full.html).*
