# Exercises — Book 26: Math / Number Theory

**Reach for it when:** the input is a *number*, or an O(n) loop has a closed form.
**The habit that matters most:** ask *"can this overflow?"* before every
multiplication.
**Remember:** C# integer division truncates, and `-7 % 3 == -2`.

---

### E26.1 — Palindrome Number
Determine whether an integer reads the same forwards and backwards. **Do not
convert it to a string.**

- **Constraints:** `-2^31 <= x <= 2^31 - 1`.
- **Target:** O(digits) time, O(1) space.
- **Edge cases:** negatives (always false); `0` (true); numbers ending in `0`
  (only `0` itself is a palindrome); single digits; `int.MaxValue`.
- **Before you code:** reversing the whole number can overflow. What if you only
  reverse **half** of it? State the stopping condition.

### E26.2 — Reverse Integer
Reverse the digits of a signed 32-bit integer. If the result overflows, return 0.

- **Constraints:** you may **not** use 64-bit integers to detect overflow.
- **Edge cases:** `int.MinValue` (negating it overflows); trailing zeroes
  (`120` → `21`); single digit; values that overflow only on the final digit.
- **Before you code:** state the pre-multiplication overflow check. This is the
  same guard as E24.3 (atoi) — if you did that one, you should be able to write it
  from memory.

### E26.3 — Count Primes
Count the primes strictly less than `n`.

- **Constraints:** `n` up to 5·10⁶. A per-number primality test is too slow.
- **Target:** O(n log log n) time, O(n) space.
- **Edge cases:** `n = 0`, `1`, `2` (all → 0); `n = 3` (→ 1).
- **Before you code:** name the algorithm. Then two optimizations: where should the
  inner loop **start**, and where should the outer loop **stop**? Both matter, and
  both have a one-line justification.

### E26.4 — Excel Sheet Column Number
Convert an Excel column title to its number. `"A"` → 1, `"Z"` → 26, `"AA"` → 27,
`"AB"` → 28.

- **Constraints:** up to 7 characters, uppercase.
- **Target:** O(n) time, O(1) space.
- **Edge cases:** `"A"`; `"Z"`; `"AA"`; `"FXSHRXW"` (`int.MaxValue` — watch the
  accumulator); lowercase input if you want to be defensive.
- **Before you code:** this is base-26 with a twist. What is the twist, and why
  does `'A'` mapping to 1 rather than 0 change the arithmetic?
- **Follow-up:** write the inverse (number → title). The off-by-one bites harder
  going backwards — say where.

### E26.5 — Fraction to Recurring Decimal
Given a numerator and denominator, return the fraction as a string. If the
fractional part repeats, wrap the repeating portion in parentheses.

Example: `1/2` → `"0.5"`, `2/3` → `"0.(6)"`, `4/333` → `"0.(012)"`.

- **Constraints:** both fit in 32-bit signed; the denominator may be negative.
- **Edge cases:** **`numerator = int.MinValue`** (negation overflows — use `long`);
  denominator negative; exact division (no decimal point at all); result is
  negative; numerator 0.
- **Before you code:** you are doing long division by hand. What tells you the
  decimal has started repeating, and what do you need to remember to know **where**
  the repeat began? That names the structure.

---
---

# ⛔ STOP — hints below

---

**E26.1**
- *Nudge:* Build the reversed second half and compare it to the remaining first
  half.
- *Skeleton:*
  ```
  if (x < 0 || (x % 10 == 0 && x != 0)) return false;
  int rev = 0;
  while (x > rev) { rev = rev * 10 + x % 10; x /= 10; }
  return x == rev || x == rev / 10;      // even length, or odd (drop middle digit)
  ```
  Stopping when `x > rev` is false means you have consumed exactly half — no
  overflow is possible because `rev` never exceeds the remaining `x`.

**E26.2**
- *Skeleton:*
  ```
  int r = 0;
  while (x != 0) {
      int digit = x % 10; x /= 10;
      if (r > int.MaxValue / 10 || (r == int.MaxValue / 10 && digit > 7)) return 0;
      if (r < int.MinValue / 10 || (r == int.MinValue / 10 && digit < -8)) return 0;
      r = r * 10 + digit;
  }
  return r;
  ```
  C#'s `%` keeps the sign of the dividend, so negatives fall out correctly without
  a separate sign variable — and that avoids the `int.MinValue` negation trap
  entirely.

**E26.3**
- *Algorithm:* Sieve of Eratosthenes.
- *Skeleton:*
  ```
  var composite = new bool[n];
  int count = 0;
  for (int i = 2; i < n; i++) {
      if (composite[i]) continue;
      count++;
      for (long j = (long)i * i; j < n; j += i) composite[j] = true;
  }
  ```
- *Inner loop starts at `i * i`:* every smaller multiple of `i` already has a
  smaller prime factor and was struck out earlier.
- *Outer marking stops at `i * i >= n`:* beyond that, `i * i` is already out of
  range so there is nothing left to strike — though you still count the primes.
- *Watch:* `i * i` overflows `int` for large `n` — use `long` for `j`.

**E26.4**
- *The twist:* it is base 26 but **1-indexed** — there is no digit worth zero. `Z`
  is 26, not 0, so `"AA"` is 1×26 + 1 = 27, not 26.
- *Skeleton:* `foreach (char c in s) result = result * 26 + (c - 'A' + 1);` — use
  `long` if you want to be safe with 7-character inputs.
- *Inverse:* decrement **before** each step —
  `n--; sb.Insert(0, (char)('A' + n % 26)); n /= 26;` — because of the 1-indexing.

**E26.5**
- *Nudge:* A repeat begins when the same **remainder** occurs twice.
- *Structure:* `Dictionary<long remainder, int positionInResult>`.
- *Skeleton:* handle the sign, then integer part, then loop: `remainder *= 10`,
  emit `remainder / denominator`, set `remainder %= denominator`. Before each step,
  if the remainder is already in the dictionary, insert `(` at the recorded
  position and append `)`. Stop when the remainder hits 0.
- *Overflow:* cast both operands to `long` up front — `Math.Abs(int.MinValue)`
  throws, and negating it in `int` does nothing.
