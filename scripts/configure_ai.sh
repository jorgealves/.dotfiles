#!/usr/bin/env bash

set -euo pipefail # Enable strict mode

# source libs
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# shellcheck source=lib/variables.sh
source "$SCRIPT_DIR/../lib/variables.sh"
source "$ROOT_DIR/lib/logs.sh"
source "$ROOT_DIR/lib/utils.sh"

log_header "Managing agent skills 🤖"

ACTION=${1:-install}
SKILLS_DIR="$ROOT_DIR/agents/skills"
VERSIONED_SOURCES="$ROOT_DIR/config/agents/skills"
LOCAL_SOURCES="$ROOT_DIR/config/agents/skills.local"

run_skills() {
  mise exec -- skills "$@"
}

install_source() {
  local source=$1

  case "$source" in
    "$HOME/"*) source="$HOME/${source#\~/}" ;;
  esac

  log_info "Installing skills from $source..."
  run_skills add "$source" \
    --global \
    --agent codex \
    --skill '*' \
    --full-depth \
    --yes
}

install_sources_from_file() {
  local sources_file=$1
  local line

  [[ -f "$sources_file" ]] || return 0

  while IFS= read -r line || [[ -n "$line" ]]; do
    line="${line#"${line%%[![:space:]]*}"}"
    line="${line%"${line##*[![:space:]]}"}"
    [[ -z "$line" || "$line" == \#* ]] && continue
    install_source "$line"
  done <"$sources_file"
}

install_repository_skills() {
  local skill_file

  [[ -d "$SKILLS_DIR" ]] || return 0
  skill_file=$(find "$SKILLS_DIR" -type f -name SKILL.md -print -quit)
  [[ -n "$skill_file" ]] || return 0
  install_source "$SKILLS_DIR"
}

case "$ACTION" in
  install)
    log_info "Installing versioned and machine-local skills..."
    install_repository_skills
    install_sources_from_file "$VERSIONED_SOURCES"
    install_sources_from_file "$LOCAL_SOURCES"
    ;;
  update)
    log_info "Updating remote skills..."
    run_skills update --global --yes
    log_info "Refreshing skills from the current repository checkout..."
    install_repository_skills
    install_sources_from_file "$VERSIONED_SOURCES"
    install_sources_from_file "$LOCAL_SOURCES"
    ;;
  list)
    run_skills list --global
    exit 0
    ;;
  *)
    log_error "Usage: $0 [install|update|list]"
    exit 2
    ;;
esac

log_success "Agent skills command completed 🎉"
