public static class Tests
{
    /*
     * 1. string.Join - one allocation, exact size. StringBuilder works but says less.
     * 2. Interpolation or + - ONE Concat call. StringBuilder here is SLOWER (its
     *    own allocation and setup) and noisier.
     * 3. StringBuilder for unknown length... but better still an XmlWriter over a
     *    STREAM, so you never hold 10 MB in memory.
     * 4. string.Create(16, state, (span, s) => { ... }) - writes directly into the
     *    final string's buffer. Zero intermediates.
     * 5. Write straight to a StreamWriter. Building a 500 MB string in memory
     *    first is the mistake - and on the Large Object Heap it is worse.
     * 6. Structured logging with a message template (E30.5).
     *
     * Test Case 1  JoinNames([]) -> ""
     * Test Case 2  JoinNames(["a"]) -> "a"   (no trailing separator)
     * Test Case 3  Greet("Ada") -> "Hello, Ada!"
     * Test Case 4  BuildId(...).Length == 16 exactly
     */
}
