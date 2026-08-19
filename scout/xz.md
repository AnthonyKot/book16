# Scout: xz (tukaani-project/xz)

- **Repo:** https://github.com/tukaani-project/xz
- **Clone:** `~/book16/repos/xz` (already present; not re-cloned). Working tree 19M; `.git` 11M.
- **History span (HEAD):** 2007-12-09T00:42:33+02:00 → 2026-08-18T20:20:57+03:00
- **Commits:** 3094 on `HEAD` / `master`; 4593 `--all` (release branches `v5.0`–`v5.8` duplicate a lot of the Jia-era work).
- **Authors (all refs):** Lasse Collin 3641, Jia Tan 722, then a long tail. In calendar 2023 Jia out-commits Lasse 514–291. Jia is gone from 2025 onward.

The backdoor everyone remembers (CVE-2024-3094) is only half in this git. `build-to-host.m4` never lands as a tracked file. What git does hold is the two-year social takeover, a one-line `.gitignore`, a period that disables a sandbox, binary “test files,” and then a commit that writes the other maintainer out of `AUTHORS`.

---

## 1. Day one is an import at 00:42, not a blank page

- **Find-type:** 3 (first commit)
- **Hash:** `5d018dc03549c1ee4958364712fb0c94e1bf2741`
- **Date:** 2007-12-09T00:42:33+02:00 (author = committer)
- **Author:** Lasse Collin `<lasse.collin@tukaani.org>`
- **Message:** `Imported to git.`
- **Command:**

```
git -C ~/book16/repos/xz log --reverse --format='%h %aI %an %s' | head -5
git -C ~/book16/repos/xz show --stat --format=fuller 5d018dc03549c1ee4958364712fb0c94e1bf2741 | tail -3
```

```
5d018dc0 2007-12-09T00:42:33+02:00 Lasse Collin Imported to git.
2bf36d22 2007-12-09T11:03:28+02:00 Lasse Collin Fixed the tests to build with -Werror.
ff946ceb 2007-12-09T11:24:48+02:00 Lasse Collin Re-enabled the security checks in Subblock decoder that were disabled for debugging reasons.
41338717 2007-12-09T12:13:01+02:00 Lasse Collin Added a bunch of .lzma test files.
07ac8817 2007-12-09T17:06:45+02:00 Lasse Collin Take advantage of return_if_error() macro in more places. ...
 240 files changed, 42513 insertions(+)
```

- **Why it is a story:** At 00:42 on a Sunday, Lasse drops 42,513 lines and a two-word message. `doc/history.txt` in that same tree already tells a 2005 Slackware-fork story (Tukaani, `.tlz`, Igor Pavlov’s LZMA SDK). The third commit of the day turns security checks back on because they had been “disabled for debugging reasons.” Git’s clock starts in the middle of a life, not at the beginning of one. There is no 1970 stamp and no fake ancestry — just a clean cut from whatever VCS came before.
- **What the reader learns:** `git log --reverse | head` on a mature project usually shows a migration, not a genesis. The interesting question is what the import chose to remember (here: a full working tree, including tests that did not even build with `-Werror`).
- **Surprise:** 2

---

## 2. `jiat75` knocks; six months later the name is on the door

- **Find-type:** 4 (name that appears)
- **Hashes:** `6468f7e41a8e9c611e4ba8d34e2175c5dacdbeb4` (first patch, author `jiat75`); `692de534fae6c38f92416793addcf5f60ffe2bf6` (added to AUTHORS); `2fd28d2b7cec3468324a6f15eff7e73c285b1d7d` (first commit as committer)
- **Dates:** 2022-01-28 / 2022-08-12 / 2022-12-16
- **Authors:** jiat75; Lasse Collin; Jia Tan
- **Messages:** `liblzma: Add NULL checks to LZMA and LZMA2 properties encoders.` / `Add Jia Tan to AUTHORS.` / `CMake: Update .gitignore for CMake artifacts from in source build.`
- **Command:**

```
git -C ~/book16/repos/xz log --reverse --all --author='jiat75' --format='%h %aI %cI %an <%ae> %cn %s' | head -3
git -C ~/book16/repos/xz show --stat --format=fuller 692de534fae6c38f92416793addcf5f60ffe2bf6
```

