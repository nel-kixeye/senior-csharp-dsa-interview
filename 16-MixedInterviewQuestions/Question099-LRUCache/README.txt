Design a data structure that follows the Least Recently Used (LRU) cache constraint.

Implement LRUCache:
- LRUCache(int capacity)          initializes with positive capacity
- int Get(int key)                returns value if key exists, else -1
- void Put(int key, int value)    inserts/updates key. If capacity exceeded, evict LRU item.

Both operations must run in O(1) average time.

Restrictions:
- Use a Dictionary + a doubly-linked list (or LinkedList<T>)
- Do not use OrderedDictionary or SortedDictionary
- Do not use LINQ