public static class Tests
{
    /*
     * Test Case 1
     * Input:    { A,A,A,B,B,B }, n = 2      Expected: 8   (A B idle A B idle A B)
     *
     * Test Case 2 - no cooldown
     * Input:    { A,A,A,B,B,B }, n = 0      Expected: 6
     *
     * Test Case 3 - many distinct labels, no idling needed
     * Input:    { A,A,A,B,B,B,C,C,C,D,D,E }, n = 2   Expected: 12
     *
     * Test Case 4 - all identical
     * Input:    { A,A,A }, n = 2            Expected: 7   (A idle idle A idle idle A)
     *
     * Test Case 5 - single task
     * Input:    { A }, n = 5                Expected: 1
     */
}
