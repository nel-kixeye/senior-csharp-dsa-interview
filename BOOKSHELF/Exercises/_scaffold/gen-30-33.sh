#!/usr/bin/env bash
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
echo "Books 30-33"

# ---------------------------------------------------------------- Book 30
B=Book30-StringBuilder; G=Book30-StringBuilder.md

start_exercise $B E30.1-FixTheQuadraticConcat E30.1 $G Easy StringBuilder "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
using System.Text;

public record Row(int Id, string Name);

public static class Solution
{
    // Rewrite each. State the complexity BEFORE and AFTER.
    // ONE OF THESE SHOULD NOT USE StringBuilder - identify it.
    // And for B: what does the compiler actually emit? That decides whether it
    // needs fixing at all.

    public static string A_Broken(IEnumerable<string> names)
    {
        string csv = "";
        foreach (var name in names) csv += name + ",";
        return csv;
    }

    public static string B_Broken(string firstName, string lastName)
    {
        string full = "";
        full += firstName; full += " "; full += lastName;
        return full;
    }

    public static string C_Broken(IEnumerable<Row> rows)
    {
        string report = "";
        foreach (var row in rows) report += $"{row.Id}\t{row.Name}\n";
        return report;
    }

    public static string D_Broken()
    {
        string padded = "";
        for (int i = 0; i < 40; i++) padded += "-";
        return padded;
    }

    // --- your rewrites ---
    public static string A(IEnumerable<string> names) => throw new NotImplementedException();
    public static string B(string firstName, string lastName) => throw new NotImplementedException();
    public static string C(IEnumerable<Row> rows) => throw new NotImplementedException();
    public static string D() => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
using System.Diagnostics;

var names = Enumerable.Range(0, 20000).Select(i => $"name{i}").ToList();

var sw = Stopwatch.StartNew();
Solution.A_Broken(names);
Console.WriteLine($"A_Broken: {sw.ElapsedMilliseconds} ms");

try
{
    sw.Restart();
    Solution.A(names);
    Console.WriteLine($"A fixed:  {sw.ElapsedMilliseconds} ms");
    Console.WriteLine(Solution.D());   // expect 40 dashes
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
     * A  O(n^2) -> string.Join(",", names).
     *    THIS IS THE ONE THAT SHOULD NOT USE StringBuilder. Join is the direct
     *    expression of the operation, allocates once, and handles the trailing
     *    separator for free.
     *
     * B  ALREADY FINE. a + b + c in a single expression compiles to ONE
     *    string.Concat(a, b, c) call - one allocation. The quadratic problem is
     *    specifically repeated += ACROSS LOOP ITERATIONS. Leave it, or use
     *    interpolation.
     *
     * C  O(n^2) -> StringBuilder, ToString() once at the end. Pre-size if you can
     *    estimate the length.
     *
     * D  O(n^2) for no reason -> new string('-', 40).
     *
     * Test Case 1  A over 20,000 names: broken takes hundreds of ms, fixed is
     *              single-digit. Run Program.cs.
     * Test Case 2  A over an empty sequence -> "" (watch the trailing comma
     *              behaviour difference between your version and the broken one)
     * Test Case 3  D() -> exactly 40 '-' characters
     * Test Case 4  C over 0 rows -> ""
     * Test Case 5  B("Ada", "Lovelace") -> "Ada Lovelace"
     */
}
EOF
banner E30.1 "Fix the quadratic concatenation"

start_exercise $B E30.2-RunLengthEncoding E30.2 $G Medium StringBuilder "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
using System.Text;

public static class Solution
{
    // "aaabbc" -> "a3b2c1", and the decoder back again. O(n) each way.
    //
    // Pre-size the builder. What is a reasonable capacity guess, and why does
    // guessing badly cost more than not guessing?
    // Run lengths may exceed 9 - both directions must handle multi-digit counts.
    public static string Encode(string s)
    {
        throw new NotImplementedException();
    }

    public static string Decode(string encoded)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.Encode("aaabbc"));            // expect a3b2c1
    Console.WriteLine(Solution.Decode("a3b2c1"));            // expect aaabbc
    Console.WriteLine(Solution.Encode(new string('a', 12))); // expect a12
    Console.WriteLine(Solution.Decode("a12"));               // expect 12 a's
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
     * Test Case 1  Encode("aaabbc")  -> "a3b2c1"
     * Test Case 2  Decode("a3b2c1")  -> "aaabbc"
     *
     * Test Case 3 - MULTI-DIGIT run
     * Encode(12 a's) -> "a12";  Decode("a12") -> 12 a's
     *
     * Test Case 4 - NO REPEATS: output is LONGER than input
     * Encode("abc") -> "a1b1c1"
     *
     * Test Case 5 - empty and single
     * Encode("") -> "";  Encode("a") -> "a1"
     *
     * ROUND-TRIP CHECK: Decode(Encode(s)) == s for every case above.
     *
     * CAPACITY: s.Length is a reasonable neutral guess. Too small costs a
     * doubling copy each time it grows (O(log n) copies); too large just wastes
     * memory.
     */
}
EOF
banner E30.2 "Run-Length Encoding"

start_exercise $B E30.3-BacktrackingPath E30.3 $G Medium "StringBuilder + backtracking" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
using System.Text;

public class TreeNode
{
    public int val;
    public TreeNode? left;
    public TreeNode? right;
    public TreeNode(int val = 0, TreeNode? left = null, TreeNode? right = null)
    {
        this.val = val; this.left = left; this.right = right;
    }
}

public static class Solution
{
    // All root-to-leaf paths as strings like "1->2->5".
    // Use a SINGLE StringBuilder rather than concatenating a new string at
    // every node.
    //
    // What is the O(1) "undo" for sb.Append(text)? Write it.
    // Then: what makes the undo tricky when the appended text has VARIABLE
    // length (a multi-digit number)?
    public static IList<string> BinaryTreePaths(TreeNode? root)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
//    1
//   / \
//  2   3
//   \
//    5
var root = new TreeNode(1,
    new TreeNode(2, null, new TreeNode(5)),
    new TreeNode(3));

try
{
    foreach (var p in Solution.BinaryTreePaths(root)) Console.WriteLine(p);
    // expect  1->2->5  and  1->3
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
     * Test Case 1  [1,2,3,null,5]  -> { "1->2->5", "1->3" }
     * Test Case 2  [1]             -> { "1" }        (no arrow)
     * Test Case 3  null            -> { }
     *
     * Test Case 4 - MULTI-DIGIT values (the variable-length undo)
     * Tree 100 -> left 250 -> left 3
     * Expected: { "100->250->3" }
     * If your undo subtracts a fixed length, this breaks.
     *
     * Test Case 5 - a node with ONE child is not a leaf
     * Tree 1 -> left 2 (2 has no children)
     * Expected: { "1->2" } only - NOT { "1", "1->2" }
     *
     * THE UNDO: record the length BEFORE appending and restore it after:
     *     int mark = sb.Length;  sb.Append(...);  ...recurse...;  sb.Length = mark;
     * That is more robust than subtracting a computed length.
     */
}
EOF
banner E30.3 "Build the backtracking path"

start_exercise $B E30.4-ChooseTheRightTool E30.4 $G Medium "StringBuilder / judgment" "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
using System.Text;

public static class Solution
{
    // For each, name what you would use and REJECT the others with a reason.
    // Record the reasoning in Notes.txt, then implement.

