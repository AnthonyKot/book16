# Fixed once (badly) by me eleven years ago

*This is the full dig — every command, every receipt. The plain-English telling of the same story
is here: [Fixed once (badly) by me eleven years ago](17-dirtycow.html).*

Most commit messages are written to explain a change. Every so often one is written to confess.
Here is the opening of a patch Linus Torvalds committed to the Linux kernel in October 2016 [R4]:

```console
$ git -C repos/linux show -s --format='%b' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 | sed -n '1,4p'
This is an ancient bug that was actually attempted to be fixed once
(badly) by me eleven years ago in commit 4ceb5db9757a ("Fix
get_user_pages() race for write access") but that was then undone due to
problems on s390 by commit f33ea7f404e5 ("fix get_user_pages bug").
```

A patch that opens by citing two older patches by their hashes is a patch that has read its own
history. This one names the crime scene, the original author of the mistake — himself — and the
follow-up that undid the first fix eleven years earlier. That eleven-year gap is the subject of
this chapter, because for most of it the kernel that runs most of the world's servers, phones, and
routers carried a hole that had already been found, already been patched, and then had the patch
taken back out for a genuinely good reason. This is not a story about a bug nobody caught. It is
stranger: a bug that was caught, fixed, and then deliberately reverted — after which everyone was
free to forget it for a decade.

The word `get_user_pages` and the phrase "eleven years" are all you need for now. The name the
security world would eventually hang on it comes at the end, from someone else's mouth. Let us
start where the ledger does, on a Monday morning in 2005.

## The first fix

August 1st, 2005, 11:14 in the morning, Pacific time. Linus writes a small patch to `mm/memory.c`
— the part of the kernel that manages memory, the most load-bearing code there is — and his
message describes the race with unusual candor [R1]:

```console
$ git -C repos/linux show -s --format='%B' 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6 | sed -n '1,9p'
Fix get_user_pages() race for write access

There's no real guarantee that handle_mm_fault() will always be able to
break a COW situation - if an update from another thread ends up
modifying the page table some way, handle_mm_fault() may end up
requiring us to re-try the operation.

That's normally fine, but get_user_pages() ended up re-trying it as a
read, and thus a write access could in theory end up losing the dirty
```

To feel this you need one idea, and it has a homely name: copy-on-write, or COW. When two
processes hold what looks like the same page of memory, the kernel does not keep two copies. It
keeps one, marks it read-only, and hands both a pointer. The moment one tries to *write*, the
hardware traps, the kernel quietly makes that writer a private copy, and the write lands on the
copy. Two processes, the illusion of two pages, the cost of one until someone changes something.
It is one of the most elegant tricks an operating system has, and almost everything leans on it.

The race lives in the gap between "the hardware traps" and "the kernel makes the copy." There is
a narrow window in which two threads, racing, can arrange for a write to land on the *original*
read-only page instead of a private copy — the illusion punctured, a process writing to memory it
was only ever allowed to read. Sit with that last part, because it is the whole future of the
chapter: the write can land on a page the process was supposed only to read, which is how, years
later, an unprivileged user gets to modify a file the system swears is read-only. In 2005 this is,
in Linus's own later words, a "purely theoretical race," and he fixes it the way a careful person
tightens a screw they walked past. Note the shape of the fix: `4 insertions, 17 deletions` [R1].
It made the code *shorter*. Remember that.

## The undo

Two days later, August 3rd, the fix comes back out. Not by accident, and not by a fool — the
commit is authored by Nick Piggin, signed off by Hugh Dickins, committed by Linus himself [R2].
Three of the most respected memory-management engineers alive, agreeing. Their reason is precise
[R2]:

```console
$ git -C repos/linux show -s --format='%B' f33ea7f404e592e4563b12101b7a4d17da6558d7 | sed -n '1,6p'
[PATCH] fix get_user_pages bug

Checking pte_dirty instead of pte_write in __follow_page is problematic
for s390, and for copy_one_pte which leaves dirty when clearing write.

So revert __follow_page to check pte_write as before, and make
```

