public static class Tests
{
    /*
     * Test Case 1
     * Input:    { "eat", "tea", "tan", "ate", "nat", "bat" }
     * Expected: 3 groups - { eat, tea, ate }, { tan, nat }, { bat }   (any order)
     *
     * Test Case 2 - single empty string
     * Input:    { "" }
     * Expected: { { "" } }
     *
     * Test Case 3 - single word
     * Input:    { "a" }
     * Expected: { { "a" } }
     *
     * Test Case 4 - no anagrams at all
     * Input:    { "abc", "def", "ghi" }
     * Expected: 3 groups of 1
     *
     * Test Case 5 - all anagrams of each other
     * Input:    { "abc", "bca", "cab" }
     * Expected: 1 group of 3
     */
}
