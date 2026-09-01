public static class Tests
{
    /*
     * Test Case 1
     * Input:    "3[a]2[bc]"
     * Expected: "aaabcbc"
     *
     * Test Case 2 - nested
     * Input:    "3[a2[c]]"
     * Expected: "accaccacc"
     *
     * Test Case 3 - text outside brackets
     * Input:    "2[abc]3[cd]ef"
     * Expected: "abcabccdcdcdef"
     *
     * Test Case 4 - MULTI-DIGIT count
     * Input:    "12[a]"
     * Expected: "aaaaaaaaaaaa"      (12 a's)
     *
     * Test Case 5 - no brackets at all
     * Input:    "abc"
     * Expected: "abc"
     */
}
