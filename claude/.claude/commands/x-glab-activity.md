---
description: List recent issues and MRs for current user
argument-hint: <days-back>
---

Fetch GitLab activity for last: $ARGUMENTS days (default: 7)

Follow this workflow:

1. **Determine time window** — default to last 7 days if not specified
2. **List recent issues** — fetch issues where you're involved:
   ```
   glab issue list --author=@me --per-page=20
   glab issue list --assignee=@me --per-page=20
   ```
3. **List recent MRs** — fetch your merge requests:
   ```
   glab mr list --author=@me --per-page=20
   glab mr list --assignee=@me --per-page=20
   glab mr list --reviewer=@me --per-page=20
   ```
4. **Filter by date** — keep only items within the time window
5. **Summarize by status**:
   - Issues: Open / In Progress / Closed
   - MRs: Open / Merged / Closed
6. **Format output** — create a clean table:
   ```
   Issues (Last 7 days)
   #123  [Open]     feat(api): add new endpoint
   #122  [Closed]   fix(db): migration issue

   Merge Requests (Last 7 days)
   !45   [Merged]   feat(api): add new endpoint
   !44   [Open]     fix(auth): token refresh
   ```

Rules:
- Deduplicate items (you might be both author and assignee)
- Sort by updated_at descending (most recent first)
- Include issue/MR titles and URLs
- Show total counts per status
- If working across multiple repos, specify `--repo` or scan all accessible repos
