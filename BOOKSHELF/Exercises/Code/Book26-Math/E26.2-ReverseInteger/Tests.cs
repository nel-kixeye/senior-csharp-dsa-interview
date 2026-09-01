public static class Tests
{
    /*
     * Test Case 1  123          -> 321
     * Test Case 2  -123         -> -321
     * Test Case 3  120          -> 21      (trailing zeroes vanish)
     * Test Case 4  1534236469   -> 0       (reversed value overflows)
     * Test Case 5  0            -> 0
     *
     * Test Case 6 - THE TRAP
     * Input:    int.MinValue (-2147483648)
     * Expected: 0     (must not throw; negating it in int does nothing)
     */
}
