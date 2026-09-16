#!/bin/bash

# Bootstrap script for setting up the development environment on macOS
# - First it verifies that Homebrew is installed
# - Then it updates and upgrades Homebrew
# - Install mise-en-place
# - Sets up dotfiles and other configurations using mise

set -euo pipefail # Enable strict mode

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

source "$ROOT_DIR/lib/logs.sh"
clear
log_header "Bootstraping your DevEnv on Macos 🍎"

if ! command -v brew &>/dev/null; then
  log_error "Homebrew is not installed. Please install Homebrew first."
  exit 1
fi

brew update
brew upgrade

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
# "$ROOT_DIR/install/ai.sh"

log_success "DevEnv bootstrapped successfully 🎉"
