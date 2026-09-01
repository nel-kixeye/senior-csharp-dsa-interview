Delete the reinvented wheel

Each of these is a BCL method written by hand. Replace each with the correct call,
and say what edge case the hand-rolled version gets wrong.

csharp
bool IsLetter(char c) => (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
bool IsDigit(char c)  => c >= '0' && c <= '9';
char Lower(char c)    => c >= 'A' && c <= 'Z' ? (char)(c + 32) : c;
bool IsBlank(string s) { if (s == null) return true; foreach (var c in s) if (c != ' ') return false; return true; }
string Repeat(char c, int n) { var sb = new StringBuilder(); for (int i = 0; i < n; i++) sb.Append(c); return sb.ToString(); }


----
Guide: BOOKSHELF/Exercises/Book28-StringApis.md  (hints at the bottom of that file)
