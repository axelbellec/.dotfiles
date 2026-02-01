---
description: Systematic debugging
argument-hint: <error-or-symptom>
---

Debug this issue: $ARGUMENTS

Follow this process strictly — no guessing:

1. **Reproduce** — understand the exact conditions that trigger the problem
2. **Read the error** — parse the actual error message, stack trace, or symptom. Read the relevant source files before forming any hypothesis
3. **Hypothesize** — form 2-3 possible causes ranked by likelihood
4. **Investigate** — check each hypothesis against the actual code. Read files, check logs, trace the execution path
5. **Fix** — apply the minimal change that addresses the root cause, not the symptom
6. **Verify** — explain why the fix works and what to test to confirm it

Do NOT skip to a fix before reading the relevant code. Do NOT suggest multiple possible fixes — investigate until you find the actual cause.
