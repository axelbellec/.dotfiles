# ZSH Login Shell Configuration
# Runs once at login (before .zshrc)

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# pipx (ensure available for login shells)
export PATH="$PATH:$HOME/.local/bin"
