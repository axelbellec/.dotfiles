---
description: Create a ticket from description
argument-hint: <ticket-description>
---

Create a ticket in English for: $ARGUMENTS

Rules:

1. **Explore the codebase first** — understand the area affected before writing anything
2. **Find related EPICs** — search existing issues/epics to link the ticket to the right parent
3. **Title** — use semantic commit format: `type(scope): short description`
4. **User story** — one sentence: `As a [who], I want [what], so that [why]`
5. **Context** — 2-3 sentences max. What exists today, what's the problem or gap
6. **Acceptance criteria** — 3-5 checkboxes. Observable behaviors, not implementation details. The dev decides the *how*
7. **Keep it lean** — no implementation notes, no technical spec, no over-specification. If it needs a design doc, say so instead

Use `gh` CLI if the project is on GitHub. Use `glab` CLI if the project is on GitLab.
