#!/usr/bin/env bash
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

echo "Books 01-06"

# ---------------------------------------------------------------- Book 01
B=Book01-HashSet; G=Book01-HashSet.md

start_exercise $B E01.1-ContainsDuplicate E01.1 $G Easy HashSet "10 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Target: O(n) time, O(n) space.
    // Naive to avoid: nested loops, or List.Contains inside a loop.
    public static bool ContainsDuplicate(int[] nums)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.ContainsDuplicate([1, 2, 3, 1]));   // expect True
    Console.WriteLine(Solution.ContainsDuplicate([1, 2, 3, 4]));   // expect False
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
     * Input:    { 1, 2, 3, 1 }
     * Expected: true
     *
     * Test Case 2
     * Input:    { 1, 2, 3, 4 }
     * Expected: false
     *
     * Test Case 3 - empty
     * Input:    { }
     * Expected: false
     *
     * Test Case 4 - single element
     * Input:    { 7 }
     * Expected: false
     *
     * Test Case 5 - all identical
     * Input:    { 5, 5, 5, 5 }
     * Expected: true
     *
     * Test Case 6 - negatives
     * Input:    { -1, -2, -1 }
     * Expected: true
     */
}
EOF
banner E01.1 "Contains Duplicate"

start_exercise $B E01.2-IntersectionOfTwoArrays E01.2 $G Easy HashSet "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Target: O(n + m) time, O(min(n, m)) space.
    // Result must contain no duplicates. Order does not matter.
    public static int[] Intersection(int[] a, int[] b)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(string.Join(", ", Solution.Intersection([1, 2, 2, 1], [2, 2])));      // expect 2
    Console.WriteLine(string.Join(", ", Solution.Intersection([4, 9, 5], [9, 4, 9, 8, 4])));// expect 4, 9
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
     * Input:    a = { 1, 2, 2, 1 }, b = { 2, 2 }
     * Expected: { 2 }                    (unique only)
     *
     * Test Case 2
     * Input:    a = { 4, 9, 5 }, b = { 9, 4, 9, 8, 4 }
     * Expected: { 4, 9 }  (any order)
     *
     * Test Case 3 - no overlap
     * Input:    a = { 1, 2 }, b = { 3, 4 }
     * Expected: { }
     *
     * Test Case 4 - one empty
     * Input:    a = { }, b = { 1, 2 }
     * Expected: { }
     *
     * Test Case 5 - identical arrays
     * Input:    a = { 1, 2, 3 }, b = { 1, 2, 3 }
     * Expected: { 1, 2, 3 }
     */
}
EOF
banner E01.2 "Intersection of Two Arrays"

start_exercise $B E01.3-HappyNumber E01.3 $G Easy "HashSet / cycle detection" "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Replace n by the sum of the squares of its digits, repeatedly.
    // true if it reaches 1; false if it loops forever.
    // Follow-up once this works: solve it in O(1) space (fast/slow pointers).
    public static bool IsHappy(int n)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.IsHappy(19));   // expect True  (1+81 -> 82 -> 68 -> 100 -> 1)
    Console.WriteLine(Solution.IsHappy(2));    // expect False (cycles)
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
     * Input:    19
     * Expected: true
     *
     * Test Case 2
     * Input:    2
     * Expected: false
     *
     * Test Case 3 - already happy
     * Input:    1
     * Expected: true
     *
     * Test Case 4
     * Input:    7
     * Expected: true
     *
     * Test Case 5 - known unhappy cycle entry
     * Input:    4
     * Expected: false      (4 -> 16 -> 37 -> 58 -> 89 -> 145 -> 42 -> 20 -> 4)
     */
}
EOF
banner E01.3 "Happy Number"

start_exercise $B E01.4-LongestConsecutiveSequence E01.4 $G Hard HashSet "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // MUST run in O(n). Sorting (O(n log n)) does not satisfy the constraint.
    // The whole trick is one guard: only walk a run from its starting value.
    public static int LongestConsecutive(int[] nums)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.LongestConsecutive([100, 4, 200, 1, 3, 2]));       // expect 4
    Console.WriteLine(Solution.LongestConsecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]));// expect 9
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
     * Input:    { 100, 4, 200, 1, 3, 2 }
     * Expected: 4                        (1,2,3,4)
     *
     * Test Case 2
     * Input:    { 0, 3, 7, 2, 5, 8, 4, 6, 0, 1 }
     * Expected: 9
     *
     * Test Case 3 - empty
     * Input:    { }
     * Expected: 0
     *
     * Test Case 4 - all duplicates
     * Input:    { 1, 1, 1, 1 }
     * Expected: 1
     *
     * Test Case 5 - negatives
     * Input:    { -3, -2, -1, 5 }
     * Expected: 3
     *
     * Test Case 6 - single element
     * Input:    { 42 }
     * Expected: 1
     */
}
EOF
banner E01.4 "Longest Consecutive Sequence"

start_exercise $B E01.5-ValidSudoku E01.5 $G Medium "HashSet / grid" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Rows, columns and 3x3 boxes must each contain no duplicate digit.
    // '.' means empty. The board need not be solvable.
    // Box index from (row, col):  (row / 3) * 3 + (col / 3)
    public static bool IsValidSudoku(char[][] board)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
char[][] valid =
[
    ['5','3','.','.','7','.','.','.','.'],
    ['6','.','.','1','9','5','.','.','.'],
    ['.','9','8','.','.','.','.','6','.'],
    ['8','.','.','.','6','.','.','.','3'],
    ['4','.','.','8','.','3','.','.','1'],
    ['7','.','.','.','2','.','.','.','6'],
    ['.','6','.','.','.','.','2','8','.'],
    ['.','.','.','4','1','9','.','.','5'],
    ['.','.','.','.','8','.','.','7','9']
];

