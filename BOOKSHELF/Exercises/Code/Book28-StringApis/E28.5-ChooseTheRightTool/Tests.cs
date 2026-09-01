public static class Tests
{
    /*
     * 1. path.EndsWith(".json", StringComparison.OrdinalIgnoreCase)
     *    AVOID path.ToLower().EndsWith(...) - allocates and is culture-risky.
     *
     * 2. var i = s.IndexOf('='); return s[(i + 1)..];   (or AsSpan for no alloc)
     *    AVOID s.Split('=')[1] - allocates the whole array AND drops "=more".
     *
     * 3. Uri.TryCreate(input, UriKind.Absolute, out _)
     *    AVOID a hand-written regex - URL grammar is far larger than it looks.
     *
     * 4. string.Join(",", ids)
     *    AVOID += in a loop. (And in real SQL: use PARAMETERS, not concatenation.)
     *
     * 5. a.Normalize(FormC) == b.Normalize(FormC)
     *    AVOID plain == - the same visible string has multiple encodings.
     *
     * Test Case 1  IsJson("Data/CONFIG.JSON")  -> true
     * Test Case 2  ValuePart("key=value=more") -> "value=more"  (NOT "value")
     * Test Case 3  IsAbsoluteUrl("not a url")  -> false
     * Test Case 4  JoinIds([])                 -> ""
     * Test Case 5  SameName precomposed vs decomposed -> true
     */
}
