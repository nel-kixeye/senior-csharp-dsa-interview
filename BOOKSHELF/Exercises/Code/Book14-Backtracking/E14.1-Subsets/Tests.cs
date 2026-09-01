public static class Tests
{
    /*
     * Test Case 1  { 1,2,3 }  -> 8 subsets: [], [1], [2], [3], [1,2], [1,3], [2,3], [1,2,3]
     * Test Case 2  { }        -> 1 subset:  [[]]
     * Test Case 3  { 0 }      -> 2 subsets: [], [0]
     * Test Case 4  { 1,2 }    -> 4 subsets
     *
     * Test Case 5 - COUNT CHECK: for n elements you must produce exactly 2^n
     * subsets, all distinct. If they are all empty or all identical, you added
     * the list by reference instead of copying it.
     */
}