try
{
    Console.WriteLine(Solution.IsValidSudoku(valid));   // expect True
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
     * Test Case 1 - the standard valid board (see Program.cs)
     * Expected: true
     *
     * Test Case 2 - duplicate in a COLUMN
     * Change row 0 col 0 from '5' to '8' in the valid board (col 0 already has '8')
     * Expected: false
     *
     * Test Case 3 - duplicate in a ROW
     * Change row 0 col 2 from '.' to '3'
     * Expected: false
     *
     * Test Case 4 - duplicate in a BOX only (row and column both still clean)
     * Change row 1 col 1 from '.' to '3'   (top-left box already has '3' at [0][1])
     * Expected: false
     *
     * Test Case 5 - completely empty board
     * All 81 cells '.'
     * Expected: true
     */
}
EOF
banner E01.5 "Valid Sudoku"

# ---------------------------------------------------------------- Book 02
B=Book02-Dictionary; G=Book02-Dictionary.md

start_exercise $B E02.1-TwoSum E02.1 $G Easy Dictionary "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Array is UNSORTED and you must return INDICES.
    // That combination is exactly why sorting + two pointers does not work here.
    // Target: O(n) time, O(n) space, one pass.
    public static int[] TwoSum(int[] nums, int target)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(string.Join(", ", Solution.TwoSum([2, 7, 11, 15], 9)));  // expect 0, 1
    Console.WriteLine(string.Join(", ", Solution.TwoSum([3, 3], 6)));          // expect 0, 1
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
     * Input:    nums = { 2, 7, 11, 15 }, target = 9
     * Expected: { 0, 1 }
     *
     * Test Case 2 - the two values are equal
     * Input:    nums = { 3, 3 }, target = 6
     * Expected: { 0, 1 }
     *
     * Test Case 3 - answer is not at the start
     * Input:    nums = { 3, 2, 4 }, target = 6
     * Expected: { 1, 2 }
     *
     * Test Case 4 - negatives
     * Input:    nums = { -3, 4, 3, 90 }, target = 0
     * Expected: { 0, 2 }
     *
     * Test Case 5 - must not use the same element twice
     * Input:    nums = { 3, 2, 4 }, target = 6
     * Expected: NOT { 0, 0 }
     */
}
EOF
banner E02.1 "Two Sum"

start_exercise $B E02.2-FirstUniqueCharacter E02.2 $G Easy "Dictionary / int[26]" "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Return the INDEX of the first character occurring exactly once, or -1.
    // A HashSet cannot answer this - say why before you start.
    // Lowercase only, so int[26] beats Dictionary here.
    public static int FirstUniqChar(string s)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.FirstUniqChar("leetcode"));      // expect 0
    Console.WriteLine(Solution.FirstUniqChar("loveleetcode"));  // expect 2
    Console.WriteLine(Solution.FirstUniqChar("aabb"));          // expect -1
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
     * Input:    "leetcode"
     * Expected: 0
     *
     * Test Case 2
     * Input:    "loveleetcode"
     * Expected: 2
     *
     * Test Case 3 - none unique
     * Input:    "aabb"
     * Expected: -1
     *
     * Test Case 4 - empty
     * Input:    ""
     * Expected: -1
     *
     * Test Case 5 - answer is the last character
     * Input:    "aabbc"
     * Expected: 4
     *
     * Test Case 6 - single character
     * Input:    "z"
     * Expected: 0
     */
}
EOF
banner E02.2 "First Unique Character"

start_exercise $B E02.3-GroupAnagrams E02.3 $G Medium "Dictionary / grouping" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Group words that are anagrams of each other.
    // The insight is the KEY: find a canonical form two anagrams share.
    // Two options - sorted characters O(L log L), or a 26-count signature O(L).
    public static IList<IList<string>> GroupAnagrams(string[] strs)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var groups = Solution.GroupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]);
    foreach (var g in groups)
        Console.WriteLine($"[{string.Join(", ", g)}]");
    // expect 3 groups: [eat, tea, ate] [tan, nat] [bat]
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
     * Input:    { "eat", "tea", "tan", "ate", "nat", "bat" }
     * Expected: 3 groups - { eat, tea, ate }, { tan, nat }, { bat }   (any order)
     *
     * Test Case 2 - single empty string
     * Input:    { "" }
     * Expected: { { "" } }
     *
     * Test Case 3 - single word
     * Input:    { "a" }
     * Expected: { { "a" } }
     *
     * Test Case 4 - no anagrams at all
     * Input:    { "abc", "def", "ghi" }
     * Expected: 3 groups of 1
     *
     * Test Case 5 - all anagrams of each other
     * Input:    { "abc", "bca", "cab" }
     * Expected: 1 group of 3
     */
}
EOF
banner E02.3 "Group Anagrams"

