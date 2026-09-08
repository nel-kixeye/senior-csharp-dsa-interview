public static class Solution
{
    // Alphanumeric only, ignoring case. O(n) time, O(1) SPACE - do not build a
    // cleaned copy of the string.
    // What do the pointers do when they land on punctuation?
    public static bool IsPalindrome(string s)
    {
        var left = 0;
        var right = s.Length - 1;
        var chars = s.ToLower().ToCharArray();

        while(left < right)
        {
            while(!IsLetterOrDigit(chars[left])) left++;
            while(!IsLetterOrDigit(chars[right])) right--;
            if(chars[left] != chars[right])
            {
                return false;
            }
            
            left++;
            right--;
        }
        return true;
    }

    public static bool IsLetterOrDigit(char c)
    {
        var isDigit = (c >= '0' && c <= '9');
        var isLower = (c >= 'a' && c <= 'z');
        var isUpper = (c >= 'A' && c <= 'A');

        return isDigit || isLower || isUpper;
    }
}
