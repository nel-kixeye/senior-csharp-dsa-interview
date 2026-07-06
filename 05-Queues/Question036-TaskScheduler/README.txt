Given a list of tasks labeled A-Z and a cooldown integer n,
return the minimum number of CPU intervals needed to finish all tasks.
The CPU can execute a task or be idle. Same tasks must be n intervals apart.

Example: tasks = ['A','A','A','B','B','B'], n = 2 -> 8

Restrictions:
- Do not use LINQ
- O(m) time where m is task count