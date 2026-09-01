# Exercises — Book 24: String Techniques

**Reach for it when:** the problem says "string" — then immediately ask which
*structural* book it really is.
**The word that decides everything:** *substring* (contiguous → window) versus
*subsequence* (gappy → two pointers or DP).
**Bounded alphabet → `int[26]`, not a Dictionary.**

---

### E24.1 — Valid Anagram
Determine whether two strings are anagrams of each other.

- **Constraints:** up to 5·10⁴ characters, lowercase English letters.
- **Target:** O(n) time, **O(1) space**.
- **Edge cases:** different lengths (early exit); empty strings; identical
  strings; same letters but different counts (`"aab"` vs `"abb"`).
- **Before you code:** name the O(1)-time check you should do before touching any
  counts. Then: one array or two?
- **Follow-up:** what changes if the input is arbitrary Unicode rather than `a`–`z`?
- *(Stub exists: `DSA/02-Strings`.)*

### E24.2 — Longest Common Prefix
Return the longest common prefix of an array of strings, or `""` if there is none.

- **Constraints:** up to 200 strings, each up to 200 characters.
- **Target:** O(total characters) time, O(1) space.
- **Edge cases:** empty array; a single string (the whole thing); one empty string
  in the array (result is `""`); no common prefix at all; all identical.
- **Before you code:** two approaches — scan **vertically** (character position
  across all strings) or **horizontally** (fold the prefix pairwise). Which exits
  earlier on a bad case?

### E24.3 — String to Integer (atoi)
Parse a leading integer from a string: skip leading whitespace, accept an optional
sign, read digits until a non-digit, and clamp to `int` range.

- **Constraints:** the string may be arbitrary.
- **Edge cases:** this problem **is** its edge cases — leading/trailing spaces;
  `"+-12"` (invalid, → 0); `"words 123"` (→ 0); `"  -042"` (→ −42);
  `"91283472332"` (clamp to `int.MaxValue`); `"-91283472332"` (clamp to
  `int.MinValue`); empty string; `"+"` alone.
- **Before you code:** how do you detect overflow **before** it happens, without
  using `long`? State the comparison.
- **Production note:** afterwards, say which BCL call you would actually use.

### E24.4 — Longest Palindromic Substring
Return the longest palindromic substring.

- **Constraints:** up to 1000 characters.
- **Target:** O(n²) time, **O(1) space**.
- **Edge cases:** single character; no palindrome longer than 1; the whole string
  is a palindrome; **even-length** palindromes (`"abba"`); all identical
  characters.
- **Before you code:** how many centres does a string of length `n` have? The
  answer is not `n` — and getting it wrong is why even-length palindromes get
  missed.

### E24.5 — Find All Anagrams in a String
Return the start indices of every substring of `s` that is an anagram of `p`.

- **Constraints:** both up to 3·10⁴ lowercase characters.
- **Target:** O(n) time, O(1) space.
- **Edge cases:** `p` longer than `s` (empty result); `p` equals `s`; overlapping
  matches (`s = "abab"`, `p = "ab"` → `[0, 1, 2]`); repeated characters in `p`.
- **Before you code:** two books combine here. What is the window size, and how do
  you compare two 26-slot profiles in O(1) per step rather than O(26)?

---
---

# ⛔ STOP — hints below

---

**E24.1**
- *Pre-check:* `if (s.Length != t.Length) return false;` — O(1), and it makes the
  single-array trick valid.
- *Skeleton:*
  ```
  Span<int> count = stackalloc int[26];
  for (int i = 0; i < s.Length; i++) { count[s[i]-'a']++; count[t[i]-'a']--; }
  foreach (int c in count) if (c != 0) return false;
  return true;
  ```
  One array, one pass, zero allocation.
- *Unicode follow-up:* `int[26]` breaks; use a `Dictionary<char,int>`, or
  `Dictionary<Rune,int>` if you must handle surrogate pairs correctly.

**E24.2**
- *Vertical skeleton:*
  ```
  for (int i = 0; i < strs[0].Length; i++) {
      char c = strs[0][i];
      for (int j = 1; j < strs.Length; j++)
          if (i >= strs[j].Length || strs[j][i] != c) return strs[0][..i];
  }
  return strs[0];
  ```
- *Which exits earlier:* vertical — it stops at the first differing character
  position, so a single short or mismatched string ends it immediately. Horizontal
  folding must process at least two full strings before it can shrink.

**E24.3**
- *Overflow check before it happens:*
  ```
  if (result > int.MaxValue / 10 ||
     (result == int.MaxValue / 10 && digit > int.MaxValue % 10))
      return sign == 1 ? int.MaxValue : int.MinValue;
  result = result * 10 + digit;
  ```
  Test *before* multiplying, not after — after is already undefined.
- *Order of operations:* skip spaces → read at most one sign → read digits →
  stop at the first non-digit. A second sign is not an error, it just ends the
  number (which for `"+-12"` means zero digits were read → 0).
- *Production:* `int.TryParse(s, NumberStyles.Integer, CultureInfo.InvariantCulture, out var v)`.

**E24.4**
- *Centres:* **2n − 1** — `n` single characters (odd-length palindromes) and
  `n − 1` gaps between characters (even-length ones). Missing the gap centres is
  why `"abba"` gets missed.
- *Skeleton:*
  ```
  for (int i = 0; i < n; i++) { Expand(i, i); Expand(i, i + 1); }

  void Expand(int l, int r) {
      while (l >= 0 && r < n && s[l] == s[r]) { l--; r++; }
      // longest here is s[l+1 .. r-1], length r - l - 1
  }
  ```

**E24.5**
- *Books:* Sliding Window (fixed size = `p.Length`) + character counts.
- *Skeleton:* maintain `int[26]` for `p` and for the current window. Rather than
  comparing all 26 slots each step, keep a `matches` counter of how many slots
  currently agree, and adjust it by ±1 whenever a count changes:
  ```
  // when incrementing window[c]:
  if (window[c] == need[c]) matches++;
  else if (window[c] == need[c] + 1) matches--;
  ```
  A match is `matches == 26`. That makes each slide O(1).
