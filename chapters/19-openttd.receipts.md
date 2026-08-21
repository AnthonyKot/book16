# Receipts — ch. 19 OpenTTD (the `320` creed-revert)

Verbatim outputs against a full clone of OpenTTD/OpenTTD.
Regenerate with `scripts/receipts-19.sh`. Outputs are pinned to explicit commits; long outputs are truncated editorially with `sed` or `head`.

## R1 — the complete lineage of the asymmetric town-growth table
```
$ git -C repos/openttd log --reverse -S '{ 320, 420, 300' --format='%H%n%aI %an <%ae>%n%s' 4d4f8bff38d200fbcfda11789bd69259ebbefd17 -- src/town_cmd.cpp
61fe35688046b7ef36305ebd92b79bfcc535783f
2007-04-12T17:24:34+00:00 maedhros <maedhros@openttd.org>
(svn r9613) -Feature: Make it possible to have some control over the town growth. The default rate is TTD's original rate, and to approximate OpenTTD's previous behaviour the rate should be set to "Fast" or "Very Fast". Town growth can be switched off entirely, and if so, buildings will not be rebuilt. It is also possible to specify a proportion of towns that grow twice as fast as the others.
7e22f243ed3b324df3da9dba5594c14b4e6794a0
2019-11-18T07:20:47-08:00 Yourself <kyle.smith314@gmail.com>
Fix: typo in town growth rates (#7837)
61dba850af737cd49d1bb344dafd7a91a18895bf
2019-11-20T01:00:07+01:00 frosch <frosch@openttd.org>
Revert #7837, 7e22f243e: OpenTTD tries to replicate the original game mechanics. Making numbers look nice and correlate is no goal, and in this case they actually did not correlate.
```

## R2 — 2007: maedhros labels the default as TTD's original rate
```
$ git -C repos/openttd show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' 61fe35688046b7ef36305ebd92b79bfcc535783f
61fe35688046b7ef36305ebd92b79bfcc535783f
Author: 2007-04-12T17:24:34+00:00 maedhros <maedhros@openttd.org>
Committer: 2007-04-12T17:24:34+00:00 maedhros <maedhros@openttd.org>

(svn r9613) -Feature: Make it possible to have some control over the town growth. The
default rate is TTD's original rate, and to approximate OpenTTD's previous
behaviour the rate should be set to "Fast" or "Very Fast". Town growth can be
switched off entirely, and if so, buildings will not be rebuilt. It is also
possible to specify a proportion of towns that grow twice as fast as the
others.


```

## R3 — the original hunk: `320` arrives beside the one-in-twelve malus
```
$ git -C repos/openttd show --format='' --no-ext-diff 61fe35688046b7ef36305ebd92b79bfcc535783f -- src/town_cmd.cpp | sed -n '28,59p'
@@ -1687,22 +1687,21 @@ static void UpdateTownGrowRate(Town *t)
 	}
 
 	CLRBIT(t->flags12, TOWN_IS_FUNDED);
+	if (_patches.town_growth_rate == 0) return;
+
+	/** Towns are processed every TOWN_GROWTH_FREQUENCY ticks, and this is the
+	 * number of times towns are processed before a new building is built. */
+	static const uint16 _grow_count_values[2][6] = {
+		{ 120, 120, 120, 100,  80,  60 }, ///< Fund new buildings has been activated
+		{ 320, 420, 300, 220, 160, 100 }  ///< Normal values
+	};
 
 	if (t->fund_buildings_months != 0) {
-		static const byte _grow_count_values[6] = {
-			60, 60, 60, 50, 40, 30
-		};
-		m = _grow_count_values[min(n, 5)];
+		m = _grow_count_values[0][min(n, 5)];
 		t->fund_buildings_months--;
-	} else if (n == 0) {
-		m = 160;
-		if (!CHANCE16(1, 12))
-			return;
 	} else {
-		static const byte _grow_count_values[5] = {
-			210, 150, 110, 80, 50
-		};
-		m = _grow_count_values[min(n, 5) - 1];
+		m = _grow_count_values[1][min(n, 5)];
+		if (n == 0 && !CHANCE16(1, 12)) return;
 	}
```

