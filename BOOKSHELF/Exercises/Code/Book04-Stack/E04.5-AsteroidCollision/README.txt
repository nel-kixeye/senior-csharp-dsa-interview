Asteroid Collision

Asteroids move along a line. Positive values move right, negative move left, all
at the same speed. When two collide, the smaller explodes; if equal, both
explode. Return the final state.

Example: [5, 10, -5] → [5, 10].

- Constraints: up to 10⁴ asteroids; no zeroes.
- Target: O(n) time, O(n) space.
- Edge cases: all positive (no collisions); all negative; equal magnitudes
  annihilating; a survivor that then collides with the next one down the stack.


----
Guide: BOOKSHELF/Exercises/Book04-Stack.md  (hints at the bottom of that file)
