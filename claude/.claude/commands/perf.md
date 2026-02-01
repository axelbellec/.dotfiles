---
description: Performance analysis
argument-hint: <code-or-results>
---

Analyze performance for: $ARGUMENTS

Follow measure-first discipline:

1. **Measure** — identify what to measure and establish a baseline. Read the actual code or benchmark results before theorizing
2. **Profile** — find where time/memory/resources are actually spent. Focus on the hot path, not edge cases
3. **Root cause** — explain why the bottleneck exists. Reference specific code paths
4. **Optimize** — propose the minimal change with the highest impact. Avoid micro-optimizations that sacrifice readability
5. **Verify** — explain how to measure the improvement and what result to expect

Do NOT suggest optimizations without first identifying the actual bottleneck. "Make it work, make it right, make it fast" — in that order.
