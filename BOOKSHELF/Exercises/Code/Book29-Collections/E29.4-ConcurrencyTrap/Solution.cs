using System.Collections.Concurrent;

public static class Solution
{
    // THIS RUNS FINE IN TESTING AND HANGS IN PRODUCTION.
    //
    // In Notes.txt, explain what ACTUALLY happens under concurrent calls.
    // Be specific - it is worse than "the count might be wrong".
    private static readonly Dictionary<string, int> _counts = new();

    public static void Record_Broken(string key)
    {
        _counts[key] = _counts.GetValueOrDefault(key) + 1;
    }

    // Fix it THREE ways.
    public static void Record_WithLock(string key) => throw new NotImplementedException();
    public static void Record_Concurrent(string key) => throw new NotImplementedException();

    // Third fix: a design change that avoids shared mutable state entirely.
    // (Per-thread or per-request counters, aggregated at the end.)
    public static void Record_NoSharedState(string key) => throw new NotImplementedException();

    // Also answer: why is ConcurrentDictionary's  d[key] = d[key] + 1  STILL
    // wrong, and what is the correct API?
}
