public static class Solution
{
    // Weekdays (Mon-Fri) between two dates, excluding a set of holidays.
    //
    // Which TYPE should the parameters be? Decide before writing.
    // The naive version loops day by day - for a 10-year range that is 3,650
    // iterations, and this may be called in a loop.
    // Can you do the FULL WEEKS arithmetically and only loop over the remainder?
    //
    // Decide and DOCUMENT whether the bounds are inclusive.
    // TRAP: a holiday that falls on a weekend must not be double-counted.
    public static int BusinessDaysBetween(DateOnly start, DateOnly end, ISet<DateOnly> holidays)
    {
        throw new NotImplementedException();
    }
}
