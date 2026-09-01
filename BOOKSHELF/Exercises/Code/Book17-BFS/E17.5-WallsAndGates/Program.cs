const int INF = int.MaxValue;
int[][] rooms =
[
    [INF, -1,   0, INF],
    [INF, INF, INF, -1 ],
    [INF, -1,  INF, -1 ],
    [  0, -1,  INF, INF]
];

try
{
    Solution.WallsAndGates(rooms);
    foreach (var row in rooms)
        Console.WriteLine(string.Join(" ", row.Select(v => v == INF ? "INF" : v.ToString())));
    // expect
    // 3 -1 0 1
    // 2 2 1 -1
    // 1 -1 2 -1
    // 0 -1 3 4
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
