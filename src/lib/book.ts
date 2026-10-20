import { getCollection } from 'astro:content';

export const book = {
  title: 'UI Testing on iOS',
  kicker: 'XCUITest from first tap to green CI',
  tagline:
    'A hands-on book for iOS engineers. Learn each idea, practice it step by step, then prove it in a challenge.',
  repo: 'https://github.com/YOUR-USERNAME/ui-tests-book',
};

export const parts: Record<number, string> = {
  1: 'Foundations',
  2: 'Writing Robust Tests',
  3: 'At Scale',
};

export type Mode = 'read' | 'practice' | 'challenge';
export const modes: Mode[] = ['read', 'practice', 'challenge'];
export const modeLabel: Record<Mode, string> = { read: 'Read', practice: 'Practice', challenge: 'Challenge' };
export const modeBlurb: Record<Mode, string> = {
  read: 'New ideas, explained with small examples.',
  practice: 'Guided tutorials you follow step by step.',
  challenge: 'Tasks you solve on your own, with hints.',
};

/** Prefix a site-relative path with the configured base (works for "/" and "/repo"). */
export function url(path = ''): string {
  const base = import.meta.env.BASE_URL.replace(/\/+$/, '');
  const p = path.replace(/^\/+/, '');
  return p ? `${base}/${p}` : `${base}/`;
}

export interface Stop {
  id: string;
  title: string;
  href: string;
  order: number;
}

export interface Chapter {
  id: string;
  number: number;
  title: string;
  part: number;
  summary: string;
  read: Stop[];
  practice: Stop[];
  challenge: Stop[];
}

type Entry = { id: string; data: { chapter: { id: string }; title: string; order: number } };

function collect(list: Entry[], chapterId: string, prefix: string): Stop[] {
  return list
    .filter((e) => e.data.chapter.id === chapterId)
    .sort((a, b) => a.data.order - b.data.order)
    .map((e) => ({ id: e.id, title: e.data.title, href: url(`${prefix}/${e.id}/`), order: e.data.order }));
}

export async function getBook(): Promise<Chapter[]> {
  const [chapters, reading, practice, challenges] = await Promise.all([
    getCollection('chapters'),
    getCollection('reading'),
    getCollection('practice'),
    getCollection('challenges'),
  ]);
  return chapters
    .sort((a, b) => a.data.number - b.data.number)
    .map((ch) => ({
      id: ch.id,
      ...ch.data,
      read: collect(reading as Entry[], ch.id, 'read'),
      practice: collect(practice as Entry[], ch.id, 'practice'),
      challenge: collect(challenges as Entry[], ch.id, 'challenges'),
    }));
}

/**
 * Reading order across the whole book: per chapter, lesson by lesson (`order`),
 * and within a lesson Read → Practice → Challenge.
 */
export function flatten(chapters: Chapter[]) {
  return chapters.flatMap((ch) =>
    modes
      .flatMap((mode, rank) =>
        ch[mode].map((s) => ({ ...s, mode, rank, chapterNumber: ch.number, chapterTitle: ch.title })),
      )
      .sort((a, b) => a.order - b.order || a.rank - b.rank),
  );
}
