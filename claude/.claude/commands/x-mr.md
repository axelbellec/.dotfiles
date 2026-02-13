---
description: Create branch, commit, push, and open MR/PR
argument-hint: <issue-number> <short-description>
---

Create MR/PR for: $ARGUMENTS

Follow this workflow:

1. **Check if on main** — ensure you're on the main/master/develop branch before creating a new branch
2. **Fetch latest** — `git fetch origin` to get latest remote state
3. **Parse issue** — if issue number provided, fetch issue details with `glab issue view <number>` or `gh issue view <number>`
4. **Create branch** — use semantic naming:
   - GitLab: `<issue-number>-<short-kebab-description>`
   - GitHub: `<username>/<issue-number>-<short-kebab-description>` or `<issue-number>-<short-kebab-description>`
5. **Make changes** — if changes already staged, commit them. Otherwise, ask what needs to be done
6. **Commit** — use semantic commit format (defer to `/x-commit` if complex)
7. **Push** — `git push -u origin <branch-name>`
8. **Create MR/PR** — use the CLI:
   - GitLab: `glab mr create --fill --assignee @me`
   - GitHub: `gh pr create --fill --assignee @me`
9. **Return URL** — show the MR/PR URL for quick access

Rules:
- NEVER force push to main/master/develop
- Use `glab` for GitLab, `gh` for GitHub (check `.git/config` to determine)
- If issue already has an MR, warn before creating a duplicate
- Link the MR/PR to the issue automatically using keywords like "Closes #123"
