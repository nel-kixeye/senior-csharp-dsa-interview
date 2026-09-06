public static class Solution
{
    // Replace n by the sum of the squares of its digits, repeatedly.
    // true if it reaches 1; false if it loops forever.
    // Follow-up once this works: solve it in O(1) space (fast/slow pointers).
    public static bool IsHappy(int n)
    {
        var seen = new HashSet<int>();

        while (n != 1 && !seen.Contains(n))
        {
            seen.Add(n);
            n = SumOfSquares(n);
        }

        return n == 1;
    }

    public static int SumOfSquares(int n)
    {
        int sum = 0;
        while (n > 0)
        {
            int digit = n % 10;
            sum += digit * digit;
            n /= 10;
        }
        return sum;
    }
}