    // 1. Join 50,000 names with ", ".
    public static string JoinNames(IEnumerable<string> names) => throw new NotImplementedException();

    // 2. Build "Hello, {name}!".
    public static string Greet(string name) => throw new NotImplementedException();

    // 3. Build a 10 MB XML document element by element.
    //    (Describe the approach in Notes.txt - there is a better answer than
    //    StringBuilder here too.)

    // 4. A fixed-format 16-character id where you know the exact length up front.
    public static string BuildId(int seed) => throw new NotImplementedException();

    // 5. Write a 500 MB CSV export to a file.
    //    (Describe in Notes.txt. The answer is "no string builder at all" - why?)

    // 6. Format a log message that may never be emitted because Debug is disabled.
    //    (See E30.5.)
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.JoinNames(["a", "b", "c"]));  // expect a, b, c
    Console.WriteLine(Solution.Greet("Ada"));                // expect Hello, Ada!
    Console.WriteLine(Solution.BuildId(42).Length);          // expect 16
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
     * 1. string.Join - one allocation, exact size. StringBuilder works but says less.
     * 2. Interpolation or + - ONE Concat call. StringBuilder here is SLOWER (its
     *    own allocation and setup) and noisier.
     * 3. StringBuilder for unknown length... but better still an XmlWriter over a
     *    STREAM, so you never hold 10 MB in memory.
     * 4. string.Create(16, state, (span, s) => { ... }) - writes directly into the
     *    final string's buffer. Zero intermediates.
     * 5. Write straight to a StreamWriter. Building a 500 MB string in memory
     *    first is the mistake - and on the Large Object Heap it is worse.
     * 6. Structured logging with a message template (E30.5).
     *
     * Test Case 1  JoinNames([]) -> ""
     * Test Case 2  JoinNames(["a"]) -> "a"   (no trailing separator)
     * Test Case 3  Greet("Ada") -> "Hello, Ada!"
     * Test Case 4  BuildId(...).Length == 16 exactly
     */
}
EOF
banner E30.4 "Choose the right tool"

start_exercise $B E30.5-TheLoggingTrap E30.5 $G Medium "Logging / allocation" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public record Item(int Id);
public record Order(int Id, List<Item> Items);
public record Customer(string Name);

// A minimal logger so this compiles without a DI container.
public interface ILoggerLike
{
    bool IsDebugEnabled { get; }
    void LogDebug(string message);
    void LogDebug(string template, params object[] args);
}

public static class Solution
{
    // THE SINGLE MOST COMMON REAL-WORLD VERSION OF THIS BOOK'S MISTAKE.
    //
    // In Notes.txt, explain what work happens here when Debug is DISABLED,
    // and why.
    public static void Log_Broken(ILoggerLike logger, Order order, Customer customer)
    {
        logger.LogDebug($"Processing order {order.Id} for customer {customer.Name} with {order.Items.Count} items");
    }

    // Rewrite it correctly.
    public static void Log(ILoggerLike logger, Order order, Customer customer)
    {
        throw new NotImplementedException();
    }

    // Then answer: name the SECOND benefit the correct form gives you that has
    // nothing to do with performance.
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
// A logger with Debug DISABLED, that counts how much formatting work reached it.
class CountingLogger : ILoggerLike
{
    public int PrebuiltStringsReceived;
    public int TemplateCallsReceived;

    public bool IsDebugEnabled => false;

    public void LogDebug(string message) => PrebuiltStringsReceived++;

    public void LogDebug(string template, params object[] args) => TemplateCallsReceived++;
}

var logger = new CountingLogger();
var order = new Order(1, [new Item(1), new Item(2)]);
var customer = new Customer("Ada");

Solution.Log_Broken(logger, order, customer);
Console.WriteLine($"broken: built a full string even though Debug is off " +
                  $"({logger.PrebuiltStringsReceived} interpolations performed)");

try
{
    Solution.Log(logger, order, customer);
    Console.WriteLine($"fixed:  passed a template + args ({logger.TemplateCallsReceived} call)");
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
     * WHAT HAPPENS
     * The interpolated string is built EAGERLY, before LogDebug is called. So
     * you pay the formatting, the allocation, and the customer.Name property
     * access even though the message is immediately discarded. On a hot path
     * that is pure waste.
     *
     * CORRECT FORM
     *   logger.LogDebug("Processing order {OrderId} for customer {CustomerName} with {ItemCount} items",
     *                   order.Id, customer.Name, order.Items.Count);
     * The template and arguments are passed separately; formatting happens only
     * if the level is enabled.
     * (.NET 6+ interpolated-string handlers make LogDebug($"...") lazy too - but
     * the template form is still preferred, for the reason below.)
     *
     * THE SECOND BENEFIT: STRUCTURED LOGGING.
     * The arguments are captured as NAMED FIELDS, so your log platform can index
     * and query on OrderId rather than regex-matching a flat string. That is
     * worth more than the performance.
     *
     * Test Case  Run Program.cs. The broken call performs the interpolation even
     * with IsDebugEnabled == false; yours must not.
     */
}
EOF
banner E30.5 "The logging trap"

# ---------------------------------------------------------------- Book 31
B=Book31-Span-Memory; G=Book31-Span-Memory.md

start_exercise $B E31.1-ParseWithoutAllocating E31.1 $G Medium "Span / parsing" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Count the allocations in the naive version for a line with k fields,
    // then write the span version. Target: ZERO allocations.
    public static long Total_Broken(string line)
    {
        long total = 0;
        foreach (var part in line.Split(','))
            total += int.Parse(part);
        return total;
    }

