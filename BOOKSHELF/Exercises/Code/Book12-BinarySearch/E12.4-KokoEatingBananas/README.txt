Koko Eating Bananas

Piles of bananas and h hours. At an eating speed of k bananas/hour, each pile
takes ceil(pile / k) hours (Koko never eats from two piles in the same hour).
Return the minimum k that finishes within h hours.

- Constraints: up to 10⁴ piles; pile sizes up to 10⁹; h >= piles.Length.
- Target: O(n log(max pile)) time.
- Edge cases: h == piles.Length (must eat the biggest pile in one hour);
  one pile; all piles equal; huge pile values.


----
Guide: BOOKSHELF/Exercises/Book12-BinarySearch.md  (hints at the bottom of that file)
