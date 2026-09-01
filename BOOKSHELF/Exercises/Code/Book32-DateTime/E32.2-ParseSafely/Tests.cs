public static class Tests
{
    /*
     * THREE PROBLEMS with DateTime.Parse(timestamp):
     *   1. Parse THROWS on malformed input instead of letting you handle it.
     *   2. It interprets format by CURRENT CULTURE, so behaviour varies by machine.
     *      (Run Program.cs: "01/02/2026" is a different date in en-US and en-GB.)
     *   3. DateTime loses the offset - the 'Z' is discarded into an ambiguous Kind.
     *
     * REWRITE
     *   DateTimeOffset.TryParseExact(input, "yyyy-MM-dd'T'HH:mm:ssK",
     *       CultureInfo.InvariantCulture, DateTimeStyles.None, out result)
     *
     * USER-ENTERED dd/MM/yyyy: still TryParse, still explicit - but the format is
     * genuinely ambiguous to a human, so use ParseExact with the format you
     * DOCUMENTED, and do NOT fall back to CurrentCulture parsing.
     *
     * Test Case 1  "2026-09-01T14:30:00Z"  -> parses, offset preserved
     * Test Case 2  "garbage"               -> returns false, does not throw
     * Test Case 3  ""                      -> returns false
     * Test Case 4  "01/02/2026" as a user date with dd/MM/yyyy -> 1 February
     * Test Case 5  the API parse must give the SAME result under en-US and tr-TR
     */
}
