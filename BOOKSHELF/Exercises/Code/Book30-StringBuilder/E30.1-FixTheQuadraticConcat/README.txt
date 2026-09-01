Fix the quadratic concatenation

Rewrite each, and state the complexity before and after. One of these should
not use StringBuilder — identify it.

csharp
// A
string csv = "";
foreach (var name in names) csv += name + ",";

// B
string full = "";
full += firstName; full += " "; full += lastName;

// C
string report = "";
foreach (var row in rows) report += $"{row.Id}\t{row.Name}\n";

// D
string padded = "";
for (int i = 0; i < 40; i++) padded += "-";


----
Guide: BOOKSHELF/Exercises/Book30-StringBuilder.md  (hints at the bottom of that file)
