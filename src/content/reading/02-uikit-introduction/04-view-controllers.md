---
chapter: 02-uikit-introduction
title: One Screen, One View Controller
abstract: "A `UIViewController` owns one screen. Learn what `class LoginViewController: UIViewController` means, and why loaded is not the same as visible."
minutes: 8
order: 4
---

## Every screen has an owner

In lesson 2.2 you saw that a screen is a tree of views. Something has to create that tree, fill it with data and react when the user taps. In UIKit, that something is a **view controller**: an object of type `UIViewController` that owns exactly one screen.

TaskBoard has one view controller per screen: `LoginViewController`, `TaskListViewController`, `TaskDetailViewController`. When you want to know how a screen behaves, the file with its view controller is where you look.

## What `class X: UIViewController` means

Every UIKit screen file starts with a line like this:

```swift
final class LoginViewController: UIViewController {
```

A `class` is a type, like the structs from chapter 1, with one extra ability: it can be built *on top of* another class. The part after the colon names that other class. Read the line as "a login screen that is a kind of view controller". `LoginViewController` gets everything `UIViewController` can already do — a root `view`, a `title`, the ability to be shown and hidden — and adds only what is special about logging in. This is called **inheritance**: `UIViewController` is the *superclass*, `LoginViewController` the *subclass*.

You do not need to write classes from scratch in this book. You need to recognise this line, know that the screen inherits a lot of behaviour it does not spell out, and know that `final` only means "nothing else builds on top of this one".

## `override` and `super`

UIKit calls certain functions on a view controller at fixed moments — when its view is created, when it appears, when it goes away. The subclass hooks into those moments by **overriding** them:

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "Log in"
}
```

`override` says "I am replacing a function my superclass already has". The first line, `super.viewDidLoad()`, runs the superclass’s version first, so UIKit’s own setup still happens. Always keep that line; forgetting it causes bugs that are very hard to trace.

## Two moments that matter

A view controller goes through a sequence of moments called its **lifecycle**. Two of them matter right now:

| Function | When UIKit calls it | Typical use |
| --- | --- | --- |
| `viewDidLoad()` | Once, after the screen’s views are created, **before** it is on screen | Create views, set texts and identifiers |
| `viewDidAppear(_:)` | Every time the screen has **finished** appearing, after any animation | Start things the user should see happen |

`viewDidLoad` runs once per screen object. `viewDidAppear` runs every time the user comes back to it — for example after closing a screen that was on top of it.

> [!NOTE]
> There are more lifecycle functions: `viewWillAppear`, `viewWillDisappear` and `viewDidDisappear`. They follow the same pattern and are a Nice-to-know topic for this lesson.

## The QA view: loaded is not visible

When `viewDidLoad` runs, the views exist but nothing is on screen yet. Between `viewDidLoad` and `viewDidAppear`, the screen slides or fades in. During that animation, buttons can already exist in the view tree while sitting half off screen, moving, or covered by the previous screen.

A UI test that acts too early taps a screen that is still animating in — and fails one run in ten. Later in the book you make tests *wait* for elements instead of acting immediately. This lesson is the reason: the app has its own timeline, and the test has to respect it.

> [!TIP]
> Put a `print` in each lifecycle function you care about and watch the console while you use the app. The order you see is the order a test experiences, too.
