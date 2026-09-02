public static class Solution
{
    // Return the INDEX of the first character occurring exactly once, or -1.
    // A HashSet cannot answer this - say why before you start.
    // Lowercase only, so int[26] beats Dictionary here.
    public static int FirstUniqChar(string s)
    {
        var dict = new Dictionary<char,int>();
        foreach(var c in s)
            dict[c] = dict.GetValueOrDefault(c) + 1;
        for(var i = 0; i < s.Length; i++)
        {
            if(dict[s[i]] == 1)
                return i;
        }
        return -1;
    }
}
