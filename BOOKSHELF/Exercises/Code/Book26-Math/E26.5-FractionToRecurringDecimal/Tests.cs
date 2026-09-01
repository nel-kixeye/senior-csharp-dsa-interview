public static class Tests
{
    /*
     * Test Case 1  1 / 2    -> "0.5"
     * Test Case 2  2 / 3    -> "0.(6)"
     * Test Case 3  4 / 333  -> "0.(012)"
     * Test Case 4  2 / 1    -> "2"        (exact, NO decimal point at all)
     * Test Case 5  -50 / 8  -> "-6.25"    (negative result)
     * Test Case 6  0 / 5    -> "0"
     *
     * Test Case 7 - THE OVERFLOW TRAP
     * Input:    numerator = int.MinValue, denominator = -1
     * Expected: "2147483648"   (must not throw or wrap)
     */
}
