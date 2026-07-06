public static class Tests
{
    /*
     * Test Case 1
     * List A: 4->1->8->4->5
     * List B: 5->6->1->8->4->5  (shared from node 8)
     * Expected: node with Val=8
     *
     * Test Case 2
     * List A: 2->6->4
     * List B: 1->5   (no intersection)
     * Expected: null
     *
     * Test Case 3
     * List A: 1->9->1->2->4
     * List B: 3->2->4  (shared from node 2)
     * Expected: node with Val=2
     */
}