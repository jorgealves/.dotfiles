#!/bin/bash

set -euo pipefail # Enable strict mode

ROOT_DIR=$(pwd)

# source libs
source "$ROOT_DIR/lib/logs.sh"
source "$ROOT_DIR/lib/utils.sh"

log_header "Installing Shell Configuration 🎮"

verify_stow

cd "$ROOT_DIR/config"
stow -R -v zsh -t "$HOME"
stow -R -v starship -t "$HOME"

log_footer "Shell configuration installed successfully 🎉"
