using System.Diagnostics;

var names = Enumerable.Range(0, 20000).Select(i => $"name{i}").ToList();

var sw = Stopwatch.StartNew();
Solution.A_Broken(names);
Console.WriteLine($"A_Broken: {sw.ElapsedMilliseconds} ms");

try
{
    sw.Restart();
    Solution.A(names);
    Console.WriteLine($"A fixed:  {sw.ElapsedMilliseconds} ms");
    Console.WriteLine(Solution.D());   // expect 40 dashes
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
