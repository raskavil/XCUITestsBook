---
chapter: 01-swift-introduction
title: Flatten It With guard let
abstract: Rewrite a function buried under three nested `if let`s using `guard let`, a Nice-to-know topic, without changing a single output.
minutes: 20
difficulty: core
order: 7
starter: 01-swift-introduction/Welcome-starter.swift
solution: 01-swift-introduction/Welcome-solution.swift
doneWhen:
  - "`welcomeText` contains no `if` and no `else if`."
  - "It contains no `!` after an optional."
  - "The success message is returned on the last line of the function, not inside a block."
  - "The four calls print exactly the same four lines as the starter, in the same order."
hints:
  - "Look up `guard` in the Swift documentation. `guard let` is the mirror image of `if let`: its `else` block runs when the value is *missing*, and must leave the function."
  - "After `guard let name = username else { … }`, `name` is available for the rest of the function — not just inside a block."
  - "You can unwrap two things in one `guard`, separated by a comma: the count text, then `Int(countText)`. If either fails, the `else` returns the short welcome."
quiz:
  question: Where can you use `name` after `guard let name = username else { return "Please log in." }`?
  options:
    - Only inside the `else` block
    - Everywhere below the guard, until the end of the function
    - Only on the next line
  answer: 1
  explanation: "That is the point of `guard`: it handles the missing case first and leaves, so the unwrapped value stays available for the whole happy path below it."
---

The task list greets the tester by name and shows how many tasks they have. The function that builds the text works, but the happy path — the one case everyone cares about — is buried three levels deep, and two `else` blocks repeat the same text.

Swift has a statement designed for "check the missing cases first, then get on with it": `guard`. It is a Nice-to-know topic for this lesson.

Rewrite `welcomeText` with `guard let` so each missing case is handled at the top, and the full welcome is the last line of the function. This is a refactor: all four calls must print exactly what they printed before.
