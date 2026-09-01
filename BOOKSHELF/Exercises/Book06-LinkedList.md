# Exercises — Book 06: Linked List

**Reach for it when:** the problem hands you nodes; pointer surgery; O(1) space
on a chain.
**Two idioms:** the `prev/cur/next` reversal dance, and fast/slow pointers.
**The bug-eliminator:** a dummy head node whenever the head might change.

---

### E06.1 — Reverse Linked List
Reverse a singly linked list and return the new head.

- **Constraints:** up to 5000 nodes.
- **Target:** O(n) time, O(1) space, iterative.
- **Edge cases:** empty list; single node; two nodes.
- **Before you code:** name the one line that, if written in the wrong order,
  loses the rest of the list forever.
- **Follow-up:** write it recursively too. What is the space complexity then?
- *(Stub exists: `DSA/06-LinkedLists`.)*

### E06.2 — Middle of the Linked List
Return the middle node. If there are two middles, return the second.

- **Constraints:** up to 100 nodes.
- **Target:** O(n) time, O(1) space, **single pass**.
- **Edge cases:** single node; two nodes (return the second); odd vs even length.
- **Before you code:** counting then walking again is two passes. What moves at
  two different speeds?

### E06.3 — Linked List Cycle II
Determine whether a linked list has a cycle, and if so return the node where the
cycle **begins**. Otherwise return null.

- **Constraints:** up to 10⁴ nodes. **O(1) space required.**
- **Target:** O(n) time, O(1) space.
- **Edge cases:** no cycle; the whole list is one cycle; a self-loop on the last
  node; single node with no cycle.
- **Before you code:** detecting the cycle is the easy half. Finding the *entry*
  needs a second phase — a `HashSet` would make this trivial, so say why the
  constraint forbids it.

### E06.4 — Remove Nth Node From End
Remove the nth node from the end of a list and return the head.

- **Constraints:** `1 <= n <= list length`.
- **Target:** O(n) time, O(1) space, **one pass**.
- **Edge cases:** removing the **head** (n equals the length); removing the tail;
  single-node list.
- **Before you code:** two pointers, one started ahead of the other. How far
  ahead? And what makes the "remove the head" case stop needing a special branch?

### E06.5 — Reorder List
Given `L0 → L1 → … → Ln-1 → Ln`, reorder it in place to
`L0 → Ln → L1 → Ln-1 → L2 → …`.

- **Constraints:** up to 5·10⁴ nodes. Do not modify values — only rewire nodes.
- **Target:** O(n) time, O(1) space.
- **Edge cases:** 1, 2, and 3 nodes; even vs odd length (make sure the tail's
  `next` ends as null, not a cycle).
- **Before you code:** this is three exercises you have already done, chained.
  Name all three before writing a line.

---
---

# ⛔ STOP — hints below

---

**E06.1**
- *Nudge:* Save the next pointer before you overwrite it.
- *Structure:* three references: `prev`, `cur`, `next`.
- *Skeleton:*
  ```
  ListNode prev = null, cur = head;
  while (cur != null) { var next = cur.next; cur.next = prev; prev = cur; cur = next; }
  return prev;                       // NOT head — head is now the tail
  ```

**E06.2**
- *Nudge:* One step versus two steps.
- *Structure:* `slow`, `fast`.
- *Skeleton:* `while (fast != null && fast.next != null) { slow = slow.next; fast = fast.next.next; }`
  Return `slow`. This exact loop returns the *second* middle on even lengths,
  which is what was asked.

**E06.3**
- *Nudge:* After they meet, reset one pointer to the head and move **both** one
  step at a time.
- *Structure:* Floyd's, two phases.
- *Skeleton:* phase 1 — find the meeting point with slow/fast. Phase 2 — put
  `p = head`, keep `q` at the meeting point, advance both by one; they meet at
  the cycle entry. (The distance identity that makes this work is worth deriving
  once on paper — you will remember it far better than memorizing it.)

**E06.4**
- *Nudge:* Gap.
- *Structure:* dummy head + two pointers `n + 1` apart.
- *Skeleton:*
  ```
  var dummy = new ListNode(0) { next = head };
  var lead = dummy; for (int i = 0; i <= n; i++) lead = lead.next;
  var trail = dummy;
  while (lead != null) { lead = lead.next; trail = trail.next; }
  trail.next = trail.next.next;
  return dummy.next;
  ```
  The dummy is what removes the "deleting the head" special case.

**E06.5**
- *Nudge:* Find the middle (E06.2), reverse the second half (E06.1), then merge
  the two halves alternately.
- *Structure:* no extra collections.
- *Skeleton:* split at the middle and **null-terminate the first half** before
  reversing the second — forgetting that is what produces a cycle. Then weave:
  take one from the front list, one from the reversed list, repeat.
