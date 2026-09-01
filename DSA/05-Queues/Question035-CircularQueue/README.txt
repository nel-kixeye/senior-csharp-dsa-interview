Design a circular queue (ring buffer) of fixed capacity k.

Implement CircularQueue:
- CircularQueue(int k)     initializes with capacity k
- bool Enqueue(int value)  inserts to rear, returns false if full
- bool Dequeue()           deletes from front, returns false if empty
- int Front()              gets front element, -1 if empty
- int Rear()               gets rear element, -1 if empty
- bool IsEmpty()
- bool IsFull()

Restrictions:
- Use a fixed-size array internally (no List or Queue)
- Do not use LINQ