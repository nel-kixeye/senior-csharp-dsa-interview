#!/usr/bin/env bash
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
echo "Books 25-29"

# ---------------------------------------------------------------- Book 25
B=Book25-BitManipulation; G=Book25-BitManipulation.md

start_exercise $B E25.1-SingleNumber E25.1 $G Easy "Bits / XOR" "10 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Every element appears twice except one. Find it.
    // O(n) time, O(1) SPACE REQUIRED - a HashSet fails the constraint.
    //
    // State the THREE XOR properties that make the one-liner work.
    public static int SingleNumber(int[] nums)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.SingleNumber([2, 2, 1]));        // expect 1
    Console.WriteLine(Solution.SingleNumber([4, 1, 2, 1, 2]));  // expect 4
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  { 2,2,1 }        -> 1
     * Test Case 2  { 4,1,2,1,2 }    -> 4
     * Test Case 3  { 1 }            -> 1     (single element)
     * Test Case 4  { -1,-1,-3 }     -> -3    (negatives)
     * Test Case 5  { 1,2,1 }        -> 2     (loner in the middle)
     */
}
EOF
banner E25.1 "Single Number"

start_exercise $B E25.2-NumberOf1Bits E25.2 $G Easy Bits "10 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Count the set bits in a 32-bit unsigned value.
    // Target: O(set bits), NOT O(32).
    //
    // The naive loop shifts 32 times regardless of input.
    // Which identity lets you loop once per SET bit?
    // Then name the BCL method that makes this a single CPU instruction.
    public static int HammingWeight(uint n)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.HammingWeight(11));           // expect 3   (1011)
    Console.WriteLine(Solution.HammingWeight(128));          // expect 1
    Console.WriteLine(Solution.HammingWeight(uint.MaxValue));// expect 32
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  11             -> 3    (binary 1011)
     * Test Case 2  128            -> 1    (single bit)
     * Test Case 3  0              -> 0
     * Test Case 4  uint.MaxValue  -> 32   (all bits set)
     * Test Case 5  1u << 31       -> 1    (single HIGH bit - watch signed shifts)
     */
}
EOF
banner E25.2 "Number of 1 Bits"

start_exercise $B E25.3-CountingBits E25.3 $G Easy "Bits + DP" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // For every i from 0 to n, the number of set bits in i.
    // Target: O(n) TOTAL - not O(n log n).
    //
    // This is a DP problem wearing bit clothing.
    // Express popcount(i) in terms of an ALREADY COMPUTED smaller value.
    // Two different recurrences work - find at least one.
    public static int[] CountBits(int n)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(string.Join(", ", Solution.CountBits(5)));   // expect 0, 1, 1, 2, 1, 2
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  n = 5   -> { 0,1,1,2,1,2 }
     * Test Case 2  n = 2   -> { 0,1,1 }
     * Test Case 3  n = 0   -> { 0 }
     * Test Case 4  n = 1   -> { 0,1 }
     *
     * Test Case 5 - POWERS OF TWO all have exactly one set bit
     * n = 16: indices 1,2,4,8,16 must all be 1
     */
}
EOF
banner E25.3 "Counting Bits"

start_exercise $B E25.4-ReverseBits E25.4 $G Easy Bits "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Reverse the bits of a 32-bit unsigned integer. O(32), O(1).
    //
    // You are BUILDING the result while CONSUMING the input.
    // On every iteration one shifts left and the other shifts right.
    // Which is which? Say it before writing.
    public static uint ReverseBits(uint n)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.ReverseBits(43261596));   // expect 964176192
    Console.WriteLine(Solution.ReverseBits(1));          // expect 2147483648
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  43261596      -> 964176192
     * Test Case 2  1             -> 2147483648   (low bit becomes the high bit)
     * Test Case 3  0             -> 0
     * Test Case 4  uint.MaxValue -> uint.MaxValue (all bits set, symmetric)
     * Test Case 5  2147483648    -> 1            (high bit becomes the low bit)
     */
}
EOF
banner E25.4 "Reverse Bits"

start_exercise $B E25.5-SumOfTwoIntegers E25.5 $G Medium "Bits / arithmetic" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Return a + b WITHOUT using + or -.
    //
    // Binary addition has two parts: the sum ignoring carries, and the carries
    // themselves. Which bitwise operator produces each?
    // Then: how do you combine them repeatedly, and when do you stop?
    //
    // In C# you will need `unchecked`, and probably a uint cast for the carry
    // shift (>> on a negative int is an ARITHMETIC shift).
    public static int GetSum(int a, int b)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.GetSum(1, 2));     // expect 3
    Console.WriteLine(Solution.GetSum(2, 3));     // expect 5
    Console.WriteLine(Solution.GetSum(-2, 3));    // expect 1
    Console.WriteLine(Solution.GetSum(-1, -1));   // expect -2
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  1 + 2    -> 3
     * Test Case 2  2 + 3    -> 5
     * Test Case 3  -2 + 3   -> 1     (mixed signs)
     * Test Case 4  -1 + -1  -> -2    (both negative)
     * Test Case 5  0 + 0    -> 0
     * Test Case 6  5 + 0    -> 5     (identity)
     */
}
EOF
banner E25.5 "Sum of Two Integers"

# ---------------------------------------------------------------- Book 26
B=Book26-Math; G=Book26-Math.md

start_exercise $B E26.1-PalindromeNumber E26.1 $G Easy Math "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Does the integer read the same forwards and backwards?
    // DO NOT convert it to a string. O(digits) time, O(1) space.
    //
    // Reversing the WHOLE number can overflow.
    // What if you only reverse HALF of it? State the stopping condition.
    public static bool IsPalindrome(int x)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.IsPalindrome(121));   // expect True
    Console.WriteLine(Solution.IsPalindrome(-121));  // expect False
    Console.WriteLine(Solution.IsPalindrome(10));    // expect False
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  121   -> true
     * Test Case 2  -121  -> false   (negatives are never palindromes)
     * Test Case 3  10    -> false   (trailing zero)
     * Test Case 4  0     -> true    (the only number ending in 0 that qualifies)
     * Test Case 5  1221  -> true    (even digit count)
     * Test Case 6  int.MaxValue (2147483647) -> false, and must not overflow
     */
}
EOF
banner E26.1 "Palindrome Number"

