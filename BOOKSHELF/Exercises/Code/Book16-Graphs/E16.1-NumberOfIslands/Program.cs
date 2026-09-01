char[][] grid =
[
    ['1','1','0','0','0'],
    ['1','1','0','0','0'],
    ['0','0','1','0','0'],
    ['0','0','0','1','1']
];

try
{
    Console.WriteLine(Solution.NumIslands(grid));   // expect 3
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
