import { defineCollection, reference, z } from 'astro:content';
import { file, glob } from 'astro/loaders';

/** Shared fields every page in every mode has. */
const page = {
  chapter: reference('chapters'),
  title: z.string().min(3).max(70),
  abstract: z.string().min(20).max(220),
  minutes: z.number().int().positive().max(90),
  order: z.number().int().positive().default(1),
};

const quiz = z
  .object({
    question: z.string(),
    options: z.array(z.string()).min(2).max(5),
    answer: z.number().int().nonnegative(),
    explanation: z.string(),
  })
  .refine((q) => q.answer < q.options.length, {
    message: 'quiz.answer must be a valid index into quiz.options (0-based)',
  });

/** Line spec: 7 or "5-9". Refers to lines of the step's code snapshot. */
const lineSpec = z.union([z.number().int().positive(), z.string().regex(/^\d+-\d+$/)]);

const chapters = defineCollection({
  loader: file('src/content/chapters.yaml'),
  schema: z.object({
    number: z.number().int().positive(),
    title: z.string(),
    part: z.number().int().min(1).max(3),
    summary: z.string().max(160),
  }),
});

/** Mode 1 — Reading: new information and explanations. */
const reading = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/reading' }),
  schema: z.object(page),
});

/** Mode 2 — Practicing: step-by-step guided tutorials. */
const practice = defineCollection({
  loader: glob({ pattern: '**/*.{yaml,yml}', base: './src/content/practice' }),
  schema: z.object({
    ...page,
    sections: z
      .array(
        z.object({
          title: z.string(),
          intro: z.string(),
          steps: z
            .array(
              z.object({
                title: z.string().max(60),
                text: z.string().max(400),
                code: z.string(),
                filename: z.string().optional(),
                highlight: z.array(lineSpec).default([]),
                preview: z.object({ image: z.string(), alt: z.string() }).optional(),
              }),
            )
            .min(1)
            .max(8),
        }),
      )
      .min(1),
    quiz: quiz.optional(),
  }),
});

/** Mode 3 — Challenges: tasks the reader solves on their own. */
const challenges = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/challenges' }),
  schema: z.object({
    ...page,
    difficulty: z.enum(['warm-up', 'core', 'stretch']),
    starter: z.string(),
    solution: z.string(),
    doneWhen: z.array(z.string()).min(1).max(6),
    hints: z.array(z.string()).min(1).max(4),
    quiz: quiz.optional(),
  }),
});

export const collections = { chapters, reading, practice, challenges };