    public static long Total(string line)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
using System.Diagnostics;

var line = string.Join(",", Enumerable.Range(1, 100000));

var before = GC.GetTotalAllocatedBytes();
var sw = Stopwatch.StartNew();
var a = Solution.Total_Broken(line);
Console.WriteLine($"broken: {a}  {sw.ElapsedMilliseconds} ms  " +
                  $"{(GC.GetTotalAllocatedBytes() - before) / 1024} KB allocated");

try
{
    before = GC.GetTotalAllocatedBytes();
    sw.Restart();
    var b = Solution.Total(line);
    Console.WriteLine($"fixed:  {b}  {sw.ElapsedMilliseconds} ms  " +
                      $"{(GC.GetTotalAllocatedBytes() - before) / 1024} KB allocated");
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
     * ALLOCATIONS IN THE NAIVE VERSION for k fields:
     *   one string[] array PLUS one string per field = k + 1 allocations,
     *   all immediately garbage. For 100,000 fields that is several MB.
     *
     * SPAN VERSION (.NET 8+):
     *   ReadOnlySpan<char> s = line;
     *   foreach (var range in s.Split(','))     // allocation-free enumerator
     *       total += int.Parse(s[range]);       // parses the slice in place
     *
     * Pre-.NET 8: walk manually with s.IndexOf(','), slice, parse, re-slice.
     *
     * Test Case 1  "1,2,3"        -> 6
     * Test Case 2  "42"           -> 42   (single field, no comma)
     * Test Case 3  ""             -> 0    (decide and document the behaviour)
     * Test Case 4  "-1,-2"        -> -3   (negatives)
     * Test Case 5  Run Program.cs - the fixed version should allocate
     *              essentially nothing while producing the same total.
     */
}
EOF
banner E31.1 "Parse without allocating"

start_exercise $B E31.2-SubstringInALoop E31.2 $G Medium "Span / slicing" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Find the first index where `target` occurs.
    public static int Find_Broken(string line, string target)
    {
        for (int i = 0; i + target.Length <= line.Length; i++)
            if (line.Substring(i, target.Length) == target)
                return i;
        return -1;
    }

    // 1. Rewrite with NO allocation (same loop shape).
    public static int Find_Span(string line, string target) => throw new NotImplementedException();

    // 2. Then: name the BCL method that makes the whole loop unnecessary, and
    //    say what it does that a hand-written loop probably does not.
    //    (Hint: it is about how many characters the CPU compares at once.)
    public static int Find_Bcl(string line, string target) => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
using System.Diagnostics;

var line = new string('a', 200000) + "needle";
const string target = "needle";

var before = GC.GetTotalAllocatedBytes();
var sw = Stopwatch.StartNew();
Console.WriteLine($"broken: {Solution.Find_Broken(line, target)}  {sw.ElapsedMilliseconds} ms  " +
                  $"{(GC.GetTotalAllocatedBytes() - before) / 1024} KB");

try
{
    before = GC.GetTotalAllocatedBytes();
    sw.Restart();
    Console.WriteLine($"span:   {Solution.Find_Span(line, target)}  {sw.ElapsedMilliseconds} ms  " +
                      $"{(GC.GetTotalAllocatedBytes() - before) / 1024} KB");

    sw.Restart();
    Console.WriteLine($"bcl:    {Solution.Find_Bcl(line, target)}  {sw.ElapsedMilliseconds} ms");
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
     * SPAN REWRITE
     *   if (line.AsSpan(i, target.Length).SequenceEqual(target))
     * AsSpan is O(1) and allocates nothing, where Substring allocated a new
     * string EVERY iteration.
     *
     * THE BCL METHOD
     *   line.IndexOf(target, StringComparison.Ordinal)
     *   (or line.AsSpan().IndexOf(target))
     * It is VECTORIZED: it compares 16 or 32 characters per SIMD instruction
     * instead of one per iteration, and uses a tuned search algorithm. A
     * hand-written loop gets neither.
     *
     * Test Case 1  found at the end of a 200k string - all three agree
     * Test Case 2  target absent            -> -1
     * Test Case 3  target at index 0        -> 0
     * Test Case 4  target longer than line  -> -1
     * Test Case 5  empty target             -> 0 (decide and document)
     */
}
EOF
banner E31.2 "Substring in a loop"

start_exercise $B E31.3-StackallocFrequency E31.3 $G Medium "Span / stackalloc" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Rewrite the anagram check to use stackalloc instead of a Dictionary.
    public static bool IsAnagram_Dictionary(string s, string t)
    {
        if (s.Length != t.Length) return false;
        var counts = new Dictionary<char, int>();
        foreach (var c in s) counts[c] = counts.GetValueOrDefault(c) + 1;
        foreach (var c in t)
        {
            if (!counts.TryGetValue(c, out var n) || n == 0) return false;
            counts[c] = n - 1;
        }
        return true;
    }

    public static bool IsAnagram(string s, string t) => throw new NotImplementedException();

    // THESE MATTER MORE THAN THE REWRITE. Answer in Notes.txt:
    //   1. Why is stackalloc inside a LOOP dangerous, and what is the failure mode?
    //   2. Write the guard pattern for a buffer whose size depends on input.
    //   3. What is a safe upper bound for a stackalloc, roughly, in bytes?

    // Implement the guard pattern here.
    public static int CountDistinct(ReadOnlySpan<char> input, int alphabetSize)
        => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.IsAnagram("anagram", "nagaram"));  // expect True
    Console.WriteLine(Solution.IsAnagram("rat", "car"));          // expect False
    Console.WriteLine(Solution.CountDistinct("hello", 128));      // expect 4
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
     * REWRITE:  Span<int> count = stackalloc int[26];  index with c - 'a'.
     * Zero allocation, better locality than a Dictionary.
     *
     * 1. THE DANGER: stack memory is NOT reclaimed until the METHOD returns, so
     *    a stackalloc inside a loop accumulates every iteration. The failure is
     *    StackOverflowException, which in .NET CANNOT BE CAUGHT - the process dies.
     *
     * 2. THE GUARD:
     *      Span<char> buf = len <= 256 ? stackalloc char[256] : new char[len];
     *    Small and bounded on the stack; anything larger falls back to the heap.
     *
     * 3. SAFE BOUND: under about 1 KB. The default thread stack is 1 MB total and
     *    you share it with every frame below you.
     *
     * Test Case 1  IsAnagram("anagram","nagaram") -> true
     * Test Case 2  IsAnagram("aab","abb")         -> false
     * Test Case 3  IsAnagram("","")               -> true
     * Test Case 4  CountDistinct("hello", 128)    -> 4  (h, e, l, o)
     * Test Case 5  CountDistinct over a 10,000-char input must use the HEAP
     *              branch of your guard, not stackalloc.
     */
}
EOF
banner E31.3 "The stack-allocated frequency buffer"

