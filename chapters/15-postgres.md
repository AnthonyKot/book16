# THIS IS A HACK TO GET V4 OUT THE DOOR

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [THIS IS A HACK TO GET V4 OUT THE DOOR](15-postgres.html).*

There is a number in the query planner of PostgreSQL — the database under a large share of the
world's applications — and the number is one third:

```console
$ git -C repos/postgres show d31084e9d1:src/backend/optimizer/plan/initsplan.c | sed -n '195,198p'
		 * XXX If we have a func clause set selectivity to 1/3, 
		 *     really need a true selectivity function.
		 */
		clauseinfo->selectivity = (Cost)0.3333333;
```

[R1] When the planner meets a condition it cannot estimate — a function call in a `WHERE`
clause, something with no statistics behind it — it guesses that one third of the rows will
match, and plans the whole query on that guess. Why a third? No reason. It is a placeholder, and
it says so: `XXX ... really need a true selectivity function` — `XXX` being programmer for *this
is wrong, replace it*. The estimate is older than this repository, which was imported in 1996
from a decade of prior work at Berkeley. In a neighboring file the same guess wears a fuller
confession, dated in the source itself:

```console
$ git -C repos/postgres show d31084e9d1:src/backend/optimizer/path/clausesel.c | sed -n '242,245p'
	 ** This is not an operator, so we guess at the selectivity.  
	 ** THIS IS A HACK TO GET V4 OUT THE DOOR.  FUNCS SHOULD BE
	 ** ABLE TO HAVE SELECTIVITIES THEMSELVES.
	 **     -- JMH 7/9/92
```

[R2] Picture the afternoon it was written: 9 July 1992, Berkeley, someone shipping version 4 of
the academic Postgres against a deadline, needing a number to make the planner produce *a* plan,
having no time to compute the right one, typing `0.3333333` and then shouting into the comment,
in capitals, that this was a hack and someone should really do it properly before it mattered.
Then they got V4 out the door. The rest of this story is three decisions, thirty years apart,
about that shout.

## 2015: the fix he doesn't make

September 2015. Tom Lane — committing to this project since 1998 — is working in exactly the file
that guess lives in. His commit is titled `Allow planner to use expression-index stats for
function calls in WHERE` [R3], and it does real work: where a function has an expression index
with gathered statistics, the planner can now use those instead of guessing. He has, in other
words, built the beginnings of the very thing the 1992 comment cried out for — a true
selectivity function — for the cases he can prove. The bare `0.3333333` fallback, sitting right
there, is the obvious next thing to clean up. Every case he *can't* cover with statistics still
routes through a number a Berkeley grad student admitted was a hack. Delete it, pick something
defensible — 0.5, say — and finish the job the comment has been begging to have finished for
twenty-three years.

He doesn't. From the same commit's message:

```console
$ git -C repos/postgres log -1 --format='%b' 39df0f150c | grep -iE 'twenty-three|not to do'
changing a default estimate that's survived for twenty-three years seems
like something not to do without a lot more testing than I care to put
```

[R3] He improves only the cases he can back with evidence, and leaves the guess exactly where it
is — not because he thinks a third is correct, but because it has *survived twenty-three years*.
Every index built, every query tuned, every application that ever ran acceptably on this database
did so downstream of that number. Change it and you re-plan all of them at once: some faster,
some ruinously slower, and no way to know which before real workloads hit it. The number is
wrong, and it is also the thing an entire ecosystem has quietly grown to fit.

~ A number that has been wrong for long enough is not a mistake. It is a contract.

## 2023: the feature he won't ship

Eight years on, the same instinct in a sharper form. People had long wanted a particular feature:
the ability to delete one value from an `enum` type — `ALTER TYPE ... DROP VALUE`. It sounds
easy. It is a trap, and rather than build it wrong or wait for someone else to, Tom Lane landed
this:

```console
$ git -C repos/postgres log -1 --format='%s%n%n%b' af3ee8a086 | head -5
Add some notes about why "ALTER TYPE enum DROP VALUE" is hard.

In hopes of putting these where any would-be implementer is sure to
find them, make a placeholder grammar production for ALTER DROP VALUE
and put them there.  This is really just a docs patch, though.
```

[R6] He added the syntax to the grammar — so the database will *parse* `ALTER TYPE ... DROP
VALUE` — and wired it to do exactly one thing: fail, and print the reasons it is hard.

```console
$ git -C repos/postgres show af3ee8a086 -- src/backend/parser/gram.y | grep -E '^\+' | sed -n '4,10p'
+				 * The following problems must be solved before this can be
+				 * implemented:
+				 * - There must be no instance of the target value in
+				 *   any table.
+				 * - The value must not appear in any catalog metadata,
+				 *   such as stored view expressions or column defaults.
+				 * - The value must not appear in any non-leaf page of a
+				 *   btree (and similar issues with other index types).
```

[R7] He could have written those hazards on a wiki or a mailing list — places the next person
will not look before they start coding. The grammar file, at the exact syntax they are about to
implement, is the one place they cannot miss it. So he put the checklist there, guarding a
feature that does not exist, and said so in the message: *this is really just a docs patch.*

~ He shipped the reasons not to ship it, at the door the next person has to walk through.

## 2025: the fix he undoes

Now the decision that turns restraint into law. Ten years after 2015, a well-meaning refactor had
finally done the tidy thing — dropped that `0.3333333` fallback for a class of function calls, on
the reasonable grounds that the planner had better options now. Tom Lane put it back:

