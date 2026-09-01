public static class Tests
{
    /*
     * Test Case 1  x = 2.0,  n = 10   -> 1024.0
     * Test Case 2  x = 2.0,  n = -2   -> 0.25
     * Test Case 3  x = 2.0,  n = 0    -> 1.0
     *
     * Test Case 4 - THE TRAP
     * Input:    x = 1.0, n = int.MinValue (-2147483648)
     * Expected: 1.0        (must not throw or overflow)
     *
     * Test Case 5 - negative base, odd exponent
     * Input:    x = -2.0, n = 3       -> -8.0
     */
}
