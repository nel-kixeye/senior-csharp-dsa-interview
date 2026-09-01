// Fixed-capacity cache. Get and Put must BOTH be O(1). Evict the least
// recently used entry when capacity is exceeded.
//
// Before coding, answer in Notes.txt:
//   - the TWO structures and the exact job of each
//   - why a List<T> cannot replace the second one
//   - why the first one cannot do the job alone
//   - what the dictionary's VALUE TYPE must be for removal to actually be O(1)
//   - what you would use in production instead of hand-rolling this, and one
//     thing it gives you that your version does not
public class LRUCache
{
    public LRUCache(int capacity)
    {
        throw new NotImplementedException();
    }

    public int Get(int key) => throw new NotImplementedException();

    public void Put(int key, int value) => throw new NotImplementedException();
}
