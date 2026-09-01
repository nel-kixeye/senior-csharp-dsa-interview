public static class Tests
{
    /*
     * Test Case 1  { {1,2},{1,3},{2,3} }               -> { 2, 3 }
     * Test Case 2  { {1,2},{2,3},{3,4},{1,4},{1,5} }   -> { 1, 4 }
     *
     * Test Case 3 - the redundant edge is the LAST one given
     * Input:    { {1,2},{2,3},{1,3} }                  -> { 1, 3 }
     *
     * Test Case 4 - smallest possible cycle (3 nodes)
     * Input:    { {1,2},{2,3},{1,3} }                  -> { 1, 3 }
     *
     * Test Case 5 - extra edge joins two DISTANT already-connected nodes
     * Input:    { {1,2},{2,3},{3,4},{4,5},{1,5} }      -> { 1, 5 }
     */
}