start_exercise $B E26.2-ReverseInteger E26.2 $G Medium "Math / overflow" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Reverse the digits of a signed 32-bit integer. Return 0 on overflow.
    // You may NOT use 64-bit integers to detect the overflow.
    //
    // State the pre-multiplication overflow check before coding.
    // Note: C#'s % keeps the sign of the dividend, so negatives fall out without
    // a separate sign variable - which also dodges the int.MinValue trap.
    public static int Reverse(int x)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.Reverse(123));         // expect 321
    Console.WriteLine(Solution.Reverse(-123));        // expect -321
    Console.WriteLine(Solution.Reverse(120));         // expect 21
    Console.WriteLine(Solution.Reverse(1534236469));  // expect 0 (overflows)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  123          -> 321
     * Test Case 2  -123         -> -321
     * Test Case 3  120          -> 21      (trailing zeroes vanish)
     * Test Case 4  1534236469   -> 0       (reversed value overflows)
     * Test Case 5  0            -> 0
     *
     * Test Case 6 - THE TRAP
     * Input:    int.MinValue (-2147483648)
     * Expected: 0     (must not throw; negating it in int does nothing)
     */
}
EOF
banner E26.2 "Reverse Integer"

start_exercise $B E26.3-CountPrimes E26.3 $G Medium "Math / sieve" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Count the primes STRICTLY LESS than n. n up to 5*10^6.
    // A per-number primality test is too slow. O(n log log n).
    //
    // Name the algorithm. Then TWO optimizations, each with a one-line
    // justification:
    //   - where should the INNER loop start?
    //   - where should the OUTER marking loop stop?
    // Watch: i * i overflows int for large n. Use long for the inner index.
    public static int CountPrimes(int n)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.CountPrimes(10));      // expect 4  (2,3,5,7)
    Console.WriteLine(Solution.CountPrimes(0));       // expect 0
    Console.WriteLine(Solution.CountPrimes(1000000)); // expect 78498
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  n = 10       -> 4       (2, 3, 5, 7)
     * Test Case 2  n = 0        -> 0
     * Test Case 3  n = 1        -> 0
     * Test Case 4  n = 2        -> 0       (STRICTLY less than n)
     * Test Case 5  n = 3        -> 1       (just 2)
     * Test Case 6  n = 1000000  -> 78498   (correctness + speed check)
     */
}
EOF
banner E26.3 "Count Primes"

start_exercise $B E26.4-ExcelColumnNumber E26.4 $G Easy "Math / base conversion" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Excel column title to number. "A" -> 1, "Z" -> 26, "AA" -> 27, "AB" -> 28.
    // O(n) time, O(1) space.
    //
    // This is base-26 WITH A TWIST. What is the twist, and why does 'A' mapping
    // to 1 rather than 0 change the arithmetic?
    public static int TitleToNumber(string columnTitle)
    {
        throw new NotImplementedException();
    }

    // FOLLOW-UP: write the inverse. The off-by-one bites harder going backwards -
    // say where, then implement it.
    public static string ConvertToTitle(int columnNumber)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.TitleToNumber("A"));        // expect 1
    Console.WriteLine(Solution.TitleToNumber("AB"));       // expect 28
    Console.WriteLine(Solution.TitleToNumber("ZY"));       // expect 701
    Console.WriteLine(Solution.ConvertToTitle(28));        // expect AB
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * TitleToNumber
     * Test Case 1  "A"   -> 1
     * Test Case 2  "Z"   -> 26      (the boundary the 1-indexing creates)
     * Test Case 3  "AA"  -> 27
     * Test Case 4  "ZY"  -> 701
     * Test Case 5  "FXSHRXW" -> 2147483647   (int.MaxValue - watch the accumulator)
     *
     * ConvertToTitle (inverse - each must round-trip)
     * 1 -> "A",  26 -> "Z",  27 -> "AA",  28 -> "AB",  701 -> "ZY"
     * The 26 -> "Z" case is where the off-by-one shows up.
     */
}
EOF
banner E26.4 "Excel Sheet Column Number"

start_exercise $B E26.5-FractionToRecurringDecimal E26.5 $G Hard "Math + Dictionary" "35 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Return the fraction as a string. If the fractional part repeats, wrap the
    // repeating portion in parentheses.
    //   1/2   -> "0.5"
    //   2/3   -> "0.(6)"
    //   4/333 -> "0.(012)"
    //
    // You are doing LONG DIVISION by hand.
    // What tells you the decimal has started repeating, and what must you
    // remember to know WHERE the repeat began? That names the structure.
    //
    // OVERFLOW: numerator may be int.MinValue. Cast to long up front -
    // Math.Abs(int.MinValue) throws.
    public static string FractionToDecimal(int numerator, int denominator)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.FractionToDecimal(1, 2));    // expect 0.5
    Console.WriteLine(Solution.FractionToDecimal(2, 3));    // expect 0.(6)
    Console.WriteLine(Solution.FractionToDecimal(4, 333));  // expect 0.(012)
    Console.WriteLine(Solution.FractionToDecimal(-50, 8));  // expect -6.25
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  1 / 2    -> "0.5"
     * Test Case 2  2 / 3    -> "0.(6)"
     * Test Case 3  4 / 333  -> "0.(012)"
     * Test Case 4  2 / 1    -> "2"        (exact, NO decimal point at all)
     * Test Case 5  -50 / 8  -> "-6.25"    (negative result)
     * Test Case 6  0 / 5    -> "0"
     *
     * Test Case 7 - THE OVERFLOW TRAP
     * Input:    numerator = int.MinValue, denominator = -1
     * Expected: "2147483648"   (must not throw or wrap)
     */
}
EOF
banner E26.5 "Fraction to Recurring Decimal"

# ---------------------------------------------------------------- Book 27 (craft)
B=Book27-LINQ; G=Book27-LINQ.md

start_exercise $B E27.1-NameTheShape E27.1 $G Easy "LINQ / vocabulary" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public record Order(int Id, int CustomerId, decimal Total, DateOnly Date, bool IsPaid);
public record User(int Id, string Name, string Department);
public record Team(string Name, List<string> Members);
public record Product(int Id, string Category, string Name);
public record Employee(string Name, decimal Salary);

public static class Solution
{
    // For each: name the operator(s), write the one-liner, and say whether a
    // loop would read better.

    // 1. Total value of orders placed in a given year.
    public static decimal TotalForYear(IEnumerable<Order> orders, int year)
        => throw new NotImplementedException();

