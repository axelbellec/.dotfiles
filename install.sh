#!/bin/bash
# Dotfiles installation script
# Creates symlinks from home directory to dotfiles

set -e

DOTFILES="$HOME/.dotfiles"

echo "Installing dotfiles..."

# Check for Homebrew and Brewfile
if ! command -v brew &> /dev/null; then
    echo ""
    echo "⚠️  Warning: Homebrew is not installed!"
    echo "Install it from: https://brew.sh"
    echo ""
elif [[ -f "$DOTFILES/Brewfile" ]]; then
    echo ""
    echo "📦 Brewfile found! Install dependencies with:"
    echo "   cd ~/.dotfiles && brew bundle install"
    echo ""
fi

# Backup existing files if they're not symlinks
backup_if_exists() {
    local file="$1"
    if [[ -f "$file" && ! -L "$file" ]]; then
        echo "Backing up $file to ${file}.backup"
        mv "$file" "${file}.backup"
    elif [[ -L "$file" ]]; then
        echo "Removing existing symlink $file"
        rm "$file"
    fi
}

# Create symlink
create_symlink() {
    local source="$1"
    local target="$2"
    backup_if_exists "$target"
    echo "Linking $target -> $source"
    ln -s "$source" "$target"
}

# ZSH
create_symlink "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES/shell/.zprofile" "$HOME/.zprofile"

# Git
create_symlink "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES/git/.gitconfig-work" "$HOME/.gitconfig-work"

# Starship
mkdir -p "$HOME/.config"
create_symlink "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"

# Claude Code (via stow)
if command -v stow &> /dev/null; then
    echo "Installing Claude Code config via stow..."
    stow -d "$DOTFILES" -t "$HOME" claude
else
    echo ""
    echo "⚠️  Warning: stow is not installed, skipping Claude Code config"
    echo "   Install it with: brew install stow"
fi

echo ""
echo "Done! Restart your terminal or run: source ~/.zshrc"
echo ""
echo "Note: Your old config files have been backed up with .backup extension"
