public static class Tests
{
    /*
     * Test Case 1 - COUNT THE ENUMERATIONS
     * Run Program.cs. Broken enumerates 4 times: Count(), Count() again, the
     * foreach, and Sum(). Your fix must enumerate exactly ONCE.
     *
     * Test Case 2 - a ONE-SHOT source
     * If the source can only be enumerated once (a StreamReader-backed iterator),
     * the broken version's later passes yield NOTHING and the total is 0.
     *
     * Test Case 3 - empty source
     * Expected: returns 0, handle never called.
     *
     * Test Case 4 - correctness
     * Orders { (1,10,valid), (2,20,invalid), (3,30,valid) }
     * handle called for ids 1 and 3; return value 60 (SUM IS OVER ALL ORDERS).
     *
     * Test Case 5 - also prefer Any() over Count() == 0, and the Count PROPERTY
     * over the Count() METHOD once materialized.
     */
}
