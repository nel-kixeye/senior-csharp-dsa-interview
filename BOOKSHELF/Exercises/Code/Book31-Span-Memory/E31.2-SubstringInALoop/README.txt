Substring in a loop

This scans a large log line looking for a prefix match at each position.

csharp
for (int i = 0; i < line.Length - len; i++)
    if (line.Substring(i, len) == target)
        return i;

- Rewrite it with no allocation.
- Then: name the BCL method that makes the whole loop unnecessary, and say what
  it does that a hand-written loop probably does not (hint: it is about how many
  characters the CPU compares at once).


----
Guide: BOOKSHELF/Exercises/Book31-Span-Memory.md  (hints at the bottom of that file)
