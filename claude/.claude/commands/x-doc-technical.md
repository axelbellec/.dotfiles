---
description: Generate technical documentation with diagrams
argument-hint: <component-or-system>
---

Document technical system: $ARGUMENTS

Write technical documentation for a developer/architect audience:

1. **Explore first** — read the code, existing docs, configuration, and related components
2. **Determine scope** — understand what needs documenting:
   - Architecture (system design, component interactions)
   - Data flow (how information moves through the system)
   - State management (how state changes over time)
   - Integration points (external APIs, databases, services)
3. **Structure the doc** — use this template:
   ```markdown
   # [Component/System Name]

   ## Overview
   Brief description (2-3 sentences)

   ## Architecture
   High-level design with diagram

   ## Components
   Key components and their responsibilities

   ## Data Flow
   How data moves through the system (with sequence diagram if complex)

   ## State Management
   How state is managed (with state diagram if applicable)

   ## Configuration
   Environment variables, config files, feature flags

   ## Dependencies
   External services, databases, APIs

   ## Trade-offs & Decisions
   Key architectural decisions and why

   ## Troubleshooting
   Common issues and how to debug
   ```
4. **Add Mermaid diagrams** — use appropriate diagram types:
   - `graph TD` for architecture/component diagrams
   - `sequenceDiagram` for data flow/interactions
   - `stateDiagram-v2` for state transitions
   - `erDiagram` for data models
5. **Write in English** — technical docs should be in English
6. **Save to docs/** — create or update files in the `docs/` directory

Rules:
- Focus on "why" and "how it works", not "how to use it"
- Include diagrams for any non-trivial interactions
- Keep it accurate over comprehensive
- Link to related documentation or code
- Mention known limitations or future improvements
