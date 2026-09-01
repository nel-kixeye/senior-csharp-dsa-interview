public static class Tests
{
    /*
     * Test Case 1  Encode("aaabbc")  -> "a3b2c1"
     * Test Case 2  Decode("a3b2c1")  -> "aaabbc"
     *
     * Test Case 3 - MULTI-DIGIT run
     * Encode(12 a's) -> "a12";  Decode("a12") -> 12 a's
     *
     * Test Case 4 - NO REPEATS: output is LONGER than input
     * Encode("abc") -> "a1b1c1"
     *
     * Test Case 5 - empty and single
     * Encode("") -> "";  Encode("a") -> "a1"
     *
     * ROUND-TRIP CHECK: Decode(Encode(s)) == s for every case above.
     *
     * CAPACITY: s.Length is a reasonable neutral guess. Too small costs a
     * doubling copy each time it grows (O(log n) copies); too large just wastes
     * memory.
     */
}
