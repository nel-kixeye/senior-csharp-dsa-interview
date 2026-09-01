try
{
    // employee 0: [1,2] [5,6]   employee 1: [1,3]   employee 2: [4,10]
    int[][][] schedule = [[[1, 2], [5, 6]], [[1, 3]], [[4, 10]]];
    foreach (var iv in Solution.EmployeeFreeTime(schedule))
        Console.Write($"[{iv[0]},{iv[1]}] ");
    Console.WriteLine();
    // expect [3,4]
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
