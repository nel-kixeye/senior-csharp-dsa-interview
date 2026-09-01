public static class Tests
{
    /*
     * Test Case 1
     * Input:    { "2", "1", "+", "3", "*" }
     * Expected: 9                          ((2 + 1) * 3)
     *
     * Test Case 2
     * Input:    { "4", "13", "5", "/", "+" }
     * Expected: 6                          (4 + (13 / 5))
     *
     * Test Case 3 - OPERAND ORDER for subtraction
     * Input:    { "5", "3", "-" }
     * Expected: 2                          (5 - 3, NOT 3 - 5)
     *
     * Test Case 4 - single number
     * Input:    { "42" }
     * Expected: 42
     *
     * Test Case 5 - negative operands and truncation toward zero
     * Input:    { "-7", "2", "/" }
     * Expected: -3                         (not -4)
     */
}
