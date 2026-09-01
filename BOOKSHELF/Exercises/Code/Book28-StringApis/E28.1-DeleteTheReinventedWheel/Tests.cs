public static class Tests
{
    /*
     * Replacements and what the hand-rolled versions get WRONG:
     *
     * IsLetter  -> char.IsLetter(c)
     *              broken returns FALSE for 'e-acute', 'Omega', CJK characters
     * IsDigit   -> char.IsDigit(c)
     *              broken returns FALSE for non-ASCII digits (Arabic-Indic)
     *              If you MEAN ascii only, char.IsAsciiDigit says so and is faster
     * Lower     -> char.ToLowerInvariant(c)
     *              the +32 trick is ASCII-only and silently wrong elsewhere
     * IsBlank   -> string.IsNullOrWhiteSpace(s)
     *              broken misses tabs, newlines, non-breaking spaces
     * Repeat    -> new string(c, n)
     *              one allocation, no StringBuilder needed
     *
     * Test Case 1  IsLetter('\u00e9')  -> true
     * Test Case 2  IsDigit('\u0663')   -> true
     * Test Case 3  IsBlank("\t \n")    -> true
     * Test Case 4  IsBlank(null)       -> true
     * Test Case 5  Repeat('x', 0)      -> ""
     */
}
