# Level 2 — Mixed

12 drills. Several books look plausible for each. The skill being trained is
**discrimination** — noticing the one detail that rules the others out.

Several of these are deliberately paired with a Level 1 drill that looks almost
identical. The difference is one clause. Find it.

## Answer these five, in writing, before checking

1. **Which book?**
2. **Why** — and specifically, **which other book did you rule out, and what
   single word ruled it out?**
3. **Expected time and space complexity?**
4. **Naive approach and its cost?**
5. **Which concrete C# type or API?**

---

### D13
Given an array of integers, find the **first value that appears twice**, scanning
from left to right.

*(Compare with D01. Does the answer change?)*

### D14
Given a string, find the **first non-repeating character**, and return its index.

*(Compare with D13. Does the answer change?)*

### D15
Given an **unsorted** array of integers and a target, return the **indices** of
the two values that sum to the target.

*(Compare with D09. The word "sorted" is gone and "indices" has appeared. What
breaks?)*

### D16
Given an unsorted array of 1,000,000 integers, return the 50th largest value.

*(Compare with D06. n is now finite and in memory, and k is larger. Does that
change your answer? Is there more than one defensible choice?)*

### D17
Given a string, find the length of the longest substring that contains no
repeated characters.

### D18
Given a collection of intervals `[start, end]`, merge all overlapping intervals
and return the resulting non-overlapping set.

### D19
Given a list of words, group together all words that are anagrams of one another.

### D20
Given two strings, determine whether one is an anagram of the other.

*(Compare with D19. Both say "anagram." Is the answer the same book?)*

### D21
Given a binary tree, return its values grouped **level by level**, as a list of
lists.

### D22
Given a binary tree, determine whether it is a valid binary search tree.

### D23
Every value in an array appears exactly twice, except one that appears once.
Find that value using **O(1) extra space**.

*(You know a solution. Does it meet the space constraint?)*

### D24
Numbers arrive one at a time in a stream. After each arrival, report the median
of everything seen so far.

---

**Discrimination check.** For each drill, name the book you *almost* chose and
the exact clause that eliminated it. If you cannot name a rejected candidate,
you were pattern-matching on the topic, not reading the constraints.
