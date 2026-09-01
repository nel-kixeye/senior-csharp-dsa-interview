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
