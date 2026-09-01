public static class Tests
{
    /*
     * Test Case 1
     * schedule = [[[1,2],[5,6]], [[1,3]], [[4,10]]]   -> { {3,4} }
     *
     * Test Case 2
     * schedule = [[[1,3],[6,7]], [[2,4]], [[2,5],[9,12]]]  -> { {5,6},{7,9} }
     *
     * Test Case 3 - TOTAL overlap, no free time
     * Input:    [[[1,10]], [[2,5]]]        -> { }
     *
     * Test Case 4 - single employee with a gap
     * Input:    [[[1,2],[5,6]]]            -> { {2,5} }
     *
     * Test Case 5 - identical schedules
     * Input:    [[[1,2]], [[1,2]]]         -> { }   (no gap between busy periods)
     */
}
