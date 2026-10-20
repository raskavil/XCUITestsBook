---
chapter: 01-swift-introduction
title: Switch on a Test Status
abstract: Replace a long if / else if chain with a switch, a Nice-to-know topic, without changing what the playground prints.
minutes: 15
difficulty: core
order: 4
starter: 01-swift-introduction/Status-starter.swift
solution: 01-swift-introduction/Status-solution.swift
doneWhen:
  - "The playground contains no `if` and no `else`."
  - "It uses one `switch` on `status`."
  - "`\"skipped\"` and `\"disabled\"` share one case."
  - "For `\"passed\"`, `\"failed\"`, `\"skipped\"`, `\"disabled\"` and `\"flaky\"`, the output is the same as the starter’s."
hints:
  - "Look up `switch` in the Swift documentation. It compares one value against a list of possible values, top to bottom, like the chain you have."
  - "Each `else if status == …` becomes one `case …:` line. The final `else` has its own keyword in a `switch`."
  - "A single case can match several values if you separate them with commas. A `switch` on text must end with `default:`, because text can be anything."
quiz:
  question: Why does a `switch` on a `String` need a `default` case?
  options:
    - Swift requires every switch to have exactly one default
    - A string can hold any text, so the listed cases can never cover every possible value
    - Without it, the switch runs every case
  answer: 1
  explanation: Swift insists that a `switch` handles every possible value. There are endless possible strings, so `default` catches all the ones you did not list.
---

The nightly test report gives each test a status as text: `passed`, `failed`, `skipped` or `disabled`. A small playground turns that status into one summary line.

It works, but the chain of `if` / `else if` has grown hard to scan, and two of the statuses are buried in an `||`. Swift has a statement made for "compare one value against a list of possible values": `switch`. It is one of this lesson’s Nice-to-know topics.

Rewrite the chain as a `switch`. This is a refactor: for every status, including ones nobody expected, the output must stay exactly the same.
