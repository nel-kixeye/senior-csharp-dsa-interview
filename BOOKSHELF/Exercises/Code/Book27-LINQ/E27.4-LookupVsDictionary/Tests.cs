public static class Tests
{
    /*
     * 1. ToDictionary - THROWS on a duplicate key, which is the fail-fast
     *    behaviour wanted here.
     * 2. ToLookup     - one-to-many, and a missing key yields an empty sequence.
     * 3. GroupBy      - consumed once, no need to materialize a lookup.
     * 4. ToFrozenDictionary (.NET 8+) - build once, read forever. Slower to
     *    construct, faster to probe than Dictionary.
     *
     * Test Case A  ProductsByCategory(...)["nonexistent"] must yield 0 items,
     *              NOT throw. If it throws you used ToDictionary.
     * Test Case B  UserCache with duplicate ids must THROW.
     * Test Case C  Empty input: all four must handle it without error.
     */
}
