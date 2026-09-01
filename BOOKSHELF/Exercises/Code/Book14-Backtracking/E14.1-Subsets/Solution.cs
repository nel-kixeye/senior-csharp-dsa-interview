public static class Solution
{
    // All subsets (the power set) of DISTINCT integers, any order.
    // Target: O(n * 2^n) time.
    //
    // At each index you make ONE binary decision. Name it.
    // THE UNIVERSAL BUG: res.Add(cur) stores a reference you are about to
    // mutate. Always res.Add(new List<int>(cur)).
    //
    // Follow-up: solve it again with a bitmask loop and no recursion.
    public static IList<IList<int>> Subsets(int[] nums)
    {
        throw new NotImplementedException();
    }
}
