public static class Tests
{
    /*
     * 1. DateOnly        - a DateTime introduces a time and zone that do not exist;
     *                      a zone conversion can shift someone's birthday by a day.
     * 2. DateTimeOffset (UTC) - DateTime.Now records SERVER-LOCAL time, so two
     *                      servers in different regions disagree about the same
     *                      instant and your log ordering breaks.
     * 3. TimeOnly        - a DateTime forces you to invent an arbitrary date.
     * 4. TimeSpan, measured with STOPWATCH - subtracting two DateTime.Now values
     *                      can go NEGATIVE when NTP corrects the clock.
     * 5. DateTimeOffset  - an unambiguous instant, comparable across zones.
     * 6. DateOnly        - a calendar date, not a moment.
     * 7. Store the LOCAL TIME PLUS THE IANA ZONE ID ("Asia/Tokyo"), not just UTC.
     *    WHY: if that zone's DST rules change between now and then, the correct
     *    UTC instant changes - but "3pm Tokyo time" is still what the user meant.
     *    Past timestamps are INSTANTS; future scheduled local times are INTENTIONS.
     */
}
