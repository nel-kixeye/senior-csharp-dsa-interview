#!/usr/bin/env bash
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
echo "Books 07-12"

# ---------------------------------------------------------------- Book 07
B=Book07-PriorityQueue; G=Book07-PriorityQueue.md

start_exercise $B E07.1-KthLargestElement E07.1 $G Medium PriorityQueue "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // kth largest in SORTED ORDER, not the kth distinct value.
    // Target: better than O(n log n).
    // Name three valid approaches and their complexities before you pick one.
    // Reminder: for the k LARGEST, keep a MIN-heap of size k.
    public static int FindKthLargest(int[] nums, int k)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.FindKthLargest([3, 2, 1, 5, 6, 4], 2));        // expect 5
    Console.WriteLine(Solution.FindKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4));// expect 4
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
     * Input:    { 3, 2, 1, 5, 6, 4 }, k = 2      Expected: 5
     *
     * Test Case 2 - duplicates count separately (NOT distinct)
     * Input:    { 3, 2, 3, 1, 2, 4, 5, 5, 6 }, k = 4    Expected: 4
     *
     * Test Case 3 - k = 1 is the maximum
     * Input:    { 1, 2, 3 }, k = 1               Expected: 3
     *
     * Test Case 4 - k = n is the minimum
     * Input:    { 1, 2, 3 }, k = 3               Expected: 1
     *
     * Test Case 5 - all identical
     * Input:    { 7, 7, 7 }, k = 2               Expected: 7
     */
}
EOF
banner E07.1 "Kth Largest Element"

start_exercise $B E07.2-KClosestPoints E07.2 $G Medium PriorityQueue "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // k points closest to the origin. Any order in the result.
    // Target: O(n log k) time, O(k) space.
    // Do you need Math.Sqrt? Decide BEFORE writing - it affects both speed and
    // floating point risk.
    // Mirror of E07.1: you want the CLOSEST, so you evict the FARTHEST.
    public static int[][] KClosest(int[][] points, int k)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    foreach (var p in Solution.KClosest([[1, 3], [-2, 2]], 1))
        Console.WriteLine($"[{p[0]}, {p[1]}]");        // expect [-2, 2]
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
     * Input:    { {1,3}, {-2,2} }, k = 1         Expected: { {-2,2} }
     *
     * Test Case 2
     * Input:    { {3,3}, {5,-1}, {-2,4} }, k = 2 Expected: { {3,3}, {-2,4} } (any order)
     *
     * Test Case 3 - k equals the point count
     * Input:    { {1,1}, {2,2} }, k = 2          Expected: both
     *
     * Test Case 4 - point AT the origin
     * Input:    { {0,0}, {1,1} }, k = 1          Expected: { {0,0} }
     *
     * Test Case 5 - ties in distance (any valid answer)
     * Input:    { {1,0}, {-1,0} }, k = 1         Expected: either
     */
}
EOF
banner E07.2 "K Closest Points to Origin"

start_exercise $B E07.3-TaskScheduler E07.3 $G Medium "PriorityQueue + counting" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Identical tasks must be separated by at least n intervals.
    // Return the minimum total intervals INCLUDING idles.
    // Greedy: always schedule the most frequent remaining task. Why is that safe?
    // Follow-up: derive the closed-form formula using only maxFreq and the number
    // of labels tied at it.
    public static int LeastInterval(char[] tasks, int n)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.LeastInterval(['A','A','A','B','B','B'], 2));  // expect 8
    Console.WriteLine(Solution.LeastInterval(['A','A','A','B','B','B'], 0));  // expect 6
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
     * Input:    { A,A,A,B,B,B }, n = 2      Expected: 8   (A B idle A B idle A B)
     *
     * Test Case 2 - no cooldown
     * Input:    { A,A,A,B,B,B }, n = 0      Expected: 6
     *
     * Test Case 3 - many distinct labels, no idling needed
     * Input:    { A,A,A,B,B,B,C,C,C,D,D,E }, n = 2   Expected: 12
     *
     * Test Case 4 - all identical
     * Input:    { A,A,A }, n = 2            Expected: 7   (A idle idle A idle idle A)
     *
     * Test Case 5 - single task
     * Input:    { A }, n = 5                Expected: 1
     */
}
EOF
banner E07.3 "Task Scheduler"

start_exercise $B E07.4-MedianFromDataStream E07.4 $G Hard "PriorityQueue / two heaps" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
// AddNum in O(log n), FindMedian in O(1).
// ONE heap cannot do this. Two heaps let you see the boundary:
//   max-heap for the lower half, min-heap for the upper half.
// State the invariant you must restore after every insert.
public class MedianFinder
{
    public MedianFinder()
    {
        throw new NotImplementedException();
    }

    public void AddNum(int num) => throw new NotImplementedException();

    public double FindMedian() => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var m = new MedianFinder();
    m.AddNum(1);
    m.AddNum(2);
    Console.WriteLine(m.FindMedian());   // expect 1.5
    m.AddNum(3);
    Console.WriteLine(m.FindMedian());   // expect 2
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
     * Add(1), Add(2), FindMedian() -> 1.5, Add(3), FindMedian() -> 2.0
     *
     * Test Case 2 - single element
     * Add(5), FindMedian() -> 5.0
     *
     * Test Case 3 - all duplicates
     * Add(2), Add(2), Add(2), FindMedian() -> 2.0
     *
     * Test Case 4 - strictly DESCENDING input (stresses rebalancing)
     * Add(5), Add(4), Add(3), Add(2), Add(1), FindMedian() -> 3.0
     *
     * Test Case 5 - negatives and even count
     * Add(-1), Add(-2), FindMedian() -> -1.5
     */
}
EOF
banner E07.4 "Find Median from Data Stream"

