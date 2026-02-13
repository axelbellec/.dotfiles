---
description: Compare current code with latest git tag
argument-hint: <tag-name>
---

Compare with tag: $ARGUMENTS (default: latest tag)

Follow this workflow:

1. **Get latest tag** — if no tag specified:
   ```
   git tag -l --sort=-v:refname | head -1
   ```
2. **Show tag info** — display tag date and message:
   ```
   git show <tag> --no-patch --format="Tag: %D%nDate: %ci%nMessage: %s"
   ```
3. **Diff summary** — show files changed:
   ```
   git diff --stat <tag>..HEAD
   ```
4. **Commit log** — show commits since tag:
   ```
   git log <tag>..HEAD --oneline --no-merges
   ```
5. **Semantic analysis** — categorize commits by type:
   - Breaking changes (BREAKING CHANGE)
   - Features (feat:)
   - Fixes (fix:)
   - Other (refactor:, docs:, chore:, etc.)
6. **Suggest bump** — recommend version bump type based on commits

Rules:
- If HEAD is at the tag, indicate no changes
- Handle untagged repos gracefully (show all commits)
- Parse conventional commit format to categorize changes
- Highlight breaking changes prominently
