using Xunit;

public class ValidSudokuTests
{
    [Fact]
    public void IsValidSudoku_ReturnsTrue_ForStandardValidBoard()
        => Assert.True(Solution.IsValidSudoku(CreateValidBoard()));

    [Theory]
    [InlineData(0, 0, '8')]
    [InlineData(0, 2, '3')]
    [InlineData(1, 1, '3')]
    public void IsValidSudoku_ReturnsFalse_ForSpecifiedDuplicate(int row, int column, char value)
    {
        var board = CreateValidBoard();
        board[row][column] = value;
        Assert.False(Solution.IsValidSudoku(board));
    }

    [Fact]
    public void IsValidSudoku_ReturnsTrue_ForCompletelyEmptyBoard()
        => Assert.True(Solution.IsValidSudoku(Enumerable.Range(0, 9).Select(_ => Enumerable.Repeat('.', 9).ToArray()).ToArray()));

    private static char[][] CreateValidBoard() =>
    [
        ['5', '3', '.', '.', '7', '.', '.', '.', '.'],
        ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
        ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
        ['8', '.', '.', '.', '6', '.', '.', '.', '3'],
        ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
        ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
        ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
        ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
        ['.', '.', '.', '.', '8', '.', '.', '7', '9']
    ];
}