    // 2. Distinct department names.
    public static IEnumerable<string> Departments(IEnumerable<User> users)
        => throw new NotImplementedException();

    // 3. Every member of every team, flattened into one sequence.
    public static IEnumerable<string> AllMembers(IEnumerable<Team> teams)
        => throw new NotImplementedException();

    // 4. A lookup from category to the products in it.
    //    (Missing categories should yield an empty sequence, not throw.)
    public static ILookup<string, Product> ByCategory(IEnumerable<Product> products)
        => throw new NotImplementedException();

    // 5. The EMPLOYEE with the highest salary - not the salary.
    //    Two ways exist; one is O(n log n) for an O(n) job. Name both, use the good one.
    public static Employee? TopEarner(IEnumerable<Employee> employees)
        => throw new NotImplementedException();

    // 6. Has every order been paid?
    public static bool AllPaid(IEnumerable<Order> orders)
        => throw new NotImplementedException();

    // 7. Split ids into batches of 500 for a bulk API call.
    public static IEnumerable<int[]> Batches(IEnumerable<int> ids)
        => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
var users = new List<User> { new(1, "A", "Eng"), new(2, "B", "Eng"), new(3, "C", "Sales") };
var employees = new List<Employee> { new("A", 100), new("B", 250), new("C", 180) };

try
{
    Console.WriteLine(string.Join(", ", Solution.Departments(users)));   // expect Eng, Sales
    Console.WriteLine(Solution.TopEarner(employees)?.Name);              // expect B
    Console.WriteLine(Solution.Batches(Enumerable.Range(1, 1200)).Count());// expect 3
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * 1. Where + Sum
     * 2. Select + Distinct  (or DistinctBy if you want whole users)
     * 3. SelectMany
     * 4. ToLookup           (NOT ToDictionary - missing keys must not throw)
     * 5. MaxBy              (O(n)).  OrderByDescending().First() is O(n log n) - the trap.
     * 6. All
     * 7. Chunk(500)         (.NET 6+)
     *
     * Self-check: 1200 ids in batches of 500 -> 3 batches (500, 500, 200).
     * Departments of { Eng, Eng, Sales } -> 2 distinct values.
     */
}
EOF
banner E27.1 "Name the shape, then write it"

start_exercise $B E27.2-FindTheHiddenQuadratic E27.2 $G Medium "LINQ / complexity" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // THIS COMPILES, PASSES ON SMALL INPUTS, AND IS QUADRATIC.
    // Find why, then fix it WITHOUT changing the result.
    //
    // State the complexity of the original and of your fix.
    // Then name the general rule this violates - it applies to Contains as much
    // as to Count.
    public static List<int> FindDuplicates_Broken(List<int> numbers)
    {
        return numbers
            .Where(n => numbers.Count(x => x == n) > 1)
            .Distinct()
            .ToList();
    }

    // Your fix. Same output, linear time.
    public static List<int> FindDuplicates(List<int> numbers)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
using System.Diagnostics;

var small = new List<int> { 1, 2, 3, 2, 4, 1 };
Console.WriteLine(string.Join(", ", Solution.FindDuplicates_Broken(small)));  // 1, 2

try
{
    Console.WriteLine(string.Join(", ", Solution.FindDuplicates(small)));     // must match
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
    return;
}

// Feel the difference. 40,000 elements.
var big = Enumerable.Range(0, 40000).Select(i => i % 20000).ToList();

var sw = Stopwatch.StartNew();
Solution.FindDuplicates_Broken(big);
Console.WriteLine($"broken: {sw.ElapsedMilliseconds} ms");

sw.Restart();
Solution.FindDuplicates(big);
Console.WriteLine($"fixed:  {sw.ElapsedMilliseconds} ms");
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  { 1,2,3,2,4,1 }  -> { 1, 2 }   (order not significant)
     * Test Case 2  { 1,2,3 }        -> { }        (no duplicates)
     * Test Case 3  { 1,1,1 }        -> { 1 }      (reported once)
     * Test Case 4  { }              -> { }
     *
     * Test Case 5 - THE POINT OF THE EXERCISE
     * Run Program.cs. The broken version on 40,000 elements should take
     * hundreds of ms to seconds; the fixed version should be single-digit ms.
     *
     * THE RULE: never call Contains / Count / Any over the SAME source inside a
     * predicate applied to that source. That is a nested loop with nice syntax.
     */
}
EOF
banner E27.2 "Find the hidden O(n^2)"

start_exercise $B E27.3-MultipleEnumeration E27.3 $G Medium "LINQ / deferred execution" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public record Order(int Id, decimal Amount, bool IsValid);

public static class Solution
{
    // REVIEW THIS. There are TWO distinct problems - one performance, one
    // correctness-under-certain-sources.
    //
    // How many times is `orders` enumerated?
    // What if it is a database query, or a generator reading a file?
    public static decimal Process_Broken(IEnumerable<Order> orders, Action<Order> handle)
    {
        if (orders.Count() == 0) return 0;
        Console.WriteLine($"Processing {orders.Count()} orders");
        foreach (var o in orders.Where(o => o.IsValid))
            handle(o);
        return orders.Sum(o => o.Amount);
    }

    // Your fix: same behaviour, ONE enumeration.
    public static decimal Process(IEnumerable<Order> orders, Action<Order> handle)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
int enumerations = 0;

IEnumerable<Order> Source()
{
    enumerations++;                       // counts each full enumeration
    yield return new Order(1, 10m, true);
    yield return new Order(2, 20m, false);
    yield return new Order(3, 30m, true);
}

enumerations = 0;
Solution.Process_Broken(Source(), _ => { });
Console.WriteLine($"broken enumerated the source {enumerations} times");   // expect 4

try
{
    enumerations = 0;
    Solution.Process(Source(), _ => { });
    Console.WriteLine($"fixed enumerated the source {enumerations} times");  // expect 1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1 - COUNT THE ENUMERATIONS
     * Run Program.cs. Broken enumerates 4 times: Count(), Count() again, the
     * foreach, and Sum(). Your fix must enumerate exactly ONCE.
     *
     * Test Case 2 - a ONE-SHOT source
     * If the source can only be enumerated once (a StreamReader-backed iterator),
     * the broken version's later passes yield NOTHING and the total is 0.
     *
     * Test Case 3 - empty source
     * Expected: returns 0, handle never called.
     *
     * Test Case 4 - correctness
     * Orders { (1,10,valid), (2,20,invalid), (3,30,valid) }
     * handle called for ids 1 and 3; return value 60 (SUM IS OVER ALL ORDERS).
     *
     * Test Case 5 - also prefer Any() over Count() == 0, and the Count PROPERTY
     * over the Count() METHOD once materialized.
     */
}
EOF
banner E27.3 "The multiple-enumeration bug"

start_exercise $B E27.4-LookupVsDictionary E27.4 $G Medium "LINQ / design choice" "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public record User(int Id, string Name);
public record Product(int Id, string Category, string Name);
public record Sale(string Region, decimal Amount);

public static class Solution
{
    // For each scenario choose ToDictionary / ToLookup / GroupBy and JUSTIFY it
    // in one sentence in Notes.txt. Then implement.

