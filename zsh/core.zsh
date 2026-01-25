# Core ZSH configuration
# Oh My Zsh, theme, plugins, and shell options

# ---------------------------------------------------------
# Zsh Options
# ---------------------------------------------------------
setopt AUTO_CD              # cd by typing directory name
setopt CORRECT              # Spell correction for commands
setopt SHARE_HISTORY        # Share history across terminals
setopt HIST_IGNORE_DUPS     # No duplicate history entries
setopt HIST_IGNORE_SPACE    # Commands starting with space aren't saved
setopt HIST_REDUCE_BLANKS   # Remove extra blanks from history
setopt INC_APPEND_HISTORY   # Add commands immediately to history

HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

# ---------------------------------------------------------
# Oh My Zsh
# ---------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

# Disable OMZ theme (using Starship instead)
ZSH_THEME=""

# Plugins
plugins=(
  git              # Git aliases and completions
  aliases          # Alias cheatsheet (acs command)
  sudo             # ESC ESC to prefix with sudo
  extract          # extract any archive format
  copypath         # copypath - copy current directory
  copyfile         # copyfile <file> - copy file contents
  docker           # Docker completions and aliases
  jsontools        # pp_json, is_json, urlencode_json
  fzf              # Fuzzy finder integration (Ctrl+R, Ctrl+T, Alt+C)
)

# Load Oh My Zsh
source "$ZSH/oh-my-zsh.sh"

# ---------------------------------------------------------
# Prompt (Starship)
# ---------------------------------------------------------
eval "$(starship init zsh)"

# ---------------------------------------------------------
# Version Managers
# ---------------------------------------------------------
# ASDF
source /opt/homebrew/opt/asdf/libexec/asdf.sh

# ---------------------------------------------------------
# FZF Configuration
# ---------------------------------------------------------
# Use fd for faster file finding
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

# Preview with bat
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 {}'"

# ---------------------------------------------------------
# Shell Completions
# ---------------------------------------------------------
source <(kubectl completion zsh)
eval "$(uv generate-shell-completion zsh)"

# ---------------------------------------------------------
# Custom History Search (if exists)
# ---------------------------------------------------------
[[ -f "$ZSH/custom/zsh-history-fuzzy-search.zsh" ]] && source "$ZSH/custom/zsh-history-fuzzy-search.zsh"
