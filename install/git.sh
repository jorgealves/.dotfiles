#!/bin/bash

set -euo pipefail # Enable strict mode

ROOT_DIR=$(pwd)

# source libs
source "$ROOT_DIR/lib/logs.sh"
source "$ROOT_DIR/lib/utils.sh"
source "$ROOT_DIR/lib/variables.sh"

log_header "Installing Git 🪾"

if ! command -v git &> /dev/null; then
    log_error "Git is not installed. Please install Git before running this script."
    exit 1
fi

if ! command -v bw &> /dev/null; then
    log_error "Bitwarden CLI is not installed. Please install Bitwarden CLI before running this script."
    exit 1
fi

if [ -z "${SSH_AUTH_SOCK:-}" ]; then
    log_warning "SSH agent is not running. Please start the SSH agent before running this script."
    log_warning "Ensure that Bitwarden SSH Agent is enabled"
    exit 1
fi


if ! bw status | grep -q '"status":"unlocked"'; then
    log_info "Bitwarden is not unlocked. Unlocking Bitwarden..."
    export BW_SESSION=$(bw unlock --raw)
fi

log_info "Bitwarden is unlocked 🔓"

verify_stow

cd "$ROOT_DIR/config"
stow -R -v git -t "$USER_HOME"

log_info "Git configuration installed 🪾"