start_exercise $B E07.5-MergeKSortedLists E07.5 $G Hard "PriorityQueue + linked list" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public class ListNode
{
    public int val;
    public ListNode? next;
    public ListNode(int val = 0, ListNode? next = null) { this.val = val; this.next = next; }
}

public static class Solution
{
    // Target: O(N log k) for N total nodes.
    // The heap holds one node per list - size k, NOT N.
    // Why is concatenate-then-sort worse? Say what information it discards.
    // Alternative worth knowing: divide and conquer, pairwise merging.
    public static ListNode? MergeKLists(ListNode?[] lists)
    {
        throw new NotImplementedException();
    }
}
EOF
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
    ListNode?[] lists = [Build(1, 4, 5), Build(1, 3, 4), Build(2, 6)];
    Console.WriteLine(Show(Solution.MergeKLists(lists)));  // expect 1 -> 1 -> 2 -> 3 -> 4 -> 4 -> 5 -> 6
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
     * Input:    [[1,4,5], [1,3,4], [2,6]]
     * Expected: 1 -> 1 -> 2 -> 3 -> 4 -> 4 -> 5 -> 6
     *
     * Test Case 2 - no lists
     * Input:    []                Expected: null
     *
     * Test Case 3 - one EMPTY list
     * Input:    [[]]              Expected: null
     *
     * Test Case 4 - some lists null, some not
     * Input:    [null, [1], null] Expected: 1
     *
     * Test Case 5 - very unequal lengths
     * Input:    [[1,2,3,4,5], [0]]  Expected: 0 -> 1 -> 2 -> 3 -> 4 -> 5
     */
}
EOF
banner E07.5 "Merge k Sorted Lists"

# ---------------------------------------------------------------- Book 08
B=Book08-SortedSet-SortedDictionary; G=Book08-SortedSet-SortedDictionary.md

start_exercise $B E08.1-ContainsDuplicateIII E08.1 $G Hard SortedSet "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Exist i, j with |i - j| <= indexDiff AND |nums[i] - nums[j]| <= valueDiff?
    // Target: O(n log k) time, O(k) space.
    // Two things maintained at once: a sliding window of the last k values,
    // AND the ability to ask that window a RANGE question.
    // WATCH: nums[i] - nums[j] can overflow int. Use long.
    public static bool ContainsNearbyAlmostDuplicate(int[] nums, int indexDiff, int valueDiff)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.ContainsNearbyAlmostDuplicate([1, 2, 3, 1], 3, 0));    // expect True
    Console.WriteLine(Solution.ContainsNearbyAlmostDuplicate([1, 5, 9, 1, 5, 9], 2, 3));// expect False
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
     * Input:    { 1,2,3,1 }, indexDiff = 3, valueDiff = 0   Expected: true
     *
     * Test Case 2
     * Input:    { 1,5,9,1,5,9 }, indexDiff = 2, valueDiff = 3  Expected: false
     *
     * Test Case 3 - valueDiff = 0 means exact duplicates only
     * Input:    { 1,2,1 }, indexDiff = 1, valueDiff = 0     Expected: false
     *
     * Test Case 4 - OVERFLOW guard
     * Input:    { -2147483648, 2147483647 }, indexDiff = 1, valueDiff = 1
     * Expected: false     (naive int subtraction wraps and wrongly returns true)
     *
     * Test Case 5 - single element
     * Input:    { 1 }, indexDiff = 1, valueDiff = 1         Expected: false
     */
}
EOF
banner E08.1 "Contains Duplicate III"

start_exercise $B E08.2-MyCalendarI E08.2 $G Medium "SortedDictionary / intervals" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
// Book(start, end) for the HALF-OPEN interval [start, end).
// Return true and record it if it does not overlap anything already booked.
// Target: O(log n) per booking.
// You only need to check TWO existing bookings, not all of them. Which two?
public class MyCalendar
{
    public MyCalendar()
    {
        throw new NotImplementedException();
    }

    public bool Book(int start, int end) => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var c = new MyCalendar();
    Console.WriteLine(c.Book(10, 20));   // expect True
    Console.WriteLine(c.Book(15, 25));   // expect False (overlaps)
    Console.WriteLine(c.Book(20, 30));   // expect True  (touching is NOT overlapping)
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
     * Book(10,20) -> true, Book(15,25) -> false, Book(20,30) -> true
     *
     * Test Case 2 - TOUCHING endpoints must succeed (half-open)
     * Book(10,20) -> true, Book(20,30) -> true
     *
     * Test Case 3 - new booking fully CONTAINS an existing one
     * Book(10,20) -> true, Book(5,30) -> false
     *
     * Test Case 4 - new booking fully INSIDE an existing one
     * Book(10,20) -> true, Book(12,15) -> false
     *
     * Test Case 5 - identical booking
     * Book(10,20) -> true, Book(10,20) -> false
     */
}
EOF
banner E08.2 "My Calendar I"

start_exercise $B E08.3-TimeBasedKeyValueStore E08.3 $G Medium "Binary search over sorted appends" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
// Set(key, value, timestamp); Get(key, timestamp) returns the value with the
// LARGEST timestamp <= the requested one, or "" if none.
// Timestamps for a given key arrive STRICTLY INCREASING.
// That fact means you may not need a tree at all - what cheaper structure does
// it permit? Target: O(1) Set, O(log n) Get.
public class TimeMap
{
    public TimeMap()
    {
        throw new NotImplementedException();
    }

