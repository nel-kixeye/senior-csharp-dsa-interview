try
{
    var a = new NumArray([-2, 0, 3, -5, 2, -1]);
    Console.WriteLine(a.SumRange(0, 2));   // expect 1
    Console.WriteLine(a.SumRange(2, 5));   // expect -1
    Console.WriteLine(a.SumRange(0, 5));   // expect -3
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
