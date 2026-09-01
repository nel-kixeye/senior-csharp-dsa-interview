Task Scheduler

Given task labels and a cooldown n, each identical task must be separated by at
least n intervals. Return the minimum total intervals (including idles) to run
all tasks.

- Constraints: up to 10⁴ tasks, 26 labels; 0 <= n <= 100.
- Target: O(total tasks) time.
- Edge cases: n = 0 (answer is just the task count); all tasks identical;
  all tasks distinct; two labels tied for most frequent.
- Follow-up: there is a closed-form formula using only the maximum frequency
  and the number of labels tied at it. Can you derive it?


----
Guide: BOOKSHELF/Exercises/Book07-PriorityQueue.md  (hints at the bottom of that file)
