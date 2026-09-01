My Calendar I

Implement Book(int start, int end) for a half-open interval [start, end).
Return true and record it if it does not overlap any existing booking;
otherwise return false and record nothing.

- Constraints: up to 1000 calls.
- Target: O(log n) per booking.
- Edge cases: exactly adjacent bookings ([10,20) then [20,30) — must
  succeed); a booking fully containing an existing one; identical bookings.


----
Guide: BOOKSHELF/Exercises/Book08-SortedSet-SortedDictionary.md  (hints at the bottom of that file)
