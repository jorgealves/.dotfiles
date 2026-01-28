#!/bin/bash

set -euo pipefail # Enable strict mode

ROOT_DIR=$(pwd)

# source libs
source "$ROOT_DIR/lib/logs.sh"
source "$ROOT_DIR/lib/utils.sh"
source "$ROOT_DIR/lib/variables.sh"

log_header "Installing dotfiles 🗂️"

verify_stow

cd "$ROOT_DIR/config"
stow -R -v zed -t "$USER_HOME"

log_footer "Dotfiles configuration installed successfully 🎉"
