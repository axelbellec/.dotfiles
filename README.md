# Dotfiles

My personal dotfiles for macOS.

## Structure

```
~/.dotfiles/
├── Brewfile               # Homebrew dependencies
├── git/
│   ├── .gitconfig         # Git configuration
│   └── .gitignore_global  # Global gitignore
├── secrets/               # GITIGNORED - local only
│   └── tokens.zsh         # API tokens and passwords
├── shell/
│   └── .zprofile          # Login shell (Homebrew)
├── starship/
│   └── starship.toml      # Prompt configuration
├── claude/
│   └── .claude/
│       ├── commands/          # Custom slash commands (x- = extended)
│       │   ├── x-advise.md      # /x-advise - Trade-off analysis
│       │   ├── x-architect.md   # /x-architect - System design
│       │   ├── x-commit.md      # /x-commit - Semantic commit
│       │   ├── x-communicate.md # /x-communicate - Stakeholder comms
│       │   ├── x-debug.md       # /x-debug - Systematic debugging
│       │   ├── x-doc.md         # /x-doc - Documentation generation
│       │   ├── x-implement.md   # /x-implement - KISS implementation
│       │   ├── x-perf.md        # /x-perf - Performance analysis
│       │   ├── x-refactor.md    # /x-refactor - Code refactoring
│       │   ├── x-release-notes.md # /x-release-notes - French release notes
│       │   ├── x-review.md      # /x-review - Code review
│       │   └── x-ticket.md      # /x-ticket - Ticket creation
│       ├── settings.json      # Claude Code settings
│       └── statusline-command.sh # Custom status bar
├── zsh/
│   ├── .zshrc             # Entry point
│   ├── core.zsh           # Oh-my-zsh, plugins, FZF, Starship
│   ├── work.zsh           # Work tools (Go, k8s, SOPS)
│   └── personal.zsh       # Personal tools, aliases, functions
└── install.sh             # Symlink installer
```

## Prerequisites

### 1. Install Homebrew (if not already installed)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install dependencies via Brewfile

```bash
cd ~/.dotfiles
brew bundle install
```

This will install all tools defined in the `Brewfile`:
- **Core**: git, asdf, starship, fzf, fd, bat, eza, ripgrep, zoxide
- **Dev tools**: uv, gh, jq, yq, httpie, go-task, tmux, git-lfs
- **Work tools**: kubectl, kubectx, k9s, helm, sops, docker, mysql-client, gnu-sed
- **GUI apps**: Bruno, DB Browser for SQLite, KeePassXC, ngrok

**Optional commands:**
```bash
brew bundle install --no-upgrade   # Skip upgrading existing packages
brew bundle cleanup                 # Remove packages not in Brewfile
brew bundle dump --force            # Update Brewfile with current packages
```

## Installation

```bash
# Clone
git clone https://github.com/axelbellec/.dotfiles.git ~/.dotfiles

# Create secrets file (not in repo)
mkdir -p ~/.dotfiles/secrets
touch ~/.dotfiles/secrets/tokens.zsh
# Add your secrets to tokens.zsh

# Install symlinks (includes Claude Code config via stow)
~/.dotfiles/install.sh

# Restart terminal
```

## Claude Code

Claude Code configuration is managed as a stow package. This symlinks `~/.claude/` to the dotfiles repo, keeping commands, settings, and the status bar version-controlled.

### Install with stow

```bash
cd ~/.dotfiles
stow claude
```

This creates `~/.claude/` → `~/.dotfiles/claude/.claude/` symlinks for:
- `commands/` — custom slash commands (`/x-implement`, `/x-architect`, `/x-debug`, etc.)
- `settings.json` — editor settings (always-think, plugins, status line)
- `statusline-command.sh` — context-aware status bar

### Custom slash commands

All custom commands use the `x-` prefix (for **extended**) to distinguish them from built-in commands.

