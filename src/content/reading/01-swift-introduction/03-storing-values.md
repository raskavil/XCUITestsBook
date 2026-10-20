---
chapter: 01-swift-introduction
title: Storing Values
abstract: Give values a name with `let` or `var`, learn the four basic types, and build text from them with string interpolation.
minutes: 8
order: 3
---

## Why values need names

Every test uses data: a username, a password, the text you expect on screen, the number of items a list should show. If you type `"tester"` into ten places and the account changes, you edit ten places and probably miss one.

Swift lets you give a value a name once and use the name everywhere:

```swift
let username = "tester"
let password = "password123"

print(username)
```

`username` is now a **constant**. Wherever you write `username`, Swift uses `"tester"`.

## `let` and `var`

Swift has two ways to name a value:

| Keyword | Name | Can change later? | Use it for |
| --- | --- | --- | --- |
| `let` | constant | No | Values that stay the same: test accounts, expected texts |
| `var` | variable | Yes | Values that change: a counter, the current screen |

```swift
let maxAttempts = 3
var failedAttempts = 0

failedAttempts = failedAttempts + 1   // fine, it is a var
```

Trying to change a `let` is an error — the one you fixed in the last lesson. Start with `let` every time. Switch to `var` only when the compiler tells you the value really needs to change. Code where most values cannot change is easier to read, because you never have to wonder whether something was modified further down.

## Every value has a type

Swift always knows what kind of value a name holds. That kind is its **type**. Four types cover most of what you need in this chapter:

| Type | Holds | Examples |
| --- | --- | --- |
| `String` | Text | `"tester"`, `"Log in"`, `""` |
| `Int` | Whole numbers | `0`, `3`, `-1` |
| `Double` | Numbers with a decimal point | `4.5`, `0.25` |
| `Bool` | Yes or no | `true`, `false` |

Usually Swift works out the type from the value: `"tester"` is a `String`, `3` is an `Int`. That is called **type inference**. You can also write the type yourself, after a colon:

```swift
let username: String = "tester"
let timeout: Double = 5
```

Writing the type is useful when the guess would be wrong — `5` alone would be an `Int`.

> [!TIP]
> Option-click any name in Xcode or Swift Playgrounds to see its type. When an error mentions types you did not expect, this is the fastest way to find out what Swift thinks you wrote.

## Building text with interpolation

Tests often need text that mixes fixed words with data, such as the greeting you expect after logging in. Write `\(` and `)` inside a string, and put a name between the parentheses:

```swift
let username = "tester"
let expectedGreeting = "Logged in as \(username)"

print(expectedGreeting)   // Logged in as tester
```

This is **string interpolation**. Swift replaces `\(username)` with the value, and it works with any type: `"Attempts: \(failedAttempts)"` prints the number.

## The QA view: test data lives in constants

A good test case separates *data* from *steps*. Constants are how code does that. Put the account, the expected texts and the limits at the top, as `let`s, and the rest of the code reads them. When the copywriter changes "Logged in as" to "Signed in as", you change one line.

You will see this shape at the top of almost every UI test file in this book.

> [!WARNING]
> `"5" + 5` does not compile. Swift never mixes text and numbers silently: `"5"` is a `String` and `5` is an `Int`, and `+` cannot join them. Use interpolation — `"\(5)"` — when you want a number inside text.