    // 1. Cache of users keyed by unique id. A duplicate id is a BUG you want to
    //    hear about immediately.
    public static Dictionary<int, User> UserCache(IEnumerable<User> users)
        => throw new NotImplementedException();

    // 2. Map from category to all products in it. A category with no products
    //    must return an EMPTY sequence, not throw.
    public static ILookup<string, Product> ProductsByCategory(IEnumerable<Product> products)
        => throw new NotImplementedException();

    // 3. Sales totals per region, consumed ONCE and discarded.
    public static IEnumerable<(string Region, decimal Total)> RegionTotals(IEnumerable<Sale> sales)
        => throw new NotImplementedException();

    // 4. Country code -> name, loaded at startup, read millions of times.
    //    The naive LINQ answer is NOT the production answer. Which is it?
    public static IReadOnlyDictionary<string, string> CountryLookup(IEnumerable<(string Code, string Name)> rows)
        => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
var products = new List<Product> { new(1, "tools", "hammer"), new(2, "tools", "saw") };

try
{
    var lookup = Solution.ProductsByCategory(products);
    Console.WriteLine(lookup["tools"].Count());       // expect 2
    Console.WriteLine(lookup["nonexistent"].Count()); // expect 0 - must NOT throw
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * 1. ToDictionary - THROWS on a duplicate key, which is the fail-fast
     *    behaviour wanted here.
     * 2. ToLookup     - one-to-many, and a missing key yields an empty sequence.
     * 3. GroupBy      - consumed once, no need to materialize a lookup.
     * 4. ToFrozenDictionary (.NET 8+) - build once, read forever. Slower to
     *    construct, faster to probe than Dictionary.
     *
     * Test Case A  ProductsByCategory(...)["nonexistent"] must yield 0 items,
     *              NOT throw. If it throws you used ToDictionary.
     * Test Case B  UserCache with duplicate ids must THROW.
     * Test Case C  Empty input: all four must handle it without error.
     */
}
EOF
banner E27.4 "ToDictionary vs ToLookup vs GroupBy"

start_exercise $B E27.5-QueryableVsEnumerable E27.5 $G Medium "LINQ / EF Core" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public record Order(int Id, decimal Total, string CustomerName);

public static class Solution
{
    // Against an EF Core DbSet<Order>, these two look nearly identical.
    // ONE is fine. ONE is a production incident.
    //
    //     var a = ctx.Orders.Where(o => o.Total > 100).ToList();
    //     var b = ctx.Orders.ToList().Where(o => o.Total > 100);
    //
    // In Notes.txt, answer:
    //   1. What SQL does each generate, and how much data crosses the wire?
    //   2. How would you also avoid over-fetching COLUMNS when you only need
    //      Id and Total?
    //   3. Name one way an IQueryable chain can silently degrade into
    //      client-side evaluation, and how you would catch it before production.

    // Write the version that filters in SQL and projects only the needed columns.
    public static IQueryable<(int Id, decimal Total)> HighValue(IQueryable<Order> orders)
        => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
// No database here - this exercise is about reading and reasoning.
// Answer the three questions in Notes.txt, then implement HighValue.

var fake = new List<Order>
{
    new(1, 50m,  "a"),
    new(2, 150m, "b"),
    new(3, 250m, "c")
}.AsQueryable();

try
{
    foreach (var r in Solution.HighValue(fake))
        Console.WriteLine($"{r.Id}: {r.Total}");
    // expect 2: 150 and 3: 250
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * 1. `a` -> the Where is part of the expression tree, so EF translates it:
     *        SELECT * FROM Orders WHERE Total > 100
     *    Only matching rows cross the wire.
     *
     *    `b` -> ToList() materializes the ENTIRE TABLE first, then filters in
     *    memory. On a large table this is the incident.
     *
     * 2. Add a projection BEFORE materializing:
     *        .Select(o => new { o.Id, o.Total })   ->  SELECT Id, Total
     *
     * 3. Calling a method EF cannot translate inside a Where (a custom C#
     *    helper, some string operations), or slipping in an AsEnumerable().
     *    Modern EF Core throws on unsupported client evaluation, but
     *    AsEnumerable() still opts out silently.
     *    Catch it by logging generated SQL in development and asserting on
     *    query counts in integration tests.
     *
     * Functional check: HighValue over the fake data returns ids 2 and 3.
     */
}
EOF
banner E27.5 "IEnumerable vs IQueryable"

# ---------------------------------------------------------------- Book 28 (craft)
B=Book28-StringApis; G=Book28-StringApis.md

start_exercise $B E28.1-DeleteTheReinventedWheel E28.1 $G Easy "String APIs" "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
using System.Text;

public static class Solution
{
    // Each of these is a BCL method written by hand.
    // Replace each with the correct call, and for the first three name a
    // SPECIFIC input where the hand-rolled version returns the WRONG answer.