start_exercise $B E02.4-TopKFrequentElements E02.4 $G Medium "Dictionary + Heap" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // TWO books combine here. Name the job of each before coding:
    //   - one counts
    //   - one selects the top k without sorting everything
    // Target: better than O(n log n).
    // Follow-up: there is an O(n) solution with no heap at all. What bounds
    // the possible frequencies?
    public static int[] TopKFrequent(int[] nums, int k)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(string.Join(", ", Solution.TopKFrequent([1, 1, 1, 2, 2, 3], 2))); // expect 1, 2
    Console.WriteLine(string.Join(", ", Solution.TopKFrequent([1], 1)));                // expect 1
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
     * Input:    nums = { 1, 1, 1, 2, 2, 3 }, k = 2
     * Expected: { 1, 2 }  (any order)
     *
     * Test Case 2
     * Input:    nums = { 1 }, k = 1
     * Expected: { 1 }
     *
     * Test Case 3 - k equals the distinct count
     * Input:    nums = { 1, 2, 3 }, k = 3
     * Expected: { 1, 2, 3 }
     *
     * Test Case 4 - all identical
     * Input:    nums = { 5, 5, 5 }, k = 1
     * Expected: { 5 }
     *
     * Test Case 5 - ties in frequency (any valid answer accepted)
     * Input:    nums = { 1, 2 }, k = 1
     * Expected: { 1 } or { 2 }
     */
}
EOF
banner E02.4 "Top K Frequent Elements"

start_exercise $B E02.5-IsomorphicStrings E02.5 $G Medium "Dictionary / bijection" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Characters of s can be replaced to get t, preserving order.
    // Each character maps to exactly ONE character, and no two characters
    // may map to the SAME one - one dictionary is not enough. Say why.
    public static bool IsIsomorphic(string s, string t)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.IsIsomorphic("egg", "add"));    // expect True
    Console.WriteLine(Solution.IsIsomorphic("foo", "bar"));    // expect False
    Console.WriteLine(Solution.IsIsomorphic("badc", "baba"));  // expect False (b->b, a->a, d->b collision)
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
     * Input:    s = "egg", t = "add"
     * Expected: true
     *
     * Test Case 2
     * Input:    s = "foo", t = "bar"
     * Expected: false
     *
     * Test Case 3 - THE ONE that breaks a single-map solution
     * Input:    s = "badc", t = "baba"
     * Expected: false      (d and c would both have to map to b/a)
     *
     * Test Case 4 - two chars mapping to one
     * Input:    s = "ab", t = "aa"
     * Expected: false
     *
     * Test Case 5 - identical strings
     * Input:    s = "paper", t = "title"
     * Expected: true
     *
     * Test Case 6 - different lengths
     * Input:    s = "ab", t = "abc"
     * Expected: false
     */
}
EOF
banner E02.5 "Isomorphic Strings"

# ---------------------------------------------------------------- Book 03
B=Book03-Array-List; G=Book03-Array-List.md

start_exercise $B E03.1-MoveZeroes E03.1 $G Easy "Array / two pointers" "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // In place, preserving the relative order of the non-zero elements.
    // Target: O(n) time, O(1) space.
    // Two indices with different jobs - name each before writing the loop.
    public static void MoveZeroes(int[] nums)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var a = new[] { 0, 1, 0, 3, 12 };
    Solution.MoveZeroes(a);
    Console.WriteLine(string.Join(", ", a));   // expect 1, 3, 12, 0, 0
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
     * Input:    { 0, 1, 0, 3, 12 }
     * Expected: { 1, 3, 12, 0, 0 }
     *
     * Test Case 2 - all zeroes
     * Input:    { 0, 0, 0 }
     * Expected: { 0, 0, 0 }
     *
     * Test Case 3 - no zeroes
     * Input:    { 1, 2, 3 }
     * Expected: { 1, 2, 3 }
     *
     * Test Case 4 - single element
     * Input:    { 0 }
     * Expected: { 0 }
     *
     * Test Case 5 - zeroes already at the end
     * Input:    { 1, 2, 0, 0 }
     * Expected: { 1, 2, 0, 0 }
     */
}
EOF
banner E03.1 "Move Zeroes"

start_exercise $B E03.2-RotateArray E03.2 $G Medium "Array / in place" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Rotate right by k steps, IN PLACE, O(1) extra space.
    // k may exceed nums.Length.
    // The O(1) version applies ONE operation three times. Which operation?
    public static void Rotate(int[] nums, int k)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var a = new[] { 1, 2, 3, 4, 5, 6, 7 };
    Solution.Rotate(a, 3);
    Console.WriteLine(string.Join(", ", a));   // expect 5, 6, 7, 1, 2, 3, 4
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
     * Input:    { 1, 2, 3, 4, 5, 6, 7 }, k = 3
     * Expected: { 5, 6, 7, 1, 2, 3, 4 }
     *
     * Test Case 2 - k = 0
     * Input:    { 1, 2, 3 }, k = 0
     * Expected: { 1, 2, 3 }
     *
     * Test Case 3 - k equals length
     * Input:    { 1, 2, 3 }, k = 3
     * Expected: { 1, 2, 3 }
     *
     * Test Case 4 - k LARGER than length  (this is the one people miss)
     * Input:    { 1, 2 }, k = 5
     * Expected: { 2, 1 }
     *
     * Test Case 5 - single element
     * Input:    { 1 }, k = 100
     * Expected: { 1 }
     */
}
EOF
banner E03.2 "Rotate Array"

start_exercise $B E03.3-ProductExceptSelf E03.3 $G Medium "Array / prefix-suffix" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // output[i] = product of every element EXCEPT nums[i].
    // Division is NOT allowed. Must run in O(n).
    // O(1) extra space - the output array does not count.
    public static int[] ProductExceptSelf(int[] nums)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(string.Join(", ", Solution.ProductExceptSelf([1, 2, 3, 4])));   // expect 24, 12, 8, 6
    Console.WriteLine(string.Join(", ", Solution.ProductExceptSelf([-1, 1, 0, -3, 3])));// expect 0, 0, 9, 0, 0
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
     * Input:    { 1, 2, 3, 4 }
     * Expected: { 24, 12, 8, 6 }
     *
     * Test Case 2 - contains ONE zero
     * Input:    { -1, 1, 0, -3, 3 }
     * Expected: { 0, 0, 9, 0, 0 }
     *
     * Test Case 3 - contains TWO zeroes (everything becomes 0)
     * Input:    { 0, 0, 1 }
     * Expected: { 0, 0, 0 }
     *
     * Test Case 4 - length 2
     * Input:    { 3, 7 }
     * Expected: { 7, 3 }
     *
     * Test Case 5 - negatives
     * Input:    { -1, -2, -3 }
     * Expected: { 6, 3, 2 }
     */
}
EOF
banner E03.3 "Product of Array Except Self"