    public void Set(string key, string value, int timestamp) => throw new NotImplementedException();

    public string Get(string key, int timestamp) => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var m = new TimeMap();
    m.Set("foo", "bar", 1);
    Console.WriteLine(m.Get("foo", 1));   // expect bar
    Console.WriteLine(m.Get("foo", 3));   // expect bar
    m.Set("foo", "bar2", 4);
    Console.WriteLine(m.Get("foo", 4));   // expect bar2
    Console.WriteLine(m.Get("foo", 5));   // expect bar2
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
     * Set("foo","bar",1); Get("foo",1) -> "bar"; Get("foo",3) -> "bar"
     * Set("foo","bar2",4); Get("foo",4) -> "bar2"; Get("foo",5) -> "bar2"
     *
     * Test Case 2 - key never set
     * Get("nope", 1) -> ""
     *
     * Test Case 3 - timestamp EARLIER than every stored one
     * Set("a","x",5); Get("a",1) -> ""
     *
     * Test Case 4 - exact timestamp match
     * Set("a","x",5); Get("a",5) -> "x"
     *
     * Test Case 5 - several versions, pick the right one
     * Set("a","v1",1); Set("a","v2",10); Get("a",9) -> "v1"
     */
}
EOF
banner E08.3 "Time Based Key-Value Store"

start_exercise $B E08.4-DataStreamAsDisjointIntervals E08.4 $G Hard "SortedDictionary / intervals" "35 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
// AddNum(int) and GetIntervals() returning the stream summarized as a sorted
// list of DISJOINT intervals. Target: O(log n) per add.
// On adding a value you must find its neighbours to decide: extend left,
// extend right, MERGE both, or create new. Which query does that need?
public class SummaryRanges
{
    public SummaryRanges()
    {
        throw new NotImplementedException();
    }

    public void AddNum(int value) => throw new NotImplementedException();

    public int[][] GetIntervals() => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
static void Dump(int[][] ivs) =>
    Console.WriteLine(string.Join(" ", ivs.Select(i => $"[{i[0]},{i[1]}]")));

try
{
    var s = new SummaryRanges();
    s.AddNum(1); Dump(s.GetIntervals());   // expect [1,1]
    s.AddNum(3); Dump(s.GetIntervals());   // expect [1,1] [3,3]
    s.AddNum(7); Dump(s.GetIntervals());   // expect [1,1] [3,3] [7,7]
    s.AddNum(2); Dump(s.GetIntervals());   // expect [1,3] [7,7]   <- MERGE
    s.AddNum(6); Dump(s.GetIntervals());   // expect [1,3] [6,7]
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
     * Add 1 -> [[1,1]]
     * Add 3 -> [[1,1],[3,3]]
     * Add 7 -> [[1,1],[3,3],[7,7]]
     * Add 2 -> [[1,3],[7,7]]        <- 2 BRIDGES two intervals, merge them
     * Add 6 -> [[1,3],[6,7]]
     *
     * Test Case 2 - duplicate value changes nothing
     * Add 1, Add 1 -> [[1,1]]
     *
     * Test Case 3 - extends an interval on the LEFT
     * Add 5, Add 4 -> [[4,5]]
     *
     * Test Case 4 - extends an interval on the RIGHT
     * Add 5, Add 6 -> [[5,6]]
     *
     * Test Case 5 - first value into an empty stream
     * Add 42 -> [[42,42]]
     */
}
EOF
banner E08.4 "Data Stream as Disjoint Intervals"

start_exercise $B E08.5-SlidingWindowMedian E08.5 $G Hard "Multiset / two heaps" "40 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Median of every window of size k. Target: O(n log k).
    // The two-heap trick (E07.4) cannot REMOVE an arbitrary element - state the
    // problem that creates.
    // .NET has no multiset, and SortedSet refuses duplicates. Two ways round it:
    //   - SortedSet<(int value, int index)>  (the index makes each entry unique)
    //   - two heaps with LAZY DELETION
    // WATCH: the even-k median is ((long)a + b) / 2.0, not (a + b) / 2.
    public static double[] MedianSlidingWindow(int[] nums, int k)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(string.Join(", ", Solution.MedianSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3)));
    // expect 1, -1, -1, 3, 5, 6
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
     * Input:    { 1,3,-1,-3,5,3,6,7 }, k = 3
     * Expected: { 1, -1, -1, 3, 5, 6 }
     *
     * Test Case 2 - k = 1 returns the array itself
     * Input:    { 1,2,3 }, k = 1        Expected: { 1, 2, 3 }
     *
     * Test Case 3 - EVEN k averages the two middles
     * Input:    { 1,2,3,4 }, k = 2      Expected: { 1.5, 2.5, 3.5 }
     *
     * Test Case 4 - duplicates in the window
     * Input:    { 2,2,2,2 }, k = 2      Expected: { 2.0, 2.0, 2.0 }
     *
     * Test Case 5 - OVERFLOW on the average
     * Input:    { 2147483647, 2147483647 }, k = 2
     * Expected: { 2147483647.0 }   (int addition would wrap negative)
     */
}
EOF
banner E08.5 "Sliding Window Median"

# ---------------------------------------------------------------- Book 09
B=Book09-TwoPointers; G=Book09-TwoPointers.md

