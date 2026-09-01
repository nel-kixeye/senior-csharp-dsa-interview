Console.WriteLine("Write your 12 answers in Notes.txt, then check Tests.cs.");

try
{
    Solution.UseAllTwelve();
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
