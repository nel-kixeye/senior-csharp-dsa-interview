H-Index

Given citation counts per paper, return the h-index: the largest h such that at
least h papers have at least h citations each.

- Constraints: up to 5000 papers; citations 0–1000.
- Target: O(n log n) sorting, or O(n) with counting.
- Edge cases: all zeroes (h = 0); a single paper with many citations (h = 1);
  every paper cited more than n times (h = n).


----
Guide: BOOKSHELF/Exercises/Book21-Sorting.md  (hints at the bottom of that file)
