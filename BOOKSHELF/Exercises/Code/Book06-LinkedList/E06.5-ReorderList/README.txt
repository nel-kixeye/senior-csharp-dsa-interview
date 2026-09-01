Reorder List

Given L0 → L1 → … → Ln-1 → Ln, reorder it in place to
L0 → Ln → L1 → Ln-1 → L2 → ….

- Constraints: up to 5·10⁴ nodes. Do not modify values — only rewire nodes.
- Target: O(n) time, O(1) space.
- Edge cases: 1, 2, and 3 nodes; even vs odd length (make sure the tail's
  next ends as null, not a cycle).


----
Guide: BOOKSHELF/Exercises/Book06-LinkedList.md  (hints at the bottom of that file)
