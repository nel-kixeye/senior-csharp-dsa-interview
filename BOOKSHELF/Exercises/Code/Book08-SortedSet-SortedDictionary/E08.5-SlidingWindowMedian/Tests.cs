public static class Tests
{
    /*
     * Test Case 1
     * Input:    { 1,3,-1,-3,5,3,6,7 }, k = 3
     * Expected: { 1, -1, -1, 3, 5, 6 }
     *
     * Test Case 2 - k = 1 returns the array itself
     * Input:    { 1,2,3 }, k = 1        Expected: { 1, 2, 3 }
     *
     * Test Case 3 - EVEN k averages the two middles
     * Input:    { 1,2,3,4 }, k = 2      Expected: { 1.5, 2.5, 3.5 }
     *
     * Test Case 4 - duplicates in the window
     * Input:    { 2,2,2,2 }, k = 2      Expected: { 2.0, 2.0, 2.0 }
     *
     * Test Case 5 - OVERFLOW on the average
     * Input:    { 2147483647, 2147483647 }, k = 2
     * Expected: { 2147483647.0 }   (int addition would wrap negative)
     */
}
