public static class Tests
{
    /*
     * Test Case 1  { {0,30},{5,10},{15,20} }  -> 2
     * Test Case 2  { {7,10},{2,4} }           -> 1  (no overlap)
     * Test Case 3  { }                        -> 0
     *
     * Test Case 4 - THE TIE-BREAK CASE
     * Input:    { {1,10},{10,20} }            -> 1
     *           (a meeting ending at 10 frees the room for one starting at 10;
     *            reversing the sweep tie-break wrongly gives 2)
     *
     * Test Case 5 - all meetings at the same time
     * Input:    { {1,5},{1,5},{1,5} }         -> 3
     */
}
