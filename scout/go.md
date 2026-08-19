# Scout: go (golang/go)

- **Repo:** https://github.com/golang/go
- **Clone:** `~/book16/repos/go` (already present; not re-cloned). Working tree 658M; `.git` 464M.
- **History span (HEAD):** 1972-07-18T19:05:45-05:00 → 2026-08-18T13:36:48-07:00 (committer date of tip). First *real* Go commit is 2008-03-02T20:47:34-08:00. Twenty years of silence sit between ANSI C hello-world and the spec.
- **Commits:** 67259 on `HEAD` / `master`.
- **Authors (`shortlog -sn --all`):** Russ Cox 7866, Robert Griesemer 4998, Ian Lance Taylor 3199, Rob Pike 3027, Brad Fitzpatrick 2498, then Keith Randall, Austin Clements, Matthew Dempsky. Ken Thompson is 508 commits and then zero after 2011. Rob Pike fades to 0 in 2025–2026. 2024–2026 shortlog is led by Filippo Valsorda / Cherry Mui / Michael Knyszek, not the founders.

The tree is rooted in a joke. `git log --reverse` does not begin with a language. It begins with Brian Kernighan, B, C, Dennis Ritchie as reviewer, April Fools' Day 1988, then a twenty-year gap, then a Sunday-night spec. Everything after that is three people (and later a few hundred) trying to make the red text in that spec go away.

---

## 1. The repo is rooted in a 1972 "hello, world" Kernighan never typed here

- **Find-type:** 2 (planted / dated / faked artifact)
- **Hashes:** `7d7c6a97f815e9279d08cfaea7d5efb5e90695a8` → `0bb0b61d6a85b2a1a33dcbc418089656f2754d32` → `0744ac969119db8a0ad3253951d375eb77cfce9e` → `d82b11e4a46307f1f1415024f33263e819c222b8`
- **Dates:** 1972-07-18 19:05:45 -0500; 1974-01-20 01:02:03 -0400; 1988-04-01 02:02:04 -0500; 1988-04-01 02:03:04 -0500
- **Author:** Brian Kernighan (`<bwk>`, then `research!bwk`, then `<bwk@research.att.com>`)
- **Messages:** `hello, world` / `convert to C` / `convert to Draft-Proposed ANSI C` / `last-minute fix: convert to ANSI C`
- **Command:**

```
git -C ~/book16/repos/go log --reverse --format='%H %ai %an <%ae> %s' | head -5
git -C ~/book16/repos/go show --stat --format=fuller 7d7c6a97f815e9279d08cfaea7d5efb5e90695a8
git -C ~/book16/repos/go blame src/debug/macho/testdata/hello.c
```

```
7d7c6a97f815e9279d08cfaea7d5efb5e90695a8 1972-07-18 19:05:45 -0500 Brian Kernighan <bwk> hello, world
0bb0b61d6a85b2a1a33dcbc418089656f2754d32 1974-01-20 01:02:03 -0400 Brian Kernighan <bwk> convert to C
0744ac969119db8a0ad3253951d375eb77cfce9e 1988-04-01 02:02:04 -0500 Brian Kernighan <research!bwk> convert to Draft-Proposed ANSI C
d82b11e4a46307f1f1415024f33263e819c222b8 1988-04-01 02:03:04 -0500 Brian Kernighan <bwk@research.att.com> last-minute fix: convert to ANSI C
18c5b488a3b2e218c0e0cf2a7d4820d9da93a554 2008-03-02 20:47:34 -0800 Robert Griesemer <gri@golang.org> Go spec starting point.

    hello, world
    R=ken
    DELTA=7  (7 added, 0 deleted, 0 changed)
 src/pkg/debug/macho/testdata/hello.b | 7 +++++++

0744ac96911 (<research!bwk>         1988-04-01 02:02:04 -0500 1) #include <stdio.h>
d82b11e4a46 (<bwk@research.att.com> 1988-04-01 02:03:04 -0500 3) int
d82b11e4a46 (<bwk@research.att.com> 1988-04-01 02:03:04 -0500 4) main(void)
0744ac96911 (<research!bwk>         1988-04-01 02:02:04 -0500 6) printf("hello, world\n");
0bb0b61d6a8 (<bwk>                  1974-01-20 01:02:03 -0400 8) }
```