Linus's fix worked by inspecting a specific piece of hardware bookkeeping — the "dirty" bit, which
marks a page as having been written to. On the mainframe architecture called s390, that bit did
not behave the way the fix assumed. So the elegant two-day-old patch was correct on the machines
most people had and *wrong* on a machine some people had, and "wrong in the memory manager on one
architecture" is not a thing you ship. They reverted the approach and replaced it with a more
elaborate mechanism that sidestepped the dirty bit entirely.

This is the decision the whole chapter pivots on, and I want to be scrupulously fair to it,
because hindsight makes it look careless and it was the opposite. They had a fix for a theoretical
race that broke a real architecture. They chose the real architecture. Faced with "a bug nobody
has ever triggered" versus "a regression on hardware we support," any responsible maintainer
protects the hardware. The theoretical race went back to being theoretical, on purpose, and
everyone in that thread was right.

And here is the quiet mechanism of the whole disaster: a correct decision does not leave a ticket
open. The replacement commit does not say "come back when s390 is fixed." Nothing in the record
ties the reverted race to a future in which it might matter again. The knowledge that the hole was
still there had nowhere to live except in the memory of the people who were in the thread — and
memory is not version-controlled.

## What the years changed

Nothing in the code had to change for the danger to grow. The world changed around the frozen
lines. Here is Linus in 2016, naming the two clocks that had been running the whole time [R4]:

```console
$ git -C repos/linux show -s --format='%b' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 | sed -n '6,13p'
In the meantime, the s390 situation has long been fixed, and we can now
fix it by checking the pte_dirty() bit properly (and do it better).  The
s390 dirty bit was implemented in abf09bed3cce ("s390/mm: implement
software dirty bits") which made it into v3.9.  Earlier kernels will
have to look at the page state itself.

Also, the VM has become more scalable, and what used a purely
theoretical race back then has become easier to trigger.
```

The first clock: the reason for the 2005 revert *expired*. The s390 dirty bit got a real
implementation in Linux v3.9 — released in 2013 — which meant the objection that killed the
original fix had quietly stopped being true years before anyone connected it back to the sleeping
race. The obstacle dissolved and nobody noticed, because nobody was watching that particular
obstacle. Why would they? It guarded a door everyone had forgotten.

The second clock: `the VM has become more scalable, and what used a purely theoretical race back
then has become easier to trigger.` That is the whole of what the receipt supports, and it is
enough — the kernel learned to do more things at once, and a collision that was almost impossible
to force in 2005 became something a determined attacker could hit. The code stood still while the
thing that had made it safe drained out from under it. This is the quiet horror of the chapter: no
commit made it dangerous. Time did.

## Reported-and-tested-by

The bug was not rediscovered by someone auditing old memory code. It was found the way these
things usually are — in the wild, already in use. The 2016 fix carries an unusual credit line [R4]:

```console
$ git -C repos/linux show -s --format='%b' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 | grep -i reported
Reported-and-tested-by: Phil "not Paul" Oester <kernel@linuxace.com>
```

*Reported-and-tested-by* — not "found while reviewing." Phil Oester had been capturing the inbound
web traffic to his own servers, and he pulled a live exploit for this race straight out of that
capture: the attack caught in the act, not imagined in a lab.
<!-- VERIFIED: Phil Oester discovered CVE-2016-5195 (Dirty COW) from an exploit found in captured inbound HTTP traffic to a server he ran; a local privilege-escalation race in the kernel's copy-on-write memory handling. https://en.wikipedia.org/wiki/Dirty_COW and https://www.helpnetsecurity.com/2016/10/21/dirty-cow-linux-kernel-zero-day/ -->
The parenthetical "not Paul" is a small human joke sitting in the metadata of what would turn out
to be one of the more consequential Linux fixes of the decade — a man tired of being confused with
someone else, preserved forever in the permanent record because he happened to be the one who
noticed a fire that had smoldered since 2005.

