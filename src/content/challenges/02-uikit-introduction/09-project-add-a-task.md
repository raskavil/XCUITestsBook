---
chapter: 02-uikit-introduction
title: "Project: Add a Task"
abstract: Build TaskBoard’s Add task screen — a modal with two fields, Save and Cancel — and make the new task appear in the list.
minutes: 45
difficulty: stretch
order: 9
starter: 02-uikit-introduction/AddTask-02.swift
solution: 02-uikit-introduction/AddTaskProject-solution.swift
doneWhen:
  - "Tapping **+** on the task list (`taskList.addButton`) presents the Add task screen as a sheet with a title field and a notes field."
  - "**Save** is disabled until the title field contains text; **Cancel** is always enabled."
  - "**Save** adds the task with id 4, closes the sheet, and the list immediately shows it as the fourth row with the identifier `taskList.cell.4`."
  - "**Cancel** closes the sheet and leaves the list unchanged."
  - "The four Add task identifiers from the contract — `addTask.titleField`, `addTask.notesField`, `addTask.saveButton`, `addTask.cancelButton` — appear in the Accessibility Inspector."
hints:
  - "Start from lesson 2.5’s screen with its Cancel button. Build the two fields with the lesson 2.6 recipe, and put **Save** on the right of the navigation bar."
  - "`TaskStore.shared.add(title:notes:)` stores a new task and picks the next id for you. Enable **Save** from an action for the title field’s `.editingChanged` event."
  - "A sheet does not make the list appear again, so `viewWillAppear` does not reload it. Give `AddTaskViewController` a property `var onSave: (() -> Void)?`, call `onSave?()` after saving, and set it in the list to reload the table. The solution shows both files, one after the other."
quiz:
  question: Why does the list not refresh by itself after the sheet closes?
  options:
    - The task store does not save new tasks
    - A sheet leaves the list on screen underneath, so the list never disappears and `viewWillAppear` is not called again
    - Tables can only be reloaded once
  answer: 1
  explanation: The list’s reload lives in `viewWillAppear`. A pushed screen hides the list and triggers it on the way back; a sheet does not, so the list must be told explicitly.
---

The QA team wants to test creating tasks, so TaskBoard needs its Add task screen. Right now the **+** button opens an empty sheet with only a Cancel button.

Turn it into a real form: a title, optional notes, and a **Save** button that only works once there is a title. Saving must add the task to the store and show it in the list straight away; cancelling must change nothing.

Add every Add task identifier from the contract, and give the **+** button its identifier too. Later chapters write tests against exactly these names.
