Time Based Key-Value Store

Implement Set(key, value, timestamp) and Get(key, timestamp) returning the
value with the largest timestamp ≤ the requested one, or "" if none exists.

- Constraints: timestamps for a given key are strictly increasing; up to 2·10⁵
  calls.
- Target: O(1) set, O(log n) get.
- Edge cases: key never set; timestamp earlier than every stored one; exact
  timestamp match; single entry.


----
Guide: BOOKSHELF/Exercises/Book08-SortedSet-SortedDictionary.md  (hints at the bottom of that file)
