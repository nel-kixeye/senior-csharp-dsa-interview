Delete the reinvented wheel

Replace each with a BCL call. Then, for each, say whether the hand-rolled version
is merely *longer* or actually *wrong* in some case.

csharp
// A
int max = arr[0]; foreach (var x in arr) if (x > max) max = x;

// B
for (int i = 0; i < n / 2; i++) (a[i], a[n-1-i]) = (a[n-1-i], a[i]);

// C
int v2 = value < min ? min : (value > max ? max : value);

// D
for (int i = 0; i < arr.Length; i++) arr[i] = -1;

// E
bool same = a.Length == b.Length;
if (same) for (int i = 0; i < a.Length; i++) if (a[i] != b[i]) { same = false; break; }

// F
var batches = new List<List<int>>();
for (int i = 0; i < items.Count; i += 100) batches.Add(items.GetRange(i, Math.Min(100, items.Count - i)));

// G
int q = a / b; int r = a - q * b;

// H
var shuffled = items.OrderBy(_ => Guid.NewGuid()).ToList();


----
Guide: BOOKSHELF/Exercises/Book33-BuiltInMethods.md  (hints at the bottom of that file)