```
6468f7e4 2022-01-28T20:47:55+08:00 2022-02-07T00:20:01+02:00 jiat75 <jiat0218@gmail.com> Lasse Collin liblzma: Add NULL checks ...
1e3eb618 2022-06-03T21:24:54+08:00 2022-06-14T21:47:09+03:00 jiat75 <jiat0218@gmail.com> Lasse Collin Added parallel test artifacts to .gitignore
0354d6cc 2022-06-13T20:27:03+08:00 2022-06-14T22:03:55+03:00 Jia Tan <jiat75@gmail.com> Lasse Collin Added vli tests to .gitignore

commit 692de534fae6c38f92416793addcf5f60ffe2bf6
AuthorDate: Fri Aug 12 14:28:41 2022 +0300
    Add Jia Tan to AUTHORS.
 AUTHORS | 2 +-
```

The AUTHORS hunk is one token: `and Jia Tan <jiat0218@gmail.com>`.

- **Why it is a story:** The first email is a GitHub-ish handle. Lasse commits it ten days later, at 00:20. The handle becomes a name, the name is written into `AUTHORS` as co-maintainer after a summer of tests and coverage scripts, and by December Jia is pushing as committer (another `.gitignore`). Nobody in the room knows they are watching the opening credits of CVE-2024-3094. It looks like the nicest thing that can happen to a one-maintainer project.
- **What the reader learns:** `git shortlog` and `AUTHORS` are social documents. A six-month path from `jiat75` to “developed and maintained by Lasse Collin and Jia Tan” is the whole trust model of volunteer C, written down in one-line diffs.
- **Surprise:** 3

---

## 3. Calendar 2023: the shortlog flips

- **Find-type:** 4 (name that appears / the old name recedes)
- **Hashes:** not a single commit — a window. Anchor: `3bd906f1f3d162ed8493c4b494ccbafdb613a34f` (2023-04-14, `liblzma: Update project maintainers in lzma.h.`)
- **Date:** 2023
- **Author:** Jia Tan 514 / Lasse Collin 291 (`--all`)
- **Message (anchor):** `liblzma: Update project maintainers in lzma.h.` — “AUTHORS was updated earlier, lzma.h was simply forgotten.”
- **Command:**

```
git -C ~/book16/repos/xz shortlog -sn --all --since=2023-01-01 --until=2024-01-01 | head -8
git -C ~/book16/repos/xz log --all --since=2022-01-01 --until=2024-04-01 --format='%ad %an' --date=format:%Y-%m
```

```
   514	Jia Tan
   291	Lasse Collin
     5	Hans Jansen
     5	Kelvin Lee
     5	Maksym Vatsyk
```

By month (author names on `--all`, so branches inflate both sides): 2023-04 Jia 21 / Lasse 3; 2023-05 Jia 58 / Lasse 3; 2023-11 Jia 36 / Lasse 2; 2023-12 Jia 24 / Lasse 3.

- **Why it is a story:** The handover is not announced as a handover. It is a year in which the original author still exists and almost stops typing. April 2023 is the month `lzma.h` is updated to say the project “is developed and maintained by Lasse Collin and Jia Tan” because Lasse had “simply forgotten.” From the inside it is burnout relief. From the outside it is the month the commit bit became the attack.
- **What the reader learns:** Run `shortlog` in one-year windows. A healthy-looking project can change hands without a tag, a mail, or a NEWS entry. The graph of *who still commits* is the real org chart.
- **Surprise:** 3

---

## 4. Hans Jansen: five commits, ifunc, gone

- **Find-type:** 4 + 7 (name that disappears; feature that became the vulnerability)
- **Hashes:** `23b5c36fb71904bfbe16bb20f976da38dadf6c3b`, `b72d21202402a603db6d512fb9271cfa83249639` (ifunc detection, committed by Lasse); later CRC/ifunc split `233885a4` / `93e6fb08` / `f1cd9d71` (committed by Jia)
- **Date:** 2023-06-22 (ifunc) and 2023-10-12 (CRC shuffle)
- **Author:** Hans Jansen `<hansjansen162@outlook.com>`
- **Message:** `Add ifunc check to configure.ac`
- **Command:**

```
git -C ~/book16/repos/xz log --all --author='Hans Jansen' --format='%h %aI %cn %s'
git -C ~/book16/repos/xz log --all --reverse -S 'ifunc' --format='%h %aI %an %s' | head -4
```

