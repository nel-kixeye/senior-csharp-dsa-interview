public static class Tests
{
    /*
     * Test Case 1  { {1,3},{6,9} }, new { 2,5 }  -> { {1,5},{6,9} }
     * Test Case 2  { {1,2},{3,5},{6,7},{8,10},{12,16} }, new { 4,8 }
     *              -> { {1,2},{3,10},{12,16} }
     *
     * Test Case 3 - EMPTY input list
     * Input:    { }, new { 5,7 }                 -> { {5,7} }
     *
     * Test Case 4 - new interval goes BEFORE everything
     * Input:    { {3,5} }, new { 1,2 }           -> { {1,2},{3,5} }
     *
     * Test Case 5 - new interval SWALLOWS everything
     * Input:    { {2,3},{5,7} }, new { 1,10 }    -> { {1,10} }
     */
}
