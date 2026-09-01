Evaluate Reverse Polish Notation

Evaluate an arithmetic expression in postfix notation. Tokens are integers and
the operators +, -, *, /. Integer division truncates toward zero.

Example: ["2","1","+","3","*"] → 9.

- Constraints: the expression is always valid; up to 10⁴ tokens.
- Target: O(n) time, O(n) space.
- Edge cases: a single number; negative operands; operand order for - and
  / (the first popped is the *right* operand); division truncation of
  negatives.


----
Guide: BOOKSHELF/Exercises/Book04-Stack.md  (hints at the bottom of that file)
