# glab CLI - Installation & Configuration Guide

## Prerequisites

- macOS with [Homebrew](https://brew.sh/) installed
- A GitLab account with a Personal Access Token (PAT)

## 1. Installation

Install glab via Homebrew:

```bash
brew install glab
```

Verify the installation:

```bash
glab --version
```

## 2. Authentication

### 2.1 Create a Personal Access Token

1. Go to **GitLab > Settings > Access Tokens** (`https://gitlab.com/-/user_settings/personal_access_tokens`)
2. Create a new token with the following **minimum scopes**:
   - `api`
   - `write_repository`
3. Copy the generated token (you won't be able to see it again)

### 2.2 Authenticate the CLI

**Interactive mode** (recommended):

```bash
glab auth login
```

Follow the prompts to select your GitLab instance and paste your token.

**Non-interactive mode**:

```bash
glab auth login --hostname gitlab.com --token glpat-xxxxxxxxxxxxxxxxxxxx
```

Or via stdin:

```bash
echo "glpat-xxxxxxxxxxxxxxxxxxxx" | glab auth login --hostname gitlab.com --stdin
```

### 2.3 Verify authentication

```bash
glab auth status
```

You should see output like:

```
gitlab.com
  ✓ Logged in to gitlab.com as your_username
  ✓ Git operations for gitlab.com configured to use https protocol.
  ✓ Token found: **************************
```

## 3. Basic Usage

### Issues

| Command | Description |
|---------|-------------|
| `glab issue list` | List issues in the current project |
| `glab issue list --assignee=@me --per-page=20` | List issues assigned to you |
| `glab issue list --author=@me --per-page=20` | List issues you created |
| `glab issue view <number>` | View details of a specific issue |

### Merge Requests

| Command | Description |
|---------|-------------|
| `glab mr list` | List merge requests |
| `glab mr list --author=@me --per-page=20` | List MRs you created |
| `glab mr list --assignee=@me --per-page=20` | List MRs assigned to you |
| `glab mr list --reviewer=@me --per-page=20` | List MRs where you're a reviewer |
| `glab mr create --fill --assignee @me` | Create MR with auto-filled title/description, assigned to you |
| `glab mr checkout <id>` | Checkout an MR branch locally |

### Activity & Recent Work

| Command | Description |
|---------|-------------|
| `glab issue list --assignee=@me --sort updated_at` | Your issues, most recently updated first |
| `glab mr list --author=@me --sort updated_at` | Your MRs, most recently updated first |
| `glab ci list --per-page=10` | Last 10 pipelines for the current project |
| `glab ci list --scope running` | Currently running pipelines |
| `glab api projects/:id/events --per-page=20` | Raw project activity feed (pushes, comments, MRs, etc.) |
| `glab api '/events?action=pushed' --per-page=10` | Your recent push events across all projects |

### CI/CD

| Command | Description |
|---------|-------------|
| `glab ci status` | View CI/CD pipeline status for current branch |
| `glab ci status --branch <name>` | View CI/CD pipeline status for a specific branch |
| `glab ci list` | List recent pipelines |
| `glab ci list --scope running` | List running pipelines |
| `glab ci trace <job-id>` | Stream a job's log output in real time |
| `glab ci view` | Interactive view of the current pipeline |

### Epics (via API)

Epics are group-level resources with no built-in glab command. Use `glab api` instead.

| Command | Description |
|---------|-------------|
| `glab api groups/:group/epics --per-page=20` | List epics in the current group |
| `glab api 'groups/:group/epics?state=opened'` | List open epics only |
| `glab api 'groups/:group/epics?search=<query>'` | Search epics by title/description |
| `glab api groups/:group/epics/<epic-id>` | View a specific epic |
| `glab api groups/:group/epics/<epic-id>/issues` | List issues linked to an epic |
| `glab api groups/:group/epics/<epic-id>/notes` | List comments on an epic |

> **Note**: `:group` is auto-resolved by glab to the group of the current repo. For other groups, use the URL-encoded full path (e.g., `my-org%2Fmy-subgroup`).

### Repository

| Command | Description |
|---------|-------------|
| `glab repo clone <project>` | Clone a GitLab repository |

## 4. Configuration

Configuration is stored in `~/.config/glab-cli/config.yml`.

Set your preferred editor:

```bash
glab config set editor zed
```

Set default protocol to SSH (instead of HTTPS):

```bash
glab config set git_protocol ssh --host gitlab.com
```

## 5. Troubleshooting

| Problem | Solution |
|---------|----------|
| `not a git repository` error | Run the command inside a cloned GitLab repo, or use `glab api` for global queries |
| Token expired or revoked | Re-authenticate with `glab auth login` |
| Wrong GitLab instance | Check `glab auth status` and re-login with `--hostname` |
