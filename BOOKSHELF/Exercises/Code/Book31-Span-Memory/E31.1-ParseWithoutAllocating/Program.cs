using System.Diagnostics;

var line = string.Join(",", Enumerable.Range(1, 100000));

var before = GC.GetTotalAllocatedBytes();
var sw = Stopwatch.StartNew();
var a = Solution.Total_Broken(line);
Console.WriteLine($"broken: {a}  {sw.ElapsedMilliseconds} ms  " +
                  $"{(GC.GetTotalAllocatedBytes() - before) / 1024} KB allocated");

try
{
    before = GC.GetTotalAllocatedBytes();
    sw.Restart();
    var b = Solution.Total(line);
    Console.WriteLine($"fixed:  {b}  {sw.ElapsedMilliseconds} ms  " +
                      $"{(GC.GetTotalAllocatedBytes() - before) / 1024} KB allocated");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
