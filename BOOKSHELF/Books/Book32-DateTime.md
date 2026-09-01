# Book 32 — DateTime / DateOnly / TimeOnly

> The book of *"dates are harder than they look."*

## 1. What problem does this book solve?

Representing and comparing moments in time correctly. The algorithms here are
trivial; the **traps** are the content. Almost every date bug in production is a
type choice or a time-zone assumption, not a calculation.

## 2. Signals

- "Date" / "time" / "timestamp" / "duration"
- "Parse a date from user input or a feed"
- "How many days between ..."
- "Is this date within a range?" → intervals (22)
- "Business days" / "weekends" / "holidays"
- "Expiry" / "scheduling" / "recurrence"
- "Format for display" / "different locales"
- "Sort events chronologically"
- "Age" / "anniversary" / "birthday"

**The first question, always:** *is this a moment in time, or a calendar date?*
The answer decides the type, and getting it wrong is the root of most date bugs.

## 3. The naive instinct

```csharp
DateTime start = DateTime.Parse(userInput);       // throws on bad input; culture-dependent
DateTime now = DateTime.Now;                      // server-local; ambiguous
int days = (end - start).Days;                    // truncates; ignores DST
bool same = a.ToString("d") == b.ToString("d");   // comparing formatted strings
```

## 4. Why that is inferior

- `DateTime.Parse` **throws** on malformed input and interprets format by
  current culture — `"01/02/2026"` is January 2 in the US and February 1 in the
  UK, from the same string.
- `DateTime.Now` is the server's local time. Two servers in different regions
  produce different values for the same instant. `DateTime.UtcNow` or
  `DateTimeOffset.UtcNow` is almost always what you meant.
- `(end - start).Days` truncates toward zero — 23.9 hours is 0 days.
- Comparing formatted strings is culture-dependent and slow. Compare the values.

## 5. What to recognize — pick the right type

| Type | Represents | Use for |
|---|---|---|
| `DateOnly` (.NET 6+) | A calendar date, no time, no zone | Birthdays, invoice dates, holidays |
| `TimeOnly` (.NET 6+) | A time of day, no date | Opening hours, alarms, schedules |
| `DateTimeOffset` | An **instant** with a UTC offset | Timestamps, logs, events, anything ordered globally |
| `DateTime` (Utc) | An instant, if `Kind` is honoured | Legacy code, storage |
| `DateTime` (Local/Unspecified) | Ambiguous | **Avoid** — the source of most bugs |
| `TimeSpan` | A duration | Elapsed time, intervals, timeouts |

**The rule that prevents most bugs:** `DateTimeOffset` for a moment in time,
`DateOnly` for a calendar date. Reach for bare `DateTime` only when an existing
API forces it.

A birthday is not a moment — it is a `DateOnly`. Storing it as `DateTime`
introduces a time and a zone that do not exist, and someone born on the 1st
becomes the 31st after a zone conversion.

```csharp
var date  = new DateOnly(2026, 9, 1);
var time  = new TimeOnly(14, 30);
var stamp = DateTimeOffset.UtcNow;
var dur   = TimeSpan.FromHours(2.5);

var days = end.DayNumber - start.DayNumber;     // DateOnly: exact day difference
var span = end - start;                          // DateTimeOffset: a TimeSpan
```

## 6. Parsing — always `Try`, usually `Exact`

```csharp
// User input, culture-aware, never throws
if (DateTime.TryParse(input, CultureInfo.CurrentCulture,
                      DateTimeStyles.None, out var parsed)) { }

// Known fixed format from a feed or API — the correct choice
if (DateTimeOffset.TryParseExact(input, "yyyy-MM-dd'T'HH:mm:ssK",
        CultureInfo.InvariantCulture, DateTimeStyles.None, out var ts)) { }

// ISO 8601 round-trip
var iso = stamp.ToString("O", CultureInfo.InvariantCulture);

DateOnly.TryParse(input, out var d);
TimeOnly.TryParseExact(input, "HH:mm", out var t);
```

**`TryParse` over `Parse`, always** — external input is untrusted, and an
exception for an expected condition is the wrong control flow.

**`ParseExact` with `InvariantCulture` for machine formats** — a fixed format
from an API should not be interpreted through the server's locale.

## 7. Formatting and arithmetic

