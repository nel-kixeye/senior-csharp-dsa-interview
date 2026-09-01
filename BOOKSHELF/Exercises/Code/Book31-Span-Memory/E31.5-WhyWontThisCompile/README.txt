Why won't this compile?

Each fails. Name the rule and give a fix.

csharp
// A
class Parser { private ReadOnlySpan<char> _buffer; }

// B
async Task<int> CountAsync(ReadOnlySpan<char> text) { await Task.Delay(1); return text.Length; }

// C
IEnumerable<int> Lengths(ReadOnlySpan<char> s) { yield return s.Length; }

// D
Span<char> Build() { Span<char> buf = stackalloc char[64]; buf[0] = 'x'; return buf; }

- Before you look: all four have the same underlying cause. Name it once,
  then say how each one manifests it.


----
Guide: BOOKSHELF/Exercises/Book31-Span-Memory.md  (hints at the bottom of that file)