start_exercise $B E09.1-ValidPalindrome E09.1 $G Easy "Two pointers" "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Alphanumeric only, ignoring case. O(n) time, O(1) SPACE - do not build a
    // cleaned copy of the string.
    // What do the pointers do when they land on punctuation?
    public static bool IsPalindrome(string s)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.IsPalindrome("A man, a plan, a canal: Panama")); // expect True
    Console.WriteLine(Solution.IsPalindrome("race a car"));                     // expect False
    Console.WriteLine(Solution.IsPalindrome(" "));                              // expect True
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
     * Input:    "A man, a plan, a canal: Panama"   Expected: true
     *
     * Test Case 2
     * Input:    "race a car"                       Expected: false
     *
     * Test Case 3 - ALL non-alphanumeric (guard against running off the end)
     * Input:    ".,;!"                             Expected: true
     *
     * Test Case 4 - empty
     * Input:    ""                                 Expected: true
     *
     * Test Case 5 - digits and mixed case
     * Input:    "0P"                               Expected: false
     */
}
EOF
banner E09.1 "Valid Palindrome"

start_exercise $B E09.2-TwoSumII E09.2 $G Medium "Two pointers" "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Input is SORTED and 1-INDEXED. Return the two 1-based indices.
    // O(1) EXTRA SPACE required - that rules out the Dictionary approach.
    // When the sum is too small, which pointer moves, and WHY is it safe to
    // discard everything it skipped?
    public static int[] TwoSum(int[] numbers, int target)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(string.Join(", ", Solution.TwoSum([2, 7, 11, 15], 9)));  // expect 1, 2
    Console.WriteLine(string.Join(", ", Solution.TwoSum([-1, 0], -1)));        // expect 1, 2
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
     * Input:    { 2,7,11,15 }, target = 9    Expected: { 1, 2 }  (1-indexed!)
     *
     * Test Case 2 - answer uses first and last
     * Input:    { 1,2,3,4 }, target = 5      Expected: { 1, 4 }
     *
     * Test Case 3 - negatives
     * Input:    { -1, 0 }, target = -1       Expected: { 1, 2 }
     *
     * Test Case 4 - duplicates
     * Input:    { 1,3,3,4 }, target = 6      Expected: { 2, 3 }
     *
     * Test Case 5 - two elements only
     * Input:    { 5, 25 }, target = 30       Expected: { 1, 2 }
     */
}
EOF
banner E09.2 "Two Sum II (Input Sorted)"

start_exercise $B E09.3-ThreeSum E09.3 $G Medium "Sorting + two pointers" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // All UNIQUE triplets summing to zero.
    // Target: O(n^2) time, O(1) extra space beyond the output.
    // Sorting does TWO jobs here. Name both.
    // (Most people name only the first, then produce duplicate triplets.)
    public static IList<IList<int>> ThreeSum(int[] nums)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    foreach (var t in Solution.ThreeSum([-1, 0, 1, 2, -1, -4]))
        Console.WriteLine($"[{string.Join(", ", t)}]");
    // expect [-1, -1, 2] and [-1, 0, 1]  -- exactly two triplets, no duplicates
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
     * Input:    { -1, 0, 1, 2, -1, -4 }
     * Expected: { {-1,-1,2}, {-1,0,1} }    exactly 2 triplets
     *
     * Test Case 2 - ALL ZEROES (duplicate control)
     * Input:    { 0, 0, 0, 0 }
     * Expected: { {0,0,0} }                exactly 1 triplet
     *
     * Test Case 3 - no valid triplet
     * Input:    { 1, 2, 3 }                Expected: { }
     *
     * Test Case 4 - fewer than 3 elements
     * Input:    { 0, 1 }                   Expected: { }
     *
     * Test Case 5 - many duplicates
     * Input:    { -2, 0, 0, 2, 2 }
     * Expected: { {-2, 0, 2} }             exactly 1 triplet
     */
}
EOF
banner E09.3 "3Sum"

start_exercise $B E09.4-ContainerWithMostWater E09.4 $G Medium "Two pointers" "20 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Two lines plus the x-axis form a container. Maximize the water held.
    // Target: O(n) time, O(1) space.
    // Start wide. Moving inward always shrinks the width, so move the pointer
    // that COULD let height grow. Which one, and why is discarding the other safe?
    public static int MaxArea(int[] height)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.MaxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]));  // expect 49
    Console.WriteLine(Solution.MaxArea([1, 1]));                        // expect 1
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
     * Input:    { 1,8,6,2,5,4,8,3,7 }    Expected: 49
     *
     * Test Case 2 - two lines
     * Input:    { 1, 1 }                 Expected: 1
     *
     * Test Case 3 - all equal (widest wins)
     * Input:    { 5,5,5,5 }              Expected: 15
     *
     * Test Case 4 - strictly increasing
     * Input:    { 1,2,3,4,5 }            Expected: 6
     *
     * Test Case 5 - contains a zero height
     * Input:    { 0, 2, 0 }              Expected: 0
     */
}
EOF
banner E09.4 "Container With Most Water"

