# ZSH Configuration Entry Point
# Modular dotfiles setup

DOTFILES="$HOME/.dotfiles"

# Load secrets first (gitignored)
[[ -f "$DOTFILES/secrets/tokens.zsh" ]] && source "$DOTFILES/secrets/tokens.zsh"

# Load configuration modules
source "$DOTFILES/zsh/core.zsh"
source "$DOTFILES/zsh/work.zsh"
source "$DOTFILES/zsh/personal.zsh"
