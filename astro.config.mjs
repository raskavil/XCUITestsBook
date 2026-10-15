import { defineConfig } from 'astro/config';
import remarkCallouts from './src/lib/remark-callouts.mjs';

// SITE_URL and BASE_PATH are set by the GitHub Actions workflow.
// For local dev they fall back to the values below.
export default defineConfig({
  site: process.env.SITE_URL ?? 'https://YOUR-USERNAME.github.io',
  base: process.env.BASE_PATH ?? '/ui-tests-book',
  markdown: {
    remarkPlugins: [remarkCallouts],
    shikiConfig: { theme: 'github-dark' },
  },
});
