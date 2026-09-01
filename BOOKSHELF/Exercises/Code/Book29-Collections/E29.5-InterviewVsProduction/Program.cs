Console.WriteLine(Solution.DemonstrateTheBug());
// prints False - two "equal" ids are DIFFERENT keys. Explain why, then fix it.

try
{
    Console.WriteLine(Solution.GetOrders_Production().Count);
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