```csharp
stamp.ToString("O");                       // ISO 8601 round-trip — for storage/APIs
stamp.ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);
stamp.ToString("d", CultureInfo.CurrentCulture);   // short date, user-facing

date.AddDays(30);  date.AddMonths(1);  date.AddYears(1);
stamp.AddHours(3); stamp.AddMinutes(-15);

// Comparison
a < b;  a == b;  a.CompareTo(b);
DateTime.Compare(a, b);

// Time zones — the correct way
var tz = TimeZoneInfo.FindSystemTimeZoneById("America/Los_Angeles");
var local = TimeZoneInfo.ConvertTime(stamp, tz);

// Measuring elapsed time — NOT DateTime
var sw = Stopwatch.StartNew();
sw.Stop();
var elapsed = sw.Elapsed;
```

**Use `Stopwatch` for durations, never `DateTime.Now` differences.** The system
clock can jump — NTP corrections, DST, manual changes — and produce negative or
wildly wrong elapsed times. `Stopwatch` uses a monotonic timer.

.NET 6+ accepts IANA ids (`"America/Los_Angeles"`) on Windows as well as Linux,
which removes the old cross-platform id problem.

## 8. Common mistakes — the interview traps

1. **`DateTime.Now` instead of `UtcNow`.** Server-local, breaks across regions.
2. **`Parse` instead of `TryParse`** on external input.
3. **Culture-dependent parsing** of a fixed format — the `MM/dd` vs `dd/MM`
   ambiguity.
4. **`(end - start).Days` truncates.** Use `TotalDays` for a fractional value, or
   `DateOnly.DayNumber` differences for exact calendar days.
5. **Adding months is not commutative or reversible.** Jan 31 + 1 month = Feb 28;
   subtracting a month gives Jan 28. Not a bug in .NET — a property of calendars.
6. **DST.** A local day is not always 24 hours; some local times do not exist,
   and some occur twice. Do arithmetic in UTC, convert for display.
7. **Ignoring `DateTime.Kind`.** `Unspecified` silently behaves as local in some
   conversions.
8. **Leap years / Feb 29.** `DateTime.IsLeapYear`, `DateTime.DaysInMonth`.
9. **Comparing formatted strings** instead of values.
10. **Storing local times in a database.** Store UTC (or `DateTimeOffset`),
    convert at the edge.
11. **`DateTime.Now` in a tight loop** — it is a syscall and surprisingly slow.
12. **Assuming a week starts on Sunday** — that is culture-dependent.

## 9. Where these types are the right answer

- Event scheduling and calendar logic (with intervals, 22)
- Expiry, TTL, and validity windows
- Sorting events chronologically (21)
- Business-day calculations
- Age calculation (`DateOnly` arithmetic, carefully around birthdays)
- Log timestamps (`DateTimeOffset`, UTC)
- Rate-limit and sliding time windows (10)

## 10. Where reaching for DateTime is wrong

- **Measuring elapsed time** → `Stopwatch`.
- **A date with no time** → `DateOnly`, not `DateTime` with a zeroed time.
- **A time with no date** → `TimeOnly`.
- **A duration** → `TimeSpan`, not two DateTimes.
- **Complex calendar/time-zone logic** → **NodaTime**. It makes the distinctions
  (`Instant`, `LocalDate`, `ZonedDateTime`) explicit in the type system, and
  those distinctions are exactly where bugs live.
- **Recurrence rules** (RRULE, "third Tuesday monthly") → a library; hand-rolled
  recurrence is a swamp.
- **A monotonic sequence identifier** → a counter, not a timestamp. Timestamps
  collide and can go backwards.

---

## Production Lens

Four rules that prevent nearly all real date bugs:

**Store UTC.** Convert to local only at the presentation edge, using the *user's*
zone, not the server's.

**Use `DateTimeOffset` for instants.** It carries the offset, so the moment is
unambiguous even after it moves between systems.

**Use `DateOnly`/`TimeOnly` when there is genuinely no time or no date.** The
type system then prevents the class of bug where a zone conversion shifts
someone's birthday.

**Inject the clock.** `DateTime.UtcNow` scattered through business logic is
untestable. `TimeProvider` (.NET 8+) or an `IClock` abstraction lets you test
expiry, scheduling, and DST edge cases deterministically. This is the single
highest-value habit in this book, and it is a design point rather than a date
point.

For anything genuinely calendar-heavy, **NodaTime** is worth the dependency.

**Related:** [[Book22-Intervals]], [[Book21-Sorting]],
[[Book33-BuiltInMethods]], [[Book26-Math]].
