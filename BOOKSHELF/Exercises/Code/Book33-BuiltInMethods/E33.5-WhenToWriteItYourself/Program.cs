int[] sorted = [1, 2, 2, 2, 3];

try
{
    Console.WriteLine(Solution.FirstIndexOf(sorted, 2));   // expect 1 - the FIRST 2
    Console.WriteLine(Array.BinarySearch(sorted, 2));      // may print 1, 2 or 3 - unspecified

    Console.WriteLine(string.Join(", ", Solution.WhereSelect([1, 2, 3, 4], x => x % 2 == 0, x => x * 10)));
    // expect 20, 40
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
