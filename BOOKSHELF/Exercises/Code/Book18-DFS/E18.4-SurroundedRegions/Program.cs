char[][] board =
[
    ['X','X','X','X'],
    ['X','O','O','X'],
    ['X','X','O','X'],
    ['X','O','X','X']
];

try
{
    Solution.Solve(board);
    foreach (var row in board) Console.WriteLine(new string(row));
    // expect
    // XXXX
    // XXXX
    // XXXX
    // XOXX     <- the bottom O touches the border, so it survives
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