The 1972 blob is B, not C: `extrn a, b, c;` and `a 'hell'; b 'o, w'; c 'orld';`. The 1974 conversion is three lines of K&R. The 1988 pair is one minute apart on April Fools', reviewer `R=dmr`, clocks 02:02:04 and 02:03:04. The 1974 clock is 01:02:03.

- **Why it is a story:** Someone (the conversion into this git, carrying a Mercurial-era joke) decided the Go repository should *begin* as the history of hello-world itself: B, then C, then Draft ANSI, then ANSI, reviewed by Ken Thompson and Dennis Ritchie, then twenty years of nothing. The tell is the path. A 1972 commit already lives at `src/pkg/debug/macho/testdata/` — a 2008 Go tree layout — and uses Mercurial review trailers (`R=ken`, `DELTA=7`). `git blame` on the file still sitting in `src/debug/macho/testdata/hello.c` today prints 1974 and 1988. The first real parent of the Go spec is a one-minute-later ANSI C punchline.
- **What the reader learns:** Author date, committer date, and path are all forgeable, and a joke planted as the root commit will be the first thing every archaeologist sees. `git blame` will happily report that a line is fifty years old. Check the path against the era. Check the review syntax against the tool. Check 01:02:03.
- **Surprise:** 4 (the joke is famous; the path, the clocks, `R=dmr`, and live blame are the receipts)

---

## 2. Day one of Go is a 1,197-line spec on a Sunday night

- **Find-type:** 3 (first commit — what day one shows)
- **Hash:** `18c5b488a3b2e218c0e0cf2a7d4820d9da93a554` (parent: the 1988 ANSI hello.c)
- **Date:** 2008-03-02 20:47:34 -0800
- **Author:** Robert Griesemer `<gri@golang.org>`
- **Message:** `Go spec starting point.`
- **Command:**

```
git -C ~/book16/repos/go show --stat --format=fuller 18c5b488a3b2e218c0e0cf2a7d4820d9da93a554
git -C ~/book16/repos/go show 18c5b488a3b2e218c0e0cf2a7d4820d9da93a554:doc/go_spec | head -80
```

```
AuthorDate: Sun Mar 2 20:47:34 2008 -0800
    Go spec starting point.
    SVN=111041
 doc/go_spec | 1197 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

The Go Annotated Specification
This document supersedes all previous Go spec attempts.
...
- structs must be identical (same decl) to be the same
  (Ken has different implementation: equivalent declaration is the
  same; what about methods?)
...
- containers w/o templates
- compiler can be written in Go and so can it's GC
- very fast compilation possible (1MLOC/s stretch goal)
...
Go has no explicit notion of type parameters or templates.
...
One goal is to get rid of all red text in this document. [r: done!]
```

Two hours later, same author, `328df636c5f3e0875bc71a7eadf5a4a5084e0b13` (23:02:36): *added language for map and channel types*.

- **Why it is a story:** There is no compiler in this commit. There is no `hello.go`. There is a document that already knows it supersedes earlier attempts, already has Ken implementing a different type-identity rule, already has Rob Pike annotating `[r: done!]` in the source, already refuses templates, already wants the compiler written in itself at a million lines a second. Maps and channels are not in the first dump; they land before midnight. The language is being *argued into existence* on a Sunday, in a text file, while Ken is already compiling something else.
- **What the reader learns:** `git log --reverse` after the planted prefix shows design-before-code. If day one is a spec, the project will spend the next decade making the red text go away — and some of it (templates / generics) will wait fourteen years.
- **Surprise:** 3

---

## 3. Ken Thompson: 10,958 lines in, 24 lines out, then gone

- **Find-type:** 4 (name that disappears)
- **Hashes:** first `cb87526ce3531557ccf69969de4c8018956b10b5`; last `a73817716a25c3e7584daf378c72d14c7a33ba18`
- **Dates:** 2008-03-28 13:41:41 -0700 → 2011-03-22 18:41:17 -0700
- **Author:** Ken Thompson `<ken@golang.org>`
- **Messages:** `SVN=114202` / `chan: allocate a new chan with one malloc rather than nelements + 1.`
- **Command:**

