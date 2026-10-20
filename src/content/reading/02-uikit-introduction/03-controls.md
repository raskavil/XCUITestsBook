---
chapter: 02-uikit-introduction
title: The Controls You Will Test
abstract: Six controls cover most screens. Learn what each one does for the user and which query a UI test will use to find it.
minutes: 8
order: 3
---

## Six controls, most of every app

UIKit has dozens of view types, but a handful of them make up almost every screen you will test. Each is a view (lesson 2.2) with a special job: showing text, accepting a tap, taking typed input, and so on.

Learn these six well and you can describe nearly any screen — in the words a UI test uses.

## The table to remember

| Control | What the user does | Test query (chapter 5) |
| --- | --- | --- |
| `UILabel` | reads text | `app.staticTexts[…]` |
| `UIButton` | taps | `app.buttons[…]` |
| `UITextField` | types | `app.textFields[…]`, `app.secureTextFields[…]` for passwords |
| `UISwitch` | toggles | `app.switches[…]` |
| `UIImageView` | looks | `app.images[…]` |
| `UITableView` | scrolls, taps rows | `app.tables[…]`, `app.cells[…]` |

The right-hand column is a preview. You do not need to understand the queries yet — notice only that each kind of control has its own query, and the names are close to what the user sees: a label is "static text", a switch is a "switch".

## Creating controls in code

Every control is created the same way: make it, set a few properties, and put it on screen. A few examples from the Login screen:

```swift
let titleLabel = UILabel()
titleLabel.text = "Welcome to TaskBoard"

let passwordField = UITextField()
passwordField.placeholder = "Password"
passwordField.isSecureTextEntry = true

let loginButton = UIButton(type: .system)
loginButton.setTitle("Log in", for: .normal)
```

The properties you set most often:

| Control | Key properties |
| --- | --- |
| `UILabel` | `text`, `font`, `textColor`, `numberOfLines` |
| `UIButton` | `setTitle(_:for:)`, `isEnabled` |
| `UITextField` | `text`, `placeholder`, `isSecureTextEntry`, `keyboardType` |
| `UISwitch` | `isOn` |
| `UIImageView` | `image` |

## Tables are lists of cells

`UITableView` is different from the others. It shows a scrolling list, and each row is a **cell** — a view that contains its own labels and images. TaskBoard’s task list is a table with one cell per task.

You will not build a table in this chapter; the starter project already has one. What matters for testing is that cells are created on demand as you scroll, and reused for other rows. A cell for task 3 might be the same object that showed task 1 a moment ago. Lesson 2.7 shows why that matters when you name cells.

> [!NOTE]
> You may see `UICollectionView` in newer apps. To a test it looks much like a table: a container of cells (`app.collectionViews[…]`, `app.cells[…]`).

## The QA view: name controls the way the test framework does

When you describe a screen in a test case, you probably write "the Log in button", "the password box", "the remember-me toggle". From now on, practise naming them by their type: a *button*, a *secure text field*, a *switch*. When you write queries in chapter 5, you will already know which one to reach for.

A quick way to check: long-press a control in the simulator or look it up in the app code. If you can say its UIKit type, you can say its query.

> [!WARNING]
> A password field is a `UITextField` with `isSecureTextEntry = true` — but to a test it is a **secure text field**, a different kind of element. A query for `app.textFields["Password"]` finds nothing, because the field is listed under `app.secureTextFields`. It is the most common "but it is right there!" failure in a first UI test.
