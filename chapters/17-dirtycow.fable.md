# Fixed once (badly) by me eleven years ago

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [Fixed once (badly) by me eleven years ago](17-dirtycow.html).*

Most commit messages are written to explain a change. Every so often one is written to confess.
Here is the opening of a patch Linus Torvalds committed to the Linux kernel in October 2016 [R4]:

```console
$ git -C repos/linux show -s --format='%B' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619
mm: remove gup_flags FOLL_WRITE games from __get_user_pages()

This is an ancient bug that was actually attempted to be fixed once
(badly) by me eleven years ago in commit 4ceb5db9757a ("Fix
get_user_pages() race for write access") but that was then undone due to
problems on s390 by commit f33ea7f404e5 ("fix get_user_pages bug").
```

A patch that begins by citing two older patches by their hashes is a patch that has read its own
history. This one names the crime scene, the original culprit — himself — and the accomplice who
quietly undid the first fix eleven years earlier. That eleven-year gap is the subject of this
chapter, because for most of it the kernel that runs most of the world's servers, phones, and
routers carried a hole that had already been found, already been fixed, and then un-fixed for an
excellent reason. This is not a story about a bug nobody caught. It is worse: it is a story about
a bug that was caught, patched, and then deliberately let back out.

The security world would eventually give it a name — Dirty COW — and a serial number,
CVE-2016-5195. <!-- CHECK: Dirty COW = CVE-2016-5195, a local privilege-escalation race in the
Linux kernel's copy-on-write handling, disclosed October 2016; needs external source. --> But
names came at the end. Let us start where the ledger does, on a Monday morning in 2005.

## The first fix

August 1st, 2005, 11:14 in the morning, Pacific time. Linus writes a small patch to a file called
`mm/memory.c` — the part of the kernel that manages memory, the most load-bearing code there is —
and his message describes a race condition with unusual candor for a bug report [R1]:

```console
$ git -C repos/linux show -s --format='%B' 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6
Fix get_user_pages() race for write access

There's no real guarantee that handle_mm_fault() will always be able to
break a COW situation ...
a write access could in theory end up losing the dirty
bit or be done on a page that had not been properly COW'ed.
```

To feel this you need one idea, and it has a homely name: copy-on-write, or COW. When the system
has two programs that both hold what looks like the same page of memory, it does not actually keep
two copies. It keeps one, marked read-only, and hands both programs a pointer to it. The moment
one of them tries to *write*, the hardware traps, the kernel quietly makes a private copy for the
writer, and the write lands on the copy. Two programs, the illusion of two pages, the cost of one
until the instant someone changes something. It is one of the most elegant tricks in an operating
system, and almost everything relies on it.

The race Linus is describing lives in the gap between "the hardware traps" and "the kernel makes
the copy." There is a narrow window in which two threads, racing, can arrange for a write to land
on the *original* read-only page instead of a private copy — the illusion punctured, one program
scribbling on memory it was only supposed to be able to read. In 2005 this is, in his own later
words, a "purely theoretical race." The machines of the era are mostly single-processor; the
window is vanishingly thin. He fixes it anyway, the way a careful person tightens a screw they
walked past, and moves on. Note the shape of it: `4 insertions, 17 deletions` [R1]. The fix made
the code *shorter*. It simplified the exact function at the center of the story. Remember that.

## The undo

Two days later, August 3rd, the fix comes back out. Not by accident, and not by a fool — the
commit is authored by Hugh Dickins, cleaned up by Nick Piggin, committed by Linus himself [R2].
Three of the most respected memory-management engineers alive, agreeing. Their reason is precise
[R2]:

```console
$ git -C repos/linux show -s --format='%B' f33ea7f404e592e4563b12101b7a4d17da6558d7
[PATCH] fix get_user_pages bug

Checking pte_dirty instead of pte_write in __follow_page is problematic
for s390, and for copy_one_pte which leaves dirty when clearing write.
...
```

