---
description: French release notes for product owners
argument-hint: <base>..<target>
---

Generate release notes for: $ARGUMENTS

Process:

1. Run `git log --oneline --no-merges $ARGUMENTS` to get the list of commits
2. Read the relevant changes to understand what each commit does
3. Group changes by theme (new features, improvements, bug fixes)
4. Write release notes **in French**, targeting **product owners** (non-technical audience)

Format:

- Use clear, non-technical French
- Group by: "Nouvelles fonctionnalités", "Améliorations", "Corrections de bugs"
- Each item: one sentence explaining the user-facing impact, not the technical change
- Skip purely technical changes (refactors, dependency bumps, CI changes) unless they have user-visible impact
- Include the version range as a header