start_exercise $B E31.4-RentInsteadOfAllocate E31.4 $G Medium "ArrayPool" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
using System.Buffers;

public static class Solution
{
    // 10,000 messages/second, each needing a temporary 64 KB byte[].
    public static int Process_Broken(ReadOnlySpan<byte> message)
    {
        var buffer = new byte[65536];
        message.CopyTo(buffer);
        return buffer.Length;
    }

    // Rewrite with ArrayPool<byte>.Shared.
    //
    // THREE things you must get right - answer in Notes.txt before coding:
    //   - one about the returned array's SIZE
    //   - one about its CONTENTS
    //   - one about WHEN you give it back
    //
    // Then: why does 64 KB matter specifically? What threshold is it near, and
    // what changes above that threshold?
    public static int Process(ReadOnlySpan<byte> message) => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
var message = new byte[1024];
Random.Shared.NextBytes(message);

var before = GC.GetTotalAllocatedBytes();
for (int i = 0; i < 1000; i++) Solution.Process_Broken(message);
Console.WriteLine($"broken: {(GC.GetTotalAllocatedBytes() - before) / 1024 / 1024} MB allocated");

try
{
    before = GC.GetTotalAllocatedBytes();
    for (int i = 0; i < 1000; i++) Solution.Process(message);
    Console.WriteLine($"pooled: {(GC.GetTotalAllocatedBytes() - before) / 1024} KB allocated");
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
     * THE PATTERN
     *   byte[] buffer = ArrayPool<byte>.Shared.Rent(65536);
     *   try     { var span = buffer.AsSpan(0, 65536); ... }
     *   finally { ArrayPool<byte>.Shared.Return(buffer); }
     *
     * THE THREE THINGS
     *   1. SIZE: Rent may return an array LARGER than requested. Always slice to
     *      the length you asked for; never trust buffer.Length.
     *   2. CONTENTS: the array is NOT cleared - it holds whatever the previous
     *      renter left. Overwrite before reading, or pass clearArray: true to
     *      Return if it held sensitive data.
     *   3. WHEN: return it in a finally, EXACTLY ONCE. Returning twice, or using
     *      it after returning, is a corruption bug that surfaces far from its cause.
     *
     * WHY 64 KB: it is close to the 85,000-byte LARGE OBJECT HEAP threshold.
     * Arrays at or above that go on the LOH, collected only with gen2 and not
     * compacted by default - so churning them fragments the heap. Pooling avoids
     * both the allocation and the fragmentation.
     *
     * Test Case  Run Program.cs. 1,000 iterations: broken allocates ~64 MB;
     * pooled should allocate almost nothing.
     */
}
EOF
banner E31.4 "Rent instead of allocate"

start_exercise $B E31.5-WhyWontThisCompile E31.5 $G Medium "Span / ref struct rules" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Each of the four below FAILS to compile (they are commented out so this
    // file builds). Uncomment them one at a time to see the error.
    //
    // ALL FOUR HAVE THE SAME UNDERLYING CAUSE. Name it ONCE in Notes.txt, then
    // say how each one manifests it, and give a fix.

    // --- A ---
    // class Parser { private ReadOnlySpan<char> _buffer; }

    // --- B ---
    // static async Task<int> CountAsync(ReadOnlySpan<char> text)
    // {
    //     await Task.Delay(1);
    //     return text.Length;
    // }

    // --- C ---
    // static IEnumerable<int> Lengths(ReadOnlySpan<char> s) { yield return s.Length; }

    // --- D ---
    // static Span<char> Build()
    // {
    //     Span<char> buf = stackalloc char[64];
    //     buf[0] = 'x';
    //     return buf;
    // }

    // Now write WORKING versions of B and D.
    public static Task<int> CountAsync(ReadOnlyMemory<char> text) => throw new NotImplementedException();

    public static char[] Build() => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.CountAsync("hello".AsMemory()).Result);  // expect 5
    Console.WriteLine(new string(Solution.Build()).TrimEnd('\0'));      // expect x
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
     * THE ONE CAUSE
     * Span<T> and ReadOnlySpan<T> are REF STRUCTS. They are guaranteed to live
     * only on the stack, so they can never be stored anywhere that might outlive
     * or escape the current stack frame.
     *
     * A  a class FIELD lives on the heap.
     *    Fix: store ReadOnlyMemory<char>, call .Span at the point of use.
     *
     * B  an async method's locals are hoisted into a heap-allocated STATE MACHINE.
     *    Fix: take ReadOnlyMemory<char>, convert inside the synchronous portion.
     *
     * C  an iterator compiles into a heap-allocated state machine, same as async.
     *    Fix: return a materialized collection, or use a custom ref struct enumerator.
     *
     * D  the stackalloc buffer DIES when Build returns - the span would dangle.
     *    The compiler catches this.
     *    Fix: return char[], or accept a caller-provided Span<char> destination.
     *
     * Test Case 1  CountAsync("hello".AsMemory()) -> 5
     * Test Case 2  Build()[0] == 'x'
     * Test Case 3  Uncomment each of A-D in turn and READ THE COMPILER ERROR.
     *              That is the actual exercise.
     */
}
EOF
banner E31.5 "Why won't this compile?"

# ---------------------------------------------------------------- Book 32
B=Book32-DateTime; G=Book32-DateTime.md

start_exercise $B E32.1-PickTheType E32.1 $G Easy "DateTime / type choice" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // For each, name the TYPE and one bug the WRONG choice would cause.
    // Record in Notes.txt, then declare the property you would actually write.
    //
    //  1. A user's date of birth.
    //  2. When an audit log entry was written.
    //  3. A store's daily opening time (09:00, every day).
    //  4. How long a request took to process.
    //  5. A subscription's expiry, for a service with users worldwide.
    //  6. A public holiday in a specific country.
    //  7. A meeting scheduled for "3pm Tokyo time next Tuesday".
    //
    // #7 IS THE HARD ONE. "Store UTC" is not a complete answer. Say why a
    // FUTURE scheduled local time differs from a PAST timestamp.

    public static object DateOfBirth() => throw new NotImplementedException();
    public static object AuditTimestamp() => throw new NotImplementedException();
    public static object OpeningTime() => throw new NotImplementedException();
    public static object RequestDuration() => throw new NotImplementedException();
    public static object SubscriptionExpiry() => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
