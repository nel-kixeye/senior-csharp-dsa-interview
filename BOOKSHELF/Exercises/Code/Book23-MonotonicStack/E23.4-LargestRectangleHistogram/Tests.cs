public static class Tests
{
    /*
     * Test Case 1  { 2,1,5,6,2,3 }  -> 10   (bars 5 and 6, width 2)
     * Test Case 2  { 2,4 }          -> 4
     *
     * Test Case 3 - all equal
     * Input:    { 3,3,3 }           -> 9
     *
     * Test Case 4 - strictly INCREASING (nothing pops until the flush)
     * Input:    { 1,2,3,4 }         -> 6    (this is where the sentinel matters)
     *
     * Test Case 5 - a zero-height bar splits the histogram
     * Input:    { 5,0,5 }           -> 5
     */
}
