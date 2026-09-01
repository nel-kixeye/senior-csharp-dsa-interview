try
{
    Console.WriteLine(Solution.JoinNames(["a", "b", "c"]));  // expect a, b, c
    Console.WriteLine(Solution.Greet("Ada"));                // expect Hello, Ada!
    Console.WriteLine(Solution.BuildId(42).Length);          // expect 16
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
