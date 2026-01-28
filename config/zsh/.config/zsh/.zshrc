# This file is sourced by zsh after .zshenv and .zprofile
# You should is this file for:
# - zsh options
# - key bindings
# - zsh plugins
# - Aliases and functions
# - any prompt configurations

# ===== Performance Profiling (optional) =====
# Uncomment to measure startup time
# zmodload zsh/zprof

# ===== History Configuration =====
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# History options
setopt SHARE_HISTORY              # Share history between sessions
setopt HIST_IGNORE_DUPS          # Don't record duplicate entries
setopt HIST_IGNORE_ALL_DUPS      # Delete old duplicates
setopt HIST_IGNORE_SPACE         # Don't record entries starting with space
setopt HIST_FIND_NO_DUPS         # Don't display duplicates when searching
setopt HIST_SAVE_NO_DUPS         # Don't save duplicates
setopt HIST_REDUCE_BLANKS        # Remove extra blanks
setopt APPEND_HISTORY            # Append to history file
setopt INC_APPEND_HISTORY        # Write to history immediately

# ===== Completion System =====
autoload -Uz compinit

# Performance optimization: only check once a day
# (speeds up shell startup)
compinit -C
# if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  # compinit
# else
  # compinit -C
# fi

# Completion options
zstyle ':completion:*' menu select                          # Interactive menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"    # Colored completion
zstyle ':completion:*' group-name ''                        # Group completions
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'

# Speed up completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# ===== Directory Navigation =====
setopt AUTO_CD               # Type directory name to cd
setopt AUTO_PUSHD           # Make cd push old directory onto stack
setopt PUSHD_IGNORE_DUPS    # Don't push duplicates
setopt PUSHD_MINUS          # Exchange meaning of + and -

# ===== Plugins (from Homebrew) =====

# Zsh Autosuggestions (Fish-like suggestions)
if [ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
fi

# Zsh Syntax Highlighting (must be loaded last)
if [ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ===== Development Tools Integration =====

# Direnv - Load directory-specific environments
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# uv - Python package manager completions
if command -v uv &> /dev/null; then
  eval "$(uv generate-shell-completion zsh)"
fi

# fzf - Fuzzy finder
if command -v fzf &> /dev/null; then
  eval "$(fzf --zsh)"
fi

# zoxide - Modern cd replacement
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi


# ===== Aliases =====

# General
# File management with eza
alias l='eza'
alias ll='eza -lA -F always --icons=always -s type'
alias la='ll'
alias tree='l --tree'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Git shortcuts
alias g='git'
alias gs='git status'
alias gp='git pull'
alias gfa='git fetch --all --prune --verbose'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias gla='git log --oneline --graph --decorate --all'

# Python/uv shortcuts
alias py='uv run python'
alias pytest='uv run pytest'
alias uvr='uv run'
alias uvsync='uv sync'
alias uvlock='uv lock'

# AWS shortcuts
alias aws-whoami='aws sts get-caller-identity'
alias aws-login='aws sso login'

# Kubernetes shortcuts (if using Rancher Desktop)
alias k='kubectl'

# Modern CLI tool alternatives
if command -v bat &> /dev/null; then
  alias cat='bat'
fi

if command -v rg &> /dev/null; then
  alias grep='rg'
fi

if command -v fd &> /dev/null; then
  alias find='fd'
fi

# ===== Functions =====

# Create directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Quick Git commit with message
gcm() {
  git commit -m "$*"
}

# Quick Git add, commit, and push
gacp() {
  git add .
  git commit -m "$*"
  git push
}

# Extract various archive types
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"    ;;
      *.tar.gz)    tar xzf "$1"    ;;
      *.bz2)       bunzip2 "$1"    ;;
      *.rar)       unrar x "$1"    ;;
      *.gz)        gunzip "$1"     ;;
      *.tar)       tar xf "$1"     ;;
      *.tbz2)      tar xjf "$1"    ;;
      *.tgz)       tar xzf "$1"    ;;
      *.zip)       unzip "$1"      ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1"       ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Find process by name
findproc() {
  ps aux | grep -i "$1" | grep -v grep
}

# Python virtual environment info
venv-info() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo "Virtual environment: $VIRTUAL_ENV"
    python --version
    which python
  else
    echo "No virtual environment active"
  fi
}

# ===== Machine-specific Configuration =====
# Load local configuration if it exists (not tracked in git)
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi


# Starship prompt (must be at end)
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# ===== Performance Profiling Output =====
# Uncomment if you enabled zprof at the top
# zprof