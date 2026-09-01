public static class Tests
{
    /*
     * Test Case 1  the 4-node cycle above - clone has the same shape, all new objects
     * Test Case 2  null input           -> null
     * Test Case 3  single node, no neighbours -> a new single node
     *
     * Test Case 4 - SELF LOOP
     * Node 1 whose neighbours include itself. The clone's neighbour must be the
     * CLONE, not the original.
     *
     * Test Case 5 - VERIFY IT IS A DEEP COPY
     * Mutate a neighbour list on the original after cloning; the clone must not
     * change. If it does, you returned references rather than copies.
     */
}
