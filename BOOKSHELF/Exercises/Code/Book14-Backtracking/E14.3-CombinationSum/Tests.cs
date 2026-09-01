public static class Tests
{
    /*
     * Test Case 1  { 2,3,6,7 }, target 7 -> { {2,2,3}, {7} }
     * Test Case 2  { 2,3,5 },   target 8 -> { {2,2,2,2}, {2,3,3}, {3,5} }
     * Test Case 3  { 2 },       target 1 -> { }   (impossible)
     * Test Case 4  { 7 },       target 7 -> { {7} } (candidate equals target)
     *
     * Test Case 5 - NO REORDERED DUPLICATES
     * { 2,3 }, target 5 must yield {2,3} ONCE, never both {2,3} and {3,2}.
     */
}
