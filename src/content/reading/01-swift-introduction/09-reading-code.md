---
chapter: 01-swift-introduction
title: Reading Code You Didn’t Write
abstract: You can understand a file without understanding every line. Find the names, the functions and the strings first, and skip the rest.
minutes: 8
order: 9
---

## Reading is most of the job

As a UI tester you will read far more app code than you write. You open a screen’s file to find out what a button is called, which texts can appear, or what happens when a login fails. The file was written by someone else, uses features you have not learned, and is longer than anything in this chapter.

That is fine. Reading code is not the same as understanding every line. It is a skill with its own technique, and you can use it from today.

## A reading order that works

Do not read top to bottom like a book. Skim in passes, from the outside in:

| Pass | Look for | It tells you |
| --- | --- | --- |
| 1 | The file name and `///` or `//` comments | What the file is for |
| 2 | Type names after `struct`, `class`, `enum` | The *things* the file describes |
| 3 | Lines starting with `func` | What those things can *do* |
| 4 | Text in quotes | What the user sees, and what tests can search for |
| 5 | The bodies between `{ }` | *How* it works — only if you still need to know |

Most questions are answered by pass 4. You often never need pass 5.

## A function’s first line is its summary

The first line of a function — its **signature** — tells you almost everything a caller needs:

```swift
func login(username: String, password: String) -> LoginError? {
```

Without reading the body, you know: it is called `login`, it needs two pieces of text, and it returns an optional `LoginError`. From lesson 1.7, an optional result means "maybe nothing" — so a good guess is "returns `nil` when the login works, and an error when it does not". A `///` comment just above usually confirms it.

## Skip what you do not know — on purpose

Real files are full of keywords this chapter has not covered. You can almost always skip them and still follow the file. Here are the ones you will see most, with just enough meaning to keep reading:

| Keyword | Read it as |
| --- | --- |
| `import` | "This file uses code from a library" |
| `final class` | A type, like a struct (lesson 1.8’s Nice to know) |
| `private`, `private(set)` | "Only this type may use or change this" |
| `static` | "Belongs to the type itself, not to each value" |
| `guard … else` | "Stop early if this is not true" |
| `switch` | A chain of `if`s over one value |
| `throws`, `try` | "This can fail with an error" |
| `@objc`, `@MainActor` | Instructions for the compiler — ignore for now |

> [!TIP]
> Keep a scratch list of keywords you skipped. When the same one shows up in three files, look it up. That way you learn the parts of Swift your app actually uses, in the order you need them.

## The QA view: searching for identifiers

From chapter 2 on, the most common reason to open an app file is to find an **accessibility identifier**: a hidden name a developer gives a control so tests can find it. In code, they look like this:

```swift
usernameField.accessibilityIdentifier = "login.usernameField"
```

They are easy to spot in pass 4 — strings that look like `screen.element` rather than like sentences. Xcode’s **Find in Project** (⇧⌘F) with the text `accessibilityIdentifier` lists every one in the app, which is often the first thing you do when you start testing a new screen.

> [!WARNING]
> The beginner’s trap is to stop at the first unknown keyword and start researching it. Twenty minutes later you know a lot about `@MainActor` and nothing about the login screen. Skip it, note it, keep reading — and only come back if your question is still unanswered at pass 5.

## Chapter 1 in one paragraph

You can now read and write the Swift that test code is made of: constants and variables with types, comparisons and `if`, arrays and loops, functions with inputs and results, optionals, and your own structs and enums. The chapter project puts all of it together in one playground. After that, chapter 2 moves you from playgrounds into a real app.
