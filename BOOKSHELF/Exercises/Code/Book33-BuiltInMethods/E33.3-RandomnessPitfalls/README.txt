Randomness pitfalls

Each has a real bug. Name it and fix it.

csharp
// A
for (int i = 0; i < 1000; i++) { var r = new Random(); results.Add(r.Next(100)); }

// B — generating a password reset token
var token = new Random().Next(100000, 999999).ToString();

// C — shuffling a deck
cards.Sort((x, y) => Random.Shared.Next(-1, 2));

// D — called from multiple threads
private static readonly Random _rng = new Random();
public int Roll() => _rng.Next(1, 7);


----
Guide: BOOKSHELF/Exercises/Book33-BuiltInMethods.md  (hints at the bottom of that file)
