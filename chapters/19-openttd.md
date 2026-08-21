# Making numbers look nice

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [Making numbers look nice](19-openttd.html).*

Here is an entire contribution to a large open-source project, complete. One digit in one cell:
`320` becomes `420`.

```console
$ git -C repos/openttd show --format='' --no-ext-diff 7e22f243ed3b324df3da9dba5594c14b4e6794a0 -- src/town_cmd.cpp | sed -n '7,11p'
 	static const uint16 _grow_count_values[2][6] = {
 		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
-		{ 320, 420, 300, 220, 160, 100 }  // Normal values
+		{ 420, 420, 300, 220, 160, 100 }  // Normal values
 	};
```

[R5] The commit title is `Fix: typo in town growth rates (#7837)`. The date is November 18th,
2019. And the author field reads `Yourself <kyle.smith314@gmail.com>` [R4] — git records
whatever name you configured, and this contributor's machine was configured to attribute the
work to *Yourself*. Ask the project's entire history how many commits that identity ever made
and the answer is exactly one [R4]. This one. A single fix from a stranger the ledger can only
call *you*.

Two days later it was reverted, and the revert message is one of my favorite pieces of writing
in any repository — a project constitution, stated in two sentences, over a one-cell diff. We
will get there. But first you need to see what *Yourself* saw, because the fix is the most
honest kind of wrong there is. I might have typed it too.

## The table

OpenTTD is, in the words of its own README at the tip of the repository, "a transport
simulation game based upon the popular game Transport Tycoon Deluxe, written by Chris Sawyer"
[R11]. Towns in the game grow, and the code that decides how fast lives in `town_cmd.cpp`, in a
small table that arrived in April 2007, in a commit by a developer named maedhros [R2]:

```console
$ git -C repos/openttd show --format='' --no-ext-diff 61fe35688046b7ef36305ebd92b79bfcc535783f -- src/town_cmd.cpp | sed -n '34,39p'
+	/** Towns are processed every TOWN_GROWTH_FREQUENCY ticks, and this is the
+	 * number of times towns are processed before a new building is built. */
+	static const uint16 _grow_count_values[2][6] = {
+		{ 120, 120, 120, 100,  80,  60 }, ///< Fund new buildings has been activated
+		{ 320, 420, 300, 220, 160, 100 }  ///< Normal values
+	};
```

[R3] Read the comment above the table, because it is the key that decodes everything: the
numbers are *how many processing rounds pass before a town gains a building*. A countdown.
Which means smaller is faster. And the columns are indexed by how many transport stations are
actively serving the town — column zero for a town nobody serves, column one for a town with one
active station, and so on [R5, R10].

Now read the second row the way a fresh pair of eyes would, in 2019. A town with *no* service:
320. A town with *one* station: 420. Then 300, 220, 160, 100 — falling, falling, falling, the
way you would expect: the better you serve a town, the faster it grows. Every column obeys that
logic except the first pair. According to this table, connecting your very first station to a
town makes it grow *slower* than if you had left it alone.

That is not a judgment call. That is a *shape*. Anyone who has ever scanned a lookup table
knows the feeling: five values marching in one direction and one value out of line, like a
fence with a leaning post. The eye snags on it. The diagnosis writes itself — someone transposed
digits, 320 for 420, a typo fossilized since 2007 — and the fix is one keystroke. So on a Monday
in November 2019, a stranger with a fresh eye did the public-spirited thing and filed the fix,
titled as a typo fix. The committer field names a project maintainer, Ingo von Borstel; the
change landed the same day [R4].

Everything visible in that transaction is healthy. An outsider read the code closely enough to
spot an anomaly. The correction was plausible enough to land. If your project's ledger is full
of tiny commits like #7837, you are doing something right. Hold on to that, because this
chapter is not about a fool and I will not let it become that. It is about the one question
nobody asked, and the two days it took for someone to arrive who didn't need to ask it.

## The revert

November 20th, 2019, one o'clock in the morning, a developer named frosch [R6]:

```console
$ git -C repos/openttd show -s --format='%B' 61dba850af737cd49d1bb344dafd7a91a18895bf
Revert #7837, 7e22f243e: OpenTTD tries to replicate the original game mechanics.
Making numbers look nice and correlate is no goal, and in this case they actually did not correlate.
```

[R6] Sit with the first sentence, because it is a constitution. *OpenTTD tries to replicate the
original game mechanics.* This project recreates a specific game, and that sentence declares
what that means as an engineering discipline: the specification is not elegance, not intuition,
not what a table *ought* to look like. The specification is what the original game actually
did. maedhros had said as much back in 2007, in the very commit that introduced the table — the
default growth rate, his message says, is "TTD's original rate" [R2]. This is not a wrong value
preserved because other code learned to depend on it. The project's stated constraint was
fidelity to the original mechanics, and a visually regular table was never the goal.

