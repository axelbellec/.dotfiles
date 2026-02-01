---
description: Refactor code following KISS principles
argument-hint: <what-to-refactor>
---

Refactor: $ARGUMENTS

Follow these principles:

1. **Read first** — understand the current implementation, its callers, and its tests before changing anything
2. **Name the smell** — identify the specific problem (duplication, bad naming, wrong abstraction, tight coupling, dead code, etc.)
3. **Propose the change** — explain what you'll do and why in 3-5 bullet points. Wait for approval before proceeding
4. **KISS** — simplify, don't shift complexity. Fewer abstractions beat different abstractions. Three similar lines beat a premature helper
5. **Preserve behavior** — refactoring changes structure, not behavior. Run existing tests to verify. If no tests exist, flag it
6. **One concern at a time** — don't mix refactoring with feature changes or bug fixes. Keep the diff reviewable
