---
chapter: 02-uikit-introduction
title: "Project: Mark a Task Done"
abstract: Add a Done switch to Task detail that updates the task in the store, so the list shows a checkmark when you go back.
minutes: 25
difficulty: core
order: 10
starter: 02-uikit-introduction/TaskDetailViewController-02.swift
solution: 02-uikit-introduction/TaskDetailViewController-03.swift
doneWhen:
  - "Task detail shows a **Done** label with a switch next to it, below the notes."
  - "The switch starts on for task 3 and off for tasks 1 and 2."
  - "Turning the switch on for task 1 and tapping **Back** shows a checkmark on task 1 in the list; turning it off removes the checkmark."
  - "The switch has the identifier `taskDetail.doneSwitch`, and the existing identifiers are unchanged."
hints:
  - "Lay out the label and the switch as a horizontal stack, and add that stack to the screen’s main stack, below the notes label."
  - "Start the switch from `task.isDone`. React to `.valueChanged` with `addAction`, as you did for the button on the Login screen."
  - "In the action, call `TaskStore.shared.setDone(doneSwitch.isOn, forTaskWithID: task.id)`. The list already reloads in `viewWillAppear`, which runs when you go back."
quiz:
  question: Which query will a test use to turn the Done switch on?
  options:
    - "`app.buttons[\"taskDetail.doneSwitch\"]`"
    - "`app.switches[\"taskDetail.doneSwitch\"]`"
    - "`app.staticTexts[\"Done\"]`"
  answer: 1
  explanation: A `UISwitch` is a switch element to the test framework, found by `switches` and its identifier — not by the label next to it.
---

Testers want to check that finishing a task is reflected in the list. The task model already has an `isDone` flag, and the list already shows a checkmark for done tasks — but there is no way for a user to change it.

Add a Done switch to the Task detail screen. Changing it must update the task in the store, so that the list shows the new state as soon as you go back.

Give the switch the identifier from the contract. Do not change the rest of the screen.