And then the second sentence, which is the part I keep coming back to: *making numbers look
nice and correlate is no goal — and in this case they actually did not correlate.* Read that
carefully. He is saying the typo-diagnosis was wrong twice over. Wrong in principle, because
even a genuinely lopsided table would be protected if the original game's behavior was
lopsided. And wrong in fact — because the 320 and the 420 were never comparable numbers in the
first place.

## The hidden clause

Here is what the fresh eye could not see, and it was sitting in the 2007 commit all along. Look
below the table in the original hunk [R3]:

```console
$ git -C repos/openttd show --format='' --no-ext-diff 61fe35688046b7ef36305ebd92b79bfcc535783f -- src/town_cmd.cpp | sed -n '57,58p'
+		m = _grow_count_values[1][min(n, 5)];
+		if (n == 0 && !CHANCE16(1, 12)) return;
```

That second line is a toll gate, and within the normal, unfunded row it applies to exactly one
column: the unserviced town. I read `CHANCE16(1, 12)` as the game's coin-flip helper — pass
roughly one time in twelve — so with the `!` in front, a town with no stations doesn't just
count down from 320. Roughly eleven calls in twelve, it is sent home before the countdown is
applied at all. The revert supplies the safe conclusion in its own words: this is an
"additional malus," so the 320 "is actually not better than the 420" [R7]. The two numbers a
tidy-minded reader wants to compare are not on the same axis. The first column is quoted in a
different currency, and the exchange rate lives in different code than the table.

By 2019 that separation had grown: the table lived in its own helper, `GetNormalGrowthRate()`
[R5], while the note frosch was about to write locates the malus in `UpdateTownGrowth()` [R7] —
a different function, which is why a close reader of the table alone had no chance. A value's
meaning does not live in the value. It lives in the code that consumes it — and the consumer is
never printed in the diff where the value looks wrong.

## The five-line monument

So frosch reverted the cell. But look at what the revert actually shipped, because this is the
move that elevates the whole episode. Diff the tree from just before the stranger's fix against
the tree just after the revert — the net effect of the entire affair, typo report and landing
and revert together [R8]:

```console
$ git -C repos/openttd diff --no-ext-diff 7e22f243ed3b324df3da9dba5594c14b4e6794a0^ 61dba850af737cd49d1bb344dafd7a91a18895bf -- src/town_cmd.cpp | sed -n '6,17p'
 static uint GetNormalGrowthRate(Town *t)
 {
+	/**
+	 * Note:
+	 * Unserviced+unfunded towns get an additional malus in UpdateTownGrowth(),
+	 * so the "320" is actually not better than the "420".
+	 */
 	static const uint16 _grow_count_values[2][6] = {
 		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
 		{ 320, 420, 300, 220, 160, 100 }  // Normal values
```

Five lines of comment. That is everything the episode left behind. The code went back to
exactly what it was; the *knowledge* did not. frosch took the fact that lived in another
function — the fact whose distance from the table made the mistake possible — and moved a copy
of it to the one place the next tidy-minded stranger is guaranteed to be looking: directly
above the number that looks wrong. He didn't just undo the mistake. He patched the *conditions*
that produced the mistake. The comment names the trap ("an additional malus"), names where the
trap lives (`UpdateTownGrowth()`), and states the conclusion outright, in quotation marks, like
a proverb: *the "320" is actually not better than the "420".*

There is a genre of comment that only a revert can write. Ordinary comments explain what the
author was thinking. This kind explains what *someone else* was thinking when they got it
wrong. You cannot write it in advance, because you cannot know in advance which of your correct
lines looks incorrect. You find out the day somebody fixes one.

## Still standing

The receipts establish a small but durable result. Between November 18th and November 20th, the
changed value entered and left the project's history; the net cost was two days and the net
product was five lines of explanation. The 320 was never the bug. The bug was a correct-looking
correction, and the whole blast radius is the comment that now prevents its sequel.

Watch that comment survive. In 2023, a project-wide migration modernized the codebase's integer
types, rewriting the table's declaration from `uint16` to `uint16_t` — brushing directly
against the note. The five lines came through untouched [R9]. Run blame on the tip of the
repository today, August 2026, and the note and the restored row still answer to frosch's
revert; of the lines around them, only the declaration has changed hands since [R10]:

```console
$ git -C repos/openttd blame -l --date=iso-strict -L 3862,3869 4d4f8bff38d200fbcfda11789bd69259ebbefd17 -- src/town_cmd.cpp
61dba850af737cd49d1bb344dafd7a91a18895bf (frosch          2019-11-20T01:00:07+01:00 3862) 	/**
61dba850af737cd49d1bb344dafd7a91a18895bf (frosch          2019-11-20T01:00:07+01:00 3863) 	 * Note:
61dba850af737cd49d1bb344dafd7a91a18895bf (frosch          2019-11-20T01:00:07+01:00 3864) 	 * Unserviced+unfunded towns get an additional malus in UpdateTownGrowth(),
61dba850af737cd49d1bb344dafd7a91a18895bf (frosch          2019-11-20T01:00:07+01:00 3865) 	 * so the "320" is actually not better than the "420".
61dba850af737cd49d1bb344dafd7a91a18895bf (frosch          2019-11-20T01:00:07+01:00 3866) 	 */
eaae0bb5e71b237cc1fe1388ab74e6bd3aa0c69e (Rubidium        2023-05-08T19:01:06+02:00 3867) 	static const uint16_t _grow_count_values[2][6] = {
9fc32126790e6e8a558c95f403cde759a5c2cd8b (Pavel Stupnikov 2018-06-24T21:55:48+03:00 3868) 		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
61dba850af737cd49d1bb344dafd7a91a18895bf (frosch          2019-11-20T01:00:07+01:00 3869) 		{ 320, 420, 300, 220, 160, 100 }  // Normal values
```

