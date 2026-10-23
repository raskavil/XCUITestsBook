---
chapter: 02-uikit-introduction
title: Connecting the Screen to Code
abstract: Create the views in code, line them up in a UIStackView, pin that one stack to the safe area, and run code when the user taps.
minutes: 9
order: 6
---

## A whole screen in about 30 lines

So far you have placed views with fixed frames: `x: 20, y: 140`. That breaks the moment the screen is smaller, the text is larger, or the phone rotates. Real screens are laid out by rules instead of numbers.

TaskBoard keeps those rules to a minimum. Every screen follows the same recipe:

1. Create the controls as properties of the view controller.
2. Configure them in `viewDidLoad`.
3. Put them in a vertical `UIStackView`.
4. Pin that one stack to the edges of the screen.
5. Connect the buttons to functions.

The finished Login screen is about 30 lines, and you build it in this lesson’s practice.

## Controls as properties

Controls you need to read or change later — a field’s text, a label’s message — are declared once, at the top of the class:

```swift
final class LoginViewController: UIViewController {
    private let usernameField = UITextField()
    private let passwordField = UITextField()
    private let loginButton = UIButton(type: .system)
    private let errorLabel = UILabel()
```

`private` means only this screen uses them (chapter 1, lesson 1.9). Creating a control does not put it on screen; it only exists in memory until it is added to the view tree.

## Let a stack view do the layout

A `UIStackView` arranges its **arranged subviews** in a row or a column, with even spacing, and resizes them when the screen changes:

```swift
let stack = UIStackView(arrangedSubviews: [usernameField, passwordField, loginButton, errorLabel])
stack.axis = .vertical
stack.spacing = 12
```

The order of the array is the order on screen, top to bottom. Adding a control to the form means adding it to the array — and a control that is not in the array (or added some other way) is not on screen.

## Pin one stack to the safe area

The stack still needs a place on screen. **Auto Layout** describes positions as rules called *constraints*: "the stack’s top is 40 points below the top of the safe area". The **safe area** is the part of the screen not covered by the notch, the status bar or the navigation bar.

```swift
stack.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(stack)
NSLayoutConstraint.activate([
    stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
    stack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
    stack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
])
```

Read it as: switch off the old frame-based layout for the stack, add it to the screen, then pin its top, left and right edges. Copy this block as a pattern — every TaskBoard screen uses it. Everything else about Auto Layout is a Nice-to-know topic.

## Reacting to a tap

A button does nothing until you connect it to code. `addAction(_:for:)` attaches a closure — a small function without a name (lesson 1.6’s Nice to know) — that runs when a given event happens:

```swift
loginButton.addAction(UIAction { [weak self] _ in self?.logIn() }, for: .touchUpInside)
```

`.touchUpInside` is a normal tap: finger down and up inside the button. The closure calls the screen’s own `logIn()` function. `[weak self]` and `self?` stop the screen and its button from keeping each other in memory forever; copy them as they are.

In older code you will see the same thing written as `addTarget(self, action: #selector(logInTapped), for: .touchUpInside)` with an `@objc func logInTapped()`. It means the same: when tapped, run that function.

> [!TIP]
> Read a field’s text with `usernameField.text ?? ""`. `text` is an optional `String?` — the `??` from lesson 1.7 turns a missing value into empty text.

## The QA view: every action is a test step

Search a screen’s file for `addAction` and `addTarget`. Each match is something the user can do on that screen, and therefore a step a UI test must be able to trigger: tap Log in, toggle the switch, tap Cancel. A screen with three actions needs at least three test steps — usually more, because each action has a happy and an unhappy outcome.

> [!WARNING]
> A control that is created but never added — not in the stack’s array, never passed to `addSubview` — compiles without a warning and simply does not exist on screen. No user can see it and no test can find it. When a control "disappears", check that it made it into the view tree.
