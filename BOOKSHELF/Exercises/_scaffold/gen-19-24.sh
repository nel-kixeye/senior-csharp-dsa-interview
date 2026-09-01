#!/usr/bin/env bash
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
echo "Books 19-24"

# ---------------------------------------------------------------- Book 19
B=Book19-DynamicProgramming; G=Book19-DynamicProgramming.md

start_exercise $B E19.1-ClimbingStairs E19.1 $G Easy DP "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Climb 1 or 2 steps at a time. How many distinct ways to reach step n?
    // Target: O(n) time, O(1) SPACE.
    //
    // Write the recurrence in one line first.
    // Then say why the naive recursion is O(2^n) despite there being only n
    // distinct subproblems.
    public static int ClimbStairs(int n)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.ClimbStairs(2));    // expect 2
    Console.WriteLine(Solution.ClimbStairs(3));    // expect 3
    Console.WriteLine(Solution.ClimbStairs(10));   // expect 89
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
     * Test Case 1  n = 1   -> 1
     * Test Case 2  n = 2   -> 2
     * Test Case 3  n = 3   -> 3
     * Test Case 4  n = 10  -> 89     (Fibonacci check)
     * Test Case 5  n = 45  -> 1836311903   (must not overflow int, and must be fast)
     */
}
EOF
banner E19.1 "Climbing Stairs"

start_exercise $B E19.2-HouseRobber E19.2 $G Medium DP "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Maximize the total taken without robbing two ADJACENT houses.
    // Target: O(n) time, O(1) space.
    //
    // State the decision at each house as:
    //   "the best from here is the max of ___ and ___"
    //
    // Follow-up (Rob II): the houses are in a CIRCLE, so the first and last are
    // adjacent. Solve it by calling this function TWICE. On what two ranges?
    public static int Rob(int[] nums)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.Rob([1, 2, 3, 1]));      // expect 4
    Console.WriteLine(Solution.Rob([2, 7, 9, 3, 1]));   // expect 12
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
     * Test Case 1  { 1,2,3,1 }     -> 4    (1 + 3)
     * Test Case 2  { 2,7,9,3,1 }   -> 12   (2 + 9 + 1)
     * Test Case 3  { 5 }           -> 5    (single house)
     * Test Case 4  { 2,1 }         -> 2    (take the larger)
     * Test Case 5  { 0,0,0 }       -> 0
     *
     * Test Case 6 - optimal SKIPS TWO in a row
     * Input:    { 2,1,1,2 }        -> 4    (first and last, not the middle)
     */
}
EOF
banner E19.2 "House Robber"

start_exercise $B E19.3-CoinChange E19.3 $G Medium DP "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // FEWEST coins summing to amount, or -1 if impossible.
    // Denominations are ARBITRARY. Target: O(amount * coins).
    //
    // BEFORE CODING: run greedy by hand on coins = {1,3,4}, amount = 6.
    // Write down what greedy gives versus the true answer. That IS the exercise.
    //
    // Sentinel care: do not add 1 to int.MaxValue. Use amount + 1 as "infinity".
    public static int CoinChange(int[] coins, int amount)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.CoinChange([1, 3, 4], 6));    // expect 2  (3+3, NOT greedy's 3)
    Console.WriteLine(Solution.CoinChange([1, 2, 5], 11));   // expect 3
    Console.WriteLine(Solution.CoinChange([2], 3));          // expect -1
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
     * Test Case 1 - THE GREEDY COUNTEREXAMPLE
     * Input:    coins = { 1,3,4 }, amount = 6
     * Expected: 2         (3 + 3)
     * Greedy gives 3      (4 + 1 + 1)  <- verify this by hand
     *
     * Test Case 2  { 1,2,5 }, amount 11   -> 3   (5+5+1)
     * Test Case 3  { 2 }, amount 3        -> -1  (impossible)
     * Test Case 4  { 1 }, amount 0        -> 0
     * Test Case 5  { 7 }, amount 7        -> 1   (coin equals amount)
     */
}
EOF
banner E19.3 "Coin Change"

start_exercise $B E19.4-LongestCommonSubsequence E19.4 $G Medium "DP / 2D" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Length of the longest COMMON SUBSEQUENCE (need not be contiguous).
    // Target: O(n * m) time; O(min(n,m)) space after optimization.
    //
    // Say what dp[i, j] MEANS in words before writing the recurrence.
    // A vague answer here is exactly why 2D DP feels hard.
    public static int LongestCommonSubsequence(string text1, string text2)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.LongestCommonSubsequence("abcde", "ace"));  // expect 3
    Console.WriteLine(Solution.LongestCommonSubsequence("abc", "def"));    // expect 0
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
     * Test Case 1  "abcde", "ace"   -> 3   ("ace")
     * Test Case 2  "abc", "abc"     -> 3   (identical)
     * Test Case 3  "abc", "def"     -> 0   (nothing in common)
     * Test Case 4  "", "abc"        -> 0   (one empty)
     * Test Case 5  "ace", "abcde"   -> 3   (one is a subsequence of the other)
     */
}
EOF
banner E19.4 "Longest Common Subsequence"

