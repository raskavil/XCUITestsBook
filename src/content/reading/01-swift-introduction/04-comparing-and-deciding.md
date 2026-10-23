---
chapter: 01-swift-introduction
title: Comparing and Deciding
abstract: Comparisons turn two values into true or false, and if / else uses that answer to choose which lines run.
minutes: 7
order: 4
---

## A check is a question with a yes-or-no answer

Every check in a test case asks a question: *Is the title "Tasks"? Are there three rows? Is the error label hidden?* The answer is always yes or no. In Swift, that answer is a `Bool`: `true` or `false`.

You get a `Bool` by comparing two values:

```swift
let expectedTitle = "Tasks"
let actualTitle = "Tasks"

print(actualTitle == expectedTitle)   // true
```

## Comparison operators

| Operator | Means | Example | Result |
| --- | --- | --- | --- |
| `==` | is equal to | `3 == 3` | `true` |
| `!=` | is not equal to | `"Tasks" != "Login"` | `true` |
| `>` | is greater than | `2 > 3` | `false` |
| `<` | is less than | `2 < 3` | `true` |
| `>=` | is greater than or equal to | `3 >= 3` | `true` |
| `<=` | is less than or equal to | `4 <= 3` | `false` |

`==` and `!=` work for text, numbers and `Bool`s. Text comparisons are exact: `"Tasks"` and `"tasks"` are different, and so are `"Tasks"` and `"Tasks "` with a trailing space.

## Combining answers

Real checks often combine several conditions. Three logic operators do that:

| Operator | Means | True when |
| --- | --- | --- |
| `&&` | and | both sides are true |
| <code>&#124;&#124;</code> | or | at least one side is true |
| `!` | not | the value after it is false |

```swift
let isOnTaskList = actualTitle == "Tasks" && taskCount == 3
let canRetry = failedAttempts < 3 || isAdmin
let isLoggedOut = !isLoggedIn
```

## Choosing what runs with `if`

`if` runs a block of code only when a condition is `true`. Add `else` for the block that runs otherwise. The blocks sit between `{` and `}`:

```swift
if actualTitle == expectedTitle {
    print("PASS")
} else {
    print("FAIL: title was \(actualTitle)")
}
```

Exactly one of the two blocks runs, never both. When there are more than two outcomes, chain them with `else if`. Swift checks each condition from the top and runs the first block whose condition is true:

```swift
if taskCount == 0 {
    print("Empty list")
} else if taskCount < 3 {
    print("Some tasks are missing")
} else {
    print("All tasks are there")
}
```

> [!TIP]
> Put the most specific check first. In a chain, a broad condition at the top swallows every case below it, and the later blocks never run.

## The QA view: the expected-result column

Look at any written test case. It has steps, and next to the last step, an *expected result*. Running the test means comparing what actually happened with that expected result and writing *pass* or *fail*.

The `if` statement above is exactly that column, written as code. *Expected* goes in one constant, *actual* in another, and `==` decides. When you write UI tests, you will use assertion functions instead of `print("PASS")` — but every assertion is still a comparison that produces `true` or `false`.

Write the failure message so it says what you got, not only that something failed. `FAIL: title was Login` tells you where to look; `FAIL` alone sends you back to rerun the test.

> [!WARNING]
> `=` and `==` look alike and do different things. `=` **assigns** a value: `count = 3` makes `count` three. `==` **compares**: `count == 3` asks whether it is three. Swift rejects `if count = 3`, so the compiler catches this one — but read the error carefully when it does.
