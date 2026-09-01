public static class Tests
{
    /*
     * LRUCache(2)
     * Put(1,1), Put(2,2)
     * Get(1)   -> 1
     * Put(3,3)         -- evicts key 2 (LRU)
     * Get(2)   -> -1
     * Put(4,4)         -- evicts key 1 (LRU)
     * Get(1)   -> -1
     * Get(3)   -> 3
     * Get(4)   -> 4
     *
     * LRUCache(1)
     * Put(2,1)
     * Get(2)   -> 1
     * Put(3,2)         -- evicts key 2
     * Get(2)   -> -1
     * Get(3)   -> 2
     */
}