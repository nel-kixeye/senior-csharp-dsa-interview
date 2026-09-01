public static class Tests
{
    /*
     * Test Case 1
     * Input:    { {1,1,1},{1,1,0},{1,0,1} }, sr=1, sc=1, color=2
     * Expected: { {2,2,2},{2,2,0},{2,0,1} }
     *
     * Test Case 2 - THE TRAP: new colour equals the old one
     * Input:    { {0,0},{0,0} }, sr=0, sc=0, color=0
     * Expected: unchanged, and it MUST TERMINATE (no infinite recursion)
     *
     * Test Case 3 - isolated starting pixel
     * Input:    { {0,1},{1,0} }, sr=0, sc=0, color=2   -> { {2,1},{1,0} }
     *
     * Test Case 4 - whole image one colour
     * Input:    { {1,1},{1,1} }, sr=0, sc=0, color=3   -> all 3
     *
     * Test Case 5 - 1x1 image
     * Input:    { {5} }, sr=0, sc=0, color=9           -> { {9} }
     */
}
