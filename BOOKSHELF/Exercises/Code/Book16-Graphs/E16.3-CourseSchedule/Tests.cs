public static class Tests
{
    /*
     * Test Case 1  n = 2, { {1,0} }             -> true
     * Test Case 2  n = 2, { {1,0}, {0,1} }      -> false  (2-cycle)
     * Test Case 3  n = 3, { }                   -> true   (no prerequisites)
     *
     * Test Case 4 - SELF prerequisite
     * Input:    n = 1, { {0,0} }                -> false
     *
     * Test Case 5 - DISCONNECTED components, one with a cycle
     * Input:    n = 4, { {1,0}, {3,2}, {2,3} }  -> false
     */
}
