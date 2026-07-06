try
{
    var numbers = new[] { 1, 2, 3, 4, 5 };
    var result = Solution.Reverse(numbers);
    Console.WriteLine(string.Join(", ", result));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}