# Book 26 — Math / Number Theory

> The book of *"there may be a formula."*

## 1. What problem does this book solve?

Replacing iteration with arithmetic. Sometimes an O(n) loop has an O(1)
closed form; sometimes an O(n) primality check has an O(sqrt n) one. This book
is also where C#'s integer arithmetic traps live, which matter more in
production than any formula here.

## 2. Signals

- "Sum of 1 to n" / "sum of the first n ..." → closed form
- "Missing number in 1..n" → sum formula or XOR (25)
- "Prime" / "factor" / "divisor"
- "GCD" / "LCM" / "reduce a fraction" / "simplify a ratio"
- "Divisible by" / "modulo" / "remainder"
- "Digits of a number" / "reverse an integer" / "digit sum"
- "Answer modulo 10^9 + 7" — a strong hint that results overflow
- "Count the ways" with a combinatorial shape → C(n, k)
- "Power" / "exponentiation" → fast exponentiation, O(log n)
- "Overflow" mentioned anywhere in the constraints
- Very large n where an O(n) loop is impossible

**The tell:** the input is a *number* rather than a collection, or the answer
depends on n's numeric properties rather than its contents.

## 3. The naive instinct

```csharp
// Sum 1..n
int sum = 0;
for (int i = 1; i <= n; i++) sum += i;              // O(n)

// Is n prime?
for (int i = 2; i < n; i++)
    if (n % i == 0) return false;                    // O(n)

// x^n
long r = 1;
for (int i = 0; i < n; i++) r *= x;                  // O(n), and it overflows
```

## 4. Why that is inferior

```csharp
long sum = (long)n * (n + 1) / 2;                    // O(1)
```

For primality, a divisor larger than sqrt(n) implies a matching one below it —
so checking to sqrt(n) is sufficient: **O(sqrt n)**.

For exponentiation, squaring halves the exponent each step: **O(log n)**.

These are not micro-optimizations. With n = 10^9, O(n) does not finish and O(1)
or O(log n) is instant.

## 5. What to recognize

**Formulas worth knowing cold:**

```csharp
sum 1..n            = n * (n + 1) / 2
sum of squares      = n * (n + 1) * (2n + 1) / 6
arithmetic series   = count * (first + last) / 2
count of multiples of k in 1..n = n / k
C(n, k)             = n! / (k! * (n - k)!)
```

**GCD / LCM** — Euclid, and the LCM identity:

```csharp
static long Gcd(long a, long b) { while (b != 0) (a, b) = (b, a % b); return a; }
static long Lcm(long a, long b) => a / Gcd(a, b) * b;   // divide FIRST: avoids overflow
```

The `a / Gcd(a,b) * b` ordering is deliberate — `a * b` can overflow before the
division happens.

**Fast exponentiation:**

```csharp
static long Pow(long b, long e, long mod)
{
    long r = 1; b %= mod;
    while (e > 0)
    {
        if ((e & 1) == 1) r = r * b % mod;
        b = b * b % mod;
        e >>= 1;
    }
    return r;
}
```

**Primality and sieve:**

```csharp
static bool IsPrime(int n)
{
    if (n < 2) return false;
    if (n % 2 == 0) return n == 2;
    for (int i = 3; (long)i * i <= n; i += 2)      // cast: i*i overflows for large n
        if (n % i == 0) return false;
    return true;
}

// Sieve of Eratosthenes — all primes below n in O(n log log n)
var composite = new bool[n + 1];
for (int i = 2; (long)i * i <= n; i++)
    if (!composite[i])
        for (long j = (long)i * i; j <= n; j += i) composite[j] = true;
```

**Digit manipulation:**

```csharp
while (n > 0) { int digit = n % 10; n /= 10; }
int digitCount = n == 0 ? 1 : (int)Math.Floor(Math.Log10(Math.Abs((double)n))) + 1;
```

## 6. Complexity

| Task | Naive | Better |
|---|---|---|
| Sum 1..n | O(n) | **O(1)** |
| Primality | O(n) | **O(sqrt n)** |
| All primes < n | O(n sqrt n) | **O(n log log n)** sieve |
| GCD | O(min) | **O(log min)** Euclid |
| x^n | O(n) | **O(log n)** |
| Digit count | O(digits) | O(1) via log10 |
| Factorial / C(n,k) | O(n) | O(k), or precompute with modular inverses |

## 7. C# specifics — the traps that matter

