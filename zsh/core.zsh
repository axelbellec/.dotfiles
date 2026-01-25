# Core ZSH configuration
# Oh My Zsh, theme, plugins, and shell options

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git aliases)

# Load Oh My Zsh
source "$ZSH/oh-my-zsh.sh"

# ASDF version manager
source /opt/homebrew/opt/asdf/libexec/asdf.sh

# ZSH history fuzzy search with FZF
[[ -f "$ZSH/custom/zsh-history-fuzzy-search.zsh" ]] && source "$ZSH/custom/zsh-history-fuzzy-search.zsh"

# Shell completions
source <(kubectl completion zsh)
eval "$(uv generate-shell-completion zsh)"

# Common aliases
alias ohmyzsh="mate ~/.oh-my-zsh"
