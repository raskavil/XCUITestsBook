---
chapter: 01-swift-introduction
title: Reading an Error Message
abstract: Every compiler error has a location, a message and often a fix-it. Read all three before you change a single character.
minutes: 8
order: 2
---

## Errors are part of the job

You will see more error messages than successful runs, especially in your first weeks. That is normal. Experienced developers do not make fewer mistakes so much as read errors faster. The goal of this lesson is to make an error message feel like useful information instead of a wall of red.

A few snippets below use words you meet properly in the next lessons, like `let` and `if`. You do not need to understand them yet — focus on the errors.

## The three parts of an error

Every error the compiler reports has the same three parts:

| Part | Where you see it | What it tells you |
| --- | --- | --- |
| Location | A red marker on a line, plus the line number | Where the compiler *noticed* the problem |
| Message | The text next to the marker | What it expected and what it found |
| Fix-it | A **Fix** button, when there is one | A change the compiler is confident about |

Take this line:

```swift
let username = "tester"
print(usernme)
```

The location is line 2. The message is `Cannot find 'usernme' in scope`, which means "you used a name I have never seen". The fix-it suggests `username`. All three point at the same typo.

> [!TIP]
> Read the whole message before you click **Fix**. A fix-it guesses; it is right for typos and missing punctuation, and wrong surprisingly often for anything else.

## Five errors you will meet this week

| You wrote | The compiler says | What is wrong |
| --- | --- | --- |
| `print(usernme)` | Cannot find 'usernme' in scope | A name is misspelled |
| `if … {` with no `}` | Expected '}' at end of brace statement | A bracket was opened and never closed |
| `print("Hello)` | Unterminated string literal | Text was started and never ended |
| `let count: Int = "3"` | Cannot convert value of type 'String' to specified type 'Int' | A value has the wrong type |
| `let screen = "Login"` then `screen = "Task list"` | Cannot assign to value: 'screen' is a 'let' constant | A fixed value was changed |

Notice how specific the messages are. *Cannot convert String to Int* tells you exactly which two things clash. Read the message as a sentence, and it usually tells you the fix.

## One mistake, many errors

Brackets come in pairs: every `{` needs a `}`, every `(` needs a `)`. When one is missing, the compiler cannot tell where a block ends, so it misreads everything that follows. One forgotten `}` near the top of a file can produce ten errors further down, all of them "wrong" in confusing ways.

```swift
if username == "tester" {
    print("Known test account")

print("Next step")   // the compiler thinks this is still inside the if
```

The error appears at the very end of the file, far from line 1.

> [!WARNING]
> Do not fix the error you happen to see first on screen. Fix the **first error in the file** — the one with the smallest line number — and run again. Many of the others often disappear with it.

## The QA view: an error is a bug report

You already know what a good bug report looks like: where it happened, what happened, and what was expected instead. A compiler error is exactly that, written by a very literal colleague.

- **Where:** the file and line.
- **What happened:** "Cannot find 'usernme'".
- **What was expected:** a name it knows.

Treat errors the way you would want developers to treat your bug reports: read all of it, reproduce it, then change one thing at a time. Change one thing, run, read again. Changing five things at once makes it impossible to know which change fixed the problem.

When you write UI tests, test failures follow the same pattern: a location in the test file, a message such as `Failed to find element`, and a line that tells you which step failed. The habit you build now pays off in every later chapter.
