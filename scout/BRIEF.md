# Blame — scouting brief (2026-08-18)

Working title: **Blame** (`git blame`). Git archaeology: each chapter is one dig in a public
repository — a commit, a diff, a comment, a timestamp, a name — that reveals something the surface
didn't, reproducible by the reader with git commands. Receipts are commit hashes.

Find types to hunt (per repo):
1. Tiny diff, huge blast radius        5. Comment/TODO that outlived its code
2. Planted / dated / faked artifact    6. Revert war (a rule enforced by reverts)
3. First commit (what day one shows)   7. Feature that became the vulnerability
4. Name that disappears / appears      8. Rollback of the world (a diff undoing reality)

Rules: hashes must be real and reproduced with a command; give date, author, message, the exact
git command that shows it; one line on why it's a *story* (someone decided, trace left, someone paid);
rate surprise 1–5 honestly — "everyone knows this" scores 1. Reconstruct the moment before the outcome
was known; no sneering.

## Find types 9-10 (added 2026-08-19 after the two-model corpus pass)

9. **The empty commit** — tree identical to its parent (`diff <c>^{tree} <c>~^{tree}` is empty).
   Read the subject as an ops log: a claim of absent work, a conversion that dropped the payload,
   a ceremony/section-heading commit, or a mirror/CI trigger. Found in ≥11 of 23 repos.
10. **Signature & tag-object archaeology** — `git cat-file -p <tag>`, not just the ref. Annotated
   ≠ signed; a signature's scope ≠ the shipped artifact; tags can carry a history unreachable from
   HEAD; `mergetag` preserves a deleted tag's signature; taggers reveal crisis staffing; tags can
   be backdated as policy. Found in ≥10 of 23 repos.