start_exercise $B E09.5-SortColors E09.5 $G Medium "Dutch national flag" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Array contains only 0, 1, 2. Sort IN PLACE, ONE PASS, O(1) space.
    // Counting sort does it in two passes - the one-pass version needs THREE
    // pointers. Name each one's job.
    // Critical: in exactly one case the scanning index must NOT advance. Which,
    // and why?
    public static void SortColors(int[] nums)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var a = new[] { 2, 0, 2, 1, 1, 0 };
    Solution.SortColors(a);
    Console.WriteLine(string.Join(", ", a));   // expect 0, 0, 1, 1, 2, 2
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
     * Input:    { 2,0,2,1,1,0 }     Expected: { 0,0,1,1,2,2 }
     *
     * Test Case 2 - already sorted
     * Input:    { 0,1,2 }           Expected: { 0,1,2 }
     *
     * Test Case 3 - reverse sorted
     * Input:    { 2,1,0 }           Expected: { 0,1,2 }
     *
     * Test Case 4 - all one value
     * Input:    { 1,1,1 }           Expected: { 1,1,1 }
     *
     * Test Case 5 - a value missing entirely
     * Input:    { 2,0,2,0 }         Expected: { 0,0,2,2 }
     */
}
EOF
banner E09.5 "Sort Colors"

# ---------------------------------------------------------------- Book 10
B=Book10-SlidingWindow; G=Book10-SlidingWindow.md

start_exercise $B E10.1-MaximumAverageSubarray E10.1 $G Easy "Fixed sliding window" "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Contiguous subarray of EXACTLY length k with the maximum average.
    // Target: O(n) time, O(1) space.
    // One element enters and one leaves per step. Write those two lines first.
    // Track the SUM and divide once at the end - dividing per window loses
    // precision and time.
    public static double FindMaxAverage(int[] nums, int k)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.FindMaxAverage([1, 12, -5, -6, 50, 3], 4));  // expect 12.75
    Console.WriteLine(Solution.FindMaxAverage([5], 1));                     // expect 5
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
     * Input:    { 1,12,-5,-6,50,3 }, k = 4    Expected: 12.75
     *
     * Test Case 2 - k = n
     * Input:    { 1,2,3,4 }, k = 4            Expected: 2.5
     *
     * Test Case 3 - k = 1
     * Input:    { -1, -5, 3 }, k = 1          Expected: 3.0
     *
     * Test Case 4 - ALL NEGATIVE (best must not start at 0)
     * Input:    { -5, -2, -10 }, k = 2        Expected: -3.5
     *
     * Test Case 5 - single element
     * Input:    { 5 }, k = 1                  Expected: 5.0
     */
}
EOF
banner E10.1 "Maximum Average Subarray I"

start_exercise $B E10.2-LongestSubstringNoRepeat E10.2 $G Medium "Sliding window + Dictionary" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Length of the longest substring with NO repeated character.
    // Target: O(n) time, O(min(n, alphabet)) space.
    // When you hit a repeat, where does left jump to?
    // This is a LONGEST problem - record the best OUTSIDE the shrink loop.
    public static int LengthOfLongestSubstring(string s)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.LengthOfLongestSubstring("abcabcbb"));  // expect 3
    Console.WriteLine(Solution.LengthOfLongestSubstring("bbbbb"));     // expect 1
    Console.WriteLine(Solution.LengthOfLongestSubstring("pwwkew"));    // expect 3
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
     * Input:    "abcabcbb"     Expected: 3   ("abc")
     *
     * Test Case 2 - all identical
     * Input:    "bbbbb"        Expected: 1
     *
     * Test Case 3 - the answer is NOT a prefix
     * Input:    "pwwkew"       Expected: 3   ("wke", not "pwke" which is a subsequence)
     *
     * Test Case 4 - empty
     * Input:    ""             Expected: 0
     *
     * Test Case 5 - all distinct (whole string)
     * Input:    "abcdef"       Expected: 6
     */
}
EOF
banner E10.2 "Longest Substring Without Repeating Characters"

start_exercise $B E10.3-CharacterReplacement E10.3 $G Medium "Variable sliding window" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Change at most k characters. Return the longest achievable run of ONE
    // repeated character. Uppercase letters only.
    // Target: O(n) time, O(1) space.
    // A window is valid when:  windowLength - countOfMostFrequent <= k
    // Say what that expression MEANS in words before you use it.
    public static int CharacterReplacement(string s, int k)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.CharacterReplacement("ABAB", 2));     // expect 4
    Console.WriteLine(Solution.CharacterReplacement("AABABBA", 1));  // expect 4
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
     * Input:    "ABAB", k = 2       Expected: 4
     *
     * Test Case 2
     * Input:    "AABABBA", k = 1    Expected: 4
     *
     * Test Case 3 - k = 0, no changes allowed
     * Input:    "ABAB", k = 0       Expected: 1
     *
     * Test Case 4 - already uniform
     * Input:    "AAAA", k = 2       Expected: 4
     *
     * Test Case 5 - k >= n
     * Input:    "ABCD", k = 10      Expected: 4
     */
}
EOF
banner E10.3 "Longest Repeating Character Replacement"

start_exercise $B E10.4-PermutationInString E10.4 $G Medium "Fixed window + counts" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Does s2 contain a PERMUTATION of s1 as a contiguous substring?
    // Target: O(n) time, O(1) space.
    // The window is a FIXED size - which one?
    // Compare two 26-slot profiles in O(1) per step, not O(26): keep a
    // "matches" counter and adjust it as counts change.
    public static bool CheckInclusion(string s1, string s2)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.CheckInclusion("ab", "eidbaooo"));   // expect True  ("ba")
    Console.WriteLine(Solution.CheckInclusion("ab", "eidboaoo"));   // expect False
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
     * Input:    s1 = "ab", s2 = "eidbaooo"   Expected: true
     *
     * Test Case 2
     * Input:    s1 = "ab", s2 = "eidboaoo"   Expected: false
     *
     * Test Case 3 - s1 longer than s2
     * Input:    s1 = "abc", s2 = "ab"        Expected: false
     *
     * Test Case 4 - identical strings
     * Input:    s1 = "abc", s2 = "abc"       Expected: true
     *
     * Test Case 5 - REPEATED characters in s1 (counts must match, not just presence)
     * Input:    s1 = "aab", s2 = "abab"      Expected: false
     */
}
EOF
banner E10.4 "Permutation in String"

