#!/bin/bash

set -euo pipefail # Enable strict mode

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# shellcheck source=lib/logs.sh
source "$SCRIPT_DIR/logs.sh"

#enforce file to be source and not executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "This script should be sourced, not executed directly."
  exit 1
fi

verify_stow() {
  if ! command -v stow &>/dev/null; then
    log_error "stow is not installed. Please install stow before running this script."
    exit 1
  fi
}
