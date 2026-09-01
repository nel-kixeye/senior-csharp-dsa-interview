public static class Solution
{
    // For each cell, the distance to the nearest 0. At least one 0 is guaranteed.
    // Target: O(rows * cols) - a per-cell BFS would be O((rc)^2).
    //
    // Running a BFS from every 1 is too slow. FLIP IT.
    // What do you enqueue BEFORE the loop starts, and what does that give you
    // in a single pass? Name the technique.
    public static int[][] UpdateMatrix(int[][] mat)
    {
        throw new NotImplementedException();
    }
}
