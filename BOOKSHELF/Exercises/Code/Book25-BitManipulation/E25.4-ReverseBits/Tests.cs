public static class Tests
{
    /*
     * Test Case 1  43261596      -> 964176192
     * Test Case 2  1             -> 2147483648   (low bit becomes the high bit)
     * Test Case 3  0             -> 0
     * Test Case 4  uint.MaxValue -> uint.MaxValue (all bits set, symmetric)
     * Test Case 5  2147483648    -> 1            (high bit becomes the low bit)
     */
}
