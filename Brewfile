# Homebrew Dependencies for .dotfiles
# Install with: brew bundle install
# Update lock: brew bundle dump --force
# Cleanup: brew bundle cleanup

# =============================================================================
# Core Dependencies (Mandatory)
# =============================================================================
# These are required for the dotfiles to work properly

# Version control
brew "git"

# Version manager (for Node, Python, Go, etc.)
brew "asdf"

# Shell utilities
brew "starship"          # Prompt
brew "fzf"              # Fuzzy finder (Ctrl+R, Ctrl+T, Alt+C)
brew "zoxide"           # Smart cd

# Modern CLI replacements (aliased in zsh configs)
brew "fd"               # Better find
brew "bat"              # Better cat with syntax highlighting
brew "eza"              # Better ls with icons
brew "ripgrep"          # Better grep

# =============================================================================
# Development Tools (Recommended)
# =============================================================================
# General-purpose development utilities

brew "uv"               # Python package manager
brew "gh"               # GitHub CLI
brew "jq"               # JSON processor
brew "yq"               # YAML processor
brew "httpie"           # HTTP client
brew "go-task"          # Task runner (Taskfile.yml)
brew "wget"             # File downloader
brew "tree"             # Directory tree viewer
brew "tmux"             # Terminal multiplexer
brew "git-lfs"          # Git Large File Storage

# =============================================================================
# Work-Specific Tools (Optional)
# =============================================================================
# Kubernetes, cloud, and work environment tools

# Kubernetes
brew "kubectl"          # Kubernetes CLI
brew "kubectx"          # Switch between kubectl contexts
brew "k9s"              # Terminal UI for Kubernetes
brew "helm"             # Kubernetes package manager

# DevOps & Security
brew "sops"             # Secrets management
brew "docker"           # Container runtime
brew "docker-completion" # Docker CLI completion

# Database
brew "mysql-client"     # MySQL CLI tools

# GNU tools (macOS compatibility)
brew "gnu-sed"          # GNU sed (replaces macOS sed)

# =============================================================================
# GUI Applications (Casks)
# =============================================================================

cask "bruno"                    # API client
cask "db-browser-for-sqlite"    # SQLite database browser
cask "keepassxc"                # Password manager
cask "ngrok"                    # Secure tunneling