    public static bool IsLetter_Broken(char c) => (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
    public static bool IsDigit_Broken(char c) => c >= '0' && c <= '9';
    public static char Lower_Broken(char c) => c >= 'A' && c <= 'Z' ? (char)(c + 32) : c;

    public static bool IsBlank_Broken(string s)
    {
        if (s == null) return true;
        foreach (var c in s) if (c != ' ') return false;
        return true;
    }

    public static string Repeat_Broken(char c, int n)
    {
        var sb = new StringBuilder();
        for (int i = 0; i < n; i++) sb.Append(c);
        return sb.ToString();
    }

    // --- your replacements ---
    public static bool IsLetter(char c) => throw new NotImplementedException();
    public static bool IsDigit(char c) => throw new NotImplementedException();
    public static char Lower(char c) => throw new NotImplementedException();
    public static bool IsBlank(string? s) => throw new NotImplementedException();
    public static string Repeat(char c, int n) => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
// The inputs that expose the hand-rolled versions.
Console.WriteLine($"IsLetter_Broken('e' with accent) = {Solution.IsLetter_Broken('\u00e9')}");  // False - WRONG
Console.WriteLine($"IsDigit_Broken(Arabic-Indic 3)  = {Solution.IsDigit_Broken('\u0663')}");    // False
Console.WriteLine($"IsBlank_Broken(\"\\t\")          = {Solution.IsBlank_Broken("\t")}");       // False - WRONG

try
{
    Console.WriteLine(Solution.IsLetter('\u00e9'));   // expect True
    Console.WriteLine(Solution.IsBlank("\t \n"));     // expect True
    Console.WriteLine(Solution.Repeat('x', 5));       // expect xxxxx
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Replacements and what the hand-rolled versions get WRONG:
     *
     * IsLetter  -> char.IsLetter(c)
     *              broken returns FALSE for 'e-acute', 'Omega', CJK characters
     * IsDigit   -> char.IsDigit(c)
     *              broken returns FALSE for non-ASCII digits (Arabic-Indic)
     *              If you MEAN ascii only, char.IsAsciiDigit says so and is faster
     * Lower     -> char.ToLowerInvariant(c)
     *              the +32 trick is ASCII-only and silently wrong elsewhere
     * IsBlank   -> string.IsNullOrWhiteSpace(s)
     *              broken misses tabs, newlines, non-breaking spaces
     * Repeat    -> new string(c, n)
     *              one allocation, no StringBuilder needed
     *
     * Test Case 1  IsLetter('\u00e9')  -> true
     * Test Case 2  IsDigit('\u0663')   -> true
     * Test Case 3  IsBlank("\t \n")    -> true
     * Test Case 4  IsBlank(null)       -> true
     * Test Case 5  Repeat('x', 0)      -> ""
     */
}
EOF
banner E28.1 "Delete the reinvented wheel"

start_exercise $B E28.2-CaseInsensitiveComparison E28.2 $G Medium "String comparison" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
using System.Globalization;

public static class Solution
{
    // FOUR ways to compare case-insensitively. THREE are wrong or wasteful.
    // Rank them in Notes.txt and explain.
    //
    // Then answer: which would you use for a USERNAME comparison, and which for
    // SORTING product names shown to a user? They are different answers.

    public static bool Compare1(string a, string b) => a.ToLower() == b.ToLower();
    public static bool Compare2(string a, string b) => a.ToLowerInvariant() == b.ToLowerInvariant();
    public static bool Compare3(string a, string b) => string.Equals(a, b, StringComparison.OrdinalIgnoreCase);
    public static bool Compare4(string a, string b) => a.Equals(b, StringComparison.CurrentCultureIgnoreCase);

    // The one you would ship for comparing identifiers.
    public static bool AreSameIdentifier(string a, string b) => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
using System.Globalization;
using System.Threading;

// Reproduce the Turkish-I problem.
Console.WriteLine("--- invariant culture ---");
Console.WriteLine(Solution.Compare1("ID", "id"));   // True

Thread.CurrentThread.CurrentCulture = new CultureInfo("tr-TR");
Console.WriteLine("--- tr-TR culture ---");
Console.WriteLine(Solution.Compare1("ID", "id"));   // False  <- THE BUG
Console.WriteLine(Solution.Compare3("ID", "id"));   // True   <- ordinal is immune

try
{
    Console.WriteLine(Solution.AreSameIdentifier("ID", "id"));   // expect True in every culture
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * RANKING
     * #3 string.Equals(a, b, StringComparison.OrdinalIgnoreCase) - BEST for
     *    identifiers: no allocation, ordinal, intent explicit.
     * #2 ToLowerInvariant comparison - correct, but allocates two strings to
     *    answer a boolean.
     * #4 CurrentCultureIgnoreCase - right for USER-FACING text, wrong for ids.
     * #1 ToLower() comparison - A BUG. In tr-TR, "I".ToLower() is dotless 'i',
     *    so "ID" == "id" becomes FALSE. Reproduces only on Turkish-locale
     *    machines, which is what makes it vicious.
     *
     * Test Case 1  Under tr-TR, Compare1("ID","id") -> false  (demonstrates the bug)
     * Test Case 2  Under tr-TR, Compare3("ID","id") -> true
     * Test Case 3  AreSameIdentifier must be true in EVERY culture
     * Test Case 4  Username comparison  -> OrdinalIgnoreCase
     * Test Case 5  Sorting display names -> culture-aware, deliberately
     */
}
EOF
banner E28.2 "Case-insensitive comparison done four ways"

start_exercise $B E28.3-ParseCsvLine E28.3 $G Medium "String APIs / Span" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Given " alice , 30 , engineer ", produce trimmed, non-empty fields.
    // Three versions, increasing in quality.

    // 1. Naive: Split then Trim via LINQ.
    public static string[] Parse_Naive(string line) => throw new NotImplementedException();

    // 2. StringSplitOptions only - no LINQ, fewer allocations.
    public static string[] Parse_Options(string line) => throw new NotImplementedException();

    // 3. Allocation-free: count the fields without materializing any strings.
    //    Before coding: why can you not simply `yield return` a ReadOnlySpan<char>?
    //    Name the language restriction and one way around it.
    public static int CountFields(ReadOnlySpan<char> line) => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
const string line = " alice , 30 , engineer ";

try
{
    Console.WriteLine(string.Join("|", Solution.Parse_Naive(line)));    // expect alice|30|engineer
    Console.WriteLine(string.Join("|", Solution.Parse_Options(line)));  // expect alice|30|engineer
    Console.WriteLine(Solution.CountFields(line));                       // expect 3
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1  " alice , 30 , engineer "  -> { "alice", "30", "engineer" }
     * Test Case 2  "a,,b"                      -> { "a", "b" }   (empty removed)
     * Test Case 3  ""                          -> { }
     * Test Case 4  "  "                        -> { }   (whitespace-only field)
     * Test Case 5  "single"                    -> { "single" }
     *
     * Version 2 should be exactly:
     *   line.Split(',', StringSplitOptions.TrimEntries | StringSplitOptions.RemoveEmptyEntries)
     *
     * THE SPAN RESTRICTION: Span<T> is a ref struct - it cannot be a field,
     * cannot be captured, and cannot cross a yield return or await (both compile
     * to heap-allocated state machines). Work around it with a ref struct
     * enumerator (what MemoryExtensions.Split does) or by having the caller pass
     * in a Span<Range> destination.
     */
}
EOF
banner E28.3 "Parse a CSV line, three ways"

start_exercise $B E28.4-CountTheCharacters E28.4 $G Medium "Unicode" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
using System.Globalization;

public static class Solution
{
    // How many characters does a string have, for a HUMAN definition of character?
    //
    // Before coding: what does "thumbs up".Length return, and why?
    // Name the THREE different units .NET can count in, and which one matches
    // human intuition.

    public static int CountCodeUnits(string s) => throw new NotImplementedException();
    public static int CountRunes(string s) => throw new NotImplementedException();
    public static int CountGraphemes(string s) => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
string[] samples =
[
    "hello",
    "caf\u00e9",                  // precomposed e-acute
    "cafe\u0301",                 // e + combining acute  (same on screen!)
    "\U0001F44D",                 // thumbs up
    "\U0001F468\u200D\U0001F469\u200D\U0001F467\u200D\U0001F466"  // family emoji
];

try
{
    foreach (var s in samples)
        Console.WriteLine($"units={Solution.CountCodeUnits(s),2}  runes={Solution.CountRunes(s),2}  graphemes={Solution.CountGraphemes(s),2}");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     *                        code units  runes  graphemes
     * "hello"                    5         5        5
     * "caf\u00e9"                4         4        4
     * "cafe\u0301"               5         5        4     <- looks identical on screen
     * thumbs up emoji            2         1        1     <- surrogate PAIR
     * family emoji (ZWJ)         11        7        1     <- one visible character
     *
     * THE THREE UNITS
     *   code units  -> s.Length                      (UTF-16 units)
     *   runes       -> s.EnumerateRunes().Count()    (code points)
     *   graphemes   -> new StringInfo(s).LengthInTextElements   (what humans count)
     *
     * Only graphemes match human intuition.
     * ALSO: to compare "caf\u00e9" and "cafe\u0301" as equal, call
     * string.Normalize() first - the same visible string has multiple encodings.
     */
}
EOF
banner E28.4 "Count the characters"

start_exercise $B E28.5-ChooseTheRightTool E28.5 $G Medium "String APIs / judgment" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // For each: implement with the RIGHT api, and record in Notes.txt one api
    // you would AVOID and why.

    // 1. Does this file path end with .json, case-insensitively?
    public static bool IsJson(string path) => throw new NotImplementedException();

    // 2. Everything after the FIRST '=' in "key=value=more".
    public static string ValuePart(string kv) => throw new NotImplementedException();

    // 3. Is this input a well-formed ABSOLUTE url?
    public static bool IsAbsoluteUrl(string input) => throw new NotImplementedException();

    // 4. Build "1,2,3" from a list of ints.
    public static string JoinIds(IEnumerable<int> ids) => throw new NotImplementedException();

    // 5. Are two user-entered names "the same" despite different Unicode
    //    encodings of the same accented characters?
    public static bool SameName(string a, string b) => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.IsJson("Data/CONFIG.JSON"));         // expect True
    Console.WriteLine(Solution.ValuePart("key=value=more"));        // expect value=more
    Console.WriteLine(Solution.IsAbsoluteUrl("https://a.com/b"));   // expect True
    Console.WriteLine(Solution.IsAbsoluteUrl("not a url"));         // expect False
    Console.WriteLine(Solution.JoinIds([1, 2, 3]));                 // expect 1,2,3
    Console.WriteLine(Solution.SameName("caf\u00e9", "cafe\u0301"));// expect True
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * 1. path.EndsWith(".json", StringComparison.OrdinalIgnoreCase)
     *    AVOID path.ToLower().EndsWith(...) - allocates and is culture-risky.
     *
     * 2. var i = s.IndexOf('='); return s[(i + 1)..];   (or AsSpan for no alloc)
     *    AVOID s.Split('=')[1] - allocates the whole array AND drops "=more".
     *
     * 3. Uri.TryCreate(input, UriKind.Absolute, out _)
     *    AVOID a hand-written regex - URL grammar is far larger than it looks.
     *
     * 4. string.Join(",", ids)
     *    AVOID += in a loop. (And in real SQL: use PARAMETERS, not concatenation.)
     *
     * 5. a.Normalize(FormC) == b.Normalize(FormC)
     *    AVOID plain == - the same visible string has multiple encodings.
     *
     * Test Case 1  IsJson("Data/CONFIG.JSON")  -> true
     * Test Case 2  ValuePart("key=value=more") -> "value=more"  (NOT "value")
     * Test Case 3  IsAbsoluteUrl("not a url")  -> false
     * Test Case 4  JoinIds([])                 -> ""
     * Test Case 5  SameName precomposed vs decomposed -> true
     */
}
EOF
banner E28.5 "Choose the right tool"

# ---------------------------------------------------------------- Book 29 (craft)
B=Book29-Collections; G=Book29-Collections.md

start_exercise $B E29.1-ChooseTheCollection E29.1 $G Easy "Collections / judgment" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // For each scenario name the COLLECTION and the single OPERATION that
    // decides it. One sentence each, recorded in Notes.txt.
    //
    //  1. Config keys loaded once at startup, read on every request forever.
    //  2. A `visited` marker during a graph traversal of 10^6 nodes.
    //  3. Undo history for a text editor.
    //  4. Jobs to run, always taking the highest-priority one next.
    //  5. Autocomplete needing "all words between 'app' and 'apq'".
    //  6. A fixed 9x9 board in a Sudoku solver.
    //  7. Counting HTTP status codes in a shared object updated by many threads.
    //  8. A work queue where the PRODUCER MUST SLOW DOWN if the consumer lags.
    //  9. 100,000 items, constant removal from the middle, node references held.
    // 10. A query result returned from a public API that callers must not modify.
    //
    // Then declare the field you would actually write for each.

    // Example of the expected shape - fill in the rest yourself in Notes.txt.
    public static object Scenario1() => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
// This one is answered in Notes.txt, not at the keyboard.
// Write your 10 answers there, then check against Tests.cs.
Console.WriteLine("Answer the 10 scenarios in Notes.txt, then compare with Tests.cs.");
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     *  1. FrozenDictionary (.NET 8+)  - build once, probe forever
     *  2. HashSet<T>, or bool[] if node ids are dense 0..n-1 (faster, less memory)
     *  3. Stack<T>                    - LIFO is literally the undo semantic
     *  4. PriorityQueue<T,P>          - repeated extraction of the extreme
     *  5. SortedSet<string> + GetViewBetween  - ordered RANGE query
     *                                   (a trie or sorted array + binary search also works)
     *  6. char[,] or int[81]          - fixed size, dense indices, best locality
     *  7. ConcurrentDictionary + AddOrUpdate  - concurrent mutation
     *  8. Channel<T> BOUNDED          - "producer must slow down" IS backpressure,
     *                                   which ConcurrentQueue does not provide
     *  9. LinkedList<T>               - the ONLY scenario where it wins, and only
     *                                   because you hold the node reference
     * 10. IReadOnlyList<T> as the RETURN TYPE (backed by List<T> internally)
     *
     * If you answered "Dictionary" for #1 you are not wrong, just not optimal.
     * If you answered "ConcurrentQueue" for #8, re-read the backpressure clause.
     */
}
EOF
banner E29.1 "Choose the collection"

start_exercise $B E29.2-FindTheQuadratic E29.2 $G Medium "Collections / complexity" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public record Item(int Id, bool IsExpired);

public static class Solution
{
    // Each of these is O(n^2) or worse. Name WHY, then fix it.
    // D has a SECOND bug beyond the complexity - find it.