// This one is answered in Notes.txt. Then implement the five stubs.
Console.WriteLine("Answer the 7 scenarios in Notes.txt, then compare with Tests.cs.");

try
{
    Console.WriteLine(Solution.DateOfBirth().GetType().Name);   // expect DateOnly
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
     * 1. DateOnly        - a DateTime introduces a time and zone that do not exist;
     *                      a zone conversion can shift someone's birthday by a day.
     * 2. DateTimeOffset (UTC) - DateTime.Now records SERVER-LOCAL time, so two
     *                      servers in different regions disagree about the same
     *                      instant and your log ordering breaks.
     * 3. TimeOnly        - a DateTime forces you to invent an arbitrary date.
     * 4. TimeSpan, measured with STOPWATCH - subtracting two DateTime.Now values
     *                      can go NEGATIVE when NTP corrects the clock.
     * 5. DateTimeOffset  - an unambiguous instant, comparable across zones.
     * 6. DateOnly        - a calendar date, not a moment.
     * 7. Store the LOCAL TIME PLUS THE IANA ZONE ID ("Asia/Tokyo"), not just UTC.
     *    WHY: if that zone's DST rules change between now and then, the correct
     *    UTC instant changes - but "3pm Tokyo time" is still what the user meant.
     *    Past timestamps are INSTANTS; future scheduled local times are INTENTIONS.
     */
}
EOF
banner E32.1 "Pick the type"

start_exercise $B E32.2-ParseSafely E32.2 $G Medium "DateTime / parsing" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
using System.Globalization;

public static class Solution
{
    // A partner API sends timestamps in the FIXED format 2026-09-01T14:30:00Z.
    // Name THREE separate problems with this line, then rewrite it.
    public static DateTime Parse_Broken(string timestamp)
    {
        return DateTime.Parse(timestamp);
    }

    public static bool TryParseApiTimestamp(string input, out DateTimeOffset result)
        => throw new NotImplementedException();

    // The same partner also sends USER-ENTERED dates in a dd/MM/yyyy field.
    // What changes, and what must you NOT do?
    public static bool TryParseUserDate(string input, out DateOnly result)
        => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
using System.Globalization;
using System.Threading;

Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
Console.WriteLine(Solution.Parse_Broken("01/02/2026"));   // January 2 in en-US

Thread.CurrentThread.CurrentCulture = new CultureInfo("en-GB");
Console.WriteLine(Solution.Parse_Broken("01/02/2026"));   // FEBRUARY 1 in en-GB - same string!

try
{
    Console.WriteLine(Solution.TryParseApiTimestamp("2026-09-01T14:30:00Z", out var ts) ? ts.ToString("O") : "reject");
    Console.WriteLine(Solution.TryParseApiTimestamp("garbage", out _) ? "parsed" : "rejected");  // expect rejected
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
     * THREE PROBLEMS with DateTime.Parse(timestamp):
     *   1. Parse THROWS on malformed input instead of letting you handle it.
     *   2. It interprets format by CURRENT CULTURE, so behaviour varies by machine.
     *      (Run Program.cs: "01/02/2026" is a different date in en-US and en-GB.)
     *   3. DateTime loses the offset - the 'Z' is discarded into an ambiguous Kind.
     *
     * REWRITE
     *   DateTimeOffset.TryParseExact(input, "yyyy-MM-dd'T'HH:mm:ssK",
     *       CultureInfo.InvariantCulture, DateTimeStyles.None, out result)
     *
     * USER-ENTERED dd/MM/yyyy: still TryParse, still explicit - but the format is
     * genuinely ambiguous to a human, so use ParseExact with the format you
     * DOCUMENTED, and do NOT fall back to CurrentCulture parsing.
     *
     * Test Case 1  "2026-09-01T14:30:00Z"  -> parses, offset preserved
     * Test Case 2  "garbage"               -> returns false, does not throw
     * Test Case 3  ""                      -> returns false
     * Test Case 4  "01/02/2026" as a user date with dd/MM/yyyy -> 1 February
     * Test Case 5  the API parse must give the SAME result under en-US and tr-TR
     */
}
EOF
banner E32.2 "Parse safely"

start_exercise $B E32.3-BusinessDays E32.3 $G Medium "DateOnly / arithmetic" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Weekdays (Mon-Fri) between two dates, excluding a set of holidays.
    //
    // Which TYPE should the parameters be? Decide before writing.
    // The naive version loops day by day - for a 10-year range that is 3,650
    // iterations, and this may be called in a loop.
    // Can you do the FULL WEEKS arithmetically and only loop over the remainder?
    //
    // Decide and DOCUMENT whether the bounds are inclusive.
    // TRAP: a holiday that falls on a weekend must not be double-counted.
    public static int BusinessDaysBetween(DateOnly start, DateOnly end, ISet<DateOnly> holidays)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
var holidays = new HashSet<DateOnly>
{
    new(2026, 1, 1),    // Thursday
    new(2026, 1, 3)     // SATURDAY - must not be double-counted
};

try
{
    // Mon 2026-01-05 .. Fri 2026-01-09, no holidays in range
    Console.WriteLine(Solution.BusinessDaysBetween(new(2026, 1, 5), new(2026, 1, 9), holidays));  // expect 5

    // Thu 2026-01-01 .. Fri 2026-01-02, one weekday holiday
    Console.WriteLine(Solution.BusinessDaysBetween(new(2026, 1, 1), new(2026, 1, 2), holidays));  // expect 1
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
     * (Assuming INCLUSIVE bounds - document whichever you choose.)
     *
     * Test Case 1  Mon 2026-01-05 .. Fri 2026-01-09, no holidays  -> 5
     * Test Case 2  Sat 2026-01-03 .. Sun 2026-01-04               -> 0
     * Test Case 3  same day, a Wednesday                          -> 1
     * Test Case 4  start AFTER end                                -> 0
     *
     * Test Case 5 - THE DOUBLE-COUNT TRAP
     * A holiday falling on a SATURDAY must not be subtracted - it was never
     * counted. With holidays { 2026-01-03 (Sat) } over Mon 01-05 .. Fri 01-09
     * the answer is still 5.
     *
     * THE ARITHMETIC SHORTCUT
     *   int totalDays = end.DayNumber - start.DayNumber + 1;
     *   int businessDays = (totalDays / 7) * 5;
     *   // then loop over only the remaining (totalDays % 7) days - at most 6
     *   // finally subtract holidays in range that fall on a WEEKDAY
     */
}
EOF
banner E32.3 "Business days between two dates"

start_exercise $B E32.4-OverlapAcrossTimeZones E32.4 $G Medium "DateTimeOffset / intervals" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Two meetings, one created by a user in Tokyo, the other in London.
    //
    // What TYPE must the inputs be for this to be answerable at all?
    // Say what goes wrong if they are DateTime with Kind = Unspecified.
    public static bool Overlaps(DateTimeOffset aStart, DateTimeOffset aEnd,
                                DateTimeOffset bStart, DateTimeOffset bEnd)
    {
        throw new NotImplementedException();
    }

