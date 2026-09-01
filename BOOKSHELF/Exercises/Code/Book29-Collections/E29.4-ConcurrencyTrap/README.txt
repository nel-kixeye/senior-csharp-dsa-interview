The concurrency trap

This runs fine in testing and hangs in production.

csharp
private static readonly Dictionary<string, int> _counts = new();

public void Record(string key)
{
    _counts[key] = _counts.GetValueOrDefault(key) + 1;
}

- Explain: what actually happens under concurrent calls — and be specific, it
  is worse than "the count might be wrong".
- Fix it three ways: with a lock, with a concurrent collection, and with a
  design change that avoids shared mutable state entirely.
- Then: why is ConcurrentDictionary's _counts[key] = _counts[key] + 1
  still wrong, and what is the correct API?


----
Guide: BOOKSHELF/Exercises/Book29-Collections.md  (hints at the bottom of that file)
