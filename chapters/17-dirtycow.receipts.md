# Receipts — source 17 Dirty COW (the eleven-year COW race)

Verbatim outputs against the local torvalds/linux and bitcoin/bitcoin clones.
Regenerate with `scripts/receipts-17.sh`. Long outputs selected editorially with sed/head.

## R1 — 2005-08-01: Linus's first attempt to fix the write-access race
```
$ git -C repos/linux show --stat --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommitter: %cn <%ce>%nCommitDate: %cI%n%n%B' 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6
commit 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6
Author: Linus Torvalds <torvalds@g5.osdl.org>
AuthorDate: 2005-08-01T11:14:49-07:00
Committer: Linus Torvalds <torvalds@g5.osdl.org>
CommitDate: 2005-08-01T11:14:49-07:00

Fix get_user_pages() race for write access

There's no real guarantee that handle_mm_fault() will always be able to
break a COW situation - if an update from another thread ends up
modifying the page table some way, handle_mm_fault() may end up
requiring us to re-try the operation.

That's normally fine, but get_user_pages() ended up re-trying it as a
read, and thus a write access could in theory end up losing the dirty
bit or be done on a page that had not been properly COW'ed.

This makes get_user_pages() always retry write accesses as write
accesses by making "follow_page()" require that a writable follow has
the dirty bit set.  That simplifies the code and solves the race: if the
COW break fails for some reason, we'll just loop around and try again.

Signed-off-by: Linus Torvalds <torvalds@osdl.org>


 mm/memory.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)
```

## R2 — 2005-08-03: the s390/copy_one_pte objection and replacement protocol
```
$ git -C repos/linux show --stat --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommitter: %cn <%ce>%nCommitDate: %cI%n%n%B' f33ea7f404e592e4563b12101b7a4d17da6558d7
commit f33ea7f404e592e4563b12101b7a4d17da6558d7
Author: Nick Piggin <nickpiggin@yahoo.com.au>
AuthorDate: 2005-08-03T20:24:01+10:00
Committer: Linus Torvalds <torvalds@g5.osdl.org>
CommitDate: 2005-08-03T09:12:05-07:00

[PATCH] fix get_user_pages bug

Checking pte_dirty instead of pte_write in __follow_page is problematic
for s390, and for copy_one_pte which leaves dirty when clearing write.

So revert __follow_page to check pte_write as before, and make
do_wp_page pass back a special extra VM_FAULT_WRITE bit to say it has
done its full job: once get_user_pages receives this value, it no longer
requires pte_write in __follow_page.

But most callers of handle_mm_fault, in the various architectures, have
switch statements which do not expect this new case.  To avoid changing
them all in a hurry, make an inline wrapper function (using the old
name) that masks off the new bit, and use the extended interface with
double underscores.

Yes, we do have a call to do_wp_page from do_swap_page, but no need to
change that: in rare case it's needed, another do_wp_page will follow.

Signed-off-by: Hugh Dickins <hugh@veritas.com>
[ Cleanups by Nick Piggin ]
Signed-off-by: Linus Torvalds <torvalds@osdl.org>


 include/linux/mm.h | 22 +++++++++++++++++-----
 mm/memory.c        | 31 +++++++++++++++++++++++--------
 2 files changed, 40 insertions(+), 13 deletions(-)
```

## R3 — the three commits on one exact author-date timeline
```
$ git -C repos/linux show -s --format='%H %aI %an | %s' 4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6 f33ea7f404e592e4563b12101b7a4d17da6558d7 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619
4ceb5db9757aaeadcf8fbbf97d76bd42aa4df0d6 2005-08-01T11:14:49-07:00 Linus Torvalds | Fix get_user_pages() race for write access
f33ea7f404e592e4563b12101b7a4d17da6558d7 2005-08-03T20:24:01+10:00 Nick Piggin | [PATCH] fix get_user_pages bug
19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 2016-10-13T13:07:36-07:00 Linus Torvalds | mm: remove gup_flags FOLL_WRITE games from __get_user_pages()
```

