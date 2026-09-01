Corporate Flight Bookings

Given n flights and bookings of the form (first, last, seats) meaning seats
were reserved on every flight in the inclusive range, return the total seats
reserved per flight.

- Constraints: up to 2·10⁴ bookings, n up to 2·10⁴. A nested loop is
  10⁸ operations — too slow.
- Target: O(bookings + n) time, O(n) space.
- Edge cases: first == last; last == n (watch the array bound); a single
  booking covering everything; totals exceeding int.


----
Guide: BOOKSHELF/Exercises/Book11-PrefixSum.md  (hints at the bottom of that file)