```
git -C ~/book16/repos/go log --author='Ken Thompson' --format='%H %ai %s' --reverse | head -3
git -C ~/book16/repos/go log --author='Ken Thompson' --format='%H %ai %s' -1
git -C ~/book16/repos/go show --stat --format=fuller cb87526ce3531557ccf69969de4c8018956b10b5 | tail -20
git -C ~/book16/repos/go show --stat --format=fuller a73817716a25c3e7584daf378c72d14c7a33ba18
# yearly: 2008=298 2009=131 2010=55 2011=24 2012=0
```

```
cb87526ce3531557ccf69969de4c8018956b10b5 2008-03-28 13:41:41 -0700 SVN=114202
2181098189ea34ba1e0414dccde4ac3b1af683ae 2008-03-28 13:56:47 -0700 SVN=114204
...
a73817716a25c3e7584daf378c72d14c7a33ba18 2011-03-22 18:41:17 -0700 chan: allocate a new chan with one malloc rather than nelements + 1.

    SVN=114202
 src/c/go.y     | 1302 +++++++++++++++++++++++++++++++++++++++++++++++
 src/c/lex.c    | 1058 ++++++++++++++++++++++++++++++++++++++
 src/c/obj.c    | 1535 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 14 files changed, 10958 insertions(+)

    chan: allocate a new chan with one
    malloc rather than nelements + 1.
    R=rob
 src/pkg/runtime/chan.c | 24 ++++++++++++++++++++----
```

508 commits, all `ken@golang.org`. Rob Pike is 2993 and still typing in 2024 (0 in 2025–26). Russ Cox is 7570 and still here.

- **Why it is a story:** Twenty-six days after the spec, Ken drops the compiler. The message is an SVN revision number. The files are C, in `src/c/`, a yacc grammar and a 1,535-line object writer. For three years he is the code-generation guy — ARM peepholes, 64-bit eor, stack adjust after defer. His last act, reviewed by Rob, is to make `makechan` one malloc instead of N+1. Then the name that invented Unix is simply not in the log. Go 1 ships a year later without him.
- **What the reader learns:** `git log --author=… --reverse` plus a yearly count is a career. A founder can vanish between a weekly and a release. The last commit is rarely a speech; it is a malloc.
- **Surprise:** 4

---

## 4. `gofmt (final resting place TBD)` lives in `usr/gri/pretty/`

- **Find-type:** 1 (tiny idea, huge blast radius)
- **Hash:** `a893db8767e0857fffe3d8ae64d2b4b2dd2c22fe` (birth); `650bff6aa99c07f124268069fe8e7caa538110e5` and neighbors (the tree gets rewritten)
- **Date:** 2009-06-15 16:23:16 -0700
- **Author:** Robert Griesemer `<gri@golang.org>`
- **Message:** `gofmt (final resting place TBD): - replacement for pretty; app to format a single .go file`
- **Command:**

```
git -C ~/book16/repos/go show --stat --format=fuller a893db8767e0857fffe3d8ae64d2b4b2dd2c22fe
git -C ~/book16/repos/go log --until=2010-01-01 --grep='apply gofmt' --format='%h %ai %an %s'
```

```
    gofmt (final resting place TBD):
    - replacement for pretty; app to format a single .go file
    R=r,rsc,iant
    DELTA=2833  (1183 added, 1628 deleted, 22 changed)
 usr/gri/pretty/astprinter.go  | 1269 -----------------------------------------
 usr/gri/pretty/gofmt.go       |  107 ++++
 src/pkg/go/printer/printer.go | 1019 +++++++++++++++++++++++++++++++++
 13 files changed, 1211 insertions(+), 1648 deletions(-)

c62b3265a7 2009-10-06 11:42:55 -0700 Russ Cox apply gofmt to the LGTM-marked files ...
650bff6aa9 2009-10-06 14:55:39 -0700 Russ Cox another round of gofmt applications
22c98a3314 2009-10-06 14:55:06 -0700 Russ Cox gofmt on crypto, debug
...
91549438d8 2009-10-07 11:55:06 -0700 Russ Cox apply gofmt to rand reflect regexp rpc runtime sort strconv strings sync syscall testing time unicode unsafe utf8
```

