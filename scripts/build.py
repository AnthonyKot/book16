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
        # paragraph: gather until blank
        para=[ln]; i+=1
        while i<len(lines) and lines[i].strip()!="" and not lines[i].startswith(("#","```",">")):
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
    ("06-genesis.reader", 'chapter <b>06</b> · six repos · the genesis lie',
     "Six famous first commits: two robots, three cuts, a funeral, an accidental fourth Genesis — and one true beginning. Told plainly.", "06-genesis"),
    ("06-genesis", 'chapter <b>06</b> · full dig · six repos · the genesis lie',
     "The complete dig: php's empty tree, cpython's September-in-August, Linus's cut in writing, redis at 10:30:00, openttd's crashed SVN, and Linux's four roots.", "06-genesis.full"),
    ("05-git", 'chapter <b>05</b> · full dig · repo <b>git/git</b> · the night the names were made',
     "The complete dig: the false law, the 177-second copyright, the empty announcement, the 01:10 flip, and the formatting-only patch that amended the constitution.", "05-git.full"),
    ("08-costume.reader", 'chapter <b>08</b> · three repos · the corporate costume',
     "MS-DOS, the-algorithm, Swift: three companies published their history as a git repo, and each decided differently what history is — told plainly.", "08-costume"),
    ("08-costume", 'chapter <b>08</b> · full dig · three repos · the corporate costume',
     "The complete dig: the 1982 date with a 2018 clock second, the scrub authored before the dump it apologizes for, and the license header planted into 2010.", "08-costume.full"),
]

def receipts_regen_note(stem):
    return f'chapters/{stem}.receipts.md'

if __name__=="__main__":
    for entry in CHAPTERS:
        stem, kicker, desc = entry[0], entry[1], entry[2]
        out_stem = entry[3] if len(entry)>3 else stem
        md = ROOT/"chapters"/(stem+".md")
        if not md.exists():
            print("skip (no md):", stem); continue
        out = build_chapter(md, kicker, desc, out_stem)
        print("built", out.name)
