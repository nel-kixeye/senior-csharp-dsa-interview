try
{
    Console.WriteLine(Solution.IsIsomorphic("egg", "add"));    // expect True
    Console.WriteLine(Solution.IsIsomorphic("foo", "bar"));    // expect False
    Console.WriteLine(Solution.IsIsomorphic("badc", "baba"));  // expect False (b->b, a->a, d->b collision)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
