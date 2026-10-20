---
chapter: 01-swift-introduction
title: "Grouping Data: struct and enum"
abstract: A `struct` groups values that belong together; an `enum` lists a fixed set of choices. Together they describe test users and screens.
minutes: 8
order: 8
---

## Values that belong together

A test account is not one value. It has a name, an email and a role, and they only make sense together. With what you know so far, you would write three separate constants — and nothing stops you from mixing one user’s name with another user’s email.

Swift lets you define your own types that keep related values together. The two you will use most are `struct` and `enum`.

## `struct`: a group of named values

A **struct** describes the shape of a value: which pieces it has and of what type. Each piece is a **property**.

```swift
struct TestUser {
    let name: String
    let email: String
}

let tester = TestUser(name: "tester", email: "tester@example.com")
print(tester.email)   // tester@example.com
```

The definition creates a new type called `TestUser`, just like `String` or `Int`. Swift gives every struct a ready-made way to create one: write the type’s name and pass a value for every property, by name. You read a property with a dot: `tester.name`.

Type names start with a capital letter (`TestUser`). Property and constant names start with a lowercase letter (`tester`, `email`).

## `enum`: one of a fixed set of choices

Some values can only be one of a few known options. A user is an admin, a regular user or a guest — nothing else. An **enum** (short for *enumeration*) lists those options as **cases**:

```swift
enum Role {
    case admin, user, guest
}

let role = Role.admin
```

Why not use a `String` like `"admin"`? Because a typo such as `"admn"` is still a valid string, and nothing warns you. `Role.admn` does not compile. An enum turns a whole family of typos into compiler errors.

When Swift already knows the type, you can drop the enum’s name and write just the dot and the case: `.admin`. You compare cases with `==`, like any other value.

## Putting them together

A struct’s property can have any type — including an enum you defined:

```swift
struct TestUser {
    let name: String
    let email: String
    let role: Role
}

let lead = TestUser(name: "qa.lead", email: "lead@example.com", role: .admin)

if lead.role == .admin {
    print("\(lead.name) can delete tasks")
}
```

This is how real code is built: small types made of other small types. When you read app code in the next lesson, you will see the same pattern with different names.

## The QA view: test users and screens

Look at the test accounts in your team’s test plan. Each has the same columns — name, email, role. That table header is a `struct`; each row is a value of it. The list of screens in a test plan’s flow diagram is an `enum`: there is a fixed number, and each test starts on one of them.

From chapter 5 on, you describe test users and screens with exactly these shapes, so a test can say `logIn(as: lead)` instead of repeating three strings.

> [!WARNING]
> A struct stored in a `let` cannot change *any* of its properties — even properties declared with `var`. `let user = TestUser(…)` followed by `user.role = .guest` fails with *Cannot assign to property: 'user' is a 'let' constant*. Store it in a `var` when you need to change it.