start_exercise $B E19.5-EditDistance E19.5 $G Hard "DP / 2D" "35 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Minimum single-character insertions, deletions, or substitutions to turn
    // word1 into word2. Target: O(n * m).
    //
    // THREE operations means three terms in the recurrence.
    // Map each operation to WHICH neighbouring cell it reads from - insert,
    // delete, and substitute each correspond to exactly one.
    // Base cases: turning a prefix into nothing costs one deletion per character.
    public static int MinDistance(string word1, string word2)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.MinDistance("horse", "ros"));       // expect 3
    Console.WriteLine(Solution.MinDistance("intention", "execution")); // expect 5
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
     * Test Case 1  "horse" -> "ros"            -> 3
     * Test Case 2  "intention" -> "execution"  -> 5
     * Test Case 3  "" -> "abc"                 -> 3   (all insertions)
     * Test Case 4  "abc" -> ""                 -> 3   (all deletions)
     * Test Case 5  "abc" -> "abc"              -> 0   (identical)
     * Test Case 6  "abc" -> "xyz"              -> 3   (all substitutions)
     */
}
EOF
banner E19.5 "Edit Distance"

# ---------------------------------------------------------------- Book 20
B=Book20-Greedy; G=Book20-Greedy.md

start_exercise $B E20.1-BuySellStockII E20.1 $G Medium Greedy "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Unlimited transactions, but you must sell before buying again.
    // Maximize profit. O(n) time, O(1) space.
    //
    // The answer is startlingly short. State the greedy rule in one sentence,
    // then justify WHY capturing every upward step equals buying at valleys and
    // selling at peaks.
    public static int MaxProfit(int[] prices)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.MaxProfit([7, 1, 5, 3, 6, 4]));  // expect 7
    Console.WriteLine(Solution.MaxProfit([1, 2, 3, 4, 5]));     // expect 4
    Console.WriteLine(Solution.MaxProfit([7, 6, 4, 3, 1]));     // expect 0
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
     * Test Case 1  { 7,1,5,3,6,4 }  -> 7   ((5-1) + (6-3))
     * Test Case 2  { 1,2,3,4,5 }    -> 4   (every step up; same as buy-low-sell-high)
     * Test Case 3  { 7,6,4,3,1 }    -> 0   (strictly decreasing, never trade)
     * Test Case 4  { 5 }            -> 0   (single day)
     * Test Case 5  { 3,3,3 }        -> 0   (flat)
     */
}
EOF
banner E20.1 "Best Time to Buy and Sell Stock II"

start_exercise $B E20.2-JumpGame E20.2 $G Medium Greedy "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Each element is the MAXIMUM jump length from that position.
    // Starting at index 0, can you reach the last index?
    // O(n) time, O(1) space.
    //
    // You do not need to try every jump. What SINGLE number do you maintain,
    // and what exactly makes the answer false?
    // (Hint: it is not "seeing a zero" - a 0 at the last index is harmless.)
    public static bool CanJump(int[] nums)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.CanJump([2, 3, 1, 1, 4]));  // expect True
    Console.WriteLine(Solution.CanJump([3, 2, 1, 0, 4]));  // expect False
    Console.WriteLine(Solution.CanJump([0]));              // expect True
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
     * Test Case 1  { 2,3,1,1,4 }  -> true
     * Test Case 2  { 3,2,1,0,4 }  -> false  (stuck at the 0 at index 3)
     *
     * Test Case 3 - a 0 at the LAST index is fine
     * Input:    { 0 }             -> true
     *
     * Test Case 4 - a 0 immediately blocks
     * Input:    { 0, 1 }          -> false
     *
     * Test Case 5 - one big jump clears everything
     * Input:    { 5,0,0,0,0,0 }   -> true
     */
}
EOF
banner E20.2 "Jump Game"

start_exercise $B E20.3-GasStation E20.3 $G Medium Greedy "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // n stations in a circle. gas[i] fuel available, cost[i] to reach the next.
    // Start with an empty tank. Return the starting index that completes the
    // circuit, or -1. The answer is unique if it exists.
    //
    // ONE PASS, O(1) space - no simulating from each candidate start.
    // Two insights to state before coding:
    //   1. When is the answer definitely -1?
    //   2. If you run dry between start and i, what do you know about EVERY
    //      index in between?
    public static int CanCompleteCircuit(int[] gas, int[] cost)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.CanCompleteCircuit([1, 2, 3, 4, 5], [3, 4, 5, 1, 2]));  // expect 3
    Console.WriteLine(Solution.CanCompleteCircuit([2, 3, 4], [3, 4, 3]));              // expect -1
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
     * Test Case 1  gas { 1,2,3,4,5 }, cost { 3,4,5,1,2 }  -> 3
     * Test Case 2  gas { 2,3,4 },     cost { 3,4,3 }      -> -1  (total gas < total cost)
     * Test Case 3  gas { 5 },         cost { 4 }          -> 0   (single station)
     * Test Case 4  gas { 3,1,1 },     cost { 1,2,2 }      -> 0   (answer is index 0)
     * Test Case 5  gas { 1,1,3 },     cost { 2,2,1 }      -> 2   (answer is the last index)
     */
}
EOF
banner E20.3 "Gas Station"

