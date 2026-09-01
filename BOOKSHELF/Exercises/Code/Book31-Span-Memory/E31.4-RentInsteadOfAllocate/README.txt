Rent instead of allocate

You process 10,000 messages/second, each needing a temporary byte[] of about
64 KB.

- Rewrite the naive new byte[65536] version using ArrayPool<byte>.Shared.
- Then: why does 64 KB matter specifically? What threshold is it near, and what
  changes above that threshold?


----
Guide: BOOKSHELF/Exercises/Book31-Span-Memory.md  (hints at the bottom of that file)
