try
{
    var cards = Enumerable.Range(1, 10).ToList();
    Solution.C(cards);
    Console.WriteLine(string.Join(", ", cards));
    Console.WriteLine(cards.OrderBy(x => x).SequenceEqual(Enumerable.Range(1, 10)));  // expect True
    Console.WriteLine(Solution.B().Length >= 6);                                       // expect True
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
