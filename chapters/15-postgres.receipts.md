# Receipts — ch. 15 postgres (the refusals of Tom Lane)

Verbatim outputs against a full clone of postgres/postgres.
Regenerate with `scripts/receipts-15.sh`. Long outputs truncated editorially (head).

## R1 — day one, 1996: the magic number and the XXX that promised to replace it
```
$ git -C repos/postgres show d31084e9d1:src/backend/optimizer/plan/initsplan.c | sed -n '195,198p'
		 * XXX If we have a func clause set selectivity to 1/3, 
		 *     really need a true selectivity function.
		 */
		clauseinfo->selectivity = (Cost)0.3333333;
```

## R2 — the confession the estimate came wrapped in, dated in the source itself
```
$ git -C repos/postgres show d31084e9d1:src/backend/optimizer/path/clausesel.c | sed -n '242,245p'
	 ** This is not an operator, so we guess at the selectivity.  
	 ** THIS IS A HACK TO GET V4 OUT THE DOOR.  FUNCS SHOULD BE
	 ** ABLE TO HAVE SELECTIVITIES THEMSELVES.
	 **     -- JMH 7/9/92
```

## R3 — 2015: Tom Lane has a better estimator, and declines to use it
```
$ git -C repos/postgres log -1 --format='%h %ai %an%n%s' 39df0f150c
39df0f150ca 2015-09-24 18:35:46 -0400 Tom Lane
Allow planner to use expression-index stats for function calls in WHERE.
```

```
$ git -C repos/postgres log -1 --format='%b' 39df0f150c | grep -iE 'twenty-three|survived|not to do' | head -4
changing a default estimate that's survived for twenty-three years seems
like something not to do without a lot more testing than I care to put
```

## R4 — 2025: a later patch dropped the estimate; Tom puts it back and warns the next person
```
$ git -C repos/postgres log -1 --format='%h %ai %an%n%s' 1eccb93150
1eccb931507 2025-09-20 12:44:52 -0400 Tom Lane
Re-allow using statistics for bool-valued functions in WHERE.
```

```
$ git -C repos/postgres blame -L 1606,1612 HEAD -- src/backend/utils/adt/selfuncs.c
1eccb9315070 (Tom Lane 2025-09-20 12:44:52 -0400 1606) 		 * If we have no stats and it's a function call, estimate 0.3333333.
1eccb9315070 (Tom Lane 2025-09-20 12:44:52 -0400 1607) 		 * This seems a pretty unprincipled choice, but Postgres has been
1eccb9315070 (Tom Lane 2025-09-20 12:44:52 -0400 1608) 		 * using that estimate for function calls since 1992.  The hoariness
1eccb9315070 (Tom Lane 2025-09-20 12:44:52 -0400 1609) 		 * of this behavior suggests that we should not be in too much hurry
1eccb9315070 (Tom Lane 2025-09-20 12:44:52 -0400 1610) 		 * to use another value.
1eccb9315070 (Tom Lane 2025-09-20 12:44:52 -0400 1611) 		 */
1eccb9315070 (Tom Lane 2025-09-20 12:44:52 -0400 1612) 		selec = 0.3333333;
```

## R5 — the estimate is still on HEAD, thirty-three years on
```
$ git -C repos/postgres grep -n '0.3333333' HEAD -- src/backend/utils/adt/selfuncs.c | head -1
HEAD:src/backend/utils/adt/selfuncs.c:1606:		 * If we have no stats and it's a function call, estimate 0.3333333.
```

## R6 — 2023: the feature Tom would not write, landed as a warning
```
$ git -C repos/postgres log -1 --format='%h %ai %an%n%s%n%n%b' af3ee8a086 | head -8
af3ee8a086c 2023-10-03 11:41:42 -0400 Tom Lane
Add some notes about why "ALTER TYPE enum DROP VALUE" is hard.

In hopes of putting these where any would-be implementer is sure to
find them, make a placeholder grammar production for ALTER DROP VALUE
and put them there.  This is really just a docs patch, though.

Vik Fearing, with a bit more wordsmithing by me
```

## R7 — the diff: a grammar rule whose only job is to refuse, and list why
```
$ git -C repos/postgres show af3ee8a086 -- src/backend/parser/gram.y | grep -E '^\+' | grep -vE '^\+\+\+' | sed -n '3,14p'
+				/*
+				 * The following problems must be solved before this can be
+				 * implemented:
+				 *
+				 * - There must be no instance of the target value in
+				 *   any table.
+				 *
+				 * - The value must not appear in any catalog metadata,
+				 *   such as stored view expressions or column defaults.
+				 *
+				 * - The value must not appear in any non-leaf page of a
+				 *   btree (and similar issues with other index types).
```

## R8 — the scale of the hand: first commit, count, and it is not a feature
```
$ git -C repos/postgres log --author='Tom Lane' --reverse --format='%h %ai %s' | head -1
502769d0dee 1998-10-01 01:26:45 +0000 Change HPUX loader flags to trap null pointer derefs
```

```
$ git -C repos/postgres rev-list --count --author='Tom Lane' HEAD
16863
```

