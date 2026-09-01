# Book 25 — Bit Manipulation

> The book of *"state as bits."*

Kept practical. The goal is recognizing the handful of situations where bits are
genuinely the right tool — not becoming a bit-twiddling specialist.

## 1. What problem does this book solve?

Representing and manipulating **sets of binary states** compactly, and
exploiting arithmetic identities (especially XOR) that collapse a counting
problem into a single pass with O(1) space.

## 2. Signals

- "Appears once / twice / an odd number of times" → **XOR**
- "Find the missing / duplicate number" → XOR or sum (26)
- "Power of two / four"
- "Count the set bits" / "Hamming weight" / "Hamming distance"
- "Subsets" with n ≤ 20 → **bitmask enumeration** (14)
- "Flags" / "permissions" / "options" / "toggle"
- "Without using arithmetic operators"
- "Constant extra space" on a problem that seems to need a set
- Bitmask DP: "visited set of at most 20 items" (19)
- "Swap without a temporary" (a party trick, but it appears)

**The strongest single tell:** *"every element appears twice except one"* — that
is XOR, and the solution is one line.

## 3. The naive instinct

```csharp
// "Every element appears twice except one — find it"
var counts = new Dictionary<int, int>();
foreach (var n in nums) counts[n] = counts.GetValueOrDefault(n) + 1;
return counts.First(kv => kv.Value == 1).Key;        // O(n) time, O(n) SPACE
```

## 4. Why that is inferior

It is correct, and it uses O(n) memory to solve a problem with an O(1) answer:

```csharp
int result = 0;
foreach (var n in nums) result ^= n;                  // O(n) time, O(1) space
return result;
```

XOR's properties do the work: `a ^ a == 0`, `a ^ 0 == a`, and it is commutative
and associative — so every pair cancels regardless of order, and the loner
survives.

Recognizing that a *counting* problem is really an *algebraic* one is the skill
this book trains.

## 5. What to recognize

**The XOR identities:**

```
a ^ a = 0          a ^ 0 = a          a ^ b ^ a = b
```

**The operations worth knowing cold:**

```csharp
n & 1              // odd? (faster and clearer than n % 2 for unsigned intent)
n >> 1             // divide by 2
n << 1             // multiply by 2
n & (n - 1)        // clear the lowest set bit
n & -n             // isolate the lowest set bit
(n & (n - 1)) == 0 // power of two (for n > 0)

// Flags
mask |= (1 << i);          // set bit i
mask &= ~(1 << i);         // clear bit i
mask ^= (1 << i);          // toggle bit i
bool on = (mask & (1 << i)) != 0;   // test bit i
```

`n & (n - 1)` is the one to internalize. It clears the lowest set bit, which
gives you both the power-of-two test and Brian Kernighan's popcount (loop while
n != 0, clearing one bit per iteration — O(number of set bits), not O(32)).

**Subset enumeration via bitmask** — the cleanest way to generate all subsets
when n ≤ 20 (compare 14):

```csharp
for (int mask = 0; mask < (1 << n); mask++)
{
    var subset = new List<int>();
    for (int i = 0; i < n; i++)
        if ((mask & (1 << i)) != 0) subset.Add(nums[i]);
    ...
}
```

**Missing number** — XOR all indices with all values; pairs cancel and the
missing index survives:

```csharp
int missing = nums.Length;
for (int i = 0; i < nums.Length; i++) missing ^= i ^ nums[i];
```

## 6. Complexity

| Operation | Cost |
|---|---|
| Any single bit operation | O(1) |
| `BitOperations.PopCount` | O(1) — a CPU instruction |
| Kernighan popcount loop | O(set bits) |
| Naive bit-by-bit count | O(32) or O(64) |
| Subset enumeration | O(2^n * n) |
| Bitmask DP | O(2^n * n) states |

The appeal is **O(1) space** where the obvious solution needs O(n).

## 7. C# specifics

