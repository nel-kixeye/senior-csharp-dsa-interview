// Demonstrate lost updates. (Do NOT run Record_Broken with many threads on a
// machine you care about - it can corrupt the dictionary and spin forever.)
try
{
    Parallel.For(0, 10000, _ => Solution.Record_Concurrent("hits"));
    Console.WriteLine("concurrent version completed without corruption");
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