    // Then answer in Notes.txt: name a specific DATE on which a naive
    // local-time comparison breaks even WITHIN A SINGLE zone, and why.
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
// 14:00-15:00 Tokyo (UTC+9)  vs  14:00-15:00 London (UTC+0)
var tokyoStart  = new DateTimeOffset(2026, 9, 1, 14, 0, 0, TimeSpan.FromHours(9));
var tokyoEnd    = new DateTimeOffset(2026, 9, 1, 15, 0, 0, TimeSpan.FromHours(9));
var londonStart = new DateTimeOffset(2026, 9, 1, 14, 0, 0, TimeSpan.Zero);
var londonEnd   = new DateTimeOffset(2026, 9, 1, 15, 0, 0, TimeSpan.Zero);

try
{
    Console.WriteLine(Solution.Overlaps(tokyoStart, tokyoEnd, londonStart, londonEnd));
    // expect False - they are 9 hours apart, despite both reading "14:00"
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
     * THE TYPE: DateTimeOffset (or UTC DateTime). With Kind = Unspecified the
     * values carry NO ZONE, so "is 14:00 before 15:00" is unanswerable - 14:00
     * Tokyo is EARLIER than 15:00 London by 8 hours, not 1.
     *
     * THE CHECK:  aStart < bEnd && bStart < aEnd
     * (the same half-open test as Book 22, applied to INSTANTS)
     *
     * Test Case 1  14:00-15:00 Tokyo vs 14:00-15:00 London  -> false (9h apart)
     * Test Case 2  same instant expressed in two zones       -> true
     * Test Case 3  TOUCHING: a ends exactly when b starts    -> false (half-open)
     * Test Case 4  a fully contains b                        -> true
     * Test Case 5  identical intervals                       -> true
     *
     * THE SINGLE-ZONE BREAK: a DST transition day. In the US spring-forward,
     * local times between 02:00 and 03:00 DO NOT EXIST; in autumn, 01:00-02:00
     * occurs TWICE. A local-time comparison on those days can order two events
     * wrongly, or find an overlap that did not happen.
     */
}
EOF
banner E32.4 "Overlap across time zones"

start_exercise $B E32.5-MakeItTestable E32.5 $G Medium "TimeProvider / design" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public record Subscription(int Id, DateTimeOffset ExpiresAt);

public static class Solution
{
    // THIS IS CORRECT AND UNTESTABLE.
    //
    // In Notes.txt, explain why you cannot write a reliable unit test for the
    // boundary, for DST behaviour, or for "expires in 5 minutes" logic.
    public static bool IsExpired_Broken(Subscription sub) => DateTimeOffset.UtcNow > sub.ExpiresAt;

    // Fix 1: pass the current time in.
    public static bool IsExpired(Subscription sub, DateTimeOffset now)
        => throw new NotImplementedException();

    // Fix 2: inject a clock.
    public static bool IsExpired(Subscription sub, TimeProvider timeProvider)
        => throw new NotImplementedException();

    // Then: name the .NET 8+ type built for exactly this, and ONE thing it gives
    // you beyond a hand-rolled IClock.
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
var sub = new Subscription(1, new DateTimeOffset(2026, 9, 1, 12, 0, 0, TimeSpan.Zero));

try
{
    // Now you can test the boundary EXACTLY, with no waiting and no flakiness.
    Console.WriteLine(Solution.IsExpired(sub, new DateTimeOffset(2026, 9, 1, 11, 59, 59, TimeSpan.Zero))); // False
    Console.WriteLine(Solution.IsExpired(sub, new DateTimeOffset(2026, 9, 1, 12, 0, 0,  TimeSpan.Zero))); // False (not >)
    Console.WriteLine(Solution.IsExpired(sub, new DateTimeOffset(2026, 9, 1, 12, 0, 1,  TimeSpan.Zero))); // True
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
     * WHY IT IS UNTESTABLE
     * DateTimeOffset.UtcNow is a STATIC, AMBIENT dependency. To test "expires in
     * 5 minutes" you would have to change the system clock or wait five minutes.
     * Boundary and DST cases are effectively untestable, and any test you do
     * write is time-dependent and flaky.
     *
     * THE TYPE: TimeProvider (.NET 8+).
     * Beyond an IClock, it also abstracts TIMERS and Task.Delay - so
     * FakeTimeProvider lets you test retry backoff, timeouts, and scheduled work
     * by ADVANCING VIRTUAL TIME instantly, not just answering "what time is it".
     *
     * Test Case 1  now one second BEFORE expiry -> false
     * Test Case 2  now EXACTLY at expiry        -> false  (the comparison is >)
     * Test Case 3  now one second AFTER expiry  -> true
     * Test Case 4  expiry far in the future     -> false
     * Test Case 5  with FakeTimeProvider, advance past expiry and re-check
     *              -> flips from false to true, deterministically
     */
}
EOF
banner E32.5 "Make it testable"

# ---------------------------------------------------------------- Book 33
B=Book33-BuiltInMethods; G=Book33-BuiltInMethods.md

start_exercise $B E33.1-DeleteTheReinventedWheel E33.1 $G Easy "BCL / rewrite" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Replace each with a BCL call. For each, say whether the hand-rolled
    // version is merely LONGER or actually WRONG in some case.
    // G and H are the two that are genuinely WRONG. Find out why.

    public static int A_Broken(int[] arr) { int max = arr[0]; foreach (var x in arr) if (x > max) max = x; return max; }
    public static void B_Broken(int[] a) { int n = a.Length; for (int i = 0; i < n / 2; i++) (a[i], a[n-1-i]) = (a[n-1-i], a[i]); }
    public static int C_Broken(int v, int min, int max) => v < min ? min : (v > max ? max : v);
    public static void D_Broken(int[] arr) { for (int i = 0; i < arr.Length; i++) arr[i] = -1; }
    public static bool E_Broken(int[] a, int[] b)
    {
        bool same = a.Length == b.Length;
        if (same) for (int i = 0; i < a.Length; i++) if (a[i] != b[i]) { same = false; break; }
        return same;
    }
    public static List<List<int>> F_Broken(List<int> items)
    {
        var batches = new List<List<int>>();
        for (int i = 0; i < items.Count; i += 100) batches.Add(items.GetRange(i, Math.Min(100, items.Count - i)));
        return batches;
    }
    public static (int q, int r) G_Broken(int a, int b) { int q = a / b; int r = a - q * b; return (q, r); }
    public static List<int> H_Broken(List<int> items) => items.OrderBy(_ => Guid.NewGuid()).ToList();

