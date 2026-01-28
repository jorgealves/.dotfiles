#!/bin/bash

set -euo pipefail # Enable strict mode

ROOT_DIR=$(pwd)
BREWFILE="$ROOT_DIR/Brewfile"

# source libs
source "$ROOT_DIR/lib/logs.sh"

log_header "Installing Homebrew"

if ! command -v brew &> /dev/null; then
    log_error "Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew update
brew upgrade
brew bundle install -v --file="$BREWFILE" --upgrade --cleanup

log_footer "Homebrew installed successfully 🎉"
