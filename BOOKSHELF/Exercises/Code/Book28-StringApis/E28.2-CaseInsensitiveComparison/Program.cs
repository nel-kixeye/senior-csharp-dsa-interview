using System.Globalization;
using System.Threading;

// Reproduce the Turkish-I problem.
Console.WriteLine("--- invariant culture ---");
Console.WriteLine(Solution.Compare1("ID", "id"));   // True

Thread.CurrentThread.CurrentCulture = new CultureInfo("tr-TR");
Console.WriteLine("--- tr-TR culture ---");
Console.WriteLine(Solution.Compare1("ID", "id"));   // False  <- THE BUG
Console.WriteLine(Solution.Compare3("ID", "id"));   // True   <- ordinal is immune

try
{
    Console.WriteLine(Solution.AreSameIdentifier("ID", "id"));   // expect True in every culture
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
