# Exercises — Book 04: Stack

**Reach for it when:** nesting, matching, "most recent unresolved thing", undo.
**Watch:** `Pop`/`Peek` throw on empty — use `TryPop`/`TryPeek` or guard `Count`.

---

### E04.1 — Valid Parentheses
Given a string of `()`, `[]`, `{}`, determine whether it is correctly balanced
and properly nested.

- **Constraints:** up to 10⁴ characters, brackets only.
- **Target:** O(n) time, O(n) space.
- **Edge cases:** empty string (valid); `"("`; `")"`; `"([)]"` (wrong nesting);
  `"((("`.
- **Before you code:** there are **three** distinct ways this can fail. Name all
  three before writing. Most people forget the third.
- *(Stub exists: `DSA/04-Stacks`.)*

### E04.2 — Min Stack
Design a stack supporting `Push`, `Pop`, `Top`, and `GetMin`, all in **O(1)**.

- **Constraints:** `GetMin` must be O(1), not O(n).
- **Edge cases:** duplicate minimums pushed then popped once; popping the current
  minimum; single element.
- **Before you code:** you cannot rescan for the minimum. So what do you store
  *alongside* each element, or in parallel with the stack?

### E04.3 — Evaluate Reverse Polish Notation
Evaluate an arithmetic expression in postfix notation. Tokens are integers and
the operators `+`, `-`, `*`, `/`. Integer division truncates toward zero.

Example: `["2","1","+","3","*"]` → `9`.

- **Constraints:** the expression is always valid; up to 10⁴ tokens.
- **Target:** O(n) time, O(n) space.
- **Edge cases:** a single number; negative operands; **operand order for `-` and
  `/`** (the first popped is the *right* operand); division truncation of
  negatives.
- **Before you code:** which operand comes off the stack first, and does it
  matter for every operator?

### E04.4 — Decode String
Decode a string with the encoding `k[encoded]`, meaning the bracketed content
repeats `k` times. Nesting is allowed.

Example: `"3[a2[c]]"` → `"accaccacc"`.

- **Constraints:** `k` is a positive integer, possibly multi-digit; input is
  always valid.
- **Target:** O(output length) time.
- **Edge cases:** multi-digit counts (`"12[a]"`); nesting three deep; text
  outside brackets (`"3[a]2[bc]"`); no brackets at all.
- **Before you code:** at a `[` you must suspend what you were building. What
  exactly do you push — and note it is *two* things, not one.

### E04.5 — Asteroid Collision
Asteroids move along a line. Positive values move right, negative move left, all
at the same speed. When two collide, the smaller explodes; if equal, both
explode. Return the final state.

Example: `[5, 10, -5]` → `[5, 10]`.

- **Constraints:** up to 10⁴ asteroids; no zeroes.
- **Target:** O(n) time, O(n) space.
- **Edge cases:** all positive (no collisions); all negative; equal magnitudes
  annihilating; a survivor that then collides with the next one down the stack.
- **Before you code:** a collision happens only for one specific
  sign-pair-and-order. Which one? And why does a surviving asteroid need to keep
  colliding rather than being pushed immediately?

---
---

# ⛔ STOP — hints below

---

**E04.1**
- *Nudge:* Push openers; on a closer, the top must be its match.
- *Structure:* `Stack<char>`.
- *Skeleton:* the three failure modes are: a closer when the stack is **empty**;
  a closer whose match is **wrong**; and a **non-empty stack at the end**. Return
  `st.Count == 0` at the end — that third one is the commonly missed case.

**E04.2**
- *Nudge:* The minimum at any moment is a property of the stack *at that depth*.
- *Structure:* either a second `Stack<int>` of running minima, or push
  `(value, minSoFar)` tuples onto one stack.
- *Skeleton:* on push, `minStack.Push(Math.Min(value, minStack.Count == 0 ? value : minStack.Peek()))`;
  pop both together. Pushing duplicates of the minimum (rather than skipping
  them) is what makes repeated-minimum popping correct.

**E04.3**
- *Nudge:* Numbers wait; operators consume.
- *Structure:* `Stack<int>`.
- *Skeleton:* on an operator, `int right = st.Pop(); int left = st.Pop();` — that
  order matters for `-` and `/`. Push the result. The final `Pop` is the answer.

**E04.4**
- *Nudge:* You need to restore both the repeat count and the text built *before*
  the bracket.
- *Structure:* two stacks — `Stack<int>` for counts, `Stack<StringBuilder>` (or
  `Stack<string>`) for the enclosing partial result.
- *Skeleton:* on a digit, accumulate `k = k * 10 + (c - '0')` (multi-digit). On
  `[`, push `k` and the current builder, then reset both. On `]`, pop the count
  and prior builder, and append the current content that many times.

**E04.5**
- *Nudge:* A collision requires the stack top moving **right** and the incoming
  moving **left**.
- *Structure:* `Stack<int>` of survivors.
- *Skeleton:* while `st.Count > 0 && st.Peek() > 0 && incoming < 0`, resolve:
  pop if the top is smaller, annihilate both if equal, discard the incoming if
  the top is larger. Only push the incoming if it survived the whole `while` —
  use a flag or `goto`-free `if` after the loop.
