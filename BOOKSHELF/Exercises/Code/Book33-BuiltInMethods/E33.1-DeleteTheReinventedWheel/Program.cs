try
{
    Console.WriteLine(Solution.A([3, 9, 2]));            // expect 9
    Console.WriteLine(Solution.C(15, 0, 10));           // expect 10
    Console.WriteLine(Solution.E([1, 2], [1, 2]));      // expect True
    Console.WriteLine(Solution.F(Enumerable.Range(1, 250).ToList()).Count()); // expect 3
    Console.WriteLine(Solution.G(-7, 2));               // expect (-3, -1)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
