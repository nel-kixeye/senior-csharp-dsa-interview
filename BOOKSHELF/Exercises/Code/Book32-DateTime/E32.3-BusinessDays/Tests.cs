public static class Tests
{
    /*
     * (Assuming INCLUSIVE bounds - document whichever you choose.)
     *
     * Test Case 1  Mon 2026-01-05 .. Fri 2026-01-09, no holidays  -> 5
     * Test Case 2  Sat 2026-01-03 .. Sun 2026-01-04               -> 0
     * Test Case 3  same day, a Wednesday                          -> 1
     * Test Case 4  start AFTER end                                -> 0
     *
     * Test Case 5 - THE DOUBLE-COUNT TRAP
     * A holiday falling on a SATURDAY must not be subtracted - it was never
     * counted. With holidays { 2026-01-03 (Sat) } over Mon 01-05 .. Fri 01-09
     * the answer is still 5.
     *
     * THE ARITHMETIC SHORTCUT
     *   int totalDays = end.DayNumber - start.DayNumber + 1;
     *   int businessDays = (totalDays / 7) * 5;
     *   // then loop over only the remaining (totalDays % 7) days - at most 6
     *   // finally subtract holidays in range that fall on a WEEKDAY
     */
}
