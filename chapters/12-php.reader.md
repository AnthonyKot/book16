# Fix typo

On a Sunday morning in March 2021, Rasmus Lerdorf — the man who created PHP, the programming
language that has run a large share of the world's websites for a quarter century — committed
a small fix to it. The description was two words: *Fix typo.* He even tagged it so the testing
machines wouldn't bother checking such a trivial change.

Except the change wasn't a typo fix. It was eleven lines of a booby trap. And Rasmus Lerdorf
didn't write it — someone had stolen his identity to sign it. The remarkable thing, the reason
this belongs in a book about reading git histories, is that you don't need anyone to *tell* you
he didn't write it. The project's own ledger proves it, several ways over, if you know where to
look.

## Eleven lines

Here is what the eleven lines actually did. When any web request arrived at the server, the
code checked whether it carried a header called `User-Agentt` — with a doubled T. That doubling
is the trick, not a mistake: it's close enough to the ordinary `User-Agent` header to escape a
glance, and it's a name no real browser ever sends, so only someone who knew the secret would
use it. If that header's text began with the word `zerodium`, the code took everything after it
and *ran it* — as live program code, on the server.

In plain terms: anyone who knew the password could send a specially labeled web request to any
PHP site running this code and make the server execute whatever commands they liked. This is
about the worst thing that can happen to a piece of software. And it had just been committed to
the main development version of PHP, under the name of the person who invented it, disguised as
routine maintenance. (The attacker even left a joke in the code — a reference to Zerodium, a
firm known for buying software exploits.)
<!-- CHECK: Zerodium was a firm that bought and resold software exploits; the reference is the attacker's joke, not a factual sale — public context. -->

## The tells

Now watch the ledger give the forger away, using nothing but the bookkeeping around the change.

First, the signature. The fake commit carried a formal "signed-off-by" line — a little
I-personally-vouch-for-this stamp that some projects use. How many times in twenty-two years
had the real Rasmus ever used that stamp? Exactly once: on this commit. The impersonator added
a flourish of authenticity that the real man had never once bothered with. When someone is
faking authenticity, the tell is usually the extra touch of authenticity nobody real would add.

Second, the clock. Every commit records the moment it was made, including the time zone of the
machine that made it. The genuine Rasmus, over hundreds of commits, works from American time
zones — the U.S. East and West coasts. This one commit was stamped from Central European time,
at just before six in the morning, on a Sunday. One entry in his whole life's record was typed
from a different continent than all the others, and the attacker's own computer clock said so.

Neither of those is the code. The code, the attacker got right. What gave them away was the
paperwork — the habits and the timestamps that a forger doesn't think to match.

## Two masks

Five hours after the booby trap went in, a PHP maintainer named Nikita Popov looked at this
"typo fix from the founder," didn't believe it, and undid it. His note is the closest thing to
an official account the ledger contains: *This looks like the result of a compromised git
account. Commit access has already been revoked.* The code was reversed; the break-in account
was locked out. For a few hours, that looked like the end of it.

Then, that same afternoon, the booby trap came *back* — in a new commit undoing Nikita's
reversal. And that commit was signed with Nikita's own name. The person who had just locked the
attacker out was now, apparently, the one restoring the attack.

He wasn't, of course. The intruder, shut out under Rasmus's stolen identity, had simply put on
a second stolen identity — the very maintainer who had caught them. And you can prove it's the
identical booby trap and not something new, because git fingerprints the exact contents of
every change, and the fingerprints of the two malicious commits match to the last byte.

This is the strange, cold heart of the story. In the space of one Sunday, a reader of this
ledger watches the name "Rasmus Lerdorf" turn out to be worthless as proof of authorship — and
then watches the name "Nikita Popov" turn out to be worthless the same way. A name in a git
history is just a piece of text the committer types. It is not who you are. (A third developer
undid the attack a final time ninety minutes later, and it stayed undone. Four commits, one
Sunday: plant, undo, replant, undo.)

## Still there

Here's the part that surprises even people who work with git every day. The booby trap was
reversed twice. It never made it into a real release. The compromised server was shut down soon
after. Five years have passed. Surely, then, the malicious commits are long gone from PHP?

They are not. They are still part of the official repository history, reachable from current
PHP branches and therefore downloaded by a normal full clone today. They are not inside PHP
binaries or installed web servers; those do not carry the repository's Git history.

The reason is a fact about git that trips up nearly everyone: reversing a change does not delete
it. "Undoing" a commit means *adding a new commit* that cancels it out. Both the harmful change
and its cancellation remain in the recorded ancestry, side by side. The booby-trap code
is inactive — it was cancelled, it does nothing — but the moment it was added is stitched into
the ancestry of the current repository. PHP could have removed it from future clones by
rewriting history, but doing so would have changed the fingerprints of everything that came
after, forced existing clones to reconcile an incompatible history, and amounted to pretending
the attack never happened. They chose to let the scar show. Anyone can still make a full clone
of `php-src` and hold the receipt from that Sunday.

## The locks

Reversing the code closed the wound. But the break-in had been possible because of *where* PHP
kept its source: on the project's own server, protected only by passwords that could be — and
were — stolen. GitHub, at the time, was treated as a mere copy.

So the most important action came the next day, and it wasn't a code fix at all. It was an edit
to the project's README that struck out every mention of the old self-hosted server and made
GitHub — with its stronger, two-factor logins — the true home of PHP. A twenty-year-old piece
of independent infrastructure, retired in a single documentation change. That was the real cost
of the attack: not a single hacked website, but the end of the project hosting itself.

The most important commit after a break-in is rarely the one that fixes the damage. It's the one
that changes the locks.

## At home

If you ever need to know whether a commit is really from the person it claims — an increasingly
practical question, as attacks like this one keep happening — don't trust the name on it. The
name is just typed text. Look instead at the things a forger forgets to fake: does the time zone
match that person's every other commit? Does some formal habit in this commit appear in their
history, or exactly once? And if you read that a project was "compromised but cleaned up,"
remember that cleaned up almost always means *reversed*, not *deleted* — and that the original
bad commit is very likely still sitting in the history, an ancestor of everything you have
checked out, a fossil you can hold from the morning someone tried to back-door the web and
signed it with the founder's name.

---

*The eleven-line payload, the doubled-T header, the once-ever signature and the wrong-continent
clock, the revert war with its matching fingerprints, the still-present ancestry, and the README
that changed the locks are all real and public, reproducible with a git command each. The full
technical dig is here: [Fix typo — the full dig](12-php.full.html).*