start_exercise $B E20.4-NonOverlappingIntervals E20.4 $G Medium "Greedy + sorting" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Minimum number of intervals to REMOVE so the rest do not overlap.
    // O(n log n).
    //
    // Minimizing removals is the same as MAXIMIZING keeps.
    // Then: sort by WHAT? Justify the key with the exchange argument, and say
    // why the intuitive key (start) is wrong.
    // Note: touching intervals like [1,2] and [2,3] do NOT overlap.
    public static int EraseOverlapIntervals(int[][] intervals)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.EraseOverlapIntervals([[1, 2], [2, 3], [3, 4], [1, 3]]));  // expect 1
    Console.WriteLine(Solution.EraseOverlapIntervals([[1, 2], [1, 2], [1, 2]]));          // expect 2
    Console.WriteLine(Solution.EraseOverlapIntervals([[1, 2], [2, 3]]));                  // expect 0
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
     * Test Case 1  { {1,2},{2,3},{3,4},{1,3} }  -> 1
     * Test Case 2  { {1,2},{1,2},{1,2} }        -> 2   (all identical)
     *
     * Test Case 3 - TOUCHING is not overlapping
     * Input:    { {1,2},{2,3} }                 -> 0
     *
     * Test Case 4 - one interval containing all others
     * Input:    { {1,100},{2,3},{4,5} }         -> 1
     *
     * Test Case 5 - single interval
     * Input:    { {1,2} }                       -> 0
     */
}
EOF
banner E20.4 "Non-overlapping Intervals"

start_exercise $B E20.5-PartitionLabels E20.5 $G Medium Greedy "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Partition the string into as many parts as possible so that each letter
    // appears in AT MOST ONE part. Return the part lengths in order.
    // O(n) time, O(1) space.
    //
    // What do you need to know about each character BEFORE you can start
    // partitioning? That precomputation names the structure.
    public static IList<int> PartitionLabels(string s)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(string.Join(", ", Solution.PartitionLabels("ababcbacadefegdehijhklij")));
    // expect 9, 7, 8
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
     * Test Case 1  "ababcbacadefegdehijhklij"  -> { 9, 7, 8 }
     * Test Case 2  "aaaa"                      -> { 4 }   (one part)
     * Test Case 3  "abcd"                      -> { 1, 1, 1, 1 }  (all distinct)
     *
     * Test Case 4 - a character at BOTH ends forces one part
     * Input:    "abca"                         -> { 4 }
     *
     * Test Case 5  single character
     * Input:    "a"                            -> { 1 }
     */
}
EOF
banner E20.5 "Partition Labels"

# ---------------------------------------------------------------- Book 21
B=Book21-Sorting; G=Book21-Sorting.md

start_exercise $B E21.1-LargestNumber E21.1 $G Medium "Sorting / custom comparator" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Arrange non-negative integers to form the LARGEST possible number.
    // Return it as a string. [3,30,34,5,9] -> "9534330"
    //
    // Neither numeric nor lexicographic order is correct.
    // State the comparison rule for two numbers a and b - it involves
    // CONCATENATING them.
    // Do not write (a, b) => a - b anywhere. Overflow.
    // Edge case that catches people: all zeroes must give "0", not "00".
    public static string LargestNumber(int[] nums)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.LargestNumber([10, 2]));            // expect 210
    Console.WriteLine(Solution.LargestNumber([3, 30, 34, 5, 9]));  // expect 9534330
    Console.WriteLine(Solution.LargestNumber([0, 0]));             // expect 0
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
     * Test Case 1  { 10, 2 }          -> "210"
     * Test Case 2  { 3,30,34,5,9 }    -> "9534330"
     *
     * Test Case 3 - ALL ZEROES (the trap)
     * Input:    { 0, 0 }              -> "0"     NOT "00"
     *
     * Test Case 4 - one number is a prefix of another
     * Input:    { 3, 30 }             -> "330"
     *
     * Test Case 5 - single number
     * Input:    { 1 }                 -> "1"
     */
}
EOF
banner E21.1 "Largest Number"

start_exercise $B E21.2-HIndex E21.2 $G Medium "Sorting / counting" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // h-index: the largest h such that at least h papers have >= h citations each.
    //
    // Sort descending and scan - what is the stopping condition?
    // Then: citation counts are BOUNDED, so what linear-time approach exists?
    // Implement whichever you like, but be able to describe both.
    public static int HIndex(int[] citations)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.HIndex([3, 0, 6, 1, 5]));  // expect 3
    Console.WriteLine(Solution.HIndex([1, 3, 1]));        // expect 1
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
     * Test Case 1  { 3,0,6,1,5 }  -> 3
     * Test Case 2  { 1,3,1 }      -> 1
     * Test Case 3  { 0,0,0 }      -> 0   (all uncited)
     * Test Case 4  { 100 }        -> 1   (one paper, many citations)
     * Test Case 5  { 4,4,4,4 }    -> 4   (every paper cited >= n times)
     */
}
EOF
banner E21.2 "H-Index"

