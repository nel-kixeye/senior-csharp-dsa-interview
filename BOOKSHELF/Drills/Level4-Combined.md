# Level 4 — Combined

10 drills. Each needs **two or more books** working together. Recognizing one
and missing the other produces a solution that is either wrong or the wrong
complexity.

The combinations worth having in muscle memory:

- Dictionary + Sliding Window
- Dictionary + Prefix Sum
- Dictionary + Heap
- HashSet + BFS
- Sorting + Two Pointers
- Sorting + Greedy
- Sorting + Heap
- Graph + Queue
- Dictionary + Linked List

## Answer these five before checking

1. **Which books — plural?** Name every one.
2. **What is each book doing?** Assign a job to each. If you cannot say what a
   book contributes, you probably do not need it.
3. **Complexity of the combination?**
4. **What does the single-book solution cost**, and which book alone is not
   enough?
5. **Concrete C# types for each part?**

---

### D37
Given an array of integers and an integer `k`, return the `k` most frequent
elements.

### D38
Given an array of integers and an integer `k`, return the **total number** of
contiguous subarrays summing to `k`. Values may be negative.

*(You met this in D26. Now name both books explicitly and assign each a job.)*

### D39
Given a directed graph with positive edge weights, find the minimum total weight
path from a source node to every other node.

### D40
There are `n` courses, some with prerequisites given as pairs
`[course, prerequisite]`. Return a valid order in which to take all courses, or
report that none exists.

### D41
Design a cache with a fixed capacity supporting `Get(key)` and `Put(key, value)`,
both in **O(1)**. When capacity is exceeded, evict the least recently used entry.

### D42
Given a list of meeting intervals `[start, end]`, find the minimum number of
rooms required to hold all meetings.

### D43
Given an array, find all **unique triplets** that sum to zero.

### D44
Given a string, find the length of the longest substring containing **at most
`k` distinct characters**.

### D45
Given a start word, an end word, and a dictionary of words, find the length of
the shortest transformation sequence from start to end, changing exactly one
letter at a time, where every intermediate word must be in the dictionary.

### D46
Given `k` sorted linked lists, merge them into a single sorted linked list.

---

**Job assignment check.** For each drill, write one line per book:

> *Dictionary: counts each element. Heap: keeps the k best without sorting all n.*

If you cannot write that line for a book you named, you did not need it. If you
cannot cover the whole algorithm with the books you named, one is missing.
