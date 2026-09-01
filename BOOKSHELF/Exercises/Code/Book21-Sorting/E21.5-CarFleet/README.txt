Car Fleet

Cars at given positions travel toward a target at given speeds. A faster car
catching a slower one joins its fleet and travels at the slower speed. Return the
number of fleets that arrive.

- Constraints: up to 10⁵ cars; distinct positions.
- Target: O(n log n) time.
- Edge cases: one car; all cars same speed (each is its own fleet unless they
  start... think it through); a car already at the target; cars that catch up
  exactly at the target (they do merge).


----
Guide: BOOKSHELF/Exercises/Book21-Sorting.md  (hints at the bottom of that file)
