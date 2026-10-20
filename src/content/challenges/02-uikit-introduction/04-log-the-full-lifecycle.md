---
chapter: 02-uikit-introduction
title: Log the Full Lifecycle
abstract: Make the Task detail screen report all five lifecycle moments — three of them Nice to know — and read the order a test lives through.
minutes: 20
difficulty: core
order: 4
starter: 02-uikit-introduction/DetailLifecycle-starter.swift
solution: 02-uikit-introduction/DetailLifecycle-solution.swift
doneWhen:
  - "Opening task 1 and tapping **Back** prints exactly five lines, in this order: `viewDidLoad`, `viewWillAppear`, `viewDidAppear`, `viewWillDisappear`, `viewDidDisappear` — each prefixed with `Detail 1:`."
  - "Every override calls its `super` version on its first line."
  - Opening task 2 afterwards prints five new lines prefixed with `Detail 2:`.
  - "`viewDidLoad` is unchanged."
hints:
  - "To reach the screen, temporarily set the window’s root to `UINavigationController(rootViewController: TaskListViewController())` in **SceneDelegate.swift**, and tap a task."
  - "The three missing functions follow the same pattern as `viewDidAppear(_:)`: an `animated` parameter, an `override`, and a `super` call with the same name. Xcode’s completion writes the first line for you."
  - "Add four overrides in total — `viewWillAppear`, `viewDidAppear`, `viewWillDisappear` and `viewDidDisappear` — each printing `Detail \\(task.id):` followed by its own name."
quiz:
  question: You go back from task 1 to the list, then open task 1 again. Does the new detail screen print `viewDidLoad`?
  options:
    - No, `viewDidLoad` only runs once per app launch
    - Yes, because tapping the task creates a new screen object, and `viewDidLoad` runs once per object
    - Only if the task changed
  answer: 1
  explanation: "`viewDidLoad` runs once per view controller object. The list creates a fresh `TaskDetailViewController` on every tap, so each one loads its views again."
---

Your team keeps seeing UI test failures on the Task detail screen that only happen when tests move quickly between screens. Before anyone writes a test, you want to see the screen’s exact timeline when it appears and when it goes away.

The starter prints only `viewDidLoad`. UIKit calls four more lifecycle functions around appearing and disappearing — three of which this lesson only mentioned as Nice to know.

Make the screen report every moment, in order, so you can watch the timeline in the console while you open and close tasks.
