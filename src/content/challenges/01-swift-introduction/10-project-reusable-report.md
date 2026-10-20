---
chapter: 01-swift-introduction
title: "Project: Make the Report Reusable"
abstract: Turn the generator’s report into a function, generate ten more guests in a loop, and print the report before and after.
minutes: 30
difficulty: stretch
order: 10
starter: 01-swift-introduction/Generator-05.swift
solution: 01-swift-introduction/GeneratorReport-solution.swift
doneWhen:
  - "A function `report(for:)` takes an array of `TestUser` and returns the four report lines as `[String]`."
  - "No counting happens outside `report(for:)`: `invalid`, `admins`, `regulars` and `guests` only exist inside it."
  - "Ten guests named `guest1` to `guest10` are generated with one loop, not ten lines."
  - "The console shows the original report, a `---` line, then `Users: 18`, `Valid emails: 16`, `Invalid: bob.example.com, @nouser` and `By role: admin 2, user 4, guest 12`."
hints:
  - "Start by moving the counting loop and the four `print` lines into a new function. What does the function need as input, and what should it hand back instead of printing?"
  - "The function’s signature can be `func report(for users: [TestUser]) -> [String]`. Build the four lines with interpolation and return them as an array."
  - "To print the result, loop over the returned array. To generate the guests, loop over `1...10` and pass `\"guest\\(number)\"` to `makeUser`."
quiz:
  question: Why does `report(for:)` return the lines instead of printing them?
  options:
    - Functions are not allowed to call `print`
    - The caller decides what to do with them — print them, compare them, or save them
    - Returning is faster than printing
  answer: 1
  explanation: A function that returns its result can be used in more places. A UI test, for example, could compare the lines with expected values instead of printing them.
---

The test data generator from the Checkpoint works, but its report is welded to one list of users: the counting and printing sit at the top level of the playground. The QA lead now wants the report twice — once for the base data, and once after ten more guest accounts are generated for a load test.

Copying the counting loop would work, and would leave you with two reports to keep in sync. Restructure the playground so the report can be produced for any list of users, then use it before and after adding the guests.

The base report must stay exactly as it is today.