Linus's fix had worked by inspecting a specific bit of hardware bookkeeping — the "dirty" bit,
which marks a page as having been written to. On the mainframe architecture called s390, that bit
did not behave the way the fix assumed. So the elegant two-day-old patch was correct on the
machines most people had and *wrong* on a machine some people had, and "wrong in the memory
manager on one architecture" is not a thing you ship. They reverted the approach and replaced it
with a more elaborate mechanism that sidestepped the dirty bit entirely.

This is the decision the whole chapter pivots on, and I want to be scrupulously fair to it,
because hindsight makes it look careless and it was the opposite. They had a fix for a theoretical
race that broke a real architecture. They chose the real architecture. Faced with "a bug nobody
has ever triggered" versus "a regression on hardware we support," any responsible maintainer
protects the hardware. The theoretical race went back to being theoretical. The screw Linus had
tightened was loosened again, on purpose, and everyone in that thread was right to loosen it.

The trap was set not by a mistake but by a correct decision, and it would stay set for eleven
years, because a correct decision does not leave a ticket open. Nobody filed "come back when s390
is fixed." The knowledge that the race still existed lived only in three people's heads and in a
reverted patch that, by definition, no longer ran.

## What the years changed

Nothing in `mm/memory.c` had to change for the danger to grow. The *world* changed around the
frozen code. Here is Linus in 2016 again, naming the two things that turned a curiosity into a
weapon [R4]:

```console
$ git -C repos/linux show -s --format='%b' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 | sed -n '5,11p'
In the meantime, the s390 situation has long been fixed ...

Also, the VM has become more scalable, and what used a purely
theoretical race back then has become easier to trigger.
```

Two clocks, running the whole time. The first: the reason for the 2005 revert *expired*. The s390
dirty bit got a proper implementation in a kernel released around 2013 <!-- CHECK: commit
abf09bed3cce "s390/mm: implement software dirty bits" landed in Linux v3.9, released ~2013; the
receipt R4 quotes the message naming abf09bed3cce and v3.9. -->, which meant the objection that
killed the original fix had quietly stopped being true years before anyone connected it back to
the sleeping race. The obstacle dissolved and nobody noticed, because nobody was watching that
particular obstacle — why would they? It guarded a door everyone had forgotten.

The second clock: machines grew. A "purely theoretical" race needs a freakishly precise collision
of timing to trigger. But as processors gained cores and the kernel learned to run more things at
once, the window that was nearly impossible to hit on a 2005 uniprocessor became something an
attacker with a tight enough loop could hit reliably on 2016 hardware. The code stood still while
the thing that made it safe — slowness, single-threadedness, luck — drained away underneath it.
This is the quiet horror of the chapter: no commit made it dangerous. Time did.

## The half-second that wasn't

The bug was not rediscovered by an auditor reading old memory-management code. It was found the
way these things usually are — in the wild, already being used. The 2016 fix carries an unusual
credit line [R4]:

```console
$ git -C repos/linux show -s --format='%b' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 | grep -i reported
Reported-and-tested-by: Phil "not Paul" Oester <kernel@linuxace.com>
```

*Reported-and-tested-by.* Not "found while reviewing." A researcher named Phil Oester extracted a
live exploit from a compromised server's captured traffic — the attack caught in the act, not
imagined in a lab. <!-- CHECK: Phil Oester discovered Dirty COW being actively exploited in the
wild, from an HTTP exploit captured on a server he ran; he named it; needs external source. --> By
the time the patch landed, this was not a theoretical race anymore in any sense. It was a
technique. The parenthetical "not Paul" is a small human joke sitting in the metadata of one of
the most serious Linux vulnerabilities ever shipped — a man tired of being confused with someone
else, immortalized in the permanent record of the kernel because he happened to be the one who
caught a fire that had been smoldering since 2005.

Look at the two timestamps on the fix, because they tell you how the disclosure worked [R4]:

```console
$ git -C repos/linux show -s --format='authored %aI%ncommitted %cI' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619
authored 2016-10-13T13:07:36-07:00
committed 2016-10-18T14:13:29-07:00
```

Written October 13th, committed October 18th — a five-day gap, in a project where Linus usually
commits his own work the same second he writes it. That gap is the coordinated-disclosure window:
the fix existed, finished, for five days before it entered the public tree, while distributions
were handed it privately so the patch and the announcement could land together. The one time the
two dates on a Torvalds commit disagree, the disagreement is itself a security artifact.

