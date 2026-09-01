public static class Tests
{
    /*
     * Test Case 1  [2,1,3]  -> true
     * Test Case 2  [5,1,4,null,null,3,6] -> false
     *
     * Test Case 3 - THE ONE THAT BREAKS PARENT-ONLY COMPARISON
     *          5
     *         / \
     *        1   6
     *           / \
     *          4   7        <- 4 is in the right subtree of 5 but LESS than 5
     * Expected: false       (every parent comparison passes)
     *
     * Test Case 4 - duplicates are invalid
     * Input:    [2,2]       -> false
     *
     * Test Case 5 - extreme values as node data
     * Input:    [int.MinValue] -> true    (must not fail on the sentinel)
     */
}