```console
$ git -C repos/postgres blame -L 1606,1612 HEAD -- src/backend/utils/adt/selfuncs.c
1eccb9315070 (Tom Lane 2025-09-20 12:44:52 -0400 1606) 		 * If we have no stats and it's a function call, estimate 0.3333333.
1eccb9315070 (Tom Lane 2025-09-20 12:44:52 -0400 1607) 		 * This seems a pretty unprincipled choice, but Postgres has been
1eccb9315070 (Tom Lane 2025-09-20 12:44:52 -0400 1608) 		 * using that estimate for function calls since 1992.  The hoariness
1eccb9315070 (Tom Lane 2025-09-20 12:44:52 -0400 1609) 		 * of this behavior suggests that we should not be in too much hurry
1eccb9315070 (Tom Lane 2025-09-20 12:44:52 -0400 1610) 		 * to use another value.
```

[R4] Read the 1992 comment and this one together, because between them the instruction has
completely reversed. The original said `XXX ... really need a true selectivity function` — *fix
me.* This one says the choice is `unprincipled`, admits it plainly, and then concludes that its
`hoariness` — its sheer age — is the reason `not to be in too much hurry to use another value`.
*Do not fix me.* The most authoritative engineer in the project restored a number a grad student
called a hack in 1992, and left a warning for whoever next feels the urge to be clever about it.
On HEAD today the estimate is still one third [R5], now defended not despite its wrongness but
because of how long the wrongness has held.

## The hand

You keep meeting the same name because it is, to a startling degree, one person. Tom Lane's first
commit, in 1998, was not a landmark feature:

```console
$ git -C repos/postgres log --author='Tom Lane' --reverse --format='%h %ai %s' | head -1
502769d0dee 1998-10-01 01:26:45 +0000 Change HPUX loader flags to trap null pointer derefs
$ git -C repos/postgres rev-list --count --author='Tom Lane' HEAD
16863
```

[R8] Loader flags to catch null-pointer dereferences. Sixteen thousand eight hundred sixty-three
commits later — more than anyone else in the project's history — the thread running through that
enormous body of work is not what he added but what he judged safe to leave alone. The 1992 hack
he guards. The `enum` feature he declines and documents. The engineering that is easiest to
admire is the commit that adds something; the engineering that keeps a thirty-year-old database
trustworthy is the commit that adds a warning where a feature was demanded, or restores a wrong
number on purpose and tells you why not to touch it.

## At home

The habit from this dig is to stop reading `XXX`, `HACK`, and `TODO` as simple confessions of
unfinished work. Some are. But before you clean one up, do what Tom Lane did: look for the *prior
attempt*. Pickaxe the ugly constant — `git log -S` — or `git blame` the embarrassing comment, and
read the commits around it. If someone with more context already stood where you're standing and
chose not to fix it, their reason is usually recorded, and it is usually that the ugly thing has
become load-bearing in ways the diff can't show. The tell is a *second* comment layered over the
first: not `fix this`, but `here is why the obvious fix is the dangerous one`. When you find that,
you have found the most valuable and least visible thing a long-lived codebase holds — a decision
someone was careful enough to make, and then careful enough to explain to you before you undid it.

## Receipts

- **R1** `git -C repos/postgres show d31084e9d1:src/backend/optimizer/plan/initsplan.c | sed -n '195,198p'` — the 1996 imported root: `XXX ... set selectivity to 1/3 ... really need a true selectivity function`, then `= (Cost)0.3333333`.
- **R2** `git -C repos/postgres show d31084e9d1:src/backend/optimizer/path/clausesel.c | sed -n '242,245p'` — the same estimate's fuller confession: `THIS IS A HACK TO GET V4 OUT THE DOOR ... -- JMH 7/9/92`.
- **R3** `git -C repos/postgres log -1 39df0f150c` + `--format='%b'` — 2015-09-24, Tom Lane, "Allow planner to use expression-index stats…": keeps the fallback because "changing a default estimate that's survived for twenty-three years seems like something not to do."
- **R4** `git -C repos/postgres blame -L 1606,1612 HEAD -- src/backend/utils/adt/selfuncs.c` — 2025-09-20, Tom Lane restores the estimate: "unprincipled choice, but Postgres has been using that estimate … since 1992. The hoariness of this behavior suggests that we should not be in too much hurry to use another value."
- **R5** `git -C repos/postgres grep -n '0.3333333' HEAD -- src/backend/utils/adt/selfuncs.c` — the estimate is still on HEAD.
- **R6** `git -C repos/postgres log -1 af3ee8a086` — 2023-10-03, Tom Lane, "Add some notes about why 'ALTER TYPE enum DROP VALUE' is hard": a placeholder grammar production so an implementer is "sure to find them."
- **R7** `git -C repos/postgres show af3ee8a086 -- src/backend/parser/gram.y` — the added production only raises `FEATURE_NOT_SUPPORTED`, above a checklist of the unsolved problems.
- **R8** `git -C repos/postgres log --author='Tom Lane' --reverse | head -1` + `rev-list --count --author='Tom Lane' HEAD` — first commit 1998-10-01 ("Change HPUX loader flags…"); 16,863 commits, the most of anyone in the project.

*Full transcripts: `chapters/15-postgres.receipts.md` (regenerate with `scripts/receipts-15.sh`).*
