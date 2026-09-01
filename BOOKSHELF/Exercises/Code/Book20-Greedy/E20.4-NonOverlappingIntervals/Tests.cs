public static class Tests
{
    /*
     * Test Case 1  { {1,2},{2,3},{3,4},{1,3} }  -> 1
     * Test Case 2  { {1,2},{1,2},{1,2} }        -> 2   (all identical)
     *
     * Test Case 3 - TOUCHING is not overlapping
     * Input:    { {1,2},{2,3} }                 -> 0
     *
     * Test Case 4 - one interval containing all others
     * Input:    { {1,100},{2,3},{4,5} }         -> 1
     *
     * Test Case 5 - single interval
     * Input:    { {1,2} }                       -> 0
     */
}
