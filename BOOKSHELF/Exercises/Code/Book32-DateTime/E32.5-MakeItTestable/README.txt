Make it testable

This is correct and untestable.

csharp
public bool IsExpired(Subscription sub) => DateTime.UtcNow > sub.ExpiresAt;

- Explain why you cannot write a reliable unit test for the boundary, DST
  behaviour, or "expires in 5 minutes" logic.
- Rewrite it so you can.
- Then: name the .NET 8+ type built for exactly this, and one thing it gives
  you beyond a hand-rolled IClock.


----
Guide: BOOKSHELF/Exercises/Book32-DateTime.md  (hints at the bottom of that file)
