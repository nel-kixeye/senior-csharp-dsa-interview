try
{
    Console.WriteLine(Solution.Reverse(123));
    Console.WriteLine(Solution.Reverse(-123));
    Console.WriteLine(Solution.Reverse(120));
    Console.WriteLine(Solution.Reverse(int.MaxValue));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}