public static class Tests
{
    /*
     * Test Case 1
     * Input:    { 1,2,3,1 }, indexDiff = 3, valueDiff = 0   Expected: true
     *
     * Test Case 2
     * Input:    { 1,5,9,1,5,9 }, indexDiff = 2, valueDiff = 3  Expected: false
     *
     * Test Case 3 - valueDiff = 0 means exact duplicates only
     * Input:    { 1,2,1 }, indexDiff = 1, valueDiff = 0     Expected: false
     *
     * Test Case 4 - OVERFLOW guard
     * Input:    { -2147483648, 2147483647 }, indexDiff = 1, valueDiff = 1
     * Expected: false     (naive int subtraction wraps and wrongly returns true)
     *
     * Test Case 5 - single element
     * Input:    { 1 }, indexDiff = 1, valueDiff = 1         Expected: false
     */
}
