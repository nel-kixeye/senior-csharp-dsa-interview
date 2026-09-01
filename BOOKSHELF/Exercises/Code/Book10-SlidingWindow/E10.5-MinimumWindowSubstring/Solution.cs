public static class Solution
{
    // SHORTEST substring of s containing every character of t INCLUDING duplicates.
    // Return "" if none exists. Target: O(n + m).
    //
    // This is a SHORTEST problem: record the best INSIDE the shrink loop.
    // (Mirror of E10.2, where it goes outside. Getting this backwards is the
    // classic bug - say it out loud before writing.)
    //
    // Increment "have" only when a count REACHES its requirement, not on every
    // occurrence. That is what handles duplicates in t.
    public static string MinWindow(string s, string t)
    {
        throw new NotImplementedException();
    }
}
