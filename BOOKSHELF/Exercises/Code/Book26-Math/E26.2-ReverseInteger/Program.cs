try
{
    Console.WriteLine(Solution.Reverse(123));         // expect 321
    Console.WriteLine(Solution.Reverse(-123));        // expect -321
    Console.WriteLine(Solution.Reverse(120));         // expect 21
    Console.WriteLine(Solution.Reverse(1534236469));  // expect 0 (overflows)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
