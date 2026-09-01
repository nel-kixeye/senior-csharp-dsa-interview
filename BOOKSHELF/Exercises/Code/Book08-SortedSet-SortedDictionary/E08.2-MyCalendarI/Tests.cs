public static class Tests
{
    /*
     * Test Case 1
     * Book(10,20) -> true, Book(15,25) -> false, Book(20,30) -> true
     *
     * Test Case 2 - TOUCHING endpoints must succeed (half-open)
     * Book(10,20) -> true, Book(20,30) -> true
     *
     * Test Case 3 - new booking fully CONTAINS an existing one
     * Book(10,20) -> true, Book(5,30) -> false
     *
     * Test Case 4 - new booking fully INSIDE an existing one
     * Book(10,20) -> true, Book(12,15) -> false
     *
     * Test Case 5 - identical booking
     * Book(10,20) -> true, Book(10,20) -> false
     */
}