start_exercise $B E03.4-MergeSortedArray E03.4 $G Easy "Array / two pointers" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // nums1 has length m + n: the first m entries are values, the rest are 0 padding.
    // Merge nums2 into nums1 IN PLACE, sorted. O(m + n) time, O(1) space.
    // Filling from the FRONT overwrites values you still need. Fill from where?
    public static void Merge(int[] nums1, int m, int[] nums2, int n)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var a = new[] { 1, 2, 3, 0, 0, 0 };
    Solution.Merge(a, 3, [2, 5, 6], 3);
    Console.WriteLine(string.Join(", ", a));   // expect 1, 2, 2, 3, 5, 6
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
     * Input:    nums1 = { 1, 2, 3, 0, 0, 0 }, m = 3, nums2 = { 2, 5, 6 }, n = 3
     * Expected: { 1, 2, 2, 3, 5, 6 }
     *
     * Test Case 2 - nums2 empty
     * Input:    nums1 = { 1 }, m = 1, nums2 = { }, n = 0
     * Expected: { 1 }
     *
     * Test Case 3 - nums1 empty
     * Input:    nums1 = { 0 }, m = 0, nums2 = { 1 }, n = 1
     * Expected: { 1 }
     *
     * Test Case 4 - all of nums2 smaller
     * Input:    nums1 = { 4, 5, 0, 0 }, m = 2, nums2 = { 1, 2 }, n = 2
     * Expected: { 1, 2, 4, 5 }
     *
     * Test Case 5 - duplicates across both
     * Input:    nums1 = { 2, 2, 0, 0 }, m = 2, nums2 = { 2, 2 }, n = 2
     * Expected: { 2, 2, 2, 2 }
     */
}
EOF
banner E03.4 "Merge Sorted Array"

start_exercise $B E03.5-SpiralMatrix E03.5 $G Medium "Array / boundaries" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Return all elements in spiral order.
    // Four moving boundaries: top, bottom, left, right.
    // Re-check the loop condition before the 3rd and 4th walks - that is where
    // single-row and single-column inputs break.
    public static IList<int> SpiralOrder(int[][] matrix)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
int[][] m = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];

try
{
    Console.WriteLine(string.Join(", ", Solution.SpiralOrder(m)));  // expect 1,2,3,6,9,8,7,4,5
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
     * Input:    { {1,2,3}, {4,5,6}, {7,8,9} }
     * Expected: { 1, 2, 3, 6, 9, 8, 7, 4, 5 }
     *
     * Test Case 2 - non square
     * Input:    { {1,2,3,4}, {5,6,7,8}, {9,10,11,12} }
     * Expected: { 1,2,3,4,8,12,11,10,9,5,6,7 }
     *
     * Test Case 3 - single row
     * Input:    { {1,2,3} }
     * Expected: { 1, 2, 3 }
     *
     * Test Case 4 - single column
     * Input:    { {1}, {2}, {3} }
     * Expected: { 1, 2, 3 }
     *
     * Test Case 5 - 1x1
     * Input:    { {7} }
     * Expected: { 7 }
     */
}
EOF
banner E03.5 "Spiral Matrix"

# ---------------------------------------------------------------- Book 04
B=Book04-Stack; G=Book04-Stack.md

start_exercise $B E04.1-ValidParentheses E04.1 $G Easy Stack "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // THREE distinct ways this can fail. Name all three before writing.
    // (Most people forget the third.)
    public static bool IsValid(string s)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.IsValid("()[]{}"));  // expect True
    Console.WriteLine(Solution.IsValid("([)]"));    // expect False
    Console.WriteLine(Solution.IsValid("((("));     // expect False
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
     * Input:    "()[]{}"
     * Expected: true
     *
     * Test Case 2 - wrong nesting order
     * Input:    "([)]"
     * Expected: false
     *
     * Test Case 3 - closer with nothing open
     * Input:    ")"
     * Expected: false
     *
     * Test Case 4 - LEFTOVER openers (the commonly missed case)
     * Input:    "((("
     * Expected: false
     *
     * Test Case 5 - empty
     * Input:    ""
     * Expected: true
     *
     * Test Case 6 - nested correctly
     * Input:    "{[()]}"
     * Expected: true
     */
}
EOF
banner E04.1 "Valid Parentheses"

start_exercise $B E04.2-MinStack E04.2 $G Medium "Stack / design" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
// All four operations must be O(1) - GetMin may NOT rescan.
// What do you store alongside each element, or in parallel with the stack?
public class MinStack
{
    public MinStack()
    {
        throw new NotImplementedException();
    }

    public void Push(int val) => throw new NotImplementedException();

    public void Pop() => throw new NotImplementedException();

    public int Top() => throw new NotImplementedException();

