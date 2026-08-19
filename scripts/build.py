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
        cls=' class="beat"' if len(text)<70 and text.endswith(".") and "  " not in text and "`" not in text else ""
        html_parts.append(f"<p{cls}>{inline(text)}</p>")
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
    body+='<p class="regen">Every command above is reproducible. Full transcripts in <code>chapters/01-debian-openssl.receipts.md</code>; regenerate with <code>scripts/receipts-01.sh</code>.</p></div>'
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

def build_chapter(mdpath, kicker, desc):
    md=pathlib.Path(mdpath).read_text()
    parts, rlines = render(md)
    title=re.search(r"^# (.+)", md, re.M).group(1)
    receipts=render_receipts(rlines) if rlines else ""
    out=PAGE.format(title=esc(title), desc=esc(desc), kicker=kicker, body="\n".join(parts), receipts=receipts)
    outpath=ROOT/"chapters"/(pathlib.Path(mdpath).stem+".html")
    outpath.write_text(out)
    return outpath

if __name__=="__main__":
    p=build_chapter(
        ROOT/"chapters/01-debian-openssl.md",
        'chapter <b>01</b> · repo <b>debian/openssl</b> · CVE-2008-0166',
        "How a nine-minute Debian packaging change in 2006 made every key the distribution generated for two years predictable — reconstructed from the commits.")
    print("built", p)
