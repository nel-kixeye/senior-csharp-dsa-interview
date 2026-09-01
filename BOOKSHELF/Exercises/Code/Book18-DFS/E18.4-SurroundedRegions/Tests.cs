public static class Tests
{
    /*
     * Test Case 1  the 4x4 board above -> only the border-touching O survives
     *
     * Test Case 2 - ALL 'O': nothing is captured (all touch the border)
     * Input:    { {'O','O'},{'O','O'} }   Expected: unchanged
     *
     * Test Case 3 - all 'X'
     * Input:    { {'X'} }                 Expected: unchanged
     *
     * Test Case 4 - single row: nothing can be surrounded
     * Input:    { {'X','O','X'} }         Expected: unchanged
     *
     * Test Case 5 - a region connected to the border only via a CORNER cell
     * Must survive - connectivity is 4-directional, so verify carefully.
     */
}
