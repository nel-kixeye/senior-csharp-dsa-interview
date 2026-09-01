# Book 28 — C# String and Character APIs

> The book of *"stop reinventing what the BCL already does."*

## 1. What problem does this book solve?

Knowing what already exists. Most hand-written character-classification and
string-manipulation code in interviews is reimplementing a BCL method — usually
more slowly and with more edge cases missed.

## 2. Signals

- You are about to write `if (c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z')`
- You are about to hand-roll trimming, splitting, padding, or case conversion
- "Parse" / "convert" / "validate" a string
- "Ignore case" / "ignore punctuation" / "normalize"
- "Starts with" / "ends with" / "contains"
- "Format" / "join" / "interpolate"
- Any manual loop over characters doing something that sounds like a verb the
  BCL would have

**The trigger:** *before writing 10 lines over characters, ask whether `char.*`
or `string.*` already has it.*

## 3. The naive instinct

```csharp
bool IsLetter(char c) => (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
bool IsDigit(char c) => c >= '0' && c <= '9';
char ToLower(char c) => c >= 'A' && c <= 'Z' ? (char)(c + 32) : c;

string Trim(string s) { int i = 0; while (i < s.Length && s[i] == ' ') i++; ... }
```

## 4. Why that is inferior

All four already exist, are correct for Unicode rather than just ASCII, and are
faster. The hand-rolled `IsLetter` returns false for `é`, `Ω`, and every
non-Latin script — which is fine for a LeetCode problem and a defect in
production.

Writing them by hand also spends interview time on solved problems instead of on
the actual algorithm.

## 5. What to recognize — the `char` API

```csharp
char.IsLetter(c)            char.IsDigit(c)          char.IsLetterOrDigit(c)
char.IsWhiteSpace(c)        char.IsUpper(c)          char.IsLower(c)
char.IsPunctuation(c)       char.IsSymbol(c)         char.IsControl(c)
char.IsAsciiLetter(c)       char.IsAsciiDigit(c)     // .NET 7+, ordinal-only, fast
char.IsAsciiLetterOrDigit(c)

char.ToLowerInvariant(c)    char.ToUpperInvariant(c)
char.GetNumericValue(c)     // '7' -> 7.0, and handles other numeral systems
```

`char.IsAsciiDigit` (.NET 7+) is the right choice when you specifically mean
ASCII — it is faster than `IsDigit` and it *documents* that you mean ASCII
rather than accidentally accepting Devanagari digits.

Digit-to-int: `c - '0'` is the idiom; it is fine and clear.

## 6. What to recognize — the `string` API

```csharp
// Search
s.Contains(t);  s.Contains(t, StringComparison.OrdinalIgnoreCase);
s.IndexOf(t);   s.LastIndexOf(t);   s.IndexOfAny(new[] { 'a', 'b' });
s.StartsWith(t, StringComparison.Ordinal);  s.EndsWith(t);

// Slice / modify (all allocate)
s.Substring(start, length);   s[2..5];   s[^3..];
s.Trim();  s.TrimStart();  s.TrimEnd();  s.Trim('x');
s.Replace("a", "b");   s.Remove(i, len);   s.Insert(i, t);
s.PadLeft(10, '0');  s.PadRight(10);
s.ToUpperInvariant();  s.ToLowerInvariant();

// Split / join
s.Split(',');
s.Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);
s.Split(new[] { ", " }, StringSplitOptions.None);
string.Join(", ", items);
string.Concat(a, b, c);

// Test
string.IsNullOrEmpty(s);        string.IsNullOrWhiteSpace(s);
string.Equals(a, b, StringComparison.OrdinalIgnoreCase);
string.Compare(a, b, StringComparison.Ordinal);

// Construct
new string('x', 5);                     // "xxxxx"
new string(charArray);
string.Create(length, state, (span, st) => { ... });   // zero-copy construction
s.ToCharArray();

// Format
$"{value:N2}";  value.ToString("X");  string.Format(...);
```

`StringSplitOptions.TrimEntries` (.NET 5+) removes the `.Split(...).Select(x =>
x.Trim())` chain people write constantly.

## 7. Complexity

