---
chapter: 02-uikit-introduction
title: Xcode Tour
abstract: A project, a simulator, the Run button and the console are all you need for now. Meet them in the book’s TaskBoard starter project.
minutes: 7
order: 1
---

## From playground to app

In chapter 1, your code lived in a playground: one file, run top to bottom. A real app is different. It is a **project** with many files, it starts when the system launches it, and it keeps running until you quit it. It runs on a device or on a **simulator** — an iPhone on your Mac’s screen.

This chapter uses **TaskBoard**, a tiny task-list app that every later chapter tests. You start from the book’s starter project, so you never have to set up an app from scratch.

## What is in the starter project

| File | What it does |
| --- | --- |
| `SceneDelegate.swift` | Creates the app’s window and shows the first screen |
| `LoginViewController.swift` | The Login screen — almost empty, you build it in this chapter |
| `TaskListViewController.swift` | The list of tasks, already working |
| `TaskDetailViewController.swift` | One task’s title and notes, already working |
| `TaskStore.swift` | Three sample tasks, kept in memory |

Every screen is built in Swift code. There is no storyboard — the visual layout file older tutorials use — so everything you test is something you can read in a `.swift` file.

## Four places you need right now

Xcode has dozens of panels. Ignore most of them. For this chapter you need four:

| Place | Where | What you use it for |
| --- | --- | --- |
| Project navigator | Left sidebar, folder icon | Open a file |
| Run destination | Top bar, next to the app name | Pick which simulator to run on |
| Run button | Top bar, ▶ (or ⌘R) | Build the app and launch it |
| Console | Bottom area (⇧⌘Y shows it) | Read everything `print` writes |

Press ▶ and Xcode does two things: it **builds** the app — the compiler checks every file, as in chapter 1 — and then it launches it on the chosen simulator. A build error stops everything before launch.

## Where the app starts

When TaskBoard launches, iOS calls a function in `SceneDelegate.swift`. These lines decide what you see first:

```swift
let window = UIWindow(windowScene: windowScene)
window.rootViewController = UINavigationController(rootViewController: LoginViewController())
window.makeKeyAndVisible()
```

Read it with chapter 1’s technique, skipping what you do not know: create a window, put the Login screen in it (inside a navigation controller, lesson 2.5), and show it. That is the whole startup.

> [!TIP]
> Add a `print` at the end of that function and run. Seeing your line in the console proves the code you edited is the code that runs — a check worth doing whenever something "does not change".

## The QA view: the same simulator, now under your control

You probably use the iOS Simulator already for manual testing. Nothing about it changes. What changes is that you now decide what runs on it: you can add a `print` to see what the app is doing, change a value and run again, or start the app on the exact screen you want to test.

UI tests run on the same simulators. When you write them in chapter 4, Xcode builds the app, launches it on the chosen destination, and drives it from a separate test process.

> [!WARNING]
> Check the run destination before every run. It is easy to run on an iPad or an older iOS version than you meant to, and then chase a "bug" that is really a different screen size or system version. The destination is part of every bug report — and part of every test run.
