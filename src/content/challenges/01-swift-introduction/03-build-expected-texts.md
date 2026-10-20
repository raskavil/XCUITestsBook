---
chapter: 01-swift-introduction
title: Build the Expected Texts
abstract: Build three texts a login test expects to see, from constants only, so a change to the test data updates every message.
minutes: 15
difficulty: warm-up
order: 3
starter: 01-swift-introduction/ExpectedTexts-starter.swift
solution: 01-swift-introduction/ExpectedTexts-solution.swift
doneWhen:
  - The playground compiles and runs.
  - "The console shows `Welcome back, tester`, `tester has 3 attempts left` and `Limit: 5`."
  - "The three `expected…` lines contain no `\"tester\"` and no number — only names of constants."
  - "When you change `username` to `\"qa.lead\"`, all three messages change with it."
hints:
  - Each expected text is a string that mixes fixed words with constants. Which lesson tool does exactly that?
  - "Line 10 fails for the reason in this lesson’s pitfall. The same tool fixes it."
  - "Inside `\\( )` you can write a small calculation, not only a name — for example `maxAttempts - failedAttempts`."
quiz:
  question: "Why does `\"Limit: \" + maxAttempts` not compile?"
  options:
    - Strings cannot be joined with `+`
    - "`maxAttempts` is an `Int`, and Swift never joins text and numbers silently"
    - "`maxAttempts` is a `let` and cannot be used in text"
  answer: 1
  explanation: "`+` joins two strings, but `maxAttempts` is a number. Interpolation — `\"Limit: \\(maxAttempts)\"` — turns it into text for you."
---

The login screen shows three texts that depend on the test account: a welcome message, a warning about remaining attempts, and the attempt limit. A UI test will later compare what is on screen with these expected texts.

The starter already has the test data as constants, but the expected texts are empty, and one line does not compile.

Fill in the three expected texts so they are built from the constants only. If someone changes the test account or the limit, the expected texts must follow without any other edit.
