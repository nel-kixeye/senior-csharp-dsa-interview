public static class Tests
{
    /*
     * Test Case 1   "42"              -> 42
     * Test Case 2   "   -042"         -> -42      (leading spaces + leading zeroes)
     * Test Case 3   "1337c0d3"        -> 1337     (stop at the first non-digit)
     * Test Case 4   "words and 987"   -> 0        (no leading number)
     * Test Case 5   "-91283472332"    -> -2147483648   (clamp low)
     * Test Case 6   "91283472332"     -> 2147483647    (clamp high)
     * Test Case 7   "+-12"            -> 0        (second sign ends it, zero digits read)
     * Test Case 8   ""                -> 0
     * Test Case 9   "+"               -> 0
     * Test Case 10  "  +0 123"        -> 0        (stops at the space)
     */
}
