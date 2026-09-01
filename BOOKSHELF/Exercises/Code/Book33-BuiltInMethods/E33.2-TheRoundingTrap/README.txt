The rounding trap

Predict the output of each, then run it.

csharp
Math.Round(2.5);
Math.Round(3.5);
Math.Round(2.5, MidpointRounding.AwayFromZero);
Math.Round(2.675, 2);
(int)(2.7);
Math.Floor(-2.1);
(int)(-2.7);

- Explain the default behaviour and name it.
- Then: which of these would you use to round a currency amount, and what
  type should that amount be in the first place?


----
Guide: BOOKSHELF/Exercises/Book33-BuiltInMethods.md  (hints at the bottom of that file)
