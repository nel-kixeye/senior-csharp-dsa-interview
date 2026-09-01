using System.Globalization;

public static class Solution
{
    // FOUR ways to compare case-insensitively. THREE are wrong or wasteful.
    // Rank them in Notes.txt and explain.
    //
    // Then answer: which would you use for a USERNAME comparison, and which for
    // SORTING product names shown to a user? They are different answers.

    public static bool Compare1(string a, string b) => a.ToLower() == b.ToLower();
    public static bool Compare2(string a, string b) => a.ToLowerInvariant() == b.ToLowerInvariant();
    public static bool Compare3(string a, string b) => string.Equals(a, b, StringComparison.OrdinalIgnoreCase);
    public static bool Compare4(string a, string b) => a.Equals(b, StringComparison.CurrentCultureIgnoreCase);

    // The one you would ship for comparing identifiers.
    public static bool AreSameIdentifier(string a, string b) => throw new NotImplementedException();
}
