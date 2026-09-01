public static class Tests
{
    /*
     * WHAT ACTUALLY HAPPENS
     * Concurrent writes can corrupt Dictionary's internal bucket chains. The
     * documented failure is not merely a lost update - a corrupted chain can
     * make a subsequent READ SPIN FOREVER, hanging the thread. That is the
     * production hang, and it is why "we'll just accept slightly wrong counts"
     * is not an acceptable answer.
     *
     * FIX 1  lock (_gate) { ... } around the read-modify-write
     * FIX 2  ConcurrentDictionary + AddOrUpdate(key, 1, (_, old) => old + 1)
     * FIX 3  Per-thread/per-request counters aggregated at the end - no shared
     *        mutable state, no contention. (Or use the metrics library, which
     *        does exactly this.)
     *
     * WHY THE INDEXER IS STILL WRONG ON ConcurrentDictionary
     * d[k] = d[k] + 1 is THREE separate atomic operations, not one. Two threads
     * can both read 5 and both write 6. AddOrUpdate / GetOrAdd perform the
     * update atomically.
     *
     * Test Case  10,000 parallel increments must yield exactly 10,000.
     */
}