    public int GetMin() => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var st = new MinStack();
    st.Push(-2); st.Push(0); st.Push(-3);
    Console.WriteLine(st.GetMin());   // expect -3
    st.Pop();
    Console.WriteLine(st.Top());      // expect 0
    Console.WriteLine(st.GetMin());   // expect -2
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
     * Push(-2), Push(0), Push(-3), GetMin() -> -3
     * Pop(), Top() -> 0, GetMin() -> -2
     *
     * Test Case 2 - DUPLICATE minimums (the one that breaks naive solutions)
     * Push(1), Push(1), GetMin() -> 1, Pop(), GetMin() -> 1
     *
     * Test Case 3 - popping the current minimum
     * Push(5), Push(2), GetMin() -> 2, Pop(), GetMin() -> 5
     *
     * Test Case 4 - single element
     * Push(7), Top() -> 7, GetMin() -> 7
     *
     * Test Case 5 - descending pushes
     * Push(3), Push(2), Push(1), GetMin() -> 1
     */
}
EOF
banner E04.2 "Min Stack"

start_exercise $B E04.3-EvaluateRPN E04.3 $G Medium Stack "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Postfix expression. Operators: + - * /   Integer division truncates toward zero.
    // WATCH: which operand comes off the stack first? It matters for - and /.
    public static int EvalRPN(string[] tokens)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.EvalRPN(["2", "1", "+", "3", "*"]));   // expect 9
    Console.WriteLine(Solution.EvalRPN(["4", "13", "5", "/", "+"]));  // expect 6
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
     * Input:    { "2", "1", "+", "3", "*" }
     * Expected: 9                          ((2 + 1) * 3)
     *
     * Test Case 2
     * Input:    { "4", "13", "5", "/", "+" }
     * Expected: 6                          (4 + (13 / 5))
     *
     * Test Case 3 - OPERAND ORDER for subtraction
     * Input:    { "5", "3", "-" }
     * Expected: 2                          (5 - 3, NOT 3 - 5)
     *
     * Test Case 4 - single number
     * Input:    { "42" }
     * Expected: 42
     *
     * Test Case 5 - negative operands and truncation toward zero
     * Input:    { "-7", "2", "/" }
     * Expected: -3                         (not -4)
     */
}
EOF
banner E04.3 "Evaluate Reverse Polish Notation"

start_exercise $B E04.4-DecodeString E04.4 $G Medium "Stack / nesting" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Encoding: k[encoded] means the bracketed content repeats k times. Nesting allowed.
    // "3[a2[c]]" -> "accaccacc"
    // At a '[' you suspend what you were building. You push TWO things, not one.
    // k may be multi-digit.
    public static string DecodeString(string s)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.DecodeString("3[a]2[bc]"));  // expect aaabcbc
    Console.WriteLine(Solution.DecodeString("3[a2[c]]"));   // expect accaccacc
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
     * Input:    "3[a]2[bc]"
     * Expected: "aaabcbc"
     *
     * Test Case 2 - nested
     * Input:    "3[a2[c]]"
     * Expected: "accaccacc"
     *
     * Test Case 3 - text outside brackets
     * Input:    "2[abc]3[cd]ef"
     * Expected: "abcabccdcdcdef"
     *
     * Test Case 4 - MULTI-DIGIT count
     * Input:    "12[a]"
     * Expected: "aaaaaaaaaaaa"      (12 a's)
     *
     * Test Case 5 - no brackets at all
     * Input:    "abc"
     * Expected: "abc"
     */
}
EOF
banner E04.4 "Decode String"

start_exercise $B E04.5-AsteroidCollision E04.5 $G Medium Stack "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Positive = moving right, negative = moving left, all same speed.
    // On collision the smaller magnitude explodes; equal magnitudes destroy both.
    // A collision happens for exactly ONE sign-pair-and-order. Which?
    // A surviving asteroid must keep colliding - do not push it immediately.
    public static int[] AsteroidCollision(int[] asteroids)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(string.Join(", ", Solution.AsteroidCollision([5, 10, -5])));  // expect 5, 10
    Console.WriteLine(string.Join(", ", Solution.AsteroidCollision([8, -8])));      // expect (empty)
    Console.WriteLine(string.Join(", ", Solution.AsteroidCollision([10, 2, -5])));  // expect 10
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
     * Input:    { 5, 10, -5 }
     * Expected: { 5, 10 }
     *
     * Test Case 2 - equal magnitudes annihilate
     * Input:    { 8, -8 }
     * Expected: { }
     *
     * Test Case 3 - CHAIN: survivor keeps colliding
     * Input:    { 10, 2, -5 }
     * Expected: { 10 }
     *
     * Test Case 4 - no collisions (moving apart)
     * Input:    { -2, -1, 1, 2 }
     * Expected: { -2, -1, 1, 2 }
     *
     * Test Case 5 - all same direction
     * Input:    { 1, 2, 3 }
     * Expected: { 1, 2, 3 }
     */
}
EOF
banner E04.5 "Asteroid Collision"

# ---------------------------------------------------------------- Book 05
B=Book05-Queue; G=Book05-Queue.md

start_exercise $B E05.1-LevelOrderTraversal E05.1 $G Medium "Queue / BFS" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
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
    // Group node values level by level.
    // ONE line tells you where a level ends. Write it before anything else.
    public static IList<IList<int>> LevelOrder(TreeNode? root)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
//      3
//     / \
//    9  20
//       / \
//      15  7
var root = new TreeNode(3,
    new TreeNode(9),
    new TreeNode(20, new TreeNode(15), new TreeNode(7)));