Look at the two dates on the fix, because they are their own small tell [R4]:

```console
$ git -C repos/linux show -s --format='authored %aI%ncommitted %cI' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619
authored 2016-10-13T13:07:36-07:00
committed 2016-10-18T14:13:29-07:00
```

Authored October 13th, committed October 18th — a five-day gap, on a patch Linus both wrote and
committed. Git records the delay; it does not explain it. But the same commit carries `Cc:
stable@vger.kernel.org` — the request to ship it back through every supported kernel — and the
public write-ups of Dirty COW land on October 19th and 20th.
<!-- VERIFIED: CVE-2016-5195 publicly disclosed 2016-10-19/20; the fix commit is dated 2016-10-18. https://en.wikipedia.org/wiki/Dirty_COW and https://www.helpnetsecurity.com/2016/10/21/dirty-cow-linux-kernel-zero-day/ -->
Five days between a finished fix and a public commit, ending the day before the world was told, is
the shape a coordinated disclosure leaves in a ledger.

## The fix, and its long tail

The actual repair is `13 insertions, 2 deletions` [R4], and its heart is a new internal flag with
an honest name [R5, R6]:

```console
$ git -C repos/linux show --format= --no-ext-diff 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 -- mm/gup.c | sed -n '6,17p'
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

Instead of the racy old trick of clearing the "I want to write" flag mid-fault, the code sets a new
flag, `FOLL_COW`, meaning *"yes, we already did the copy"* — and then a write is allowed only when
that flag **and** the dirty bit together confirm the copy really happened. It is, in spirit, the
same insight Linus had in 2005 — validate the dirty bit properly — now finally reachable because
the s390 obstacle that killed the first attempt was gone. The idea took eleven years to ship, not
because it was wrong, but because the ground it needed did not exist yet.

And then the receipts show the thing this book keeps insisting on: a fix is not an ending. Three
months later, in 2017, Keno Fischer finds that the 2016 patch fixed the ordinary case but forgot
its twin — the same check on "transparent huge pages" — leaving an infinite loop in the kernel;
that fix, too, goes to stable [R7]. In 2020 Linus revisits the area to document that a
copy-on-write page "can break either way," a subtlety the original model had glossed [R8]. And in
2022 David Hildenbrand removes the `FOLL_COW` flag entirely while fixing a *descendant*
vulnerability, and his message finally says the ancestor's name out loud [R9]:

```console
$ git -C repos/linux show -s --format='%b' 5535be3099717646781ce1540cf725965d680e7b | sed -n '1,3p'
Ever since the Dirty COW (CVE-2016-5195) security issue happened, we know
that FOLL_FORCE can be possibly dangerous, especially if there are races
that can be exploited by user space.
```

Six years on, the bug is no longer an embarrassment described obliquely. It is a landmark other
engineers steer by — *ever since Dirty COW* — the way sailors name a reef after the ship that
found it.

## What it cost

Here is the blast radius, and it is why this is not a curiosity. Dirty COW — CVE-2016-5195 — is a
local privilege escalation: an unprivileged user on the machine could use the race to write to
files they were only allowed to read, and turn that into full root. The vulnerable code shipped in
every kernel from 2.6.22, released in September 2007, until the 2016 fix — so roughly nine years of
Linux, which by then meant most of the servers on the internet and, through Android, a large share
of the phones on earth. The exploit was reliable, fast, and left nothing in the logs.
<!-- VERIFIED: CVE-2016-5195 affected Linux kernels from 2.6.22 (Sep 2007) to before 4.8.3; local privilege escalation via the COW race; affected Linux servers and Android devices; reliable and leaves no log trace. https://en.wikipedia.org/wiki/Dirty_COW and https://access.redhat.com/security/vulnerabilities/DirtyCow -->
It was patched in the mainline kernel within days of Oester's report — but "the mainline kernel" and
"the billions of devices running it" are separated by every vendor and carrier who has to ship the
update, and many never did. The fix was eleven years late to the tree and, for a great many phones,
never arrived at all.

## At home

The habit here is a specific kind of paranoia, and it is aimed at your revert button. When you back
out a fix — for a real, good, defensible reason, the way those engineers did in 2005 — the danger
that fix addressed does not go back in the box. It goes to sleep, and it sleeps exactly as long as
your reason stays true. The 2005 revert was correct and it left nothing behind, and "nothing
behind" is what cost the eleven years. So when you revert something that closed a hole, leave a
live tripwire, not a memory. Write the comment the 2005 patch didn't:

```c
/* Validating pte_dirty here is unsafe on s390 until it has software
 * dirty bits; we take the VM_FAULT_WRITE path instead. Revisit when
 * that lands — the underlying get_user_pages write race is still open. */
