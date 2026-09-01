// [[1,1],2,[1,1]]
var input = new List<NestedInteger>
{
    new([new NestedInteger(1), new NestedInteger(1)]),
    new(2),
    new([new NestedInteger(1), new NestedInteger(1)])
};

try
{
    Console.WriteLine(Solution.DepthSum(input));   // expect 10
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
