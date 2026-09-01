# Book 06 — Linked List

> The book of *"pointer surgery"* — and of knowing when not to.

## 1. What problem does this book solve?

O(1) insertion and removal **at a position you already hold a reference to**,
without shifting anything. That qualifier is the entire value proposition, and
it is the part people forget.

In interviews, linked lists are less a data structure choice than a **puzzle
substrate**: they test whether you can manipulate references without losing the
list.

## 2. Signals

- The problem *hands you* a `ListNode` — the choice is already made
- "Reverse the list" / "reorder" / "swap nodes"
- "Detect a cycle" / "find where the cycle starts"
- "Find the middle" / "nth from the end"
- "Merge two sorted lists"
- "Remove the nth node from the end"
- Production: "O(1) removal given a node reference" (LRU cache)
- "Splice" / "move a node without copying data"

**Fast/slow pointers** is the sub-pattern worth internalizing: one pointer moves
one step, the other two. It gives you the middle, cycle detection, and
nth-from-end in a single pass with O(1) memory.

## 3. The naive instinct

Copying the list into a `List<T>`, doing the work with indices, and rebuilding.

```csharp
var values = new List<int>();
for (var cur = head; cur != null; cur = cur.next) values.Add(cur.val);
values.Reverse();
// rebuild...
```

Or, for cycle detection, a `HashSet<ListNode>` of visited nodes.

## 4. Why that is inferior

The copy is O(n) extra space to solve a problem that has an O(1)-space answer,
and in an interview it reads as avoiding the actual skill being tested. The
HashSet cycle detection *works* and is O(n) space; Floyd's tortoise-and-hare is
O(1) space and is what the question is asking for.

More importantly: the copy loses the point. If the problem gives you nodes, the
constraint being tested is reference manipulation.

## 5. What to recognize

The two idioms that cover most problems:

```csharp
// Reverse — the prev/cur/next dance
ListNode prev = null, cur = head;
while (cur != null)
{
    ListNode next = cur.next;   // save before you destroy it
    cur.next = prev;            // rewire
    prev = cur;                 // advance
    cur = next;
}
return prev;                    // prev is the new head

// Fast/slow — middle, cycle, nth-from-end
ListNode slow = head, fast = head;
while (fast?.next != null)
{
    slow = slow.next;
    fast = fast.next.next;
    if (slow == fast) { /* cycle */ }
}
// slow is now the middle
```

**Dummy head node** — the technique that eliminates half of all linked-list
bugs:

```csharp
var dummy = new ListNode(0) { next = head };
// ...work with dummy.next, never special-case "removing the first node"...
return dummy.next;
```

Any problem where the head itself might be removed or replaced wants a dummy.

## 6. Complexity

| Operation | Singly linked | `List<T>` for comparison |
|---|---|---|
| Access by index | O(n) | O(1) |
| Search | O(n) | O(n) |
| Insert/remove **given the node** | O(1) | O(n) |
| Insert/remove at a **known index** | O(n) (must walk) | O(n) |
| Insert at front | O(1) | O(n) |
| Append (with tail ref) | O(1) | amortized O(1) |

Space: O(n) **plus a reference per node** — 8 or 16 extra bytes each on 64-bit,
and the nodes are scattered across the heap. That last part is why linked lists
lose to arrays in practice far more often than the table suggests: every
traversal is a cache miss.

## 7. C# APIs

For interviews you almost always define your own:

```csharp
public class ListNode
{
    public int val;
    public ListNode next;
    public ListNode(int val = 0, ListNode next = null) { this.val = val; this.next = next; }
}
```

The BCL type is `LinkedList<T>` — **doubly** linked, and it exposes nodes, which
is what makes it usable:

```csharp
var ll = new LinkedList<int>();
LinkedListNode<int> n = ll.AddLast(1);
ll.AddFirst(0); ll.AddAfter(n, 2); ll.AddBefore(n, 3);
ll.Remove(n);          // O(1) — the reason this type exists
ll.RemoveFirst(); ll.RemoveLast();
ll.First; ll.Last; ll.Count;
ll.Find(value);        // O(n)
```

`ll.Remove(node)` in O(1) is the only compelling reason to choose
`LinkedList<T>` over `List<T>` in production. If you are not holding node
references, you are paying the memory and cache costs for nothing.

## 8. Common mistakes

1. **Losing the rest of the list** by reassigning `cur.next` before saving it.
2. **Null dereference on `fast.next.next`** — the guard must be
   `while (fast != null && fast.next != null)`.
3. **Not using a dummy head**, then writing a special case for the first node
   and getting it wrong.
4. **Returning `head` after a reversal** instead of `prev`. `head` is now the
   tail.
5. **Creating a cycle by accident** — then the traversal never terminates.
6. **Using `LinkedList<T>` in production "because insertion is O(1)"** without
   holding node references. Walking to the position is O(n), so you got nothing
   and paid in cache misses.
7. **Comparing nodes by value when you meant reference** in cycle detection.

## 9. Correct-book problems

- Reverse Linked List (iterative and recursive)
- Merge Two Sorted Lists
- Linked List Cycle; Linked List Cycle II (find the entry point)
- Middle of the Linked List
- Remove Nth Node From End (two pointers, n apart)
- Palindrome Linked List (find middle, reverse half, compare)
- Reorder List (middle + reverse + merge — three idioms in one)
- Add Two Numbers (digit lists with carry)
- Copy List with Random Pointer (Dictionary of old to new) (02)
- LRU Cache (Dictionary + doubly linked list) (02) — the one genuinely
  production-shaped linked-list problem

## 10. Where Linked List looks right but is wrong

- **You need indexed access.** O(n) per access destroys everything. Use an array.
- **You need to sort frequently.** Merge sort on a list is possible and
  unpleasant; arrays are better in every way.
- **"Insertion is fast"** — only when you already hold the node. Otherwise you
  pay O(n) to find it, and `List<T>` wins on constants.
- **Iterating a lot, mutating rarely.** Contiguous memory wins decisively.
- **Cycle detection when O(n) space is acceptable and clarity matters** — a
  HashSet is more readable. Floyd's is for the O(1)-space constraint.
- **Queue or stack behaviour** — use `Queue<T>` / `Stack<T>` (04, 05).

---

## Production Lens

Be honest: **`LinkedList<T>` is rare in modern C#**, and reaching for it is
usually a mistake. `List<T>` wins on cache locality by margins that dwarf the
asymptotic difference at realistic sizes.

The legitimate cases: an LRU/MRU cache with O(1) eviction, an intrusive list
where nodes live inside the objects, or a very large collection with heavy
middle-mutation and held references.

Before writing one, check whether `MemoryCache`, `ConcurrentDictionary` plus a
timestamp, or an off-the-shelf LRU already covers it (33).

**Related:** [[Book03-Array-List]], [[Book02-Dictionary]],
[[Book09-TwoPointers]], [[Book29-Collections]].
