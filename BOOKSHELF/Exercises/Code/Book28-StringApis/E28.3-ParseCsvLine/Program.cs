const string line = " alice , 30 , engineer ";

try
{
    Console.WriteLine(string.Join("|", Solution.Parse_Naive(line)));    // expect alice|30|engineer
    Console.WriteLine(string.Join("|", Solution.Parse_Options(line)));  // expect alice|30|engineer
    Console.WriteLine(Solution.CountFields(line));                       // expect 3
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
