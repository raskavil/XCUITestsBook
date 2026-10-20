---
chapter: 01-swift-introduction
title: Your First Lines of Code
abstract: Code is a list of instructions that runs from top to bottom — and the compiler checks every line before anything runs.
minutes: 7
order: 1
---

## Code is a list of instructions

A manual test case is a numbered list: open the app, type the username, tap **Log in**, check the title. A program works the same way. It is a list of instructions, and the computer runs them one at a time, from the first line to the last.

Here is a complete Swift program:

```swift
print("Hello, UI tests")
print("Starting the login check")
```

`print` writes a line of text to the console. Run it and you see both lines, in that order. Swap the two lines and the output swaps too. Nothing runs "sometimes" or "in parallel" here — order is the whole story.

## Where you will write code for now

For this chapter you only need a **playground**: a scratchpad that runs Swift as you type. You can use the Swift Playgrounds app on a Mac, or Xcode with **File › New › Playground…** and the *Blank* template.

A playground has three areas you will use all the time:

| Area | What it shows |
| --- | --- |
| Editor | The code you write |
| Results sidebar | The value of each line, next to that line |
| Console | Everything `print` writes, in order |

Press the run button and watch the sidebar fill in line by line. When you change the code, run it again.

> [!NOTE]
> In chapter 2 you move from a playground to a real app project. The Swift you learn here is the same; only the place where it runs changes.

## Comments are notes for people

A line that starts with `//` is a **comment**. Swift ignores it completely. Comments explain *why* the code does something, or mark the steps of a longer script:

```swift
// Step 1: announce the test
print("Login test")

// Step 2: list the account we use
print("User: tester")
```

You will see comments everywhere in the code you read later. They are often the fastest way to understand what a file is for.

## The compiler checks first

Before a single `print` runs, a program called the **compiler** reads your whole file. It checks that every word is spelled the way Swift expects, that every quote and bracket is closed, and that values are used correctly. If anything is wrong, it stops and reports an **error**. Nothing runs — not even the lines above the mistake.

```swift
print("Hello, UI tests")
pritn("This line has a typo")
```

This file prints nothing. The compiler reports `Cannot find 'pritn' in scope` and refuses to run the program at all.

That feels strict at first, but it is a gift. The compiler catches whole families of mistakes before you ever press run, and it tells you exactly which line to look at.

## The QA view: a step that fails before the run

Think of a compiler error as a test step that fails before the test run even starts — like a test case that references a screen that does not exist. You do not get a partial result; you get a clear message that the plan itself is broken.

When you write UI tests later in this book, the same rule holds. A typo in a test file means the whole test target does not build, and no test runs until you fix it.

> [!WARNING]
> Copying code from a document, chat or email often turns straight quotes (`"`) into curly quotes (`“ ”`). Swift only accepts straight quotes, and the error message does not always say "quote". If a line that looks correct will not compile, retype its quotes by hand.

## What you can do now

- Create a playground and run it.
- Write `print` lines and predict the console output before you run.
- Add `//` comments that explain the steps.
- Recognise that an error means *nothing* ran, not just the broken line.

In the next lesson you learn to read error messages properly, because you are going to see a lot of them.
