// The inputs that expose the hand-rolled versions.
Console.WriteLine($"IsLetter_Broken('e' with accent) = {Solution.IsLetter_Broken('\u00e9')}");  // False - WRONG
Console.WriteLine($"IsDigit_Broken(Arabic-Indic 3)  = {Solution.IsDigit_Broken('\u0663')}");    // False
Console.WriteLine($"IsBlank_Broken(\"\\t\")          = {Solution.IsBlank_Broken("\t")}");       // False - WRONG

try
{
    Console.WriteLine(Solution.IsLetter('\u00e9'));   // expect True
    Console.WriteLine(Solution.IsBlank("\t \n"));     // expect True
    Console.WriteLine(Solution.Repeat('x', 5));       // expect xxxxx
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
