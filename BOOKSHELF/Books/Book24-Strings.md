# Book 24 — String Techniques

> The book of *"a string is an array of characters with extra traps."*

## 1. What problem does this book solve?

String problems are rarely about strings. They are Book 01, 02, 09, 10, or 23
wearing a costume. This book is about **stripping the costume** — recognizing
which structural pattern a string problem actually is — plus the C#-specific
hazards that make string code wrong in ways array code is not.

## 2. Signals and the book they map to

| Signal in a string problem | Actual book |
|---|---|
| "Anagram" / "same letters" / "permutation of" | Dictionary or `int[26]` (02) |
| "Character frequency" / "count of each letter" | Dictionary / `int[26]` (02) |
| "First unique / non-repeating character" | Dictionary (02) |
| "Contains duplicate characters" | HashSet (01) |
| "**Substring**" (contiguous) with a condition | Sliding Window (10) |
| "Longest substring without repeating" | Sliding Window + Dictionary (10) |
| "**Subsequence**" (non-contiguous) | Two Pointers or DP (09, 19) |
| "Palindrome" | Two Pointers (09), or expand-around-center |
| "Reverse" | Two Pointers (09) |
| "Valid parentheses / nesting" | Stack (04) |
| "Edit distance / longest common subsequence" | DP (19) |
| "Prefix" / "autocomplete" / "starts with" | Trie (15) |
| "Group anagrams" | Sorting + Dictionary (21, 02) |
| "Build a result character by character" | StringBuilder (30) |
| "Parse / tokenize / split" | String APIs (28) |

**The single most important distinction on this table:** *substring* means
contiguous — think sliding window. *Subsequence* means order-preserving but
gappy — think two pointers or DP. Misreading that one word sends you down the
wrong path entirely.

## 3. The naive instinct

```csharp
// "Is t an anagram of s?"
foreach (char c in s)
    if (s.Count(x => x == c) != t.Count(x => x == c)) return false;   // O(n^2)

// Building a result
string result = "";
foreach (var part in parts) result += part;      // O(n^2) — every += copies (30)

// Repeated substring extraction
for (int i = 0; i < s.Length; i++)
    for (int j = i; j < s.Length; j++)
        Check(s.Substring(i, j - i + 1));        // O(n^3) with allocation per call
```

## 4. Why that is inferior

Strings in .NET are **immutable**. Every `+=`, every `Substring`, every `Replace`
allocates a new string and copies. What looks like a cheap operation in a loop is
an O(n) copy, and the loop makes it O(n^2) in both time and garbage.

The counting version of the anagram check is one pass. The `int[26]` version
avoids hashing entirely.

## 5. What to recognize

**Fixed alphabet → array, not Dictionary.** This is the highest-value string
habit:

```csharp
// Anagram check, lowercase ASCII
if (s.Length != t.Length) return false;
Span<int> count = stackalloc int[26];
for (int i = 0; i < s.Length; i++)
{
    count[s[i] - 'a']++;
    count[t[i] - 'a']--;             // one pass, both strings
}
foreach (int c in count) if (c != 0) return false;
return true;
```

O(n) time, **zero allocation**, and clearer than the dictionary version once you
have seen it twice.

**Palindrome — two pointers, no allocation:**

```csharp
static bool IsPalindrome(ReadOnlySpan<char> s)
{
    int i = 0, j = s.Length - 1;
    while (i < j)
    {
        while (i < j && !char.IsLetterOrDigit(s[i])) i++;      // skip non-alnum
        while (i < j && !char.IsLetterOrDigit(s[j])) j--;
        if (char.ToLowerInvariant(s[i]) != char.ToLowerInvariant(s[j])) return false;
        i++; j--;
    }
    return true;
}
```

**Expand around center** — for "longest palindromic substring," O(n^2) time and
O(1) space, and far easier to get right than the DP version:

```csharp
for (int center = 0; center < n; center++)
{
    Expand(center, center);       // odd length
    Expand(center, center + 1);   // even length
}
```

**Canonical form as a grouping key** (02, 21):

```csharp
// Group anagrams: sorted characters, or a 26-count signature
string Key(string w) { var a = w.ToCharArray(); Array.Sort(a); return new string(a); }
```

## 6. Complexity

| Operation | Cost |
|---|---|
| `s[i]` | O(1) |
| `s.Length` | O(1) |
| `s.Substring(i, len)` | **O(len)** — allocates |
| `s + t` | **O(n + m)** — allocates |
| `s.Contains` / `IndexOf` | O(n * m) naive, optimized in practice |
| `s.Split` | O(n), allocates an array plus each part |
| `s.Replace` | O(n), allocates |
| `s.ToLower()` | O(n), allocates |
| `sb.Append` | amortized O(1) (30) |
| `s.AsSpan(i, len)` | **O(1)**, no allocation (31) |