## The fix, and its long tail

The actual repair is fourteen lines [R4], and its heart is a new internal flag with an honest name
[R5, R6]:

```console
$ git -C repos/linux show --format= --no-ext-diff 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 -- mm/gup.c | sed -n '5,15p'
+/*
+ * FOLL_FORCE can write to even unwritable pte's, but only
+ * after we've gone through a COW cycle and they are dirty.
+ */
+static inline bool can_follow_write_pte(pte_t pte, unsigned int flags)
+{
+	return pte_write(pte) ||
+		((flags & FOLL_FORCE) && (flags & FOLL_COW) && pte_dirty(pte));
+}
```

Instead of the racy trick of clearing the "I want to write" flag mid-fault, the code now sets a
new flag, `FOLL_COW`, that means precisely *"yes, we already did the copy."* The write is allowed
only once that flag confirms the copy really happened. The fix is, in spirit, the same insight
Linus had in 2005 — validate the dirty bit properly — now that the hardware everywhere could
finally support it. Eleven years to ship the same idea, because the idea was never wrong; only its
timing was.

And then the receipts show the thing this book keeps insisting on: a fix is not an ending. Three
months later, in 2017, Keno Fischer discovers the 2016 patch fixed the ordinary case but forgot
its twin — the same check on "transparent huge pages" — leaving an infinite loop and a variant
hole; that too goes to the stable kernels [R7]. In 2020 Linus revisits the whole area to document
that a copy-on-write page "can break either way," a subtlety the original model had glossed [R8].
And in 2022 David Hildenbrand removes the `FOLL_COW` flag entirely while fixing a *descendant*
vulnerability, and his message finally says the ancestor's name out loud [R9]:

```console
$ git -C repos/linux show -s --format='%b' 5535be3099717646781ce1540cf725965d680e7b | sed -n '1,3p'
Ever since the Dirty COW (CVE-2016-5195) security issue happened, we know
that FOLL_FORCE can be possibly dangerous, especially if there are races
that can be exploited by user space.
```

Six years after the fix, the bug is no longer an embarrassment to be described obliquely. It is a
landmark other engineers navigate by — "ever since Dirty COW" — the way sailors name a reef after
the ship that found it.

## The one-character cousin

I want to set one more commit beside this, from a different project, because it isolates the single
transferable lesson. In 2018, Bitcoin shipped a fix for a bug that could have let someone forge
money. The entire repair is this [R10]:

```console
$ git -C repos/bitcoin show --format= --no-ext-diff b8f801964f59586508ea8da6cf3decd76bc0e571 -- src/validation.cpp | sed -n '5,8p'
     for (const auto& tx : block.vtx)
-        if (!CheckTransaction(*tx, state, false))
+        if (!CheckTransaction(*tx, state, true))
```

One word. `false` to `true`. That boolean controls whether the code bothers to check a block's
transactions for duplicate inputs — the check that stops someone from spending the same coin twice
inside one transaction, which in a currency is the difference between money and not-money. It had
been switched off by an earlier refactor that looked, like all the dangerous ones in this book,
completely reasonable. The commit message is four words of understatement — "Fix crash bug with
duplicate inputs" — and it does not mention that the same flaw could mint coins from nothing. That
admission arrives two months later, when someone adds a single comment naming the disaster [R11]:

```console
$ git -C repos/bitcoin show --format= --no-ext-diff 38bfca6bb2ad68719415e9c54a981441052da072 -- src/validation.cpp | sed -n '4,6p'
+    // Must check for duplicate inputs (see CVE-2018-17144)
     for (const auto& tx : block.vtx)
         if (!CheckTransaction(*tx, state, true))
```

<!-- CHECK: CVE-2018-17144 was a Bitcoin Core consensus/inflation vulnerability fixed September
2018, potentially allowing denial-of-service and coin inflation via duplicate inputs; needs
external source. --> The Linux hole was a bit assumed to be safe; the Bitcoin hole was a boolean
flipped to `false`. Both are one token. Both cost years or dollars. And in both, the git history
is the only place the true weight of the change is recorded — never in the commit that *made* the
danger, always in a later one that names it, once someone downstream has paid.

