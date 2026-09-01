public static class Solution
{
    // Given " alice , 30 , engineer ", produce trimmed, non-empty fields.
    // Three versions, increasing in quality.

    // 1. Naive: Split then Trim via LINQ.
    public static string[] Parse_Naive(string line) => throw new NotImplementedException();

    // 2. StringSplitOptions only - no LINQ, fewer allocations.
    public static string[] Parse_Options(string line) => throw new NotImplementedException();

    // 3. Allocation-free: count the fields without materializing any strings.
    //    Before coding: why can you not simply `yield return` a ReadOnlySpan<char>?
    //    Name the language restriction and one way around it.
    public static int CountFields(ReadOnlySpan<char> line) => throw new NotImplementedException();
}
