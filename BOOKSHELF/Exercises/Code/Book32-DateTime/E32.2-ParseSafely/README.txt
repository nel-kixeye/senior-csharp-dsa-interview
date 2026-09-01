Parse safely

This receives dates from a partner API in the fixed format 2026-09-01T14:30:00Z.

csharp
var when = DateTime.Parse(payload.Timestamp);

- Name three separate problems with this line.
- Rewrite it correctly.
- Then: the same partner also sends user-entered dates in a dd/MM/yyyy field.
  What changes, and what must you *not* do?


----
Guide: BOOKSHELF/Exercises/Book32-DateTime.md  (hints at the bottom of that file)
