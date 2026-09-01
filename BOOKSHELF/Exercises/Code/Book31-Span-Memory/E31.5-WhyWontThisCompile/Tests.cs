public static class Tests
{
    /*
     * THE ONE CAUSE
     * Span<T> and ReadOnlySpan<T> are REF STRUCTS. They are guaranteed to live
     * only on the stack, so they can never be stored anywhere that might outlive
     * or escape the current stack frame.
     *
     * A  a class FIELD lives on the heap.
     *    Fix: store ReadOnlyMemory<char>, call .Span at the point of use.
     *
     * B  an async method's locals are hoisted into a heap-allocated STATE MACHINE.
     *    Fix: take ReadOnlyMemory<char>, convert inside the synchronous portion.
     *
     * C  an iterator compiles into a heap-allocated state machine, same as async.
     *    Fix: return a materialized collection, or use a custom ref struct enumerator.
     *
     * D  the stackalloc buffer DIES when Build returns - the span would dangle.
     *    The compiler catches this.
     *    Fix: return char[], or accept a caller-provided Span<char> destination.
     *
     * Test Case 1  CountAsync("hello".AsMemory()) -> 5
     * Test Case 2  Build()[0] == 'x'
     * Test Case 3  Uncomment each of A-D in turn and READ THE COMPILER ERROR.
     *              That is the actual exercise.
     */
}
