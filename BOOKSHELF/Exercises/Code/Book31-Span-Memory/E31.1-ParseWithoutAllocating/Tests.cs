public static class Tests
{
    /*
     * ALLOCATIONS IN THE NAIVE VERSION for k fields:
     *   one string[] array PLUS one string per field = k + 1 allocations,
     *   all immediately garbage. For 100,000 fields that is several MB.
     *
     * SPAN VERSION (.NET 8+):
     *   ReadOnlySpan<char> s = line;
     *   foreach (var range in s.Split(','))     // allocation-free enumerator
     *       total += int.Parse(s[range]);       // parses the slice in place
     *
     * Pre-.NET 8: walk manually with s.IndexOf(','), slice, parse, re-slice.
     *
     * Test Case 1  "1,2,3"        -> 6
     * Test Case 2  "42"           -> 42   (single field, no comma)
     * Test Case 3  ""             -> 0    (decide and document the behaviour)
     * Test Case 4  "-1,-2"        -> -3   (negatives)
     * Test Case 5  Run Program.cs - the fixed version should allocate
     *              essentially nothing while producing the same total.
     */
}
