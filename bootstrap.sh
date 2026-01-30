#!/bin/bash

set -euo pipefail # Enable strict mode

ROOT_DIR=$(pwd)

# source libs
source "$ROOT_DIR/lib/logs.sh"
clear
log_header "Bootstraping your DevEnv on Macos 🍎"

"$ROOT_DIR/install/brew.sh"
"$ROOT_DIR/install/shell.sh"
"$ROOT_DIR/install/git.sh"
"$ROOT_DIR/install/dotfiles.sh"
"$ROOT_DIR/install/python.sh"
"$ROOT_DIR/install/skills.sh"

log_success "DevEnv bootstrapped successfully 🎉"