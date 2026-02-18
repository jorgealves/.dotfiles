#!/usr/bin/env bash

set -euo pipefail # Enable strict mode

# source libs
source "$(pwd)/lib/variables.sh"
source "$ROOT_DIR/lib/logs.sh"
source "$ROOT_DIR/lib/utils.sh"

log_header "Setting up AI 🤖"

# Initialize agent_skills submodule if not already done
log_info "Setting up custom skills..."

# Check if Node.js is available for npx skills
if ! command -v node &>/dev/null || ! command -v npm &>/dev/null; then
  log_error "Node.js and npm are required for npx skills integration"
  exit 1
fi

# Test if we can use npx skills
if ! npx --version &>/dev/null; then
  log_error "npx is not available - install npm to use npx skills integration"
  exit 1
fi

# Check npm skills package availability locally first
if ! npm list --global skills --depth=0 &>/dev/null; then
  log_info "npm skills package not found globally - installing..."
  npm install -g skills
fi

npx skills add jorgealves/agent_skills --global --yes --full-depth --agent opencode --agent github-copilot --agent codex

log_info "Custom skills setup completed successfully 🎉"

log_footer "AI Skills setup completed successfully 🎉"
