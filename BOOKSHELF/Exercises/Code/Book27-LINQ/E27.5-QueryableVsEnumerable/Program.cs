// No database here - this exercise is about reading and reasoning.
// Answer the three questions in Notes.txt, then implement HighValue.

var fake = new List<Order>
{
    new(1, 50m,  "a"),
    new(2, 150m, "b"),
    new(3, 250m, "c")
}.AsQueryable();

try
{
    foreach (var r in Solution.HighValue(fake))
        Console.WriteLine($"{r.Id}: {r.Total}");
    // expect 2: 150 and 3: 250
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
