public static class Tests
{
    /*
     * Test Case 1  [1,2,3,null,5]  -> { "1->2->5", "1->3" }
     * Test Case 2  [1]             -> { "1" }        (no arrow)
     * Test Case 3  null            -> { }
     *
     * Test Case 4 - MULTI-DIGIT values (the variable-length undo)
     * Tree 100 -> left 250 -> left 3
     * Expected: { "100->250->3" }
     * If your undo subtracts a fixed length, this breaks.
     *
     * Test Case 5 - a node with ONE child is not a leaf
     * Tree 1 -> left 2 (2 has no children)
     * Expected: { "1->2" } only - NOT { "1", "1->2" }
     *
     * THE UNDO: record the length BEFORE appending and restore it after:
     *     int mark = sb.Length;  sb.Append(...);  ...recurse...;  sb.Length = mark;
     * That is more robust than subtracting a computed length.
     */
}
