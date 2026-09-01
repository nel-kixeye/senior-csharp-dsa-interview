# Book 04 — Stack

> The book of *"the most recent thing is the relevant thing."*

## 1. What problem does this book solve?

Deferring work until you know enough to finish it. A stack holds **pending
context** — things you have started but cannot resolve yet — and hands back the
most recent one the instant it becomes resolvable.

## 2. Signals

- "Matching" brackets / parentheses / tags / quotes
- "Nested" anything
- "Undo" / "back button" / "history"
- "Most recent" / "last seen" / "previous unmatched"
- "Evaluate an expression" / "parse" / postfix / infix
- "Backtrack" — undo the last decision
- "Next greater / next smaller element" → **monotonic stack** (23)
- Recursion you want to make iterative (the call stack, made explicit)
- DFS without recursion (18)
- "Valid ordering of operations"

**The deep tell:** you are scanning left to right, and when you meet an element
you need to pair it with *the nearest unresolved element behind you*. That is a
stack, always.

## 3. The naive instinct

```csharp
// "For each element, find the next greater element to its right"
for (int i = 0; i < n; i++)
{
    result[i] = -1;
    for (int j = i + 1; j < n; j++)     // rescan the tail for every i
        if (nums[j] > nums[i]) { result[i] = nums[j]; break; }
}
```

Or for bracket matching, counting with an `int` — which works for one bracket
type and silently accepts `([)]` the moment there are two.

## 4. Why that is inferior

The nested scan is O(n^2) and it **re-examines elements that a previous
iteration already proved useless**. A stack keeps exactly the elements that
could still matter and discards the rest permanently — each element is pushed
once and popped once, so the whole scan is O(n) even though it looks nested.

A counter cannot express nesting *types*. A stack can, because it stores what
was opened, not just how many.

## 5. What to recognize

`Stack<T>` — LIFO. Push, Pop, Peek.

```csharp
// Bracket matching
var st = new Stack<char>();
foreach (char c in s)
{
    if (c is '(' or '[' or '{') st.Push(c);
    else
    {
        if (st.Count == 0) return false;         // closer with nothing open
        char open = st.Pop();
        if (!Matches(open, c)) return false;     // wrong type
    }
}
return st.Count == 0;                            // nothing left dangling
```

Note the three failure modes: closer-with-empty-stack, type-mismatch, and
leftover-at-end. Missing the third is the most common bug.

## 6. Complexity

| Operation | Cost |
|---|---|
| `Push` | amortized O(1) |
| `Pop` | O(1) |
| `Peek` | O(1) |
| `Contains` | O(n) — a smell |
| `Count` | O(1) |

Space O(n) worst case (all-opening input). A monotonic-stack scan is **O(n)
total**, not O(n^2), by the push-once/pop-once argument.

## 7. C# APIs

```csharp
var st = new Stack<int>();
st.Push(1);
int top  = st.Peek();          // throws if empty
int item = st.Pop();           // throws if empty
bool ok  = st.TryPeek(out int p);   // preferred
bool ok2 = st.TryPop(out int q);    // preferred
st.Count; st.Clear(); st.ToArray(); // ToArray is top-first
```

**Enumeration order is top to bottom**, which surprises people converting a
stack to a list. `new Stack<T>(existingCollection)` pushes in enumeration
order, so the *last* element ends up on top.

## 8. Common mistakes

1. **`Pop`/`Peek` on an empty stack throws.** Use `TryPop`/`TryPeek`, or guard
   with `Count > 0`. Interview inputs are adversarial about this.
2. **Forgetting the final `Count == 0` check** in matching problems — `"((("`
   returns true.
3. **Pushing values when you needed indices.** Most monotonic-stack problems
   want the *index* so you can compute a distance or width. Push `int` indices
   and look up values via the array.
4. **Enumeration direction confusion** — top-first, not bottom-first.
5. **Using `Stack` where recursion is clearer**, or vice versa. If the recursion
   is shallow and readable, keep it.
6. **`Contains` on a stack** — if you need membership, you need a set alongside.

## 9. Correct-book problems

- Valid Parentheses; Minimum Remove to Make Valid Parentheses
- Evaluate Reverse Polish Notation; Basic Calculator
- Daily Temperatures; Next Greater Element I/II (23)
- Largest Rectangle in Histogram; Trapping Rain Water (23)
- Simplify Path (Unix path normalization)
- Min Stack (a second stack of running minima)
- Decode String (`3[a2[c]]`) — nested structure
- Binary Tree Iterative Traversals (15, 18)
- Asteroid Collision
- Backspace String Compare

## 10. Where Stack looks right but is wrong

- **FIFO order** — "process in the order they arrived" is a Queue (05). The
  words are similar; the structures are opposite.
- **Shortest path in an unweighted graph** — DFS with a stack finds *a* path,
  BFS with a queue finds the *shortest*. Choosing a stack here is a correctness
  bug, not a performance one (17, 18).
- **Simple counting with one bracket type** — an `int` counter is clearer and
  O(1) space. Only reach for a stack when types or content matter.
- **Deep recursion converted mechanically** — if you only wanted to avoid stack
  overflow, check whether the recursion is tail-recursive or reformulable first.
- **Sliding window maximum** — needs removal from *both* ends. That is a deque
  (`LinkedList<T>` or an index-based ring), not a stack (23).

---

## Production Lens

Explicit stacks in production usually mean one of three things: you are writing
a parser, you are avoiding stack overflow on deep user-supplied input, or you
are implementing an undo buffer. All three are legitimate; the third is the one
most often reinvented when `Stack<T>` plus a command object would do.

For parsing, ask whether `System.Text.Json`'s reader, a regex, or an existing
grammar library already solves it (33). Hand-rolled parsers are where
correctness bugs live.

**Related:** [[Book05-Queue]], [[Book18-DFS]], [[Book23-MonotonicStack]],
[[Book13-Recursion]], [[Book29-Collections]].
