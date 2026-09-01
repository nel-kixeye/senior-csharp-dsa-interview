var holidays = new HashSet<DateOnly>
{
    new(2026, 1, 1),    // Thursday
    new(2026, 1, 3)     // SATURDAY - must not be double-counted
};

try
{
    // Mon 2026-01-05 .. Fri 2026-01-09, no holidays in range
    Console.WriteLine(Solution.BusinessDaysBetween(new(2026, 1, 5), new(2026, 1, 9), holidays));  // expect 5

    // Thu 2026-01-01 .. Fri 2026-01-02, one weekday holiday
    Console.WriteLine(Solution.BusinessDaysBetween(new(2026, 1, 1), new(2026, 1, 2), holidays));  // expect 1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