start_exercise $B E10.5-MinimumWindowSubstring E10.5 $G Hard "Variable window / shortest" "40 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // SHORTEST substring of s containing every character of t INCLUDING duplicates.
    // Return "" if none exists. Target: O(n + m).
    //
    // This is a SHORTEST problem: record the best INSIDE the shrink loop.
    // (Mirror of E10.2, where it goes outside. Getting this backwards is the
    // classic bug - say it out loud before writing.)
    //
    // Increment "have" only when a count REACHES its requirement, not on every
    // occurrence. That is what handles duplicates in t.
    public static string MinWindow(string s, string t)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.MinWindow("ADOBECODEBANC", "ABC"));  // expect BANC
    Console.WriteLine($"[{Solution.MinWindow("a", "aa")}]");        // expect []
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
     * Input:    s = "ADOBECODEBANC", t = "ABC"   Expected: "BANC"
     *
     * Test Case 2 - t longer than s
     * Input:    s = "a", t = "aa"                Expected: ""
     *
     * Test Case 3 - DUPLICATES in t
     * Input:    s = "aa", t = "aa"               Expected: "aa"
     *
     * Test Case 4 - no valid window
     * Input:    s = "abc", t = "d"               Expected: ""
     *
     * Test Case 5 - the answer is the whole string
     * Input:    s = "ab", t = "ba"               Expected: "ab"
     */
}
EOF
banner E10.5 "Minimum Window Substring"

# ---------------------------------------------------------------- Book 11
B=Book11-PrefixSum; G=Book11-PrefixSum.md

start_exercise $B E11.1-FindPivotIndex E11.1 $G Easy "Prefix sum" "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Leftmost index where sum(left) == sum(right). -1 if none.
    // Target: O(n) time, O(1) space.
    // You do NOT need a prefix array here. What single running value plus the
    // total is enough?
    public static int PivotIndex(int[] nums)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.PivotIndex([1, 7, 3, 6, 5, 6]));  // expect 3
    Console.WriteLine(Solution.PivotIndex([1, 2, 3]));           // expect -1
    Console.WriteLine(Solution.PivotIndex([2, 1, -1]));          // expect 0
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
     * Input:    { 1,7,3,6,5,6 }   Expected: 3
     *
     * Test Case 2 - no pivot
     * Input:    { 1,2,3 }         Expected: -1
     *
     * Test Case 3 - INDEX 0 is the pivot (left sum is 0)
     * Input:    { 2,1,-1 }        Expected: 0
     *
     * Test Case 4 - all zeroes, leftmost wins
     * Input:    { 0,0,0 }         Expected: 0
     *
     * Test Case 5 - single element
     * Input:    { 5 }             Expected: 0
     */
}
EOF
banner E11.1 "Find Pivot Index"

start_exercise $B E11.2-RangeSumQueryImmutable E11.2 $G Easy "Prefix sum / design" "15 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
// Built once from an array; answers SumRange(i, j) INCLUSIVE, many times.
// Target: O(n) build, O(1) per query.
// Build the prefix array with length n + 1 and a leading zero.
// Say what special case that removes before you write it.
// Use long for the accumulator.
public class NumArray
{
    public NumArray(int[] nums)
    {
        throw new NotImplementedException();
    }

    public int SumRange(int left, int right) => throw new NotImplementedException();
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    var a = new NumArray([-2, 0, 3, -5, 2, -1]);
    Console.WriteLine(a.SumRange(0, 2));   // expect 1
    Console.WriteLine(a.SumRange(2, 5));   // expect -1
    Console.WriteLine(a.SumRange(0, 5));   // expect -3
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
     * Array: { -2, 0, 3, -5, 2, -1 }
     *
     * Test Case 1  SumRange(0, 2) -> 1
     * Test Case 2  SumRange(2, 5) -> -1
     * Test Case 3  SumRange(0, 5) -> -3     (full range)
     * Test Case 4  SumRange(3, 3) -> -5     (i == j, single element)
     * Test Case 5  SumRange(0, 0) -> -2     (i == 0, the case the leading zero fixes)
     */
}
EOF
banner E11.2 "Range Sum Query - Immutable"

start_exercise $B E11.3-SubarraySumEqualsK E11.3 $G Medium "Prefix sum + Dictionary" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // COUNT the contiguous subarrays summing to exactly k. Values MAY BE NEGATIVE.
    // Target: O(n) time, O(n) space.
    //
    // Two things to state before writing:
    //   1. Why a sliding window is INVALID here.
    //   2. What seed your dictionary needs before the loop, and what it accounts for.
    public static int SubarraySum(int[] nums, int k)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.SubarraySum([1, 1, 1], 2));      // expect 2
    Console.WriteLine(Solution.SubarraySum([1, 2, 3], 3));      // expect 2
    Console.WriteLine(Solution.SubarraySum([1, -1, 0], 0));     // expect 3
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
     * Input:    { 1,1,1 }, k = 2      Expected: 2
     *
     * Test Case 2 - includes a subarray starting at index 0 (needs the seed)
     * Input:    { 1,2,3 }, k = 3      Expected: 2   ({1,2} and {3})
     *
     * Test Case 3 - NEGATIVES (this is why a window fails)
     * Input:    { 1,-1,0 }, k = 0     Expected: 3
     *
     * Test Case 4 - k = 0 with all zeroes (many overlapping answers)
     * Input:    { 0,0,0 }, k = 0      Expected: 6
     *
     * Test Case 5 - single element equal to k
     * Input:    { 5 }, k = 5          Expected: 1
     */
}
EOF
banner E11.3 "Subarray Sum Equals K"

