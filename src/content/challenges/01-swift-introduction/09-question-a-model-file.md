---
chapter: 01-swift-introduction
title: Question a Model File
abstract: Answer four questions about an unfamiliar TaskBoard file that uses error handling and access control — two Nice-to-know topics.
minutes: 20
difficulty: core
order: 9
starter: 01-swift-introduction/TaskDetailModel-starter.swift
solution: 01-swift-introduction/TaskDetailModel-solution.swift
doneWhen:
  - The playground still compiles, and nothing above `Your answers` was changed.
  - "`identifiers` contains the three identifier strings from the file, in the order they appear."
  - Questions 2–4 each have a one-line answer in a `//` comment below the question.
  - "Each answer names the line of app code it is based on, or quotes it."
hints:
  - Use the reading passes from the lesson. Strings in the `screen.element` shape answer question 1 in a few seconds.
  - "For question 2, look for the word `throw` inside `markDone()`, and for the condition on the same line."
  - "Look up *access control* in the Swift documentation for question 3: `private(set)` means anyone may read the value, but only the type itself may change it. For question 4, `prefix(n)` keeps the first `n` characters."
quiz:
  question: A function’s signature ends in `throws`. What does that tell you without reading its body?
  options:
    - It always fails
    - It can fail with an error, which the caller has to handle
    - It runs on a background thread
  answer: 1
  explanation: "`throws` marks a function that can fail. Callers must use `try`, and the body tells you which errors and when — you only read that far when you need to."
---

You are about to test the Task detail screen, and a developer pointed you at the file that holds its logic. You have never seen it, and it uses two features this chapter skipped: **error handling** (`throws`, `throw`) and **access control** (`private`, `private(set)`). Both are Nice-to-know topics for this lesson.

You do not need to master either one. You need four answers that will shape your test cases: which identifiers you can search for, when marking a task as done fails, whether a test could change a task directly, and what happens to a very long title.

Write your answers in the starter playground, below the app code. Leave the app code exactly as it is.
