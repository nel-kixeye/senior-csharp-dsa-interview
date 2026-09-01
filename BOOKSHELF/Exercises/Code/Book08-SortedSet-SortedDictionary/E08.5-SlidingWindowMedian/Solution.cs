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
