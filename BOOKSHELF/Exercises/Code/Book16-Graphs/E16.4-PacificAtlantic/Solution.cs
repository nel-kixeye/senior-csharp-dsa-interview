public static class Solution
{
    // Pacific touches the top and left edges; Atlantic the bottom and right.
    // Water flows to a neighbour of EQUAL OR LOWER height.
    // Return all cells that can reach BOTH oceans.
    //
    // Searching outward from every cell is O((mn)^2).
    // What happens if you search BACKWARDS from the ocean edges instead - and
    // what does the height comparison become?
    public static IList<IList<int>> PacificAtlantic(int[][] heights)
    {
        throw new NotImplementedException();
    }
}
