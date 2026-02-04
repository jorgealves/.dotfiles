#!/bin/bash

set -euo pipefail # Enable strict mode

# source libs
source "$(pwd)/lib/variables.sh"
source "$ROOT_DIR/lib/logs.sh"
source "$ROOT_DIR/lib/utils.sh"

log_header "Installing dotfiles 🗂️"

verify_stow

cd "$ROOT_DIR/config"
stow -R -v zed -t "$USER_HOME"
stow -R -v opencode -t "$USER_HOME"

log_footer "Dotfiles configuration installed successfully 🎉"
