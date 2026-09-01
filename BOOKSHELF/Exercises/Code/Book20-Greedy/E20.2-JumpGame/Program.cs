try
{
    Console.WriteLine(Solution.CanJump([2, 3, 1, 1, 4]));  // expect True
    Console.WriteLine(Solution.CanJump([3, 2, 1, 0, 4]));  // expect False
    Console.WriteLine(Solution.CanJump([0]));              // expect True
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
