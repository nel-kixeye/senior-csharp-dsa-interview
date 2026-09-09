public static class Solution
{
    // Length of the longest substring with NO repeated character.
    // Target: O(n) time, O(min(n, alphabet)) space.
    // When you hit a repeat, where does left jump to?
    // This is a LONGEST problem - record the best OUTSIDE the shrink loop.
    public static int LengthOfLongestSubstring(string s)
    {
        var counter = new Dictionary<char, int>();
        var best = int.MinValue; 
        var left = 0;
        var chars = s.ToCharArray();

        for(var right = 0; right < chars.Length; right++)
        {
            counter[chars[right]] = counter.GetValueOrDefault(chars[right]) + 1;
            while(counter[chars[right]] > 1)
            {
                counter[chars[left]]--;
                if(counter[chars[left]] == 0) counter.Remove(chars[left]);
                left++;
            } 

            best = Math.Max(best, right - left + 1);
        }
        return best;
    }
}