try
{
    foreach (var level in Solution.LevelOrder(root))
        Console.WriteLine($"[{string.Join(", ", level)}]");
    // expect [3] [9, 20] [15, 7]
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
     * Input:    [3, 9, 20, null, null, 15, 7]
     * Expected: [[3], [9, 20], [15, 7]]
     *
     * Test Case 2 - null root
     * Input:    null
     * Expected: []
     *
     * Test Case 3 - single node
     * Input:    [1]
     * Expected: [[1]]
     *
     * Test Case 4 - left skewed (one node per level)
     * Input:    1 -> left 2 -> left 3
     * Expected: [[1], [2], [3]]
     *
     * Test Case 5 - right skewed
     * Input:    1 -> right 2 -> right 3
     * Expected: [[1], [2], [3]]
     */
}
EOF
banner E05.1 "Binary Tree Level Order Traversal"

start_exercise $B E05.2-NumberOfRecentCalls E05.2 $G Easy "Queue / time window" "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
// Ping(t) is called with STRICTLY INCREASING timestamps.
// Return how many pings happened in the inclusive window [t - 3000, t].
// Amortized O(1) per call.
// Which end do old pings leave from, and which end do new ones enter?
public class RecentCounter
{
    public RecentCounter()
    {
        throw new NotImplementedException();
    }

    public int Ping(int t) => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var c = new RecentCounter();
    Console.WriteLine(c.Ping(1));      // expect 1
    Console.WriteLine(c.Ping(100));    // expect 2
    Console.WriteLine(c.Ping(3001));   // expect 3
    Console.WriteLine(c.Ping(3002));   // expect 3  (the ping at t=1 has expired)
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
     * Ping(1)    -> 1
     * Ping(100)  -> 2
     * Ping(3001) -> 3
     * Ping(3002) -> 3        (t=1 falls outside [2, 3002])
     *
     * Test Case 2 - first call
     * Ping(1) -> 1
     *
     * Test Case 3 - long gap empties the window
     * Ping(1) -> 1, Ping(10000) -> 1
     *
     * Test Case 4 - boundary is INCLUSIVE
     * Ping(1) -> 1, Ping(3001) -> 2      (3001 - 3000 = 1, still counted)
     *
     * Test Case 5 - all inside one window
     * Ping(1), Ping(2), Ping(3) -> 1, 2, 3
     */
}
EOF
banner E05.2 "Number of Recent Calls"

start_exercise $B E05.3-RottingOranges E05.3 $G Medium "Queue / multi-source BFS" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // 0 = empty, 1 = fresh, 2 = rotten.
    // Each minute, rot spreads 4-directionally. Return minutes until no fresh
    // orange remains, or -1 if impossible.
    // There is MORE THAN ONE rotten orange at minute zero. What does that mean
    // for how you seed the queue? Name the technique.
    public static int OrangesRotting(int[][] grid)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
int[][] grid = [[2, 1, 1], [1, 1, 0], [0, 1, 1]];

try
{
    Console.WriteLine(Solution.OrangesRotting(grid));   // expect 4
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
     * Input:    { {2,1,1}, {1,1,0}, {0,1,1} }
     * Expected: 4
     *
     * Test Case 2 - a fresh orange is walled off
     * Input:    { {2,1,1}, {0,1,1}, {1,0,1} }
     * Expected: -1
     *
     * Test Case 3 - NO fresh oranges at start
     * Input:    { {0,2} }
     * Expected: 0                (not the level count)
     *
     * Test Case 4 - fresh but no rotten
     * Input:    { {1} }
     * Expected: -1
     *
     * Test Case 5 - all empty
     * Input:    { {0,0} }
     * Expected: 0
     */
}
EOF
banner E05.3 "Rotting Oranges"

start_exercise $B E05.4-OpenTheLock E05.4 $G Medium "Queue / implicit graph" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // 4 wheels, digits 0-9, wrapping. One move turns one wheel one click.
    // Start at "0000". Never pass through a deadend. Return fewest moves, or -1.
    // There is no graph in the input - you have to SEE one.
    // What is a node? What makes two nodes adjacent?
    public static int OpenLock(string[] deadends, string target)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.OpenLock(["0201", "0101", "0102", "1212", "2002"], "0202")); // expect 6
    Console.WriteLine(Solution.OpenLock(["8888"], "0009"));                                 // expect 1
    Console.WriteLine(Solution.OpenLock(["0000"], "8888"));                                 // expect -1
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
     * Input:    deadends = { "0201","0101","0102","1212","2002" }, target = "0202"
     * Expected: 6
     *
     * Test Case 2 - one click backwards (wrap 0 -> 9)
     * Input:    deadends = { "8888" }, target = "0009"
     * Expected: 1
     *
     * Test Case 3 - START is a deadend
     * Input:    deadends = { "0000" }, target = "8888"
     * Expected: -1
     *
     * Test Case 4 - target is the start
     * Input:    deadends = { }, target = "0000"
     * Expected: 0
     *
     * Test Case 5 - unreachable (ring of deadends)
     * Input:    deadends = { "8887","8889","8878","8898","8788","8988","7888","9888" }, target = "8888"
     * Expected: -1
     */
}
EOF
banner E05.4 "Open the Lock"

start_exercise $B E05.5-StackUsingQueues E05.5 $G Easy "Queue / design" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
// Implement a LIFO stack using ONLY queue operations
// (Enqueue, Dequeue, Peek, Count).
// You can make Push expensive or Pop expensive, but not both cheap. Pick one.
// Challenge: can you do it with a SINGLE queue?
public class MyStack
{
    public MyStack()
    {
        throw new NotImplementedException();
    }

    public void Push(int x) => throw new NotImplementedException();

    public int Pop() => throw new NotImplementedException();

