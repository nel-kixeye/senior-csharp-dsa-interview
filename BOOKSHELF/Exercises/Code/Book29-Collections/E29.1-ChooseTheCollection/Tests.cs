public static class Tests
{
    /*
     *  1. FrozenDictionary (.NET 8+)  - build once, probe forever
     *  2. HashSet<T>, or bool[] if node ids are dense 0..n-1 (faster, less memory)
     *  3. Stack<T>                    - LIFO is literally the undo semantic
     *  4. PriorityQueue<T,P>          - repeated extraction of the extreme
     *  5. SortedSet<string> + GetViewBetween  - ordered RANGE query
     *                                   (a trie or sorted array + binary search also works)
     *  6. char[,] or int[81]          - fixed size, dense indices, best locality
     *  7. ConcurrentDictionary + AddOrUpdate  - concurrent mutation
     *  8. Channel<T> BOUNDED          - "producer must slow down" IS backpressure,
     *                                   which ConcurrentQueue does not provide
     *  9. LinkedList<T>               - the ONLY scenario where it wins, and only
     *                                   because you hold the node reference
     * 10. IReadOnlyList<T> as the RETURN TYPE (backed by List<T> internally)
     *
     * If you answered "Dictionary" for #1 you are not wrong, just not optimal.
     * If you answered "ConcurrentQueue" for #8, re-read the backpressure clause.
     */
}