start_exercise $B E21.3-MinimumAbsoluteDifference E21.3 $G Easy "Sorting / adjacency" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // All pairs having the MINIMUM absolute difference, each pair ascending,
    // the list sorted by the first element. O(n log n).
    //
    // After sorting, WHICH pairs can possibly be the closest?
    // The answer eliminates O(n^2) comparisons in one sentence.
    // Watch: differences of two ints can exceed int range - consider long.
    public static IList<IList<int>> MinimumAbsDifference(int[] arr)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    foreach (var p in Solution.MinimumAbsDifference([4, 2, 1, 3]))
        Console.Write($"[{p[0]},{p[1]}] ");
    Console.WriteLine();
    // expect [1,2] [2,3] [3,4]
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
     * Test Case 1  { 4,2,1,3 }      -> { {1,2},{2,3},{3,4} }   (min diff 1)
     * Test Case 2  { 1,3,6,10,15 }  -> { {1,3} }               (min diff 2)
     * Test Case 3  { 3,8,-10,23,19,-4,-14,27 } -> { {-14,-10},{19,23},{23,27} }
     *
     * Test Case 4 - DUPLICATES give a difference of 0
     * Input:    { 1,1,2 }           -> { {1,1} }
     *
     * Test Case 5 - exactly two elements
     * Input:    { 5, 9 }            -> { {5,9} }
     */
}
EOF
banner E21.3 "Minimum Absolute Difference"

start_exercise $B E21.4-CustomSortString E21.4 $G Medium "Sorting / counting" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // `order` lists distinct characters. Rearrange s so its characters follow
    // that order. Characters of s not in `order` may go anywhere.
    //
    // TWO valid approaches - a custom comparer, or counting.
    // Name both and say which is faster and why. Implement one.
    public static string CustomSortString(string order, string s)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.CustomSortString("cba", "abcd"));  // expect cbad (d anywhere)
    Console.WriteLine(Solution.CustomSortString("bcafg", "abcd"));// expect bcad (d anywhere)
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
     * Test Case 1  order "cba", s "abcd"   -> "cbad"  ('d' may be anywhere)
     * Test Case 2  order "bcafg", s "abcd" -> "bcad"
     *
     * Test Case 3 - DUPLICATES in s
     * Input:    order "cba", s "aabbcc"    -> "ccbbaa"
     *
     * Test Case 4 - order contains characters absent from s
     * Input:    order "xyz", s "ab"        -> "ab" (any order, both unconstrained)
     *
     * Test Case 5 - empty order
     * Input:    order "", s "abc"          -> any permutation of "abc"
     */
}
EOF
banner E21.4 "Custom Sort String"

start_exercise $B E21.5-CarFleet E21.5 $G Medium "Sorting + stack" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Cars at given positions drive toward `target` at given speeds.
    // A faster car catching a slower one joins its fleet and slows to its speed.
    // Return how many fleets arrive. O(n log n).
    //
    // Two books here. Sort by WHAT, and in which direction?
    // Then: what does the second structure hold, and what does "the car ahead
    // arrives LATER than me" imply?
    // Note: cars that catch up exactly AT the target still merge.
    public static int CarFleet(int target, int[] position, int[] speed)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.CarFleet(12, [10, 8, 0, 5, 3], [2, 4, 1, 1, 3]));  // expect 3
    Console.WriteLine(Solution.CarFleet(10, [3], [3]));                            // expect 1
    Console.WriteLine(Solution.CarFleet(100, [0, 2, 4], [4, 2, 1]));               // expect 1
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
     * Test Case 1  target 12, pos { 10,8,0,5,3 }, speed { 2,4,1,1,3 }  -> 3
     * Test Case 2  target 10, pos { 3 }, speed { 3 }                    -> 1
     * Test Case 3  target 100, pos { 0,2,4 }, speed { 4,2,1 }           -> 1 (all merge)
     *
     * Test Case 4 - all same speed, none ever catches another
     * Input:    target 10, pos { 0,1,2 }, speed { 1,1,1 }               -> 3
     *
     * Test Case 5 - two cars arriving at EXACTLY the same time merge
     * Input:    target 10, pos { 0, 5 }, speed { 2, 1 }                 -> 1
     */
}
EOF
banner E21.5 "Car Fleet"

# ---------------------------------------------------------------- Book 22
B=Book22-Intervals; G=Book22-Intervals.md

