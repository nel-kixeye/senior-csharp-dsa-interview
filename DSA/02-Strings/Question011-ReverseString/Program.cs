try
{
    var chars = new[] { 'h', 'e', 'l', 'l', 'o' };
    Solution.ReverseString(chars);
    Console.WriteLine(new string(chars));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}