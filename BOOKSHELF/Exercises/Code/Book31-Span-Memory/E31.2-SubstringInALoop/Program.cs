using System.Diagnostics;

var line = new string('a', 200000) + "needle";
const string target = "needle";

var before = GC.GetTotalAllocatedBytes();
var sw = Stopwatch.StartNew();
Console.WriteLine($"broken: {Solution.Find_Broken(line, target)}  {sw.ElapsedMilliseconds} ms  " +
                  $"{(GC.GetTotalAllocatedBytes() - before) / 1024} KB");

try
{
    before = GC.GetTotalAllocatedBytes();
    sw.Restart();
    Console.WriteLine($"span:   {Solution.Find_Span(line, target)}  {sw.ElapsedMilliseconds} ms  " +
                      $"{(GC.GetTotalAllocatedBytes() - before) / 1024} KB");

    sw.Restart();
    Console.WriteLine($"bcl:    {Solution.Find_Bcl(line, target)}  {sw.ElapsedMilliseconds} ms");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
