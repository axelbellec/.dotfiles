---
description: Create a semantic commit
argument-hint: <context>
---

Create a commit for the current staged changes. Additional context: $ARGUMENTS

Rules:

1. **Read the diff first** — run `git diff --staged` to understand exactly what changed
2. **Semantic commit message** — use conventional commits format: `type(scope): subject`
   - Types: `feat`, `fix`, `refactor`, `docs`, `test`, `chore`, `perf`, `ci`, `build`, `style`
   - Scope: the module, component, or area affected (optional but preferred)
   - Subject: imperative, lowercase, no period, under 72 chars
3. **Use a commit body** — don't cram everything into the subject line. Add a blank line after the subject, then explain *what* changed and *why* in the body. Wrap at 72 chars.
4. **One commit = one logical change** — if the diff contains unrelated changes, warn me instead of lumping them together
5. **Never amend** — always create a new commit
6. **Never push** — only commit locally

Use the `-m` flag twice to separate title and body:
```
git commit -m "type(scope): short summary" -m "What changed and why, in a few concise lines.
Mention anything non-obvious about the approach."
```
