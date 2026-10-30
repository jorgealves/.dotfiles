#!/bin/bash

# Bootstrap and upgrade script for the development environment on macOS
# - Verify Homebrew and install mise when necessary
# - Apply mise bootstrap and update managed tools

set -euo pipefail # Enable strict mode

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

source "$ROOT_DIR/lib/logs.sh"
clear
log_header "Bootstraping your DevEnv on Macos 🍎"

if ! command -v brew &>/dev/null; then
  log_error "Homebrew is not installed. Please install Homebrew first."
  exit 1
fi

if ! command -v mise &>/dev/null; then
  log_warning "mise-en-place is not installed. Installing ..."
  brew install mise
fi

log_info "Here's the overall plan for mise bootstrap 📝 ..."
mise bootstrap plan
log_info "Refreshing mise bootstrap plan... 🔄"
mise bootstrap --update --force-dotfiles --prompt-secrets
log_info "Upgrading mise bootstrap packages... 📦"
mise bootstrap packages upgrade -y
log_info "Mise bootstrap completed. 👍"
log_info "Update runtime tools... 🔧"
mise upgrade

log_info "Cleaning up unused packages... 🧹"
mise prune
mise bootstrap packages prune

log_info "Updating AI skills... 🤖"
bash "$ROOT_DIR/scripts/configure_ai.sh" update
log_success "DevEnv bootstrapped successfully 🎉"
