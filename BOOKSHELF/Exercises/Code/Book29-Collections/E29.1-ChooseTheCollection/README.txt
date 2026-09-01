Choose the collection

For each scenario, name the collection and the single operation that decides it.
One sentence each.

1. Config keys loaded once at startup, read on every request for the process
   lifetime.
2. A visited marker during a graph traversal of 10⁶ nodes.
3. Undo history for a text editor.
4. Jobs to run, always taking the highest-priority one next.
5. Autocomplete over a fixed word list where you need "all words between app and
   apq".
6. A fixed board of 9×9 cells in a Sudoku solver.
7. Counting how many times each HTTP status code was returned, in a shared
   in-memory metrics object updated by many request threads.
8. A queue of work items produced by one thread and consumed by another, where the
   producer must slow down if the consumer falls behind.
9. A frequently-mutated list of 100,000 items where you constantly remove from the
   middle and you already hold a reference to the item.
10. The result of a query, returned from a public API method, that callers must
    not modify.


----
Guide: BOOKSHELF/Exercises/Book29-Collections.md  (hints at the bottom of that file)