start_exercise $B E11.4-ContiguousArray E11.4 $G Medium "Prefix sum + Dictionary" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Longest contiguous subarray with an EQUAL number of 0s and 1s.
    // Target: O(n) time, O(n) space.
    // This does not look like a sum problem. ONE substitution makes it one -
    // what do you replace each 0 with?
    // Then: the dictionary value is a FIRST INDEX, not a count. Why?
    public static int FindMaxLength(int[] nums)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.FindMaxLength([0, 1]));            // expect 2
    Console.WriteLine(Solution.FindMaxLength([0, 1, 0]));         // expect 2
    Console.WriteLine(Solution.FindMaxLength([0, 0, 1, 0, 0, 0, 1, 1])); // expect 6
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
     * Input:    { 0,1 }               Expected: 2
     *
     * Test Case 2
     * Input:    { 0,1,0 }             Expected: 2
     *
     * Test Case 3 - answer is not a prefix
     * Input:    { 0,0,1,0,0,0,1,1 }   Expected: 6
     *
     * Test Case 4 - no valid subarray
     * Input:    { 1,1,1 }             Expected: 0
     *
     * Test Case 5 - entire array is valid
     * Input:    { 0,1,1,0 }           Expected: 4
     */
}
EOF
banner E11.4 "Contiguous Array"

start_exercise $B E11.5-CorporateFlightBookings E11.5 $G Medium "Difference array" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // bookings[i] = [first, last, seats] means `seats` were reserved on EVERY
    // flight in the inclusive range. Return total seats per flight (1..n).
    //
    // The nested loop is 2*10^4 * 2*10^4 = 4*10^8 operations. Too slow.
    // You are applying many RANGE UPDATES and reading the array ONCE at the end.
    // Name the technique and the two lines it needs per booking.
    // Size the array n + 1 so diff[last] is always in range. Use long.
    public static int[] CorpFlightBookings(int[][] bookings, int n)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    int[][] b = [[1, 2, 10], [2, 3, 20], [2, 5, 25]];
    Console.WriteLine(string.Join(", ", Solution.CorpFlightBookings(b, 5)));
    // expect 10, 55, 45, 25, 25
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
     * Input:    { {1,2,10}, {2,3,20}, {2,5,25} }, n = 5
     * Expected: { 10, 55, 45, 25, 25 }
     *
     * Test Case 2 - single flight range
     * Input:    { {1,1,10} }, n = 1        Expected: { 10 }
     *
     * Test Case 3 - first == last
     * Input:    { {2,2,5} }, n = 3         Expected: { 0, 5, 0 }
     *
     * Test Case 4 - LAST == n (watch the array bound)
     * Input:    { {1,3,7} }, n = 3         Expected: { 7, 7, 7 }
     *
     * Test Case 5 - no bookings
     * Input:    { }, n = 3                 Expected: { 0, 0, 0 }
     */
}
EOF
banner E11.5 "Corporate Flight Bookings"

# ---------------------------------------------------------------- Book 12
B=Book12-BinarySearch; G=Book12-BinarySearch.md

start_exercise $B E12.1-SearchInsertPosition E12.1 $G Easy "Binary search" "10 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Sorted, distinct values. Return the target's index, or where it would be
    // inserted. O(log n) required.
    //
    // This exercise is about THE TEMPLATE, not the problem.
    // Write the lower-bound form from memory:
    //   lo = 0, hi = n (EXCLUSIVE); while (lo < hi); mid = lo + (hi - lo) / 2;
    //   predicate true -> hi = mid;  false -> lo = mid + 1;  return lo;
    public static int SearchInsert(int[] nums, int target)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.SearchInsert([1, 3, 5, 6], 5));  // expect 2
    Console.WriteLine(Solution.SearchInsert([1, 3, 5, 6], 2));  // expect 1
    Console.WriteLine(Solution.SearchInsert([1, 3, 5, 6], 7));  // expect 4
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
     * Test Case 1  { 1,3,5,6 }, target 5 -> 2   (exact match)
     * Test Case 2  { 1,3,5,6 }, target 2 -> 1   (insert in the middle)
     * Test Case 3  { 1,3,5,6 }, target 7 -> 4   (larger than everything)
     * Test Case 4  { 1,3,5,6 }, target 0 -> 0   (smaller than everything)
     * Test Case 5  { 1 },       target 1 -> 0   (single element)
     */
}
EOF
banner E12.1 "Search Insert Position"

