try
{
    var m = new MedianFinder();
    m.AddNum(1);
    m.AddNum(2);
    Console.WriteLine(m.FindMedian());   // expect 1.5
    m.AddNum(3);
    Console.WriteLine(m.FindMedian());   // expect 2
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