start_exercise $B E22.1-MergeIntervals E22.1 $G Medium Intervals "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Merge all overlapping intervals. Input is NOT sorted. O(n log n).
    //
    // Write the merge-extend line BEFORE anything else, and say why a plain
    // assignment of the new end is wrong.
    // (Hint: what if the incoming interval is entirely CONTAINED in the current one?)
    public static int[][] Merge(int[][] intervals)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    foreach (var iv in Solution.Merge([[1, 3], [2, 6], [8, 10], [15, 18]]))
        Console.Write($"[{iv[0]},{iv[1]}] ");
    Console.WriteLine();
    // expect [1,6] [8,10] [15,18]
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
     * Test Case 1  { {1,3},{2,6},{8,10},{15,18} }  -> { {1,6},{8,10},{15,18} }
     *
     * Test Case 2 - TOUCHING intervals merge
     * Input:    { {1,4},{4,5} }                    -> { {1,5} }
     *
     * Test Case 3 - THE CLASSIC BUG: one interval CONTAINED in another
     * Input:    { {1,10},{2,3} }                   -> { {1,10} }
     *           (plain assignment of the new end would wrongly give {1,3})
     *
     * Test Case 4 - no overlaps at all
     * Input:    { {1,2},{3,4} }                    -> unchanged
     *
     * Test Case 5 - identical intervals
     * Input:    { {1,4},{1,4} }                    -> { {1,4} }
     */
}
EOF
banner E22.1 "Merge Intervals"

start_exercise $B E22.2-InsertInterval E22.2 $G Medium Intervals "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // intervals is ALREADY SORTED and non-overlapping. Insert newInterval,
    // merging as needed. O(n) - do NOT re-sort.
    //
    // Because the input is sorted, the answer has THREE distinct phases.
    // Name them in order before writing.
    public static int[][] Insert(int[][] intervals, int[] newInterval)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    foreach (var iv in Solution.Insert([[1, 3], [6, 9]], [2, 5]))
        Console.Write($"[{iv[0]},{iv[1]}] ");
    Console.WriteLine();
    // expect [1,5] [6,9]
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
     * Test Case 1  { {1,3},{6,9} }, new { 2,5 }  -> { {1,5},{6,9} }
     * Test Case 2  { {1,2},{3,5},{6,7},{8,10},{12,16} }, new { 4,8 }
     *              -> { {1,2},{3,10},{12,16} }
     *
     * Test Case 3 - EMPTY input list
     * Input:    { }, new { 5,7 }                 -> { {5,7} }
     *
     * Test Case 4 - new interval goes BEFORE everything
     * Input:    { {3,5} }, new { 1,2 }           -> { {1,2},{3,5} }
     *
     * Test Case 5 - new interval SWALLOWS everything
     * Input:    { {2,3},{5,7} }, new { 1,10 }    -> { {1,10} }
     */
}
EOF
banner E22.2 "Insert Interval"

start_exercise $B E22.3-MeetingRoomsII E22.3 $G Medium "Intervals + heap" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Minimum number of rooms required to hold all meetings. O(n log n).
    //
    // TWO approaches, both O(n log n). Name them.
    // For the sweep version, state the tie-break rule between an END event and a
    // START event at the same timestamp - and what goes wrong if you reverse it.
    // (A meeting ending at 10 frees the room for one starting at 10.)
    public static int MinMeetingRooms(int[][] intervals)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.MinMeetingRooms([[0, 30], [5, 10], [15, 20]]));  // expect 2
    Console.WriteLine(Solution.MinMeetingRooms([[7, 10], [2, 4]]));             // expect 1
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
     * Test Case 1  { {0,30},{5,10},{15,20} }  -> 2
     * Test Case 2  { {7,10},{2,4} }           -> 1  (no overlap)
     * Test Case 3  { }                        -> 0
     *
     * Test Case 4 - THE TIE-BREAK CASE
     * Input:    { {1,10},{10,20} }            -> 1
     *           (a meeting ending at 10 frees the room for one starting at 10;
     *            reversing the sweep tie-break wrongly gives 2)
     *
     * Test Case 5 - all meetings at the same time
     * Input:    { {1,5},{1,5},{1,5} }         -> 3
     */
}
EOF
banner E22.3 "Meeting Rooms II"

start_exercise $B E22.4-IntervalListIntersections E22.4 $G Medium "Intervals + two pointers" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Two lists of SORTED, DISJOINT intervals. Return their intersection.
    // O(n + m) - do not sort, do not nest loops.
    //
    // Both lists are sorted, so this is a MERGE.
    // Given the current interval from each list: what is their intersection
    // (one line), and WHICH list do you advance?
    public static int[][] IntervalIntersection(int[][] firstList, int[][] secondList)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    int[][] a = [[0, 2], [5, 10], [13, 23], [24, 25]];
    int[][] b = [[1, 5], [8, 12], [15, 24], [25, 26]];
    foreach (var iv in Solution.IntervalIntersection(a, b))
        Console.Write($"[{iv[0]},{iv[1]}] ");
    Console.WriteLine();
    // expect [1,2] [5,5] [8,10] [15,23] [24,24] [25,25]
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
     * Test Case 1
     * a = { {0,2},{5,10},{13,23},{24,25} }
     * b = { {1,5},{8,12},{15,24},{25,26} }
     * -> { {1,2},{5,5},{8,10},{15,23},{24,24},{25,25} }
     *
     * Test Case 2 - either list empty
     * Input:    a = { }, b = { {1,2} }        -> { }
     *
     * Test Case 3 - no intersections
     * Input:    a = { {1,2} }, b = { {5,6} }  -> { }
     *
     * Test Case 4 - SINGLE POINT intersection
     * Input:    a = { {1,3} }, b = { {3,5} }  -> { {3,3} }
     *
     * Test Case 5 - one interval spanning many in the other list
     * Input:    a = { {0,100} }, b = { {1,2},{5,6} } -> { {1,2},{5,6} }
     */
}
EOF
banner E22.4 "Interval List Intersections"

