public static class Solution
{
    // Target: O(n + m) time, O(min(n, m)) space.
    // Result must contain no duplicates. Order does not matter.
    public static int[] Intersection(int[] a, int[] b)
    {
        var acommon = new HashSet<int>(a);
        var bcommon = new HashSet<int>(b);

        acommon.IntersectWith(bcommon);

        return [.. acommon];
    }
}
