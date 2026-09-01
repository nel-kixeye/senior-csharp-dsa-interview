char[][] board =
[
    ['A','B','C','E'],
    ['S','F','C','S'],
    ['A','D','E','E']
];

try
{
    Console.WriteLine(Solution.Exist(board, "ABCCED"));  // expect True
    Console.WriteLine(Solution.Exist(board, "SEE"));     // expect True
    Console.WriteLine(Solution.Exist(board, "ABCB"));    // expect False (would reuse B)
}
catch (NotImplementedException)
{
    Console.WriteLine("Solution not yet implemented.");
}
