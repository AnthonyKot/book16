#!/usr/bin/env python3
"""Build Blame chapter pages from canonical Markdown. No deps, no CDN.
Handles the constrained subset the chapters use: # / ## headings, paragraphs,
```lang fenced code (console/diff/c highlighted), **bold**, *em*, `code`,
[Rn] receipt links, and the trailing ## Receipts list."""
import html, re, sys, pathlib

ROOT = pathlib.Path(__file__).resolve().parent.parent

def esc(s): return html.escape(s, quote=False)

def inline(t):
    # code spans first (protect from other rules)
    spans=[]
    def stash(m): spans.append(m.group(1)); return f"\x00{len(spans)-1}\x00"
    t=re.sub(r"`([^`]+)`", stash, t)
    t=esc(t)
    t=re.sub(r"\[R(\d+)\]", r'<a class="receipt-ref" href="#r\1">R\1</a>', t)
    t=re.sub(r"\[([^\]]+)\]\(([^)]+)\)", r'<a href="\2">\1</a>', t)
    t=re.sub(r"\*\*([^*]+)\*\*", r"<strong>\1</strong>", t)
    t=re.sub(r"\*([^*]+)\*", r"<em>\1</em>", t)
    t=re.sub(r"\x00(\d+)\x00", lambda m:f"<code>{esc(spans[int(m.group(1))])}</code>", t)
    return t

def code_block(lang, lines):
    out=[]
    label=f'<span class="lang">{esc(lang)}</span>' if lang else ""
    for ln in lines:
        e=esc(ln)
        if lang=="diff":
            if ln.startswith("+"): out.append(f'<span class="diff-add">{e}</span>')
            elif ln.startswith("-"): out.append(f'<span class="diff-del">{e}</span>')
            elif ln.startswith("@@") or ln.startswith("diff ") or ln.startswith("index "): out.append(f'<span class="diff-hunk">{e}</span>')
            else: out.append(e)
        elif lang=="console" and ln.startswith("$"):
            out.append(f'<span class="tok-prompt">$</span>'+e[1:])
        else:
            out.append(e)
    return f'<pre>{label}<code>'+"\n".join(out)+"</code></pre>"

def render(md):
    lines=md.split("\n"); i=0; html_parts=[]; receipts=None
    while i<len(lines):
        ln=lines[i]
        if ln.startswith("## Receipts"):
            receipts=lines[i+1:]; break
        if ln.startswith("```"):
            lang=ln[3:].strip(); body=[]; i+=1
            while i<len(lines) and not lines[i].startswith("```"): body.append(lines[i]); i+=1
            html_parts.append(code_block(lang, body)); i+=1; continue
        if ln.startswith("# "):
            html_parts.append(f"<h1>{inline(ln[2:])}</h1>"); i+=1; continue
        if ln.startswith("## "):
            html_parts.append(f"<h2>{inline(ln[3:])}</h2>"); i+=1; continue
        if ln.startswith("> "):
            html_parts.append(f"<blockquote>{inline(ln[2:])}</blockquote>"); i+=1; continue
        if ln.startswith("<!--"):
            i+=1; continue
        if ln.strip()=="":
            i+=1; continue
        # paragraph: gather until blank (authoring comments never render)
        para=[ln]; i+=1
        while i<len(lines) and lines[i].strip()!="" and not lines[i].startswith(("#","```",">")):
            if lines[i].lstrip().startswith("<!--"): i+=1; continue
            para.append(lines[i]); i+=1
        text=" ".join(para)
        if text.startswith("~ "):
            html_parts.append(f'<p class="beat">{inline(text[2:])}</p>')
        else:
            html_parts.append(f"<p>{inline(text)}</p>")
    return html_parts, receipts

def render_receipts(rlines):
    items=[]
    for ln in rlines:
        m=re.match(r"- \*\*R(\d+)\*\* (.+)", ln)
        if m:
            items.append(f'<li id="r{m.group(1)}"><span class="rid">R{m.group(1)}</span> {inline(m.group(2))}</li>')
        elif ln.startswith("*") and "receipts.md" in ln:
            regen=inline(ln.strip("*").strip())
    body='<div class="receipts"><h2>receipts</h2><ul>'+"".join(items)+"</ul>"
    body+='<p class="regen">Every command above is reproducible against a fresh clone. Full transcripts and the regenerate script sit beside this chapter in the repository.</p></div>'
    return body

