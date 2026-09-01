public static class Tests
{
    /*
     * TitleToNumber
     * Test Case 1  "A"   -> 1
     * Test Case 2  "Z"   -> 26      (the boundary the 1-indexing creates)
     * Test Case 3  "AA"  -> 27
     * Test Case 4  "ZY"  -> 701
     * Test Case 5  "FXSHRXW" -> 2147483647   (int.MaxValue - watch the accumulator)
     *
     * ConvertToTitle (inverse - each must round-trip)
     * 1 -> "A",  26 -> "Z",  27 -> "AA",  28 -> "AB",  701 -> "ZY"
     * The 26 -> "Z" case is where the off-by-one shows up.
     */
}
