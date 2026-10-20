# Authoring guide for Claude

You are writing content for **UI Testing on iOS**, a learning book about XCUITest published on GitHub Pages.
You write **content only**: Markdown, YAML and Swift files. Do not edit `src/components`, `src/layouts`,
`src/styles` or `src/pages` unless explicitly asked to change the design.

## Audience and voice

- Readers are iOS engineers who know Swift and UIKit/SwiftUI but are new to UI testing. Chapters 1 (Swift) and 2
  (UIKit) are the exception: they teach QA readers who have never written code, and add a "QA view" section per lesson.
- Write in English, second person ("you"), active voice, plain verbs. Explain *why* before *how*.
- Sentence case for every title and heading. No exclamation marks, no filler ("simply", "just", "easy").
- Prefer one short, concrete example over a long abstract explanation.
- Use the sample app consistently: **TaskBoard** — Login → Task list → Task detail, with Add task as a modal, built in
  chapter 2. Its accessibility identifiers are fixed by the contract in
  `src/content/reading/02-uikit-introduction/09-project-taskboard.md`; reuse them exactly. Invent new screens when
  needed and reuse them across chapters.
- **Never use code, names or details from real proprietary or internal projects.** Everything is generic and invented.

## Repository map

| What | Where |
| --- | --- |
| Table of contents | `src/content/chapters.yaml` |
| Read mode | `src/content/reading/<chapter-id>.md` |
| Practice mode | `src/content/practice/<chapter-id-or-slug>.yaml` |
| Challenge mode | `src/content/challenges/<chapter-id-or-slug>.md` |
| Swift snapshots | `code/<chapter-id>/<File>-NN.swift` |
| Optional screenshots | `public/previews/<chapter-id>/…png` |
| Schemas (source of truth) | `src/content.config.ts` |

Chapters split into lessons (chapters 1 and 2) keep one subfolder per chapter in every mode, for example
`src/content/reading/01-swift-introduction/03-storing-values.md`. Each lesson has one page per mode with the same
`order`, and the pager walks the chapter lesson by lesson: Read → Practice → Challenge for order 1, then order 2.

**Golden examples — read these before writing a new chapter and match their shape, depth and tone:**

- `src/content/reading/08-page-object.md`
- `src/content/practice/08-build-a-page-object.yaml`
- `src/content/challenges/08-settings-screen.md`

## The three modes

Each chapter should normally have one page in each mode, written in this order: Read → Practice → Challenge.
The Practice builds on concepts from Read; the Challenge applies them without step-by-step guidance.

### 1. Read — new information and explanations

Purpose: introduce the idea, show why it matters, and show small examples. Not a tutorial.

```yaml
---
chapter: 08-page-object      # id from chapters.yaml
title: The Page Object Pattern
abstract: One or two sentences, 20–220 characters. Shown under the title.
minutes: 8                   # honest reading time
order: 1                     # optional, only if a chapter has several Read pages
---
```

Body rules:
- Start with `##` headings (the page title is rendered from frontmatter). 3–6 `##` sections; they become "On this page".
- Code examples are short fenced ```swift blocks (≤ 15 lines). Longer code belongs in Practice.
- Callouts use GitHub alert syntax, at most three per page:
  - `> [!NOTE]` background or terminology
  - `> [!TIP]` a practical shortcut
  - `> [!IMPORTANT]` something the reader must not miss
  - `> [!WARNING]` a common pitfall (rendered as "Pitfall")
- Tables are welcome for comparisons. 600–1,200 words is the target.

### 2. Practice — step-by-step guides

Purpose: the reader builds something real, one small change at a time. Rendered as the interactive stepper.

```yaml
chapter: 08-page-object
title: Build a Page Object          # imperative: "Build…", "Add…", "Make…"
abstract: …
minutes: 25
sections:                           # 2–4 sections
  - title: Describe the screen
    intro: One sentence (inline Markdown) explaining the section's goal.
    steps:                          # 2–5 steps per section, max 8
      - title: Expose the controls  # ≤ 60 characters, imperative
        text: One or two sentences of inline Markdown, ≤ 400 characters. No lists or paragraphs.
        code: 08-page-object/LoginScreen-02.swift   # path under code/
        filename: LoginScreen.swift                 # what the reader's file is called
        highlight: ["6-8"]                          # lines changed in THIS step
        preview:                                    # optional
          image: previews/08-page-object/login.png  # under public/
          alt: The login screen with email and password fields
quiz:                               # optional but recommended
  question: …
  options: [ …, …, … ]              # 2–5 options
  answer: 1                         # 0-based index into options
  explanation: Shown when the reader picks the right answer.
```

Code snapshot rules (important):
- Each step points at a **complete file** showing the state *after* that step — not a diff or fragment.
- Number snapshots of the same file sequentially: `LoginScreen-01.swift`, `LoginScreen-02.swift`, …
  Snapshots can be reused across sections if the file didn't change.
- `highlight` lists only the lines added or changed in that step, using the snapshot's own line numbers
  (`7` or `"5-9"`). Count carefully — out-of-range lines fail the build.
- Every snapshot must be valid Swift that would compile in a UI test target with the sample app.
- Prefer 5–25 lines per snapshot; split a file into smaller types rather than showing 80 lines.

### 3. Challenge — problems to solve alone

Purpose: the reader applies the chapter without guidance. They get a brief, starter code, hints and a solution.

```yaml
---
chapter: 08-page-object
title: Wrap the Settings Screen
abstract: …
minutes: 20
difficulty: core            # warm-up | core | stretch
starter: 08-page-object/SettingsTests-starter.swift
solution: 08-page-object/SettingsTests-solution.swift
doneWhen:                   # 1–6 checkable acceptance criteria (inline Markdown)
  - …
hints:                      # 1–4, from gentle nudge to near-answer
  - …
quiz: { … }                 # optional, same shape as Practice
---
```

Body: 2–4 short paragraphs describing the situation and the goal. Never reveal the approach in the body — that's what
hints are for.

Rules:
- `doneWhen` items must be verifiable by the reader (a test passes, a call no longer appears, a type exists).
- Hint 1 points the direction; the last hint is nearly the answer but still not code to paste.
- The solution is a complete file that satisfies every `doneWhen` item.
- Good challenge types for this book: refactor a test, fix a flaky test, add a missing test, find why a query fails.

## Adding a new chapter — checklist

1. Make sure the chapter exists in `src/content/chapters.yaml` (id, number, title, part, summary ≤ 160 chars).
2. Write the Read page.
3. Write the Swift snapshots in `code/<chapter-id>/`, then the Practice YAML that references them.
4. Write the challenge starter and solution files, then the Challenge page.
5. Run `npm run build`. Fix every error it reports.
6. Re-read each page once as the reader: is any step too big? Is any term used before it is explained?

## Things that fail the build

- **YAML strings containing `: ` (colon + space) that aren't quoted.** YAML reads them as a key/value object.
  Always wrap step `text`, `intro`, `hints`, `doneWhen` items and quiz strings in double quotes when they contain
  code, colons or start with a backtick.

- A `chapter` id that isn't in `chapters.yaml`
- Missing required frontmatter fields or wrong types (e.g. `difficulty: hard`)
- A `code`, `starter` or `solution` path that doesn't exist under `code/`
- A `highlight` line beyond the end of the snapshot
- A `preview.image` that doesn't exist under `public/`
- A quiz `answer` index that isn't a valid option
