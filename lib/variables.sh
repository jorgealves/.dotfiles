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

export USER_HOME="$HOME"
CURRENT_DIR=$(pwd)
export ROOT_DIR="$CURRENT_DIR"

log_info "💼 Variables loaded."
