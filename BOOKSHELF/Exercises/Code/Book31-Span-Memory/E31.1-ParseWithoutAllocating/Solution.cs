public static class Solution
{
    // Count the allocations in the naive version for a line with k fields,
    // then write the span version. Target: ZERO allocations.
    public static long Total_Broken(string line)
    {
        long total = 0;
        foreach (var part in line.Split(','))
            total += int.Parse(part);
        return total;
    }

    public static long Total(string line)
    {
        throw new NotImplementedException();
    }
}
