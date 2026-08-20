# Remove promises

Every programmer who has touched Node.js knows its origin story. Node — the software that runs
much of the internet's plumbing, the thing that made JavaScript a serious server language —
was built on *callbacks*. Instead of a clean way to say "do this, then do that with the
result," you handed the system a function to phone back when it finished, and those
phone-back functions nested inside each other until code drifted rightward across the screen
in a shape programmers named, with feeling, "the pyramid of doom" and "callback hell." An
entire decade of libraries existed just to make it bearable. And it was all traced back to a
founding decision: Node's creator chose callbacks over the cleaner alternative the JavaScript
world would eventually standardize, a thing called Promises.

That is the story everyone repeats. It is also, in a specific and provable way, false — and
the proof has been sitting in Node's own history the whole time, in a spot almost nobody
thinks to look.

## The zero

Suppose you go looking. If Node had ever had a Promise system, its code would live in an
obvious file — call it `promise.js`. Ask the project's history how many times that file was
ever touched, across its entire seventeen-year life, and the answer is: zero. Never created,
never edited. Which seems to settle it: no Promise code, no Promise history, callbacks from
day one.

But a filename is the wrong thing to search. Ask the history a different way — not "what
happened to this file" but "when did the *word* Promise ever appear in the early years" — and
the zero turns into a list. In June 2009, four months into the project, there are commits
titled *Add Promise class*, *Implement Promises for file i/o*, *Improve Promise
documentation*. Contributors building on them through the summer.

Node had Promises. Not as a rejected proposal in a discussion somewhere — as real, shipped,
documented code, with its own tests, that lived in the project for the better part of a year.
The platform whose whole identity rests on *not* having had Promises spent its first year
having them.

## Saturday night

Here is where they went. On the evening of Saturday, February 20, 2010, Ryan Dahl — Node's
creator — made a commit titled, in full, *Remove promises*. No further explanation; the space
where a reason would go is blank. The change deleted 306 lines and added nothing: the class,
the file-integration, the documentation, the test file, all gone in one stroke.

It's worth sitting with what he was looking at that night, because the real story is more
reasonable than "he picked the wrong architecture." Node's Promises in 2010 were young and
odd. And their headline feature was a method called `.wait()` that did something startling:
it *froze the whole system* until the promised result arrived. Node's single great idea is
that you must never freeze the system that way — that's the entire point of the platform. So
the marquee convenience of its Promise experiment directly contradicted the reason Node
existed. From where Ryan sat that Saturday, that wasn't a promising foundation to build the
future on. It was a false start with a dangerous tool welded into it. So he cut it.

What the history cannot tell us is what he meant by it — *never again*, or *not like this, not
yet*. It only records what he did. And what he did shaped the next ten years: Node became the
callback platform, grew its whole callback-taming culture, and only got Promises back years
later when the JavaScript language itself grew them. The famous "founding choice" was made on
a Saturday night, against one blocking method, and then hardened — through nothing but the
passage of time and the difficulty of ever finding the deletion — into a legend that says the
choice was there from the very beginning.

The unsettling lesson underneath: in the current state of any codebase, "this never existed"
and "this was deleted years ago" look *exactly the same*. The only difference lives in the
history, and only if you know how to ask.

## The one that didn't take

Ryan's deletion of Promises stuck. It stuck because in 2010 the project was entirely his —
what he removed stayed removed, because he was the only person whose hands were on the code.
Two years later he tried the same kind of move on something smaller, and by then that was no
longer true — and the difference is the whole point.

Node had renamed a module from `sys` to `util`. In January 2012, Ryan decided the old name
should stop working entirely: he made `require('sys')` crash on purpose, with a commit note
saying it would be deleted for good in a future version. Same founder instinct — *this is
over, I've decided.*

But by 2012, look at whose hands were actually on the project. In 2009 it had been Ryan's, by a
landslide: 815 changes to the next person's 10. By 2012 that had almost exactly flipped — a
developer named Isaac Schlueter now making 861 changes to Ryan's 32. Ryan still held the
project's *vision*. Someone else now held its *keys*.

And five months after Ryan made `require('sys')` crash, Isaac reversed him. His commit is
titled *Un-break require('sys')* — and that word, *un-break*, quietly takes a side: to Isaac,
Ryan's deletion wasn't a decision, it was breakage, the kind users file bug reports about. In
its place he restored a tiny bridge so that every old program using the old name would keep
working. Three years after that, the project's governing committee settled the matter in
writing, in a meeting note preserved in the history: *deprecate, don't remove.*

So today, in 2026 — fourteen years later — `require('sys')` still works in Node, marked with a
gentle "please use the new name" warning and a maintainer's comment stating plainly: *we do
not plan to remove it.* The founder ordered it deleted. It's still here. The exact same
instinct that erased Promises in 2010 tried to erase this in 2012 and simply couldn't — and
the only thing that had changed in between was who was doing the daily work.

A deletion, it turns out, only holds if the next person is willing to keep it deleted.

## The fade

Where was Ryan while his deletion was being undone? On his way out, in the quietest way a
project's history can record someone leaving. There was no farewell, no handoff. His very last
change to Node, ever, was a routine upgrade of a Google build tool — thousands of lines of
somebody else's configuration files — after which his name simply stops appearing. The person
who wrote *Remove promises* and set the shape of a platform left it not with a speech but with
a version bump to a build system, because by then he was one voice among many, and the project
belonged to the people who kept showing up to maintain it.

## At home

If you take one habit from this, take a healthy suspicion of the word "never." When someone
tells you a project *never* did something — never had this feature, always worked that way —
remember that the current code is not a list of facts about the software. It is the running
scoreboard of every argument the software ever had, and the arguments that were settled by
*deletion* leave no mark on the scoreboard at all. They live only in the history, and usually
not under the name you'd guess. Go dig for the removal. And when a project announces that
something will be deleted "in the next version," check whether it ever actually was —
because, like `require('sys')`, the condemned thing often outlives the person who condemned
it, kept alive by whoever inherits the keys.

---

*The vanished `promise.js`, the June 2009 Promise commits, the 306-line Saturday-night
deletion, the `require('sys')` throw and its un-break, and the founder's build-tool farewell
are all real and public, reproducible with a git command each. The full technical dig is here:
[Remove promises — the full dig](13-node.full.html).*