```

A comment like that, or a test that fails loudly when the unsafe condition returns, or an issue that
names the reverted commit's hash — any of them turns "someone has to remember" into "the code
remembers." And when you are on the other side, meeting a suspicious line — a flag that guards
something expensive, a check that looks safe to skip — don't reach for `git blame`, which only
explains the lines that survived. Reach for `git log -S` on the exact token and read every commit
that added or removed it, oldest first. A protection that was added, reverted, and only re-added
eleven years later is not noise; it is an argument the code had with itself, and the reason it is
currently set the way it is lives in the message of whoever set it last. Linus could reconstruct
the entire eleven-year arc from two hashes because someone — him — had written those hashes down.
The history remembers what the three smartest people in the room forgot. You only have to ask it.

## Receipts

- **R1** `git -C repos/linux show -s ... 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6` — 2005-08-01, Linus, "Fix get_user_pages() race for write access": the first fix; `4 insertions, 17 deletions`.
- **R2** `git -C repos/linux show -s ... f33ea7f404e592e4563b12101b7a4d17da6558d7` — 2005-08-03: author Nick Piggin, `Signed-off-by: Hugh Dickins`, committed by Linus; reverts the `pte_dirty` approach because it breaks s390 and `copy_one_pte`.
- **R3** `git -C repos/linux show -s --format='%H %aI %an | %s' 4ceb5db9... f33ea7f4... 19be0eaf...` — the three commits on one timeline: 2005-08-01, 2005-08-03, 2016-10-13.
- **R4** `git -C repos/linux show -s ... 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619` — 2016 fix; message names the 2005 attempt and undo by hash, "ancient bug", s390 fixed in abf09bed3cce (v3.9), "easier to trigger"; `Reported-and-tested-by: Phil "not Paul" Oester`; authored 2016-10-13, committed 2016-10-18; `Cc: stable`; `2 files changed, 13 insertions(+), 2 deletions(-)`.
- **R5** `git -C repos/linux show ... 19be0eaf... -- include/linux/mm.h mm/gup.c` — hunk one: `+#define FOLL_COW 0x4000`.
- **R6** `git -C repos/linux show ... 19be0eaf... -- mm/gup.c | sed -n '6,17p'` — `can_follow_write_pte()` requiring `FOLL_COW && pte_dirty`, and `*flags |= FOLL_COW` replacing `*flags &= ~FOLL_WRITE`.
- **R7** `git -C repos/linux show -s ... 8310d48b125d19fcd9521d83b8293e63eb1646aa` — 2017, Keno Fischer: the forgotten transparent-huge-page case; infinite loop in the kernel; `Cc: stable`.
- **R8** `git -C repos/linux show -s ... 17839856fd588f4ab6b789f482ed3ffd7c403e1f` — 2020, Linus: documents "COW can break either way."
- **R9** `git -C repos/linux show -s ... 5535be3099717646781ce1540cf725965d680e7b` — 2022, David Hildenbrand: "Ever since the Dirty COW (CVE-2016-5195)…", removes `FOLL_COW`.
