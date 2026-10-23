---
chapter: 01-swift-introduction
title: Lists and Loops
abstract: An array keeps many values in order, counted from index 0, and a for-in loop repeats the same steps for every one of them.
minutes: 8
order: 5
---

## One name, many values

A test rarely needs just one value. You check every screen in the app, try five invalid email addresses, or expect three rows in a list. Giving each one its own constant gets old fast:

```swift
let screen1 = "Login"
let screen2 = "Task list"
let screen3 = "Task detail"
```

An **array** holds any number of values of the same type, in order, under one name. Write the values between square brackets, separated by commas:

```swift
let screens = ["Login", "Task list", "Task detail", "Add task", "Settings"]
```

Swift infers the type `[String]` — "an array of strings". An array of numbers is `[Int]`.

## Positions start at zero

Each item has a position called its **index**. The first item is at index `0`, not `1`:

| Index | 0 | 1 | 2 | 3 | 4 |
| --- | --- | --- | --- | --- | --- |
| Value | Login | Task list | Task detail | Add task | Settings |

Read one item by writing its index in square brackets:

```swift
print(screens[0])                  // Login
print(screens[2])                  // Task detail
print(screens[screens.count - 1])  // Settings, the last item
```

Five items means indexes `0` to `4`. The last index is always `count - 1`.

## Useful things an array knows

| You write | You get |
| --- | --- |
| `screens.count` | The number of items: `5` |
| `screens.isEmpty` | `true` when there are no items |
| `screens.contains("Settings")` | `true` if that value is in the array |
| `screens.append("Profile")` | Adds an item at the end (only on a `var` array) |

`append` changes the array, so it only works when the array was declared with `var`.

## Repeating steps with `for-in`

A **loop** runs the same block of code several times. `for-in` runs it once for each item in an array, in order, and gives you the current item under a name you choose:

```swift
for screen in screens {
    print("Open \(screen) and check the title")
}
```

This prints five lines, one per screen. `screen` holds `"Login"` the first time, `"Task list"` the second time, and so on. The name only exists inside the loop’s `{ }`.

You can also loop over a range of numbers. `1...3` means 1, 2 and 3:

```swift
for attempt in 1...3 {
    print("Attempt \(attempt): type a wrong password")
}
```

## The QA view: data-driven testing

You have probably written a test case that says "repeat steps 2–4 for each of these inputs" followed by a table. That is **data-driven testing**: the steps stay the same, only the data changes.

An array is the table, and `for-in` is the "repeat for each". Later in the book you will loop over invalid inputs in a single UI test instead of copying the same test five times:

```swift
let invalidEmails = ["", "tester", "tester@", "@example.com"]

for email in invalidEmails {
    print("Type '\(email)' and expect an error")
}
```

Adding a sixth case is now a one-word change.

> [!WARNING]
> Reading an index that does not exist crashes the program. `screens[5]` on a five-item array stops with *Index out of range* — the compiler cannot catch it, because it does not know how many items the array will have when the code runs. When you need the last item, use `count - 1`, and prefer `for-in` over counting indexes yourself.