```csharp
using System.Numerics;

BitOperations.PopCount((uint)n);            // set-bit count, single instruction
BitOperations.LeadingZeroCount((uint)n);
BitOperations.TrailingZeroCount((uint)n);
BitOperations.IsPow2(n);
BitOperations.RoundUpToPowerOf2((uint)n);
BitOperations.Log2((uint)n);

Convert.ToString(n, 2);                      // binary string, for debugging
Convert.ToInt32("1011", 2);

// Enum flags — the production form of bitmasks
[Flags]
public enum Permissions { None = 0, Read = 1, Write = 2, Execute = 4, All = 7 }
var p = Permissions.Read | Permissions.Write;
bool canWrite = p.HasFlag(Permissions.Write);      // or (p & Write) != 0, faster
```

**Use `BitOperations`** rather than hand-rolling popcount — it compiles to a
single hardware instruction. Hand-rolling it in an interview is fine to
demonstrate understanding; naming `BitOperations.PopCount` afterwards
demonstrates something better.

**Shift traps:** `>>` on a **signed** negative int is an arithmetic shift (sign
bits fill in), so `-8 >> 1 == -4`. Use `>>>` (.NET 7+) or cast to `uint` for a
logical shift. Shift counts are taken mod 32 for `int` — `1 << 32` is `1`, not
0, which is a genuinely surprising bug.

## 8. Common mistakes

1. **Operator precedence.** `&` and `|` bind *looser* than `==`. `if (mask & 1
   == 1)` does not compile in C#, and the parenthesized form `((mask & 1) == 1)`
   is what you meant. Parenthesize always.
2. **Signed right shift on negatives.** Use `uint` or `>>>`.
3. **`1 << 31`** overflows `int` into negative. Use `1u << 31` or `1L << 31`.
4. **Shift count ≥ bit width** wraps mod 32/64.
5. **`int.MinValue`** has no positive counterpart: `Math.Abs(int.MinValue)`
   throws, and `-int.MinValue == int.MinValue`.
6. **Bit tricks where clarity matters more.** `n % 2 == 0` reads better than
   `(n & 1) == 0` for most readers, and the compiler emits the same code.
7. **Forgetting `[Flags]`** on an enum used as a bitmask — `ToString()` and
   `HasFlag` misbehave.
8. **Bitmask DP beyond n ≈ 22** — 2^22 is four million states; 2^30 is not
   happening.

## 9. Correct-book problems

- Single Number — the archetype
- Single Number II (appears three times except one) / III (two loners)
- Missing Number
- Number of 1 Bits; Counting Bits (`dp[i] = dp[i >> 1] + (i & 1)`)
- Power of Two / Four
- Reverse Bits
- Hamming Distance; Total Hamming Distance
- Sum of Two Integers (without `+`)
- Subsets (bitmask enumeration)
- Maximum XOR of Two Numbers (with a bit trie)
- Bitwise AND of Numbers Range
- Travelling Salesman / assignment problems via bitmask DP (19)

## 10. Where bit manipulation looks right but is wrong

- **Clarity matters more than the trick.** Most production code should say
  `n % 2 == 0`. Bit tricks that need a comment explaining them are usually the
  wrong choice.
- **n > ~22 for bitmask enumeration** — 2^n stops being tractable.
- **The state is not binary** — three or more states per item do not fit one bit
  cleanly (base-3 masks exist and are almost always the wrong idea).
- **Floating point** — bit tricks on `double` are platform reasoning you do not
  want.
- **A HashSet is clearer and space is not constrained** — take the HashSet (01).
- **Arithmetic is clearer** — missing number by sum formula `n(n+1)/2 - actual`
  is more readable than XOR, though it can overflow (26).

---

## Production Lens

The legitimate production uses are narrower than interviews suggest:
`[Flags]` enums for options and permissions, feature-flag bitsets, compact
serialization formats, and hardware or protocol interop where the wire format
is defined in bits.

For large bitsets, `System.Collections.BitArray` or `BitVector32` beat manual
`long[]` juggling. For popcount and friends, `BitOperations`. For SIMD-width
work, `Vector<T>` (31).

The rule: bit manipulation is justified when the *domain* is bits (protocols,
flags, hardware) or when you have profiled and it matters. Cleverness for its
own sake is a maintenance cost.

**Related:** [[Book26-Math]], [[Book14-Backtracking]],
[[Book19-DynamicProgramming]], [[Book01-HashSet]].
