---
chapter: 08-page-object
title: Wrap the Settings Screen
abstract: Turn a test full of raw queries into one that uses a SettingsScreen page object.
minutes: 20
difficulty: core
starter: 08-page-object/SettingsTests-starter.swift
solution: 08-page-object/SettingsTests-solution.swift
doneWhen:
  - "`SettingsTests` contains no `app.switches[…]`, `app.otherElements[…]` or `app.staticTexts[…]` calls."
  - "`SettingsScreen` has a static `open(in:)` that taps the Settings tab and returns the screen."
  - The test checks that notifications start on, turns them off, and asserts the confirmation appears.
  - The test still passes.
hints:
  - "Start by copying the shape of `LoginScreen` — an `app` property and one computed property per control."
  - "Getting *to* the screen is an action too. A `static func open(in app: XCUIApplication) -> SettingsScreen` keeps the tab tap out of the test."
  - "A switch’s `value` is `\"1\"` when on and `\"0\"` when off. Expose that as a `Bool` property instead of comparing strings in the test."
quiz:
  question: Your page object exposes `notificationsAreOn`. Where should `XCTAssertFalse(settings.notificationsAreOn)` go?
  options:
    - Inside `turnOffNotifications()`, right after the tap
    - In the test method
    - In a `tearDown` override
  answer: 1
  explanation: Page objects expose state; tests decide what to assert. That keeps failures pointing at the test that broke.
---

The sample app’s Settings tab has a **Notifications** switch. Turning it off shows a short confirmation message.

The existing test works, but it talks to the app directly. Refactor it so that all queries for the Settings screen live in a new `SettingsScreen` page object, and the test reads as a short description of the flow.

Keep the behaviour exactly the same — this is a refactor, not a new test.
