public static class Tests
{
    /*
     * Test Case 1  gas { 1,2,3,4,5 }, cost { 3,4,5,1,2 }  -> 3
     * Test Case 2  gas { 2,3,4 },     cost { 3,4,3 }      -> -1  (total gas < total cost)
     * Test Case 3  gas { 5 },         cost { 4 }          -> 0   (single station)
     * Test Case 4  gas { 3,1,1 },     cost { 1,2,2 }      -> 0   (answer is index 0)
     * Test Case 5  gas { 1,1,3 },     cost { 2,2,1 }      -> 2   (answer is the last index)
     */
}
