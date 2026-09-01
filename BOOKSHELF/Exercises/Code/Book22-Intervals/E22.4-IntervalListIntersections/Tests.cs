public static class Tests
{
    /*
     * Test Case 1
     * a = { {0,2},{5,10},{13,23},{24,25} }
     * b = { {1,5},{8,12},{15,24},{25,26} }
     * -> { {1,2},{5,5},{8,10},{15,23},{24,24},{25,25} }
     *
     * Test Case 2 - either list empty
     * Input:    a = { }, b = { {1,2} }        -> { }
     *
     * Test Case 3 - no intersections
     * Input:    a = { {1,2} }, b = { {5,6} }  -> { }
     *
     * Test Case 4 - SINGLE POINT intersection
     * Input:    a = { {1,3} }, b = { {3,5} }  -> { {3,3} }
     *
     * Test Case 5 - one interval spanning many in the other list
     * Input:    a = { {0,100} }, b = { {1,2},{5,6} } -> { {1,2},{5,6} }
     */
}