PAGE="""<!DOCTYPE html>
<html lang="en" data-theme-default="dark">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{title} — Blame</title>
<meta name="description" content="{desc}">
<link rel="stylesheet" href="../static/style.css">
<script src="../static/theme.js"></script>
</head>
<body>
<header class="site-header"><div class="row">
  <a class="brand" href="../index.html"><b>git blame</b> · Blame</a>
  <nav class="site-nav"><a href="../index.html">contents</a><a href="../about.html">method</a><button class="theme-toggle" type="button">☾ dark</button></nav>
</div></header>
<main class="wrap">
<p class="kicker">{kicker}</p>
{body}
{receipts}
<div class="chapter-foot"><a href="../index.html">← contents</a><a href="../about.html">how to check this →</a></div>
</main>
<footer class="site-footer"><div class="wrap">Blame — git archaeology. Every hash is real; clone the repo and run the command.</div></footer>
</body>
</html>
"""

def build_chapter(mdpath, kicker, desc, out_stem=None):
    md=pathlib.Path(mdpath).read_text()
    parts, rlines = render(md)
    title=re.search(r"^# (.+)", md, re.M).group(1)
    receipts=render_receipts(rlines) if rlines else ""
    out=PAGE.format(title=esc(title), desc=esc(desc), kicker=kicker, body="\n".join(parts), receipts=receipts)
    outpath=ROOT/"chapters"/((out_stem or pathlib.Path(mdpath).stem)+".html")
    outpath.write_text(out)
    return outpath

