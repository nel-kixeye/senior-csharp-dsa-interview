try
{
    var result = Solution.FizzBuzz(15);
    foreach (var s in result) Console.Write(s + " ");
    Console.WriteLine();
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}