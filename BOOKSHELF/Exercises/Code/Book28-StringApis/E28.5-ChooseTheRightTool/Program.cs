try
{
    Console.WriteLine(Solution.IsJson("Data/CONFIG.JSON"));         // expect True
    Console.WriteLine(Solution.ValuePart("key=value=more"));        // expect value=more
    Console.WriteLine(Solution.IsAbsoluteUrl("https://a.com/b"));   // expect True
    Console.WriteLine(Solution.IsAbsoluteUrl("not a url"));         // expect False
    Console.WriteLine(Solution.JoinIds([1, 2, 3]));                 // expect 1,2,3
    Console.WriteLine(Solution.SameName("caf\u00e9", "cafe\u0301"));// expect True
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
