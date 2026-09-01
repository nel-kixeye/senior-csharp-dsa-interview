using System.Text;

public static class Solution
{
    // Each of these is a BCL method written by hand.
    // Replace each with the correct call, and for the first three name a
    // SPECIFIC input where the hand-rolled version returns the WRONG answer.

    public static bool IsLetter_Broken(char c) => (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
    public static bool IsDigit_Broken(char c) => c >= '0' && c <= '9';
    public static char Lower_Broken(char c) => c >= 'A' && c <= 'Z' ? (char)(c + 32) : c;

    public static bool IsBlank_Broken(string s)
    {
        if (s == null) return true;
        foreach (var c in s) if (c != ' ') return false;
        return true;
    }

    public static string Repeat_Broken(char c, int n)
    {
        var sb = new StringBuilder();
        for (int i = 0; i < n; i++) sb.Append(c);
        return sb.ToString();
    }

    // --- your replacements ---
    public static bool IsLetter(char c) => throw new NotImplementedException();
    public static bool IsDigit(char c) => throw new NotImplementedException();
    public static char Lower(char c) => throw new NotImplementedException();
    public static bool IsBlank(string? s) => throw new NotImplementedException();
    public static string Repeat(char c, int n) => throw new NotImplementedException();
}