That last row is the senior habit: when you need to *look at* a slice rather than
keep it, `AsSpan` is free where `Substring` is not.

## 7. C# specifics

```csharp
// Fixed alphabet indexing
int idx = c - 'a';                       // 0..25

// Character classification — do not hand-roll these (28)
char.IsLetter(c); char.IsDigit(c); char.IsLetterOrDigit(c);
char.IsWhiteSpace(c); char.IsUpper(c);
char.ToLowerInvariant(c);                // NOT ToLower() — culture bugs

// Comparison — be explicit
s.Equals(t, StringComparison.OrdinalIgnoreCase);
string.Equals(s, t, StringComparison.Ordinal);

// Slicing without allocating (31)
ReadOnlySpan<char> window = s.AsSpan(start, length);

// Building (30)
var sb = new StringBuilder();
sb.Append(c); sb.Append(str); sb.ToString();

// Reversal
var arr = s.ToCharArray(); Array.Reverse(arr); var rev = new string(arr);
```

**`ToLowerInvariant`, not `ToLower`.** The Turkish dotless-i problem: in `tr-TR`,
`"I".ToLower()` is `"ı"`, not `"i"`. This breaks case-insensitive comparison of
identifiers in ways that only reproduce on machines with that locale. Always
`InvariantCulture` or `Ordinal` for non-linguistic comparison.

## 8. Common mistakes

1. **`+=` in a loop.** O(n^2). Use StringBuilder (30).
2. **`Substring` in a loop** when `AsSpan` would do (31).
3. **Culture-sensitive comparison by accident** — `ToLower()`, or
   `String.Compare` without a `StringComparison`.
4. **Assuming one `char` equals one character.** `char` is a UTF-16 code unit.
   Emoji and many CJK characters are **surrogate pairs** — two chars. `"👍".Length`
   is 2. Use `StringInfo` or `Rune` for real text (28).
5. **Dictionary where `int[26]` suffices.**
6. **Not checking lengths first** in anagram problems — an O(1) early exit.
7. **`s[i] - 'a'` on input that may be uppercase or non-letter** — out of range.
8. **Confusing substring and subsequence.**
9. **`Split` allocating heavily in a hot loop** — consider
   `ReadOnlySpan<char>.Split` (.NET 8+) or manual `IndexOf` scanning.

## 9. Correct-book problems

- Valid Anagram; Group Anagrams; Find All Anagrams in a String
- Longest Substring Without Repeating Characters (10)
- Longest Palindromic Substring — expand around center
- Valid Palindrome I / II
- First Unique Character in a String
- Ransom Note; Isomorphic Strings; Word Pattern
- Longest Common Prefix — vertical scan
- String to Integer (atoi) — a parsing exercise in edge cases
- Reverse Words in a String
- Minimum Window Substring (10)
- Implement strStr() / KMP
- Encode and Decode Strings — length-prefixing
- Palindrome Partitioning (14); Edit Distance (19)

## 10. Where "string thinking" leads you wrong

- **Treating it as a string problem when it is a counting problem** →
  Dictionary or `int[26]` (02).
- **Substring extraction for comparison** — compare in place with indices or
  spans; do not allocate.
- **Regex for simple parsing** — `Split`, `IndexOf`, or a manual scan is faster
  and clearer for fixed formats. Regex earns its place for genuine patterns.
- **Sorting characters when counting suffices** — O(n log n) versus O(n).
- **Character-by-character DP when two pointers works** — palindromes especially.
- **Ignoring Unicode** when the input is real user text rather than `a`–`z`.

---

## Production Lens

Three production habits that interviews never test and reviewers always want:

**Be explicit about `StringComparison` on every comparison.** Ordinal for
identifiers, keys, protocol tokens, and file paths. OrdinalIgnoreCase for
case-insensitive matching of the same. Culture-aware only for sorting text a
human will read.

**Assume Unicode.** `char`-based logic is fine for ASCII protocol parsing and
wrong for names, addresses, and anything user-authored. `Rune` and `StringInfo`
exist for this.

**Avoid allocation in hot paths.** `AsSpan`, `string.Create`, and
`ArrayPool<char>` (31). A parsing loop that allocates a `Substring` per token
will dominate a profile.

**Related:** [[Book02-Dictionary]], [[Book10-SlidingWindow]],
[[Book09-TwoPointers]], [[Book28-StringApis]], [[Book30-StringBuilder]],
[[Book31-Span-Memory]].
