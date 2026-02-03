# Dotfiles aliases - source from ~/.zshrc
# Add to your .zshrc: source ~/code/dotfiles/zsh/aliases.zsh

# Editor
export EDITOR="nvim"
export VISUAL="nvim"

# eza (modern ls replacement)
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='eza -alh --group-directories-first --icons=auto'
alias la='eza -a --icons --group-directories-first --git'
alias ll='eza -lh --icons --group-directories-first --git'
alias lla='eza -alh --icons --group-directories-first --git'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='eza --tree --level=2 --long --icons --git -a'

# fzf with bat preview
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

# Smart cd with zoxide
alias cd="zd"
zd() {
  if [ $# -eq 0 ]; then
    builtin cd ~ && return
  elif [ -d "$1" ]; then
    builtin cd "$1"
  else
    z "$@" && printf "\U000F17A9 " && pwd || echo "Error: Directory not found"
  fi
}

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Tools
alias d='docker'
alias r='rails'
n() { if [ "$#" -eq 0 ]; then nvim .; else nvim "$@"; fi; }

# Git
alias g='git'
alias gp='git push'
alias gpl='git pull'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias ga.='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gb='git branch'
alias gl='git log --oneline -10'
alias glo='git log --oneline --graph --all'

# Clasp (Google Apps Script)
alias clpl='clasp login'
alias clp='clasp push'
alias clpw='clasp push -f --watch'
