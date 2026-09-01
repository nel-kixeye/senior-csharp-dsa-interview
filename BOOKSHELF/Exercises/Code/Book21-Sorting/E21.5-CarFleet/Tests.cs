public static class Tests
{
    /*
     * Test Case 1  target 12, pos { 10,8,0,5,3 }, speed { 2,4,1,1,3 }  -> 3
     * Test Case 2  target 10, pos { 3 }, speed { 3 }                    -> 1
     * Test Case 3  target 100, pos { 0,2,4 }, speed { 4,2,1 }           -> 1 (all merge)
     *
     * Test Case 4 - all same speed, none ever catches another
     * Input:    target 10, pos { 0,1,2 }, speed { 1,1,1 }               -> 3
     *
     * Test Case 5 - two cars arriving at EXACTLY the same time merge
     * Input:    target 10, pos { 0, 5 }, speed { 2, 1 }                 -> 1
     */
}
