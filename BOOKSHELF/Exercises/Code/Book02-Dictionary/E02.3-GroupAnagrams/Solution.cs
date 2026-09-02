using System.Text.RegularExpressions;

public static class Solution
{
    // Group words that are anagrams of each other.
    // The insight is the KEY: find a canonical form two anagrams share.
    // Two options - sorted characters O(L log L), or a 26-count signature O(L).
    public static IList<IList<string>> GroupAnagrams(string[] strs)
    {
        var groups = new Dictionary<string, List<string>>();
        foreach(var word in strs)
        {
            var key  = Signature(word);
            if(!groups.TryGetValue(key, out var list))
                groups[key] = list = [];
            list.Add(word);
        }
        return [.. groups.Values];
    }

    public static string Signature(string word)
    {
        int[] characters = new int[26];

        foreach(var c in word)
        {
            characters[c - 'a']++;
        }

        return string.Join('#', characters);
    }

}
