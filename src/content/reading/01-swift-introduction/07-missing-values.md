---
chapter: 01-swift-introduction
title: Values That Might Be Missing
abstract: An optional such as `String?` holds either a value or `nil`. Unwrap it safely with `if let`, or give it a default with `??`.
minutes: 8
order: 7
---

## Sometimes there is nothing there

Not every value always exists. A user may or may not have set a nickname. A list may be empty, so it has no first item. Text typed into a field may or may not be a number. Many languages pretend the value is there and crash when it is not. Swift makes "might be missing" part of the type, so the compiler can make you deal with it.

## Optionals

Add `?` to a type and it becomes an **optional**: it holds either a value of that type or `nil`, which means "no value".

```swift
var nickname: String? = "Tess"
nickname = nil   // allowed: a String? can be empty
```

`String?` is not a `String`. You cannot use it where text is expected, because it might be `nil`:

```swift
let greeting = "Hello, " + nickname   // error: value of optional type 'String?' must be unwrapped
```

Getting the value out is called **unwrapping**. You will meet optionals often, because many everyday operations return one:

| Code | Type | Why it can be missing |
| --- | --- | --- |
| `screens.first` | `String?` | The array might be empty |
| `Int("42")` | `Int?` | The text might not be a number |
| `nickname` | `String?` | The user never set one |

## Unwrap safely with `if let`

`if let` checks for a value and, if there is one, gives it to you as a normal, non-optional constant inside the block:

```swift
if let name = nickname {
    print("Hello, \(name)")      // name is a String here
} else {
    print("Hello, tester")       // nickname was nil
}
```

Read it as "if there is a value, call it `name` and run this block". Outside the block, `name` does not exist.

## Give a default with `??`

Often you just want a fallback value. The `??` operator — read it as "or else" — unwraps the optional if it has a value, and uses the value on its right otherwise:

```swift
let displayName = nickname ?? "tester"
print("Logged in as \(displayName)")
```

`displayName` is a plain `String`, never `nil`. Use `??` when a sensible default exists, and `if let` when the two cases need different steps.

> [!TIP]
> `print(nickname)` on an optional shows `Optional("Tess")` in the console, and Swift warns about it. That is a hint that you forgot to unwrap. Use `??` or `if let` before printing.

## The QA view: an element that may not be there

A UI test constantly asks about things that may not exist. Is the error label on screen? Did the alert appear? Is there a third row? The honest answer is "maybe", and a good test handles both cases: what to check if it is there, and what failure to report if it is not.

Optionals train exactly that habit. Every time you unwrap one, you decide what *nothing* means — a default, a different branch, or a clear failure message.

> [!WARNING]
> You will see `!` after an optional in other people’s code: `nickname!`. It means "I promise there is a value, unwrap it." If the promise is wrong, the program crashes with *Unexpectedly found nil while unwrapping an Optional value*. `!` does not fix the problem the compiler pointed out; it moves it to a crash at run time. Do not use it in this book’s exercises.