## R4 — 2019: the clone records one commit by the author identity `Yourself`
```
$ git -C repos/openttd log 4d4f8bff38d200fbcfda11789bd69259ebbefd17 --author='kyle\.smith314@gmail\.com' --reverse --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%s'
7e22f243ed3b324df3da9dba5594c14b4e6794a0
Author: 2019-11-18T07:20:47-08:00 Yourself <kyle.smith314@gmail.com>
Committer: 2019-11-18T16:20:47+01:00 Ingo von Borstel <planetmaker@openttd.org>
Fix: typo in town growth rates (#7837)
```

```
$ git -C repos/openttd rev-list 4d4f8bff38d200fbcfda11789bd69259ebbefd17 --count --author='kyle\.smith314@gmail\.com'
1
```

## R5 — the proposed fix: one cell, from `320` to `420`
```
$ git -C repos/openttd show --format='' --no-ext-diff 7e22f243ed3b324df3da9dba5594c14b4e6794a0 -- src/town_cmd.cpp
diff --git a/src/town_cmd.cpp b/src/town_cmd.cpp
index 8071f43f39..b982ca5621 100644
--- a/src/town_cmd.cpp
+++ b/src/town_cmd.cpp
@@ -3362,7 +3362,7 @@ static uint GetNormalGrowthRate(Town *t)
 {
 	static const uint16 _grow_count_values[2][6] = {
 		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
-		{ 320, 420, 300, 220, 160, 100 }  // Normal values
+		{ 420, 420, 300, 220, 160, 100 }  // Normal values
 	};
 
 	int n = CountActiveStations(t);
```

## R6 — 2019-11-20: frosch states the replication creed and the non-correlation reason
```
$ git -C repos/openttd show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%B' 61dba850af737cd49d1bb344dafd7a91a18895bf
61dba850af737cd49d1bb344dafd7a91a18895bf
Author: 2019-11-20T01:00:07+01:00 frosch <frosch@openttd.org>
Committer: 2019-11-20T08:01:37+00:00 Charles Pigott <charlespigott@googlemail.com>

Revert #7837, 7e22f243e: OpenTTD tries to replicate the original game mechanics.
Making numbers look nice and correlate is no goal, and in this case they actually did not correlate.

```

## R7 — the revert restores `320` and writes the hidden rule beside it
```
$ git -C repos/openttd show --format='' --no-ext-diff 61dba850af737cd49d1bb344dafd7a91a18895bf -- src/town_cmd.cpp
diff --git a/src/town_cmd.cpp b/src/town_cmd.cpp
index b982ca5621..139e0217d8 100644
--- a/src/town_cmd.cpp
+++ b/src/town_cmd.cpp
@@ -3360,9 +3360,14 @@ static int CountActiveStations(Town *t)
  */
 static uint GetNormalGrowthRate(Town *t)
 {
+	/**
+	 * Note:
+	 * Unserviced+unfunded towns get an additional malus in UpdateTownGrowth(),
+	 * so the "320" is actually not better than the "420".
+	 */
 	static const uint16 _grow_count_values[2][6] = {
 		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
-		{ 420, 420, 300, 220, 160, 100 }  // Normal values
+		{ 320, 420, 300, 220, 160, 100 }  // Normal values
 	};
 
 	int n = CountActiveStations(t);
```

