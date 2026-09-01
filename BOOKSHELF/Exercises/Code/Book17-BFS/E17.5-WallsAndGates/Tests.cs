public static class Tests
{
    /*
     * Test Case 1  the 4x4 grid above ->
     *              3 -1  0  1
     *              2  2  1 -1
     *              1 -1  2 -1
     *              0 -1  3  4
     *
     * Test Case 2 - NO gates: grid is unchanged
     * Input:    { {INF, -1} }        Expected: unchanged
     *
     * Test Case 3 - no empty rooms
     * Input:    { {0, -1} }          Expected: unchanged
     *
     * Test Case 4 - a room walled off from every gate
     * Input:    { {0, -1, INF} }     Expected: { 0, -1, INF }  (stays INF)
     *
     * Test Case 5 - all gates
     * Input:    { {0, 0} }           Expected: unchanged
     */
}
