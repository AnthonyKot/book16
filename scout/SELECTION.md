# Blame — Round 1 selection (2026-08-19)

105 digs across 10 scouting reports, ranked against two gates:

- **The bar:** does it change how the reader reads *their own* repo? A dig must leave
  behind a command or a habit, not just an anecdote about someone else's project.
- **The cut:** surprise ≤2 ("everyone knows this") is out, even when the receipts are new.
  Folklore confirmations rated 3 by the scouts were re-judged; a few were demoted.

Verdict codes: **T1** chapter anchor · **T2** strong supporting dig / interlude ·
**T3** reserve, one-liner at most · **CUT** with reason.

---

## Ranked top 12 (chapter anchors)

1. **log4j2 #3 — "to improve performance"** (`8916625d91`, 2012). Two lines move interpolation
   from the operator's config string to the attacker-influenced message. The whole Log4Shell
   chain hangs on this pivot; digs 2/4/6/7 are its acts. *Reader habit: a perf refactor can
   change what the code IS; diff what gets evaluated, not how fast.*
2. **openssl #3 — Dual EC: remove, revert, remove again** (`200f249b8c`→`3b43568d5b`→`7fb7844f3b`).
   A suspected backdoor deleted, restored because FIPS wouldn't certify without it, deleted when
   the lab relented. *Reader habit: if you have a "validated" fork, that fork is where policy
   fights your diffs.*
3. **xz #7 + #5 — the Landlock `.` and the file that exists only in .gitignore**
   (`328c52da`, `4323bc3e`). One character disables the sandbox; the weapon everyone names was
   never a git object. *Reader habit: read the negative path of feature tests; diff your git
   tree against what you ship.*
4. **linux #2 — four day-ones, one an accidental NVIDIA README** (`a101ad9451`). Plus the
   genesis-myth siblings: cpython #1 (first two commits share one tree; the README inside
   contradicts its own date), openttd #1 (r1 = "Import of revision 975 of old (crashed) SVN"),
   bitcoin #1/#6 (two parallel early histories, 99 shared trees). One chapter: *the first commit
   is a title card.* *Reader habit: `git log --max-parents=0`; compare `^{tree}` of adjacent
   "firsts."*
5. **bitcoin #2 — the contributor named `--author=Satoshi Nakamoto`** (8 commits, July 2010).
   A quoting bug as a permanent identity, created while trying to preserve the founder's name.
   *Reader habit: `git shortlog -sne --all`; authorship is unfixable bytes, not a label.*
6. **openttd #3 — `320` is not a typo** (`7e22f243ed` / `61dba850af`). A kind one-cell "fix"
   reverted at 01:00 with the project's constitution in the message: we replicate the original
   binary, ugly numbers included. *Reader habit: `git log -S` a magic number before "fixing"
   it; reverts that quote a creed are the real style guide.*
7. **t2t #4 — the sinusoid rollback** (`e3e54900`/`e4ea462e`, 2019). A mathematically correct
   one-liner undone in nine days: "existing checkpoints will still load and run, but produce
   entirely incorrect results." Pairs with t2t #9 (same repo, sixteen days old, chooses the
   opposite: "This breaks existing models") and linux #7 (timestamp shipped twice to serve
   both broken eras). One chapter: *the installed base is the spec.*
8. **git #4 — 01:10, hash the bytes, not the zlib stream** (`d98b46f8`). Every object ID in
   every git repo dates to this night; blobs forgotten, fixed 24 minutes later, "convert-cache
   just magically fixes all errors." *Reader habit: hunt convert-* programs and post-midnight
   author dates around format flips.*
9. **t2t #3 — Vaswani reverts the future** (`a0bd0177`). Zero training loss as the bug report;
   the paper's first author deletes `look_right`. *Reader habit: `git log -S` on the name of a
   safety flag finds when the safety was bargained away.*
10. **linux #3 — Dirty COW's eleven-year fuse** (`4ceb5db9`→`f33ea7f4`→`19be0eaf`). Linus's own
    2005 fix, reverted for s390 in two days, repaid in 2016. Pairs with bitcoin #9
    (`false`→`true`: "redundant" check deleted 2016, inflation bug 2018). One chapter: *a
    reverted fix is not a closed fix.* *Reader habit: follow the revert of any security patch
    forward in time.*
11. **openttd #4 — "We consider GRF files trusted" (2004–2026)** with the comments-outlive
    cluster: linux #4 (Falcon "temporary hack", 21 years), linux #5 ("I promise", 18 years),
    openssl #7 (`-msie_hack`, deleted 2026: "not even certain this does what was intended"),
    t2t #5 (`TODO(noam): ask rsepassi` after both left). *Reader habit: grep the scary comment
    on HEAD and on the root commit; if both hit, it's a decades-old unclosed ticket.*
