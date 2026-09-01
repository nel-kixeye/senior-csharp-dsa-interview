public static class Tests
{
    /*
     * Test Case 1
     * Add 1 -> [[1,1]]
     * Add 3 -> [[1,1],[3,3]]
     * Add 7 -> [[1,1],[3,3],[7,7]]
     * Add 2 -> [[1,3],[7,7]]        <- 2 BRIDGES two intervals, merge them
     * Add 6 -> [[1,3],[6,7]]
     *
     * Test Case 2 - duplicate value changes nothing
     * Add 1, Add 1 -> [[1,1]]
     *
     * Test Case 3 - extends an interval on the LEFT
     * Add 5, Add 4 -> [[4,5]]
     *
     * Test Case 4 - extends an interval on the RIGHT
     * Add 5, Add 6 -> [[5,6]]
     *
     * Test Case 5 - first value into an empty stream
     * Add 42 -> [[42,42]]
     */
}
