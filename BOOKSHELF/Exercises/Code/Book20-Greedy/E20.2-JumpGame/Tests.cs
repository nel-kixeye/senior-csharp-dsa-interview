public static class Tests
{
    /*
     * Test Case 1  { 2,3,1,1,4 }  -> true
     * Test Case 2  { 3,2,1,0,4 }  -> false  (stuck at the 0 at index 3)
     *
     * Test Case 3 - a 0 at the LAST index is fine
     * Input:    { 0 }             -> true
     *
     * Test Case 4 - a 0 immediately blocks
     * Input:    { 0, 1 }          -> false
     *
     * Test Case 5 - one big jump clears everything
     * Input:    { 5,0,0,0,0,0 }   -> true
     */
}
