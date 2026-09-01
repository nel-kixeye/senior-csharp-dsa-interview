using System.Diagnostics;

var small = new List<int> { 1, 2, 3, 2, 4, 1 };
Console.WriteLine(string.Join(", ", Solution.FindDuplicates_Broken(small)));  // 1, 2

try
{
    Console.WriteLine(string.Join(", ", Solution.FindDuplicates(small)));     // must match
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
    return;
}

// Feel the difference. 40,000 elements.
var big = Enumerable.Range(0, 40000).Select(i => i % 20000).ToList();

var sw = Stopwatch.StartNew();
Solution.FindDuplicates_Broken(big);
Console.WriteLine($"broken: {sw.ElapsedMilliseconds} ms");

sw.Restart();
Solution.FindDuplicates(big);
Console.WriteLine($"fixed:  {sw.ElapsedMilliseconds} ms");
