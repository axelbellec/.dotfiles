# Personal tools and utilities

# Zoxide (smart cd)
eval "$(zoxide init zsh)"

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

# LM Studio CLI
export PATH="$PATH:$HOME/.cache/lm-studio/bin"

# Claude CLI
alias claude="$HOME/.claude/local/claude"

# OpenCode
export PATH="$HOME/.opencode/bin:$PATH"

# Utility functions
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

# Greeting
echo "Hey"
