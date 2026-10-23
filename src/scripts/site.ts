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

// Progress (stored per browser). One key per page: uitb:<mode>:<page id>.
// Every control that shows or sets progress reads the same keys, so they stay in sync.
const isDone = (key: string) => load(key) === '1';
const setDone = (key: string, done: boolean) => {
  store(key, done ? '1' : null);
  refreshProgress();
};

function refreshProgress() {
  document.querySelectorAll<HTMLInputElement>('[data-done-key]').forEach((box) => {
    box.checked = isDone(box.dataset.doneKey!);
  });
  document.querySelectorAll<HTMLButtonElement>('[data-complete]').forEach((btn) => {
    const done = isDone(btn.dataset.complete!);
    btn.setAttribute('aria-pressed', String(done));
    btn.textContent = done ? 'Completed' : 'Mark as completed';
  });
  document.querySelectorAll<HTMLElement>('[data-progress-key]').forEach((el) => {
    el.classList.toggle('is-done', isDone(el.dataset.progressKey!));
  });
  document.querySelectorAll<HTMLElement>('[data-nav-chapter]').forEach((chapter) => {
    const boxes = [...chapter.querySelectorAll<HTMLInputElement>('[data-done-key]')];
    const done = boxes.filter((b) => b.checked).length;
    const count = chapter.querySelector<HTMLElement>('[data-count]');
    const bar = chapter.querySelector<HTMLElement>('[data-bar]');
    if (count) {
      count.hidden = false;
      count.textContent = `${done}/${boxes.length}`;
    }
    if (bar) bar.style.transform = `scaleX(${boxes.length ? done / boxes.length : 0})`;
    chapter.classList.toggle('is-complete', boxes.length > 0 && done === boxes.length);
  });
  const total = document.querySelector<HTMLElement>('[data-total-progress]');
  if (total) {
    const done = document.querySelectorAll('[data-done-key]:checked').length;
    total.hidden = false;
    total.textContent = `${done} of ${total.dataset.total} pages done`;
  }
}

document.querySelectorAll<HTMLInputElement>('[data-done-key]').forEach((box) => {
  box.addEventListener('change', () => setDone(box.dataset.doneKey!, box.checked));
});
document.querySelectorAll<HTMLButtonElement>('[data-complete]').forEach((btn) => {
  btn.addEventListener('click', () => setDone(btn.dataset.complete!, !isDone(btn.dataset.complete!)));
  btn.hidden = false;
});
// Another tab changed progress.
addEventListener('storage', (e) => {
  if (e.key?.startsWith('uitb:')) refreshProgress();
});
refreshProgress();

// Chapter overview: open or close, and keep the current page in view.
const navToggles = document.querySelectorAll<HTMLButtonElement>('[data-nav-toggle]');
const wideNav = matchMedia('(min-width: 1000px)');
const setNav = (open: boolean, remember = false) => {
  root.dataset.nav = open ? 'open' : 'closed';
  navToggles.forEach((b) => b.setAttribute('aria-expanded', String(open)));
  if (remember && wideNav.matches) store('nav', open ? 'open' : 'closed');
};
navToggles.forEach((b) => b.addEventListener('click', () => setNav(root.dataset.nav !== 'open', true)));
document.querySelectorAll('[data-nav-close]').forEach((el) => el.addEventListener('click', () => setNav(false)));
addEventListener('keydown', (e) => {
  if (e.key === 'Escape' && !wideNav.matches && root.dataset.nav === 'open') setNav(false);
});
wideNav.addEventListener('change', () => setNav(wideNav.matches && load('nav') !== 'closed'));
setNav(root.dataset.nav === 'open');

const nav = document.querySelector<HTMLElement>('.shell-nav');
const current = nav?.querySelector<HTMLElement>('[aria-current="page"]');
if (nav && current) {
  const offset = current.getBoundingClientRect().top - nav.getBoundingClientRect().top;
  nav.scrollTop = Math.max(0, nav.scrollTop + offset - nav.clientHeight / 3);
}
