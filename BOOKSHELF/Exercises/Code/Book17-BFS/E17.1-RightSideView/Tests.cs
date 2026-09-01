public static class Tests
{
    /*
     * Test Case 1  [1,2,3,null,5,null,4]  -> { 1, 3, 4 }
     * Test Case 2  null                   -> { }
     * Test Case 3  [1]                    -> { 1 }
     *
     * Test Case 4 - fully LEFT-skewed: every node is visible
     * Input:    1 -> left 2 -> left 3     -> { 1, 2, 3 }
     *
     * Test Case 5 - a left child at a depth where the right branch is shorter
     *          1
     *         / \
     *        2   3
     *       /
     *      4
     * Expected: { 1, 3, 4 }
     */
}