## R4 — 2016: Linus's full account of the ancient bug, the undo, and the new fix
```
$ git -C repos/linux show --stat --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommitter: %cn <%ce>%nCommitDate: %cI%n%n%B' 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619
commit 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619
Author: Linus Torvalds <torvalds@linux-foundation.org>
AuthorDate: 2016-10-13T13:07:36-07:00
Committer: Linus Torvalds <torvalds@linux-foundation.org>
CommitDate: 2016-10-18T14:13:29-07:00

mm: remove gup_flags FOLL_WRITE games from __get_user_pages()

This is an ancient bug that was actually attempted to be fixed once
(badly) by me eleven years ago in commit 4ceb5db9757a ("Fix
get_user_pages() race for write access") but that was then undone due to
problems on s390 by commit f33ea7f404e5 ("fix get_user_pages bug").

In the meantime, the s390 situation has long been fixed, and we can now
fix it by checking the pte_dirty() bit properly (and do it better).  The
s390 dirty bit was implemented in abf09bed3cce ("s390/mm: implement
software dirty bits") which made it into v3.9.  Earlier kernels will
have to look at the page state itself.

Also, the VM has become more scalable, and what used a purely
theoretical race back then has become easier to trigger.

To fix it, we introduce a new internal FOLL_COW flag to mark the "yes,
we already did a COW" rather than play racy games with FOLL_WRITE that
is very fundamental, and then use the pte dirty flag to validate that
the FOLL_COW flag is still valid.

Reported-and-tested-by: Phil "not Paul" Oester <kernel@linuxace.com>
Acked-by: Hugh Dickins <hughd@google.com>
Reviewed-by: Michal Hocko <mhocko@suse.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Willy Tarreau <w@1wt.eu>
Cc: Nick Piggin <npiggin@gmail.com>
Cc: Greg Thelen <gthelen@google.com>
Cc: stable@vger.kernel.org
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>


 include/linux/mm.h |  1 +
 mm/gup.c           | 14 ++++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)
```

## R5 — the 2016 diff, hunk one: introduce FOLL_COW
```
$ git -C repos/linux show --format= --no-ext-diff 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 -- include/linux/mm.h mm/gup.c | sed -n '1,12p'
diff --git a/include/linux/mm.h b/include/linux/mm.h
index e9caec6a51e9..ed85879f47f5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2232,6 +2232,7 @@ static inline struct page *follow_page(struct vm_area_struct *vma,
 #define FOLL_TRIED	0x800	/* a retry, previous pass started an IO */
 #define FOLL_MLOCK	0x1000	/* lock present pages */
 #define FOLL_REMOTE	0x2000	/* we are working on non-current tsk/mm */
+#define FOLL_COW	0x4000	/* internal GUP flag */
 
 typedef int (*pte_fn_t)(pte_t *pte, pgtable_t token, unsigned long addr,
 			void *data);
```

## R6 — the 2016 diff, remaining hunks: validate COW and stop clearing FOLL_WRITE
```
$ git -C repos/linux show --format= --no-ext-diff 19be0eaffa3ac7d8eb6784ad9bdbc7d67ed8e619 -- include/linux/mm.h mm/gup.c | sed -n '13,50p'
diff --git a/mm/gup.c b/mm/gup.c
index 96b2b2fd0fbd..22cc22e7432f 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -60,6 +60,16 @@ static int follow_pfn_pte(struct vm_area_struct *vma, unsigned long address,
 	return -EEXIST;
 }
 
+/*
+ * FOLL_FORCE can write to even unwritable pte's, but only
+ * after we've gone through a COW cycle and they are dirty.
+ */
+static inline bool can_follow_write_pte(pte_t pte, unsigned int flags)
+{
+	return pte_write(pte) ||
+		((flags & FOLL_FORCE) && (flags & FOLL_COW) && pte_dirty(pte));
+}
+
 static struct page *follow_page_pte(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmd, unsigned int flags)
 {
@@ -95,7 +105,7 @@ retry:
 	}
 	if ((flags & FOLL_NUMA) && pte_protnone(pte))
 		goto no_page;
-	if ((flags & FOLL_WRITE) && !pte_write(pte)) {
+	if ((flags & FOLL_WRITE) && !can_follow_write_pte(pte, flags)) {
 		pte_unmap_unlock(ptep, ptl);
 		return NULL;
 	}
@@ -412,7 +422,7 @@ static int faultin_page(struct task_struct *tsk, struct vm_area_struct *vma,
 	 * reCOWed by userspace write).
 	 */
 	if ((ret & VM_FAULT_WRITE) && !(vma->vm_flags & VM_WRITE))
-		*flags &= ~FOLL_WRITE;
+	        *flags |= FOLL_COW;
 	return 0;
 }
```

