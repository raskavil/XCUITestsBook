---
chapter: 02-uikit-introduction
title: Escape the Filter Screen
abstract: A full-screen Filter modal has no way out. Give it a Done button that reports the chosen filter and closes the screen.
minutes: 20
difficulty: core
order: 5
starter: 02-uikit-introduction/Filter-starter.swift
solution: 02-uikit-introduction/Filter-solution.swift
doneWhen:
  - The Filter screen shows a **Done** button on the right of its navigation bar.
  - Tapping **Done** returns to the task list.
  - "Before closing, the console shows `Filter: show done tasks = true` or `= false`, matching the switch."
  - The Filter screen is still presented full screen, so swiping down still does nothing.
hints:
  - "To try it, present the screen from the task list exactly as the comment at the top of the starter shows — for example from the **+** button you added in the practice."
  - The screen sits inside a navigation controller, so it already has a navigation bar. Look at how the practice added Cancel to Add task.
  - "Use `UIBarButtonItem(systemItem: .done, primaryAction: …)` as the `rightBarButtonItem`. In the action, print `showDoneSwitch.isOn`, then call `dismiss(animated: true)`."
quiz:
  question: Which call closes a screen that was shown with `present`?
  options:
    - "`navigationController?.popViewController(animated: true)`"
    - "`dismiss(animated: true)`"
    - "`view.removeFromSuperview()`"
  answer: 1
  explanation: Presented screens are dismissed; pushed screens are popped. Removing the view would leave an empty modal on screen.
---

A developer added a Filter screen to TaskBoard: a single switch that decides whether finished tasks are shown. It is presented full screen from the task list.

During exploratory testing you open it and get stuck. There is no back button, no Cancel, no Done, and because it is full screen, swiping down does nothing. The only way out is to quit the app — and a UI test would be just as stuck.

Fix it so the Filter screen can be closed with a visible button, and so closing it reports the filter the user chose. Keep the full-screen presentation.