# (md_stem, kicker, desc[, out_stem])
CHAPTERS = [
    ("01-debian-openssl.reader", 'chapter <b>01</b> · repo <b>debian/openssl</b> · CVE-2008-0166',
     "How a nine-minute change in 2006 made every key Debian generated for two years guessable — the story, told plainly.", "01-debian-openssl"),
    ("01-debian-openssl", 'chapter <b>01</b> · full dig · repo <b>debian/openssl</b> · CVE-2008-0166',
     "The complete dig with every command and receipt: the nine-minute pair, the dead path, the one-sentence fix.", "01-debian-openssl.full"),
    ("02-log4j2.reader", 'chapter <b>02</b> · repo <b>apache/logging-log4j2</b> · CVE-2021-44228',
     "Log4Shell was not a careless mistake. It was five reasonable decisions over eleven years, each one you would have approved — told plainly.", "02-log4j2"),
    ("02-log4j2", 'chapter <b>02</b> · full dig · repo <b>apache/logging-log4j2</b> · CVE-2021-44228',
     "The complete dig: five commits over eleven years, each command and receipt, that add up to Log4Shell.", "02-log4j2.full"),
    ("03-bitcoin.reader", 'chapter <b>03</b> · repo <b>bitcoin/bitcoin</b> · a quoting bug, made permanent',
     "git credits --author=Satoshi with 8 commits. How a one-character quoting slip became a permanent part of Bitcoin's history — told plainly.", "03-bitcoin"),
    ("03-bitcoin", 'chapter <b>03</b> · full dig · repo <b>bitcoin/bitcoin</b> · a quoting bug, made permanent',
     "The complete dig: three shortlog rows, the eight flag-authored commits, the correctly-credited twin, and why the hash chain makes it unfixable.", "03-bitcoin.full"),
    ("04-xz.reader", 'chapter <b>04</b> · repo <b>tukaani-project/xz</b> · CVE-2024-3094',
     "The xz backdoor as a human story: a two-year friendship, a weapon that ships in the package but never the repo, and one sabotaging period — told plainly.", "04-xz"),
    ("04-xz", 'chapter <b>04</b> · full dig · repo <b>tukaani-project/xz</b> · CVE-2024-3094',
     "The complete dig: every command and receipt behind the two-year con, the .gitignore weapon, and the single sabotaging period.", "04-xz.full"),
    ("05-git.reader", 'chapter <b>05</b> · repo <b>git/git</b> · the night the names were made',
     "Git's own origin: four lines at 01:10, a missed spot at 01:34, and a founding document that slept for a month — told plainly.", "05-git"),
    ("07-vim.reader", 'chapter <b>07</b> · repo <b>vim/vim</b> · the last 32 hours',
     "Bram Moolenaar's final weekend of commits, the one-name ledger, and the succession the license promised — told plainly.", "07-vim"),
    ("07-vim", 'chapter <b>07</b> · full dig · repo <b>vim/vim</b> · the last 32 hours',
     "The complete dig: the teapot, the 404 parentheses, the six-hour revert with the empty body, the two dates on patch 9.0.1679, and the announcement.", "07-vim.full"),
    ("06-genesis.reader", 'chapter <b>06</b> · seven repos · the genesis lie',
     "Seven famous repository openings: two robots, three cuts, a funeral, an accidental fourth Genesis — and one true beginning. Told plainly.", "06-genesis"),
    ("06-genesis", 'chapter <b>06</b> · full dig · seven repos · the genesis lie',
     "The complete dig: php's empty tree, cpython's September-in-August, Linus's cut in writing, redis at 10:30:00, openttd's crashed SVN, and Linux's four roots.", "06-genesis.full"),
    ("05-git", 'chapter <b>05</b> · full dig · repo <b>git/git</b> · the night the names were made',
     "The complete dig: the false law, the 177-second copyright, the empty announcement, the 01:10 flip, and the formatting-only patch that amended the constitution.", "05-git.full"),
    ("08-costume.reader", 'chapter <b>08</b> · three repos · the corporate costume',
     "MS-DOS, the-algorithm, Swift: three companies published their history as a git repo, and each decided differently what history is — told plainly.", "08-costume"),
    ("08-costume", 'chapter <b>08</b> · full dig · three repos · the corporate costume',
     "The complete dig: the 1982 date with a 2018 clock second, the scrub authored before the dump it apologizes for, and the license header planted into 2010.", "08-costume.full"),
    ("09-npm.reader", 'chapter <b>09</b> · repos <b>event-stream</b> + <b>colors</b> · the two ledgers',
     "Two npm sabotages, opposite mechanics: a stranger who inherited the keys, an owner who never gave them up — and the gap between repository and registry that hid both. Told plainly.", "09-npm"),
    ("09-npm", 'chapter <b>09</b> · full dig · repos <b>event-stream</b> + <b>colors</b> · the two ledgers',
     "The complete dig: the two-line payload in the house style, the helpful week, the four-minute face-wash, and the sabotage still sitting on master.", "09-npm.full"),
    ("10-t2t.reader", 'chapter <b>10</b> · repo <b>tensorflow/tensor2tensor</b> · the Transformer\'s repository',
     "The Transformer's code went public three days after the paper — and then trained itself to a perfect score by peeking at the answers. Told plainly.", "10-t2t"),
    ("10-t2t", 'chapter <b>10</b> · full dig · repo <b>tensorflow/tensor2tensor</b> · the Transformer\'s repository',
     "The complete dig: the 155-second delivery, the look_right default, Vaswani's zero-loss revert, and the two opposite compatibility rulings.", "10-t2t.full"),
    ("11-ffmpeg.reader", 'chapter <b>11</b> · repo <b>FFmpeg/FFmpeg</b> · the fork war',
     "The FFmpeg/Libav schism as git recorded it: a 24-hour revert, 1,151 merges at two in the morning, and an office that outlived its occupant. Told plainly.", "11-ffmpeg"),
    ("11-ffmpeg", 'chapter <b>11</b> · full dig · repo <b>FFmpeg/FFmpeg</b> · the fork war',
     "The complete dig: the seven deleted lines, the qatar merges, the licence-header string war, and the heading removed by a returned forker.", "11-ffmpeg.full"),
    ("12-php.reader", 'chapter <b>12</b> · repo <b>php/php-src</b> · the backdoor signed by the founder',
     "In 2021 a remote-code-execution backdoor was committed to PHP under Rasmus Lerdorf's name, tagged \"Fix typo\" — and git's own metadata proves he didn't write it. Told plainly.", "12-php"),
    ("12-php", 'chapter <b>12</b> · full dig · repo <b>php/php-src</b> · the backdoor signed by the founder',
     "The complete dig: the eleven-line payload, the timezone and Signed-off-by tells, the revert war, and why a normal full clone still carries the reverted backdoor commit in its history.", "12-php.full"),
    ("13-node.reader", 'chapter <b>13</b> · repo <b>nodejs/node</b> · the deletion behind the folklore',
     "Everyone knows Node chose callbacks over Promises. Git knows Node HAD Promises for eight months in 2009 — and that someone deleted them. Told plainly.", "13-node"),
    ("13-node", 'chapter <b>13</b> · full dig · repo <b>nodejs/node</b> · the deletion behind the folklore',
     "The complete dig: the 306-line Promise deletion, why you can't find it, and the founder's second deletion that the next lead un-broke — still in HEAD.", "13-node.full"),
    ("14-openssl.reader", 'chapter <b>14</b> · repo <b>openssl/openssl</b> · the fix a certificate forbade',
     "A maintainer deleted a suspected-backdoor algorithm from OpenSSL — and a compliance process made him put it back. The revert war, in his own commit messages. Told plainly.", "14-openssl"),
    ("14-openssl", 'chapter <b>14</b> · full dig · repo <b>openssl/openssl</b> · the fix a certificate forbade',
     "The complete dig: add / disable / remove / revert-the-removal / remove-again, the 'not accepted for 2.0.7' body, and the maintainer who typed all of it and then vanished.", "14-openssl.full"),
    ("15-postgres.reader", 'chapter <b>15</b> · repo <b>postgres/postgres</b> · the hack nobody dares fix',
     "A 1992 placeholder — 'THIS IS A HACK TO GET V4 OUT THE DOOR' — that PostgreSQL's most careful engineer refuses to fix, and restores when someone else removes it. Told plainly.", "15-postgres"),
    ("15-postgres", 'chapter <b>15</b> · full dig · repo <b>postgres/postgres</b> · the hack nobody dares fix',
     "The complete dig: the 0.3333333 selectivity guess, the XXX that inverted into 'do not fix me', and the enum feature landed as a warning.", "15-postgres.full"),
    ("16-empty.reader", 'chapter <b>16</b> · five repos · the commit that changes nothing',
     "Commits that alter zero bytes and exist on purpose — doorbells for machines, markers for readers, receipts for work already done. Told plainly.", "16-empty"),
    ("16-empty", 'chapter <b>16</b> · full dig · five repos · the commit that changes nothing',
     "The complete dig: the tree-equals-parent mechanism, the 2 a.m. mirror trigger, the four QUIC phase markers, and the backport that had nothing left to apply.", "16-empty.full"),
    ("17-dirtycow.reader", 'chapter <b>17</b> · repo <b>torvalds/linux</b> · CVE-2016-5195',
     "Linus fixed a memory race in 2005, and two days later it was undone for an excellent reason. Eleven years on, he fixed it again — and confessed in the commit message. Told plainly.", "17-dirtycow"),
    ("17-dirtycow", 'chapter <b>17</b> · full dig · repo <b>torvalds/linux</b> · CVE-2016-5195',
     "The complete dig: the 2005 fix, the s390 undo, the two clocks that turned a theoretical race into Dirty COW, and the exploit found in captured traffic.", "17-dirtycow.full"),
    ("18-signatures.reader", 'chapter <b>18</b> · seven repos · what a signature covers',
     "The release that fixed Heartbleed is not signed. The xz releases that carried a backdoor are. What a tag object actually attests — told plainly.", "18-signatures"),
    ("18-signatures", 'chapter <b>18</b> · full dig · seven repos · what a signature covers',
     "The complete dig: 'error: no signature found' on 1.0.1g, the signed xz trees that omit the payload, and a critical Bitcoin fix reachable only from its tag.", "18-signatures.full"),
    ("19-openttd.reader", 'chapter <b>19</b> · repo <b>OpenTTD/OpenTTD</b> · the typo that wasn\'t',
     "A stranger fixed an obvious typo in a table of constants. Two days later it was reverted, because the value only looked wrong — and the revert wrote the reason where the next person would look. Told plainly.", "19-openttd"),
    ("19-openttd", 'chapter <b>19</b> · full dig · repo <b>OpenTTD/OpenTTD</b> · the typo that wasn\'t',
     "The complete dig: the one-cell change, the one-in-twelve toll gate that made the numbers incomparable, and the five-line comment still standing seven years on.", "19-openttd.full"),
    ("20-redis.reader", 'chapter <b>20</b> · repo <b>redis/redis</b> · the departure and the return',
     "The commit that removed the cluster node named \"myself\" was also its author's goodbye. Four and a half years later he came back — as a brand-new root. Told plainly.", "20-redis"),
    ("20-redis", 'chapter <b>20</b> · full dig · repo <b>redis/redis</b> · the departure and the return',
     "The complete dig: the minus-one diff, the 1,677-day silence, the parentless 2025 root whose LICENSE granted nothing, and the holder line that changed five weeks later.", "20-redis.full"),
    ("21-iojs.reader", 'chapter <b>21</b> · repo <b>nodejs/node</b> · the fork war on a stranded branch',
     "Sixteen commits on an archived branch preserve the private war room where Node.js was forked — and the seam where the reunion was declared rather than merged. Told plainly.", "21-iojs"),
    ("21-iojs", 'chapter <b>21</b> · full dig · repo <b>nodejs/node</b> · the fork war on a stranded branch',
     "The complete dig: the governance draft, the four-week clock, the binary renamed out and back, and a changelog baseline that git will not confirm as ancestry.", "21-iojs.full"),
    ("22-curl.reader", 'chapter <b>22</b> · repo <b>curl/curl</b> · the first commit is a recovery',
     "curl's first commit contains a compiled copy of curl — because five weeks earlier its maintainer's source disk died. Told plainly.", "22-curl"),
    ("22-curl", 'chapter <b>22</b> · full dig · repo <b>curl/curl</b> · the first commit is a recovery',
     "The complete dig: the 144-file shovel-load, the crash entry inside it, the HttpGet pre-history, and twenty-six years between one author's first and latest commits.", "22-curl.full"),
    ("23-heartbleed.reader", 'chapter <b>23</b> · repo <b>openssl/openssl</b> · CVE-2014-0160',
     "The famous Heartbleed commit never shipped — its twin, thirty-nine seconds younger on another branch, is the one that bled. Told plainly.", "23-heartbleed"),
    ("23-heartbleed", 'chapter <b>23</b> · full dig · repo <b>openssl/openssl</b> · CVE-2014-0160',
     "The complete dig: the ancestry test the folklore fails, the 39-second twin, the author fields vs the Submitted-by line, the absent check, and the two-if fix.", "23-heartbleed.full"),
]

