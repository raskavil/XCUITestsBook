---
chapter: 02-uikit-introduction
title: Fix the List Identifiers
abstract: The task list has identifiers, but three of them will make tests fail or mislead VoiceOver users. Find and fix all three.
minutes: 20
difficulty: core
order: 7
starter: 02-uikit-introduction/ListIdentifiers-starter.swift
solution: 02-uikit-introduction/ListIdentifiers-solution.swift
doneWhen:
  - "The table’s identifier is `taskList.table`."
  - "Every cell’s identifier ends in its task’s `id`: the three seeded cells are `taskList.cell.1`, `taskList.cell.2` and `taskList.cell.3`."
  - "The **+** button has the identifier `taskList.addButton`, and VoiceOver no longer reads that string aloud."
  - No identifier in the file is used by more than one element, and none is built from a row number.
hints:
  - Compare each identifier with the naming rules from the lesson, one element at a time — the table, the cells, the add button.
  - "One identifier is shared by two kinds of element. One depends on where a row is shown, not on what it shows. One was set on the wrong property."
  - "Rename the table’s identifier, build the cell suffix from `task.id` instead of `indexPath.row`, and change `accessibilityLabel` to `accessibilityIdentifier` on the add button."
quiz:
  question: "A tester asks you to put `taskList.addButton` into the button’s `accessibilityLabel` because their tool reads labels. What do you do?"
  options:
    - Do it; labels and identifiers are interchangeable
    - Use `accessibilityIdentifier`, because VoiceOver users hear the label
    - Set both properties to the same string
  answer: 1
  explanation: "The label is what VoiceOver says out loud. Tests should find the button by its identifier, which no user ever hears."
---

A developer added identifiers to the task list in a hurry, and the first UI test written against it behaves strangely: a query for the table sometimes finds a cell, a test that opens "the first task" opens a different task after a re-sort, and a VoiceOver user reported that the **+** button announces itself as "task list dot add button".

All three problems come from identifiers in this one file. Each one breaks a different rule from the lesson.

Fix the identifiers so they follow TaskBoard’s identifier contract. Do not change what the list shows or how it behaves.
