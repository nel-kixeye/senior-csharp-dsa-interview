public static class Tests
{
    /*
     * The self-check for all of these is a ROUND TRIP:
     *   Serialize(Deserialize(Serialize(t))) == Serialize(t)
     *
     * Test Case 1  [1,2,3,null,null,4,5]  round-trips
     * Test Case 2  null                   round-trips (empty tree)
     * Test Case 3  [1]                    round-trips (single node)
     * Test Case 4  fully left-skewed 1->2->3   round-trips
     *
     * Test Case 5 - NEGATIVE and MULTI-DIGIT values
     * Input:    [-100, 250, -3]
     * Expected: round-trips. If your delimiter is a single character that can
     *           appear in a value (like '-'), this is where it breaks.
     */
}
