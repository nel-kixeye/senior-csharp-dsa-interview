public static class Tests
{
    /*
     * Test Case 1
     * Graph: 0-{1,2}, 1-{0,3,4}, 2-{0}, 3-{1}, 4-{1}
     * Start: 0
     * Expected: one valid DFS order, e.g. { 0, 1, 3, 4, 2 }
     *           (exact order may vary by adjacency list order)
     *
     * Test Case 2
     * Graph: 0-{1}, 1-{2}, 2-{}
     * Start: 0
     * Expected: { 0, 1, 2 }
     *
     * Test Case 3
     * Graph: 0-{}
     * Start: 0
     * Expected: { 0 }
     */
}