public static class Tests
{
    /*
     * Tree:      3
     *           / \
     *          5   1
     *         / \
     *        6   2
     *
     * Test Case 1  p = 5, q = 1  -> 3   (different subtrees)
     * Test Case 2  p = 5, q = 2  -> 5   (p IS the ancestor of q)
     * Test Case 3  p = 6, q = 2  -> 5   (siblings)
     * Test Case 4  p = q = 6     -> 6   (same node)
     * Test Case 5  p = 3, q = 6  -> 3   (root is the ancestor)
     */
}
