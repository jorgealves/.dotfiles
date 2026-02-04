#!/usr/bin/env bash

set -euo pipefail # Enable strict mode

# source libs
source "$(pwd)/lib/variables.sh"
source "$ROOT_DIR/lib/logs.sh"
source "$ROOT_DIR/lib/utils.sh"

log_header "Setting up AI 🤖 Skills"

# Initialize agent_skills submodule if not already done
log_info "Setting up custom skills submodule..."

# Check if submodule is initialized
if [ ! -f "config/agent_skills/.git" ]; then
    log_warning "Initializing agent_skills submodule..."
    git submodule init
    git submodule update --remote --recursive
    log_info "agent_skills submodule initialized."
fi

# Check if Node.js is available for npx skills
if ! command -v node &> /dev/null && command -v npm &> /dev/null; then
    log_warning "Node.js not found - install it via Homebrew to use npx skills integration"
    exit 1
fi

# Test if we can use npx skills
if ! npx --version &> /dev/null; then
    log_warning "npx not available - install npm packages globally to use npx skills integration"
    exit 1
fi

npx skills add jorgealves/agent_skills --global --yes --full-depth --agent opencode --agent github-copilot --agent codex

log_footer  "AI Skills setup completed successfully 🎉"