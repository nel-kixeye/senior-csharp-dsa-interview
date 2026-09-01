Parse without allocating

Rewrite this to allocate nothing per field.

csharp
long Total(string line)      // line is like "10,20,30,40,..." with 100,000 fields
{
    long total = 0;
    foreach (var part in line.Split(','))
        total += int.Parse(part);
    return total;
}

- Target: zero allocations.


----
Guide: BOOKSHELF/Exercises/Book31-Span-Memory.md  (hints at the bottom of that file)
