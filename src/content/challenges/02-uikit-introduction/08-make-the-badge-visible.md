---
chapter: 02-uikit-introduction
title: Make the Done Badge Visible
abstract: A coloured badge shows whether a task is done, and it has an identifier — yet neither tests nor VoiceOver users can find it. Find out why and fix it.
minutes: 20
difficulty: core
order: 8
starter: 02-uikit-introduction/DoneBadge-starter.swift
solution: 02-uikit-introduction/DoneBadge-solution.swift
doneWhen:
  - "In the Accessibility Inspector, hovering the badge highlights an element with the identifier `taskDetail.doneBadge`."
  - "Its label is `Done` on task 3 and `Not done` on tasks 1 and 2."
  - The badge looks exactly as before, and the title label is unchanged.
  - You can explain in one sentence why the identifier alone was not enough.
hints:
  - "Before changing anything, open task 3 and compare Debug View Hierarchy with the Accessibility Inspector. Which of the two shows the badge?"
  - "The badge is a plain `UIView` with no text and no children. Lesson 2.8 explains which views become elements of the accessibility tree."
  - "Set `isAccessibilityElement = true` on the badge, and give it an `accessibilityLabel` built from `task.isDone`, so it says something useful to VoiceOver users too."
quiz:
  question: Why is a colour alone a poor way to show that a task is done?
  options:
    - Colours are slow to draw
    - Neither VoiceOver users nor UI tests perceive colour; they need a label or a value
    - The simulator cannot show green
  answer: 1
  explanation: State that is only shown as colour is invisible to assistive technology and to tests. A label such as "Done" serves both.
---

The Task detail screen got a small redesign: a coloured badge next to the title — green when the task is done, grey when it is not. It even has an identifier, `taskDetail.doneBadge`, so a test can check a task’s state.

The first test that uses it fails with *element not found*. A VoiceOver user reports a second problem: nothing on the screen tells them whether the task is done.

Make the badge a proper part of the accessibility tree, so the test can find it and a VoiceOver user can hear the task’s state. Do not change how it looks.