```
f1cd9d71 2023-10-12T19:37:01+02:00 Jia Tan liblzma: Added crc32_clmul to crc32_fast.c.
93e6fb08 2023-10-12T19:23:40+02:00 Jia Tan liblzma: Moved CLMUL CRC logic to crc_common.h.
233885a4 2023-10-12T19:07:50+02:00 Jia Tan liblzma: Rename crc_macros.h to crc_common.h.
b72d2120 2023-06-22T19:49:30+02:00 Lasse Collin Add ifunc check to CMakeLists.txt
23b5c36f 2023-06-22T19:46:55+02:00 Lasse Collin Add ifunc check to configure.ac
```

- **Why it is a story:** A name that does not exist before June 2023 or after October 2023 adds GNU ifunc — runtime function resolution, the exact hook the later backdoor needs so a CRC symbol can become something else. Lasse lands the first pair. Jia lands the October pair. Then Hans never writes again. In a 2023 shortlog he ties Kelvin Lee and Maksym Vatsyk at five commits; those two are real people with real employers. Hans is a ghost who donated the loader.
- **What the reader learns:** `git shortlog -sn --since=… --until=…` plus `--author` on anyone who appears once is how you find sockpuppets. A feature can be the vulnerability years before the payload. Blame the *capability*, not only the blob.
- **Surprise:** 4

---

## 5. One line in `m4/.gitignore`: a file that is never in git

- **Find-type:** 1 (tiny diff, huge blast radius) and 2 (planted artifact)
- **Hash:** `4323bc3e0c1e1d2037d5e670a3bf6633e8a3031e` (also cherry-picked later as `e164211b` / `2c024f60`, Lasse committing Jia’s author date)
- **Date:** 2024-02-15T22:26:43+08:00
- **Author:** Jia Tan `<jiat0218@gmail.com>`
- **Message:** `Update m4/.gitignore.`
- **Command:**

```
git -C ~/book16/repos/xz show --format=fuller 4323bc3e0c1e1d2037d5e670a3bf6633e8a3031e
git -C ~/book16/repos/xz log --all -S 'build-to-host' --format='%h %aI %cI %an %s'
```

```
    Update m4/.gitignore.
+build-to-host.m4
codeset.m4
extern-inline.m4

4323bc3e 2024-02-15T22:26:43+08:00 2024-02-15T22:26:43+08:00 Jia Tan Update m4/.gitignore.
e164211b 2024-02-15T22:26:43+08:00 2024-05-22T00:07:08+03:00 Jia Tan Update m4/.gitignore.
2c024f60 2024-02-15T22:26:43+08:00 2024-05-22T00:26:06+03:00 Jia Tan Update m4/.gitignore.
```

`git log --all -- m4/build-to-host.m4` is empty. The string `build-to-host` occurs in this repo only as a gitignore entry.

- **Why it is a story:** The infamous GNU Autotools snippet that glued the backdoor into the *tarball* is not a git object. Jia adds its name to `m4/.gitignore` nine days before 5.6.0, so `gettextize`/`autopoint` can drop the file during `make dist` and `git status` will stay clean. After the breach Lasse even cherry-picks this commit (May 22) because, read in isolation, it is a one-line hygiene patch. That is the moment before the outcome: a maintainer ignoring a generated-looking m4 name.
- **What the reader learns:** `git log -S` on the scandal’s filename can return only a `.gitignore`. If your release process adds files that git is taught to forget, the crime scene is the tarball, not `master`. Diff your git tree against what you ship.
- **Surprise:** 5

---

## 6. “Tests: Add a few test files” (and then “a constant seed”)

- **Find-type:** 7 (feature that became the vulnerability)
- **Hashes:** `cf44e4b7f5dfdbf8c78aef377c10f71e274f63c0` (add); `6e636819e8f070330d835fce46289a3ff72a7b89` (update); later RISC-V companions `e2870db5`, `3060e107`, `0b4ccc91`
- **Date:** 2024-02-23T23:09:59+08:00 and 2024-03-09T10:18:29+08:00
- **Author:** Jia Tan
- **Messages:** `Tests: Add a few test files.` / `Tests: Update two test files.`
- **Command:**