start_exercise $B E22.5-EmployeeFreeTime E22.5 $G Hard "Intervals / merge + gaps" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Each employee has a sorted, non-overlapping list of working intervals.
    // Return the FINITE intervals when ALL employees are free.
    // O(n log n).
    //
    // Ignore who owns which interval. What does the problem reduce to once you
    // flatten them all together?
    // Note: only gaps BETWEEN busy periods count - there is no free interval
    // before the first or after the last (those would be infinite).
    public static int[][] EmployeeFreeTime(int[][][] schedule)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    // employee 0: [1,2] [5,6]   employee 1: [1,3]   employee 2: [4,10]
    int[][][] schedule = [[[1, 2], [5, 6]], [[1, 3]], [[4, 10]]];
    foreach (var iv in Solution.EmployeeFreeTime(schedule))
        Console.Write($"[{iv[0]},{iv[1]}] ");
    Console.WriteLine();
    // expect [3,4]
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
     * Test Case 1
     * schedule = [[[1,2],[5,6]], [[1,3]], [[4,10]]]   -> { {3,4} }
     *
     * Test Case 2
     * schedule = [[[1,3],[6,7]], [[2,4]], [[2,5],[9,12]]]  -> { {5,6},{7,9} }
     *
     * Test Case 3 - TOTAL overlap, no free time
     * Input:    [[[1,10]], [[2,5]]]        -> { }
     *
     * Test Case 4 - single employee with a gap
     * Input:    [[[1,2],[5,6]]]            -> { {2,5} }
     *
     * Test Case 5 - identical schedules
     * Input:    [[[1,2]], [[1,2]]]         -> { }   (no gap between busy periods)
     */
}
EOF
banner E22.5 "Employee Free Time"

# ---------------------------------------------------------------- Book 23
B=Book23-MonotonicStack; G=Book23-MonotonicStack.md

start_exercise $B E23.1-NextGreaterElementI E23.1 $G Easy "Monotonic stack + Dictionary" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // nums1 is a subset of nums2. For each element of nums1, find the first
    // greater element to its right IN nums2, or -1. All values distinct.
    // O(n + m).
    //
    // You need to look answers up BY VALUE, not position. That is a second
    // book - name it.
    public static int[] NextGreaterElement(int[] nums1, int[] nums2)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(string.Join(", ", Solution.NextGreaterElement([4, 1, 2], [1, 3, 4, 2])));
    // expect -1, 3, -1
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
     * Test Case 1  nums1 { 4,1,2 }, nums2 { 1,3,4,2 }  -> { -1, 3, -1 }
     * Test Case 2  nums1 { 2,4 },   nums2 { 1,2,3,4 }  -> { 3, -1 }
     *
     * Test Case 3 - strictly DECREASING nums2: everything is -1
     * Input:    nums1 { 3,2 }, nums2 { 3,2,1 }         -> { -1, -1 }
     *
     * Test Case 4 - strictly increasing nums2
     * Input:    nums1 { 1,2 }, nums2 { 1,2,3 }         -> { 2, 3 }
     *
     * Test Case 5 - single element
     * Input:    nums1 { 1 }, nums2 { 1 }               -> { -1 }
     */
}
EOF
banner E23.1 "Next Greater Element I"

start_exercise $B E23.2-DailyTemperatures E23.2 $G Medium "Monotonic stack" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // For each day, how many days until a WARMER temperature (0 if none).
    // O(n) time, O(n) space. The naive nested scan is O(n^2).
    //
    // Why must the stack hold INDICES rather than temperatures? One sentence.
    // Read the pop loop as: "I am the answer to everyone smaller who was waiting."
    public static int[] DailyTemperatures(int[] temperatures)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(string.Join(", ", Solution.DailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73])));
    // expect 1, 1, 4, 2, 1, 1, 0, 0
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
     * Test Case 1  { 73,74,75,71,69,72,76,73 }  -> { 1,1,4,2,1,1,0,0 }
     * Test Case 2  { 30,40,50,60 }              -> { 1,1,1,0 }  (increasing)
     * Test Case 3  { 60,50,40,30 }              -> { 0,0,0,0 }  (decreasing)
     *
     * Test Case 4 - ALL EQUAL: "warmer" is strict, so all zeroes
     * Input:    { 50,50,50 }                    -> { 0,0,0 }
     *
     * Test Case 5 - single day
     * Input:    { 30 }                          -> { 0 }
     */
}
EOF
banner E23.2 "Daily Temperatures"

