public static class Tests
{
    /*
     * Test Case 1  { 7,1,5,3,6,4 }  -> 7   ((5-1) + (6-3))
     * Test Case 2  { 1,2,3,4,5 }    -> 4   (every step up; same as buy-low-sell-high)
     * Test Case 3  { 7,6,4,3,1 }    -> 0   (strictly decreasing, never trade)
     * Test Case 4  { 5 }            -> 0   (single day)
     * Test Case 5  { 3,3,3 }        -> 0   (flat)
     */
}
