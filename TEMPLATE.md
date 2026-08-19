# Chapter beats (not sections)

A chapter is 2,200–3,200 words of body. It hits these beats in whatever order the story wants;
the ONLY rule is that no two consecutive chapters open on the same kind of object.

- **COLD OPEN** — drop the reader into one concrete moment: a diff hunk, a clock, a name, an
  absence. Not "This is the story of…". Ideally the thing that will turn out to matter, shown
  before we know it matters.
- **THE ROOM** — reconstruct what the actor knew and wanted right then. Their tools, their
  ticket, their Tuesday. This is where "no sneering" lives.
- **THE TURN** — the reveal. The reader should feel it a sentence before it is named. Put the
  receipt (hash + command) at the turn, inline, small.
- **THE BLAST RADIUS** — what it cost and for how long, told concretely (who, how many, how
  long it stayed dark).
- **AT HOME** — the command the reader should run on their own repo, woven into the closing,
  never a boxed sidebar. The habit is the takeaway.

Receipts: prose may quote only what appears in `chapters/NN-x.receipts.md`. Reference receipts
by their R-number in a trailing `## Receipts` list (R1, R4, …) with the one-line locator.

Word count method (body only, excludes the Receipts list):
`awk '/^## Receipts/{exit} {print}' chapters/NN-x.md | wc -w`
