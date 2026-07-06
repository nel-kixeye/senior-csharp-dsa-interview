try
{
    Console.WriteLine(Solution.CountComponents(5, new[] { new[]{0,1}, new[]{1,2}, new[]{3,4} }));
    Console.WriteLine(Solution.CountComponents(5, new[] { new[]{0,1}, new[]{1,2}, new[]{2,3}, new[]{3,4} }));
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}