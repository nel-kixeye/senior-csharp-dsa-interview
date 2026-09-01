public static class Tests
{
    /*
     * A  arr.Max()                 - merely longer
     * B  Array.Reverse(a)          - merely longer
     * C  Math.Clamp(v, min, max)   - merely longer
     * D  Array.Fill(arr, -1)       - merely longer
     * E  a.SequenceEqual(b)        - longer AND slower (the BCL span version is
     *                                VECTORIZED; your loop is not)
     * F  items.Chunk(100)          - merely longer
     *
     * G  WRONG. For negative operands the truncation makes this subtly
     *    inconsistent with %, and it does an extra multiply.
     *    Use Math.DivRem(a, b, out int r).
     *
     * H  WRONG. OrderBy with a random key is NOT a uniform shuffle - the
     *    comparison sort with an inconsistent key produces a BIASED distribution,
     *    and can throw InvalidOperationException for an inconsistent comparer.
     *    Use Random.Shared.Shuffle(CollectionsMarshal.AsSpan(items)) (.NET 8+),
     *    or hand-written Fisher-Yates.
     *
     * Test Case 1  A([3,9,2]) -> 9;  A([]) should behave sensibly (Max throws -
     *              decide what you want)
     * Test Case 2  C(15, 0, 10) -> 10; C(-5, 0, 10) -> 0
     * Test Case 3  F over 250 items in chunks of 100 -> 3 batches (100,100,50)
     * Test Case 4  G(-7, 2) -> quotient -3, remainder -1
     * Test Case 5  H over 1..10, run 1000 times: every element should land in
     *              every position roughly equally. A biased shuffle will not.
     */
}
