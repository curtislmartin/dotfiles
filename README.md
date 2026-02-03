# Dotfiles

Personal dotfiles for Curtis Martin.

## Quick Start (new machine)

```bash
# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Clone this repo
git clone https://github.com/curtislmartin/dotfiles.git ~/code/dotfiles

# 3. Install dependencies
cd ~/code/dotfiles
brew bundle

# 4. Run install script
./install.sh

# 5. Add to ~/.zshrc (create if doesn't exist)
cat >> ~/.zshrc << 'EOF'
# Dotfiles
source ~/code/dotfiles/zsh/aliases.zsh

# Prompt & navigation
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
EOF

# 6. Restart shell
exec zsh
```

## What's Included

| Config | Location | Description |
|--------|----------|-------------|
| `tmux/tmux.conf` | `~/.tmux.conf` | tmux with vim-style navigation, mouse support |
| `starship/starship.toml` | `~/.config/starship.toml` | Minimal cyan prompt with git status |
| `kitty/kitty.conf` | `~/.config/kitty/kitty.conf` | Kitty terminal with CaskaydiaMono font |
| `zsh/aliases.zsh` | sourced in zshrc | Git, eza, navigation aliases |
| `git/gitconfig` | `~/.gitconfig` | Git config (has personal info - review first) |

## Key Aliases

### Git
```bash
g       # git
gs      # git status
ga.     # git add .
gcm     # git commit -m
gcam    # git commit -a -m
gp      # git push
gpl     # git pull
gco     # git checkout
gcob    # git checkout -b
gl      # git log --oneline -10
```

### Navigation
```bash
..      # cd ..
...     # cd ../..
cd      # smart cd with zoxide fallback
```

### Listing (eza)
```bash
ls      # eza with icons
la      # all files
ll      # long format
lt      # tree view
```

### Tools
```bash
n       # nvim (opens current dir if no args)
d       # docker
r       # rails
ff      # fzf with bat preview
```

## Updating

After making changes:
```bash
cd ~/code/dotfiles
git add -A && git commit -m "Update configs" && git push
```

## Dependencies

See `Brewfile` for full list. Key tools:
- **eza** - modern ls replacement
- **bat** - modern cat with syntax highlighting
- **fzf** - fuzzy finder
- **zoxide** - smart cd that learns your habits
- **starship** - cross-shell prompt
- **neovim** - text editor
- **tmux** - terminal multiplexer
