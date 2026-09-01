# Book 30 — StringBuilder

> The book of *"I am building a string piece by piece."*

## 1. What problem does this book solve?

Strings in .NET are **immutable**. Every concatenation allocates a new string and
copies both operands. In a loop that is O(n^2) time and O(n^2) garbage.
StringBuilder is a mutable buffer that appends in amortized O(1).

## 2. Signals

- "Build" / "construct" / "generate" a string
- Concatenation **inside a loop**
- "Repeat" / "append" / "accumulate" characters
- Backtracking that builds a path string (14)
- "Encode" / "serialize" / "format a report"
- "Reverse" or "transform" a string character by character
- Any `+=` on a string where the number of iterations is not tiny

**The tell is literally `+=` inside a `for` or `foreach`.** That is the whole
recognition rule.

## 3. The naive instinct

```csharp
string result = "";
foreach (var word in words)
    result += word + ", ";              // allocates a new string EVERY iteration
```

## 4. Why that is inferior

Each `+=` allocates a string of the current length and copies it. Appending n
pieces copies 1 + 2 + 3 + ... + n characters — **O(n^2)** time and O(n^2) bytes
of garbage.

For 10,000 appends of 10 characters each: roughly 500 million characters copied
and ~1 GB of allocation churn, versus about 100,000 characters and a handful of
buffer resizes with StringBuilder.

This is the single clearest case on the shelf where the naive version is not
"slightly slower" — it is a different complexity class produced by a language
detail rather than an algorithmic one.

## 5. What to recognize

```csharp
var sb = new StringBuilder();
foreach (var word in words)
{
    sb.Append(word);
    sb.Append(", ");
}
var result = sb.ToString();             // one final allocation
```

**Pre-size when you can estimate** — avoids the doubling copies entirely:

```csharp
var sb = new StringBuilder(capacity: expectedLength);
```

**The backtracking idiom** — `Length--` as the undo (14):

```csharp
sb.Append(c);
Backtrack();
sb.Length--;                            // O(1) removal of the last char
```

**But check for a better answer first.** Two cases where StringBuilder is not
the best tool:

```csharp
// Joining a known collection: string.Join beats a manual loop
var result = string.Join(", ", words);      // one pass, exact allocation

// A fixed, small number of concatenations: + is fine and compiles to Concat
var s = first + " " + last;                  // ONE allocation, not three
```

`a + b + c + d` in a single expression compiles to `string.Concat(a,b,c,d)` — one
allocation. The O(n^2) problem is specifically **repeated `+=` across loop
iterations**, not concatenation in general.

## 6. Complexity

| Approach | Time | Allocations |
|---|---|---|
| `+=` in a loop (n appends) | **O(n^2)** | n strings |
| `StringBuilder.Append` | **O(n)** amortized | O(log n) buffer resizes |
| `StringBuilder` pre-sized | O(n) | 1 buffer + 1 final string |
| `string.Join` | O(n) | 1 |
| `string.Concat(a,b,c)` | O(n) | 1 |
| `string.Create` | O(n) | **1**, no intermediate |

`ToString()` is O(n) — call it once, at the end, never inside the loop.

## 7. C# APIs

```csharp
var sb = new StringBuilder();
var sb2 = new StringBuilder(capacity);
var sb3 = new StringBuilder("initial");

sb.Append(value);                  // overloads for char, string, int, object...
sb.Append(span);                   // ReadOnlySpan<char>, no allocation
sb.AppendLine(text);
sb.AppendJoin(", ", items);
sb.AppendFormat("{0:N2}", value);
sb.Insert(0, text);                // O(n) — shifts
sb.Remove(start, length);
sb.Replace("a", "b");
sb.Clear();                        // reuse the buffer
sb.Length = 0;                     // same effect
sb.Length--;                       // drop the last char — the backtracking undo
sb[i];                             // indexed read/write
sb.ToString();  sb.ToString(start, length);
```

`AppendJoin` is underused — it is `string.Join` that writes into the existing
buffer rather than allocating an intermediate string.

## 8. Common mistakes

1. **`+=` in a loop.** The whole point.
2. **`ToString()` inside the loop** — reintroduces O(n^2).
3. **StringBuilder for two or three concatenations** — `+` is clearer and
   allocates once. StringBuilder has its own setup cost.
4. **Not pre-sizing** when the length is predictable.
5. **`Insert(0, ...)` in a loop** — O(n) each, so O(n^2). Append and reverse at
   the end instead.
6. **Using StringBuilder where `string.Join` fits** — `Join` is clearer and
   optimal for "combine this collection with a separator."
7. **Sharing a StringBuilder across threads** — not thread-safe.
8. **Keeping a huge StringBuilder alive** after `ToString()` — the buffer stays
   allocated. `Clear()` for reuse, or let it go.

## 9. Where StringBuilder is the right answer

- Building output in a loop of unknown or large length
- Backtracking path construction (14)
- Encoding/serialization written incrementally
- Building a query, report, or CSV line by line
- Repeated modification of a growing buffer
- Run-length encoding, string compression
- Any recursive tree-to-string serialization (15)

## 10. Where StringBuilder is the wrong choice

- **A fixed, small number of concatenations** — `+` in one expression is one
  `Concat` call.
- **Joining a collection with a separator** → `string.Join`.
- **String interpolation for formatting** — `$"{a} {b}"` is clear and efficient
  (and in .NET 6+ uses an interpolated-string handler that avoids intermediates).
- **You know the exact final length and can write in one pass** →
  `string.Create` is the fastest option, with zero intermediates.
- **You are only *reading* or slicing** → `Span<char>` (31); no building
  involved.
- **The result is written straight to a stream** → write to the
  `TextWriter`/`Stream` directly rather than materializing a string.

## Complexity summary — pick by intent

| Intent | Best tool |
|---|---|
| Combine a collection with a separator | `string.Join` |
| A few known pieces | `+` or interpolation |
| Loop of unknown length | `StringBuilder` |
| Exact known length, one pass | `string.Create` |
| Output goes to a stream/file | write directly to the writer |
| Read/slice only | `ReadOnlySpan<char>` |

---

## Production Lens

The `+=`-in-a-loop bug is common enough that Roslyn analyzers flag it
(CA1841 and friends) — enable them.

Beyond that: for logging, do **not** build strings at all. Structured logging
with message templates (`logger.LogInformation("User {UserId} did {Action}",
id, action)`) defers formatting until the log level is confirmed enabled, so a
disabled debug log costs nothing. Pre-building the string with interpolation
throws away that optimization — this is one of the most common real-world
performance mistakes in .NET services.

For high-throughput formatting, look at `string.Create`,
`IUtf8SpanFormattable`, and writing UTF-8 bytes directly rather than building
UTF-16 strings you immediately encode (31).

**Related:** [[Book24-Strings]], [[Book28-StringApis]],
[[Book31-Span-Memory]], [[Book14-Backtracking]].