```
git -C ~/book16/repos/xz show --stat --format=fuller cf44e4b7f5dfdbf8c78aef377c10f71e274f63c0
git -C ~/book16/repos/xz show --stat --format=fuller 6e636819e8f070330d835fce46289a3ff72a7b89
```

```
    Tests: Add a few test files.
 tests/files/bad-3-corrupt_lzma2.xz     | Bin 0 -> 484 bytes
 tests/files/good-large_compressed.lzma | Bin 0 -> 35430 bytes
 tests/files/good-small_compressed.lzma | Bin 0 -> 258 bytes
 ...
    Tests: Update two test files.
    The original files were generated with random local to my machine.
    To better reproduce these files in the future, a constant seed was used
    to recreate these files.
 tests/files/bad-3-corrupt_lzma2.xz     | Bin 484 -> 512 bytes
 tests/files/good-large_compressed.lzma | Bin 35430 -> 35421 bytes
```

The README added in the same commit says `good-large_compressed.lzma` is “a mix of repeated characters and random data.”

- **Why it is a story:** The night before 5.6.0, “a few test files.” Two weeks later, the same two binaries are rewritten because the first ones used “random local to my machine.” That sentence is the tell: a test corpus that cannot be regenerated is not a test, it is a container. Lasse’s later removal commit will say the quiet part: “The executable payloads were embedded as binary blobs in the test files.” On 23 February this is still just coverage.
- **What the reader learns:** `git log --diff-filter=A --summary -- tests/` plus `git show --stat` on binary adds. A 35 KiB “random” test with no generator is a place to hide a program. Demand a script that rebuilds fixtures from a seed, and commit the script first.
- **Surprise:** 3 (the files are famous; the “constant seed” follow-up is the better sentence)

---

## 7. A single `.` turns Landlock off

- **Find-type:** 1 (tiny diff, huge blast radius)
- **Hashes:** `328c52da8a2bbb81307644efdb58db2c422d9ba7` (Jia “fix”); `f9cf4c05edd14dedfe63833f8ccbe41b55823b00` (Lasse: “Fix sabotaged Landlock sandbox check.”)
- **Dates:** 2024-02-26T23:02:06+08:00 / 2024-03-30T14:36:28+02:00
- **Authors:** Jia Tan; Lasse Collin
- **Messages:** `Build: Fix Linux Landlock feature test in Autotools and CMake builds.` / `CMake: Fix sabotaged Landlock sandbox check.`
- **Command:**

```
git -C ~/book16/repos/xz show 328c52da8a2bbb81307644efdb58db2c422d9ba7 -- CMakeLists.txt
git -C ~/book16/repos/xz show f9cf4c05edd14dedfe63833f8ccbe41b55823b00
```

Jia’s new `check_c_source_compiles` string contains:

```
        #include <sys/prctl.h>
.
        void my_sandbox(void)
```

Lasse’s fix is one character the other way:

```
-        .
+
         void my_sandbox(void)
    CMake: Fix sabotaged Landlock sandbox check.
    It never enabled it.
```

The Autotools half of Jia’s commit does **not** have the period. Only CMake.

- **Why it is a story:** The commit message is a responsible sandbox improvement. Inside the CMake probe, a lone `.` is a syntax error, so the compile check always fails, so Landlock is “not available,” so `xz` never confines itself. The word “sabotaged” appears in the tree only after Andres Freund has already gone public (March 29). On 26 February it is still a “feature test.” Someone sat in front of that `.` and saved.
- **What the reader learns:** Read the *negative* path of every feature-test commit. A one-character compile-killer inside a string is invisible to `git log --grep sandbox` and to almost every review that checks the Autotools side and skims CMake. `git log -G '^\.$'` is not a joke.
- **Surprise:** 5

---

## 8. “Fix typos” / “false Valgrind error”: the ifunc costume

- **Find-type:** 2 (planted artifact) and 1 (tiny, later listed in the revert)
- **Hashes:** `82ecc538193b380a21622aea02b0ba078e7ade92`, `8c9b8b2063daa78ead9f648c2ec3c91e8615dffb`
- **Date:** 2024-03-09T09:20:57+08:00 and 09:52:32+08:00 (same morning as 5.6.1)
- **Author:** Jia Tan
- **Messages:** `liblzma: Fix false Valgrind error report with GCC.` / `liblzma: Fix typos in crc32_fast.c and crc64_fast.c.`
- **Command:**

