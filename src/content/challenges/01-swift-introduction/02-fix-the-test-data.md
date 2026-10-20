---
chapter: 01-swift-introduction
title: Fix the Test Data
abstract: A colleague’s test data playground no longer compiles. Find and fix every error, one at a time, without deleting a line.
minutes: 15
difficulty: warm-up
order: 2
starter: 01-swift-introduction/TestData-starter.swift
solution: 01-swift-introduction/TestData-solution.swift
doneWhen:
  - The playground runs with no red markers.
  - "No line was deleted: the file still has the same number of lines as the starter."
  - "The console shows `Valid user: tester`, `Locked user: locked.user` and `4`, in that order."
hints:
  - Start at the top. Fix the error with the smallest line number, run, and look again.
  - The error on line 5 hides some of the ones below it. Once it is fixed, the real list of problems appears.
  - "There are four mistakes: a missing quote, text where a number belongs, a misspelled `print`, and a value that changes even though it was declared as fixed."
quiz:
  question: Two errors show in the sidebar, on lines 9 and 14. Which do you fix first?
  options:
    - Line 14, because it is the most recent error
    - Line 9, because it is the first error in the file
    - Both at once, to save a run
  answer: 1
  explanation: An early error can cause later ones. Fixing the first error in the file and running again keeps you from fixing problems that were never really there.
---

Your team shares a playground of test data — accounts, passwords and limits — that everyone copies values from. Someone edited it in a hurry, and now it does not compile.

Fix it so it runs again. The data must stay the same: the same users, the same password and a limit of five attempts.

Work the way you would on a bug: read each error message in full, change one thing, run, and read again.
