---
chapter: 02-uikit-introduction
title: Lay Out the Form Properly
abstract: Centre the login form, cap its width on wide screens, give the button a tappable height and let long errors wrap — Auto Layout beyond one pinned stack.
minutes: 30
difficulty: stretch
order: 6
starter: 02-uikit-introduction/Login-04.swift
solution: 02-uikit-introduction/LoginLayout-solution.swift
doneWhen:
  - The form sits in the vertical centre of the screen, on iPhone in portrait and in landscape.
  - On an iPad simulator, the form is never wider than 400 points and is centred horizontally.
  - "Debug View Hierarchy shows the **Log in** button at least 44 points tall."
  - A username of 60 characters produces an error message that wraps onto several lines instead of being cut off.
  - The Xcode console shows no *Unable to simultaneously satisfy constraints* warnings.
hints:
  - "Look up *Auto Layout anchors* in Apple’s documentation. Besides `topAnchor` and `leadingAnchor`, every view has `centerXAnchor`, `centerYAnchor`, `widthAnchor` and `heightAnchor`."
  - "Replace the three pinning constraints. Centre the stack on both axes, then describe its width with two rules: at most 400 points, and at most the width of the layout margins."
  - "Those two rules allow any width up to the limit, so add a third — equal to the margins’ width — with `priority = .defaultHigh`, so it gives way when it would break the 400-point cap. For wrapping, set the label’s `numberOfLines` to `0`."
quiz:
  question: Why can two constraints conflict, and what happens when they do?
  options:
    - They cannot; Auto Layout always merges them
    - "Two required rules can be impossible together; Auto Layout breaks one at run time and logs a warning"
    - The app does not compile
  answer: 1
  explanation: Constraints are checked while the app runs, not by the compiler. Impossible combinations show up as console warnings and a layout that ignores one of your rules — which is why priorities exist.
---

The Login screen from the practice works on an iPhone in portrait. On an iPad it stretches edge to edge, in landscape it hugs the top, the button is barely taller than its text, and a long error message is cut off after one line.

The fix is more Auto Layout — the Nice-to-know topic for this lesson. Pinning a stack to three edges is only the start: constraints can centre a view, cap its size and set a minimum height.

Rework the layout constraints so the form looks deliberate on every device. Do not change which controls are on the screen or what they do.
