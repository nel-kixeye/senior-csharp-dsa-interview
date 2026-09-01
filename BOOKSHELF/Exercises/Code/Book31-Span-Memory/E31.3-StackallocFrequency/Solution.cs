public static class Solution
{
    // Rewrite the anagram check to use stackalloc instead of a Dictionary.
    public static bool IsAnagram_Dictionary(string s, string t)
    {
        if (s.Length != t.Length) return false;
        var counts = new Dictionary<char, int>();
        foreach (var c in s) counts[c] = counts.GetValueOrDefault(c) + 1;
        foreach (var c in t)
        {
            if (!counts.TryGetValue(c, out var n) || n == 0) return false;
            counts[c] = n - 1;
        }
        return true;
    }

    public static bool IsAnagram(string s, string t) => throw new NotImplementedException();

    // THESE MATTER MORE THAN THE REWRITE. Answer in Notes.txt:
    //   1. Why is stackalloc inside a LOOP dangerous, and what is the failure mode?
    //   2. Write the guard pattern for a buffer whose size depends on input.
    //   3. What is a safe upper bound for a stackalloc, roughly, in bytes?

    // Implement the guard pattern here.
    public static int CountDistinct(ReadOnlySpan<char> input, int alphabetSize)
        => throw new NotImplementedException();
}
