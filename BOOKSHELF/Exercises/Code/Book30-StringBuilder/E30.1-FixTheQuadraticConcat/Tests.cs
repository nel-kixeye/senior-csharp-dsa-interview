public static class Tests
{
    /*
     * A  O(n^2) -> string.Join(",", names).
     *    THIS IS THE ONE THAT SHOULD NOT USE StringBuilder. Join is the direct
     *    expression of the operation, allocates once, and handles the trailing
     *    separator for free.
     *
     * B  ALREADY FINE. a + b + c in a single expression compiles to ONE
     *    string.Concat(a, b, c) call - one allocation. The quadratic problem is
     *    specifically repeated += ACROSS LOOP ITERATIONS. Leave it, or use
     *    interpolation.
     *
     * C  O(n^2) -> StringBuilder, ToString() once at the end. Pre-size if you can
     *    estimate the length.
     *
     * D  O(n^2) for no reason -> new string('-', 40).
     *
     * Test Case 1  A over 20,000 names: broken takes hundreds of ms, fixed is
     *              single-digit. Run Program.cs.
     * Test Case 2  A over an empty sequence -> "" (watch the trailing comma
     *              behaviour difference between your version and the broken one)
     * Test Case 3  D() -> exactly 40 '-' characters
     * Test Case 4  C over 0 rows -> ""
     * Test Case 5  B("Ada", "Lovelace") -> "Ada Lovelace"
     */
}
