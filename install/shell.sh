#!/bin/bash

set -euo pipefail # Enable strict mode

ROOT_DIR=$(pwd)

# source libs
source "$ROOT_DIR/lib/logs.sh"
source "$ROOT_DIR/lib/utils.sh"
source "$ROOT_DIR/lib/variables.sh"

log_header "Installing Shell Configuration 🎮"

verify_stow

cd "$ROOT_DIR/config"
stow -R -v zsh -t "$USER_HOME"
stow -R -v starship -t "$USER_HOME"

log_footer "Shell configuration installed successfully 🎉"