```
git -C ~/book16/repos/xz show --stat --format=fuller 82ecc538193b380a21622aea02b0ba078e7ade92
git -C ~/book16/repos/xz show 8c9b8b2063daa78ead9f648c2ec3c91e8615dffb
```

```
    liblzma: Fix false Valgrind error report with GCC.
    This fixes https://bugzilla.redhat.com/show_bug.cgi?id=2267598.
 src/liblzma/check/crc_common.h | 25 +++++++++++++++++++++++++
...
-// The funcion attributes are needed for safe IFUNC resolver usage with GCC.
+// The function attributes are needed for safe IFUNC resolver usage with GCC.
-return  is_arch_extension_supported()
+return is_arch_extension_supported()
```

The “typo” commit is two spaces and a letter in a comment. The Valgrind commit adds `lzma_resolver_attributes` (`no-omit-frame-pointer`, `no_profile_instrument_function`) around the ifunc resolver. Both hashes are named, weeks later, in Lasse’s backdoor-removal message.

- **Why it is a story:** 5.6.1 is sold as a cleanup release. The morning’s work is a Red Hat bug, a misspelling of “function,” and a version bump. The attributes keep the resolver from exploding under profilers and Valgrind — i.e., they keep the *hook* quiet. A reviewer who stops at the comment typo has done what the commit asked.
- **What the reader learns:** When a “typo” commit and a “false sanitizer” commit touch the same resolver on the same morning as a soname bump, read them as one patch. `git log --grep typo` is a hunting ground, not a junk drawer.
- **Surprise:** 4

---

## 9. Last act: strip SECURITY.md at 01:50

- **Find-type:** 2 (planted / timed artifact)
- **Hash:** `af071ef7702debef4f1d324616a0137a5001c14c`
- **Date:** 2024-03-26T01:50:02+08:00 (committed 03:38 the same night)
- **Author:** Jia Tan
- **Message:** `Docs: Simplify SECURITY.md.`
- **Command:**

```
git -C ~/book16/repos/xz log --all --author='Jia' --committer='Jia' --format='%h %aI %s' | head -3
git -C ~/book16/repos/xz show af071ef7702debef4f1d324616a0137a5001c14c
```

```
af071ef7 2024-03-26T01:50:02+08:00 Docs: Simplify SECURITY.md.
fd1b975b 2024-03-09T11:42:50+08:00 Bump version and soname for 5.6.1.
...
-While both options are available, we prefer email. In any case, please
-provide a clear description of the vulnerability including:
-- Affected versions of XZ Utils
-- Estimated severity (low, moderate, high, critical)
-- Steps to recreate the vulnerability
-- All relevant files (core dumps, build logs, input files, etc.)
+While both options are available, we prefer email.
```

This is the last commit Jia both authors and commits. Andres Freund’s oss-security mail is three days later (2024-03-29).

- **Why it is a story:** At 1:50 a.m. the remaining maintainer deletes the checklist that would have forced a reporter to attach build logs and input files — the exact artifacts that would have described his own test-file payloads. “Simplify” is a real word for a real 8-line diff. He does not come back.
- **What the reader learns:** The last commit from a vanished account is worth `git show` even when it is documentation. Watch `SECURITY.md` the way you watch `configure.ac`.
- **Surprise:** 4

---

## 10. Rollback of the world: “The other maintainer suddenly disappeared.”

- **Find-type:** 8 (rollback of the world) and 6 (a revert that states a rule)
- **Hashes:** `e93e13c8b3bec925c56e0c0b675d8000a0f7f754` (and `1107712e372f7593ad729764c0c2644d0e4aa675` on the other line); `77a294d98a9d2d48f7e4ac273711518bf689f5c4` (AUTHORS)
- **Date:** 2024-04-08T15:32:58+03:00 / 18:27:39+03:00 (committed 2024-04-09)
- **Author:** Lasse Collin
- **Messages:** `Remove the backdoor found in 5.6.0 and 5.6.1 (CVE-2024-3094).` / `Update maintainer and author info.`
- **Command:**

```
git -C ~/book16/repos/xz log -1 --format='%B' e93e13c8b3bec925c56e0c0b675d8000a0f7f754
git -C ~/book16/repos/xz show --format=fuller 77a294d98a9d2d48f7e4ac273711518bf689f5c4
```