    // --- your replacements ---
    public static int A(int[] arr) => throw new NotImplementedException();
    public static void B(int[] a) => throw new NotImplementedException();
    public static int C(int v, int min, int max) => throw new NotImplementedException();
    public static void D(int[] arr) => throw new NotImplementedException();
    public static bool E(int[] a, int[] b) => throw new NotImplementedException();
    public static IEnumerable<int[]> F(List<int> items) => throw new NotImplementedException();
    public static (int q, int r) G(int a, int b) => throw new NotImplementedException();
    public static void H(List<int> items) => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.A([3, 9, 2]));            // expect 9
    Console.WriteLine(Solution.C(15, 0, 10));           // expect 10
    Console.WriteLine(Solution.E([1, 2], [1, 2]));      // expect True
    Console.WriteLine(Solution.F(Enumerable.Range(1, 250).ToList()).Count()); // expect 3
    Console.WriteLine(Solution.G(-7, 2));               // expect (-3, -1)
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
     * A  arr.Max()                 - merely longer
     * B  Array.Reverse(a)          - merely longer
     * C  Math.Clamp(v, min, max)   - merely longer
     * D  Array.Fill(arr, -1)       - merely longer
     * E  a.SequenceEqual(b)        - longer AND slower (the BCL span version is
     *                                VECTORIZED; your loop is not)
     * F  items.Chunk(100)          - merely longer
     *
     * G  WRONG. For negative operands the truncation makes this subtly
     *    inconsistent with %, and it does an extra multiply.
     *    Use Math.DivRem(a, b, out int r).
     *
     * H  WRONG. OrderBy with a random key is NOT a uniform shuffle - the
     *    comparison sort with an inconsistent key produces a BIASED distribution,
     *    and can throw InvalidOperationException for an inconsistent comparer.
     *    Use Random.Shared.Shuffle(CollectionsMarshal.AsSpan(items)) (.NET 8+),
     *    or hand-written Fisher-Yates.
     *
     * Test Case 1  A([3,9,2]) -> 9;  A([]) should behave sensibly (Max throws -
     *              decide what you want)
     * Test Case 2  C(15, 0, 10) -> 10; C(-5, 0, 10) -> 0
     * Test Case 3  F over 250 items in chunks of 100 -> 3 batches (100,100,50)
     * Test Case 4  G(-7, 2) -> quotient -3, remainder -1
     * Test Case 5  H over 1..10, run 1000 times: every element should land in
     *              every position roughly equally. A biased shuffle will not.
     */
}
EOF
banner E33.1 "Delete the reinvented wheel"

start_exercise $B E33.2-TheRoundingTrap E33.2 $G Easy "Math.Round / decimal" "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // PREDICT each output in Notes.txt, THEN run Program.cs.
    //
    //   Math.Round(2.5)
    //   Math.Round(3.5)
    //   Math.Round(2.5, MidpointRounding.AwayFromZero)
    //   Math.Round(2.675, 2)
    //   (int)(2.7)
    //   Math.Floor(-2.1)
    //   (int)(-2.7)
    //
    // Then: name the default behaviour.
    // Then: which would you use for a CURRENCY amount, and what TYPE should that
    // amount be in the first place?

    // Round a money amount the way most financial rules require.
    public static decimal RoundMoney(decimal amount) => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
Console.WriteLine(Math.Round(2.5));                                   // ?
Console.WriteLine(Math.Round(3.5));                                   // ?
Console.WriteLine(Math.Round(2.5, MidpointRounding.AwayFromZero));    // ?
Console.WriteLine(Math.Round(2.675, 2));                              // ?
Console.WriteLine((int)2.7);                                          // ?
Console.WriteLine(Math.Floor(-2.1));                                  // ?
Console.WriteLine((int)(-2.7));                                       // ?

try
{
    Console.WriteLine(Solution.RoundMoney(2.675m));   // expect 2.68
    Console.WriteLine(Solution.RoundMoney(2.5m));     // expect 2.5 -> depends on your rule
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
     * THE ANSWERS
     *   Math.Round(2.5)                            -> 2     (!)
     *   Math.Round(3.5)                            -> 4
     *   Math.Round(2.5, MidpointRounding.AwayFromZero) -> 3
     *   Math.Round(2.675, 2)                       -> 2.67  (!) binary representation
     *   (int)(2.7)                                 -> 2     truncation, not rounding
     *   Math.Floor(-2.1)                           -> -3
     *   (int)(-2.7)                                -> -2    truncates toward ZERO
     *
     * THE DEFAULT IS BANKER'S ROUNDING (round-half-to-even). It reduces
     * cumulative bias across many roundings, which is why it is the default, and
     * it surprises everyone the first time.
     *
     * CURRENCY: use DECIMAL, not double - 2.675 is not exactly representable in
     * binary floating point, which is why that line rounds "wrong". Then
     * Math.Round(amount, 2, MidpointRounding.AwayFromZero) if your domain
     * requires schoolbook rounding (many financial rules do - check which).
     *
     * Test Case  RoundMoney(2.675m) -> 2.68  (with decimal it works; with double it does not)
     */
}
EOF
banner E33.2 "The rounding trap"

start_exercise $B E33.3-RandomnessPitfalls E33.3 $G Medium "Random / correctness" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
using System.Security.Cryptography;
using System.Runtime.InteropServices;

public static class Solution
{
    // Each has a REAL bug. Name it and fix it.

    // A
    public static List<int> A_Broken()
    {
        var results = new List<int>();
        for (int i = 0; i < 1000; i++) { var r = new Random(); results.Add(r.Next(100)); }
        return results;
    }

    // B - generating a password reset token
    public static string B_Broken() => new Random().Next(100000, 999999).ToString();

    // C - shuffling a deck
    public static void C_Broken(List<int> cards) => cards.Sort((x, y) => Random.Shared.Next(-1, 2));

    // D - called from multiple threads
    private static readonly Random _rng = new();
    public static int D_Broken() => _rng.Next(1, 7);

