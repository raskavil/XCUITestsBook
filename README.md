# UI Testing on iOS

A learning book about XCUITest, built with [Astro](https://astro.build) and published on GitHub Pages.

Every chapter has three modes:

| Mode | Purpose | Lives in |
| --- | --- | --- |
| **Read** | New information and explanations | `src/content/reading/*.md` |
| **Practice** | Step-by-step guided tutorials | `src/content/practice/*.yaml` + `code/` |
| **Challenge** | Tasks the reader solves alone, with hints | `src/content/challenges/*.md` + `code/` |

Content is plain data. The design lives in `src/components`, `src/layouts` and `src/styles`, so adding a chapter never means writing HTML.

## Run locally

```sh
npm install
npm run dev        # http://localhost:4321/ui-tests-book/
npm run build      # validates all content and builds to dist/
```

Node 20 or later is required (see `.nvmrc`).

## Publish on GitHub Pages

1. Push this repository to GitHub.
2. In **Settings → Pages**, set **Source** to **GitHub Actions**.
3. Push to `main`. The workflow in `.github/workflows/deploy.yml` builds and deploys the site to `https://<user>.github.io/<repo>/`.

If the repository is named `<user>.github.io`, change `BASE_PATH` in the workflow to `/`.

Also replace `YOUR-USERNAME` in `src/lib/book.ts` and `astro.config.mjs`.

> GitHub Pages sites are public, even when the repository is private, unless your organization uses GitHub Enterprise Cloud with private Pages. Keep proprietary code out of the book.

## Repository map

```
src/content/chapters.yaml     Table of contents (ids, numbers, parts)
src/content/reading/          Read mode — Markdown
src/content/practice/         Practice mode — YAML tutorials
src/content/challenges/       Challenge mode — Markdown + frontmatter
src/content.config.ts         Schemas: the build fails if content doesn't match
code/<chapter-id>/            Swift snapshots used by Practice and Challenges
public/previews/              Optional screenshots for Practice steps
src/components, layouts/      Design (direction B)
src/styles/global.css         Design tokens, light + dark
CLAUDE.md                     Authoring guide for Claude
```

## Writing with Claude

`CLAUDE.md` tells Claude how to write each mode. With Claude Code in this repo, a typical request is:

> Write chapter 5, "Waiting for Elements", in all three modes. Follow CLAUDE.md.

Then run `npm run build`. Any schema error, missing code file or out-of-range highlight fails the build with a message pointing at the problem.

## Roadmap

- Compile `code/` snapshots in CI against a small sample app, so the book's code can't drift.
- Search (e.g. Pagefind) once there are enough chapters.
