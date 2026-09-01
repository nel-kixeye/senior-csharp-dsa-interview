using System.Text;

public static class Solution
{
    // "aaabbc" -> "a3b2c1", and the decoder back again. O(n) each way.
    //
    // Pre-size the builder. What is a reasonable capacity guess, and why does
    // guessing badly cost more than not guessing?
    // Run lengths may exceed 9 - both directions must handle multi-digit counts.
    public static string Encode(string s)
    {
        throw new NotImplementedException();
    }

    public static string Decode(string encoded)
    {
        throw new NotImplementedException();
    }
}
