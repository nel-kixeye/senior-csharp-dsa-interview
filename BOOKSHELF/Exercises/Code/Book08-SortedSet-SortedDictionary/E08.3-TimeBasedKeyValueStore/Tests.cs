public static class Tests
{
    /*
     * Test Case 1
     * Set("foo","bar",1); Get("foo",1) -> "bar"; Get("foo",3) -> "bar"
     * Set("foo","bar2",4); Get("foo",4) -> "bar2"; Get("foo",5) -> "bar2"
     *
     * Test Case 2 - key never set
     * Get("nope", 1) -> ""
     *
     * Test Case 3 - timestamp EARLIER than every stored one
     * Set("a","x",5); Get("a",1) -> ""
     *
     * Test Case 4 - exact timestamp match
     * Set("a","x",5); Get("a",5) -> "x"
     *
     * Test Case 5 - several versions, pick the right one
     * Set("a","v1",1); Set("a","v2",10); Get("a",9) -> "v1"
     */
}
