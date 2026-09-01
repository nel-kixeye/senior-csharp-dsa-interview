# Exercises — Book 25: Bit Manipulation

**Reach for it when:** XOR cancellation, flags, bitmask subsets, or an O(1)-space
constraint on a counting problem.
**Parenthesize everything** — `&` and `|` bind looser than `==`.
**`n & (n-1)`** clears the lowest set bit. That one identity powers half this book.

---

### E25.1 — Single Number
Every element appears twice except one. Find it.

- **Constraints:** up to 3·10⁴ elements. **O(n) time, O(1) space required.**
- **Target:** O(n) time, O(1) space.
- **Edge cases:** single-element array; negative values; the loner is first or
  last.
- **Before you code:** a `HashSet` solves this and fails the constraint. State the
  three XOR properties that make the one-liner work.
- *(Stub exists: `DSA/01-Arrays` — check your question list.)*

### E25.2 — Number of 1 Bits (Hamming Weight)
Return the number of set bits in an unsigned 32-bit integer.

- **Constraints:** input is a 32-bit unsigned value.
- **Target:** O(set bits), not O(32).
- **Edge cases:** `0` (→ 0); `uint.MaxValue` (→ 32); a single high bit
  (`1u << 31`).
- **Before you code:** the naive loop shifts 32 times regardless of input. Which
  identity lets you loop only once per **set** bit? Then name the BCL method that
  makes this a single CPU instruction.

### E25.3 — Counting Bits
For every `i` from `0` to `n`, return the number of set bits in `i`.

- **Constraints:** `n` up to 10⁵.
- **Target:** **O(n)** total — not O(n log n).
- **Edge cases:** `n = 0` (→ `[0]`); `n = 1`; powers of two.
- **Before you code:** this is a DP problem wearing bit clothing. Express
  `popcount(i)` in terms of an **already computed** smaller value. Two different
  recurrences work — find at least one.

### E25.4 — Reverse Bits
Reverse the bits of a 32-bit unsigned integer.

- **Constraints:** exactly 32 bits.
- **Target:** O(32) time, O(1) space.
- **Edge cases:** `0`; `uint.MaxValue`; a value with a single low bit (becomes a
  single high bit); a palindromic bit pattern.
- **Before you code:** you are building the result while consuming the input. State
  what happens to each on every iteration — one shifts left, the other shifts
  right. Which is which?

### E25.5 — Sum of Two Integers
Return `a + b` **without** using `+` or `-`.

- **Constraints:** values fit in 32-bit signed.
- **Edge cases:** one or both negative; zero; values whose sum overflows into the
  sign bit; `a = 0` or `b = 0`.
- **Before you code:** binary addition has two parts — the sum ignoring carries,
  and the carries themselves. Which bitwise operator produces each? Then: how do
  you combine them repeatedly, and when do you stop?
- **In C#:** you will need `unchecked` and probably `uint` for the carry shift.

---
---

# ⛔ STOP — hints below

---

**E25.1**
- *Properties:* `a ^ a == 0`, `a ^ 0 == a`, and XOR is commutative and
  associative — so every pair cancels regardless of order and the loner survives.
- *Skeleton:* `int r = 0; foreach (int n in nums) r ^= n; return r;`

**E25.2**
- *Identity:* `n & (n - 1)` clears the lowest set bit.
- *Skeleton:* `int c = 0; while (n != 0) { n &= n - 1; c++; } return c;` — this is
  Brian Kernighan's method, O(set bits).
- *BCL:* `BitOperations.PopCount(n)` — one instruction. Write the loop to show you
  understand it, then name the BCL call.

**E25.3**
- *Recurrence A (halving):* `dp[i] = dp[i >> 1] + (i & 1)` — `i >> 1` is always
  smaller, so it is already computed.
- *Recurrence B (lowest bit):* `dp[i] = dp[i & (i - 1)] + 1` — clearing one bit
  gives a smaller number with exactly one fewer set bit.
- Either is O(1) per entry, O(n) overall.

**E25.4**
- *Skeleton:*
  ```
  uint result = 0;
  for (int i = 0; i < 32; i++) {
      result = (result << 1) | (n & 1);      // result shifts LEFT, taking n's low bit
      n >>= 1;                                // n shifts RIGHT
  }
  return result;
  ```
  The result makes room on the left for each bit peeled off the right of the input.

**E25.5**
- *The two parts:* `a ^ b` is the sum with carries ignored; `(a & b) << 1` is the
  carries, shifted into position.
- *Skeleton:*
  ```
  unchecked {
      while (b != 0) {
          int carry = (int)((uint)(a & b) << 1);
          a = a ^ b;
          b = carry;
      }
      return a;
  }
  ```
  Repeat until there are no carries left. The `uint` cast avoids an arithmetic
  shift on a negative value, and `unchecked` keeps overflow from throwing if the
  project enables checked arithmetic.