# Source prefixes are stable production IDs: receipt generators and manuscript links use them.
# Public chapter numbers follow the final eight-chapter reading order.
FINAL_ORDER = {
    "04-xz": "01",
    "01-debian-openssl": "02",
    "10-t2t": "03",
    "14-openssl": "04",
    "15-postgres": "05",
    "12-php": "06",
    "09-npm": "07",
    "07-vim": "08",
}
DRAFTS = {
    "02-log4j2", "03-bitcoin", "05-git", "06-genesis",
    "08-costume", "11-ffmpeg", "13-node", "16-empty",
    "17-dirtycow", "18-signatures", "19-openttd",
    "20-redis", "21-iojs", "22-curl", "23-heartbleed",
}

def public_kicker(stem, kicker):
    base = stem[:-7] if stem.endswith(".reader") else stem
    if base in FINAL_ORDER:
        label = f'chapter <b>{FINAL_ORDER[base]}</b>'
    elif base in DRAFTS:
        label = 'P.S. <b>draft</b>'
    else:
        raise ValueError(f"chapter missing from final/draft selection: {base}")
    return re.sub(r"chapter <b>\d+</b>", label, kicker, count=1)

def receipts_regen_note(stem):
    return f'chapters/{stem}.receipts.md'

if __name__=="__main__":
    for entry in CHAPTERS:
        stem, kicker, desc = entry[0], entry[1], entry[2]
        kicker = public_kicker(stem, kicker)
        out_stem = entry[3] if len(entry)>3 else stem
        md = ROOT/"chapters"/(stem+".md")
        if not md.exists():
            print("skip (no md):", stem); continue
        out = build_chapter(md, kicker, desc, out_stem)
        print("built", out.name)
