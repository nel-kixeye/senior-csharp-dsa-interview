using Microsoft.VisualBasic;

public static class Solution
{
    // Replace n by the sum of the squares of its digits, repeatedly.
    // true if it reaches 1; false if it loops forever.
    // Follow-up once this works: solve it in O(1) space (fast/slow pointers).
    public static bool IsHappy(int n)
    {
        var seen = new HashSet<int>();
        while(n != 1)
        {
            n = GetSum(n);
            if(!seen.Add(n))
            {
                return false;
            }
        }
        return n == 1;
    }

    public static int GetSum(int n)
    {
        var result = 0;
        foreach(var c in n.ToString())
        {
            var digit = c - '0';
            result += digit * digit;
        }
        return result;
    }
}
