int[][] m = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];

try
{
    Console.WriteLine(string.Join(", ", Solution.SpiralOrder(m)));  // expect 1,2,3,6,9,8,7,4,5
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
