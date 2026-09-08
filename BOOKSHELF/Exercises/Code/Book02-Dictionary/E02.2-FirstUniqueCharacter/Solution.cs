public static class Solution
{
    // Return the INDEX of the first character occurring exactly once, or -1.
    // A HashSet cannot answer this - say why before you start.
    // Lowercase only, so int[26] beats Dictionary here.
    public static int FirstUniqChar(string s)
    {
        int[] count = new int[26];

        // Pass 1: count every character
        foreach (char c in s)
        {
            count[c - 'a']++;
        }

        // Pass 2: find the first character with count == 1
        for (int i = 0; i < s.Length; i++)
        {
            if (count[s[i] - 'a'] == 1)
            {
                return i;
            }
        }

        return -1;
    }
}
