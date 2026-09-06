public static class Solution
{
    // Rows, columns and 3x3 boxes must each contain no duplicate digit.
    // '.' means empty. The board need not be solvable.
    // Box index from (row, col):  (row / 3) * 3 + (col / 3)
    public static bool IsValidSudoku(char[][] board)
    {
        var rowCheckers = new HashSet<char>[9];
        var columnCheckers = new HashSet<char>[9];
        var boxCheckers = new HashSet<char>[9];

        for (var i = 0; i < 9; i++)
        {
            rowCheckers[i] = new HashSet<char>();
            columnCheckers[i] = new HashSet<char>();
            boxCheckers[i] = new HashSet<char>();
        }

        for (var ri = 0; ri < 9; ri++)
        {
            for (var ci = 0; ci < 9; ci++)
            {
                var current = board[ri][ci];

                if (current == '.')
                    continue;

                var boxIndex = (ri / 3) * 3 + (ci / 3);

                if (!rowCheckers[ri].Add(current))
                    return false;

                if (!columnCheckers[ci].Add(current))
                    return false;

                if (!boxCheckers[boxIndex].Add(current))
                    return false;
            }
        }

        return true;
    }
    
}
