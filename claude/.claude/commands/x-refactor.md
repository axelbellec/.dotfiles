---
description: Refactor code following KISS principles
argument-hint: <what-to-refactor>
---

Refactor: $ARGUMENTS

Follow these principles:

1. **Read first** — understand the current implementation, its callers, and its tests before changing anything
2. **Name the smell** — identify the specific problem (duplication, bad naming, wrong abstraction, tight coupling, dead code, etc.)
3. **Propose the change** — explain what you'll do and why in 3-5 bullet points. Wait for approval before proceeding
4. **KISS (Keep It Simple)** — we're a startup, not Google. Apply ruthlessly:
   - Simplify, don't shift complexity
   - Fewer abstractions beat different abstractions
   - Three similar lines beat a premature helper
   - Delete over refactor when possible
   - Question every layer of indirection
   - Choose boring, proven solutions over clever ones
5. **Preserve behavior** — refactoring changes structure, not behavior. Run existing tests to verify. If no tests exist, flag it
6. **One concern at a time** — don't mix refactoring with feature changes or bug fixes. Keep the diff reviewable

Startup mindset:
- We have limited human and financial resources
- Optimize for readability and maintainability over theoretical "best practices"
- If you can't explain why an abstraction saves time/money, remove it
- Avoid over-engineering for hypothetical future requirements
