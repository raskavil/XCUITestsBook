---
chapter: 02-uikit-introduction
title: Build a Sign-up Form
abstract: Build a sign-up form from the six controls, with the right control type for every field and a button that waits for a switch.
minutes: 25
difficulty: core
order: 3
starter: 02-uikit-introduction/SignUp-starter.swift
solution: 02-uikit-introduction/SignUp-solution.swift
doneWhen:
  - "The screen shows, top to bottom: a *Create your account* heading, an email field, a password field, a confirm-password field, an *I accept the terms* row with a switch, and a *Create account* button."
  - "Both password fields hide what you type; the email field shows the email keyboard."
  - "The switch starts off, and the button is disabled while it is off."
  - Turning the switch on enables the button; turning it off disables it again.
hints:
  - "Copy the pattern from the practice: create each control, set two or three properties, then list it in the stack’s `arrangedSubviews`, in order."
  - "The terms row is a second, horizontal stack — a `UIStackView` holding the label and the switch — placed inside the main one. A stack’s default axis is horizontal."
  - "To react to the switch, keep the switch and the button as properties, and call `termsSwitch.addAction(UIAction { [weak self] _ in self?.updateCreateButton() }, for: .valueChanged)`. In that function, copy `isOn` into the button’s `isEnabled`."
quiz:
  question: A test types into the confirm-password field. Which query should it use?
  options:
    - "`app.textFields[…]`"
    - "`app.secureTextFields[…]`"
    - "`app.switches[…]`"
  answer: 1
  explanation: Any field with `isSecureTextEntry = true` is a secure text field to a UI test — including the confirmation field.
---

TaskBoard is getting a sign-up screen, and you are asked to build its first version so the team can start writing test cases against it. The starter gives you an empty screen with a vertical stack.

To see the screen while you work, temporarily change `LoginViewController()` to `SignUpViewController()` in **SceneDelegate.swift**, and change it back when you are done.

Build the form from the controls in this lesson. Choose each control’s type carefully: the type decides how a user interacts with it, and how a test will find it later.