start_exercise $B E23.3-SlidingWindowMaximum E23.3 $G Hard "Monotonic deque" "35 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Maximum of every window of size k. O(n) REQUIRED - O(n*k) will time out.
    //
    // A plain stack cannot do this. Say exactly which operation it is missing.
    // .NET has no Deque<T> - name two substitutes and pick one.
    // The deque holds INDICES with decreasing values; the FRONT is always the max.
    public static int[] MaxSlidingWindow(int[] nums, int k)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(string.Join(", ", Solution.MaxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3)));
    // expect 3, 3, 5, 5, 6, 7
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
     * Test Case 1  { 1,3,-1,-3,5,3,6,7 }, k = 3  -> { 3,3,5,5,6,7 }
     * Test Case 2  k = 1 returns the array itself
     * Input:    { 1,2,3 }, k = 1                 -> { 1,2,3 }
     *
     * Test Case 3 - k equals n
     * Input:    { 1,3,2 }, k = 3                 -> { 3 }
     *
     * Test Case 4 - strictly DECREASING (front evictions dominate)
     * Input:    { 5,4,3,2 }, k = 2               -> { 5,4,3 }
     *
     * Test Case 5 - duplicates within a window
     * Input:    { 2,2,2 }, k = 2                 -> { 2,2 }
     */
}
EOF
banner E23.3 "Sliding Window Maximum"

start_exercise $B E23.4-LargestRectangleHistogram E23.4 $G Hard "Monotonic stack" "40 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Largest rectangle fitting inside a histogram of unit-width bars. O(n).
    //
    // For each bar, its rectangle extends until a STRICTLY SHORTER bar on each
    // side. So you need two things per bar - name them.
    // Then: what does appending a SENTINEL bar of height 0 save you from writing?
    public static int LargestRectangleArea(int[] heights)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.LargestRectangleArea([2, 1, 5, 6, 2, 3]));  // expect 10
    Console.WriteLine(Solution.LargestRectangleArea([2, 4]));               // expect 4
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
     * Test Case 1  { 2,1,5,6,2,3 }  -> 10   (bars 5 and 6, width 2)
     * Test Case 2  { 2,4 }          -> 4
     *
     * Test Case 3 - all equal
     * Input:    { 3,3,3 }           -> 9
     *
     * Test Case 4 - strictly INCREASING (nothing pops until the flush)
     * Input:    { 1,2,3,4 }         -> 6    (this is where the sentinel matters)
     *
     * Test Case 5 - a zero-height bar splits the histogram
     * Input:    { 5,0,5 }           -> 5
     */
}
EOF
banner E23.4 "Largest Rectangle in Histogram"

start_exercise $B E23.5-RemoveKDigits E23.5 $G Medium "Monotonic stack / greedy" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Remove exactly k digits to produce the SMALLEST possible number.
    // No leading zeroes; an empty result becomes "0". O(n).
    //
    // Scanning left to right, WHICH digit do you want to remove first?
    // State the rule. Then: what happens if you finish the scan with removals
    // left over?
    public static string RemoveKdigits(string num, int k)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.RemoveKdigits("1432219", 3));  // expect 1219
    Console.WriteLine(Solution.RemoveKdigits("10200", 1));    // expect 200
    Console.WriteLine(Solution.RemoveKdigits("10", 2));       // expect 0
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
     * Test Case 1  "1432219", k = 3  -> "1219"
     *
     * Test Case 2 - LEADING ZERO after removal
     * Input:    "10200", k = 1       -> "200"   not "0200"
     *
     * Test Case 3 - everything removed
     * Input:    "10", k = 2          -> "0"
     *
     * Test Case 4 - already ASCENDING: remove from the END
     * Input:    "12345", k = 2       -> "123"
     *
     * Test Case 5 - k = 0
     * Input:    "1234", k = 0        -> "1234"
     */
}
EOF
banner E23.5 "Remove K Digits"

# ---------------------------------------------------------------- Book 24
B=Book24-Strings; G=Book24-Strings.md

start_exercise $B E24.1-ValidAnagram E24.1 $G Easy "Strings / counting" "10 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Are the two strings anagrams? Lowercase English letters.
    // O(n) time, O(1) SPACE.
    //
    // Name the O(1)-time check to do BEFORE touching any counts.
    // Then: one count array or two?
    // Follow-up: what changes if the input is arbitrary Unicode?
    public static bool IsAnagram(string s, string t)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.IsAnagram("anagram", "nagaram"));  // expect True
    Console.WriteLine(Solution.IsAnagram("rat", "car"));          // expect False
    Console.WriteLine(Solution.IsAnagram("aab", "abb"));          // expect False
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
     * Test Case 1  "anagram", "nagaram"  -> true
     * Test Case 2  "rat", "car"          -> false
     *
     * Test Case 3 - SAME LETTERS, DIFFERENT COUNTS
     * Input:    "aab", "abb"             -> false
     *
     * Test Case 4 - different lengths (the O(1) early exit)
     * Input:    "ab", "abc"              -> false
     *
     * Test Case 5 - both empty
     * Input:    "", ""                   -> true
     */
}
EOF
banner E24.1 "Valid Anagram"

