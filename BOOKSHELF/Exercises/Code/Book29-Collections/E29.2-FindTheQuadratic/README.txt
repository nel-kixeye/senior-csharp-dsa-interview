Find the quadratic

Each snippet is O(n²) or worse. Name why, and fix it.

csharp
// A
var result = new List<int>();
foreach (var x in source) if (!result.Contains(x)) result.Add(x);

// B
while (pending.Count > 0) { var next = pending[0]; pending.RemoveAt(0); Process(next); }

// C
foreach (var item in items) { sorted.Add(item); sorted.Sort(); UseSmallest(sorted[0]); }

// D
for (int i = 0; i < list.Count; i++) if (list[i].IsExpired) list.RemoveAt(i);


----
Guide: BOOKSHELF/Exercises/Book29-Collections.md  (hints at the bottom of that file)
