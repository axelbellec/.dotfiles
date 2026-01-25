# Dotfiles

My personal dotfiles for macOS.

## Structure

```
~/.dotfiles/
├── git/
│   ├── .gitconfig         # Git configuration
│   └── .gitignore_global  # Global gitignore
├── secrets/               # GITIGNORED - local only
│   └── tokens.zsh         # API tokens and passwords
├── shell/
│   └── .zprofile          # Login shell (Homebrew)
├── zsh/
│   ├── .zshrc             # Entry point
│   ├── core.zsh           # Oh-my-zsh, ASDF, completions
│   ├── work.zsh           # Work tools (Go, k8s, SOPS)
│   └── personal.zsh       # Personal tools (bun, zoxide, etc.)
└── install.sh             # Symlink installer
```

## Installation

```bash
# Clone
git clone https://github.com/axelbellec/.dotfiles.git ~/.dotfiles

# Create secrets file (not in repo)
mkdir -p ~/.dotfiles/secrets
touch ~/.dotfiles/secrets/tokens.zsh
# Add your secrets to tokens.zsh

# Install symlinks
~/.dotfiles/install.sh

# Restart terminal
```

## Adding New Configuration

### New environment variable

1. **Secret/token?** → Add to `secrets/tokens.zsh` (never committed)
2. **Work-related?** → Add to `zsh/work.zsh`
3. **Personal tool?** → Add to `zsh/personal.zsh`
4. **Core shell setting?** → Add to `zsh/core.zsh`

### New alias or function

Same logic as above - add to the appropriate module file.

### New tool configuration (e.g., starship, neovim)

1. Create directory: `mkdir ~/.dotfiles/toolname/`
2. Add config file(s)
3. Update `install.sh` to create symlink
4. Commit and push

## Secrets Setup

Create `~/.dotfiles/secrets/tokens.zsh` with your tokens:

```bash
# Example structure
export HF_TOKEN="your-huggingface-token"
export GITLAB_TOKEN="your-gitlab-token"
# ... etc
```

This file is gitignored and must be created manually on each machine.