## At home

The habit here is a specific kind of paranoia, and it is aimed at your revert button. When you back
out a fix — for a real, good, defensible reason, the way those engineers did in 2005 — the danger
that fix addressed does not go back in the box. It goes back to sleep, and it sleeps exactly as long
as your reason stays true. So when you revert something that closed a hole, leave a live tripwire,
not a memory: an open ticket that references the reverted commit's hash, a test that fails loudly if
the unsafe condition returns, a comment at the site that says *this is safe only because of X* — so
that the day X stops being true, someone is standing there. The 2005 revert was correct and left
nothing behind, and "nothing behind" is what cost eleven years.

The tool that makes this searchable is right in front of you. When you meet a suspicious line —
a boolean that guards something expensive, a check that looks skippable — run `git log -S` on the
exact text to pull up every commit that ever added or removed it, and read those messages in
order. A flag that was `true`, then `false`, then `true` again is not noise. It is an argument the
code had with itself, and the reason it is currently set the way it is usually lives in the message
of whoever set it last. Linus could reconstruct the entire eleven-year arc from two hashes because
someone — him — had written those hashes down. The history remembers what the three smartest people
in the room forgot. You only have to ask it.

## Receipts

- **R1** `git -C repos/linux show -s ... 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6` — 2005-08-01, Linus, "Fix get_user_pages() race for write access": the first fix; `4 insertions, 17 deletions`.
- **R2** `git -C repos/linux show -s ... f33ea7f404e592e4563b12101b7a4d17da6558d7` — 2005-08-03, Hugh Dickins / Nick Piggin / committed by Linus: reverts the `pte_dirty` approach because it breaks s390 and `copy_one_pte`.
- **R3** `git -C repos/linux show -s --format='%H %aI %an | %s' 4ceb5db9... f33ea7f4... 19be0eaf...` — the three commits on one timeline: 2005-08-01, 2005-08-03, 2016-10-13.
- **R4** `git -C repos/linux show -s ... 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619` — 2016 fix; message names the 2005 attempt and revert by hash, "ancient bug", s390 fixed in abf09bed3cce (v3.9), "easier to trigger"; `Reported-and-tested-by: Phil "not Paul" Oester`; authored 2016-10-13, committed 2016-10-18; `Cc: stable`.
- **R5** `git -C repos/linux show ... 19be0eaf... -- include/linux/mm.h mm/gup.c | sed -n '1,12p'` — hunk one: `+#define FOLL_COW 0x4000`.
- **R6** `... | sed -n '13,50p'` — remaining hunks: `can_follow_write_pte()` validating `FOLL_COW && pte_dirty`, and `*flags |= FOLL_COW` replacing `*flags &= ~FOLL_WRITE`.
- **R7** `git -C repos/linux show -s ... 8310d48b125d19fcd9521d83b8293e63eb1646aa` — 2017, Keno Fischer: the forgotten transparent-huge-page case; infinite loop; `Cc: stable`.
- **R8** `git -C repos/linux show -s ... 17839856fd588f4ab6b789f482ed3ffd7c403e1f` — 2020, Linus: documents "COW can break either way."
- **R9** `git -C repos/linux show -s ... 5535be3099717646781ce1540cf725965d680e7b` — 2022, David Hildenbrand: "Ever since the Dirty COW (CVE-2016-5195)…", removes `FOLL_COW`, fixes CVE-2022-2590.
- **R10** `git -C repos/bitcoin show ... b8f801964f59586508ea8da6cf3decd76bc0e571 -- src/validation.cpp` — 2018, Suhas Daftuar: "Fix crash bug with duplicate inputs", the entire diff is `false` → `true`.
- **R11** `git -C repos/bitcoin show ... 38bfca6bb2ad68719415e9c54a981441052da072 -- src/validation.cpp` — 2018, later commit adds `// Must check for duplicate inputs (see CVE-2018-17144)` beside that call.
