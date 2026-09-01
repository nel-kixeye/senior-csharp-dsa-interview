# Level 5 — Interview Simulation

8 drills. No hints, no category, no complexity target. Several are phrased the
way a real engineering problem is phrased rather than the way a LeetCode problem
is.

This level trains the thing you actually want: **catching your own first
instinct and overriding it.**

## The protocol — say all of this out loud

For each drill, speak (do not just think) the following, in order:

> **1.** "My first instinct is **X**, because ..."
>
> **2.** "That would cost **O(...)** in time and **O(...)** in space."
>
> **3.** "But the stronger pattern is **Y**, because ..."
>
> **4.** "The signal I should have caught first is ..."
>
> **5.** "In production rather than an interview, I would reach for ... because
> ..."

Step 1 is not optional and not a formality. **Write down the wrong instinct.**
The skill being trained is not "know the answer" — it is *noticing the reflex
firing and interrupting it*. You cannot practise interrupting something you did
not admit to.

Step 5 matters as much as step 3. Several of these have a legitimate interview
answer and a different legitimate production answer.

---

### D47
You have a 50 GB web server log file. Each line contains an IP address. Report
the 10 IP addresses that made the most requests.

The file does not fit in memory.

### D48
Implement a rate limiter: each user may make at most 100 requests in any rolling
60-second window. The service handles 50,000 users and 20,000 requests per
second.

### D49
Your build system has tasks with dependencies. Detect whether the dependency
configuration contains a circular dependency, and if so, report the specific
cycle so a developer can fix it.

### D50
Implement autocomplete. Given a prefix typed by a user, return the 5 most
popular completions from a dictionary of 2,000,000 terms, each with a popularity
score. Latency budget: 10 ms.

### D51
An airline has bookings recorded as `(firstDay, lastDay, seatCount)`, meaning
that many seats were reserved on every day in that inclusive range. Given up to
100,000 bookings over 50,000 days, return the total seats reserved on each day.

*(The obvious approach is a loop inside a loop. What is that costing you?)*

### D52
You have 100,000,000 records on disk. Produce the set of distinct records. The
data does not fit in memory.

### D53
Given two sorted arrays of sizes `m` and `n`, find the median of their combined
elements in **O(log(m + n))**.

*(This one is genuinely hard. Getting the book right is worth more than getting
the implementation right.)*

### D54
You are given tasks, each with a duration and a list of prerequisite tasks. With
unlimited parallel workers, compute the minimum total time to complete all tasks.

---

## Scoring yourself

For each drill, mark:

- **Instinct correct** — your first thought was the right book.
- **Caught it** — first thought was wrong, and you overrode it before checking.
- **Missed it** — you needed the answer key.

The metric that matters over time is **"caught it" converting to "instinct
correct."** Early on, most of your wins will be catches. That is exactly the
right progression — a catch means the override reflex is working, and repetition
is what moves it from catch to instinct.

Re-run this level after a week away. The drills you *caught* the first time are
the ones most likely to have become instinct.
