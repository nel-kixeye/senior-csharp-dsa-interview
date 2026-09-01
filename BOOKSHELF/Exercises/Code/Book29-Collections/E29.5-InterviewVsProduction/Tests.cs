public static class Tests
{
    /*
     * 1. Add StringComparer.Ordinal (states intent, faster) and a capacity if known.
     *    For build-once/read-forever, ToFrozenDictionary.
     *
     * 2. If node ids are dense ints, bool[] beats HashSet - no hashing, contiguous
     *    memory. Otherwise HashSet, pre-sized.
     *
     * 3. IReadOnlyList<Order> - callers must not mutate your internal state.
     *
     * 4. Channel<WorkItem> (bounded). Gives async consumption, BACKPRESSURE, and
     *    completion signalling. A raw Queue needs a lock and gives you none of that.
     *
     * 5. CustomerId is a CLASS with no Equals/GetHashCode override, so the
     *    dictionary uses REFERENCE equality - two equal-looking ids are different
     *    keys, and DemonstrateTheBug() returns FALSE.
     *    Three fixes: make it a record (or readonly record struct); override
     *    Equals + GetHashCode; or pass an IEqualityComparer<CustomerId>.
     *
     * Test Case  After your fix, DemonstrateTheBug() must return TRUE.
     */
}
