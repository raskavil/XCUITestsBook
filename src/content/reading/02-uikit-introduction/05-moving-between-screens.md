---
chapter: 02-uikit-introduction
title: Moving Between Screens
abstract: A navigation controller pushes screens forward and pops them back; a modal slides up over the current screen and needs its own way out.
minutes: 8
order: 5
---

## Two ways to show the next screen

Apps move between screens in two main ways, and users feel the difference even if they cannot name it:

| | Push | Modal |
| --- | --- | --- |
| Animation | Slides in from the right | Slides up from the bottom |
| Way back | **Back** button, top left (added for you) | Whatever the screen provides: **Cancel**, **Done**, a swipe down |
| Meaning | "Go deeper": list → detail | "Do a separate task, then come back": add, edit, filter |
| TaskBoard example | Login → Task list → Task detail | Task list → Add task |

## Push and pop with a navigation controller

A **navigation controller** (`UINavigationController`) manages a stack of screens, like a pile of cards. It also draws the navigation bar at the top, with the current screen’s `title` and a back button.

TaskBoard’s window already starts with one (lesson 2.1), holding the Login screen. Any screen inside it can push the next one on top:

```swift
navigationController?.pushViewController(TaskListViewController(), animated: true)
```

The `?` is there because `navigationController` is an optional (chapter 1, lesson 1.7): a screen that is not inside a navigation controller has none, and the push then does nothing at all.

Going back **pops** the top screen off the stack. The user does it with the back button or by swiping from the left edge. Code can do it with `navigationController?.popViewController(animated: true)`.

## Present and dismiss a modal

A modal is **presented** on top of the current screen and later **dismissed**:

```swift
let addTask = UINavigationController(rootViewController: AddTaskViewController())
present(addTask, animated: true)
```

Wrapping the modal screen in its own navigation controller gives it a navigation bar, where you can put **Cancel** and **Save** buttons. The modal screen closes itself with `dismiss(animated: true)`.

By default, a modal on iPhone appears as a **sheet**: a card that leaves a sliver of the previous screen visible at the top, and that the user can swipe down to close. With `modalPresentationStyle = .fullScreen`, it covers everything and the swipe no longer works.

> [!TIP]
> To find how a screen is shown, search the app for `pushViewController` and `present(`. Every match is a path between two screens.

## The QA view: every path is a test flow

Draw TaskBoard’s screens as boxes and the pushes and presents as arrows:

```text
Login ──push──▶ Task list ──push──▶ Task detail
                    │
                    └──present──▶ Add task (modal)
```

That diagram is the app’s first test plan. Every arrow is a flow to test forward *and* back: Can you reach Task detail? Does Back return to the right list? Does Cancel on Add task leave the list unchanged? When a test fails halfway through a flow, the diagram tells you which arrow broke.

> [!WARNING]
> A modal screen has no back button. If the developer forgets to add **Cancel** or **Done**, a full-screen modal is a dead end: the user cannot leave without force-quitting, and neither can a UI test. Sheets can still be swiped away, but a test that relies on a swipe is fragile. Every modal needs a visible button that closes it.
