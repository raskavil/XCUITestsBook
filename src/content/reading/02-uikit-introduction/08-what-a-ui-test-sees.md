---
chapter: 02-uikit-introduction
title: What a UI Test Will See
abstract: Tests do not see the view tree. They see the accessibility tree — a simpler version of it — and the Accessibility Inspector shows you exactly that.
minutes: 8
order: 8
---

## Two trees, not one

In lesson 2.2 you explored the **view tree** in Debug View Hierarchy: every view, every stack, every background. A UI test never sees that tree. It runs in a separate process and talks to the app through the same system that powers VoiceOver. What it sees is the **accessibility tree**: the parts of the screen a person using assistive technology can perceive and use.

That tree is smaller. Layout helpers disappear, decorations disappear, and what remains is a flat-ish list of things a user can read or operate.

## What stays and what disappears

| In the view tree | In the accessibility tree |
| --- | --- |
| Labels, buttons, text fields, switches, cells | Stay, as elements |
| `UIStackView` and plain `UIView` containers | Usually disappear; their children move up |
| Background and decorative views | Disappear |
| `UIImageView` | Disappears unless it is marked as accessible |
| Views that are hidden or have zero size | Disappear |

Each element in the accessibility tree carries a few properties. These are the ones a test uses most:

| Property | Example | Comes from |
| --- | --- | --- |
| Label | "Log in" | The visible text, or `accessibilityLabel` |
| Identifier | `login.loginButton` | `accessibilityIdentifier` (lesson 2.7) |
| Traits | Button, Static Text | The control’s type |
| Value | "1" for a switch that is on | The control’s state |

The *traits* are why `app.buttons` finds buttons and `app.staticTexts` finds labels: a query filters elements by their type.

## The Accessibility Inspector

Xcode ships a tool that shows the accessibility tree of a running app: **Xcode › Open Developer Tool › Accessibility Inspector**. Pick the simulator in its target menu, click the crosshair button, then hover over the app. The inspector highlights one element at a time and shows its label, identifier, traits and value.

> [!TIP]
> Put Debug View Hierarchy and the Accessibility Inspector side by side on the same screen. Every view that is in the first and not in the second is a view no test can find directly.

## Why containers vanish

A stack view is a layout tool, not something a user interacts with, so it is not an element. That is usually what you want: the test asks for `login.loginButton` directly, without caring which stack it sits in.

The exception catches people out. A view becomes an element only if it is accessible itself or has accessible children. A custom view with no text — a coloured status dot, a decorative logo, an empty banner — is neither. You can give it an identifier, and the identifier is still invisible to tests, because the view never makes it into the tree.

The fix is to make such views real elements, with a label that means something to a VoiceOver user:

```swift
logoView.isAccessibilityElement = true
logoView.accessibilityLabel = "TaskBoard logo"
```

## The QA view: your new view of the app

From chapter 4 on, the Accessibility Inspector is the tester’s view of the app. Before writing a test for a screen, open it in the inspector and check three things for each control the test will touch: Is it an element at all? Does it have the identifier you expect? Do its traits match the query you plan to use?

Five minutes in the inspector saves an hour of "element not found" later — and anything you fix along the way makes the app better for VoiceOver users, too.

> [!WARNING]
> A container view with an identifier but no accessible children shows up as nothing. The identifier is set, a search of the code finds it, and the test still cannot. Check in the Accessibility Inspector, not just in the code.