    public int Top() => throw new NotImplementedException();

    public bool Empty() => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var st = new MyStack();
    st.Push(1); st.Push(2);
    Console.WriteLine(st.Top());    // expect 2
    Console.WriteLine(st.Pop());    // expect 2
    Console.WriteLine(st.Empty());  // expect False
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
     * Push(1), Push(2), Top() -> 2, Pop() -> 2, Empty() -> false
     *
     * Test Case 2 - push then pop immediately
     * Push(5), Pop() -> 5, Empty() -> true
     *
     * Test Case 3 - interleaved
     * Push(1), Pop() -> 1, Push(2), Push(3), Pop() -> 3, Top() -> 2
     *
     * Test Case 4 - single element
     * Push(9), Top() -> 9, Top() -> 9    (Top must not remove)
     *
     * Test Case 5 - empty at start
     * Empty() -> true
     */
}
EOF
banner E05.5 "Implement Stack using Queues"

# ---------------------------------------------------------------- Book 06
B=Book06-LinkedList; G=Book06-LinkedList.md

NODE='public class ListNode
{
    public int val;
    public ListNode? next;
    public ListNode(int val = 0, ListNode? next = null) { this.val = val; this.next = next; }
}
'

start_exercise $B E06.1-ReverseLinkedList E06.1 $G Easy "Linked list" "15 minutes"
{ echo "$NODE"; cat <<'EOF'
public static class Solution
{
    // Iterative, O(n) time, O(1) space.
    // Name the one line that, in the wrong order, loses the rest of the list.
    // Return prev, NOT head - head is the tail once you are done.
    public static ListNode? ReverseList(ListNode? head)
    {
        throw new NotImplementedException();
    }

    // Follow-up: write it recursively too. What is the space complexity then?
}
EOF
} > "$DIR/Solution.cs"
cat > "$DIR/Program.cs" <<'EOF'
static ListNode? Build(params int[] vals)
{
    ListNode? head = null;
    for (int i = vals.Length - 1; i >= 0; i--) head = new ListNode(vals[i], head);
    return head;
}

static string Show(ListNode? n)
{
    var parts = new List<string>();
    for (; n != null; n = n.next) parts.Add(n.val.ToString());
    return string.Join(" -> ", parts);
}

try
{
    Console.WriteLine(Show(Solution.ReverseList(Build(1, 2, 3, 4, 5))));  // expect 5 -> 4 -> 3 -> 2 -> 1
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
     * Input:    1 -> 2 -> 3 -> 4 -> 5
     * Expected: 5 -> 4 -> 3 -> 2 -> 1
     *
     * Test Case 2 - empty
     * Input:    null
     * Expected: null
     *
     * Test Case 3 - single node
     * Input:    1
     * Expected: 1
     *
     * Test Case 4 - two nodes
     * Input:    1 -> 2
     * Expected: 2 -> 1
     *
     * Test Case 5 - duplicates
     * Input:    1 -> 1 -> 2
     * Expected: 2 -> 1 -> 1
     */
}
EOF
banner E06.1 "Reverse Linked List"

start_exercise $B E06.2-MiddleOfLinkedList E06.2 $G Easy "Linked list / fast-slow" "10 minutes"
{ echo "$NODE"; cat <<'EOF'
public static class Solution
{
    // SINGLE pass, O(1) space. If there are two middles, return the SECOND.
    // Counting then walking again is two passes. What moves at two speeds?
    public static ListNode? MiddleNode(ListNode? head)
    {
        throw new NotImplementedException();
    }
}
EOF
} > "$DIR/Solution.cs"
cat > "$DIR/Program.cs" <<'EOF'
static ListNode? Build(params int[] vals)
{
    ListNode? head = null;
    for (int i = vals.Length - 1; i >= 0; i--) head = new ListNode(vals[i], head);
    return head;
}

try
{
    Console.WriteLine(Solution.MiddleNode(Build(1, 2, 3, 4, 5))?.val);     // expect 3
    Console.WriteLine(Solution.MiddleNode(Build(1, 2, 3, 4, 5, 6))?.val);  // expect 4 (second middle)
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
     * Test Case 1 - odd length
     * Input:    1 -> 2 -> 3 -> 4 -> 5
     * Expected: node 3
     *
     * Test Case 2 - EVEN length, return the second middle
     * Input:    1 -> 2 -> 3 -> 4 -> 5 -> 6
     * Expected: node 4
     *
     * Test Case 3 - single node
     * Input:    1
     * Expected: node 1
     *
     * Test Case 4 - two nodes
     * Input:    1 -> 2
     * Expected: node 2
     *
     * Test Case 5 - three nodes
     * Input:    1 -> 2 -> 3
     * Expected: node 2
     */
}
EOF
banner E06.2 "Middle of the Linked List"

start_exercise $B E06.3-LinkedListCycleII E06.3 $G Medium "Linked list / Floyd" "25 minutes"
{ echo "$NODE"; cat <<'EOF'
public static class Solution
{
    // Return the node where the cycle BEGINS, or null if there is no cycle.
    // O(1) SPACE REQUIRED - a HashSet of visited nodes violates the constraint.
    // Detecting the cycle is the easy half. Finding the entry needs phase two:
    // after they meet, reset one pointer to head and advance BOTH by one.
    public static ListNode? DetectCycle(ListNode? head)
    {
        throw new NotImplementedException();
    }
}
EOF
} > "$DIR/Solution.cs"
cat > "$DIR/Program.cs" <<'EOF'
// 3 -> 2 -> 0 -> -4
//      ^         |
//      +---------+
var n3 = new ListNode(3);
var n2 = new ListNode(2);
var n0 = new ListNode(0);
var n4 = new ListNode(-4);
n3.next = n2; n2.next = n0; n0.next = n4; n4.next = n2;   // cycle back to n2

