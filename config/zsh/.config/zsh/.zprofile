# How you should use this file
# This file is sourced by zsh when you login
# It is intended to be used for setting up:
# - Homebrew shell environment
# - Environment Variables
# - PATH setup


#homebrew
eval $(/opt/homebrew/bin/brew shellenv)


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

# Start system ssh-agent
unset SSH_AUTH_SOCK

# Verify if Bitwarden Desktop is installed and add ssh agent
if mdfind -name "Bitwarden.app" -count 1 &> /dev/null; then
  export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"
  eval "$(ssh-agent -s)" > /dev/null
else
  eval "$(ssh-agent -s)" > /dev/null
  # assuming you have your ssh keys in ~/.ssh, add them to the agent
  ssh-add $HOME/.ssh/github &> /dev/null
  ssh-add $HOME/.ssh/signing &> /dev/null
fi
