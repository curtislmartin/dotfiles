#!/bin/bash
# Dotfiles installation script
# Creates symlinks for config files

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Dotfiles Installation ==="
echo "From: $DOTFILES_DIR"
echo ""

# Function to create symlink with backup
link_file() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "  Backing up existing $dest to ${dest}.backup"
        mv "$dest" "${dest}.backup"
    elif [ -L "$dest" ]; then
        rm "$dest"
    fi

    ln -s "$src" "$dest"
    echo "  ✓ Linked $dest"
}

# tmux
echo "1. tmux"
link_file "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"

# starship
echo "2. starship"
mkdir -p "$HOME/.config"
link_file "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

# kitty
echo "3. kitty"
mkdir -p "$HOME/.config/kitty"
link_file "$DOTFILES_DIR/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"

# git (optional - has personal info)
echo "4. git"
if [ -f "$DOTFILES_DIR/git/gitconfig" ]; then
    echo "  ⚠ gitconfig contains personal info - review before linking"
    echo "  To link: ln -s $DOTFILES_DIR/git/gitconfig ~/.gitconfig"
fi

echo ""
echo "=== Post-install steps ==="
echo ""
echo "1. Add to your ~/.zshrc:"
echo "   source ~/code/dotfiles/zsh/aliases.zsh"
echo ""
echo "2. Install required tools (if not already installed):"
echo "   brew install eza bat fzf zoxide starship nvim tmux"
echo ""
echo "3. For starship prompt, add to ~/.zshrc:"
echo "   eval \"\$(starship init zsh)\""
echo ""
echo "4. For zoxide, add to ~/.zshrc:"
echo "   eval \"\$(zoxide init zsh)\""
echo ""
echo "Done!"
