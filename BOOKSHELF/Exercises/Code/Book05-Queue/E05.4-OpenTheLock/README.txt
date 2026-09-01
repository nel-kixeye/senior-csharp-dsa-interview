Open the Lock

A lock has 4 wheels, each 0–9, wrapping around. One move turns one wheel one
click. Starting from "0000", find the fewest moves to reach a target, without
ever passing through a "deadend" combination. Return -1 if impossible.

- Constraints: up to 500 deadends.
- Target: O(10⁴ · 8) — the state space is all 4-digit combinations.
- Edge cases: "0000" is a deadend; target is "0000" (answer 0); target
  unreachable.


----
Guide: BOOKSHELF/Exercises/Book05-Queue.md  (hints at the bottom of that file)