start_exercise $B E24.2-LongestCommonPrefix E24.2 $G Easy Strings "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Longest common prefix of an array of strings, or "" if there is none.
    // O(total characters), O(1) space.
    //
    // Two approaches: scan VERTICALLY (character position across all strings)
    // or HORIZONTALLY (fold the prefix pairwise).
    // Which exits earlier on a bad case? Say why before implementing.
    public static string LongestCommonPrefix(string[] strs)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine($"[{Solution.LongestCommonPrefix(["flower", "flow", "flight"])}]"); // expect [fl]
    Console.WriteLine($"[{Solution.LongestCommonPrefix(["dog", "racecar", "car"])}]");    // expect []
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
     * Test Case 1  { "flower","flow","flight" }  -> "fl"
     * Test Case 2  { "dog","racecar","car" }     -> ""
     * Test Case 3  { "abc" }                     -> "abc"   (single string)
     *
     * Test Case 4 - one EMPTY string in the array
     * Input:    { "abc", "" }                    -> ""
     *
     * Test Case 5 - all identical
     * Input:    { "abc","abc" }                  -> "abc"
     */
}
EOF
banner E24.2 "Longest Common Prefix"

start_exercise $B E24.3-StringToInteger E24.3 $G Medium "Strings / parsing" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Parse a leading integer: skip leading whitespace, accept ONE optional sign,
    // read digits until a non-digit, clamp to int range.
    //
    // THIS PROBLEM IS ITS EDGE CASES. Read the test list before you start.
    // Detect overflow BEFORE it happens - you may not use long.
    // (Same guard as E26.2. Write it from memory if you have done that one.)
    //
    // Afterwards: name the BCL call you would actually use in production.
    public static int MyAtoi(string s)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.MyAtoi("42"));            // expect 42
    Console.WriteLine(Solution.MyAtoi("   -042"));       // expect -42
    Console.WriteLine(Solution.MyAtoi("1337c0d3"));      // expect 1337
    Console.WriteLine(Solution.MyAtoi("words and 987")); // expect 0
    Console.WriteLine(Solution.MyAtoi("-91283472332"));  // expect -2147483648
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
     * Test Case 1   "42"              -> 42
     * Test Case 2   "   -042"         -> -42      (leading spaces + leading zeroes)
     * Test Case 3   "1337c0d3"        -> 1337     (stop at the first non-digit)
     * Test Case 4   "words and 987"   -> 0        (no leading number)
     * Test Case 5   "-91283472332"    -> -2147483648   (clamp low)
     * Test Case 6   "91283472332"     -> 2147483647    (clamp high)
     * Test Case 7   "+-12"            -> 0        (second sign ends it, zero digits read)
     * Test Case 8   ""                -> 0
     * Test Case 9   "+"               -> 0
     * Test Case 10  "  +0 123"        -> 0        (stops at the space)
     */
}
EOF
banner E24.3 "String to Integer (atoi)"

start_exercise $B E24.4-LongestPalindromicSubstring E24.4 $G Medium "Expand around center" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Longest palindromic SUBSTRING. O(n^2) time, O(1) space.
    //
    // How many CENTRES does a string of length n have?
    // The answer is not n - and getting it wrong is exactly why even-length
    // palindromes get missed.
    public static string LongestPalindrome(string s)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.LongestPalindrome("babad"));  // expect bab or aba
    Console.WriteLine(Solution.LongestPalindrome("cbbd"));   // expect bb
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
     * Test Case 1  "babad"  -> "bab" or "aba"  (either accepted)
     *
     * Test Case 2 - EVEN LENGTH palindrome (needs the gap centres)
     * Input:    "cbbd"      -> "bb"
     *
     * Test Case 3  "a"      -> "a"      (single character)
     * Test Case 4  "abcd"   -> any single character (no palindrome longer than 1)
     * Test Case 5  "aaaa"   -> "aaaa"   (the whole string)
     */
}
EOF
banner E24.4 "Longest Palindromic Substring"

start_exercise $B E24.5-FindAllAnagrams E24.5 $G Medium "Sliding window + counts" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Start indices of every substring of s that is an anagram of p.
    // O(n) time, O(1) space.
    //
    // TWO books combine here. What is the window size?
    // Then: how do you compare two 26-slot profiles in O(1) per step rather
    // than O(26)? (Keep a running "matches" counter.)
    public static IList<int> FindAnagrams(string s, string p)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(string.Join(", ", Solution.FindAnagrams("cbaebabacd", "abc")));  // expect 0, 6
    Console.WriteLine(string.Join(", ", Solution.FindAnagrams("abab", "ab")));         // expect 0, 1, 2
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
     * Test Case 1  s "cbaebabacd", p "abc"  -> { 0, 6 }
     *
     * Test Case 2 - OVERLAPPING matches
     * Input:    s "abab", p "ab"            -> { 0, 1, 2 }
     *
     * Test Case 3 - p longer than s
     * Input:    s "a", p "ab"               -> { }
     *
     * Test Case 4 - p equals s
     * Input:    s "abc", p "cba"            -> { 0 }
     *
     * Test Case 5 - REPEATED characters in p (counts must match)
     * Input:    s "aaab", p "aab"           -> { 1 }
     */
}
EOF
banner E24.5 "Find All Anagrams in a String"

echo "Books 19-24 done."
