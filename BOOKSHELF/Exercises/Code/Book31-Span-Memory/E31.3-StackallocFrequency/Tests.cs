public static class Tests
{
    /*
     * REWRITE:  Span<int> count = stackalloc int[26];  index with c - 'a'.
     * Zero allocation, better locality than a Dictionary.
     *
     * 1. THE DANGER: stack memory is NOT reclaimed until the METHOD returns, so
     *    a stackalloc inside a loop accumulates every iteration. The failure is
     *    StackOverflowException, which in .NET CANNOT BE CAUGHT - the process dies.
     *
     * 2. THE GUARD:
     *      Span<char> buf = len <= 256 ? stackalloc char[256] : new char[len];
     *    Small and bounded on the stack; anything larger falls back to the heap.
     *
     * 3. SAFE BOUND: under about 1 KB. The default thread stack is 1 MB total and
     *    you share it with every frame below you.
     *
     * Test Case 1  IsAnagram("anagram","nagaram") -> true
     * Test Case 2  IsAnagram("aab","abb")         -> false
     * Test Case 3  IsAnagram("","")               -> true
     * Test Case 4  CountDistinct("hello", 128)    -> 4  (h, e, l, o)
     * Test Case 5  CountDistinct over a 10,000-char input must use the HEAP
     *              branch of your guard, not stackalloc.
     */
}
