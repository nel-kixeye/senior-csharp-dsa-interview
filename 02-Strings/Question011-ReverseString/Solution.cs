public static class Solution
{
    // =============================================
    // ATTEMPT 1 - INCORRECT
    // Issues:
    //   - right = s.Length instead of s.Length - 1
    //   - throws IndexOutOfRangeException on first iteration
    // =============================================
    // var right = s.Length;

    // =============================================
    // CORRECT - ATTEMPT 2
    // PATTERN: Two Pointers (same as Q001 Reverse Array)
    // Walk inward from both ends, swap until pointers meet
    // =============================================
    public static void ReverseString(char[] s)
    {
        var left = 0;
        var right = s.Length - 1;
        while (left < right)
        {
            (s[right], s[left]) = (s[left], s[right]);
            left++;
            right--;
        }
    }
}
