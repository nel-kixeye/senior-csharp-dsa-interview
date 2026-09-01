public static class Tests
{
    /*
     * Test Case 1  order "cba", s "abcd"   -> "cbad"  ('d' may be anywhere)
     * Test Case 2  order "bcafg", s "abcd" -> "bcad"
     *
     * Test Case 3 - DUPLICATES in s
     * Input:    order "cba", s "aabbcc"    -> "ccbbaa"
     *
     * Test Case 4 - order contains characters absent from s
     * Input:    order "xyz", s "ab"        -> "ab" (any order, both unconstrained)
     *
     * Test Case 5 - empty order
     * Input:    order "", s "abc"          -> any permutation of "abc"
     */
}
