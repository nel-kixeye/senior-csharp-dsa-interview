public static class Tests
{
    /*
     * SPAN REWRITE
     *   if (line.AsSpan(i, target.Length).SequenceEqual(target))
     * AsSpan is O(1) and allocates nothing, where Substring allocated a new
     * string EVERY iteration.
     *
     * THE BCL METHOD
     *   line.IndexOf(target, StringComparison.Ordinal)
     *   (or line.AsSpan().IndexOf(target))
     * It is VECTORIZED: it compares 16 or 32 characters per SIMD instruction
     * instead of one per iteration, and uses a tuned search algorithm. A
     * hand-written loop gets neither.
     *
     * Test Case 1  found at the end of a 200k string - all three agree
     * Test Case 2  target absent            -> -1
     * Test Case 3  target at index 0        -> 0
     * Test Case 4  target longer than line  -> -1
     * Test Case 5  empty target             -> 0 (decide and document)
     */
}