| Command | Description |
|---------|-------------|
| `/x-commit <context>` | Semantic commit with body |
| `/x-implement <what>` | KISS feature implementation |
| `/x-architect <system>` | Architecture & system design with mermaid diagrams |
| `/x-debug <error>` | Systematic debugging (reproduce → investigate → fix) |
| `/x-doc <file>` | Developer-focused documentation |
| `/x-release-notes <base>..<target>` | French release notes for product owners |
| `/x-advise <decision>` | Technical trade-off analysis |
| `/x-perf <code>` | Performance analysis (measure-first) |
| `/x-refactor <code>` | Refactor code following KISS principles |
| `/x-review` | Code review for security, performance, style |
| `/x-communicate <topic>` | Pedagogical communication for stakeholders |
| `/x-ticket <description>` | Create a detailed ticket |

### Adding a new command

1. Create `claude/.claude/commands/x-my-command.md` (use the `x-` prefix)
2. Add YAML frontmatter with `description` and optional `argument-hint`
3. Use `$ARGUMENTS` to reference user input
4. Commit and push — stow keeps the symlink live

## Git Multi-Identity Setup

This configuration automatically uses different Git identities based on repository location:

- **Personal repos (GitHub)**: `abellec.22+github@gmail.com` (default)
- **Work repos (Synapse/GitLab)**: `axel@synapse-medicine.com` (for `~/synapse/**`)

The correct email is automatically selected when you commit - no manual configuration needed!

**Verify it works:**
```bash
# In personal repos (should show GitHub email)
cd ~/.dotfiles
git config user.email

# In work repos (should show Synapse email)  
cd ~/synapse/app
git config user.email
```

## Features

### Keybindings

| Keybinding | Action |
|------------|--------|
| `Ctrl+R` | Fuzzy search command history |
| `Ctrl+T` | Fuzzy find files |
| `Alt+C` | Fuzzy cd into directories |
| `ESC ESC` | Prefix command with sudo |

### Aliases

| Alias | Command |
|-------|---------|
| `ls`, `ll`, `la` | eza with icons and git status |
| `tree`, `lt` | eza tree view |
| `cat` | bat with syntax highlighting |
| `find` | fd (faster find) |
| `ff` | fzf with bat preview |
| `fcd` | fuzzy cd |
| `z <dir>` | zoxide smart cd |
| `k` | kubectl |
| `kx` | kubectx |

### Functions

| Function | Description |
|----------|-------------|
| `export_env [file]` | Load .env file |
| `mkcd <dir>` | Create and cd into directory |
| `gs` | Quick git status |

### Oh-My-Zsh Plugins

`git`, `aliases`, `sudo`, `extract`, `copypath`, `copyfile`, `docker`, `jsontools`, `fzf`

## Adding New Configuration

### New environment variable

1. **Secret/token?** → Add to `secrets/tokens.zsh` (never committed)
2. **Work-related?** → Add to `zsh/work.zsh`
3. **Personal tool?** → Add to `zsh/personal.zsh`
4. **Core shell setting?** → Add to `zsh/core.zsh`

### New alias or function

Same logic as above - add to the appropriate module file.

### New tool configuration (e.g., neovim)

1. Create directory: `mkdir -p ~/.dotfiles/toolname/`
2. Add config files mirroring the home directory structure (e.g., `toolname/.config/nvim/init.lua`)
3. Install with stow: `cd ~/.dotfiles && stow toolname`
4. Commit and push

> **Note:** Stow creates symlinks by mirroring the package directory structure into the target (`~`).
> For example, `stow claude` links `claude/.claude/` → `~/.claude/`.

### New Claude Code slash command

1. Create `claude/.claude/commands/x-my-command.md` (use the `x-` prefix)
2. The command is immediately available as `/x-my-command` (stow symlink is live)
3. Commit and push

## Secrets Setup

Create `~/.dotfiles/secrets/tokens.zsh` with your tokens:

```bash
# Example structure
export HF_TOKEN="your-huggingface-token"
export GITLAB_TOKEN="your-gitlab-token"
# ... etc
```

This file is gitignored and must be created manually on each machine.
