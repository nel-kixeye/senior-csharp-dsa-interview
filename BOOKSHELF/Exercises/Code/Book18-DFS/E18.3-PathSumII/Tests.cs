public static class Tests
{
    /*
     * Test Case 1  the tree above, target 22 -> { {5,4,11,2}, {5,8,4,5} }
     * Test Case 2  null root, target 0       -> { }
     * Test Case 3  [1], target 1             -> { {1} }
     *
     * Test Case 4 - the target is hit at an INTERNAL node, not a leaf
     *          1
     *         /
     *        2      target = 1
     * Expected: { }   (1 alone is not a root-to-LEAF path)
     *
     * Test Case 5 - NEGATIVE values (no early pruning possible)
     * Tree 1 -> left -2 -> left 3, target 2
     * Expected: { {1,-2,3} }
     */
}
