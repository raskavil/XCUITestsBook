---
chapter: 08-page-object
title: The Page Object Pattern
abstract: Wrap each screen in a small Swift type so your tests describe what the user does, not how the screen is built.
minutes: 8
---

## Why tests rot

A UI test that talks to the app directly repeats the same queries over and over:

```swift
app.textFields["login.email"].tap()
app.textFields["login.email"].typeText("demo@example.com")
app.secureTextFields["login.password"].tap()
app.secureTextFields["login.password"].typeText("correct-horse")
app.buttons["login.submit"].tap()
```

Now picture forty tests that log in. When the designer swaps the email text field for a custom view, you edit forty tests. Worse, none of them say *what* they test — you have to read every line to find out.

## The pattern

A **page object** is a type that represents one screen. It knows how to find that screen’s elements and how to perform its actions. Tests only talk to page objects:

```swift
let dashboard = LoginScreen(app: app)
    .logIn(email: "demo@example.com", password: "correct-horse")

XCTAssertTrue(dashboard.isVisible)
```

The queries live in exactly one place. The test reads like a sentence.

> [!NOTE]
> The name comes from web testing, where each screen is a “page”. On iOS you’ll also see *screen object* or *robot pattern* — the idea is the same.

## Four rules that keep page objects useful

1. **One type per screen.** `LoginScreen`, `DashboardScreen`, `SettingsScreen`. Large screens can be split into components, such as a `TabBar`.
2. **Queries are computed properties.** A computed property re-runs the query every time you use it, so it always sees the current view hierarchy.
3. **Actions return the next screen.** `logIn(…)` returns a `DashboardScreen`. That makes flows chainable and tells you, in the type system, where the user ends up.
4. **Assertions stay in the test.** A page object can expose state (`isVisible`, `notificationsAreOn`), but the test decides what to assert. Otherwise failures point at the page object, not the test that broke.

> [!WARNING]
> Don’t store `XCUIElement` values in stored properties (`let submit = app.buttons[…]`). It looks equivalent, but makes it easy to cache an element across a screen reload and get confusing failures.

## When you don’t need it

| Situation | Use page objects? |
| --- | --- |
| One or two smoke tests | Not yet — inline queries are fine |
| The same screen appears in three or more tests | Yes |
| A flow spans several screens | Yes — chained actions shine here |

> [!TIP]
> Start by extracting the screen you touch most often. You don’t need to convert the whole suite in one go.
