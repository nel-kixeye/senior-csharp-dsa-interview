public static class Tests
{
    /*
     * Test Case 1  [1,2,3,4,5]  -> 3    (path 4-2-1-3, counted in EDGES)
     * Test Case 2  [1]          -> 0    (single node)
     * Test Case 3  [1,2]        -> 1
     *
     * Test Case 4 - longest path does NOT pass through the root
     *          1
     *         /
     *        2
     *       / \
     *      3   4
     *     /     \
     *    5       6
     * Expected: 4    (5-3-2-4-6)
     *
     * Test Case 5 - fully one-sided chain of 4 nodes -> 3
     */
}
