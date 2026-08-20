# add flat map

In September 2018, the maintainer of a small JavaScript library published an update whose
entire description was three words: *add flat map*. The change itself was three lines — the
programming equivalent of adding one more tool to a toolbox by writing its name on the lid.
Any developer reviewing it would have approved it between sips of coffee. It became the most
infamous commit in the history of the npm package ecosystem, and the strange thing — the
reason it belongs in this book — is that you can stare at those three lines as long as you
like and there is nothing to see. The attack isn't in them. The attack is in everything
around them, and it is recorded, in perfect detail, in the project's own ledger.

## Speaking the house language

The library was called `event-stream`, written by a developer named Dominic Tarr,
and by 2012 it had settled into a personality: it didn't really contain code, it *collected*
it. Each of its helpers lived in its own tiny package, and the library itself was a lobby —
a page of one-line entries saying, in effect, "the map tool lives over there; the split tool
lives over there." That was considered good style at the time. It also meant that in this
project, adding a feature had a fixed grammar: name the tool, point at the package that
contains it, add that package to the list. Three lines.

So when, six years later, a new maintainer added a flat-map tool by naming it, pointing at a
package called `flatmap-stream`, and adding it to the list, the commit wasn't just
innocent-looking. It was fluent. It was a sentence written in the project's native language,
completing a set the founder had left unfinished. The malicious part — code that, in the
right victim's build, quietly harvested bitcoin wallets — lived entirely inside
`flatmap-stream`, a separate package on the npm registry.
Search this repository's whole
history for "copay" (the wallet it targeted), "bitcoin", "wallet": zero results. The weapon
never lived here. What lives here is the shape of the hand that placed it.

## The stranger with keys

How does a stranger get to publish updates to someone else's library? The ledger answers
with a silence. Dominic's last recorded act is in October 2017 — approving someone's
documentation fix. Then nothing for eleven months. Then a new name appears: 北川, an Outlook
email address, working in a timezone Dominic never used. And the new name doesn't arrive the
way contributors arrive — proposing changes, asking for review. It arrives already holding
the keys, publishing directly. No handover note, no goodbye, no introduction. (Off the
ledger, the story is ordinary and sad: a volunteer offered to take over a package the
owner no longer used, and the owner said yes.)
From inside the record, the
transfer of a library installed millions of times a month looks like nothing at all.

The new maintainer's first week is the part worth studying, because it is a model
apprenticeship. Eight small updates over five days: better examples, tidier documentation, a
note about compatibility. One of them is a release that changes nothing but the version
number — which reads, in hindsight, as a test: *does the publishing machinery still obey
this account?* It did. Another adds a tiny alias, three lines in the house grammar, one last
rehearsal. Then, on a Sunday morning: *add flat map*. Nine minutes later, a new version
number, `3.3.6`.

That number is the actual trigger. Most projects that depended on `event-stream` had asked
for "version 3.3.4 *or any newer 3.x*" — that's the default way to depend on things in npm.
So the moment `3.3.6` existed, the world's next million installs upgraded themselves to it
automatically and pulled the poisoned package down with it. The blast radius wasn't the
three lines. It was the phrase *or any newer*.

## The wash

A week later comes the masterstroke, and it takes four minutes. Three updates, two minutes
apart: the flat-map tool is rewritten so it no longer needs the poisoned package; the
poisoned package is removed from the list; the documentation is updated as though a local
rewrite had been the plan all along. The version number jumps to `4.0.0` — a "major"
version, which automatic upgrades will *not* follow.

Notice what this is not. It is not an undo. Nothing in the record says "revert," nothing
says "remove," no alarm is raised. The evidence is dissolved rather than deleted. Anyone
who cloned the repository afterward and read it — including people who came specifically
to check — found a clean project with no trace of `flatmap-stream`. Meanwhile the npm
registry, which is a completely separate ledger, went on serving the poisoned `3.3.6` to
every automatic upgrade for two more months, until developers tracing a deprecation warning
began opening the dependency and investigators exposed the wallet stealer.


Hold onto that gap, because it is the real subject here: the repository showed a clean face
while the registry shipped the weapon. And the repository still does. Its final Git entry,
to this day, is the attacker doing a bit of housekeeping under the name 北川. But the `author`
field in `package.json`, unchanged through all 322 entries, still names Dominic Tarr.

## The other Friday

Three years later, on another Friday night, the same two ledgers point in opposite
directions.

`colors` — the library that lets terminal text be red or bold, one of the most-installed
packages in the ecosystem — was Marak Squires's, a 24-line toy from a Friday night in 2010.
Its ledger shows him drifting away: his last real update to the shipping branch is from
2015, and for years a volunteer named David Hyde effectively *was* the project, shipping
every release. But the ownership — the name on the door, the right to publish — never moved.
And by late 2021 Marak had been saying publicly that he was done maintaining popular
packages for free, for companies that paid him nothing.


On 7 January 2022, at 23:19, he came back to his own package. Four commits in three and a
half minutes. The first adds an ASCII-art American flag and, at the bottom of the file every
user's program runs first, an infinite loop — printing garbled, corrupted text to the screen,
forever. He didn't even write anything new: the corrupted-text effect was a joke he'd shipped
in 2011, a party trick called `.zalgo` ("Snuck in demonic entity," the 2011 note brags;
"// don't summon zalgo," says the comment above its getter). Eleven years later he reached
for his own joke and put it in a loop with no exit.

Except — look closely at the loop, as first committed. There's a stray semicolon in it.
It's a syntax error. The sabotage, as shipped, would have crashed instantly and looped never.
Seventy-eight seconds after publishing it, this entry appears:

**Fix bug.**

One character removed. Sit in those seventy-eight seconds. A man mid-protest, torching his
own twelve-year-old project in front of the world — and his code doesn't work, and what
surfaces isn't the protester, it's the engineer: find the typo, fix it, ship again, the way
he had a thousand times before. The most ordinary words in the whole ledger, on the one
entry where the intended behavior *was* the failure. Then one more version bump so the
working loop is the one people get, and he stops forever.

And here the mirror completes itself. With `event-stream`, the repository was scrubbed while
the registry served the poison. With `colors`, the registry was scrubbed — by January 11,
npm once again presented safe version `1.4.0` as latest — but the repository was never touched.
No one ever hit
undo. Clone `colors` today, and the default branch still opens onto the infinite loop,
sitting under a comment that says `/* remove this line after testing */`. The news called it
cleaned up. The ledger never was.

## At home

If you take one habit from this pair, take this: the code you install and the repository you
read are two different documents, kept in two different places, and nobody guarantees they
agree. When a dependency matters to you, take the exact version out of your lockfile and
check that the repository will admit to it — a release that exists on the registry but
corresponds to nothing in the project's history is exactly the gap both of these attacks
lived in. And glance at the last year of a project's log for a name that arrived with keys
and no introduction.

Four years on, nobody has reverted `colors`; the loop is still there on the default branch,
waiting. And at the tip of `event-stream`'s washed, quiet history, the author field still
says Dominic Tarr.

---

*The three-line payload, the eight helpful commits, the four-minute cleanup that wasn't an
undo, the semicolon and the seventy-eight seconds — all of it is real, public, and
reproducible with a git command each. The full technical dig is here:
[add flat map — the full dig](09-npm.full.html).*
