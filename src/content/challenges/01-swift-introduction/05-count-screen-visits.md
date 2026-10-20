---
chapter: 01-swift-introduction
title: Count Screen Visits
abstract: Summarise an exploratory session log with a Set and a Dictionary — two Nice-to-know collections that sit next to arrays.
minutes: 20
difficulty: core
order: 5
starter: 01-swift-introduction/Visits-starter.swift
solution: 01-swift-introduction/Visits-solution.swift
doneWhen:
  - "The console shows `Different screens: 4`."
  - "It shows one line per screen with its visit count — `Task list: 3`, `Task detail: 2`, `Login: 2`, `Settings: 1` — in any order."
  - "It shows `Add task visited: false`."
  - "`visits` is not changed, and no screen name other than `\"Add task\"` is typed again below it."
hints:
  - "Look up `Set` and `Dictionary` in the Swift documentation. A set keeps each value only once; a dictionary maps a key to a value, like a two-column table."
  - "`Set(visits)` builds a set from the array. Duplicates disappear, so its `count` answers the first question."
  - "For the counts, start from an empty `[String: Int]` dictionary and loop over `visits`. `counts[screen, default: 0] += 1` adds one to the screen’s count, starting from zero the first time."
quiz:
  question: Why can the per-screen lines print in a different order every run?
  options:
    - The loop over `visits` runs in a random order
    - A dictionary does not keep its keys in any particular order
    - "`print` is not guaranteed to run in order"
  answer: 1
  explanation: An array keeps order; a dictionary and a set do not. When order matters, sort the keys first, or keep using an array.
---

After an exploratory testing session, you have a log of every screen the tester visited, in order. Your lead wants three numbers for the session report: how many different screens were covered, how often each one was visited, and whether the new Add task screen was touched at all.

An array is good at keeping things in order, but it is clumsy at "how many different" and "how many of each". Swift has two other collections for that — `Set` and `Dictionary` — which are Nice-to-know topics for this lesson.

Answer the three questions in the playground, printing one result per line. Do not count by hand: if the log changes, the numbers must change with it.
