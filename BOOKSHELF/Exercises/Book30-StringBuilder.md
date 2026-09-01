# Exercises — Book 30: StringBuilder

**The recognition rule is literally one line:** `+=` on a string inside a loop.
**But:** StringBuilder is not always the answer — `string.Join`, `string.Create`,
and plain `+` each win in specific cases.

---

### E30.1 — Fix the quadratic concatenation
Rewrite each, and state the complexity before and after. **One of these should
not use StringBuilder** — identify it.

```csharp
// A
string csv = "";
foreach (var name in names) csv += name + ",";

// B
string full = "";
full += firstName; full += " "; full += lastName;

// C
string report = "";
foreach (var row in rows) report += $"{row.Id}\t{row.Name}\n";

// D
string padded = "";
for (int i = 0; i < 40; i++) padded += "-";
```

- **Before you code:** for B, what does the compiler actually emit? The answer
  changes whether it needs fixing at all.

### E30.2 — Run-Length Encoding
Encode a string so `"aaabbc"` becomes `"a3b2c1"`. Then write the decoder.

- **Constraints:** input up to 10⁵ lowercase characters; run lengths may exceed 9.
- **Target:** O(n) time, one pass each way.
- **Edge cases:** empty string; a single character; no repeats at all (output is
  longer than input); runs of 10+ (multi-digit counts); the decoder meeting a
  multi-digit count.
- **Before you code:** pre-size the builder. What is a reasonable capacity guess,
  and why does guessing badly cost more than not guessing?

### E30.3 — Build the backtracking path
Modify a backtracking solution (say, generating all root-to-leaf paths in a tree
as `"1->2->5"` strings) to use a single `StringBuilder` rather than string
concatenation at every node.

- **Before you code:** what is the O(1) "undo" for `sb.Append(text)`? Write it.
  Then: what makes the undo tricky when the appended text has **variable** length?

### E30.4 — Choose the right tool
For each, name what you would use and reject the others with a reason.

1. Joining 50,000 names with `", "`.
2. Building `"Hello, " + name + "!"`.
3. Building a 10 MB XML document element by element.
4. Producing a fixed-format 16-character id where you know the exact length up
   front.
5. Writing a 500 MB CSV export to a file.
6. Formatting a log message that may never be emitted because `Debug` level is
   disabled.

### E30.5 — The logging trap
This is the single most common real-world version of this book's mistake.

```csharp
_logger.LogDebug($"Processing order {order.Id} for customer {customer.Name} with {order.Items.Count} items");
```

- **Explain:** what work happens here when the `Debug` level is **disabled**, and
  why.
- **Rewrite it** correctly.
- **Then:** name the second benefit the correct form gives you that has nothing to
  do with performance.

---
---

# ⛔ STOP — hints below

---

**E30.1**
- **A:** O(n²) → `string.Join(",", names)`. **This is the one that should not use
  StringBuilder** — `Join` is the direct expression of the operation, allocates
  once, and handles the trailing separator for free.
- **B:** already fine. `a + b + c` in a single expression compiles to one
  `string.Concat(a, b, c)` call — one allocation. The quadratic problem is
  specifically repeated `+=` **across loop iterations**. Leave it, or use
  interpolation.
- **C:** O(n²) → `StringBuilder` with `AppendFormat`/interpolated append inside the
  loop, `ToString()` once at the end. Pre-size if you can estimate.
- **D:** O(n²) for no reason → `new string('-', 40)`.

**E30.2**
- *Encoder skeleton:*
  ```
  var sb = new StringBuilder(s.Length);           // encoded is often ~same size
  int i = 0;
  while (i < s.Length) {
      char c = s[i]; int run = 0;
      while (i < s.Length && s[i] == c) { i++; run++; }
      sb.Append(c).Append(run);                    // Append(int) — no ToString() needed
  }
  ```
- *Decoder:* read a char, then accumulate digits with `count = count * 10 + (c - '0')`
  until the next non-digit — that is what handles runs of 10+.
- *Capacity:* guessing too small costs a doubling copy each time it grows
  (O(log n) copies); guessing too large just wastes memory. `s.Length` is a
  reasonable neutral guess.

**E30.3**
- *The undo:* `sb.Length -= text.Length;` — O(1), no allocation. For a single
  character it is just `sb.Length--`.
- *Variable length:* record the length **before** appending and restore it after:
  ```
  int mark = sb.Length;
  sb.Append(node.val).Append("->");
  ... recurse ...
  sb.Length = mark;                                // exact restore, no arithmetic
  ```
  Saving the mark is more robust than subtracting a computed length — especially
  when the appended text is a number whose digit count you would otherwise have to
  recompute.

**E30.4**
1. `string.Join` — one allocation, exact size. StringBuilder works but says less.
2. Interpolation or `+` — one `Concat` call. StringBuilder here is *slower* (its
   own allocation and setup) and noisier.
3. `StringBuilder` — unknown length, many appends. (Better still: an
   `XmlWriter` over a stream, so you never hold 10 MB in memory.)
4. `string.Create(16, state, (span, s) => { ... })` — writes directly into the
   final string's buffer. Zero intermediates.
5. Write straight to a `StreamWriter` — do **not** build a 500 MB string in
   memory first. This is the case where the answer is "no string builder at all".
6. Structured logging with a message template — see E30.5.

**E30.5**
- *What happens:* the interpolated string is built **eagerly**, before
  `LogDebug` is called. So you pay the formatting, the allocation, and the
  `customer.Name` property access even though the message is immediately
  discarded. On a hot path this is pure waste.
- *Correct form:*
  ```
  _logger.LogDebug("Processing order {OrderId} for customer {CustomerName} with {ItemCount} items",
                   order.Id, customer.Name, order.Items.Count);
  ```
  The template and arguments are passed separately; formatting happens only if the
  level is enabled. (.NET 6+ interpolated-string handlers make
  `LogDebug($"...")` lazy too — but the template form is still preferred, for the
  reason below.)
- *The second benefit:* **structured logging**. The arguments are captured as named
  fields, so your log platform can index and query on `OrderId` rather than
  regex-matching a flat string. That is worth more than the performance.
