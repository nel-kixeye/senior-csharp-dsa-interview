public static class Tests
{
    /*
     * 1. Where + Sum
     * 2. Select + Distinct  (or DistinctBy if you want whole users)
     * 3. SelectMany
     * 4. ToLookup           (NOT ToDictionary - missing keys must not throw)
     * 5. MaxBy              (O(n)).  OrderByDescending().First() is O(n log n) - the trap.
     * 6. All
     * 7. Chunk(500)         (.NET 6+)
     *
     * Self-check: 1200 ids in batches of 500 -> 3 batches (500, 500, 200).
     * Departments of { Eng, Eng, Sales } -> 2 distinct values.
     */
}
