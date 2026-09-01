// 14:00-15:00 Tokyo (UTC+9)  vs  14:00-15:00 London (UTC+0)
var tokyoStart  = new DateTimeOffset(2026, 9, 1, 14, 0, 0, TimeSpan.FromHours(9));
var tokyoEnd    = new DateTimeOffset(2026, 9, 1, 15, 0, 0, TimeSpan.FromHours(9));
var londonStart = new DateTimeOffset(2026, 9, 1, 14, 0, 0, TimeSpan.Zero);
var londonEnd   = new DateTimeOffset(2026, 9, 1, 15, 0, 0, TimeSpan.Zero);

try
{
    Console.WriteLine(Solution.Overlaps(tokyoStart, tokyoEnd, londonStart, londonEnd));
    // expect False - they are 9 hours apart, despite both reading "14:00"
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
