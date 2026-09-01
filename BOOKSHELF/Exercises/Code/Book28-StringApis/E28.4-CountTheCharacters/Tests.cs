public static class Tests
{
    /*
     *                        code units  runes  graphemes
     * "hello"                    5         5        5
     * "caf\u00e9"                4         4        4
     * "cafe\u0301"               5         5        4     <- looks identical on screen
     * thumbs up emoji            2         1        1     <- surrogate PAIR
     * family emoji (ZWJ)         11        7        1     <- one visible character
     *
     * THE THREE UNITS
     *   code units  -> s.Length                      (UTF-16 units)
     *   runes       -> s.EnumerateRunes().Count()    (code points)
     *   graphemes   -> new StringInfo(s).LengthInTextElements   (what humans count)
     *
     * Only graphemes match human intuition.
     * ALSO: to compare "caf\u00e9" and "cafe\u0301" as equal, call
     * string.Normalize() first - the same visible string has multiple encodings.
     */
}
