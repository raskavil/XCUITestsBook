---
chapter: 01-swift-introduction
title: Functions
abstract: A function packages steps under a name, with inputs and an optional result, so you write them once and use them everywhere.
minutes: 8
order: 6
---

## Write it once, use it everywhere

Imagine twenty test cases that all start with "log in as tester". In a written test plan, you would not copy those four steps twenty times. You would define a shared step once — *Log in as tester* — and refer to it.

Code does the same with **functions**. A function is a block of steps with a name. You define it once, then **call** it by name as often as you like:

```swift
func printHeader() {
    print("TaskBoard UI checks")
    print("Account: tester")
}

printHeader()
printHeader()
```

`func` starts the definition, `printHeader` is the name, and the steps go between `{` and `}`. Defining a function runs nothing. The steps only run when you call it — here, twice.

## Inputs: parameters

Most shared steps need some data. "Log in as *someone*" needs to know who. Inputs are called **parameters** and go between the parentheses, each with a name and a type:

```swift
func greet(name: String) {
    print("Hello, \(name)")
}

greet(name: "tester")
greet(name: "qa.lead")
```

When you call the function, you pass a value for each parameter. Inside the function, `name` holds whatever you passed.

## Argument labels

The word you write at the call site is the **argument label**. By default it is the parameter name, but Swift lets you choose a different one so calls read like English:

| Definition | Call | Reads as |
| --- | --- | --- |
| `func greet(name: String)` | `greet(name: "tester")` | greet, name tester |
| `func greeting(for name: String)` | `greeting(for: "tester")` | greeting for tester |
| `func isValidEmail(_ email: String)` | `isValidEmail("a@b.co")` | is valid email, a@b.co |

In the second row, `for` is the label used by callers and `name` is the name used inside. In the third row, `_` means "no label", because the function name already says what the value is.

## Outputs: return values

A function can also hand a result back. Write `->` and the result’s type after the parentheses, and use `return` to give the value:

```swift
func isValidEmail(_ email: String) -> Bool {
    return email.contains("@") && email.contains(".")
}

let ok = isValidEmail("tester@example.com")   // true
```

`return` ends the function immediately. Any lines after it in the same block do not run. A function that returns a `Bool` is a ready-made check: you can put the call straight into an `if`.

## The QA view: reusable test steps

Functions are how test code stays short. Instead of repeating four lines to fill in the login form, a test calls `logIn(as: "tester")`. When the login screen changes, you fix one function and every test that uses it is fixed too.

You will see this idea grow through the book: first as small helper functions, then as whole types that describe a screen.

> [!TIP]
> Name a function after *what* it does for the reader, not *how*: `logIn(as:)`, not `tapFieldsAndButton()`. A test made of well-named calls reads like the test case it automates.

> [!WARNING]
> Calling a function that returns a value and then doing nothing with the result is almost always a bug. `isValidEmail(email)` on its own line computes `true` or `false` and throws it away — the check never affects anything. Swift warns *Result of call to 'isValidEmail' is unused*; treat that warning as an error.
