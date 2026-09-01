public static class Solution
{
    // Find the first index where `target` occurs.
    public static int Find_Broken(string line, string target)
    {
        for (int i = 0; i + target.Length <= line.Length; i++)
            if (line.Substring(i, target.Length) == target)
                return i;
        return -1;
    }

    // 1. Rewrite with NO allocation (same loop shape).
    public static int Find_Span(string line, string target) => throw new NotImplementedException();

    // 2. Then: name the BCL method that makes the whole loop unnecessary, and
    //    say what it does that a hand-written loop probably does not.
    //    (Hint: it is about how many characters the CPU compares at once.)
    public static int Find_Bcl(string line, string target) => throw new NotImplementedException();
}
