public static class Tests
{
    /*
     * Test Case 1
     * begin "hit", end "cog", list { hot,dot,dog,lot,log,cog }
     * Expected: 5    (hit -> hot -> dot -> dog -> cog)
     *
     * Test Case 2 - endWord NOT in the list
     * Same but list { hot,dot,dog,lot,log }    Expected: 0
     *
     * Test Case 3 - one step apart
     * begin "a", end "c", list { a, b, c }     Expected: 2
     *
     * Test Case 4 - begin equals end
     * begin "hit", end "hit", list { hit }     Expected: 1
     *
     * Test Case 5 - no possible path
     * begin "hit", end "xyz", list { xyz }     Expected: 0
     */
}