| Operation | Cost | Allocates |
|---|---|---|
| `s[i]`, `s.Length` | O(1) | no |
| `Substring` | O(len) | **yes** |
| `s + t` | O(n + m) | **yes** |
| `Split` | O(n) | **yes** — array + each part |
| `Replace`, `Trim`, `ToUpper` | O(n) | **yes** (Trim may return `this`) |
| `IndexOf` / `Contains` | O(n * m) worst, vectorized in practice | no |
| `AsSpan(i, len)` | **O(1)** | **no** (31) |
| `string.Join` | O(total) | yes |

Every mutation allocates, because strings are immutable. That is the fact behind
Books 30 and 31.

## 8. Common mistakes

1. **`ToLower()` instead of `ToLowerInvariant()`.** The Turkish-I problem:
   in `tr-TR`, `"I".ToLower()` yields `"ı"`, breaking identifier comparison.
2. **Comparison without an explicit `StringComparison`.** Different overloads
   default differently — `string.Equals(a,b)` is ordinal, but
   `string.Compare(a,b)` is culture-sensitive. Be explicit every time.
3. **Case-insensitive comparison via `ToLower()` on both sides** — allocates two
   strings to answer a boolean. Use
   `string.Equals(a, b, StringComparison.OrdinalIgnoreCase)`.
4. **Assuming `char` equals "character."** Surrogate pairs: `"👍".Length == 2`.
   Combining marks make it worse. Use `StringInfo.GetTextElementEnumerator` or
   `EnumerateRunes()` for real text.
5. **`Substring` in a loop** — use `AsSpan` (31).
6. **`Split` in a hot path** — allocates per call.
7. **Forgetting that `Trim()` returns a new string** and does not mutate.
8. **`IndexOf(string)` being culture-sensitive by default** on some overloads —
   pass `StringComparison.Ordinal` when you mean byte-ish comparison.
9. **Null handling** — `string.IsNullOrWhiteSpace` exists; use it rather than
   `s == null || s.Trim() == ""`.

## 9. Where these APIs are the right answer

- Any character classification → `char.Is*`
- Case-insensitive matching → `StringComparison.OrdinalIgnoreCase`
- Tokenizing simple formats → `Split` with options
- Building a delimited output → `string.Join`
- Fixed-width formatting → `PadLeft` / `PadRight`
- Validating input presence → `IsNullOrWhiteSpace`
- Converting numbers → `int.TryParse`, `ToString(format)`
- Constructing repeated characters → `new string(c, n)`

## 10. Where reaching for a string API is the wrong move

- **Regex for a fixed-delimiter format** — `Split` or `IndexOf` is faster and
  clearer. Regex earns its place for genuine patterns, not for splitting on
  commas.
- **`Split` when you only need the first field** — `IndexOf` plus one slice
  avoids allocating the whole array.
- **`Substring` when you only need to inspect** — `AsSpan` (31).
- **String building in a loop** — StringBuilder (30).
- **`ToCharArray()` just to iterate** — you can index a string directly.
- **Culture-aware APIs for machine data** — ordinal is what you want for IDs,
  paths, and protocol tokens.
- **String manipulation where a parse is the real intent** — `int.TryParse`,
  `DateTime.TryParseExact`, `Uri.TryCreate` (26, 32).

---

## Production Lens

Three rules that prevent most real string bugs:

**Always pass `StringComparison` explicitly.** There is a Roslyn analyzer
(CA1307/CA1310) for this; enable it. The default varies by overload, and
culture-sensitive comparison of machine data produces bugs that reproduce only
on certain machines.

**Ordinal for machine data, culture for humans.** File paths, keys, URLs, enum
names, protocol tokens: `Ordinal`. Names and text a person sorts or searches:
culture-aware, deliberately.

**Normalize before comparing user text.** `string.Normalize(NormalizationForm.FormC)`
— the same visible string can have multiple Unicode encodings, and they are not
`==`.

For validation, prefer the framework's parsers (`Uri.TryCreate`,
`MailAddress`, `int.TryParse`) over hand-written character loops. They have
already met the edge cases you have not thought of.

**Related:** [[Book24-Strings]], [[Book30-StringBuilder]],
[[Book31-Span-Memory]], [[Book33-BuiltInMethods]], [[Book26-Math]].
