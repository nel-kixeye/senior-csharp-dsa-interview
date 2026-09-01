public static class Tests
{
    /*
     * A  new Random() seeded from the clock; instances created in a tight loop can
     *    get the SAME SEED and produce identical sequences.
     *    Fix: Random.Shared. (On .NET 6+ the parameterless ctor is
     *    thread-safe-seeded, so it is less catastrophic than it was - but still
     *    wasteful and still wrong in spirit.)
     *
     * B  Random is NOT cryptographically secure - a reset token from it is
     *    PREDICTABLE.
     *    Fix: RandomNumberGenerator.GetInt32(...), or better, a longer token from
     *    RandomNumberGenerator.GetBytes.
     *
     * C  A comparator returning random values is INCONSISTENT; the sort may throw
     *    InvalidOperationException and, when it does not, the result is BIASED.
     *    Fix: Random.Shared.Shuffle(CollectionsMarshal.AsSpan(cards)).
     *
     * D  Random INSTANCE METHODS ARE NOT THREAD-SAFE; concurrent calls can corrupt
     *    its internal state and make it return zeros forever.
     *    Fix: Random.Shared (thread-safe since .NET 6), or [ThreadStatic] instances.
     *
     * Test Case 1  C over 1..10 must still contain exactly 1..10 afterwards
     * Test Case 2  C run 1000 times: each element lands in each position roughly
     *              equally. A biased shuffle will not.
     * Test Case 3  B must not be guessable from a timestamp
     * Test Case 4  D called from 1000 parallel threads must always return 1..6
     */
}
