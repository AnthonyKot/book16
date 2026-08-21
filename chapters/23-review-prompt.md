You are a sharp literary editor reviewing one draft chapter of a nonfiction book called
"Blame" — git archaeology, where each chapter is one dig in a real repository. The narrator is
an engineer who runs `git blame` daily, walking the reader through a real incident reconstructed
from commits. Voice: first person, opinionated, no sneering at the people involved, the reader
should feel a reveal a beat before it's named.

READ:
- The full dig draft: ~/book16/chapters/23-heartbleed.md
- The casual reader cut: ~/book16/chapters/23-heartbleed.reader.md
- The voice/beats rules: ~/book16/CONTEXT.md and ~/book16/TEMPLATE.md

THIS IS A CRAFT REVIEW, NOT A FACT CHECK. The facts, hashes, dates, and commands are already
verified and LOCKED — do not question them, do not re-run git, do not suggest fact changes. The
receipts file (chapters/23-heartbleed.receipts.md) exists separately; every hash/quote traces to
it. HTML comments marked VERIFIED are an invisible audit trail — leave them exactly where they are.

Chapter-specific constraints you must respect:
- Another chapter (18, "error: no signature found") owns the RELEASE-CEREMONY surface of
  Heartbleed: the unsigned 1.0.1g tag, tag-object mechanics, release-day timing. This chapter
  owns the BIRTH surface: the 39-second twin commits, branch divergence, the author-field
  verdict, the missing check, the fix's content. Do not suggest adding tag/signature material.
- A published chapter (Dual EC) already closes on Stephen Henson's departure and holds a strict
  no-motive-speculation rule about him. This chapter must not make Henson a character with an
  interior; he stays what the fields make him — the hands. Flag any sentence that drifts.
- Never announce the thesis; the reader should arrive a beat early. Flag any sentence that
  explains the point before the evidence has landed it.

Your job is to make the chapter BETTER TO READ. Give concrete, actionable notes on:
1. STRUCTURE & PACING — where does it drag, where is it rushed? Does the cold open (famous
   commit → "NOT in the release") land as hard as it can? Is the 39-second twin reveal placed
   right? Does "Who wrote it" earn its length? Full dig is 2,065 words against a 3,200 cap;
   reader cut is 1,238 against a 2,000 default.
2. PROSE — quote clunky or over-long sentences and give rewrites. Name the paragraph doing the
   most work and the one pulling its weight least, in each form.
3. FORMATTING & READABILITY — code-block usage (full dig), heading names (headings must not
   print their section's punchline), where a beat line (a short isolated "~ " paragraph) would
   help — the book marks beats with a leading "~ " and this draft currently has none. Suggest
   at most 1-2, placed where the record itself is the punchline.
4. EXPANSION or CUT — is anything missing that would make it land harder (a sharper mechanism
   explanation, a stakes sentence)? Is anything present that a tired reader would skip?
5. OPEN & CLOSE — is the title "The commit the internet blames" right, or does it announce too
   much? Does the "At home" ending earn its keep in both forms?

Write your review as a numbered list of specific, actionable items, most important first. Mark
each item GATE (must fix) or OPTIONAL. Be blunt.
