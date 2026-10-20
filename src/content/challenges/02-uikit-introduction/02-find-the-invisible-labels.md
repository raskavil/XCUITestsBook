---
chapter: 02-uikit-introduction
title: Find the Invisible Labels
abstract: Two labels on the Login screen have text and are not hidden, yet nobody can see them. Use the view tree to find out why.
minutes: 20
difficulty: core
order: 2
starter: 02-uikit-introduction/InvisibleLabels-starter.swift
solution: 02-uikit-introduction/InvisibleLabels-solution.swift
doneWhen:
  - Both *Test environment* and *Forgot your password?* are visible when the app runs.
  - "No view was deleted, and no `isHidden` or `alpha` line was added."
  - "The two labels’ own lines (frame and text) are unchanged."
  - You can name, for each label, the view that was hiding it.
hints:
  - Neither label has a problem of its own. Run the app and open Debug View Hierarchy, then rotate the 3D view.
  - "One label is inside a parent that has no height and cuts off everything outside itself. The other is fine — but something else is drawn on top of it."
  - "Give the footer the label’s height. For the banner, remember that views added later are drawn on top: change the order in which the views are added, so the background goes in first."
quiz:
  question: Two sibling views overlap. Which one is drawn on top?
  options:
    - The one added to the parent later
    - The one with the larger frame
    - The one whose name comes first alphabetically
  answer: 0
  explanation: Siblings are drawn in the order they were added, so the last one added covers the earlier ones where they overlap.
---

A developer added a yellow *Test environment* banner and a *Forgot your password?* link to the Login screen. Both views are created, both have text, and neither is hidden — but when you run the app, neither shows up.

A manual tester would file "labels missing". You can do better: find the exact cause in the view tree.

Make both labels visible without deleting any view and without touching the labels themselves.
