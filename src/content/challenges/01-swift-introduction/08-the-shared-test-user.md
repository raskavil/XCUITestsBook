---
chapter: 01-swift-introduction
title: The Shared Test User
abstract: Two tests copy a template user and change their copy, yet every copy ends up as a guest. Find out why — value vs. reference — and fix it.
minutes: 20
difficulty: core
order: 8
starter: 01-swift-introduction/SharedUser-starter.swift
solution: 01-swift-introduction/SharedUser-solution.swift
doneWhen:
  - "The console shows `admin`, `guest` and `user` on the three lines, matching the comments."
  - "`TestUser` is a `struct`, not a `class`."
  - "`template` is still declared with `let`."
  - You can explain in one sentence why the starter printed `guest` three times.
hints:
  - "Run the starter and compare the output with the comments. Which line changed the template, even though nobody assigned to `template`?"
  - "Look up *value types and reference types* in the Swift documentation. A `class` is a reference type: `let adminUser = template` does not copy the user, it gives the same user a second name."
  - "A struct is a value type: assigning it makes an independent copy. Change `class` to `struct`, remove the `init` Swift now writes for you, and see what the compiler says about the copies you change."
quiz:
  question: "`TestUser` is a struct. After `var copy = template` and `copy.role = .admin`, what is `template.role`?"
  options:
    - "`.admin`, because `copy` and `template` are the same user"
    - "Unchanged, because assigning a struct makes an independent copy"
    - It does not compile
  answer: 1
  explanation: Structs are value types. Each assignment copies the value, so changing the copy never touches the original — which is why test data is usually a struct.
---

A small test-data playground keeps one template user and lets each test start from it and adjust the role. The idea is sound, but the output is wrong: every test seems to run as a guest, and even the template has changed.

`TestUser` here is written as a `class` — a Nice-to-know topic that looks almost like a struct but behaves differently in one important way.

Find out why one change shows up in every copy, and fix the playground so each test gets its own independent user. Keep `template` as a `let`, and keep the three `print` lines exactly as they are.