The next day Griesemer installs it at `src/cmd/gofmt`. Four months later Russ Cox walks the standard library with it, package by package.

- **Why it is a story:** The tool that ended style arguments in an entire language starts as a side project in the author's personal `usr/gri/pretty/` directory, message still unsure where it belongs. Reviewers are Rob, Russ, Ian. By October the *policy* is the commits: not a document, a series of "apply gofmt to …" walks that rewrite the tree so there is only one shape left. Every later Go programmer inherits that Monday in June.
- **What the reader learns:** Culture is a formatter plus someone willing to run it on everything. Look for the first commit that *applies* the tool, not only the one that adds it. "TBD" in a subject is often the line that stays.
- **Surprise:** 3

---

## 5. June 2008: "start of generics" and `'any'` demoted

- **Find-type:** 5 (comment / TODO that outlived its code)
- **Hash:** `e1a06ccc80159cf2b6a3cd86493c6a53b5a6f9e8`
- **Date:** 2008-06-15 20:24:30 -0700
- **Author:** Ken Thompson `<ken@golang.org>`
- **Message:** `now checks for lvalue/rvalue context of expressions. start of generics for calling builtin functions start of map type 'any' demoted from reserved word to type`
- **Command:**

```
git -C ~/book16/repos/go show --stat --format=fuller e1a06ccc80159cf2b6a3cd86493c6a53b5a6f9e8
git -C ~/book16/repos/go show e1a06ccc80159cf2b6a3cd86493c6a53b5a6f9e8 -- src/cmd/gc/lex.c | head -35
```

```
    start of generics for calling builtin
         functions
    start of map type
    'any' demoted from reserved word to type
    SVN=122808
 15 files changed, 708 insertions(+), 247 deletions(-)

-"any",LANY,Txxx,
+"any",LBASETYPE,TANY,
+//"any",LANY,Txxx,
```

The first spec, three months earlier, already said "Go has no explicit notion of type parameters or templates." Type parameters actually parse in 2020 (`617b633917`, Griesemer, `dev.typeparams`) and merge to master in August 2021 (`3601aedff6`, "REVERSE MERGE dev.typeparams"). `any` becomes an alias for `interface{}` in Go 1.18, 2022.

- **Why it is a story:** Ken is already implementing "generics" for builtins in the third month of the compiler, and he takes `any` *off* the keyword list and makes it a type. The spec-writers have already sworn off templates. That tension — compiler guy reaching for generics, language guys refusing them, the word `any` sitting in the lexer as a leftover — sits in the history for fourteen years. When `any` returns it is the happy ending of a line Ken commented out in 2008.
- **What the reader learns:** `git log --grep=generics --reverse` on a long project often finds the feature in year one, abandoned. Reserved words that get demoted are unfinished arguments. The comment-out of a keyword is a design decision with a decade of interest.
- **Surprise:** 4

---

## 6. `type error interface { Error() string }` is 34 lines, four months before Go 1

- **Find-type:** 1 (tiny diff, huge blast radius)
- **Hash:** `d9877e22fe205800029ef3d39b015b2def5a79b0`
- **Date:** 2011-11-01 21:45:02 -0400
- **Author:** Russ Cox `<rsc@golang.org>`
- **Message:** `spec: add error`
- **Command:**

```
git -C ~/book16/repos/go show --stat --format=fuller d9877e22fe205800029ef3d39b015b2def5a79b0
git -C ~/book16/repos/go log -S 'type error interface' --format='%h %ai %an %s' -- doc/
```

```
    spec: add error
    R=golang-dev, dsymonds, r, r
    https://golang.org/cl/5308072
 doc/go_spec.html | 48 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 14 deletions(-)

+type error interface {
+Error() string
+}
...
-func (devnull) Write(p []byte) (n int, _ os.Error) {
+func (devnull) Write(p []byte) (n int, _ error) {
```

