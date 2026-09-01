Flood Fill

Starting from a given pixel in an image, replace its colour and the colour of all
4-directionally connected pixels of the same original colour.

- Constraints: image up to 50 × 50.
- Target: O(rows · cols) time.
- Edge cases: the new colour equals the original colour (infinite
  recursion if unguarded — this is the trap); starting pixel is isolated; the
  whole image is one colour.


----
Guide: BOOKSHELF/Exercises/Book18-DFS.md  (hints at the bottom of that file)
