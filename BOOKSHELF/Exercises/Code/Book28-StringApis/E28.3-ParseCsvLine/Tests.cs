public static class Tests
{
    /*
     * Test Case 1  " alice , 30 , engineer "  -> { "alice", "30", "engineer" }
     * Test Case 2  "a,,b"                      -> { "a", "b" }   (empty removed)
     * Test Case 3  ""                          -> { }
     * Test Case 4  "  "                        -> { }   (whitespace-only field)
     * Test Case 5  "single"                    -> { "single" }
     *
     * Version 2 should be exactly:
     *   line.Split(',', StringSplitOptions.TrimEntries | StringSplitOptions.RemoveEmptyEntries)
     *
     * THE SPAN RESTRICTION: Span<T> is a ref struct - it cannot be a field,
     * cannot be captured, and cannot cross a yield return or await (both compile
     * to heap-allocated state machines). Work around it with a ref struct
     * enumerator (what MemoryExtensions.Split does) or by having the caller pass
     * in a Span<Range> destination.
     */
}