12. **cpython #6 — the FLUFL joke with a sunset clause** (`e3944a5e` → `55cc3450`). An April
    Fools' grammar change scheduled to become mandatory in 3.9; when Guido actually resigned
    they had to defuse it. *Reader habit: `__future__`-style (optional, mandatory) tuples are
    social contracts; jokes that encode future dates are time bombs.*

Chapter-count math: anchors 1–3 are three distinct story shapes (slow accretion,
institutional capture, sabotage); 4, 7, 10, 11 are cross-repo thematic chapters; 5, 6, 8,
9, 12 are single-dig chapters. That's ~10–12 chapters of material — enough to select
DOWN from, which is the right problem to have.

---

## Full disposition by repo

### xz (11 digs)
| dig | verdict | note |
|---|---|---|
| 1 import at 00:42 | **CUT** | surprise 2 by scout's own rating; import-boundary lesson covered by chapter 4 |
| 2 jiat75 → AUTHORS | **T2** | opening act of the sabotage chapter |
| 3 2023 shortlog flips | **T2** | same chapter; the year-window habit is the takeaway |
| 4 Hans Jansen ifunc ghost | **T1-support** | strongest name-dig in the cluster; sockpuppet-hunting habit |
| 5 build-to-host.m4 only in .gitignore | **T1** | anchor (top-12 #3) |
| 6 test files, "constant seed" | **T2** | the tell-sentence; support for anchor |
| 7 Landlock `.` | **T1** | anchor (top-12 #3) |
| 8 typo/Valgrind costume | **T2** | "read the two commits as one patch" |
| 9 SECURITY.md at 01:50 | **T2** | closing beat of the chapter |
| 10 removal commit | **CUT** | surprise 2; use one line ("read the revert as a table of contents") inside the chapter |
| 11 TODO outlived backdoor | **CUT** | surprise 2; the blame-on-TODO habit is carried by chapter 11 |

### git (11 digs)
| dig | verdict | note |
|---|---|---|
| 1 information manager from hell | **CUT** | surprise 2; pure folklore |
| 2 "so copyright it", +177s | **T2** | "read the second commit" habit; good interlude |
| 3 four-line Cheesy `git` | **T2** | scout said 5; demoted — charming, habit is thin ("the product name is a late adapter") |
| 4 01:10 hash flip | **T1** | anchor (top-12 #8) |
| 5 Junio arrives as a typo | **T1-support** | best "name appears" dig anywhere; anchor of the names chapter with go #3 |
| 6 joke comment outlives file | **T3** | folded into chapter 11 as a one-liner |
| 7 pack format, no unpacker | **T2** | "hopefully for the last time" as a searchable marker |
| 8 Big Tool Rename | **T3** | rename-archaeology habit, minor |
| 9 stop calling it stupid | **T3** | slogans die by demotion; one-liner |
| 10 clone hooks CVE revert | **T2** | the LFS carve-out; pairs with go #8 (syscall carve-out) |
| 11 gitk 2012→2025 | **T2** | %ai vs %ci habit; competes with openttd #9 and t2t #6 — keep the best one |

### openssl (10 digs)
| dig | verdict | note |
|---|---|---|
| 1 Heartbleed at 22:59:57 | **T2** | folklore redeemed by receipts (NYE minute, self-review); support for chapter 2 or "one night" |
| 2 the four-line fix | **CUT** | surprise 2; fold the "test arrives later, from outside" line into #1 |
| 3 Dual EC revert war | **T1** | anchor (top-12 #2) |
| 4 OpenTLS for sixteen hours | **T2** | delightful; genesis-chapter support |
| 5 cvs2svn planted 1998 | **T2** | genesis-chapter support (the `.rnd` entropy files!) |
| 6 Henson stops; names arrive after the fire | **T2** | names chapter; "professionalisation the disaster bought" |
| 7 -msie_hack 1998–2026 | **T1-support** | comments-outlive chapter |
| 8 "appears to be completely unused" (2004) | **T3** | overlaps #7; keep the better confession |
| 9 `>` → `>=` punycode | **T2** | smallest reproducible security diff; support for chapter 10 |
| 10 CCS 17 lines | **CUT** | surprise 2 |

### go (11 digs)
| dig | verdict | note |
|---|---|---|
| 1 1972 hello-world root | **T2** | famous joke, but the receipts (path anachronism, R=dmr, live blame) teach forgery detection; genesis chapter |
| 2 day one is a spec | **T3** | design-before-code; one-liner |
| 3 Ken: 10,958 lines in, 24 out | **T1-support** | names chapter co-anchor with git #5 |
| 4 gofmt "final resting place TBD" | **T2** | "look for the commit that APPLIES the tool" |
| 5 generics start 2008, `any` demoted | **T2** | a comment-out with 14 years of interest |
| 6 error interface, 34 lines | **T3** | fine but thin habit |
| 7 go1 = one token, no newline | **T2** | ceremony smaller than the work; lovely interlude |
| 8 compat promise unlinked; syscall carve-out | **T2** | "the first carve-out is when they learn what they promised" |
| 9 97,603-line C funeral | **T2** | names/rollback support (Russ deletes Ken's world, Rob reviews) |
| 10 httpoxy composition CVE | **T2** | "the vulnerability is the composition"; distinct lesson |
| 11 Year of the Gopher | **T3** | ritual-dates habit duplicated elsewhere; one-liner |

### log4j2 (10 digs)
| dig | verdict | note |
|---|---|---|
| 1 First version = SVN dump | **T3** | genesis chapter already covered; ghost-2008-prototype line is nice |
| 2 interpolator arrives 05:09 | **T2** | act one of the anchor chain |
| 3 perf refactor = blast radius | **T1** | anchor (top-12 #1) |
| 4 jndi + the documented colon | **T1-support** | act three; "prefix-unless-colon allow-lists every scheme" |
| 5 Android try/catch | **T2** | "optional dependency that is default-on is not optional" |
| 6 off switch defaults to on | **T1-support** | act four; the 2016 Camel ticket as the missed alarm |
| 7 eleven days before the CVE | **T2** | act five; the message that never says "security" |
| 8 JndiExploit.java Saturday night | **T2** | the fire itself; FQCN-exclude detail |
| 9 Remko/Piotr handover | **T3** | names chapter has stronger entries |
| 10 PluginManager TODO 2014–2022 | **T2** | TODO as load-bearing part of the vulnerability |

### cpython (10 digs)
| dig | verdict | note |
|---|---|---|
| 1 fabricated first commit | **T1** | genesis-chapter co-anchor; identical trees + self-contradicting README is the best single receipt |
| 2 object.h blame lands in 1990 | **T2** | "first commit of a FILE beats first commit of a repo" |
| 3 Zen invisible to pickaxe | **T2** | rot13 defeats `git log -S`; unique, keep |
| 4 GIL enters as SGI video helper | **T1-support** | "search the mechanism, not the nickname"; strong |
| 5 Print() capital P | **T2** | flag-day archaeology; good |
| 6 FLUFL defused | **T1** | anchor (top-12 #12) |
| 7 Guido writes one commit in 2018 | **T2** | names chapter; windowed shortlog habit |
| 8 hash randomization in 24h | **T2** | "a security commit that is mostly deletions" |
| 9 "not a chance" | **T2** | search the punchline, not the folklore |
| 10 Tim Peters CVS dry run | **CUT** | surprise 2 by scout's own rating |

### linux (11 digs)
| dig | verdict | note |
|---|---|---|
| 1 "Let it rip", 17,291 files | **T2** | genesis chapter; the "we have it and won't import it" sentence |
| 2 four roots, NVIDIA README | **T1** | anchor (top-12 #4) |
| 3 Dirty COW eleven-year fuse | **T1** | anchor (top-12 #10) |
| 4 Falcon temporary hack | **T1-support** | comments-outlive chapter; `git grep <string> <first-commit>` habit |
| 5 "I promise" (2008–) | **T2** | same chapter |
| 6 Copyright 1991, blamed 2005 | **CUT** | surprise 2; the `^` caret tell gets one sentence in chapter 4 |
| 7 timestamp shipped twice | **T1-support** | compatibility chapter; the commandment as a diff |
| 8 Linus reverts eventpoll blind | **T2** | "the integration branch is also a laptop" |
| 9 reiserfs: The last commit | **T2** | funerals-by-calendar; good closing-register material |
| 10 Alan Cox fades | **T3** | names chapter has stronger exits |
| 11 Itanium removal | **CUT** | surprise 2 |

### bitcoin (11 digs)
| dig | verdict | note |
|---|---|---|
| 1 day one is Martti + DLLs | **T2** | genesis chapter; "Satoshi's January 3rd keystroke is not here" |
| 2 --author=Satoshi | **T1** | anchor (top-12 #5) |
| 3 overflow Sunday anatomy | **T1-support** | panic patch (wrong block number) vs durable rule (MAX_MONEY) vs amputation (scanback); "one night" chapter with git #4 |
| 4 Satoshi's last object | **CUT** | surprise 2; one line in the names chapter ("no goodbye; Gavin commits two hours later") |
| 5 Gavin arrives as Fix CRLF | **T2** | names chapter; janitorial first commits |
| 6 two histories, 99 shared trees | **T2** | genesis chapter support |
| 7 Satoshi deletes the marketplace at 04:03 | **T2** | "what was this repo originally" answered by a deletion; fresh |
| 8 alert system born after overflow | **T2** | emergency features outlive the emergency |
| 9 false→true inflation | **T1-support** | pairs with Dirty COW (top-12 #10) |
| 10 shortlog windows | **CUT** | surprise 2; method duplicated everywhere |
| 11 MAX_MONEY museum placard | **CUT** | surprise 2; one sentence in dig 3's chapter |

### openttd (10 digs)
| dig | verdict | note |
|---|---|---|
| 1 r1 of a crashed SVN | **T1-support** | genesis chapter; the only repo whose origin is a hole because the VCS died |
| 2 ludde, a guest in his own house | **T2** | names chapter; monument vs shortlog |
| 3 320 is not a typo | **T1** | anchor (top-12 #6) |
| 4 GRF trusted, 22 years | **T1** | anchor (top-12 #11) |
| 5 helicopter FIXME 2004–2025 | **T2** | "deleting the comment is not doing the work" |
| 6 Chris Sawyer's files as a dependency | **T2** | hashing files you can't distribute; distinct lesson |
| 7 shortlog windows | **T3** | method covered; the 00:30 exit detail is nice |
| 8 $Id$ planted/harvested | **T3** | migration scar; one-liner |
| 9 nine-year author/committer gap | **T2** | best %ai-vs-%ci exhibit (3,374 days); beats git #11 and t2t #6 |
| 10 NoAI nursery rhyme | **T3** | charming; thin habit |

### tensor2tensor (10 digs)
| dig | verdict | note |
|---|---|---|
| 1 155-second Transformer | **T2** | genesis chapter; "the name on the dump is who could push, not who invented" |
| 2 leakr week | **T2** | "grep your own internal path fragments"; fresh |
| 3 Vaswani reverts the future | **T1** | anchor (top-12 #9) |
| 4 sinusoid rollback | **T1** | anchor (top-12 #7) |
| 5 TODO(noam): ask rsepassi | **T2** | comments-outlive chapter; names a person who left |
| 6 Copybara year-rollover | **T3** | %ai/%ci habit; openttd #9 is the better exhibit |
| 7 paper authors stop typing | **T2** | 2228-commit year → 4-commit year; "museum with lights on a timer" |
| 8 revert-of-revert before lunch | **T3** | "two hours is a short revert war"; one-liner |
| 9 "This breaks existing models" | **T1-support** | compatibility chapter's counter-case |
| 10 Trax kills the parent in the README | **T2** | "a project dies in a commit about something else" |

---

## Tally

- **T1 anchors:** 12 (the ranked list above)
- **T1-support:** 11 (named acts inside anchor chapters)
- **T2:** 45
- **T3:** 20
- **CUT:** 17 — twelve at the scouts' own ≤2 rating (xz 1/10/11, git 1, openssl 2/10,
  cpython 10, linux 6/11, bitcoin 4/10/11), five by judgment where a 3-rated dig only
  confirms folklore or duplicates a habit taught better elsewhere (none of the five
  removes unique material; each survives as a one-liner inside a chapter).

## Cross-repo observations the selection surfaced

1. **Every repo failed the folklore grep.** All ten scouts reported that
   `--grep oops/sorry/hack` returns noise. The book's method sections should teach dates,
   names, trees, and `-S`/`-L` — not message-grepping. This is itself a chapter-worthy thesis.
2. **The genesis lie is universal** (10/10 repos import, plant, or fabricate day one) —
   which is why chapter 4 must be cross-repo rather than ten separate retellings.
3. **The best digs cluster at the same hours.** 00:42, 01:10, 01:50, 03:46, 04:03, 05:09,
   22:59:57. The book keeps timestamps in every receipt.
4. **Three story shapes cover the catastrophes:** slow accretion (log4j2), institutional
   capture (openssl), sabotage (xz). bitcoin/linux/t2t supply the quieter registers so the
   book is not three disasters in a row.

## Next decisions (user's call)

- Pilot chapter: log4j2 chain vs the previously suggested Debian OpenSSL 2008 (which needs
  a Debian packaging clone — not yet scouted).
- Whether Round 2 scouting (new repos, or deeper digs on T1 anchors) happens before or
  after the pilot.