## R7 — 2017 aftermath: the forgotten transparent-huge-page check, also sent to stable
```
$ git -C repos/linux show -s --format='%H%nAuthorDate: %aI%nAuthor: %an <%ae>%nSubject: %s%n%n%b' 8310d48b125d19fcd9521d83b8293e63eb1646aa | sed -n '1,17p;57,77p'
8310d48b125d19fcd9521d83b8293e63eb1646aa
AuthorDate: 2017-01-24T15:17:48-08:00
Author: Keno Fischer <keno@juliacomputing.com>
Subject: mm/huge_memory.c: respect FOLL_FORCE/FOLL_COW for thp

In commit 19be0eaffa3a ("mm: remove gup_flags FOLL_WRITE games from
__get_user_pages()"), the mm code was changed from unsetting FOLL_WRITE
after a COW was resolved to setting the (newly introduced) FOLL_COW
instead.  Simultaneously, the check in gup.c was updated to still allow
writes with FOLL_FORCE set if FOLL_COW had also been set.

However, a similar check in huge_memory.c was forgotten.  As a result,
remote memory writes to ro regions of memory backed by transparent huge
pages cause an infinite loop in the kernel (handle_mm_fault sets
FOLL_COW and returns 0 causing a retry, but follow_trans_huge_pmd bails
out immidiately because `(flags & FOLL_WRITE) && !pmd_write(*pmd)` is
true.
Fix this by updating follow_trans_huge_pmd in huge_memory.c analogously
to the update in gup.c in the original commit.  The same pattern exists
in follow_devmap_pmd.  However, we should not be able to reach that
check with FOLL_COW set, so add WARN_ONCE to make sure we notice if we
ever do.

[akpm@linux-foundation.org: coding-style fixes]
Link: http://lkml.kernel.org/r/20170106015025.GA38411@juliacomputing.com
Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Greg Thelen <gthelen@google.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
```

## R8 — 2020 aftermath: Linus documents that COW can break either way
```
$ git -C repos/linux show -s --format='%H%nAuthorDate: %aI%nAuthor: %an <%ae>%nSubject: %s%n%n%b' 17839856fd588f4ab6b789f482ed3ffd7c403e1f | sed -n '1,21p;31,55p'
17839856fd588f4ab6b789f482ed3ffd7c403e1f
AuthorDate: 2020-05-27T18:29:34-07:00
Author: Linus Torvalds <torvalds@linux-foundation.org>
Subject: gup: document and work around "COW can break either way" issue

Doing a "get_user_pages()" on a copy-on-write page for reading can be
ambiguous: the page can be COW'ed at any time afterwards, and the
direction of a COW event isn't defined.

Yes, whoever writes to it will generally do the COW, but if the thread
that did the get_user_pages() unmapped the page before the write (and
that could happen due to memory pressure in addition to any outright
action), the writer could also just take over the old page instead.

End result: the get_user_pages() call might result in a page pointer
that is no longer associated with the original VM, and is associated
with - and controlled by - another VM having taken it over instead.

So when doing a get_user_pages() on a COW mapping, the only really safe
thing to do would be to break the COW when getting the page, even when
only getting it for reading.
This adds logic to force a COW event by setting FOLL_WRITE on any
copy-on-write mapping when FOLL_GET (or FOLL_PIN) is used to get a page
pointer as a result.

The current semantics end up being:

 - __get_user_pages_fast(): no change. If you don't ask for a write,
   you won't break COW. You'd better know what you're doing.

 - get_user_pages_fast(): the fast-case "look it up in the page tables
   without anything getting mmap_sem" now refuses to follow a read-only
   page, since it might need COW breaking.  Which happens in the slow
   path - the fast path doesn't know if the memory might be COW or not.

 - get_user_pages() (including the slow-path fallback for gup_fast()):
   for a COW mapping, turn on FOLL_WRITE for FOLL_GET/FOLL_PIN, with
   very similar semantics to FOLL_FORCE.

If it turns out that we want finer granularity (ie "only break COW when
it might actually matter" - things like the zero page are special and
don't need to be broken) we might need to push these semantics deeper
into the lookup fault path.  So if people care enough, it's possible
that we might end up adding a new internal FOLL_BREAK_COW flag to go
with the internal FOLL_COW flag we already have for tracking "I had a
COW".
```

