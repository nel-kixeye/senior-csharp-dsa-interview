Parse a CSV line, three ways

Given " alice , 30 , engineer ", produce trimmed, non-empty fields.

1. Write the naive version (Split then Select(x => x.Trim())).
2. Write it using StringSplitOptions only — no LINQ.
3. Write an allocation-free version that yields each field as a
   ReadOnlySpan<char> (Book 31).

- Constraints: the line may have leading/trailing spaces and empty fields.


----
Guide: BOOKSHELF/Exercises/Book28-StringApis.md  (hints at the bottom of that file)
