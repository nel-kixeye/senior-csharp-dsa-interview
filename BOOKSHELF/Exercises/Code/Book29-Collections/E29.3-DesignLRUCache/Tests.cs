public static class Tests
{
    /*
     * Test Case 1 - the standard sequence (see Program.cs)
     * capacity 2: Put(1,1) Put(2,2) Get(1)=1 Put(3,3) Get(2)=-1 Put(4,4)
     *             Get(1)=-1 Get(3)=3 Get(4)=4
     *
     * Test Case 2 - GET COUNTS AS USE
     * capacity 2: Put(1,1) Put(2,2) Get(1) Put(3,3)
     * Key 2 must be evicted, NOT key 1.
     *
     * Test Case 3 - updating an existing key refreshes recency, does not grow size
     * capacity 2: Put(1,1) Put(2,2) Put(1,10) Put(3,3) -> Get(2) = -1, Get(1) = 10
     *
     * Test Case 4 - capacity 1
     * Put(1,1) Put(2,2) -> Get(1) = -1, Get(2) = 2
     *
     * Test Case 5 - missing key returns -1 without throwing
     *
     * THE ANSWERS
     *   Dictionary<int, LinkedListNode<(int key, int value)>> + a doubly linked list.
     *   Dictionary: O(1) key -> NODE.  List: O(1) remove + re-insert at the front.
     *   A List<T> cannot remove from the middle in O(1).
     *   The dictionary alone has no notion of order, so it cannot identify the LRU.
     *   The value MUST be LinkedListNode<T>, not T - holding the node is what
     *   makes list.Remove(node) O(1). Storing the value forces an O(n) Find.
     *   Production: MemoryCache with a size limit - it also gives expiry,
     *   eviction callbacks, thread safety, and metrics.
     */
}
