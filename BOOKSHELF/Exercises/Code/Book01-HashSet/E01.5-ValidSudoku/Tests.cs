public static class Tests
{
    /*
     * Test Case 1 - the standard valid board (see Program.cs)
     * Expected: true
     *
     * Test Case 2 - duplicate in a COLUMN
     * Change row 0 col 0 from '5' to '8' in the valid board (col 0 already has '8')
     * Expected: false
     *
     * Test Case 3 - duplicate in a ROW
     * Change row 0 col 2 from '.' to '3'
     * Expected: false
     *
     * Test Case 4 - duplicate in a BOX only (row and column both still clean)
     * Change row 1 col 1 from '.' to '3'   (top-left box already has '3' at [0][1])
     * Expected: false
     *
     * Test Case 5 - completely empty board
     * All 81 cells '.'
     * Expected: true
     */
}
