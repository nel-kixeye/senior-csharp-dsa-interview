The stack-allocated frequency buffer

Rewrite an anagram check (Book 24) to use stackalloc instead of a
Dictionary<char,int>.

- Then answer these, which matter more than the rewrite:
  1. Why is stackalloc inside a loop dangerous, and what is the failure mode?
  2. Write the guard pattern for a buffer whose size depends on input.
  3. What is a safe upper bound for a stackalloc in bytes, roughly?


----
Guide: BOOKSHELF/Exercises/Book31-Span-Memory.md  (hints at the bottom of that file)
