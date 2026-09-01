public static class Tests
{
    /*
     * THE PATTERN
     *   byte[] buffer = ArrayPool<byte>.Shared.Rent(65536);
     *   try     { var span = buffer.AsSpan(0, 65536); ... }
     *   finally { ArrayPool<byte>.Shared.Return(buffer); }
     *
     * THE THREE THINGS
     *   1. SIZE: Rent may return an array LARGER than requested. Always slice to
     *      the length you asked for; never trust buffer.Length.
     *   2. CONTENTS: the array is NOT cleared - it holds whatever the previous
     *      renter left. Overwrite before reading, or pass clearArray: true to
     *      Return if it held sensitive data.
     *   3. WHEN: return it in a finally, EXACTLY ONCE. Returning twice, or using
     *      it after returning, is a corruption bug that surfaces far from its cause.
     *
     * WHY 64 KB: it is close to the 85,000-byte LARGE OBJECT HEAP threshold.
     * Arrays at or above that go on the LOH, collected only with gen2 and not
     * compacted by default - so churning them fragments the heap. Pooling avoids
     * both the allocation and the fragmentation.
     *
     * Test Case  Run Program.cs. 1,000 iterations: broken allocates ~64 MB;
     * pooled should allocate almost nothing.
     */
}
