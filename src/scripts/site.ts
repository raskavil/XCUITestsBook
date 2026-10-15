const root = document.documentElement;

function store(key: string, value: string | null) {
  try {
    if (value === null) localStorage.removeItem(key);
    else localStorage.setItem(key, value);
  } catch {}
}
function load(key: string): string | null {
  try {
    return localStorage.getItem(key);
  } catch {
    return null;
  }
}

// Theme toggle
document.querySelectorAll<HTMLButtonElement>('[data-theme-toggle]').forEach((btn) => {
  btn.addEventListener('click', () => {
    const isDark = root.dataset.theme
      ? root.dataset.theme === 'dark'
      : matchMedia('(prefers-color-scheme: dark)').matches;
    const next = isDark ? 'light' : 'dark';
    root.dataset.theme = next;
    store('theme', next);
  });
});

// Code panels: copy + code/preview switch
document.querySelectorAll<HTMLElement>('[data-code-panel]').forEach((panel) => {
  const copy = panel.querySelector<HTMLButtonElement>('[data-copy]');
  const raw = panel.querySelector<HTMLTemplateElement>('template[data-raw]');
  copy?.addEventListener('click', async () => {
    try {
      await navigator.clipboard.writeText(raw?.content.textContent ?? '');
      copy.textContent = 'Copied';
    } catch {
      copy.textContent = 'Copy failed';
    }
    setTimeout(() => (copy.textContent = 'Copy'), 1500);
  });

  const buttons = panel.querySelectorAll<HTMLButtonElement>('[data-view-btn]');
  const views = panel.querySelectorAll<HTMLElement>('[data-view]');
  buttons.forEach((b) =>
    b.addEventListener('click', () => {
      const want = b.dataset.viewBtn;
      buttons.forEach((x) => x.setAttribute('aria-pressed', String(x === b)));
      views.forEach((v) => (v.hidden = v.dataset.view !== want));
    }),
  );
});

// Steppers
document.querySelectorAll<HTMLElement>('[data-stepper]').forEach((stepper) => {
  const steps = [...stepper.querySelectorAll<HTMLButtonElement>('[data-step]')];
  const panels = [...stepper.querySelectorAll<HTMLElement>('[data-panel]')];
  const prev = stepper.querySelector<HTMLButtonElement>('[data-prev]');
  const next = stepper.querySelector<HTMLButtonElement>('[data-next]');
  let current = 0;

  const show = (i: number) => {
    current = i;
    steps.forEach((s, j) => {
      s.classList.toggle('is-active', j === i);
      s.classList.toggle('is-done', j < i);
      s.setAttribute('aria-pressed', String(j === i));
    });
    panels.forEach((p, j) => p.classList.toggle('is-active', j === i));
    if (prev) prev.disabled = i === 0;
    if (next) next.disabled = i === steps.length - 1;
  };

  steps.forEach((s, i) => s.addEventListener('click', () => show(i)));
  prev?.addEventListener('click', () => show(Math.max(0, current - 1)));
  next?.addEventListener('click', () => show(Math.min(steps.length - 1, current + 1)));
  show(0);
});

// Quizzes
document.querySelectorAll<HTMLElement>('[data-quiz]').forEach((quiz) => {
  const answer = Number(quiz.dataset.answer);
  const feedback = quiz.querySelector<HTMLElement>('[data-feedback]');
  const verdict = quiz.querySelector<HTMLElement>('[data-verdict]');
  const explanation = quiz.querySelector<HTMLElement>('[data-explanation]');
  quiz.querySelectorAll<HTMLInputElement>('input[type="radio"]').forEach((radio) => {
    radio.addEventListener('change', () => {
      const right = Number(radio.value) === answer;
      quiz.querySelectorAll('.quiz-option').forEach((o) => o.classList.remove('is-right', 'is-wrong'));
      radio.closest('.quiz-option')?.classList.add(right ? 'is-right' : 'is-wrong');
      if (feedback && verdict && explanation) {
        feedback.hidden = false;
        feedback.dataset.state = right ? 'right' : 'wrong';
        verdict.textContent = right ? 'Correct.' : 'Not quite — try another answer.';
        explanation.hidden = !right;
      }
    });
  });
});

// Hints: reveal one at a time
document.querySelectorAll<HTMLElement>('[data-hints]').forEach((box) => {
  const hints = [...box.querySelectorAll<HTMLElement>('[data-hint]')];
  const btn = box.querySelector<HTMLButtonElement>('[data-hint-next]');
  let shown = 0;
  const update = () => {
    hints.forEach((h, i) => (h.hidden = i >= shown));
    if (btn) {
      btn.hidden = shown >= hints.length;
      btn.textContent = `Show hint ${shown + 1} of ${hints.length}`;
    }
  };
  btn?.addEventListener('click', () => {
    shown += 1;
    update();
  });
  if (btn) btn.hidden = false;
  update();
});

// Progress (stored per browser)
document.querySelectorAll<HTMLButtonElement>('[data-complete]').forEach((btn) => {
  const key = btn.dataset.complete!;
  const sync = () => {
    const done = load(key) === '1';
    btn.setAttribute('aria-pressed', String(done));
    btn.textContent = done ? 'Completed' : 'Mark as completed';
  };
  btn.addEventListener('click', () => {
    store(key, load(key) === '1' ? null : '1');
    sync();
  });
  btn.hidden = false;
  sync();
});
document.querySelectorAll<HTMLElement>('[data-progress-key]').forEach((el) => {
  if (load(el.dataset.progressKey!) === '1') el.classList.add('is-done');
});
