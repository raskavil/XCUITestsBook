---
chapter: 01-swift-introduction
title: Print a Test Case
abstract: Turn a manual test case written as comments into a playground that prints it, line by line, in the right order.
minutes: 15
difficulty: warm-up
order: 1
starter: 01-swift-introduction/TestCase-starter.swift
solution: 01-swift-introduction/TestCase-solution.swift
doneWhen:
  - The playground runs without errors.
  - "The console shows six lines: the test name, the precondition, three numbered steps and the expected result."
  - The lines appear in the same order as in the test case.
  - Each group of `print` lines has a `//` comment above it.
hints:
  - Each line you want in the console needs its own `print`.
  - The comments in the starter stay as they are. Add your code below them.
  - "Write the text inside straight double quotes, like `print(\"1. Open the task list\")`, and add `// Steps` above the three step lines."
quiz:
  question: You add `print("Done")` above all the other `print` lines. Where does "Done" appear in the console?
  options:
    - On the first line
    - On the last line
    - Nowhere, because it is out of order
  answer: 0
  explanation: Code runs from top to bottom, so the first `print` in the file writes the first line of output.
---

Your team keeps its manual test cases in a shared document. A colleague wants the same test cases in the console, so they can be pasted into a test report together with the results.

The starter playground contains test case TC-12 as comments. Comments never run, so right now the console stays empty.

Make the playground print the test case. The console output should be readable on its own, by someone who never sees the code.
