# How you should use this file
# This file is sourced by zsh when you login
# It is intended to be used for setting up:
# - Homebrew shell environment
# - Environment Variables
# - PATH setup


#homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# Keep PATH entries unique (dedupes any repeated dirs added by brew/mise/etc.)
typeset -U path PATH

# mise-en-place
eval "$(mise activate zsh)"


# ===== Environment Variables =====

# Preferred editor
export EDITOR='vim'
export VISUAL='vim'

# Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Less options (better paging)
export LESS='-R -F -X'

# Node.js
export NODE_OPTIONS="--max-old-space-size=4096"

# Python
export PYTHONDONTWRITEBYTECODE=1  # Don't create .pyc files

# UV configuration
export UV_PYTHON_PREFERENCE=only-managed  # Use uv-managed Python versions

# ===== PATH Configuration =====
# Add local bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Add custom scripts if you have them
export PATH="$HOME/bin:$PATH"

# add rust cargo bin to PATH
export PATH="$HOME/.cargo/bin:$PATH"

# ===== SSH Agent Setup =====
# Source local SSH key configuration (not tracked in version control)
[ -f "$HOME/.config/zsh/.zprofile.local" ] && source "$HOME/.config/zsh/.zprofile.local"

# Robust SSH agent logic
# Prefer Bitwarden SSH Agent when it's actually running (socket exists), otherwise
# fall back to the system ssh-agent and load keys from ~/.ssh (via SSH_KEYS_TO_ADD)

BITWARDEN_SSH_SOCK="$HOME/.bitwarden-ssh-agent.sock"

if [ -S "$BITWARDEN_SSH_SOCK" ]; then
  export SSH_AUTH_SOCK="$BITWARDEN_SSH_SOCK"
else
  # Only start ssh-agent if not already running / reachable (exit code 2 = can't connect)
  if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
  else
    ssh-add -l &> /dev/null
    [ $? -eq 2 ] && eval "$(ssh-agent -s)" > /dev/null
  fi
  # Only add keys if not already present (keys defined in .zprofile.local)
  for key in "${SSH_KEYS_TO_ADD[@]}"; do
    if [ -f "$key" ] && ! ssh-add -l | grep -q "$(ssh-keygen -lf "$key" | awk '{print $2}')"; then
      ssh-add --apple-use-keychain "$key" &> /dev/null
    fi
  done
fi

unset BITWARDEN_SSH_SOCK
