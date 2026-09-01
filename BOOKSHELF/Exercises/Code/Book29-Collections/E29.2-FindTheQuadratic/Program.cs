// D's second bug, demonstrated:
var list = new List<Item> { new(1, true), new(2, true), new(3, false) };
Solution.D_Broken(list);
Console.WriteLine(string.Join(", ", list.Select(i => i.Id)));
// expect { 3 } but prints { 2, 3 } - item 2 was SKIPPED

try
{
    var list2 = new List<Item> { new(1, true), new(2, true), new(3, false) };
    Solution.D(list2);
    Console.WriteLine(string.Join(", ", list2.Select(i => i.Id)));   // expect 3
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
