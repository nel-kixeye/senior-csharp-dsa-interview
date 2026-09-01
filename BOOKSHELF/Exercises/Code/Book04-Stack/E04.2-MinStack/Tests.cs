public static class Tests
{
    /*
     * Test Case 1
     * Push(-2), Push(0), Push(-3), GetMin() -> -3
     * Pop(), Top() -> 0, GetMin() -> -2
     *
     * Test Case 2 - DUPLICATE minimums (the one that breaks naive solutions)
     * Push(1), Push(1), GetMin() -> 1, Pop(), GetMin() -> 1
     *
     * Test Case 3 - popping the current minimum
     * Push(5), Push(2), GetMin() -> 2, Pop(), GetMin() -> 5
     *
     * Test Case 4 - single element
     * Push(7), Top() -> 7, GetMin() -> 7
     *
     * Test Case 5 - descending pushes
     * Push(3), Push(2), Push(1), GetMin() -> 1
     */
}