    public static List<int> A_Broken(IEnumerable<int> source)
    {
        var result = new List<int>();
        foreach (var x in source) if (!result.Contains(x)) result.Add(x);
        return result;
    }

    public static void B_Broken(List<int> pending, Action<int> process)
    {
        while (pending.Count > 0) { var next = pending[0]; pending.RemoveAt(0); process(next); }
    }

    public static void C_Broken(IEnumerable<int> items, Action<int> useSmallest)
    {
        var sorted = new List<int>();
        foreach (var item in items) { sorted.Add(item); sorted.Sort(); useSmallest(sorted[0]); }
    }

    public static void D_Broken(List<Item> list)
    {
        for (int i = 0; i < list.Count; i++) if (list[i].IsExpired) list.RemoveAt(i);
    }

    // --- your fixes ---
    public static List<int> A(IEnumerable<int> source) => throw new NotImplementedException();
    public static void B(List<int> pending, Action<int> process) => throw new NotImplementedException();
    public static void C(IEnumerable<int> items, Action<int> useSmallest) => throw new NotImplementedException();
    public static void D(List<Item> list) => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
// D's second bug, demonstrated:
var list = new List<Item> { new(1, true), new(2, true), new(3, false) };
Solution.D_Broken(list);
Console.WriteLine(string.Join(", ", list.Select(i => i.Id)));
// expect { 3 } but prints { 2, 3 } - item 2 was SKIPPED

try
{
    var list2 = new List<Item> { new(1, true), new(2, true), new(3, false) };
    Solution.D(list2);
    Console.WriteLine(string.Join(", ", list2.Select(i => i.Id)));   // expect 3
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * A  List.Contains is O(n) inside an O(n) loop -> O(n^2).
     *    Fix: source.Distinct(), or a HashSet for membership plus a List if you
     *    need first-seen order.
     *
     * B  RemoveAt(0) shifts every element -> O(n^2).
     *    Fix: Queue<T> with Dequeue().
     *
     * C  Re-sorting on every insert -> O(n^2 log n).
     *    Fix: PriorityQueue (if you only need the smallest) or SortedSet.
     *
     * D  TWO bugs:
     *      1. RemoveAt inside a forward loop -> O(n^2)
     *      2. IT SKIPS ELEMENTS - everything shifts left while i still advances,
     *         so consecutive expired items are missed. Run Program.cs to see it.
     *    Fix: list.RemoveAll(x => x.IsExpired) - O(n) total AND correct.
     *         (Or iterate backwards.)
     *
     * Test Case  D on { (1,expired), (2,expired), (3,ok) } must leave ONLY 3.
     */
}
EOF
banner E29.2 "Find the quadratic"

start_exercise $B E29.3-DesignLRUCache E29.3 $G Hard "Collections / design" "35 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
// Fixed-capacity cache. Get and Put must BOTH be O(1). Evict the least
// recently used entry when capacity is exceeded.
//
// Before coding, answer in Notes.txt:
//   - the TWO structures and the exact job of each
//   - why a List<T> cannot replace the second one
//   - why the first one cannot do the job alone
//   - what the dictionary's VALUE TYPE must be for removal to actually be O(1)
//   - what you would use in production instead of hand-rolling this, and one
//     thing it gives you that your version does not
public class LRUCache
{
    public LRUCache(int capacity)
    {
        throw new NotImplementedException();
    }

