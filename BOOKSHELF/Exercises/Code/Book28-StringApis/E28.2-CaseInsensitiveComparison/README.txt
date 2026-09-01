Case-insensitive comparison, done four ways

Three of these are wrong or wasteful. Rank them and explain.

csharp
a.ToLower() == b.ToLower()
a.ToLowerInvariant() == b.ToLowerInvariant()
string.Equals(a, b, StringComparison.OrdinalIgnoreCase)
a.Equals(b, StringComparison.CurrentCultureIgnoreCase)

- Then: which would you use for a username comparison, and which for
  sorting a list of product names shown to a user? They are different answers.


----
Guide: BOOKSHELF/Exercises/Book28-StringApis.md  (hints at the bottom of that file)
