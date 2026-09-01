try
{
    Console.WriteLine(string.Join(", ", Solution.FindRedundantConnection([[1, 2], [1, 3], [2, 3]])));
    // expect 2, 3
    Console.WriteLine(string.Join(", ", Solution.FindRedundantConnection([[1, 2], [2, 3], [3, 4], [1, 4], [1, 5]])));
    // expect 1, 4
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
