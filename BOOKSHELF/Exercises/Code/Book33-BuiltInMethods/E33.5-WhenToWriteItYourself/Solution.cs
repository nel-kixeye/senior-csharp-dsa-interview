public static class Solution
{
    // For each, give a CONCRETE case where hand-rolling beats the BCL call, and
    // say what you would do instead. Record in Notes.txt, then implement the
    // two marked TODO.
    //
    // 1. Array.BinarySearch
    // 2. Math.Round
    // 3. LINQ's Where + Select
    // 4. string.Split
    // 5. list.Contains
    //
    // NOTE: one of these five has a different KIND of answer - it is not "write
    // it yourself" at all. Find it.

    // TODO 1: BinarySearch does not promise the FIRST of several equal elements.
    // Write the lower-bound version that does.
    public static int FirstIndexOf(int[] sorted, int target) => throw new NotImplementedException();

    // TODO 2: a hot-path rewrite of  items.Where(p).Select(f).ToList()
    // as a single loop with one allocation.
    public static List<int> WhereSelect(List<int> items, Func<int, bool> p, Func<int, int> f)
        => throw new NotImplementedException();
}
