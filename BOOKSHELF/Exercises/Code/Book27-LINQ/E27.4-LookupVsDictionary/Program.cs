var products = new List<Product> { new(1, "tools", "hammer"), new(2, "tools", "saw") };

try
{
    var lookup = Solution.ProductsByCategory(products);
    Console.WriteLine(lookup["tools"].Count());       // expect 2
    Console.WriteLine(lookup["nonexistent"].Count()); // expect 0 - must NOT throw
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