```csharp
// INTEGER DIVISION TRUNCATES toward zero
int a = 7 / 2;          // 3
int b = -7 / 2;         // -3   (not -4)

// MODULO OF A NEGATIVE IS NEGATIVE in C#
int m = -7 % 3;         // -2   (Python gives 2)
int positiveMod = ((x % n) + n) % n;      // the fix — memorize this

// OVERFLOW IS SILENT by default
int big = int.MaxValue + 1;               // wraps to int.MinValue, no error
checked { int c = int.MaxValue + 1; }     // throws OverflowException
long safe = (long)a * b;                  // cast BEFORE multiplying

// int.MinValue has no positive counterpart
Math.Abs(int.MinValue);                   // THROWS OverflowException

// Floating point
0.1 + 0.2 == 0.3;                          // false
Math.Abs(x - y) < 1e-9;                    // compare with a tolerance
decimal money = 19.99m;                    // money is decimal, never double

// Useful built-ins (33)
Math.DivRem(a, b, out int rem);
Math.Clamp(v, lo, hi);
Math.BigMul(a, b);                         // full 64-bit product of two ints
double.IsNaN(x); double.IsInfinity(x);
System.Numerics.BigInteger;                // arbitrary precision when you need it
```

The negative-modulo fix `((x % n) + n) % n` is worth memorizing verbatim — it
appears in circular-array problems, hashing, and rotation constantly, and C#'s
behaviour differs from Python's in a way that silently produces negative indices.

## 8. Common mistakes

1. **Silent integer overflow.** `int * int` stays `int`. Cast to `long` *before*
   multiplying, not after: `(long)a * b`, never `(long)(a * b)`.
2. **Negative modulo** producing a negative index.
3. **Integer division truncation** where you wanted rounding —
   `(a + b - 1) / b` for ceiling of positive integers.
4. **`Math.Abs(int.MinValue)`** throws.
5. **Comparing doubles with `==`.**
6. **`double` for money.** Use `decimal`.
7. **Loop to n when sqrt(n) suffices**, or when a formula exists.
8. **`i * i` overflowing** in a primality loop — cast to `long`.
9. **Forgetting `mod` at every step** in modular arithmetic problems; intermediate
   products overflow before you take the modulus.
10. **`Math.Pow` returning `double`** — precision loss on large integer powers.
    Write integer exponentiation.

## 9. Correct-book problems

- Missing Number (sum formula or XOR)
- Happy Number — digit squares plus cycle detection (01)
- Count Primes — sieve
- Palindrome Number (without converting to a string)
- Reverse Integer — with overflow detection
- Pow(x, n) — fast exponentiation, negative exponents, `int.MinValue`
- Excel Sheet Column Number / Title — base-26 with a 1-indexing twist
- Fraction to Recurring Decimal — long division plus a Dictionary (02)
- Ugly Number; Perfect Number; Add Digits
- GCD of Strings; Simplify a fraction
- Factorial Trailing Zeroes — count factors of 5
- Roman to Integer; Integer to Roman
- Climbing Stairs (Fibonacci with a closed form)

## 10. Where a formula looks right but is wrong

- **Overflow makes the formula unusable** without `long`/`BigInteger`.
- **Floating point breaks exactness** — `Math.Sqrt` then rounding can be off by
  one; verify with integer multiplication.
- **The pattern is not actually arithmetic** — do not force a closed form onto a
  combinatorial problem that needs DP (19).
- **`Math.Pow` for integer powers** — precision loss above 2^53.
- **A sieve for a single primality test** — O(n) memory to answer one question;
  trial division to sqrt(n) is better.
- **Clever arithmetic that obscures intent** in production code.

---

## Production Lens

The interview lesson here is formulas. The production lesson is **arithmetic
safety**, and it matters far more:

- `decimal` for money, always. `double` for money is a defect.
- `checked` arithmetic (or `<CheckedForOverflow>` in the project file) for
  financial and safety-critical paths. Silent wraparound is worse than an
  exception.
- `long` for anything counting bytes, milliseconds, or rows. The 2038-style
  bugs are all `int` overflow.
- Never compare floats with `==`.
- `BigInteger` exists; use it rather than rolling arbitrary precision.

The single most valuable habit from this book is asking **"can this overflow?"**
before writing a multiplication.

**Related:** [[Book25-BitManipulation]], [[Book33-BuiltInMethods]],
[[Book19-DynamicProgramming]], [[Book11-PrefixSum]].
