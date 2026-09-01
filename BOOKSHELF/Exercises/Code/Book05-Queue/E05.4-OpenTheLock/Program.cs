try
{
    Console.WriteLine(Solution.OpenLock(["0201", "0101", "0102", "1212", "2002"], "0202")); // expect 6
    Console.WriteLine(Solution.OpenLock(["8888"], "0009"));                                 // expect 1
    Console.WriteLine(Solution.OpenLock(["0000"], "8888"));                                 // expect -1
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
