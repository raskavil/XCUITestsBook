import fs from 'node:fs';
import path from 'node:path';
import { codeToHtml } from 'shiki';

/** Read a snapshot from /code. Fails the build if it is missing. */
export function readCode(rel: string): string {
  const abs = path.resolve(process.cwd(), 'code', rel);
  if (!fs.existsSync(abs)) throw new Error(`Missing code file: code/${rel}`);
  return fs.readFileSync(abs, 'utf8').replace(/\s+$/, '');
}

/** Fails the build if a file referenced under /public is missing. */
export function assertPublic(rel: string): void {
  const abs = path.resolve(process.cwd(), 'public', rel.replace(/^\/+/, ''));
  if (!fs.existsSync(abs)) throw new Error(`Missing public file: public/${rel}`);
}

/** Expand [3, "5-7"] to {3,5,6,7}; fails the build on lines outside the file. */
export function expandLines(spec: (number | string)[], lineCount: number, where: string): Set<number> {
  const out = new Set<number>();
  for (const s of spec) {
    const [a, b] = typeof s === 'number' ? [s, s] : s.split('-').map(Number);
    if (a > b || b > lineCount) {
      throw new Error(`highlight "${s}" is outside ${where} (file has ${lineCount} lines)`);
    }
    for (let i = a; i <= b; i++) out.add(i);
  }
  return out;
}

export async function highlight(code: string, lines: Set<number> = new Set(), lang = 'swift'): Promise<string> {
  return codeToHtml(code, {
    lang,
    theme: 'github-dark',
    transformers: [
      {
        line(node, line) {
          if (lines.has(line)) this.addClassToHast(node, 'hl');
        },
      },
    ],
  });
}

/** Read + highlight in one go. */
export async function loadCode(rel: string, spec: (number | string)[] = []) {
  const raw = readCode(rel);
  const lines = expandLines(spec, raw.split('\n').length, `code/${rel}`);
  return { raw, html: await highlight(raw, lines), filename: path.basename(rel) };
}
