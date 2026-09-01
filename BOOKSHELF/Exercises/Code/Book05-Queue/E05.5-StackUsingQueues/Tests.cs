public static class Tests
{
    /*
     * Test Case 1
     * Push(1), Push(2), Top() -> 2, Pop() -> 2, Empty() -> false
     *
     * Test Case 2 - push then pop immediately
     * Push(5), Pop() -> 5, Empty() -> true
     *
     * Test Case 3 - interleaved
     * Push(1), Pop() -> 1, Push(2), Push(3), Pop() -> 3, Top() -> 2
     *
     * Test Case 4 - single element
     * Push(9), Top() -> 9, Top() -> 9    (Top must not remove)
     *
     * Test Case 5 - empty at start
     * Empty() -> true
     */
}
