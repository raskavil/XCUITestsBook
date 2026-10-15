import { marked } from 'marked';

/** Inline Markdown (no paragraphs) — for step text, intros, hints, checklist items. */
export const mdInline = (s: string): string => marked.parseInline(s, { async: false }) as string;
