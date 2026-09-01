public static class Tests
{
    /*
     * Test Case 1
     * Input:    "()[]{}"
     * Expected: true
     *
     * Test Case 2 - wrong nesting order
     * Input:    "([)]"
     * Expected: false
     *
     * Test Case 3 - closer with nothing open
     * Input:    ")"
     * Expected: false
     *
     * Test Case 4 - LEFTOVER openers (the commonly missed case)
     * Input:    "((("
     * Expected: false
     *
     * Test Case 5 - empty
     * Input:    ""
     * Expected: true
     *
     * Test Case 6 - nested correctly
     * Input:    "{[()]}"
     * Expected: true
     */
}
