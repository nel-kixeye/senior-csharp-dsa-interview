using System.Globalization;
using System.Threading;

Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
Console.WriteLine(Solution.Parse_Broken("01/02/2026"));   // January 2 in en-US

Thread.CurrentThread.CurrentCulture = new CultureInfo("en-GB");
Console.WriteLine(Solution.Parse_Broken("01/02/2026"));   // FEBRUARY 1 in en-GB - same string!

try
{
    Console.WriteLine(Solution.TryParseApiTimestamp("2026-09-01T14:30:00Z", out var ts) ? ts.ToString("O") : "reject");
    Console.WriteLine(Solution.TryParseApiTimestamp("garbage", out _) ? "parsed" : "rejected");  // expect rejected
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