    public int Get(int key) => throw new NotImplementedException();

    public void Put(int key, int value) => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var c = new LRUCache(2);
    c.Put(1, 1);
    c.Put(2, 2);
    Console.WriteLine(c.Get(1));   // expect 1   (1 becomes most recent)
    c.Put(3, 3);                   // evicts key 2
    Console.WriteLine(c.Get(2));   // expect -1
    c.Put(4, 4);                   // evicts key 1
    Console.WriteLine(c.Get(1));   // expect -1
    Console.WriteLine(c.Get(3));   // expect 3
    Console.WriteLine(c.Get(4));   // expect 4
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * Test Case 1 - the standard sequence (see Program.cs)
     * capacity 2: Put(1,1) Put(2,2) Get(1)=1 Put(3,3) Get(2)=-1 Put(4,4)
     *             Get(1)=-1 Get(3)=3 Get(4)=4
     *
     * Test Case 2 - GET COUNTS AS USE
     * capacity 2: Put(1,1) Put(2,2) Get(1) Put(3,3)
     * Key 2 must be evicted, NOT key 1.
     *
     * Test Case 3 - updating an existing key refreshes recency, does not grow size
     * capacity 2: Put(1,1) Put(2,2) Put(1,10) Put(3,3) -> Get(2) = -1, Get(1) = 10
     *
     * Test Case 4 - capacity 1
     * Put(1,1) Put(2,2) -> Get(1) = -1, Get(2) = 2
     *
     * Test Case 5 - missing key returns -1 without throwing
     *
     * THE ANSWERS
     *   Dictionary<int, LinkedListNode<(int key, int value)>> + a doubly linked list.
     *   Dictionary: O(1) key -> NODE.  List: O(1) remove + re-insert at the front.
     *   A List<T> cannot remove from the middle in O(1).
     *   The dictionary alone has no notion of order, so it cannot identify the LRU.
     *   The value MUST be LinkedListNode<T>, not T - holding the node is what
     *   makes list.Remove(node) O(1). Storing the value forces an O(n) Find.
     *   Production: MemoryCache with a size limit - it also gives expiry,
     *   eviction callbacks, thread safety, and metrics.
     */
}
EOF
banner E29.3 "Design the LRU cache"

start_exercise $B E29.4-ConcurrencyTrap E29.4 $G Hard "Collections / concurrency" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
using System.Collections.Concurrent;

public static class Solution
{
    // THIS RUNS FINE IN TESTING AND HANGS IN PRODUCTION.
    //
    // In Notes.txt, explain what ACTUALLY happens under concurrent calls.
    // Be specific - it is worse than "the count might be wrong".
    private static readonly Dictionary<string, int> _counts = new();

