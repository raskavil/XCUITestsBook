// Turns GitHub-style alerts into styled callouts:
//   > [!NOTE] / [!TIP] / [!IMPORTANT] / [!WARNING]
const LABELS = { NOTE: 'Note', TIP: 'Tip', IMPORTANT: 'Important', WARNING: 'Pitfall' };

export default function remarkCallouts() {
  return (tree) => walk(tree);
}

function walk(node) {
  if (node.type === 'blockquote') transform(node);
  if (Array.isArray(node.children)) node.children.forEach(walk);
}

function transform(node) {
  const first = node.children?.[0];
  const text = first?.type === 'paragraph' ? first.children?.[0] : null;
  if (!text || text.type !== 'text') return;
  const m = text.value.match(/^\[!(NOTE|TIP|IMPORTANT|WARNING)\]\s*/);
  if (!m) return;
  text.value = text.value.slice(m[0].length);
  node.data = {
    ...(node.data ?? {}),
    hName: 'aside',
    hProperties: { className: ['callout', `callout-${m[1].toLowerCase()}`] },
  };
  first.children.unshift({
    type: 'strong',
    data: { hProperties: { className: ['callout-label'] } },
    children: [{ type: 'text', value: LABELS[m[1]] }],
  });
}
