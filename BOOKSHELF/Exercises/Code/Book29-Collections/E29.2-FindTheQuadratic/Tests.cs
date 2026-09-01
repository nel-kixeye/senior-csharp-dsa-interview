public static class Tests
{
    /*
     * A  List.Contains is O(n) inside an O(n) loop -> O(n^2).
     *    Fix: source.Distinct(), or a HashSet for membership plus a List if you
     *    need first-seen order.
     *
     * B  RemoveAt(0) shifts every element -> O(n^2).
     *    Fix: Queue<T> with Dequeue().
     *
     * C  Re-sorting on every insert -> O(n^2 log n).
     *    Fix: PriorityQueue (if you only need the smallest) or SortedSet.
     *
     * D  TWO bugs:
     *      1. RemoveAt inside a forward loop -> O(n^2)
     *      2. IT SKIPS ELEMENTS - everything shifts left while i still advances,
     *         so consecutive expired items are missed. Run Program.cs to see it.
     *    Fix: list.RemoveAll(x => x.IsExpired) - O(n) total AND correct.
     *         (Or iterate backwards.)
     *
     * Test Case  D on { (1,expired), (2,expired), (3,ok) } must leave ONLY 3.
     */
}
