public static class Solution
{
    // Characters of s can be replaced to get t, preserving order.
    // Each character maps to exactly ONE character, and no two characters
    // may map to the SAME one - one dictionary is not enough. Say why.
    public static bool IsIsomorphic(string s, string t)
    {
        if(s.Length != t.Length)
            return false;
        var sMatch = new Dictionary<char, char>();
        var tMatch = new Dictionary<char, char>();
        for(var i = 0; i < s.Length; i++)
        {
            if(!sMatch.TryGetValue(s[i], out var mapped))
                sMatch.Add(s[i], t[i]);
            else
                if(mapped != t[i])
                    return false;
        }
        for(var i = 0; i < t.Length; i++)
        {
            if(!tMatch.TryGetValue(t[i], out var mapped))
                tMatch.Add(t[i], s[i]);
            else
                if(mapped != s[i])
                    return false;
        }
        return true;
    }
}