## R9 — 2022 aftermath: an explicit Dirty COW/CVE mention and removal of FOLL_COW
```
$ git -C repos/linux show -s --format='%H%nAuthorDate: %aI%nAuthor: %an <%ae>%nSubject: %s%n%n%b' 5535be3099717646781ce1540cf725965d680e7b | sed -n '1,20p;50,67p;83p'
5535be3099717646781ce1540cf725965d680e7b
AuthorDate: 2022-08-09T22:56:40+02:00
Author: David Hildenbrand <david@redhat.com>
Subject: mm/gup: fix FOLL_FORCE COW security issue and remove FOLL_COW

Ever since the Dirty COW (CVE-2016-5195) security issue happened, we know
that FOLL_FORCE can be possibly dangerous, especially if there are races
that can be exploited by user space.

Right now, it would be sufficient to have some code that sets a PTE of a
R/O-mapped shared page dirty, in order for it to erroneously become
writable by FOLL_FORCE.  The implications of setting a write-protected PTE
dirty might not be immediately obvious to everyone.

And in fact ever since commit 9ae0f87d009c ("mm/shmem: unconditionally set
pte dirty in mfill_atomic_install_pte"), we can use UFFDIO_CONTINUE to map
a shmem page R/O while marking the pte dirty.  This can be used by
unprivileged user space to modify tmpfs/shmem file content even if the
user does not have write permissions to the file, and to bypass memfd
write sealing -- Dirty COW restricted to tmpfs/shmem (CVE-2022-2590).
This fixes CVE-2022-2590. Note that only x86_64 and aarch64 are
affected, because only those support CONFIG_HAVE_ARCH_USERFAULTFD_MINOR.

Fortunately, FOLL_COW is no longer required to handle FOLL_FORCE. So
let's just get rid of it.

Thanks to Nadav Amit for pointing out that the pte_dirty() check in
FOLL_FORCE code is problematic and might be exploitable.

Note 1: We don't check for the PTE being dirty because it doesn't matter
	for making a "was COWed" decision anymore, and whoever modifies the
	page has to set the page dirty either way.

Note 2: Kernels before extended uffd-wp support and before
	PageAnonExclusive (< 5.19) can simply revert the problematic
	commit instead and be safe regarding UFFDIO_CONTINUE. A backport to
	v5.19 requires minor adjustments due to lack of
	vma_soft_dirty_enabled().
Cc: <stable@vger.kernel.org>	[5.16]
```

## R10 — Bitcoin twin: the entire 2018 repair is false to true
```
$ git -C repos/bitcoin show --stat --format='commit %H%nAuthor: %an <%ae>%nAuthorDate: %aI%nCommitter: %cn <%ce>%nCommitDate: %cI%n%n%B' b8f801964f59586508ea8da6cf3decd76bc0e571
commit b8f801964f59586508ea8da6cf3decd76bc0e571
Author: Suhas Daftuar <sdaftuar@gmail.com>
AuthorDate: 2018-09-17T15:50:55-04:00
Committer: Suhas Daftuar <sdaftuar@gmail.com>
CommitDate: 2018-09-17T15:50:55-04:00

Fix crash bug with duplicate inputs within a transaction

Introduced by #9049


 src/validation.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
```

```
$ git -C repos/bitcoin show --format= --no-ext-diff b8f801964f59586508ea8da6cf3decd76bc0e571 -- src/validation.cpp | sed -n '1,13p'
diff --git a/src/validation.cpp b/src/validation.cpp
index 947192be0e..59c3fb425f 100644
--- a/src/validation.cpp
+++ b/src/validation.cpp
@@ -3122,7 +3122,7 @@ bool CheckBlock(const CBlock& block, CValidationState& state, const Consensus::P
 
     // Check transactions
     for (const auto& tx : block.vtx)
-        if (!CheckTransaction(*tx, state, false))
+        if (!CheckTransaction(*tx, state, true))
             return state.Invalid(false, state.GetRejectCode(), state.GetRejectReason(),
                                  strprintf("Transaction check failed (tx hash %s) %s", tx->GetHash().ToString(), state.GetDebugMessage()));
 
```

## R11 — Bitcoin's later in-repo comment names CVE-2018-17144 at that true call
```
$ git -C repos/bitcoin show -s --format='commit %H%nAuthorDate: %aI%nAuthor: %an <%ae>%n%n%B' 38bfca6bb2ad68719415e9c54a981441052da072 | sed -n '1,18p'
commit 38bfca6bb2ad68719415e9c54a981441052da072
AuthorDate: 2018-11-10T09:11:22-08:00
Author: lucash-dev <lucash.dev@gmail.com>

Added comments referencing multiple CVEs in tests and production code.

This commit adds comments referencing multiple CVEs both in production and test code.
CVEs covered in this commit:

CVE-2010-5137
CVE-2010-5139
CVE-2010-5141
CVE-2012-1909
CVE-2012-2459
CVE-2012-3789
CVE-2018-17144

```

```
$ git -C repos/bitcoin show --format= --no-ext-diff 38bfca6bb2ad68719415e9c54a981441052da072 -- src/validation.cpp | sed -n '14,21p'
@@ -3136,6 +3136,7 @@ bool CheckBlock(const CBlock& block, CValidationState& state, const Consensus::P
             return state.Invalid(ValidationInvalidReason::CONSENSUS, false, REJECT_INVALID, "bad-cb-multiple", "more than one coinbase");
 
     // Check transactions
+    // Must check for duplicate inputs (see CVE-2018-17144)
     for (const auto& tx : block.vtx)
         if (!CheckTransaction(*tx, state, true))
             return state.Invalid(state.GetReason(), false, state.GetRejectCode(), state.GetRejectReason(),
```

