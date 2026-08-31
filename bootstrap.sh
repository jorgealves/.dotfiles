#!/bin/bash

set -euo pipefail # Enable strict mode

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# source libs
source "$ROOT_DIR/lib/logs.sh"
clear
log_header "Bootstraping your DevEnv on Macos 🍎"

"$ROOT_DIR/install/brew.sh"
mise bootstrap plan
mise bootstrap dotfiles status
mise bootstrap --update --force-dotfiles
# "$ROOT_DIR/install/ai.sh"

log_success "DevEnv bootstrapped successfully 🎉"
