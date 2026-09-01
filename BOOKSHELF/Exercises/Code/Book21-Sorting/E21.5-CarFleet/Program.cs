try
{
    Console.WriteLine(Solution.CarFleet(12, [10, 8, 0, 5, 3], [2, 4, 1, 1, 3]));  // expect 3
    Console.WriteLine(Solution.CarFleet(10, [3], [3]));                            // expect 1
    Console.WriteLine(Solution.CarFleet(100, [0, 2, 4], [4, 2, 1]));               // expect 1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
