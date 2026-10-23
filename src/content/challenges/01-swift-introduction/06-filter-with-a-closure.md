---
chapter: 01-swift-introduction
title: Filter With a Closure
abstract: Replace a loop that collects invalid emails with one call to filter, using a closure — a Nice-to-know topic you will meet in every UI test file.
minutes: 20
difficulty: stretch
order: 6
starter: 01-swift-introduction/FilterEmails-starter.swift
solution: 01-swift-introduction/FilterEmails-solution.swift
doneWhen:
  - "The playground contains no `for` loop and no `var`."
  - "`invalid` is built with one call to `filter`."
  - "The console shows `Invalid: [\"bob.example.com\", \"@nouser\", \"\", \"dee @example.com\"]`."
  - "A second line shows `Valid: 2`, also computed with `filter`."
  - "`isValidEmail(_:)` is unchanged."
hints:
  - "Look up *closures* and the array method `filter` in the Swift documentation. `filter` keeps the items for which a check returns `true`."
  - "A closure is a function without a name, written in `{ }` and passed straight into a call: `signUps.filter { email in … }`. The last expression inside it is the answer for that item."
  - "For the invalid list, the closure returns `!isValidEmail(email)`. For the valid count, you can pass the function itself — `signUps.filter(isValidEmail)` — and take the `count` of the result."
quiz:
  question: What does `[3, 8, 1].filter { number in number > 2 }` return?
  options:
    - "`[8]`"
    - "`[3, 8]`"
    - "`true`"
  answer: 1
  explanation: "`filter` runs the closure once per item and keeps every item for which it returns `true`: 3 and 8 are greater than 2, 1 is not."
---

A sign-up form test collects a list of email addresses and needs the ones the app should reject. The current playground does it the long way: an empty `var` array, a loop, an `if`, and an `append`.

That pattern — "keep the items that pass a check" — is so common that arrays have a method for it, `filter`. It takes the check as a **closure**: a small function without a name that you pass straight into the call. Closures are a Nice-to-know topic for this lesson, and you will use them constantly in UI tests from chapter 5 on.

Rewrite the playground so it builds the invalid list with `filter`, then add a line that prints how many addresses are valid.
