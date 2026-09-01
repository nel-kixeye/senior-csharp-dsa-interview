public static class Tests
{
    /*
     * Graph: 0-{1,2}, 1-{0,3}, 2-{0,3}, 3-{1,2,4}, 4-{3}
     *
     * Test Case 1
     * start = 0, end = 4
     * Expected: 3  (path: 0->1->3->4 or 0->2->3->4)
     *
     * Test Case 2
     * start = 0, end = 0
     * Expected: 0
     *
     * Test Case 3
     * Disconnected graph: 0-{1}, 2-{3}
     * start = 0, end = 3
     * Expected: -1
     */
}