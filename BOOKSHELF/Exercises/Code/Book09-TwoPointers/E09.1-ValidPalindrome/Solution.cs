public static class Solution
{
    // Alphanumeric only, ignoring case. O(n) time, O(1) SPACE - do not build a
    // cleaned copy of the string.
    // What do the pointers do when they land on punctuation?
    public static bool IsPalindrome(string s)
    {
        var left = 0;
        var right = s.Length - 1;
        var chars = s.AsSpan();

        while(left < right)
        {
            while(!char.IsLetterOrDigit(chars[left]) && left < right)
                left++;
            while(!char.IsLetterOrDigit(chars[right]) && left < right)
                right--;
            if(char.ToLowerInvariant(chars[left]) != char.ToLowerInvariant(chars[right]))
                return false;
            left++;
            right--;
        }
        return true;
    }
}
