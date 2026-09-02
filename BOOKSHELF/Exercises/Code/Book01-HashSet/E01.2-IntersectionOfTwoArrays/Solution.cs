public static class Solution
{
    // Target: O(n + m) time, O(min(n, m)) space.
    // Result must contain no duplicates. Order does not matter.
    public static int[] Intersection(int[] a, int[] b)
    {
        var smaller = a.Length < b.Length ? a : b;
        var larger = a.Length >= b.Length ? a : b;

        var uniqueSet = smaller.ToHashSet<int>();
        uniqueSet.IntersectWith(larger);

        return uniqueSet.ToArray<int>();
    }
}
