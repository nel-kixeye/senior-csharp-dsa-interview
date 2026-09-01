public static class Tests
{
    /*
     * Test Case 1  { {1,3},{2,6},{8,10},{15,18} }  -> { {1,6},{8,10},{15,18} }
     *
     * Test Case 2 - TOUCHING intervals merge
     * Input:    { {1,4},{4,5} }                    -> { {1,5} }
     *
     * Test Case 3 - THE CLASSIC BUG: one interval CONTAINED in another
     * Input:    { {1,10},{2,3} }                   -> { {1,10} }
     *           (plain assignment of the new end would wrongly give {1,3})
     *
     * Test Case 4 - no overlaps at all
     * Input:    { {1,2},{3,4} }                    -> unchanged
     *
     * Test Case 5 - identical intervals
     * Input:    { {1,4},{1,4} }                    -> { {1,4} }
     */
}
