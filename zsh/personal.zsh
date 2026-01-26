# Personal tools and utilities

# ---------------------------------------------------------
# Modern CLI Aliases
# ---------------------------------------------------------
# eza (better ls)
alias ls="eza"
alias ll="eza -la --icons --git"
alias la="eza -a"
alias lt="eza --tree --level=2"
alias tree="eza --tree"

# bat (better cat)
alias cat="bat --paging=never"
alias catp="bat"  # with paging

# fd (better find)
alias find="fd"

# Fuzzy shortcuts
alias ff="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias fcd='cd $(fd --type d | fzf --preview "eza --tree --level=2 {}")'
alias fopen='open $(fzf)'

# ---------------------------------------------------------
# Navigation
# ---------------------------------------------------------
# Zoxide (smart cd)
eval "$(zoxide init zsh)"

# Quick navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# ---------------------------------------------------------
# Development Tools
# ---------------------------------------------------------
# Bun (JavaScript runtime)
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# Flutter
export PATH="$PATH:$HOME/flutter/bin"

# Rust/Cargo
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# pipx
export PATH="$PATH:$HOME/.local/bin"

# ---------------------------------------------------------
# AI Tools
# ---------------------------------------------------------
# LM Studio CLI
export PATH="$PATH:$HOME/.cache/lm-studio/bin"

# Claude CLI
alias claude="$HOME/.claude/local/claude"

# OpenCode
export PATH="$HOME/.opencode/bin:$PATH"

# ---------------------------------------------------------
# Utility Functions
# ---------------------------------------------------------
# Load environment variables from a .env file
function export_env() {
  local env_file="${1:-.env}"
  if [[ -f "$env_file" ]]; then
    set -o allexport
    source "$env_file"
    set +o allexport
    echo ".env exported"
  else
    echo "Error: File '$env_file' not found."
    return 1
  fi
}

# Create directory and cd into it
function mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Quick git status
function gs() {
  git status -sb
}