Nearly seven years, one type migration, and the row's complete lineage is still three commits:
arrival, "typo" fix, revert [R1]. Through the audited 2026 tip, the correction was never
attempted again. The record cannot tell us whether fresh eyes keep snagging on the leaning
fence post and being turned back by the five lines — a comment's success is measured in commits
that never happened, which is why nobody ever gets credit for one. What the record can show is
that the project preserved the reason directly beside the temptation, and the temptation has
not won since.

## At home

The habit this chapter wants to leave in your hands fires at a very specific moment: the moment
a value in someone else's code looks obviously, fixably wrong. A lopsided table. A constant
that breaks the pattern of its neighbors. Your eye snags, your diagnosis writes itself, and the
fix is one keystroke. That moment. Before you type, go find the consumer. Trace where the value
is actually *read*, because that is where its meaning lives — and check whether some guard in
another function quotes your ugly number in a currency you haven't seen. Run `git log -S` with
the constant and read what its authors said when it arrived; if the value was ever "fixed"
before, the revert message will tell you exactly which trap you are currently standing in. The
whole investigation costs five minutes.

And if you are ever on the other side — the one doing the reverting — steal frosch's move
whole. Don't just put the right value back. Write down, at the exact coordinates where the next
person's eye will snag, why the wrong-looking thing is right. State your project's creed in the
commit message if you have one; two sentences will do. Somewhere in a repository you maintain,
there is a correct line that looks like a typo, and its comment hasn't been written yet. The
stranger who will someday fix it — carefully, publicly, with the best of intentions, under a
name like *Yourself* — is the reader you are writing for.

## Receipts

- **R1** `git -C repos/openttd log --reverse -S '{ 320, 420, 300' --format=... -- src/town_cmd.cpp` — the complete lineage of the table row: three commits ever touched it — 2007 arrival, 2019 "typo" fix, 2019 revert.
- **R2** `git -C repos/openttd show -s --format=... 61fe35688046b7ef36305ebd92b79bfcc535783f` — maedhros, 2007-04-12: town growth control added; "The default rate is TTD's original rate."
- **R3** `git -C repos/openttd show ... 61fe356880... -- src/town_cmd.cpp` (sed 34,39 and 57,58) — the original hunk: the table with its countdown comment, and `if (n == 0 && !CHANCE16(1, 12)) return;` — the gate on the unserviced column.
- **R4** `git -C repos/openttd log --author='kyle\.smith314@gmail\.com' ...` + `rev-list --count` — `Yourself <kyle.smith314@gmail.com>`, authored 2019-11-18, committed same day by Ingo von Borstel; the identity's only commit in the history.
- **R5** `git -C repos/openttd show ... 7e22f243ed3b... -- src/town_cmd.cpp` — the fix itself: one cell, `320` → `420`, titled "Fix: typo in town growth rates (#7837)"; hunk header `GetNormalGrowthRate(Town *t)`.
- **R6** `git -C repos/openttd show -s --format=... 61dba850af73...` — frosch, 2019-11-20T01:00 (committed by Charles Pigott): "OpenTTD tries to replicate the original game mechanics. Making numbers look nice and correlate is no goal, and in this case they actually did not correlate."
- **R7** `git -C repos/openttd show ... 61dba850af73... -- src/town_cmd.cpp` — the revert restores `320` and adds the five-line note naming the malus in `UpdateTownGrowth()`.
- **R8** `git -C repos/openttd diff 7e22f243ed3b...^ 61dba850af73... -- src/town_cmd.cpp` — pre-fix tree vs post-revert tree: the net effect of the entire episode is the comment alone.
- **R9** `git -C repos/openttd show eaae0bb5e717... -- src/town_cmd.cpp` — 2023 project-wide integer-type migration (`uint16` → `uint16_t`) touches the declaration; values and note unchanged.
- **R10** `git -C repos/openttd blame -l --date=iso-strict -L 3862,3869 4d4f8bff38d2... -- src/town_cmd.cpp` — at the 2026 tip, the note and the restored row still blame to frosch's revert; only the declaration line postdates it.
- **R11** `git -C repos/openttd show 4d4f8bff38d2...:README.md | sed -n '23p'` — the README at the audited tip: "based upon the popular game Transport Tycoon Deluxe, written by Chris Sawyer."
