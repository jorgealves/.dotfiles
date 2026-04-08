#!/bin/bash

set -euo pipefail # Enable strict mode

# source libs
source "$(pwd)/lib/variables.sh"
source "$ROOT_DIR/lib/logs.sh"
source "$ROOT_DIR/lib/utils.sh"

log_header "Installing Shell Configuration 🎮"

verify_stow

cd "$ROOT_DIR/config"
if command -v zsh &>/dev/null; then
  log_info "Configuring Zsh shell 🐚"
  stow -R -v zsh -t "$USER_HOME"
fi

if command -v starship &>/dev/null; then
  log_info "Configuring Starship prompt 🚀"
  stow -R -v starship -t "$USER_HOME"
fi

log_footer "Shell configuration installed successfully 🎉"
