public static class Tests
{
    /*
     * THE TYPE: DateTimeOffset (or UTC DateTime). With Kind = Unspecified the
     * values carry NO ZONE, so "is 14:00 before 15:00" is unanswerable - 14:00
     * Tokyo is EARLIER than 15:00 London by 8 hours, not 1.
     *
     * THE CHECK:  aStart < bEnd && bStart < aEnd
     * (the same half-open test as Book 22, applied to INSTANTS)
     *
     * Test Case 1  14:00-15:00 Tokyo vs 14:00-15:00 London  -> false (9h apart)
     * Test Case 2  same instant expressed in two zones       -> true
     * Test Case 3  TOUCHING: a ends exactly when b starts    -> false (half-open)
     * Test Case 4  a fully contains b                        -> true
     * Test Case 5  identical intervals                       -> true
     *
     * THE SINGLE-ZONE BREAK: a DST transition day. In the US spring-forward,
     * local times between 02:00 and 03:00 DO NOT EXIST; in autumn, 01:00-02:00
     * occurs TWICE. A local-time comparison on those days can order two events
     * wrongly, or find an overlap that did not happen.
     */
}
