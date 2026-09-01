public record Item(int Id, bool IsExpired);

public static class Solution
{
    // Each of these is O(n^2) or worse. Name WHY, then fix it.
    // D has a SECOND bug beyond the complexity - find it.

    public static List<int> A_Broken(IEnumerable<int> source)
    {
        var result = new List<int>();
        foreach (var x in source) if (!result.Contains(x)) result.Add(x);
        return result;
    }

    public static void B_Broken(List<int> pending, Action<int> process)
    {
        while (pending.Count > 0) { var next = pending[0]; pending.RemoveAt(0); process(next); }
    }

    public static void C_Broken(IEnumerable<int> items, Action<int> useSmallest)
    {
        var sorted = new List<int>();
        foreach (var item in items) { sorted.Add(item); sorted.Sort(); useSmallest(sorted[0]); }
    }

    public static void D_Broken(List<Item> list)
    {
        for (int i = 0; i < list.Count; i++) if (list[i].IsExpired) list.RemoveAt(i);
    }

    // --- your fixes ---
    public static List<int> A(IEnumerable<int> source) => throw new NotImplementedException();
    public static void B(List<int> pending, Action<int> process) => throw new NotImplementedException();
    public static void C(IEnumerable<int> items, Action<int> useSmallest) => throw new NotImplementedException();
    public static void D(List<Item> list) => throw new NotImplementedException();
}
