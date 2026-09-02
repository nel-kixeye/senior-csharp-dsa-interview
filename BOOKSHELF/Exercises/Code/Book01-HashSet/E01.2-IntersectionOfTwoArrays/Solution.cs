public static class Solution
{
    // Target: O(n + m) time, O(min(n, m)) space.
    // Result must contain no duplicates. Order does not matter.
    public static int[] Intersection(int[] a, int[] b)
    {
        var setA = a.ToHashSet<int>();

        setA.IntersectWith(b);
        return [.. setA];
    }
}
