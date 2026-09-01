public static class Tests
{
    /*
     * Test Case 1
     * Ping(1)    -> 1
     * Ping(100)  -> 2
     * Ping(3001) -> 3
     * Ping(3002) -> 3        (t=1 falls outside [2, 3002])
     *
     * Test Case 2 - first call
     * Ping(1) -> 1
     *
     * Test Case 3 - long gap empties the window
     * Ping(1) -> 1, Ping(10000) -> 1
     *
     * Test Case 4 - boundary is INCLUSIVE
     * Ping(1) -> 1, Ping(3001) -> 2      (3001 - 3000 = 1, still counted)
     *
     * Test Case 5 - all inside one window
     * Ping(1), Ping(2), Ping(3) -> 1, 2, 3
     */
}
