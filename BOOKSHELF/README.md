# The Bookshelf — Developer Pattern Recognition Training

A library for rebuilding engineering instinct. Not a syntax reference.

## The Premise

When you meet a problem, the failure mode is not *"I can't code this."*
The failure mode is *"I started coding before I recognized what it was."*

A senior engineer's real advantage is **retrieval speed**: seeing a problem and
having the right abstraction surface unbidden. That is a trained reflex, not
knowledge. This shelf trains the reflex.

## Old instinct vs. new instinct

| | |
|---|---|
| **Old** | "Here's a list. I'll write a for loop." |
| **New** | "What information am I trying to *maintain*?" → the structure follows |

The goal is **not to eliminate loops**. Loops are fine. The goal is to make the
loop a *decision* rather than a *default*.

## How each Book is written

Every book answers the same ten questions, in the same order, so the shape
becomes familiar and the retrieval path gets worn in:

1. What problem does this book solve?
2. **What clues in a problem statement tell me to reach for it?** ← the point
3. What is the naive instinct?
4. Why is that naive approach inferior?
5. What structure / C# feature / algorithm should I recognize?
6. Typical time and space complexity
7. Important C# APIs
8. Common mistakes
9. Problems where this is the correct book
10. Problems where it *looks* right but is the wrong choice

Section 2 is the reason the shelf exists. Sections 9 and 10 together are what
build discrimination — knowing when a tool applies is half the skill; knowing
when it *doesn't* is the other half, and it's the half most people skip.

## How to use it

**Do not read this shelf front to back.** It is a reference and a drill ground,
not a textbook.

1. **Skim a book's Section 2 only.** Ten minutes. Just the signals.
2. **Go straight to the drills.** `Drills/Level1-Obvious.md` onward.
3. For each drill, answer *out loud or in writing* before looking at anything:
   - Which book?
   - Why — which specific words in the statement triggered it?
   - Expected time/space complexity?
   - What is the naive approach, and what does it cost?
   - Which concrete C# type/API?
4. **Only then** open `Drills/ANSWERS.md`.
5. **Then go build fluency.** `Exercises/Book<NN>.md` has five interview-style
   problems per book. Recognition tells you which tool; the exercises make you
   fast with it.

### Answers live in a separate file on purpose

`ANSWERS.md` is deliberately not adjacent to the questions. Recognition only
trains under retrieval pressure — if the answer is visible in peripheral
vision, you are reading, not recalling. Commit to a wrong answer before you
check. A wrong answer you committed to teaches more than a right answer you
glanced at.

## The recurring drill: "Before You Loop"

See `Drills/BeforeYouLoop.md`. One question, asked every single time:

> **What data structure or built-in operation could eliminate unnecessary work
> before I write a loop?**

## Developer Mode vs. Interview Mode

Each book carries a **Production Lens** note. Interview-optimal and
production-optimal diverge more often than interview prep admits:

- The interview wants `Dictionary<char,int>` built by hand.
- Production may want `CountBy`, a `GroupBy`, or a frozen collection — or may
  want the hand-rolled loop because it's on a hot path and allocation matters.

Good engineering is **choosing the right abstraction**, not proving you can
implement everything by hand. Both modes are trained here, and they are labeled.

## Layout

```
BOOKSHELF/
├── README.md          ← you are here
├── INDEX.md           ← signal → book flashcard table (the money page)
├── Books/             ← 33 books, Book01..Book33
├── Drills/            ← recognition: "WHICH book?"
│   ├── BeforeYouLoop.md
│   ├── Level1-Obvious.md          (12)
│   ├── Level2-Mixed.md            (12)
│   ├── Level3-Deceptive.md        (12)
│   ├── Level4-Combined.md         (10)
│   ├── Level5-InterviewSim.md      (8)
│   └── ANSWERS.md                 ← open last, always
└── Exercises/         ← execution: "USE this book"
    ├── README.md
    ├── PROGRESS.md                ← checklist of all 165
    └── Book01..Book33.md          (5 each)
```

54 drills total. They are deliberately **not** grouped by book — mixing is the
entire point. A drill you can solve because you know which chapter you're in is
a drill that taught you nothing.

## Drills vs. Exercises — you need both

| | Drills | Exercises |
|---|---|---|
| Question | "**Which** book?" | "**Use** this book." |
| The book is | hidden — that is the test | given, in the filename |
| Trains | recognition | execution |
| Output | a spoken answer | working C# |
| Mixed? | yes, deliberately | no, grouped by book |

Recognition without fluency means you name the right pattern and then fumble it
under pressure. Fluency without recognition means you write a beautiful sliding
window for a problem that needed a heap.

**Run them together.** Do a book's five exercises, then go do a Drills level —
the drills are where you find out whether the pattern actually stuck.

Exercises carry a progressive **hint ladder** (nudge → structure → skeleton)
behind a divider at the bottom of each file. There are no full solutions
anywhere, by design: the skeleton unsticks you without doing the part that
builds the muscle. Take one rung at a time, and only after genuinely trying.

## Complexity notation used throughout

`n` = input size, `k` = result/window/selection size, `V`/`E` = vertices/edges,
`σ` = alphabet size. "O(1) average" on hash structures means exactly that —
worst case is O(n) under adversarial collisions, which matters more in
production than in interviews.
