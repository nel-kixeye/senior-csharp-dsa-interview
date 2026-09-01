public static class Tests
{
    /*
     * Test Case 1  { 1,2,3,2,4,1 }  -> { 1, 2 }   (order not significant)
     * Test Case 2  { 1,2,3 }        -> { }        (no duplicates)
     * Test Case 3  { 1,1,1 }        -> { 1 }      (reported once)
     * Test Case 4  { }              -> { }
     *
     * Test Case 5 - THE POINT OF THE EXERCISE
     * Run Program.cs. The broken version on 40,000 elements should take
     * hundreds of ms to seconds; the fixed version should be single-digit ms.
     *
     * THE RULE: never call Contains / Count / Any over the SAME source inside a
     * predicate applied to that source. That is a nested loop with nice syntax.
     */
}
