Word Ladder

Given beginWord, endWord, and a word list, return the number of words in the
shortest transformation sequence where each step changes exactly one letter and
every intermediate word is in the list. Return 0 if impossible.

- Constraints: up to 5000 words, each up to 10 lowercase letters.
- Target: O(N · L · 26).
- Edge cases: endWord not in the list (return 0); beginWord == endWord;
  no possible path; beginWord not required to be in the list.


----
Guide: BOOKSHELF/Exercises/Book17-BFS.md  (hints at the bottom of that file)