```
Remove the backdoor found in 5.6.0 and 5.6.1 (CVE-2024-3094).
...
  - The executable payloads were embedded as binary blobs in
    the test files. This was a blatant violation of the
    Debian Free Software Guidelines.
  - On machines that see lots bots poking at the SSH port, the backdoor
    noticeably increased CPU load, resulting in degraded user experience
    and thus overwhelmingly negative user feedback.
  - The maintainer who added the backdoor has disappeared.
  - Backdoors are bad for security.
This reverts the following without making any other changes:
6e636819 Tests: Update two test files.
...
cf44e4b7 Tests: Add a few test files.
...
    The other maintainer suddenly disappeared.
+    Special author: Jia Tan was a co-maintainer in 2022-2024. He and
+    the team behind him inserted a backdoor (CVE-2024-3094) into
+    XZ Utils 5.6.0 and 5.6.1 releases. He suddenly disappeared when
+    this was discovered.
```

12 files, +8 / −66, plus deletions of the binaries.

- **Why it is a story:** Lasse writes the removal like a man returning to his own house. He lists DFSG, CPU load, disappearance, and “Backdoors are bad for security” in that order. Then he edits `AUTHORS` the way you edit a death notice: the second name is gone from the header and reappears as “Special author.” The rule the revert enforces is not technical. It is: this project is one person’s again, and the years 2022–2024 are now a labeled interval.
- **What the reader learns:** A rollback commit can be the best primary source you will get. Read the list of reverted hashes as a table of contents for the attack. Then `git show` each one in date order — that is the chapter.
- **Surprise:** 2 (everyone knows this commit; the *order of the reasons* is the part to keep)

---

## 11. A TODO that outlived the backdoor, the rename, and sixteen years

- **Find-type:** 5 (comment/TODO that outlived its code)
- **Hashes:** `ee5ddb8b28419fe4923ded5c18a50570a762dcab` (2010-01-31T23:41:29+02:00); `bd9cc179e8be3ef515201d3ed9c7dd79ae88869d` (2012-07-04)
- **Date:** 2010 / 2012; still on `TODO` at HEAD (2026)
- **Author:** Lasse Collin
- **Messages:** `Updated TODO.` / `Update TODO.`
- **Command:**

```
git -C ~/book16/repos/xz blame -L 17,21 TODO
```

```
ee5ddb8b2 (Lasse Collin 2010-01-31 23:41:29 +0200 17)     tuklib_exit() doesn't block signals => EINTR is possible.
^5d018dc0 (Lasse Collin 2007-12-09 00:42:33 +0200 18)
bd9cc179e (Lasse Collin 2012-07-04 17:06:49 +0300 19)     If liblzma has created threads and fork() gets called, liblzma
bd9cc179e (Lasse Collin 2012-07-04 17:06:49 +0300 20)     code will break in the child process unless it calls exec() and
bd9cc179e (Lasse Collin 2012-07-04 17:06:49 +0300 21)     doesn't touch liblzma.
```

- **Why it is a story:** The same `TODO` file that arrived in the 00:42 import still carries a 23:41 note from January 2010 and a 2012 fork+threads warning. Jia’s two years, the backdoor, the rollback, the rewrite of `AUTHORS` — none of them touched these lines. The project’s longest-lived voice is Lasse talking to himself about EINTR.
- **What the reader learns:** `git blame` on `TODO` / `HACKING` is a better “who actually lives here” signal than `AUTHORS`. Lines that survive a scandal are the project’s real continuity.
- **Surprise:** 2

---

## Ranked top-3

1. **#7 — the Landlock period.** One ASCII character, a commit message that says “fix,” a later commit that says “sabotaged.” That is the whole book in a diff hunk.
2. **#5 — `build-to-host.m4` lives only in `.gitignore`.** The weapon everyone names is not in the repository. Git archaeology here is the study of an absence.
3. **#2/#3 — the name that appears.** `jiat75` → AUTHORS → 2023 shortlog flip. The blast radius of a one-token welcome.

## Disappointing

The smoking-gun `build-to-host.m4` is not here — two years of Jia commits are mostly real translations, tests, and CMake, and git will not mark the bad ones for you.