## R8 — immediate aftermath: against the pre-fix tree, only the explanation remains
```
$ git -C repos/openttd diff --no-ext-diff 7e22f243ed3b324df3da9dba5594c14b4e6794a0^ 61dba850af737cd49d1bb344dafd7a91a18895bf -- src/town_cmd.cpp
diff --git a/src/town_cmd.cpp b/src/town_cmd.cpp
index 8071f43f39..139e0217d8 100644
--- a/src/town_cmd.cpp
+++ b/src/town_cmd.cpp
@@ -3360,6 +3360,11 @@ static int CountActiveStations(Town *t)
  */
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

## R9 — 2023: a mechanical integer-type migration changes the table's type, not its values or note
```
$ git -C repos/openttd show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%n%s' eaae0bb5e71b237cc1fe1388ab74e6bd3aa0c69e
eaae0bb5e71b237cc1fe1388ab74e6bd3aa0c69e
Author: 2023-05-08T19:01:06+02:00 Rubidium <rubidium@openttd.org>
Committer: 2023-07-19T19:30:14+02:00 rubidium42 <rubidium42@users.noreply.github.com>

Codechange: automatic adding of _t to (u)int types, and WChar to char32_t
```

```
$ git -C repos/openttd show --format='' --no-ext-diff eaae0bb5e71b237cc1fe1388ab74e6bd3aa0c69e -- src/town_cmd.cpp | sed -n '326,340p'
@@ -3479,13 +3479,13 @@ static uint GetNormalGrowthRate(Town *t)
 	 * Unserviced+unfunded towns get an additional malus in UpdateTownGrowth(),
 	 * so the "320" is actually not better than the "420".
 	 */
-	static const uint16 _grow_count_values[2][6] = {
+	static const uint16_t _grow_count_values[2][6] = {
 		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
 		{ 320, 420, 300, 220, 160, 100 }  // Normal values
 	};
 
 	int n = CountActiveStations(t);
-	uint16 m = _grow_count_values[t->fund_buildings_months != 0 ? 0 : 1][std::min(n, 5)];
+	uint16_t m = _grow_count_values[t->fund_buildings_months != 0 ? 0 : 1][std::min(n, 5)];
 
 	uint growth_multiplier = _settings_game.economy.town_growth_rate != 0 ? _settings_game.economy.town_growth_rate - 1 : 1;
```

## R10 — at the audited 2026 tip, the explanation and `320` still belong to the revert
```
$ git -C repos/openttd show -s --format='%H%nAuthor: %aI %an <%ae>%nCommitter: %cI %cn <%ce>%n%s' 4d4f8bff38d200fbcfda11789bd69259ebbefd17
4d4f8bff38d200fbcfda11789bd69259ebbefd17
Author: 2026-08-17T23:36:20+01:00 Peter Nelson <peter1138@openttd.org>
Committer: 2026-08-18T21:13:28+01:00 Peter Nelson <peter@fuzzle.org>
Codechange: [NewGRF] Remove unneeded check for valid mapped entity IDs
```

```
$ git -C repos/openttd show 4d4f8bff38d200fbcfda11789bd69259ebbefd17:src/town_cmd.cpp | sed -n '3860,3875p'
static uint GetNormalGrowthRate(Town *t)
{
	/**
	 * Note:
	 * Unserviced+unfunded towns get an additional malus in UpdateTownGrowth(),
	 * so the "320" is actually not better than the "420".
	 */
	static const uint16_t _grow_count_values[2][6] = {
		{ 120, 120, 120, 100,  80,  60 }, // Fund new buildings has been activated
		{ 320, 420, 300, 220, 160, 100 }  // Normal values
	};

	int n = CountActiveStations(t);
	uint16_t m = _grow_count_values[t->fund_buildings_months != 0 ? 0 : 1][std::min(n, 5)];

	uint growth_multiplier = _settings_game.economy.town_growth_rate != 0 ? _settings_game.economy.town_growth_rate - 1 : 1;
```

```
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

## R11 — the project's own README at the audited tip names the original game
```
$ git -C repos/openttd show 4d4f8bff38d200fbcfda11789bd69259ebbefd17:README.md | sed -n '23p'
OpenTTD is a transport simulation game based upon the popular game Transport Tycoon Deluxe, written by Chris Sawyer.
```

