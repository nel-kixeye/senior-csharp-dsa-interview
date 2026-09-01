Walls and Gates

A grid contains -1 (wall), 0 (gate), and int.MaxValue (empty room). Fill
each empty room with the distance to its nearest gate, in place.

- Constraints: up to 250 × 250.
- Target: O(rows · cols) time.
- Edge cases: no gates (grid unchanged); no empty rooms; a room unreachable
  from any gate (stays int.MaxValue); all gates.


----
Guide: BOOKSHELF/Exercises/Book17-BFS.md  (hints at the bottom of that file)
