#!/bin/bash
# Dotfiles installation script
# Creates symlinks from home directory to dotfiles

set -e

DOTFILES="$HOME/.dotfiles"

echo "Installing dotfiles..."

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

echo ""
echo "Done! Restart your terminal or run: source ~/.zshrc"
echo ""
echo "Note: Your old config files have been backed up with .backup extension"
