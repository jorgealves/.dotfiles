#!/bin/bash

set -euo pipefail # Enable strict mode

# source libs
source "$(pwd)/lib/variables.sh"
source "$ROOT_DIR/lib/logs.sh"
source "$ROOT_DIR/lib/utils.sh"

log_header "Installing dotfiles 🗂️"

verify_stow

cd "$ROOT_DIR/config"
if command -v zed &>/dev/null; then
  log_info "Configuring Zed editor 🧑‍💻"
  stow -R -v zed -t "$USER_HOME"
else
  stow -D -v zed -t "$USER_HOME"
  log_info "Zed editor not found, skipping configuration 🧑‍💻"
fi

if command -v code &>/dev/null; then
  log_info "Configuring VS Code editor 🧑‍💻"
  stow -R -v vscode -t "$USER_HOME"
  jq -r '.recommendations[]' "$ROOT_DIR/config/vscode/Library/Application Support/Code/User/extensions.json" | xargs -n 1 code --force --install-extension || true
else
  stow -D -v code -t "$USER_HOME"
  log_info "VS Code editor not found, skipping configuration 🧑‍💻"
fi

if command -v opencode &>/dev/null; then
  log_info "Configuring OpenCode AI 🧑‍💻"
  stow -R -v opencode -t "$USER_HOME"
else
  stow -D -v opencode -t "$USER_HOME"
  log_info "OpenCode AI not found, skipping configuration 🧑‍💻"
fi

if command -v aerospace &>/dev/null; then
  log_info "Configuring Aerospace window manager 🧑‍💻"
  stow -R -v aerospace -t "$USER_HOME"
else
  stow -D -v aerospace -t "$USER_HOME"
  log_info "Aerospace window manager not found, skipping configuration 🧑‍💻"
fi

log_footer "Dotfiles configuration installed successfully 🎉"
