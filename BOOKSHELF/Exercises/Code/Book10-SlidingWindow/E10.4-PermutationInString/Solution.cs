public static class Solution
{
    // Does s2 contain a PERMUTATION of s1 as a contiguous substring?
    // Target: O(n) time, O(1) space.
    // The window is a FIXED size - which one?
    // Compare two 26-slot profiles in O(1) per step, not O(26): keep a
    // "matches" counter and adjust it as counts change.
    public static bool CheckInclusion(string s1, string s2)
    {
        if(s1.Length > s2.Length) return false;
        s1 = s1.ToLower();
        s2 = s2.ToLower();

        var k = s1.Length;
        var left = 0;
        var cs1 = new int[26];
        var cs2 = new int[26];

        foreach(var c in s1)
        {
            cs1[c - 'a' ]++;
        }

        for(var right = 0; right < s2.Length; right++)
        {
            cs2[s2[right] - 'a']++;
            if(right >= k)
            {
                cs2[s2[left] - 'a']--;
                left++;
            }
            if(right >= k - 1)
            {
                var c1 = string.Join('#',cs1);
                var c2 = string.Join('#',cs2);
                if(c1 == c2) return true;
            }
        }
        return false;
    }
}