try
{
    Console.WriteLine(Solution.DetectCycle(n3)?.val);          // expect 2
    Console.WriteLine(Solution.DetectCycle(new ListNode(1)));  // expect (blank / null)
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
     * Input:    3 -> 2 -> 0 -> -4, tail links back to node 2
     * Expected: node 2
     *
     * Test Case 2 - no cycle
     * Input:    1 -> 2
     * Expected: null
     *
     * Test Case 3 - single node, no cycle
     * Input:    1
     * Expected: null
     *
     * Test Case 4 - SELF loop
     * Input:    1 -> itself
     * Expected: node 1
     *
     * Test Case 5 - whole list is one cycle
     * Input:    1 -> 2 -> 3 -> back to 1
     * Expected: node 1
     */
}
EOF
banner E06.3 "Linked List Cycle II"

start_exercise $B E06.4-RemoveNthFromEnd E06.4 $G Medium "Linked list / dummy head" "20 minutes"
{ echo "$NODE"; cat <<'EOF'
public static class Solution
{
    // ONE pass, O(1) space.
    // Two pointers, one started ahead of the other. How far ahead?
    // Use a DUMMY HEAD - it removes the "deleting the first node" special case.
    public static ListNode? RemoveNthFromEnd(ListNode? head, int n)
    {
        throw new NotImplementedException();
    }
}
EOF
} > "$DIR/Solution.cs"
cat > "$DIR/Program.cs" <<'EOF'
static ListNode? Build(params int[] vals)
{
    ListNode? head = null;
    for (int i = vals.Length - 1; i >= 0; i--) head = new ListNode(vals[i], head);
    return head;
}

static string Show(ListNode? n)
{
    var parts = new List<string>();
    for (; n != null; n = n.next) parts.Add(n.val.ToString());
    return parts.Count == 0 ? "(empty)" : string.Join(" -> ", parts);
}

try
{
    Console.WriteLine(Show(Solution.RemoveNthFromEnd(Build(1, 2, 3, 4, 5), 2)));  // expect 1 -> 2 -> 3 -> 5
    Console.WriteLine(Show(Solution.RemoveNthFromEnd(Build(1), 1)));              // expect (empty)
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
     * Input:    1 -> 2 -> 3 -> 4 -> 5, n = 2
     * Expected: 1 -> 2 -> 3 -> 5
     *
     * Test Case 2 - REMOVING THE HEAD (n equals the length)
     * Input:    1 -> 2, n = 2
     * Expected: 2
     *
     * Test Case 3 - single node
     * Input:    1, n = 1
     * Expected: null
     *
     * Test Case 4 - removing the tail
     * Input:    1 -> 2 -> 3, n = 1
     * Expected: 1 -> 2
     *
     * Test Case 5 - two nodes, remove the second
     * Input:    1 -> 2, n = 1
     * Expected: 1
     */
}
EOF
banner E06.4 "Remove Nth Node From End"

start_exercise $B E06.5-ReorderList E06.5 $G Medium "Linked list / composed" "30 minutes"
{ echo "$NODE"; cat <<'EOF'
public static class Solution
{
    // L0 -> L1 -> ... -> Ln-1 -> Ln   becomes   L0 -> Ln -> L1 -> Ln-1 -> ...
    // Rewire nodes; do NOT modify values. O(n) time, O(1) space.
    //
    // This is THREE exercises you have already done, chained.
    // Name all three before writing a line.
    // Watch: null-terminate the first half before reversing the second, or you
    // will build a cycle.
    public static void ReorderList(ListNode? head)
    {
        throw new NotImplementedException();
    }
}
EOF
} > "$DIR/Solution.cs"
cat > "$DIR/Program.cs" <<'EOF'
static ListNode? Build(params int[] vals)
{
    ListNode? head = null;
    for (int i = vals.Length - 1; i >= 0; i--) head = new ListNode(vals[i], head);
    return head;
}

static string Show(ListNode? n)
{
    var parts = new List<string>();
    for (int guard = 0; n != null && guard < 50; n = n.next, guard++) parts.Add(n.val.ToString());
    return string.Join(" -> ", parts);
}

try
{
    var a = Build(1, 2, 3, 4);
    Solution.ReorderList(a);
    Console.WriteLine(Show(a));   // expect 1 -> 4 -> 2 -> 3

    var b = Build(1, 2, 3, 4, 5);
    Solution.ReorderList(b);
    Console.WriteLine(Show(b));   // expect 1 -> 5 -> 2 -> 4 -> 3
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
     * Test Case 1 - even length
     * Input:    1 -> 2 -> 3 -> 4
     * Expected: 1 -> 4 -> 2 -> 3
     *
     * Test Case 2 - odd length
     * Input:    1 -> 2 -> 3 -> 4 -> 5
     * Expected: 1 -> 5 -> 2 -> 4 -> 3
     *
     * Test Case 3 - single node
     * Input:    1
     * Expected: 1
     *
     * Test Case 4 - two nodes
     * Input:    1 -> 2
     * Expected: 1 -> 2
     *
     * Test Case 5 - three nodes
     * Input:    1 -> 2 -> 3
     * Expected: 1 -> 3 -> 2
     *
     * NOTE: after reordering, the final node's next MUST be null.
     * If Show() above prints 50 values, you have created a cycle.
     */
}
EOF
banner E06.5 "Reorder List"

echo "Books 01-06 done."