    // --- your fixes ---
    public static List<int> A() => throw new NotImplementedException();
    public static string B() => throw new NotImplementedException();
    public static void C(List<int> cards) => throw new NotImplementedException();
    public static int D() => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var cards = Enumerable.Range(1, 10).ToList();
    Solution.C(cards);
    Console.WriteLine(string.Join(", ", cards));
    Console.WriteLine(cards.OrderBy(x => x).SequenceEqual(Enumerable.Range(1, 10)));  // expect True
    Console.WriteLine(Solution.B().Length >= 6);                                       // expect True
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
     * A  new Random() seeded from the clock; instances created in a tight loop can
     *    get the SAME SEED and produce identical sequences.
     *    Fix: Random.Shared. (On .NET 6+ the parameterless ctor is
     *    thread-safe-seeded, so it is less catastrophic than it was - but still
     *    wasteful and still wrong in spirit.)
     *
     * B  Random is NOT cryptographically secure - a reset token from it is
     *    PREDICTABLE.
     *    Fix: RandomNumberGenerator.GetInt32(...), or better, a longer token from
     *    RandomNumberGenerator.GetBytes.
     *
     * C  A comparator returning random values is INCONSISTENT; the sort may throw
     *    InvalidOperationException and, when it does not, the result is BIASED.
     *    Fix: Random.Shared.Shuffle(CollectionsMarshal.AsSpan(cards)).
     *
     * D  Random INSTANCE METHODS ARE NOT THREAD-SAFE; concurrent calls can corrupt
     *    its internal state and make it return zeros forever.
     *    Fix: Random.Shared (thread-safe since .NET 6), or [ThreadStatic] instances.
     *
     * Test Case 1  C over 1..10 must still contain exactly 1..10 afterwards
     * Test Case 2  C run 1000 times: each element lands in each position roughly
     *              equally. A biased shuffle will not.
     * Test Case 3  B must not be guessable from a timestamp
     * Test Case 4  D called from 1000 parallel threads must always return 1..6
     */
}
EOF
banner E33.3 "Randomness pitfalls"

start_exercise $B E33.4-NameTheMethod E33.4 $G Easy "BCL / recall drill" "10 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // A RECALL DRILL. No searching. Write the BCL member for each description
    // in Notes.txt, then check against Tests.cs.
    //
    //  1. Restrict a value to a range.
    //  2. Quotient and remainder in one call.
    //  3. Split a sequence into fixed-size batches.
    //  4. Return the element with the largest key, not the key itself.
    //  5. Count the set bits in an integer, as one CPU instruction.
    //  6. Test whether a sequence is element-wise equal to another.
    //  7. Fill an array with a repeated value.
    //  8. Get a dictionary value, or a default if the key is missing.
    //  9. Create a string of one character repeated n times.
    // 10. Produce a sequence of integers from a start and a count.
    // 11. Shuffle a span in place, correctly.
    // 12. Parse a string to an int without throwing on bad input.
    //
    // Then USE all twelve here, so the recall becomes muscle.
    public static void UseAllTwelve() => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
Console.WriteLine("Write your 12 answers in Notes.txt, then check Tests.cs.");

try
{
    Solution.UseAllTwelve();
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
     *  1. Math.Clamp
     *  2. Math.DivRem
     *  3. Enumerable.Chunk
     *  4. MaxBy
     *  5. BitOperations.PopCount
     *  6. SequenceEqual
     *  7. Array.Fill
     *  8. GetValueOrDefault
     *  9. new string(c, n)
     * 10. Enumerable.Range
     * 11. Random.Shared.Shuffle
     * 12. int.TryParse
     *
     * Scoring: 12/12 cold is the target. Anything you missed, use three times
     * this week and it will stick.
     */
}
EOF
banner E33.4 "Name the method"

start_exercise $B E33.5-WhenToWriteItYourself E33.5 $G Medium "BCL / judgment" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // For each, give a CONCRETE case where hand-rolling beats the BCL call, and
    // say what you would do instead. Record in Notes.txt, then implement the
    // two marked TODO.
    //
    // 1. Array.BinarySearch
    // 2. Math.Round
    // 3. LINQ's Where + Select
    // 4. string.Split
    // 5. list.Contains
    //
    // NOTE: one of these five has a different KIND of answer - it is not "write
    // it yourself" at all. Find it.

    // TODO 1: BinarySearch does not promise the FIRST of several equal elements.
    // Write the lower-bound version that does.
    public static int FirstIndexOf(int[] sorted, int target) => throw new NotImplementedException();

    // TODO 2: a hot-path rewrite of  items.Where(p).Select(f).ToList()
    // as a single loop with one allocation.
    public static List<int> WhereSelect(List<int> items, Func<int, bool> p, Func<int, int> f)
        => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
int[] sorted = [1, 2, 2, 2, 3];

try
{
    Console.WriteLine(Solution.FirstIndexOf(sorted, 2));   // expect 1 - the FIRST 2
    Console.WriteLine(Array.BinarySearch(sorted, 2));      // may print 1, 2 or 3 - unspecified

    Console.WriteLine(string.Join(", ", Solution.WhereSelect([1, 2, 3, 4], x => x % 2 == 0, x => x * 10)));
    // expect 20, 40
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
     * 1. Array.BinarySearch does not promise the FIRST of several equal elements.
     *    Write the lower-bound template when you need first/last occurrence (Book 12).
     *
     * 2. Math.Round defaults to BANKER'S ROUNDING. Pass MidpointRounding - or
     *    write domain-specific rounding when regulation dictates it.
     *
     * 3. LINQ allocates an enumerator per operator and a closure per lambda. In a
     *    PROFILED hot loop, a single for doing both operations in one pass wins.
     *
     * 4. string.Split allocates an array plus every substring. In a hot parser,
     *    use AsSpan + IndexOf, or MemoryExtensions.Split (Book 31).
     *
     * 5. THE ODD ONE OUT. list.Contains is O(n) - but if you call it inside a
     *    loop you do not want a better Contains, you want a DIFFERENT COLLECTION.
     *    The answer is HashSet (Book 01), not "write it yourself".
     *
     * Test Case 1  FirstIndexOf([1,2,2,2,3], 2) -> 1  (Array.BinarySearch may give 1, 2 or 3)
     * Test Case 2  FirstIndexOf([1,3], 2)       -> -1 or the insertion point - decide and document
     * Test Case 3  FirstIndexOf([], 1)          -> -1
     * Test Case 4  WhereSelect([1,2,3,4], even, x10) -> { 20, 40 }
     * Test Case 5  WhereSelect over an empty list -> { }
     */
}
EOF
banner E33.5 "When to write it yourself"

echo "Books 30-33 done."
