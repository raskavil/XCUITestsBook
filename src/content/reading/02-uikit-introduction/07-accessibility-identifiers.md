---
chapter: 02-uikit-introduction
title: Accessibility Identifiers
abstract: An `accessibilityIdentifier` is a hidden name tag for tests, set in code right where the view is created. It stays stable when texts change.
minutes: 8
order: 7
---

## Finding things by their text is fragile

How would a test find the **Log in** button? The obvious answer is "the button that says Log in". That works — until the copywriter changes it to *Sign in*, or the app is translated into German, or a designer replaces the text with an arrow icon. Each of those changes breaks every test that looked for the text, even though the app still works perfectly.

Tests need a name for each control that has nothing to do with what the user sees.

## A hidden name tag

Every view has a property for exactly that, `accessibilityIdentifier`. Users never see it and VoiceOver never reads it. It exists so tests can find views:

```swift
usernameField.accessibilityIdentifier = "login.usernameField"
passwordField.accessibilityIdentifier = "login.passwordField"
loginButton.accessibilityIdentifier = "login.loginButton"
errorLabel.accessibilityIdentifier = "login.errorLabel"
```

Set identifiers in code, right where the view is configured — in TaskBoard, in `viewDidLoad`. Then whoever changes the view sees the identifier on the line next to it, and is far less likely to break it by accident.

## One naming convention, everywhere

An identifier can be any string, which is exactly why a team needs a convention. This book uses `screen.element`:

| Part | Rule | Examples |
| --- | --- | --- |
| `screen` | The screen, in lowerCamelCase | `login`, `taskList`, `taskDetail` |
| `element` | What the control is for, plus its kind | `usernameField`, `loginButton`, `errorLabel` |
| Suffix | Only for repeated elements: a stable id | `taskList.cell.3` |

With a convention, you can guess an identifier before you look it up, and you can tell from a failing test which screen it was on.

## Identifier vs. label

Views have a second, similar-sounding property: `accessibilityLabel`. They do different jobs, and mixing them up hurts real users:

| Property | Who uses it | Example | May change when… |
| --- | --- | --- | --- |
| `accessibilityLabel` | VoiceOver users hear it | "Add task" | the copy or language changes |
| `accessibilityIdentifier` | Tests find the view by it | `taskList.addButton` | never, ideally |

Never put an identifier like `taskList.addButton` into `accessibilityLabel` to "make the test work". VoiceOver users would hear "task list dot add button".

> [!NOTE]
> Buttons and labels get an accessibility label automatically from their text. You set one yourself mainly for controls without text, such as an icon-only **+** button.

## Naming the cells of a list

A table shows many cells of the same kind, so they need a suffix to tell them apart. The suffix must point at the *data*, not at the position:

```swift
cell.accessibilityIdentifier = "taskList.cell.\(task.id)"
```

TaskBoard’s tasks have ids 1–3. Cell `taskList.cell.2` is always "Review crash report", whether it is the second row or, after a delete or a re-sort, the first.

## The QA view: stable tests

Text changes with language and copywriting; an identifier does not. A test that finds the login button by `login.loginButton` survives a rename, a translation and a redesign. That is the single biggest difference between a UI test suite people trust and one they disable after a month.

In practice, testers often add identifiers themselves, or ask developers for them in code review. The table in the chapter project is TaskBoard’s *identifier contract*: the list of names that tests in chapters 4 to 8 rely on.

> [!WARNING]
> Giving every cell the same identifier — `taskList.cell` — compiles, runs and even looks fine in a quick check. But a test that asks for "the cell called `taskList.cell`" now matches three cells, and cannot tell which task it is touching. Always give repeated elements a suffix such as `taskList.cell.1`.
