using System.Security.Cryptography;
using System.Runtime.InteropServices;

public static class Solution
{
    // Each has a REAL bug. Name it and fix it.

    // A
    public static List<int> A_Broken()
    {
        var results = new List<int>();
        for (int i = 0; i < 1000; i++) { var r = new Random(); results.Add(r.Next(100)); }
        return results;
    }

    // B - generating a password reset token
    public static string B_Broken() => new Random().Next(100000, 999999).ToString();

    // C - shuffling a deck
    public static void C_Broken(List<int> cards) => cards.Sort((x, y) => Random.Shared.Next(-1, 2));

    // D - called from multiple threads
    private static readonly Random _rng = new();
    public static int D_Broken() => _rng.Next(1, 7);

    // --- your fixes ---
    public static List<int> A() => throw new NotImplementedException();
    public static string B() => throw new NotImplementedException();
    public static void C(List<int> cards) => throw new NotImplementedException();
    public static int D() => throw new NotImplementedException();
}
