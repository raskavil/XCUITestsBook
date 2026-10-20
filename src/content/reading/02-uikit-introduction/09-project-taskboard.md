---
chapter: 02-uikit-introduction
title: "Project: TaskBoard"
abstract: What you build in the chapter project, the decisions every later chapter relies on, and TaskBoard’s identifier contract.
minutes: 5
order: 9
---

## What you build

The project fits one 45-minute lesson. The starter project already contains the Task list and Task detail screens. You build only the **Login** screen — about 30 lines, as in lesson 2.6 — push to the task list on a valid login, and add the identifiers from the table below to all three screens.

Every later chapter builds on exactly this app, so take the identifiers seriously: from chapter 4 on, UI tests look for them by name.

## The screen flow

```text
            valid login
Login ───────────────────▶ Task list ──tap a row──▶ Task detail
  │                            │
  └─ wrong login:              └─ + ──present──▶ Add task (modal)
     error label shows
```

Only Login, Task list and Task detail are required, and only Login is built from scratch. Add task is the project’s first Challenge, the done switch on Task detail its second, and a Settings screen arrives in a later chapter.

## Fixed decisions

These three decisions keep tests simple and repeatable. Do not change them:

- **One test account:** `tester` / `password123`, hard-coded in the Login screen.
- **Three seeded tasks with ids 1–3, kept in memory only.** Every launch starts from the same data, so a test that "passes three runs in a row" needs no extra setup.
- **Cell identifiers use the task id, not the row index.** An index shifts after a delete or a re-sort, which later chapters’ challenges do.

The Login screen shows one of two error texts: *Enter your username.* when the username is empty, and *Wrong username or password.* for anything else that is not the test account.

## The identifier contract

This table is the contract chapters 4–8 test against. Keep it next to you while you write tests — it works well printed as an appendix.

| Screen | Element | Identifier |
| --- | --- | --- |
| Login | username field | `login.usernameField` |
| Login | password field | `login.passwordField` |
| Login | log in button | `login.loginButton` |
| Login | error label | `login.errorLabel` |
| Task list | table | `taskList.table` |
| Task list | each row | `taskList.cell.<taskID>` |
| Task list | add button (Challenge) | `taskList.addButton` |
| Task detail | title | `taskDetail.titleLabel` |
| Task detail | notes | `taskDetail.notesLabel` |
| Task detail | done switch (Challenge) | `taskDetail.doneSwitch` |
| Add task | title field (Challenge) | `addTask.titleField` |
| Add task | notes field (Challenge) | `addTask.notesField` |
| Add task | Save button (Challenge) | `addTask.saveButton` |
| Add task | Cancel button (Challenge) | `addTask.cancelButton` |

> [!IMPORTANT]
> Use these strings exactly — same spelling, same capitalisation. A test that looks for `login.LoginButton` does not find `login.loginButton`, and nothing warns you until the test runs.

## How you know you are done

Open each screen in the Accessibility Inspector (lesson 2.8) and hover every element in the table. Each one should be found, with the identifier shown in the table. If an element cannot be found, check it with lesson 2.2’s list: is it in the view tree, visible, and not hidden behind something else?
