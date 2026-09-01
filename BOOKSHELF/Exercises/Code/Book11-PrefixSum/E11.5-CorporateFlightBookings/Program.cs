try
{
    int[][] b = [[1, 2, 10], [2, 3, 20], [2, 5, 25]];
    Console.WriteLine(string.Join(", ", Solution.CorpFlightBookings(b, 5)));
    // expect 10, 55, 45, 25, 25
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
