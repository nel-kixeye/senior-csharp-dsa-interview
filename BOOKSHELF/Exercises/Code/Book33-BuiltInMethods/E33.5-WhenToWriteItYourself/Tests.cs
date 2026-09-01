public static class Tests
{
    /*
     * 1. Array.BinarySearch does not promise the FIRST of several equal elements.
     *    Write the lower-bound template when you need first/last occurrence (Book 12).
     *
     * 2. Math.Round defaults to BANKER'S ROUNDING. Pass MidpointRounding - or
     *    write domain-specific rounding when regulation dictates it.
     *
     * 3. LINQ allocates an enumerator per operator and a closure per lambda. In a
     *    PROFILED hot loop, a single for doing both operations in one pass wins.
     *
     * 4. string.Split allocates an array plus every substring. In a hot parser,
     *    use AsSpan + IndexOf, or MemoryExtensions.Split (Book 31).
     *
     * 5. THE ODD ONE OUT. list.Contains is O(n) - but if you call it inside a
     *    loop you do not want a better Contains, you want a DIFFERENT COLLECTION.
     *    The answer is HashSet (Book 01), not "write it yourself".
     *
     * Test Case 1  FirstIndexOf([1,2,2,2,3], 2) -> 1  (Array.BinarySearch may give 1, 2 or 3)
     * Test Case 2  FirstIndexOf([1,3], 2)       -> -1 or the insertion point - decide and document
     * Test Case 3  FirstIndexOf([], 1)          -> -1
     * Test Case 4  WhereSelect([1,2,3,4], even, x10) -> { 20, 40 }
     * Test Case 5  WhereSelect over an empty list -> { }
     */
}
