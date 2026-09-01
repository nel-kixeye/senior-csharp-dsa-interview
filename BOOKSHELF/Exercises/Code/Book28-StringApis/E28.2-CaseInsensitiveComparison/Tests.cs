public static class Tests
{
    /*
     * RANKING
     * #3 string.Equals(a, b, StringComparison.OrdinalIgnoreCase) - BEST for
     *    identifiers: no allocation, ordinal, intent explicit.
     * #2 ToLowerInvariant comparison - correct, but allocates two strings to
     *    answer a boolean.
     * #4 CurrentCultureIgnoreCase - right for USER-FACING text, wrong for ids.
     * #1 ToLower() comparison - A BUG. In tr-TR, "I".ToLower() is dotless 'i',
     *    so "ID" == "id" becomes FALSE. Reproduces only on Turkish-locale
     *    machines, which is what makes it vicious.
     *
     * Test Case 1  Under tr-TR, Compare1("ID","id") -> false  (demonstrates the bug)
     * Test Case 2  Under tr-TR, Compare3("ID","id") -> true
     * Test Case 3  AreSameIdentifier must be true in EVERY culture
     * Test Case 4  Username comparison  -> OrdinalIgnoreCase
     * Test Case 5  Sorting display names -> culture-aware, deliberately
     */
}
