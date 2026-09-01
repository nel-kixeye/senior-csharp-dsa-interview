static void Dump(int[][] ivs) =>
    Console.WriteLine(string.Join(" ", ivs.Select(i => $"[{i[0]},{i[1]}]")));

try
{
    var s = new SummaryRanges();
    s.AddNum(1); Dump(s.GetIntervals());   // expect [1,1]
    s.AddNum(3); Dump(s.GetIntervals());   // expect [1,1] [3,3]
    s.AddNum(7); Dump(s.GetIntervals());   // expect [1,1] [3,3] [7,7]
    s.AddNum(2); Dump(s.GetIntervals());   // expect [1,3] [7,7]   <- MERGE
    s.AddNum(6); Dump(s.GetIntervals());   // expect [1,3] [6,7]
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
