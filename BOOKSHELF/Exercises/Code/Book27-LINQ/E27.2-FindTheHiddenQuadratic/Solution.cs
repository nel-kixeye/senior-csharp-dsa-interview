public static class Solution
{
    // THIS COMPILES, PASSES ON SMALL INPUTS, AND IS QUADRATIC.
    // Find why, then fix it WITHOUT changing the result.
    //
    // State the complexity of the original and of your fix.
    // Then name the general rule this violates - it applies to Contains as much
    // as to Count.
    public static List<int> FindDuplicates_Broken(List<int> numbers)
    {
        return numbers
            .Where(n => numbers.Count(x => x == n) > 1)
            .Distinct()
            .ToList();
    }

    // Your fix. Same output, linear time.
    public static List<int> FindDuplicates(List<int> numbers)
    {
        throw new NotImplementedException();
    }
}
