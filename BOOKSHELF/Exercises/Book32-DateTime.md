# Exercises — Book 32: DateTime / DateOnly / TimeOnly

**Different in character.** Type-choice and trap-spotting exercises.
**The first question, always:** is this a **moment in time** or a **calendar
date**? That answer picks the type, and the wrong type is the root of most date
bugs.

---

### E32.1 — Pick the type
For each, name the type and one bug the *wrong* choice would cause.

1. A user's date of birth.
2. When an audit log entry was written.
3. A store's daily opening time (09:00, every day).
4. How long a request took to process.
5. A subscription's expiry, for a service with users worldwide.
6. A public holiday in a specific country.
7. A meeting scheduled for "3pm Tokyo time next Tuesday".

- **Before you answer #7:** it is the hardest one, and "store UTC" is not a
  complete answer. Say why a future scheduled local time is different from a past
  timestamp.

### E32.2 — Parse safely
This receives dates from a partner API in the fixed format `2026-09-01T14:30:00Z`.

```csharp
var when = DateTime.Parse(payload.Timestamp);
```

- **Name three separate problems** with this line.
- **Rewrite it** correctly.
- **Then:** the same partner also sends user-entered dates in a `dd/MM/yyyy` field.
  What changes, and what must you *not* do?

### E32.3 — Business days between two dates
Write a method returning the number of weekdays (Mon–Fri) between two dates,
excluding a supplied set of holidays.

- **Constraints:** ranges up to 10 years; the method may be called in a loop.
- **Edge cases:** start after end; same day; start or end on a weekend; a holiday
  that falls on a weekend (must not be double-counted); inclusive vs exclusive
  bounds (decide and document).
- **Before you code:** which type should the parameters be? Then: the naive version
  loops day by day — for a 10-year range that is 3,650 iterations. Can you do the
  full weeks arithmetically and only loop over the remainder?

### E32.4 — Overlap across time zones
Two meetings are given as `(start, end)` pairs. One was created by a user in
Tokyo, the other by a user in London.

- **Write** the overlap check.
- **Before you code:** what type must the inputs be for this to be answerable at
  all? Say what goes wrong if they are `DateTime` with `Kind = Unspecified`.
- **Then:** name a specific date on which a naive local-time comparison breaks even
  within a *single* zone, and why.

### E32.5 — Make it testable
This is correct and untestable.

```csharp
public bool IsExpired(Subscription sub) => DateTime.UtcNow > sub.ExpiresAt;
```

- **Explain** why you cannot write a reliable unit test for the boundary, DST
  behaviour, or "expires in 5 minutes" logic.
- **Rewrite it** so you can.
- **Then:** name the .NET 8+ type built for exactly this, and one thing it gives
  you beyond a hand-rolled `IClock`.

---
---

# ⛔ STOP — hints below

---

**E32.1**
1. `DateOnly` — a `DateTime` introduces a time and zone that do not exist; a
   timezone conversion can shift someone's birthday by a day.
2. `DateTimeOffset` (UTC) — `DateTime.Now` records server-local time, so two
   servers in different regions produce different values for the same instant, and
   your log ordering breaks.
3. `TimeOnly` — a `DateTime` forces you to invent an arbitrary date.
4. `TimeSpan`, measured with **`Stopwatch`** — subtracting two `DateTime.Now`
   values can go **negative** when NTP corrects the clock.
5. `DateTimeOffset` — an unambiguous instant, comparable across zones.
6. `DateOnly` — it is a calendar date, not a moment.
7. Store the **local time plus the IANA zone id** (`"Asia/Tokyo"`), not just UTC.
   *Why:* if the government changes that zone's DST rules between now and then,
   the correct UTC instant changes — but "3pm Tokyo time" is still what the user
   meant. Past timestamps are instants; future scheduled local times are
   intentions.

**E32.2**
- *Three problems:* (1) `Parse` **throws** on malformed input instead of letting
  you handle it; (2) it interprets format by **current culture**, so behaviour
  varies by machine; (3) `DateTime` loses the offset — the `Z` is discarded into an
  ambiguous `Kind`.
- *Rewrite:*
  ```
  if (!DateTimeOffset.TryParseExact(payload.Timestamp, "yyyy-MM-dd'T'HH:mm:ssK",
          CultureInfo.InvariantCulture, DateTimeStyles.None, out var when))
      return BadRequest(...);
  ```
- *User-entered `dd/MM/yyyy`:* still `TryParse`, still explicit — but here the
  format is genuinely ambiguous to a human, so use `ParseExact` with the format you
  documented, and do **not** fall back to `CurrentCulture` parsing, or the same
  string means January 2 on one machine and February 1 on another.

**E32.3**
- *Types:* `DateOnly` for the bounds and the holiday set — there is no time
  component, and using `DateTime` invites zone bugs.
- *Skeleton (arithmetic, not day-by-day):*
  ```
  int totalDays = end.DayNumber - start.DayNumber + 1;      // inclusive
  int fullWeeks = totalDays / 7;
  int businessDays = fullWeeks * 5;
  // then loop over only the remaining (totalDays % 7) days, at most 6 iterations
  // finally: subtract holidays that fall in range AND on a weekday
  ```
- *The double-count trap:* only subtract a holiday if it is **not already a
  weekend** — otherwise you remove a day you never counted.

**E32.4**
- *Types:* `DateTimeOffset` (or UTC `DateTime`). With `Kind = Unspecified` the
  values carry no zone at all, so "is 14:00 before 15:00" is unanswerable —
  14:00 Tokyo is *earlier* than 15:00 London by 8 hours, not 1.
- *Check:* `aStart < bEnd && bStart < aEnd` — the same half-open test as Book 22,
  applied to instants.
- *The single-zone break:* on a DST transition day. In the US spring-forward,
  local times between 02:00 and 03:00 **do not exist**; in autumn, 01:00–02:00
  occurs **twice**. A local-time comparison on those days can order two events
  wrongly, or find an overlap that did not happen.

**E32.5**
- *Why untestable:* `DateTime.UtcNow` is a static, ambient dependency. To test
  "expires in 5 minutes" you would have to either change the system clock or wait
  five minutes. Boundary and DST cases are effectively untestable.
- *Rewrite:*
  ```
  public bool IsExpired(Subscription sub, DateTimeOffset now) => now > sub.ExpiresAt;
  // or inject a clock:
  public IsExpired(Subscription sub) => _timeProvider.GetUtcNow() > sub.ExpiresAt;
  ```
- *The type:* **`TimeProvider`** (.NET 8+). Beyond an `IClock`, it also abstracts
  **timers** and `Task.Delay` — so `FakeTimeProvider` lets you test retry backoff,
  timeouts, and scheduled work by advancing virtual time instantly, not just
  "what time is it".