start_exercise $B E12.2-FirstAndLastPosition E12.2 $G Medium "Lower / upper bound" "25 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Sorted array WITH duplicates. Return the first and last index of target,
    // or { -1, -1 }. O(log n) required.
    //
    // Array.BinarySearch does NOT promise the first match - that is why you write
    // the template. Two searches, two different predicates. Name both.
    public static int[] SearchRange(int[] nums, int target)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(string.Join(", ", Solution.SearchRange([5, 7, 7, 8, 8, 10], 8)));  // expect 3, 4
    Console.WriteLine(string.Join(", ", Solution.SearchRange([5, 7, 7, 8, 8, 10], 6)));  // expect -1, -1
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
     * Test Case 1  { 5,7,7,8,8,10 }, target 8 -> { 3, 4 }
     * Test Case 2  { 5,7,7,8,8,10 }, target 6 -> { -1, -1 }   (absent)
     * Test Case 3  { }, target 0             -> { -1, -1 }   (empty)
     * Test Case 4  { 2,2,2 }, target 2       -> { 0, 2 }     (entire array)
     * Test Case 5  { 1 }, target 1           -> { 0, 0 }     (single occurrence)
     */
}
EOF
banner E12.2 "Find First and Last Position"

start_exercise $B E12.3-SearchRotatedSortedArray E12.3 $G Medium "Binary search / rotated" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Sorted array of DISTINCT values, rotated at an unknown pivot.
    // Return the target's index or -1. O(log n) required.
    //
    // At any mid, ONE of the two halves is guaranteed sorted.
    // How do you tell which, and what do you do with that fact?
    public static int Search(int[] nums, int target)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.Search([4, 5, 6, 7, 0, 1, 2], 0));  // expect 4
    Console.WriteLine(Solution.Search([4, 5, 6, 7, 0, 1, 2], 3));  // expect -1
    Console.WriteLine(Solution.Search([1], 1));                     // expect 0
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
     * Test Case 1  { 4,5,6,7,0,1,2 }, target 0 -> 4
     * Test Case 2  { 4,5,6,7,0,1,2 }, target 3 -> -1   (absent)
     * Test Case 3  { 1,2,3,4,5 },     target 4 -> 3    (NOT rotated at all)
     * Test Case 4  { 5,1,2,3,4 },     target 5 -> 0    (rotated by 1)
     * Test Case 5  { 1 },             target 0 -> -1   (single element)
     */
}
EOF
banner E12.3 "Search in Rotated Sorted Array"

start_exercise $B E12.4-KokoEatingBananas E12.4 $G Medium "Binary search on the answer" "30 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // At speed k bananas/hour, each pile takes ceil(pile / k) hours.
    // Return the MINIMUM k that finishes within h hours.
    // Pile sizes up to 10^9, so you cannot scan candidate speeds linearly.
    //
    // You are searching the ANSWER SPACE, not the array.
    // Complete this sentence before coding: "if speed k works, then ..."
    // Then give the lo and hi bounds. Sum the hours in long.
    public static int MinEatingSpeed(int[] piles, int h)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.MinEatingSpeed([3, 6, 7, 11], 8));           // expect 4
    Console.WriteLine(Solution.MinEatingSpeed([30, 11, 23, 4, 20], 5));     // expect 30
    Console.WriteLine(Solution.MinEatingSpeed([30, 11, 23, 4, 20], 6));     // expect 23
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
     * Test Case 1  { 3,6,7,11 }, h = 8         -> 4
     *
     * Test Case 2 - h EQUALS the pile count: must eat the biggest pile in one hour
     * Input:    { 30,11,23,4,20 }, h = 5       -> 30
     *
     * Test Case 3  { 30,11,23,4,20 }, h = 6    -> 23
     *
     * Test Case 4 - single pile
     * Input:    { 1000000000 }, h = 2          -> 500000000
     *
     * Test Case 5 - all piles equal
     * Input:    { 5,5,5,5 }, h = 4             -> 5
     */
}
EOF
banner E12.4 "Koko Eating Bananas"

start_exercise $B E12.5-SplitArrayLargestSum E12.5 $G Hard "Binary search on the answer" "35 minutes"
cat > "$DIR/Solution.cs" <<'EOF'
public static class Solution
{
    // Split nums into k non-empty CONTIGUOUS subarrays so as to MINIMIZE the
    // largest subarray sum. Return that minimized largest sum.
    //
    // "Minimize the maximum" should trigger this book instantly.
    // Feasibility check: given a candidate largest-sum X, greedily cut a new
    // piece whenever adding the next element would exceed X. Feasible iff
    // pieces <= k.
    // Bounds: lo = max element, hi = total sum. Say why each is correct.
    public static int SplitArray(int[] nums, int k)
    {
        throw new NotImplementedException();
    }
}
EOF
cat > "$DIR/Program.cs" <<'EOF'
try
{
    Console.WriteLine(Solution.SplitArray([7, 2, 5, 10, 8], 2));   // expect 18
    Console.WriteLine(Solution.SplitArray([1, 2, 3, 4, 5], 2));    // expect 9
    Console.WriteLine(Solution.SplitArray([1, 4, 4], 3));          // expect 4
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
     * Test Case 1  { 7,2,5,10,8 }, k = 2  -> 18   ({7,2,5} and {10,8})
     * Test Case 2  { 1,2,3,4,5 },  k = 2  -> 9
     *
     * Test Case 3 - k = n, answer is the MAX element
     * Input:    { 1,4,4 }, k = 3          -> 4
     *
     * Test Case 4 - k = 1, answer is the TOTAL
     * Input:    { 1,2,3 }, k = 1          -> 6
     *
     * Test Case 5 - all equal values
     * Input:    { 5,5,5,5 }, k = 2        -> 10
     */
}
EOF
banner E12.5 "Split Array Largest Sum"

echo "Books 07-12 done."
