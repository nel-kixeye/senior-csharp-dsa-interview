Number of Recent Calls

Implement a counter with Ping(int t), called with strictly increasing
timestamps. Each call returns how many pings occurred in the inclusive window
[t - 3000, t].

- Constraints: up to 10⁴ calls; timestamps strictly increasing.
- Target: amortized O(1) per call.
- Edge cases: first call; all calls inside one window; a long gap making the
  window empty except the current ping.


----
Guide: BOOKSHELF/Exercises/Book05-Queue.md  (hints at the bottom of that file)
