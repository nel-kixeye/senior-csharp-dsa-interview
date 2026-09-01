// This one is answered in Notes.txt. Then implement the five stubs.
Console.WriteLine("Answer the 7 scenarios in Notes.txt, then compare with Tests.cs.");

try
{
    Console.WriteLine(Solution.DateOfBirth().GetType().Name);   // expect DateOnly
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
