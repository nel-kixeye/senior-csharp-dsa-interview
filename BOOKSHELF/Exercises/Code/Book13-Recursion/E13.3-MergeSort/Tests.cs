public static class Tests
{
    /*
     * Test Case 1  { 5,2,9,1,5,6 }  -> { 1,2,5,5,6,9 }
     * Test Case 2  { }              -> { }
     * Test Case 3  { 1 }            -> { 1 }
     * Test Case 4  { 3,2,1 }        -> { 1,2,3 }   (reverse sorted)
     * Test Case 5  { 2,2,2 }        -> { 2,2,2 }   (all duplicates)
     *
     * STABILITY CHECK (do this one by hand):
     * Sort pairs by key only: (1,'a'), (0,'b'), (1,'c')
     * A stable sort gives (0,'b'), (1,'a'), (1,'c')  -- 'a' still before 'c'.
     */
}