    public static void Record_Broken(string key)
    {
        _counts[key] = _counts.GetValueOrDefault(key) + 1;
    }

    // Fix it THREE ways.
    public static void Record_WithLock(string key) => throw new NotImplementedException();
    public static void Record_Concurrent(string key) => throw new NotImplementedException();

    // Third fix: a design change that avoids shared mutable state entirely.
    // (Per-thread or per-request counters, aggregated at the end.)
    public static void Record_NoSharedState(string key) => throw new NotImplementedException();

    // Also answer: why is ConcurrentDictionary's  d[key] = d[key] + 1  STILL
    // wrong, and what is the correct API?
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
// Demonstrate lost updates. (Do NOT run Record_Broken with many threads on a
// machine you care about - it can corrupt the dictionary and spin forever.)
try
{
    Parallel.For(0, 10000, _ => Solution.Record_Concurrent("hits"));
    Console.WriteLine("concurrent version completed without corruption");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * WHAT ACTUALLY HAPPENS
     * Concurrent writes can corrupt Dictionary's internal bucket chains. The
     * documented failure is not merely a lost update - a corrupted chain can
     * make a subsequent READ SPIN FOREVER, hanging the thread. That is the
     * production hang, and it is why "we'll just accept slightly wrong counts"
     * is not an acceptable answer.
     *
     * FIX 1  lock (_gate) { ... } around the read-modify-write
     * FIX 2  ConcurrentDictionary + AddOrUpdate(key, 1, (_, old) => old + 1)
     * FIX 3  Per-thread/per-request counters aggregated at the end - no shared
     *        mutable state, no contention. (Or use the metrics library, which
     *        does exactly this.)
     *
     * WHY THE INDEXER IS STILL WRONG ON ConcurrentDictionary
     * d[k] = d[k] + 1 is THREE separate atomic operations, not one. Two threads
     * can both read 5 and both write 6. AddOrUpdate / GetOrAdd perform the
     * update atomically.
     *
     * Test Case  10,000 parallel increments must yield exactly 10,000.
     */
}
EOF
banner E29.4 "The concurrency trap"

start_exercise $B E29.5-InterviewVsProduction E29.5 $G Medium "Collections / judgment" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public record User(int Id, string Name);
public record Order(int Id);
public record WorkItem(int Id);

// A custom key type - note that it is a CLASS.
public class CustomerId
{
    public int Value { get; init; }
}

public static class Solution
{
    // For each: give BOTH the interview answer and the production answer, and
    // say what changes between them. Record in Notes.txt, then fix the code.

    // 1. What would you add in production?
    public static Dictionary<string, User> Cache_Interview() => new();
    public static Dictionary<string, User> Cache_Production() => throw new NotImplementedException();

    // 2. A `visited` set for a graph traversal over dense int ids 0..n-1.
    public static object Visited_Production(int nodeCount) => throw new NotImplementedException();

    // 3. Public service method return type. What should this be?
    public static List<Order> GetOrders_Interview() => [];
    public static IReadOnlyList<Order> GetOrders_Production() => throw new NotImplementedException();

    // 4. A background processing pipeline. Queue<WorkItem> is the interview
    //    answer. What is the production one, and what does it give you?
    public static object Pipeline_Production() => throw new NotImplementedException();

    // 5. Dictionary<CustomerId, decimal> where CustomerId is the class above.
    //    Something is badly wrong. What, and what are the three fixes?
    public static bool DemonstrateTheBug()
    {
        var a = new CustomerId { Value = 1 };
        var b = new CustomerId { Value = 1 };
        var d = new Dictionary<CustomerId, decimal> { [a] = 100m };
        return d.ContainsKey(b);       // what does this return, and why?
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
Console.WriteLine(Solution.DemonstrateTheBug());
// prints False - two "equal" ids are DIFFERENT keys. Explain why, then fix it.

try
{
    Console.WriteLine(Solution.GetOrders_Production().Count);
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
EOF
cat > "$DIR/Tests.cs" <<'EOF'
public static class Tests
{
    /*
     * 1. Add StringComparer.Ordinal (states intent, faster) and a capacity if known.
     *    For build-once/read-forever, ToFrozenDictionary.
     *
     * 2. If node ids are dense ints, bool[] beats HashSet - no hashing, contiguous
     *    memory. Otherwise HashSet, pre-sized.
     *
     * 3. IReadOnlyList<Order> - callers must not mutate your internal state.
     *
     * 4. Channel<WorkItem> (bounded). Gives async consumption, BACKPRESSURE, and
     *    completion signalling. A raw Queue needs a lock and gives you none of that.
     *
     * 5. CustomerId is a CLASS with no Equals/GetHashCode override, so the
     *    dictionary uses REFERENCE equality - two equal-looking ids are different
     *    keys, and DemonstrateTheBug() returns FALSE.
     *    Three fixes: make it a record (or readonly record struct); override
     *    Equals + GetHashCode; or pass an IEqualityComparer<CustomerId>.
     *
     * Test Case  After your fix, DemonstrateTheBug() must return TRUE.
     */
}
EOF
banner E29.5 "Interview answer vs production answer"

echo "Books 25-29 done."
