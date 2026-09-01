# Exercises — Book 28: String / Character APIs

**Different in character.** Rewrite and code-review exercises. The skill is
noticing that you are about to reimplement the BCL — and knowing which overload is
the correct one.

---

### E28.1 — Delete the reinvented wheel
Each of these is a BCL method written by hand. Replace each with the correct call,
and say what edge case the hand-rolled version gets **wrong**.

```csharp
bool IsLetter(char c) => (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
bool IsDigit(char c)  => c >= '0' && c <= '9';
char Lower(char c)    => c >= 'A' && c <= 'Z' ? (char)(c + 32) : c;
bool IsBlank(string s) { if (s == null) return true; foreach (var c in s) if (c != ' ') return false; return true; }
string Repeat(char c, int n) { var sb = new StringBuilder(); for (int i = 0; i < n; i++) sb.Append(c); return sb.ToString(); }
```

- **Before you code:** for the first three, name a specific input where the
  hand-rolled version returns the wrong answer.

### E28.2 — Case-insensitive comparison, done four ways
Three of these are wrong or wasteful. Rank them and explain.

```csharp
a.ToLower() == b.ToLower()
a.ToLowerInvariant() == b.ToLowerInvariant()
string.Equals(a, b, StringComparison.OrdinalIgnoreCase)
a.Equals(b, StringComparison.CurrentCultureIgnoreCase)
```

- **Before you code:** name the locale in which #1 produces a wrong answer for
  ASCII identifiers, and say concretely what happens.
- **Then:** which would you use for a **username** comparison, and which for
  sorting a list of product names shown to a user? They are different answers.

### E28.3 — Parse a CSV line, three ways
Given `" alice , 30 , engineer "`, produce trimmed, non-empty fields.

1. Write the naive version (`Split` then `Select(x => x.Trim())`).
2. Write it using `StringSplitOptions` only — no LINQ.
3. Write an allocation-free version that yields each field as a
   `ReadOnlySpan<char>` (Book 31).

- **Constraints:** the line may have leading/trailing spaces and empty fields.
- **Before you code:** for version 3, why can you not simply `yield return` a
  `ReadOnlySpan<char>`? Name the language restriction and one way around it.

### E28.4 — Count the characters
Write a method returning "how many characters" a string has, for a human
definition of character. Test it against:

```
"hello"        expected 5
"café"         expected 4     (also try the decomposed form: "cafe" + U+0301)
"👍"           expected 1
"👨‍👩‍👧‍👦"    expected 1     (family emoji: multiple code points joined by ZWJ)
```

- **Before you code:** what does `"👍".Length` return, and why? Name the three
  different units .NET can count in, and which one matches human intuition.

### E28.5 — Choose the right tool
For each task, name the API you would reach for and one you would **avoid**:

1. Check whether a file path ends with `.json`, case-insensitively.
2. Extract everything after the first `=` in `key=value=more`.
3. Validate that user input is a well-formed absolute URL.
4. Build a `WHERE id IN (1,2,3)` clause fragment from a list of ints.
5. Determine whether two user-entered names are "the same" despite different
   Unicode encodings of the same accented characters.

---
---

# ⛔ STOP — hints below

---

**E28.1**
- `char.IsLetter(c)` — hand-rolled returns **false** for `'é'`, `'Ω'`, `'漢'`.
- `char.IsDigit(c)` — hand-rolled returns false for non-ASCII digits like `'٣'`
  (Arabic-Indic three). If you *mean* ASCII only, `char.IsAsciiDigit(c)` (.NET 7+)
  says so explicitly and is faster.
- `char.ToLowerInvariant(c)` — the `+32` trick is ASCII-only and silently wrong for
  everything else.
- `string.IsNullOrWhiteSpace(s)` — hand-rolled misses tabs, newlines, and
  non-breaking spaces.
- `new string(c, n)` — one allocation, no StringBuilder.

**E28.2**
- **#3 is best** for identifiers: no allocation, ordinal, intent explicit.
- **#2** is correct but allocates two strings to answer a boolean.
- **#1 is a bug.** In `tr-TR`, `"I".ToLower()` is `"ı"` (dotless), not `"i"` — so
  `"ID" == "id"` becomes false. This reproduces only on Turkish-locale machines,
  which is what makes it vicious.
- **#4** is culture-aware, which is right for *user-facing text* and wrong for
  identifiers.
- *Username:* `OrdinalIgnoreCase`. *Sorting product names for display:*
  culture-aware (`StringComparer.CurrentCulture`), deliberately.

**E28.3**
1. `line.Split(',').Select(x => x.Trim()).Where(x => x.Length > 0)`
2. `line.Split(',', StringSplitOptions.TrimEntries | StringSplitOptions.RemoveEmptyEntries)`
   — one call, no LINQ, fewer allocations.
3. Use `MemoryExtensions.Split` (.NET 8+) into a `Span<Range>`, or walk manually
   with `IndexOf` and slice with `AsSpan`.
- *The restriction:* `Span<T>` is a `ref struct` — it cannot be a field, cannot be
  captured, and cannot cross a `yield return` or `await`. Work around it with a
  `ref struct` enumerator (what `MemoryExtensions` does), or by having the caller
  pass in a `Span<Range>` destination.

**E28.4**
- `"👍".Length` is **2** — `string.Length` counts UTF-16 **code units**, and this
  emoji is a surrogate pair.
- The three units: **code units** (`Length`), **code points / runes**
  (`EnumerateRunes()`), and **grapheme clusters / text elements**
  (`StringInfo.GetTextElementEnumerator`, or `StringInfo(s).LengthInTextElements`).
- Only grapheme clusters match human intuition — the ZWJ family emoji is many code
  points but one grapheme. `"cafe" + U+0301` is 5 code points and 4 graphemes.
- *Also:* to compare `"café"` written both ways, `string.Normalize()` first.

**E28.5**
1. `path.EndsWith(".json", StringComparison.OrdinalIgnoreCase)`. Avoid
   `path.ToLower().EndsWith(".json")` — allocates and is culture-risky.
2. `var i = s.IndexOf('='); var rest = s.AsSpan(i + 1);`. Avoid
   `s.Split('=')[1]` — allocates the whole array and drops `"=more"`.
3. `Uri.TryCreate(input, UriKind.Absolute, out var uri)`. Avoid a hand-written
   regex — URL grammar is far larger than it looks.
4. `string.Join(",", ids)`. Avoid `+=` in a loop. *(Production: use parameters, not
   string concatenation, or you have written SQL injection.)*
5. `a.Normalize(NormalizationForm.FormC) == b.Normalize(NormalizationForm.FormC)`,
   or a culture-aware comparer. Avoid plain `==` — the same visible string can have
   multiple encodings.
