#!/bin/bash

set -euo pipefail # Enable strict mode
# source libs
source "$(pwd)/lib/variables.sh"
source "$ROOT_DIR/lib/logs.sh"
source "$ROOT_DIR/lib/utils.sh"

BREWFILE="$ROOT_DIR/Brewfile"

log_header "Installing Homebrew"

if ! command -v brew &> /dev/null; then
    log_error "Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew update
brew upgrade
brew bundle install -v --file="$BREWFILE" --upgrade --cleanup

log_footer "Homebrew installed successfully 🎉"