`os.Error` had been the name since 2008 (`0e81bba1fe`, Cox, "export an os.Error constructor"; Pike's 2009 "Big Error Shift" made it an interface). The predeclared `error` lands the night of November 1. Go 1 is tagged the following March.

- **Why it is a story:** For three years the language has errors and they are called `os.Error`. Four months before the compatibility lock, Russ puts a two-method-less, one-method interface into the *universe block* and the spec example `Write` changes type. Review is `r, r` — Rob looking twice. After this, every Go function that can fail looks the same, forever, because the next document (dig 8) will refuse to let it change.
- **What the reader learns:** The type that defines a culture can be a 34-line spec edit. Search for the moment a package type gets promoted to a predeclared name; that is when a convention becomes the language.
- **Surprise:** 3

---

## 7. Go 1 is a VERSION file containing `go1` and no newline

- **Find-type:** 1 (tiny diff, huge blast radius)
- **Hash:** `6174b5e21e73714c63061e66efdbe180e1c5491d` (tag `go1`)
- **Date:** 2012-03-28 23:41:59 +1100
- **Author:** Andrew Gerrand `<adg@golang.org>`
- **Message:** `go1`
- **Command:**

```
git -C ~/book16/repos/go show --stat --format=fuller 6174b5e21e73714c63061e66efdbe180e1c5491d
git -C ~/book16/repos/go show go1:VERSION | od -c
```

```
    go1
 VERSION | 1 +
 1 file changed, 1 insertion(+)
+go1
\ No newline at end of file
```

- **Why it is a story:** Weekly tags have been called `weekly.2009-11-06` and `release.r60`. The freeze of the language — the event the compatibility document has been aimed at — is Andrew Gerrand, late evening in Australia, adding one token to a new file and omitting the newline. No release notes in the commit. No manifesto. The tag and the blob are the same word. After this, breaking changes become a moral problem instead of a weekly one.
- **What the reader learns:** The commit that "ships 1.0" is often ceremonial and smaller than the work. `git show <tag>` before you write the myth. A missing newline is the fingerprint of a file made to be a token, not a document.
- **Surprise:** 4

---

## 8. The compatibility promise is written unlinked; syscall is the first carve-out

- **Find-type:** 1 (tiny-ish policy, huge blast) and 6 (a rule later enforced by exceptions)
- **Hashes:** `68794e7910e2db051b5e1c9a17bc358375fcf157` (the doc); `160b2461b66c13f1014243f06a401bb1477b46dc` (syscall freeze)
- **Dates:** 2012-02-09 09:42:40 +1100; 2014-08-12 15:28:45 -0700
- **Author:** Rob Pike `<r@golang.org>` both times
- **Messages:** `doc: new document about compatibility of releases The doc is not linked anywhere yet; that will come later.` / `syscall: freeze the package`
- **Command:**

```
git -C ~/book16/repos/go show --stat --format=fuller 68794e7910e2db051b5e1c9a17bc358375fcf157
git -C ~/book16/repos/go show 68794e7910e2db051b5e1c9a17bc358375fcf157:doc/go1compat.html | head -40
git -C ~/book16/repos/go show 160b2461b66c13f1014243f06a401bb1477b46dc -- src/pkg/syscall/syscall.go
```

```
    The doc is not linked anywhere yet; that will come later.
 doc/go1compat.html | 157 +++++++++++++++++++++++++++++++++++++++++++++++++++++

It is intended that programs written to the Go 1 specification will
continue to compile and run correctly, unchanged, over the lifetime
of that specification. At some indefinite point, a Go 2 specification
may arise, but until that time, Go programs that work today should
continue to work even as future "point" releases of Go 1 arise

+// NOTE: This package is locked down. Code outside the standard
+// Go repository should be migrated to use the corresponding
+// package in the go.sys subrepository.
```

- **Why it is a story:** Six weeks before the `go1` tag, Rob writes the document that will trap them, and does not even link it. "Go 2" is already imagined as an indefinite point. Two years later the first honest exception is `syscall`: the OS kept moving and the promise could not. The freeze comment is seven lines bolted onto a package godoc. The rule is real because they had to write down where it stops.
- **What the reader learns:** Compatibility docs start as unlinked drafts. The interesting commit is the first carve-out — that is when the authors discover what they actually promised. `git log -- path/to/compat` is a list of regrets.
- **Surprise:** 3

---

## 9. February 2015: Ken's C compiler is deleted (97,603 lines)

- **Find-type:** 8 (rollback of the world)
- **Hashes:** `3af0d791bed25e6cb4689fed9cc8379554971cb8` (C replaced by Go on `dev.cc`); `17eba6e6b72b9dbf24d73a84be22edd65c229631` (5g/6g/… become `cmd/compile`)
- **Dates:** 2015-02-23 14:20:01 -0500; 2015-05-21 13:28:10 -0400
- **Author:** Russ Cox `<rsc@golang.org>`
- **Messages:** `[dev.cc] cmd/6a, cmd/6g etc: replace C implementations with Go implementations` / `cmd/compile, cmd/link: create from 5g, 5l, etc` ("This CL breaks the build.")
- **Command:**

```
git -C ~/book16/repos/go show --stat --format=fuller 3af0d791bed25e6cb4689fed9cc8379554971cb8 | head -25
git -C ~/book16/repos/go show --stat --format='' 3af0d791bed25e6cb4689fed9cc8379554971cb8 | tail -3
git -C ~/book16/repos/go show --format='%s%n%b' 17eba6e6b72b9dbf24d73a84be22edd65c229631 | head -12
```

```
    [dev.cc] cmd/6a, cmd/6g etc: replace C implementations with Go implementations
    Reviewed-by: Rob Pike <r@golang.org>
 src/cmd/5g/cgen.c               | 1840 --------------
 src/cmd/{new5g => 5g}/cgen.go   |    0
 ...
 175 files changed, 856 insertions(+), 97603 deletions(-)

    This CL breaks the build. Manual fixups are in the next CL.
    See golang-dev thread titled "go tool compile, etc" for background.
```

The first spec's stretch goal was "compiler can be written in Go." Ken's first commit *was* that compiler, in C. Seven years later Russ deletes the C and Rob reviews it.

- **Why it is a story:** The world being rolled back is Ken's world: `cgen.c`, `peep.c`, `reg.c`, the Plan 9 C compilers that compiled Go since 2008. The replacements already exist as `new6g` and are renamed into place; the stat line is almost all deletions. The follow-up that invents `cmd/compile` is explicitly allowed to break the build. Self-hosting is not a rewrite in place. It is a funeral with the names kept.
- **What the reader learns:** A 97k-line deletion with 856 insertions is a swap, not a shrink. Look for `{old => new}` in `--stat` and for the commit that says it breaks the build on purpose. That is when a project changes the language it is willing to be written in.
- **Surprise:** 3

---

## 10. HTTP_PROXY + CGI: a convention becomes CVE-2016-5386

- **Find-type:** 7 (feature that became the vulnerability)
- **Hash:** `b97df54c31d6c4cc2a28a3c83725366d52329223`
- **Date:** 2016-07-18 06:05:24 +0000 (author); committed 14:58:26 by Chris Broadfoot
- **Author:** Brad Fitzpatrick `<bradfitz@golang.org>`
- **Message:** `net/http, net/http/cgi: fix for CGI + HTTP_PROXY security issue`
- **Command:**

```
git -C ~/book16/repos/go show --stat --format=fuller b97df54c31d6c4cc2a28a3c83725366d52329223
git -C ~/book16/repos/go log --grep='CVE-' --format='%h %ai %an %s' --reverse | head -5
```

```
    Because,
    * The CGI spec defines that incoming request header "Foo: Bar" maps to
      environment variable HTTP_FOO == "Bar". (see RFC 3875 4.1.18)
    * The HTTP_PROXY environment variable is conventionally used to configure
      the HTTP proxy for HTTP clients (and is respected by default for
      Go's net/http.Client and Transport)
    That means Go programs running in a CGI environment ...
    This is CVE-2016-5386, aka https://httpoxy.org/
 4 files changed, 54 insertions(+), 4 deletions(-)

b97df54c31 2016-07-18 06:05:24 +0000 Brad Fitzpatrick net/http, net/http/cgi: fix for CGI + HTTP_PROXY security issue
```

This is the first `CVE-` string in `git log --grep` on the whole history.

- **Why it is a story:** Two features, both correct, both documented, compose into a remote proxy hijack. CGI turns a `Proxy:` header into `HTTP_PROXY`. Go's HTTP client, being a good Unix citizen, reads `HTTP_PROXY`. An incoming request then aims every outbound call. The fix is small (54 lines). The bug is the product of being careful twice. Go's first named CVE is not a buffer overflow; it is two specifications agreeing in public.
- **What the reader learns:** `git log --grep=CVE- --reverse` finds the day a project joins the numbered world. Features that read the environment and features that write the environment will eventually meet. The vulnerability is often the composition, sitting in the tree for years as two good ideas.
- **Surprise:** 3

---

## 11. Every New Year, someone plants "Year of the Gopher" at 00:00:00

- **Find-type:** 2 (planted / dated artifact)
- **Hashes:** `8f3fc547d0d658a13149dd7e504087b21defddee` (2014, first) … `3dd58676054223962cd915bb0934d1f9f489d4d2` (2021)
- **Dates:** author dates forced to Jan 1 00:00:00 (2014 is 00:00:22 +1100; 2015–2016 and 2020–2021 are exact midnight)
- **Authors:** David Symonds, then Brad Fitzpatrick, Josh Bleecher Snyder, Dmitri Shuralyov
- **Message (2021):** `doc: 2021 is the Year of the Gopher` — "If there's one thing we can count on at a time like this, it's that 2021 is the Year of the Gopher."
- **Command:**

```
git -C ~/book16/repos/go log --format='%ai %ci %an %s' --grep='Year of the Gopher' | grep -v merge
```

```
2021-01-01 00:00:00 -0500 2021-01-01 20:05:20 +0000 Dmitri Shuralyov doc: 2021 is the Year of the Gopher
2020-01-01 00:00:00 -0500 2020-01-02 17:36:29 +0000 Dmitri Shuralyov doc: 2020 is the Year of the Gopher
2018-12-31 18:43:38 -1000 2019-01-01 06:18:45 +0000 Josh Bleecher Snyder doc: 2019 is the Year of the Gopher
2015-01-01 00:00:00 +1100 2014-12-31 13:00:03 +0000 David Symonds doc: 2015 will be the Year of the Gopher.
2014-01-01 00:00:22 +1100 2014-01-01 00:00:22 +1100 David Symonds 2014: Year of the Gopher.
```

A two-line edit to `doc/contribute.html`. The ritual runs 2014–2021 and then stops.

- **Why it is a story:** After the 1972 clocks, the project keeps forging timestamps, but now as a toast. Author date is set to midnight; committer date is "when Gerrit actually submitted," sometimes the previous year. 2021's body is a pandemic sentence pretending to be a certainty. Then the tradition dies — no 2022, no 2023. Planted dates are not only origin myths; they are holidays, and holidays end.
- **What the reader learns:** Compare `%ai` and `%ci`. A round midnight author date with a sloppy committer date is a human setting `GIT_AUTHOR_DATE`. Recurring subjects are a rite. When the rite stops, something about the group changed.
- **Surprise:** 3

---

## Ranked top 3

1. **The 1972–1988 hello, world root** — the entire Go history is parented on a planted B/C/ANSI joke, and `git blame` still prints 1974.
2. **Ken Thompson's first and last** — `SVN=114202` dumps the compiler; three years later a 24-line channel malloc; then the name is gone before Go 1.
3. **`go1` is one token and no newline** — the compatibility era begins as a VERSION file that is the same word as the tag.

**Disappointing:** `git log --grep` for revert / oops / sorry / hack / FIXME is almost all Gerrit merge bodies, `HACKING.md`, and the word "oops" inside unrelated sentences. The embarrassing traces have been professionally filed; the jokes (`hello.c`, Year of the Gopher) are the opposite of buried.
