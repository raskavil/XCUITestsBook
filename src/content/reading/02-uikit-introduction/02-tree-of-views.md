---
chapter: 02-uikit-introduction
title: A Screen Is a Tree of Views
abstract: Window, root view, child views — each view is drawn inside its parent, and hiding a parent hides every child. That tree is what tests search.
minutes: 8
order: 2
---

## Everything on screen is a view

Look at any iPhone screen and you see text, fields, buttons and images. To UIKit, every one of them is a **view**: an object of type `UIView`, or of a more specific type built on it, such as `UILabel` or `UIButton`. A view is a rectangle that knows how to draw itself.

Views do not float around freely. Each one sits inside another view, its **parent** (or *superview*). The views inside it are its **children** (or *subviews*). Together they form a tree.

## The tree behind the Login screen

Here is the Login screen you will build in lesson 2.6, drawn as a tree:

```text
UIWindow
└─ root view of LoginViewController
   └─ stack view
      ├─ username field
      ├─ password field
      ├─ Log in button
      └─ error label
```

At the top is the **window**, which fills the screen. Inside it sits the screen’s **root view** — the `view` every view controller has. Everything you add to a screen goes into that root view, or into a view inside it.

## Adding a child

You put one view inside another with `addSubview`. The child’s `frame` says where it sits *inside its parent* and how big it is:

```swift
let card = UIView(frame: CGRect(x: 20, y: 140, width: 350, height: 200))
view.addSubview(card)

let welcome = UILabel(frame: CGRect(x: 16, y: 16, width: 300, height: 30))
welcome.text = "Welcome to TaskBoard"
card.addSubview(welcome)
```

The label’s `x: 16` is measured from the card’s left edge, not the screen’s. Move the card and the label moves with it. Children added later are drawn on top of children added earlier.

## What a parent does to its children

The parent–child relationship is not just bookkeeping. Several properties of a parent affect every view below it:

| Parent property | Effect on its children |
| --- | --- |
| `isHidden = true` | All children disappear too |
| `alpha = 0` | All children become invisible |
| `clipsToBounds = true` | Anything outside the parent’s rectangle is cut off |
| Moved off screen | All children go with it |

So when a label "is not showing", the cause is often not the label at all. It is a parent somewhere above it.

## Seeing the tree: Debug View Hierarchy

You do not have to imagine the tree. Run the app, then click **Debug View Hierarchy** in the debug bar at the bottom of Xcode (the icon with three stacked rectangles). Xcode pauses the app and shows every view as a 3D stack of layers you can rotate. The left sidebar lists the same views as a tree.

> [!TIP]
> In Debug View Hierarchy, select a view and open the inspector on the right. You see its frame, whether it is hidden, its alpha and its parent — usually enough to explain why something is not where you expected.

## The QA view: why "element not found" happens

A UI test finds things by searching a tree, much like this one (lesson 2.8 shows exactly which tree). When a test fails with *element not found* even though "the button is right there in the design", the view tree is the first place to look. Common causes:

- The element’s parent is hidden, so the element is too.
- The parent is off screen or clips the element away.
- The element was never added to the tree at all.

Thinking in parents and children turns a mysterious failure into a short checklist.

> [!WARNING]
> A view can be in the tree and still invisible to the user: its frame has zero width or height, or a later sibling is drawn on top of it. It *exists*, so some checks pass, yet nobody can see or tap it. Debug View Hierarchy shows these views clearly — rotate the 3D view to see what hides behind what.
